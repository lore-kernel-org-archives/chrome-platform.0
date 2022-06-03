Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0816EDD
	for <chrome-platform@lists.linux.dev>; Fri,  3 Jun 2022 16:44:28 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id fu3so15530446ejc.7
        for <chrome-platform@lists.linux.dev>; Fri, 03 Jun 2022 09:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G8r/Lq2iH7lYUmC0qatILVQgk9vw3F/w16dF324mtWQ=;
        b=aZlpQAhecEI0B2kIC13P6x5Zi7SorObmX+eb4jK0LAIcvjFVxb0rxdh8NWqIqMSb7C
         Cfi4cEWw9aU39jvI2EkYKPTIqnlf8v2wWuanJWLAdi8Qmt7BGJMMLaktaKXmXK68JJRn
         bVI93mA/fdSToI5gpY/F2yumxShwPXRk5yjhc/qrABZmgOCPzaEeZv8FA6SYeLNPf4DU
         VZUBPgyyucalsVPqbohS5zxrscV8lzfGHitArpA+xclaMvrOYh1VW1QzzJRT/r4cwQbh
         +tzPOLZq7bDdKrXfbELBNy688C6F95mG2j6aIbAvBDK7BmdbMaWS790KVvPP6pUOgSAq
         sxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G8r/Lq2iH7lYUmC0qatILVQgk9vw3F/w16dF324mtWQ=;
        b=2Ax/TAXewor5zj7nGrmvTrXwWFLNViPUpOn7wvC+1h7oLXhQBrxzLCLpRzmNE0qjHh
         /9GgnvqhFAK88WHer3NxN3ZPitVbCCdhPWF9TYgAB9fafHo4xmKkxKu4dcfnOOXfdcga
         U8LeMj2CYzv4CWzBJHRFyJce6Fk+xyQpC7JC8z+WmI49gxkKcASnOssura0J3B+px6ky
         xg13rzFTU9st+2YAY6+pHVqjLofUb4vmNLapHVMHwvmJsqzhV94MMkxGmb73IH+LFh+J
         lohJle14OiF5fJiFVi4iBxVYFJ40bsxS4BZty7wNLFTtjfl50IkjLE1gX6k/VqieI0yP
         q0Tw==
X-Gm-Message-State: AOAM532XjZOEboKrA8WvkGpfLbHRaxZ9biiztUb3PiE2XzOHEOW5RTL9
	IndgWb6+41SAEHPkjoUjy71u5WKDu0lUHkzh6/dayg==
X-Google-Smtp-Source: ABdhPJx7yM9xyk1/nxIev8AjizxzrThcBDzqhNNV9o8uXxQGxlx8Dciv8+BIp9+EOrN+IcDkDlsEmboiXQXOBpz+JKg=
X-Received: by 2002:a17:907:8689:b0:6fe:e525:ea9c with SMTP id
 qa9-20020a170907868900b006fee525ea9cmr9489496ejc.720.1654274666765; Fri, 03
 Jun 2022 09:44:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220603131043.38907-1-linmq006@gmail.com>
In-Reply-To: <20220603131043.38907-1-linmq006@gmail.com>
From: Guenter Roeck <groeck@google.com>
Date: Fri, 3 Jun 2022 09:44:15 -0700
Message-ID: <CABXOdTdZNBM=RA_72bL8nua=qajRWD3iKEDi3bai+Aghu1ygJQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: cros_ec_codec: Fix refcount leak in cros_ec_codec_platform_probe
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@google.com>, 
	Guenter Roeck <groeck@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Benson Leung <bleung@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
	chrome-platform@lists.linux.dev, 
	ALSA development <alsa-devel@alsa-project.org>, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 3, 2022 at 6:11 AM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> of_parse_phandle() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: b6bc07d4360d ("ASoC: cros_ec_codec: support WoV")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
> changes in v2:
> - update Fixes tag
> v1 Link: https://lore.kernel.org/r/20220602114529.6303-1-linmq006@gmail.com
> ---
>  sound/soc/codecs/cros_ec_codec.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
> index 8b0a9c788a26..11e7b3f6d410 100644
> --- a/sound/soc/codecs/cros_ec_codec.c
> +++ b/sound/soc/codecs/cros_ec_codec.c
> @@ -995,6 +995,7 @@ static int cros_ec_codec_platform_probe(struct platform_device *pdev)
>                         dev_dbg(dev, "ap_shm_phys_addr=%#llx len=%#x\n",
>                                 priv->ap_shm_phys_addr, priv->ap_shm_len);
>                 }
> +               of_node_put(node);
>         }
>  #endif
>
> --
> 2.25.1
>
