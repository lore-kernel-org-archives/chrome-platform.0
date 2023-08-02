Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD864C8F2
	for <chrome-platform@lists.linux.dev>; Wed,  2 Aug 2023 16:04:25 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-40a47e8e38dso217631cf.1
        for <chrome-platform@lists.linux.dev>; Wed, 02 Aug 2023 09:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690992264; x=1691597064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cRcpbFEEMAyjFE1IJhKt1a1pqQ0HzmuzmGSSusTIGw=;
        b=mlI3GCs3G0w0NIWiby3Aq7fifgC+BVnn77kvk2apoGLCcKntGS5+Bql2huS1sfkizp
         CFzluqtTlHI0ADNFP5wkIqLtdVSKB98+LDHcAZqoupWXiCF9wEq+e1/Rz5o8+8acW/Lx
         4+uetoMqX6m+vmtsHGX/7NZRRf1CkWCdZ4LADHVHKZxNSWglyHqmK43H4fWjfgFzmllN
         AmCW9EMtzcyPh8wViXoidRtspoaVJl0UI3saeY2ZXQH9+o23qu8ZDXIwJ4jauF7N+IBe
         k9/eaqCQOGm2aurCwtNk1DukFs2BzN6FP8yxwtfduY64kst7Un2XdsUIDONgZrL/K6LO
         3IHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690992264; x=1691597064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0cRcpbFEEMAyjFE1IJhKt1a1pqQ0HzmuzmGSSusTIGw=;
        b=liRx7h6KoDS30NELWhwNAgnM/mpf6xULk8qcJg5TkjsvqYc5SbmuZYsOM3vw8NURH9
         RtUKEQr7Uiy4bpMFZOY+veWm+3Qny+DjI5CU1Rah9baseUnwnPfL0dLZrh6OoqJeDhMR
         cSJXtfnkUG985oalnG76LLOYqSafWzMWjeksiOwNq3/kAwdw9r6vWzic/Hr0qTFzXDHy
         dmSYvAsbwfv+y+dwJAIu+bNRe6dLbbRRfwLSWMQpj0ZhaJDk8COELmEHhUBhv/9EdWli
         CnM2D/Hob1KkgFoBd9w//jNrZjGpUZRYjhYscj7gdu5pUDAyQMyVWkS+vmmg7zix7Qr4
         IdaA==
X-Gm-Message-State: ABy/qLZWtAmrh02pMvamRu798VhTjsA/oILUghGPI53kAeQ1H5Whf1iJ
	oin2dO8slo/C3twF0n93ynExqMD+V8YBHYmnRrjQHOax1gCKX4EkLtM=
X-Google-Smtp-Source: APBJJlHNgij2DFiN8NN2jfUU5l3hgGFXsqbJRbHdZD/E/nmQWFOLAoZbgnjKD9hxl90NcUidALY/4/CrquW5PQQlpGI=
X-Received: by 2002:a05:622a:1aa2:b0:405:3a65:b3d6 with SMTP id
 s34-20020a05622a1aa200b004053a65b3d6mr971143qtc.13.1690992264351; Wed, 02 Aug
 2023 09:04:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230802095736.3079963-1-tzungbi@kernel.org>
In-Reply-To: <20230802095736.3079963-1-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 2 Aug 2023 09:04:10 -0700
Message-ID: <CABXOdTdV-UnTCWnq_fD6bvJ3c0gX1jvx5ZbkV3qOHjtk5+HWOA@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: chromeos_acpi: print hex string for ACPI_TYPE_BUFFER
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev, 
	guillaume.tucker@collabora.com, denys.f@collabora.com, 
	ricardo.canuelo@collabora.com, usama.anjum@collabora.com, 
	briannorris@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 2, 2023 at 2:58=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> w=
rote:
>
> `element->buffer.pointer` should be binary blob.  `%s` doesn't work
> perfect for them.
>
> Print hex string for ACPI_TYPE_BUFFER.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> Changes from v1[1]:
> - Use hex_dump_to_buffer().
> - Rewrite the loop for catching edge cases for truncating.
>
> [1]: https://patchwork.kernel.org/project/chrome-platform/patch/202307260=
73127.2969387-1-tzungbi@kernel.org/
>
>  drivers/platform/chrome/chromeos_acpi.c | 31 ++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/chrome/chromeos_acpi.c b/drivers/platform/c=
hrome/chromeos_acpi.c
> index 50d8a4d4352d..761506d307ad 100644
> --- a/drivers/platform/chrome/chromeos_acpi.c
> +++ b/drivers/platform/chrome/chromeos_acpi.c
> @@ -90,7 +90,36 @@ static int chromeos_acpi_handle_package(struct device =
*dev, union acpi_object *o
>         case ACPI_TYPE_STRING:
>                 return sysfs_emit(buf, "%s\n", element->string.pointer);
>         case ACPI_TYPE_BUFFER:
> -               return sysfs_emit(buf, "%s\n", element->buffer.pointer);
> +               {
> +                       int i, r, at, room_left;
> +                       const int byte_per_line =3D 16;
> +
> +                       at =3D 0;
> +                       room_left =3D PAGE_SIZE - 1;
> +                       for (i =3D 0; i < element->buffer.length && room_=
left; i +=3D byte_per_line) {
> +                               r =3D hex_dump_to_buffer(element->buffer.=
pointer + i,
> +                                                      element->buffer.le=
ngth - i,
> +                                                      byte_per_line, 1, =
buf + at, room_left,
> +                                                      false);
> +                               if (r > room_left)
> +                                       goto truncating;
> +                               at +=3D r;
> +                               room_left -=3D r;
> +
> +                               r =3D sysfs_emit_at(buf, at, "\n");
> +                               if (!r)
> +                                       goto truncating;
> +                               at +=3D r;
> +                               room_left -=3D r;
> +                       }
> +
> +                       buf[at] =3D 0;
> +                       return at;
> +truncating:
> +                       dev_info(dev, "truncating sysfs content for %s\n"=
, name);

I really dislike that because it will, if it happens, clog the log
(the condition will be permanent). How about using dev_info_once() ?

Thanks,
Guenter

> +                       sysfs_emit_at(buf, PAGE_SIZE - 4, "..\n");
> +                       return PAGE_SIZE - 1;
> +               }
>         default:
>                 dev_err(dev, "element type %d not supported\n", element->=
type);
>                 return -EINVAL;
> --
> 2.41.0.585.gd2178a4bd4-goog
>
