Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC444A00
	for <chrome-platform@lists.linux.dev>; Wed, 13 Jul 2022 18:26:02 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id g1so15169678edb.12
        for <chrome-platform@lists.linux.dev>; Wed, 13 Jul 2022 11:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6E/hA4MyH1jo4zKVeY77z+U8Ko/RGXbnbI2vCOCv4aM=;
        b=kVEsE8P6B37JNnIPhEAO+o4fp2kcRu+KbAmwyo1FUVOlC8YgSJpIizLMx3fNkwV0N6
         2V8z/66b+oU+UFYGOaA7yZlxzYgOsLDo8FCtAEf5DQc4OSKciJhayVEWDX5MZwDRgLjH
         IdZEAdJn9ZWpvYwkQjuYK/h3P0+oujngLkuEp2S8Oy9t4t5kMSdAzG9m2RAQNv90Zv20
         C/qT50wZ/qpOPlPDZxVSnscVT3xCn0SjJZEWBK4ZmQ4ajjIXTjW2PyZ1EFUVRqG+csKw
         y/atRGKCBglR7N/t0tuuJlt1Vu98Q0No59ISpmWq7wMJrmZ7FlKJd6JwPWol+nfVAw/j
         JE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6E/hA4MyH1jo4zKVeY77z+U8Ko/RGXbnbI2vCOCv4aM=;
        b=5pDbYSEfRpAf1UR3nbSca2/wBsRpkXKVolrDM7RRTDSNftJNJ/rd0TWbk4Low/FLcI
         +MFBw8hfIjXaI1I363KSrC79Ld/Ar2htL15u+Z6L/MlwR/sFON4CdaY+SJI9FsshfveE
         xveWyySQe0VszMCiz6+8+UFqfgOs0i/6JoB+Ic2NqdN6j4nxc+BNdr/FSQ5fYVPBRKne
         7YOLr7lSZtUaOuen+BBe8rugdBhDXz59zuSV2zyFnNbX8dpfZjXd3pOCOrtqXfuXoOWN
         FJqFjx+HLa9uADXV08Gq1KOxwIisbpKid2FPiqmCWX59aqz1+iGALC6CvTdy4LAAFw+D
         HHCQ==
X-Gm-Message-State: AJIora98Z8+IL121IYzudDKtTB1wt1V4VKiee62hd7aG6lrTmVdrodmG
	ZBAxbgHCTgKUMv9QzG/UuLFmMlxAwj9TVQsKTW88d7Mg5k4=
X-Google-Smtp-Source: AGRyM1tSACFNWUDNHletif+Y+sKlH7qNHpGCdNBV+K/6dOgFwy1BPUa/JcjPA1ErKpT/S8qeXbn0xB/Kd3XgxiZZiDg=
X-Received: by 2002:aa7:d389:0:b0:43a:56c0:c863 with SMTP id
 x9-20020aa7d389000000b0043a56c0c863mr6609524edq.373.1657736760905; Wed, 13
 Jul 2022 11:26:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220628024913.1755292-1-tzungbi@kernel.org> <20220628024913.1755292-12-tzungbi@kernel.org>
In-Reply-To: <20220628024913.1755292-12-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 13 Jul 2022 11:25:49 -0700
Message-ID: <CABXOdTe+M909H8J2QcAY2_OF1jw=4d9EXb6oerWHNdqjFndPfA@mail.gmail.com>
Subject: Re: [RESEND PATCH 11/11] platform/chrome: cros_ec_proto: return
 -EPROTO if empty payload
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 27, 2022 at 7:49 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> cros_ec_wait_until_complete() sends EC_CMD_GET_COMMS_STATUS which expects
> to receive sizeof(struct ec_response_get_comms_status) from
> cros_ec_xfer_command().
>
> Return -EPROTO if cros_ec_xfer_command() returns 0.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_proto.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 5323edddb540..0c7042aa2640 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -166,6 +166,11 @@ static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev, uint32_t *
>                         break;
>                 }
>
> +               if (ret == 0) {
> +                       ret = -EPROTO;
> +                       break;
> +               }
> +
>                 if (!(status->flags & EC_COMMS_STATUS_PROCESSING))
>                         break;
>         }
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>
