Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015727C
	for <chrome-platform@lists.linux.dev>; Sat, 11 Jun 2022 06:17:42 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-fe15832ce5so1844604fac.8
        for <chrome-platform@lists.linux.dev>; Fri, 10 Jun 2022 23:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=za02L3YGkMaQDDqUxwbazqy5dmLqsmTNruFmOVnXHLs=;
        b=ZhUYo+ec7/hRaGq7h5hPPUEOc8eNxo/1WQo+0mOKo2xGedoXSmfYbZXJUkz/QAf2y0
         SOKzhXharIFEs6ZHKTsX8zADjjUXfSGIWOBLzcpDzmFYryj0jOnQvGMnTMIg7YkWDH99
         gvu6xhUppNiQ9j1FX8G+hmOtzD/DekoTETyTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=za02L3YGkMaQDDqUxwbazqy5dmLqsmTNruFmOVnXHLs=;
        b=qOiKl+XCxotRt3os9ZEDEO8yIXTlQIiwBRXdyP32Os9t8A1bY9is7L2N/jsu8AUCSV
         Qnm6kHv8l5Y2kxgs0mq4a1vmG/PMgTSaVTrkQNICln447zZyQSlrejhfSuQB7MiSW3Dx
         iM8z3JiL8r2NnKe0r6a9xHyM1A88UFDgXQvBv2fQTg1exltUqjFBo9SrGDMRD4VjPEjF
         p9reFrX3zsYs1qRqnBiLZ0s/ZcQ5tKq7wCAoz44T4nRjbDjrQxO6aF6aJSj4izBREAYa
         WK6CO6nt8LHKltG2TxwDjUW7ATCMenONBst/MGfEt4iRc/jE7WliFKtBJCuF5dIVGVc2
         Ql7w==
X-Gm-Message-State: AOAM530DrC2Wygt65rb9KY1i4i5LCDfdjuvfatePjSlNL0E5Nd43a5nu
	ODXYEuWlIHQl0AeyDSC0L8zV/ofAvwr5qT6BN50TQw==
X-Google-Smtp-Source: ABdhPJwP+GegoajQ2DsSTYfMWKmwk/n7FeyvsXDY8wjEV6aAE58scWTyKz/7+YfwZzIqWA8nVvUVOaFqHBibIaaaBHA=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr1885317oap.63.1654928262086; Fri, 10 Jun
 2022 23:17:42 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 10 Jun 2022 23:17:41 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CABXOdTfvuHLf=ahN4+iOewyLCNnOZMXS-S+4a_RUtLCC=9t_HA@mail.gmail.com>
References: <20220610223703.3387691-1-swboyd@chromium.org> <CABXOdTfvuHLf=ahN4+iOewyLCNnOZMXS-S+4a_RUtLCC=9t_HA@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 10 Jun 2022 23:17:41 -0700
Message-ID: <CAE-0n53HdS+tQJXQ303kofKBeCbj1K8hf9RTSnguLJbPY7FtxA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec: Always expose last resume result
To: Guenter Roeck <groeck@google.com>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	patches@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, Evan Green <evgreen@chromium.org>, 
	Rajat Jain <rajatja@chromium.org>, Matthias Kaehlcke <mka@chromium.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Guenter Roeck (2022-06-10 18:40:33)
> On Fri, Jun 10, 2022 at 3:37 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
> > index b3e94cdf7d1a..881d3ad09be0 100644
> > --- a/drivers/platform/chrome/cros_ec.c
> > +++ b/drivers/platform/chrome/cros_ec.c
> > @@ -135,10 +135,10 @@ static int cros_ec_sleep_event(struct cros_ec_device *ec_dev, u8 sleep_event)
> >         buf.msg.command = EC_CMD_HOST_SLEEP_EVENT;
> >
> >         ret = cros_ec_cmd_xfer_status(ec_dev, &buf.msg);
> > -
> > -       /* For now, report failure to transition to S0ix with a warning. */
> > +       /* Report failure to transition to system wide suspend with a warning. */
> >         if (ret >= 0 && ec_dev->host_sleep_v1 &&
> > -           (sleep_event == HOST_SLEEP_EVENT_S0IX_RESUME)) {
> > +           (sleep_event == HOST_SLEEP_EVENT_S0IX_SUSPEND ||
> > +            sleep_event == HOST_SLEEP_EVENT_S3_RESUME)) {
>
> I am sure I am missing something, but the description doesn't explain
> (to me) the switch from HOST_SLEEP_EVENT_S0IX_RESUME to
> HOST_SLEEP_EVENT_S0IX_SUSPEND.

You didn't miss anything.
