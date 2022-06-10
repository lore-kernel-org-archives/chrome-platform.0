Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1947C
	for <chrome-platform@lists.linux.dev>; Fri, 10 Jun 2022 15:08:32 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id s12so46842816ejx.3
        for <chrome-platform@lists.linux.dev>; Fri, 10 Jun 2022 08:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t05rvtsB/T3sOZN/4oJBFLGvWKQGNZBpJYVRSJjTMno=;
        b=QBgLYzCMOcGXBskoo8CH8F9b+PjZdO6A7JHFiWkk9vy30p0XOTBjcpmq/XxqLyIvpx
         qpV5cwbBvb94yD8E5BwejzUTO6JTtAetpoxI7m60ywdr89eAC3KaNR4R8KBhZrkwysAt
         DwHVXLm/0mquHHk1ccKpFe/nqWnQ+NBIIH0gHmxZlV8BPM1DZ82XW1XR59LoWnVb5dnw
         fhcXXFnMfWQeI9WxTHdSyWFY6D0zKhoYJQKJbtHlMVijEAluyILwi3p7jZRJoy4uqt/A
         OFYbLcWavSBNiT5aIbrBVyMGPNrSl2ovmRkJUcO3HiAFvNQK2Qvq3gxouc4Lw6Dgg3MJ
         MFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t05rvtsB/T3sOZN/4oJBFLGvWKQGNZBpJYVRSJjTMno=;
        b=nvx9m581PSfv5id15Bg+9i25jN6fW5FdsRnwDe1MqQ6AkpILiw4czB8GKNNHU4TIVV
         QHnORCmPwjFuxppCQ4dPLS8IbceuZB/kl/5iIl8Abzk90+Je1xGJ/7heIIFUfqy0CeUY
         aYYAMI18H8h3iSchQQX+Aoy4scGdQufEcde/RyZ62CXUXLJB4TnOrQ5xMTayRuLpJmLI
         jN6D6hGFjUbT20NTdFi9WcSxKmY2B1a7SCEoccmxT0mB0v33iFdPbnOtvpLkBJeMXrvB
         IqAjujAjN5Hh+7pgMfnsmjmvOMe0BhUF3x32zxZn2H6VZoggcevrFzhycQXt/EolvOHy
         qngg==
X-Gm-Message-State: AOAM531zPo7b/T1uPc+CG+BZxSapKJDOo+IOWdU/9AQ8gEGvATwqki3+
	Lz8GjW2U1J54/qfkJyQUkqB3TtUNKt7/blqa0GBEwg==
X-Google-Smtp-Source: ABdhPJyHurq1FK1Va943z8vc88m5ROrIH3Wy0ceSIRu1hWNJ8zRBuVzOLJVlASYN21jD/QmGSSRdGMM2rEtdISLRJOo=
X-Received: by 2002:a17:906:4d50:b0:70d:afd4:1e63 with SMTP id
 b16-20020a1709064d5000b0070dafd41e63mr37489536ejv.618.1654873710284; Fri, 10
 Jun 2022 08:08:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220610133342.3735012-1-ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20220610133342.3735012-1-ajye_huang@compal.corp-partner.google.com>
From: Guenter Roeck <groeck@google.com>
Date: Fri, 10 Jun 2022 08:08:17 -0700
Message-ID: <CABXOdTe8=mADxxPdbLrmvhwn-FJcZvt1aeqP+tK8gq=0foJzNA@mail.gmail.com>
Subject: Re: [PATCH v1] media: platform: cros-ec: Add kinox to the match table
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Zhuohao Lee <zhuohao@chromium.org>, linux-media@vger.kernel.org, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 10, 2022 at 6:34 AM Ajye Huang
<ajye_huang@compal.corp-partner.google.com> wrote:
>
> The Google Kinox device uses the same approach as the Google Brask
> which enables the HDMI CEC via the cros-ec-cec driver.
>
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> index 8c8d8fc5e63e..093aa4fc6692 100644
> --- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> +++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> @@ -217,6 +217,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
>         { "Google", "Fizz", "0000:00:02.0", "Port B" },
>         /* Google Brask */
>         { "Google", "Brask", "0000:00:02.0", "Port B" },
> +       /* Google Kinox */
> +       { "Google", "Kinox", "0000:00:02.0", "Port B" },
>  };
>
>  static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
> --
> 2.25.1
>
