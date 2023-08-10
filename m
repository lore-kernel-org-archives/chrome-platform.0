Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940A8368
	for <chrome-platform@lists.linux.dev>; Thu, 10 Aug 2023 00:35:54 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1bf08ca187cso297712fac.3
        for <chrome-platform@lists.linux.dev>; Wed, 09 Aug 2023 17:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691627753; x=1692232553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+DZZCJpTdwYB/5kFvSBDHxrnn9iEJeGKZJ4bFgidgvQ=;
        b=kcWAKR8k9U4GU5W6+BYesu+N/aVbOCSoGcj9RQc7px9cukhxyVnWkoQ0n4fBmGF4Ss
         J744W8853wyi/9NAYsgeeOy18Wx1von8SXs0Z7MKOKig7W6OMX8f9j/tUdN1XyNtYNZt
         uJEre3YxBvhxfeVvWnKNZN5xuYE5mE4v/iyV2R8mgzME2fc2uKmEXWnLEe9M/N1z31rQ
         r1ehZr6fZcw2mD+wFui/MaGE8p04PWlpSftuKiFc4Ae1Rpaj8NOY3JoOxn9GiidisZHn
         lU9eS+cCShOBikHF5kUnUj5T4WqAhbcjCG5PhAIC++KbO+UB1S7eztfg+LNrOZ2LqFJO
         56zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691627753; x=1692232553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+DZZCJpTdwYB/5kFvSBDHxrnn9iEJeGKZJ4bFgidgvQ=;
        b=f7n4aWv/IhXGKpqYDa7Fm6yA5X5a9TxbOUcq4WezrFzTXIufbT/4ryE36+95CAblM6
         AM645mSidXmRG+nXb9ATyz15cLly5iPFBCg/Lso8jq7IdcTiWUOTVEGW+xrg8fuu2oVq
         Uutq/vyrVJ36gYVSoWlAtpwJMECBQEV9DlWVoAjgbyelLo89uNHJDF23b1RnyePu82aA
         HecD2KP3NAfzUtGwOvp6vkGKRE3uZSjXMNGmOqoSOvIUoEOOGe/jgayGAP6QBLfxjWlz
         D4GW9bnm1QLhGkVgya+vYfXpOuKZ68XM6+pnJnBwMpwnBnPTzKsyq7ttagiXdaMTHKqS
         Cs1w==
X-Gm-Message-State: AOJu0YyaNKyq+LwYYkhzesVTYMulp+SVc9XKmFKfaIT8mO2MJtiyOeKP
	5GPDkUwgYK7y5wDOawCZREY=
X-Google-Smtp-Source: AGHT+IGdml00Mv7QFnVMiU2udGVlgRVoeCxEP2GIThA/TtM8p5uSn+gt+bk9weyt12NanlzZ+1ltbA==
X-Received: by 2002:a05:6870:8318:b0:1b3:d457:f27a with SMTP id p24-20020a056870831800b001b3d457f27amr1046922oae.50.1691627753061;
        Wed, 09 Aug 2023 17:35:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ei2-20020a05663829a200b0042bb6431487sm64480jab.65.2023.08.09.17.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 17:35:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Aug 2023 17:35:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev, guillaume.tucker@collabora.com,
	denys.f@collabora.com, ricardo.canuelo@collabora.com,
	usama.anjum@collabora.com, briannorris@chromium.org
Subject: Re: [PATCH v3] platform/chrome: chromeos_acpi: print hex string for
 ACPI_TYPE_BUFFER
Message-ID: <d9c2c307-df2b-4278-af14-46f46fbd4d6f@roeck-us.net>
References: <20230803011245.3773756-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230803011245.3773756-1-tzungbi@kernel.org>

On Thu, Aug 03, 2023 at 09:12:45AM +0800, Tzung-Bi Shih wrote:
> `element->buffer.pointer` should be binary blob.  `%s` doesn't work
> perfect for them.
> 
> Print hex string for ACPI_TYPE_BUFFER.  Also update the documentation
> to reflect this.
> 
> Fixes: 0a4cad9c11ad ("platform/chrome: Add ChromeOS ACPI device driver")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes from v2[1]:
> - Use dev_info_once() instead of dev_info().
> - Update documentation.
> - Add Fixes tag.
> 
> Changes from v1[2]:
> - Use hex_dump_to_buffer().
> - Rewrite the loop for catching edge cases for truncating.
> 
> [1]: https://patchwork.kernel.org/project/chrome-platform/patch/20230802095736.3079963-1-tzungbi@kernel.org/
> [2]: https://patchwork.kernel.org/project/chrome-platform/patch/20230726073127.2969387-1-tzungbi@kernel.org/
> 
>  .../ABI/testing/sysfs-driver-chromeos-acpi    |  2 +-
>  drivers/platform/chrome/chromeos_acpi.c       | 31 ++++++++++++++++++-
>  2 files changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-chromeos-acpi b/Documentation/ABI/testing/sysfs-driver-chromeos-acpi
> index c308926e1568..7c8e129fc100 100644
> --- a/Documentation/ABI/testing/sysfs-driver-chromeos-acpi
> +++ b/Documentation/ABI/testing/sysfs-driver-chromeos-acpi
> @@ -134,4 +134,4 @@ KernelVersion:	5.19
>  Description:
>  		Returns the verified boot data block shared between the
>  		firmware verification step and the kernel verification step
> -		(binary).
> +		(hex dump).
> diff --git a/drivers/platform/chrome/chromeos_acpi.c b/drivers/platform/chrome/chromeos_acpi.c
> index 50d8a4d4352d..1312aaaa8750 100644
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
> +			dev_info_once(dev, "truncating sysfs content for %s\n", name);
> +			sysfs_emit_at(buf, PAGE_SIZE - 4, "..\n");
> +			return PAGE_SIZE - 1;
> +		}
>  	default:
>  		dev_err(dev, "element type %d not supported\n", element->type);
>  		return -EINVAL;
