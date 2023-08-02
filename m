Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBAA79FF
	for <chrome-platform@lists.linux.dev>; Wed,  2 Aug 2023 15:15:46 +0000 (UTC)
Received: from [192.168.170.158] (unknown [116.71.176.82])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B358E660716B;
	Wed,  2 Aug 2023 16:15:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690989339;
	bh=AtK2n9XTKI4UN9lCt6VwzEsu7Ao4BiWyYWhQuuuqvUs=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=chVVFlDRHhNaoBcUyf2uhQMRVmKaU0T7aNxJP0bZpU6hssWuniy674uWbE7ui4A96
	 qIbTuzDXIzPbdTnZVkwGLF/GWwFpG2cnygGLnOnBdxFKwgIOx4iQ9rLbMfHH26s2xL
	 U+qnQu7gqhLkDPoq81BMuoXdRzb3cTLSVxC3A38XBG8bP3zXR/ZU3mhOdiP1IhtonI
	 jHz9ptN5pkM1oolFnDRowqezLrH4Gxtdf0aQBBdyQr8R5zK8JZheQOd/1SqsvQDrqL
	 MMmBpe8mZ1mPf4iXGKHWbQuHBZSXlmQrr50Rl33a9JI4Zc+/uB6O1MOGjblRmxTdmv
	 /BumP25yRJzmg==
Message-ID: <1be7888e-2346-99b1-4c31-f755fcbd054a@collabora.com>
Date: Wed, 2 Aug 2023 20:15:31 +0500
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 chrome-platform@lists.linux.dev, guillaume.tucker@collabora.com,
 denys.f@collabora.com, ricardo.canuelo@collabora.com,
 briannorris@chromium.org
Subject: Re: [PATCH v2] platform/chrome: chromeos_acpi: print hex string for
 ACPI_TYPE_BUFFER
To: Tzung-Bi Shih <tzungbi@kernel.org>, bleung@chromium.org,
 groeck@chromium.org
References: <20230802095736.3079963-1-tzungbi@kernel.org>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <20230802095736.3079963-1-tzungbi@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/2/23 2:57 PM, Tzung-Bi Shih wrote:
> `element->buffer.pointer` should be binary blob.  `%s` doesn't work
> perfect for them.
> 
> Print hex string for ACPI_TYPE_BUFFER.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
Please add fixes tag and CC stable as well (stable@vger.kernel.org) in next
revision.

Fixes: 0a4cad9c11ad ("platform/chrome: Add ChromeOS ACPI device driver")
> ---
> Changes from v1[1]:
> - Use hex_dump_to_buffer().
> - Rewrite the loop for catching edge cases for truncating.
> 
> [1]: https://patchwork.kernel.org/project/chrome-platform/patch/20230726073127.2969387-1-tzungbi@kernel.org/
> 
>  drivers/platform/chrome/chromeos_acpi.c | 31 ++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/chrome/chromeos_acpi.c b/drivers/platform/chrome/chromeos_acpi.c
> index 50d8a4d4352d..761506d307ad 100644
> --- a/drivers/platform/chrome/chromeos_acpi.c
> +++ b/drivers/platform/chrome/chromeos_acpi.c
> @@ -90,7 +90,36 @@ static int chromeos_acpi_handle_package(struct device *dev, union acpi_object *o
>  	case ACPI_TYPE_STRING:
>  		return sysfs_emit(buf, "%s\n", element->string.pointer);
>  	case ACPI_TYPE_BUFFER:
> -		return sysfs_emit(buf, "%s\n", element->buffer.pointer);
> +		{
> +			int i, r, at, room_left;
> +			const int byte_per_line = 16;
> +
> +			at = 0;
> +			room_left = PAGE_SIZE - 1;
> +			for (i = 0; i < element->buffer.length && room_left; i += byte_per_line) {
> +				r = hex_dump_to_buffer(element->buffer.pointer + i,
> +						       element->buffer.length - i,
> +						       byte_per_line, 1, buf + at, room_left,
> +						       false);
> +				if (r > room_left)
> +					goto truncating;
> +				at += r;
> +				room_left -= r;
> +
> +				r = sysfs_emit_at(buf, at, "\n");
> +				if (!r)
> +					goto truncating;
> +				at += r;
> +				room_left -= r;
> +			}
> +
> +			buf[at] = 0;
> +			return at;
> +truncating:
> +			dev_info(dev, "truncating sysfs content for %s\n", name);
> +			sysfs_emit_at(buf, PAGE_SIZE - 4, "..\n");
> +			return PAGE_SIZE - 1;
> +		}
>  	default:
>  		dev_err(dev, "element type %d not supported\n", element->type);
>  		return -EINVAL;

-- 
BR,
Muhammad Usama Anjum
