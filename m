Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF8563F
	for <chrome-platform@lists.linux.dev>; Sat, 11 Jun 2022 01:40:45 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id d14so911425eda.12
        for <chrome-platform@lists.linux.dev>; Fri, 10 Jun 2022 18:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QABc4YlIjdzNmKMejkI2eOzTrYOoWCevfbBdoFlAxVY=;
        b=tN66Wmxq6Hr6WvGjsoZxrBmeFnAV9ZgYbZN1JIgrbr632Ee4mGX9hJcnFfJ0qiFvGP
         DDmSK/N5LIftb1lz6YgdnbpZDVcN8PMieuG7AQ3LgMTSavBsMJP+zcbDRuJCEJFpFVrQ
         GScpRWsBMbcNQ0T1RpSllFzSqtOhA0Qnmd5OYMq+TD66SubmiIvmyO9g6LOAqDP9LKUw
         /3Wm7liPAogXEBFuJKHQlNIrLlgtntIYFTiljJokx0OBP7H2ikvR49WarrDBoK8fK/7r
         AlT41+ZDbOek9HdLRNa0dt/rKYkrz1wgsgCoeFkpPDYJahuZh+lQasl2Vo5nkv2q2AI7
         MjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QABc4YlIjdzNmKMejkI2eOzTrYOoWCevfbBdoFlAxVY=;
        b=lYNztOvMuRKg7Hqi93Ph4rZDpJ2wsbksCUH+7zhjOkCtLuo/D6MA2Ovzxt3xIfNrPA
         XEOf+iR5VJhTnqSKs9ZAnKLQF0BGbBG3mHK/kURgImxrObnsAMQBGoZq11JxSYwW/e2E
         FUtbUNCsDCumHYrSuZcQHF2HTwxZ5NYVhg6wWtfVI4Fuci2fySxOjv/zHXyjIACnpbKx
         ZIZ+GIV5b28sqjQ9RbY+p01kZ+TL1GeQYDmRPJNOdsXF4uzz09QoQBVi039DRBtvyc3n
         yfK6DygPP0qSXG9cvO3IwkGzP6vVuXhDYKVNcSHCLUTp25HonpQIOV0Vt8K6aESnRRZ+
         ZcdA==
X-Gm-Message-State: AOAM531AINKDDvylb1F3z+Gg9BonXy57UcvCC1lj3STJLVTzhBKb0Bpv
	hNVT7RXsvREmm7Z9jPJiyIaRJyYBF3hFR160SMqUfA==
X-Google-Smtp-Source: ABdhPJwJ67aKbfxtJuYIk3/E8mMInJrcvazk99B9VaYCNnV5blyc4ttJlCMPqb+KYVwLq07H9N4E+z+cSW7FhQRtzeg=
X-Received: by 2002:a05:6402:3490:b0:42f:b592:f364 with SMTP id
 v16-20020a056402349000b0042fb592f364mr42426383edc.66.1654911643955; Fri, 10
 Jun 2022 18:40:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220610223703.3387691-1-swboyd@chromium.org>
In-Reply-To: <20220610223703.3387691-1-swboyd@chromium.org>
From: Guenter Roeck <groeck@google.com>
Date: Fri, 10 Jun 2022 18:40:33 -0700
Message-ID: <CABXOdTfvuHLf=ahN4+iOewyLCNnOZMXS-S+4a_RUtLCC=9t_HA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec: Always expose last resume result
To: Stephen Boyd <swboyd@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	patches@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, Evan Green <evgreen@chromium.org>, 
	Rajat Jain <rajatja@chromium.org>, Matthias Kaehlcke <mka@chromium.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 10, 2022 at 3:37 PM Stephen Boyd <swboyd@chromium.org> wrote:
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
> ---
>
> I originally was going to check for S3 only with !ARCH_X86 but I can't
> convince myself that it's any use to limit the check to s0ix in general.
> This approach assumes the last resume result is valid if the command is
> supported, regardless of whether or not the AP supports s0ix or not.
> This seems to be the case at least on ARM, and looking at the EC
> convinces me that CONFIG_POWER_SLEEP_FAILURE_DETECTION is only enabled
> on x86 devices that have s0ix.
>
>  drivers/platform/chrome/cros_ec.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
> index b3e94cdf7d1a..881d3ad09be0 100644
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
> +           (sleep_event == HOST_SLEEP_EVENT_S0IX_SUSPEND ||
> +            sleep_event == HOST_SLEEP_EVENT_S3_RESUME)) {

I am sure I am missing something, but the description doesn't explain
(to me) the switch from HOST_SLEEP_EVENT_S0IX_RESUME to
HOST_SLEEP_EVENT_S0IX_SUSPEND.

Thanks,
Guenter

>                 ec_dev->last_resume_result =
>                         buf.u.resp1.resume_response.sleep_transitions;
>
>
> base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
> --
> https://chromeos.dev
>
