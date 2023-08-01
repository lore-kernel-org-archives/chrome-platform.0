Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89C47E
	for <chrome-platform@lists.linux.dev>; Tue,  1 Aug 2023 03:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F45C433C7;
	Tue,  1 Aug 2023 03:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690860763;
	bh=1Filcpg68e0l7eo7BuRs1iCn+OZp92+POzTEBpJtVLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G8GIBlT60twzCGzkyPQq1DkR6a6T2T8ASiny5LwllDNYxtc8JaGmwUyzHXFEnXlPL
	 0QYX56mmW0s+ahC9/ZtEHBWLwdxwESgmqH0jZFs0QZr+QRm+AgYgSJ0FxLrSEP/OD1
	 Eaw98WUDtw4dBK98/NOuy/D0fZWYhZPj2/BIz4GlU/oOQBOa4u+QSLRrhQY6+2FOqA
	 Q60RTNsEkMYYi727/g0nT2521BG5jSDNK5/xFkBbMLQnjWEShJ0z7gYyaFeqSnvKdM
	 qOwy1rqZnk5KC2Co5JuxDMOzYM4rH9VpN7Oy3SNY7NDskI0viIj9tmGGhTGHsZusNz
	 1UElr6BjCMeMw==
Date: Tue, 1 Aug 2023 11:32:40 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, guillaume.tucker@collabora.com,
	denys.f@collabora.com, ricardo.canuelo@collabora.com,
	usama.anjum@collabora.com
Subject: Re: [PATCH] platform/chrome: chromeos_acpi: print hex string for
 ACPI_TYPE_BUFFER
Message-ID: <ZMh82LaanrHh+33t@google.com>
References: <20230726073127.2969387-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726073127.2969387-1-tzungbi@kernel.org>

On Wed, Jul 26, 2023 at 03:31:27PM +0800, Tzung-Bi Shih wrote:
> `element->buffer.pointer` should be binary blob.  `%s` doesn't work perfect
> for them.
> 
> Print hex string for ACPI_TYPE_BUFFER.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Curious about does this patch make sense to folks on the mailing list?

> ---
>  drivers/platform/chrome/chromeos_acpi.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/chrome/chromeos_acpi.c b/drivers/platform/chrome/chromeos_acpi.c
> index 50d8a4d4352d..a60d344c54e4 100644
> --- a/drivers/platform/chrome/chromeos_acpi.c
> +++ b/drivers/platform/chrome/chromeos_acpi.c
> @@ -90,7 +90,25 @@ static int chromeos_acpi_handle_package(struct device *dev, union acpi_object *o
>  	case ACPI_TYPE_STRING:
>  		return sysfs_emit(buf, "%s\n", element->string.pointer);
>  	case ACPI_TYPE_BUFFER:
> -		return sysfs_emit(buf, "%s\n", element->buffer.pointer);
> +		{
> +			int i, n;
> +			const int char_per_line = 16;
> +
> +			for (i = 0, n = 0; i < element->buffer.length; ++i) {
> +				n += sysfs_emit_at(buf, n, " %2.2x", element->buffer.pointer[i]);
> +
> +				if (((i + 1) % char_per_line) == 0)
> +					n += sysfs_emit_at(buf, n, "\n");
> +			}
> +			n += sysfs_emit_at(buf, n, "\n");
> +
> +			if (n == PAGE_SIZE - 1) {
> +				dev_info(dev, "truncating sysfs content for %s\n", name);
> +				sysfs_emit_at(buf, n - 3, "..\n");
> +			}
> +
> +			return n;
> +		}
>  	default:
>  		dev_err(dev, "element type %d not supported\n", element->type);
>  		return -EINVAL;
> -- 
> 2.41.0.487.g6d72f3e995-goog
> 
