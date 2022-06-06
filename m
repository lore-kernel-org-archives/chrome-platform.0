Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4214328E6
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 15:55:27 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id s12so22601731ejx.3
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jun 2022 08:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OyTbKzsjMWwUwZL5SRg35VIyuSrvd4hrhHdZpr2aEOY=;
        b=HsN12eaSchfRAga+qrLk/zwMDjiloHPOIo6tuhJQY/CZwhGJzq00ySOnbBVrq4SeQg
         lZIjFoT51lIlA0y/Fc+X/b7883LNAAm87aDcZFKQHK2qFVo6cm9iqc6yrjIA/suhhB85
         KgMbqKUo+cHvvhldTv8YohG9sCt/OilC6hL0xnr2yA1y8aP+z0q6qW35v2O6ApvKgXRb
         8Ee4EsJmhEd9kT+Mbba3IOds0L5VUbhsdbSbyfQ/nbe26uGpGB2eEv385NkEMguy/kUf
         o9Ru9uuSRyZxRsxxWznhiIZvSE69Z8jpIXmvw3fAvtqgV1ZaSI1Fs+KWLrdcpaJwZojL
         9QLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OyTbKzsjMWwUwZL5SRg35VIyuSrvd4hrhHdZpr2aEOY=;
        b=yRJy8tmWgx/ZkloKfXp2JtDUBtj+ZgYk6XZlJmHLC4GiNl59cDgYWuRJbIESgiB515
         SyLB4Hfl6TKBkUPIxjJMMbvUsYD/5ZtyF+58Uc4wfzir3/HqRWJGOEpMjmECWQRJrSyV
         J17Dy5rKH1vM1LXGGojvCPEIx3gRpX4wOltFjkdqeFerYat55jJKZYNcsT7UmNHtjuSW
         AWkzfRZGxOpLAQCWY7bFN0tb8bL84iF87guuR1iwV/LHiKUF0dMtEhc6AnBzT3AEzhi7
         JfCIUINAI8dMy4Q9Tgz8r/4E7wCqHgZBXx7NfZB52SrHwh/YOGXF9iKMJJXXPwy9cz0w
         Uk7g==
X-Gm-Message-State: AOAM5316kX6iuiSTmalBJiR9sndJ+fvRQV2eOvEtwM4v+3CSWTK9MP7U
	cm35yQvl3FtraZQ1eP9y23VP47DJfbJI50F2Guz19g==
X-Google-Smtp-Source: ABdhPJz3Mq3IMfcDu/Cuub9xOBDyP5zz4COVAFXlmMtrZ+GAOmJ3s3a7/vHwxn8jk+cf8QeW7HW+CGV4YBCJOc7LkK8=
X-Received: by 2002:a17:907:1ca8:b0:70c:68ce:dade with SMTP id
 nb40-20020a1709071ca800b0070c68cedademr19254581ejc.723.1654530925293; Mon, 06
 Jun 2022 08:55:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220606141051.285823-1-tzungbi@kernel.org> <20220606141051.285823-7-tzungbi@kernel.org>
In-Reply-To: <20220606141051.285823-7-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 6 Jun 2022 08:55:14 -0700
Message-ID: <CABXOdTdhGYhS=qO7M5OQ9GDv7LEUQTzrpEkYwas+VfomxDaUcw@mail.gmail.com>
Subject: Re: [PATCH 06/13] platform/chrome: cros_ec_proto: use cros_ec_map_error()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 6, 2022 at 7:12 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> Use cros_ec_map_error() in cros_ec_get_host_event_wake_mask().
>
> The behavior of cros_ec_get_host_event_wake_mask() slightly changed.  It
> is acceptable because the caller only needs it returns negative integers
> for indicating errors.  Especially, the EC_RES_INVALID_COMMAND still
> maps to -EOPNOTSUPP.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_proto.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 1b851dcd20c9..71ba6a56ad7c 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -247,7 +247,7 @@ static int cros_ec_get_host_event_wake_mask(struct cros_ec_device *ec_dev,
>                                             uint32_t *mask)
>  {
>         struct ec_response_host_event_mask *r;
> -       int ret;
> +       int ret, mapped;
>
>         msg->command = EC_CMD_HOST_EVENT_GET_WAKE_MASK;
>         msg->version = 0;
> @@ -256,10 +256,9 @@ static int cros_ec_get_host_event_wake_mask(struct cros_ec_device *ec_dev,
>
>         ret = send_command(ec_dev, msg);
>         if (ret >= 0) {
> -               if (msg->result == EC_RES_INVALID_COMMAND)
> -                       return -EOPNOTSUPP;
> -               if (msg->result != EC_RES_SUCCESS)
> -                       return -EPROTO;
> +               mapped = cros_ec_map_error(msg->result);
> +               if (mapped)
> +                       return mapped;
>         }
>         if (ret > 0) {
>                 r = (struct ec_response_host_event_mask *)msg->data;
> --
> 2.36.1.255.ge46751e96f-goog
>
