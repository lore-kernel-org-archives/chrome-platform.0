Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B391396
	for <chrome-platform@lists.linux.dev>; Mon, 13 Jun 2022 15:40:10 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-fe023ab520so8845041fac.10
        for <chrome-platform@lists.linux.dev>; Mon, 13 Jun 2022 08:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BGAIi+/Ft53DX8CUrCtDAbQTz9ZPUzipX2JK4m40Fyc=;
        b=RPluaBvzdSvJ5njD15mxkw0ob6qmuyOBJo1hMaQ2AFBjUq++UqkyqjMZzoFpoAhmIr
         ec01sWqSFKsJB6FZgwGP7drgPr4gYSWF10aZZIvHqpTM4uKuRPArOtlTZ65e2oWlcIJc
         0gAKcSwnh35acodyjWgGJzwhHUz3FRGrcu+tA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BGAIi+/Ft53DX8CUrCtDAbQTz9ZPUzipX2JK4m40Fyc=;
        b=rX2FA/RZFgn0LEl98t5tw2vZKXZm4d1yva5z96+74ZTyWAaRPsi9I7I9XNZbYStzmh
         gq/fGYK+rP66AwjewtNwjaDDhKu6eM3sqygv/QQI9uYIh5E6KPv+fDOYojYenkl1M/Rb
         NidH4DbEP1CESdsWZD5CgqRwNVja8b9A0M/J38mzLF4OCbxtbqkRcKTsyaS2tShisxRR
         qo+rkKL6U1QQPkjscA52fFHqHBJEBVB+EwDy8RfA60mZGECBzisIarkJNjeDUfYubuaI
         2jWxyVHx2o9va+yV1BQ/6b/RvIE2XJ6voJrGnVKTXWpHwrHf2t/CWiqHo/QbEqsnuOwS
         bi2A==
X-Gm-Message-State: AJIora/NAFDsek3rBTbhFEJi263dTZTmWdRP8AKXd8YXfSEDBbyNqgAr
	U0gFso0Ge6jee/s8/XHfdoXs6QQncJXavA==
X-Google-Smtp-Source: AGRyM1tuPt13VGJ/8fpGOVkPhi8rdaeu3JRUgj5cBBT1TVh/uNbhn6djFMjvWAdpt8cRyMI8UdF5mQ==
X-Received: by 2002:a05:6870:231f:b0:da:c15:fd43 with SMTP id w31-20020a056870231f00b000da0c15fd43mr158640oao.135.1655134809479;
        Mon, 13 Jun 2022 08:40:09 -0700 (PDT)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com. [209.85.160.49])
        by smtp.gmail.com with ESMTPSA id n3-20020a0568301e8300b0060603221281sm3542476otr.81.2022.06.13.08.40.08
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jun 2022 08:40:08 -0700 (PDT)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-100eb6f7782so8904375fac.2
        for <chrome-platform@lists.linux.dev>; Mon, 13 Jun 2022 08:40:08 -0700 (PDT)
X-Received: by 2002:a05:6870:5247:b0:fb:2e60:26c6 with SMTP id
 o7-20020a056870524700b000fb2e6026c6mr157351oai.241.1655134808192; Mon, 13 Jun
 2022 08:40:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220611061825.4119270-1-swboyd@chromium.org>
In-Reply-To: <20220611061825.4119270-1-swboyd@chromium.org>
From: Evan Green <evgreen@chromium.org>
Date: Mon, 13 Jun 2022 08:39:32 -0700
X-Gmail-Original-Message-ID: <CAE=gft7ZJ3PP=A8FMUs1O6FnRacjrceeYzeoJ8_9q5AffuLBPw@mail.gmail.com>
Message-ID: <CAE=gft7ZJ3PP=A8FMUs1O6FnRacjrceeYzeoJ8_9q5AffuLBPw@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: cros_ec: Always expose last resume result
To: Stephen Boyd <swboyd@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, Rajat Jain <rajatja@chromium.org>, 
	Matthias Kaehlcke <mka@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 10, 2022 at 11:18 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> The last resume result exposing logic in cros_ec_sleep_event()
> incorrectly requires S0ix support, which doesn't work on ARM based
> systems where S0ix doesn't exist. That's because cros_ec_sleep_event()
> only reports the last resume result when the EC indicates the last sleep
> event was an S0ix resume. On ARM systems, the last sleep event is always
> S3 resume, but the EC can still detect sleep hang events in case some
> other part of the AP is blocking sleep.
>
> Always expose the last resume result if the EC supports it so that this
> works on all devices regardless of S0ix support. This fixes sleep hang
> detection on ARM based chromebooks like Trogdor.
>
> Cc: Evan Green <evgreen@chromium.org>
> Cc: Rajat Jain <rajatja@chromium.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Cc: Hsin-Yi Wang <hsinyi@chromium.org>
> Fixes: 7235560ac77a ("platform/chrome: Add support for v1 of host sleep event")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

I looked at the EC code for firmware-hatch-12669.B, which is I think
the oldest board shipping the suspend_transitions support, and saw
that it correctly initializes resume_response.sleep_transitions for
both S0IX_RESUME and S3_RESUME. I think that mitigates my only concern
that we might be interpreting garbage sleep_transitions from the EC on
some older platforms. So,

Reviewed-by: Evan Green <evgreen@chromium.org>

> ---
>
> Changes from v1 (https://lore.kernel.org/r/20220610223703.3387691-1-swboyd@chromium.org):
>  * Fixed typo
>
>  drivers/platform/chrome/cros_ec.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
> index b3e94cdf7d1a..3abef9747482 100644
> --- a/drivers/platform/chrome/cros_ec.c
> +++ b/drivers/platform/chrome/cros_ec.c
> @@ -135,10 +135,10 @@ static int cros_ec_sleep_event(struct cros_ec_device *ec_dev, u8 sleep_event)
>         buf.msg.command = EC_CMD_HOST_SLEEP_EVENT;
>
>         ret = cros_ec_cmd_xfer_status(ec_dev, &buf.msg);
> -
> -       /* For now, report failure to transition to S0ix with a warning. */
> +       /* Report failure to transition to system wide suspend with a warning. */
>         if (ret >= 0 && ec_dev->host_sleep_v1 &&
> -           (sleep_event == HOST_SLEEP_EVENT_S0IX_RESUME)) {
> +           (sleep_event == HOST_SLEEP_EVENT_S0IX_RESUME ||
> +            sleep_event == HOST_SLEEP_EVENT_S3_RESUME)) {
>                 ec_dev->last_resume_result =
>                         buf.u.resp1.resume_response.sleep_transitions;
>
>
> base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
> --
> https://chromeos.dev
>
