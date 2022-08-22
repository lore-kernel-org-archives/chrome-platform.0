Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C584C6C
	for <chrome-platform@lists.linux.dev>; Mon, 22 Aug 2022 23:24:00 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id j4so6153819vki.0
        for <chrome-platform@lists.linux.dev>; Mon, 22 Aug 2022 16:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=ihWp4vR6iv9Vx1IuCuEkyU14LfbaONccMsLFzR19yKI=;
        b=XxTC5U2mhc49nDKizCTXHv1SBKee+lJIMeZ1SymlbbbScvHVFN+al9RORtMPhT8ihz
         0acbcmEUqW0lRbMK7VbY2GUJyIWe6XlDyNo/Ogqg8yUX1uG+DobTEBMb2vQJ3lw0nRhn
         Cj9m/pageajpU9RZ9LWvf1xb7Kr3lBKk3SYIauxt+LW4fzgBJvD3Gqmlbt5Ex0pRzNGZ
         Cy3/UAvjzL/XUkrNgLQJgjvLQwqCIq36h4lvY1BhNf7mlouAkgVRk6SJodmAvAbHDZKJ
         r/raG93j0LR1YVosAIE+v/370eSQIRcDZ3RXR6Tv7f8BRMIlHOc5oRCYZeloh4n/qv48
         t3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=ihWp4vR6iv9Vx1IuCuEkyU14LfbaONccMsLFzR19yKI=;
        b=C47UEtGvV0qMBamq66zJi+0PLxJOsHdDEd/TcfPN6+uBWXS8cKtQUpsOLJNU/XLgs8
         Vvtz75QbZq+KZZzi8KmW+7mp3K84SxCL8obanSqw6U0ZiDv2ridLyr4/WJvTS7oAvB2n
         9TwG/f7GbPPdkpdHdMR4IPf+db/88oFwwxxF415iN2kTbiVqJOFZUg+7Wq5/+Wbuw1Fp
         BhpC6w1okMV4JQdVSHrmyvZCb9LxUas344h88iRPuckUcI8RZR37dQnThChCZaNFdBjc
         UZHDEgsicwiH6uiV9Zj/loEZFhJjY6pLmAdJj1AKdoV23c5hiWCVgwlrebYWvyMy71EI
         cOZg==
X-Gm-Message-State: ACgBeo1fa4TgrZPZSNpJHYudO0EazZkv6YPgOcUFlKKS63dxIo2JnnTa
	R+wkW71tSIsvtUDfZ/CNmnIvX3T5wvjjLlS8vgcNsw==
X-Google-Smtp-Source: AA6agR76t4tNkhuyswYO2hXCIYdW73eVolCETgnvHKs7o9O5jhocoG7ImWB0c3s1WtSv9N8zB3aP+bGCVAYXCN4+6e4=
X-Received: by 2002:a1f:a30e:0:b0:380:81d3:2562 with SMTP id
 m14-20020a1fa30e000000b0038081d32562mr8401801vke.7.1661210639605; Mon, 22 Aug
 2022 16:23:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220822144026.v3.1.Idd188ff3f9caddebc17ac357a13005f93333c21f@changeid>
In-Reply-To: <20220822144026.v3.1.Idd188ff3f9caddebc17ac357a13005f93333c21f@changeid>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 22 Aug 2022 16:23:48 -0700
Message-ID: <CABXOdTc-dnoNS-H_M3UrN4jwozEGdcUC7X0Kf5BqAAJsZWw7Yg@mail.gmail.com>
Subject: Re: [PATCH v3] platform/chrome: cros_ec: Expose suspend_timeout_ms in debugfs
To: Evan Green <evgreen@chromium.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Rajat Jain <rajatja@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Prashant Malani <pmalani@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Stephen Boyd <swboyd@chromium.org>, Tinghan Shen <tinghan.shen@mediatek.com>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 22, 2022 at 2:40 PM Evan Green <evgreen@chromium.org> wrote:
>
> In modern Chromebooks, the embedded controller has a mechanism where
> it will watch a hardware-controlled line that toggles in suspend, and
> wake the system up if an expected sleep transition didn't occur. This
> can be very useful for detecting power management issues where the
> system appears to suspend, but doesn't actually reach its lowest
> expected power states.
>
> Sometimes it's useful in debug and test scenarios to be able to control
> the duration of that timeout, or even disable the EC timeout mechanism
> altogether. Add a debugfs control to set the timeout to values other
> than the EC-defined default, for more convenient debug and
> development iteration.
>
> Signed-off-by: Evan Green <evgreen@chromium.org>
> Reviewed-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>
> Changes in v3:
>  - s/suspend_timeout/suspend_timeout_ms/ in docs (Prashant)
>  - Same in code (Tzung-Bi)
>  - Added Prashant's review tag (thanks Prashant!)
>
> Changes in v2:
>  - Update release version to 6.1 (Tzung-Bi)
>  - Reference EC_HOST_SLEEP_TIMEOUT_INFINITE (Tzung-Bi)
>  - Name the debugfs file suspend_timeout_ms (Prashant)
>
>  Documentation/ABI/testing/debugfs-cros-ec   | 22 +++++++++++++++++++++
>  drivers/platform/chrome/cros_ec.c           |  3 ++-
>  drivers/platform/chrome/cros_ec_debugfs.c   |  3 +++
>  include/linux/platform_data/cros_ec_proto.h |  1 +
>  4 files changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/testing/debugfs-cros-ec b/Documentation/ABI/testing/debugfs-cros-ec
> index 1fe0add99a2a99..66fe915acd739b 100644
> --- a/Documentation/ABI/testing/debugfs-cros-ec
> +++ b/Documentation/ABI/testing/debugfs-cros-ec
> @@ -54,3 +54,25 @@ Description:
>                 this feature.
>
>                 Output will be in the format: "0x%08x\n".
> +
> +What:          /sys/kernel/debug/<cros-ec-device>/suspend_timeout_ms
> +Date:          August 2022
> +KernelVersion: 6.1
> +Description:
> +               Some ECs have a feature where they will track transitions to the
> +               a hardware-controlled sleep line, such as Intel's SLP_S0 line,
> +               in order to detect cases where a system failed to go into deep
> +               sleep states. The suspend_timeout_ms file controls the amount of
> +               time in milliseconds the EC will wait before declaring a sleep
> +               timeout event and attempting to wake the system.
> +
> +               Supply 0 to use the default value coded into EC firmware. Supply
> +               65535 (EC_HOST_SLEEP_TIMEOUT_INFINITE) to disable the EC sleep
> +               failure detection mechanism. Values in between 0 and 65535
> +               indicate the number of milliseconds the EC should wait after a
> +               sleep transition before declaring a timeout. This includes both
> +               the duration after a sleep command was received but before the
> +               hardware line changed, as well as the duration between when the
> +               hardware line changed and the kernel sent an EC resume command.
> +
> +               Output will be in the format: "%u\n".
> diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
> index 8aace50d446d65..32140a7150d013 100644
> --- a/drivers/platform/chrome/cros_ec.c
> +++ b/drivers/platform/chrome/cros_ec.c
> @@ -115,7 +115,7 @@ static int cros_ec_sleep_event(struct cros_ec_device *ec_dev, u8 sleep_event)
>         if (ec_dev->host_sleep_v1) {
>                 buf.u.req1.sleep_event = sleep_event;
>                 buf.u.req1.suspend_params.sleep_timeout_ms =
> -                               EC_HOST_SLEEP_TIMEOUT_DEFAULT;
> +                               ec_dev->suspend_timeout_ms;
>
>                 buf.msg.outsize = sizeof(buf.u.req1);
>                 if ((sleep_event == HOST_SLEEP_EVENT_S3_RESUME) ||
> @@ -188,6 +188,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>         ec_dev->max_passthru = 0;
>         ec_dev->ec = NULL;
>         ec_dev->pd = NULL;
> +       ec_dev->suspend_timeout_ms = EC_HOST_SLEEP_TIMEOUT_DEFAULT;
>
>         ec_dev->din = devm_kzalloc(dev, ec_dev->din_size, GFP_KERNEL);
>         if (!ec_dev->din)
> diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform/chrome/cros_ec_debugfs.c
> index 0dbceee87a4b1a..4e63adf083ea1f 100644
> --- a/drivers/platform/chrome/cros_ec_debugfs.c
> +++ b/drivers/platform/chrome/cros_ec_debugfs.c
> @@ -470,6 +470,9 @@ static int cros_ec_debugfs_probe(struct platform_device *pd)
>         debugfs_create_x32("last_resume_result", 0444, debug_info->dir,
>                            &ec->ec_dev->last_resume_result);
>
> +       debugfs_create_u16("suspend_timeout_ms", 0664, debug_info->dir,
> +                          &ec->ec_dev->suspend_timeout_ms);
> +
>         ec->debug_info = debug_info;
>
>         dev_set_drvdata(&pd->dev, ec);
> diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
> index 408b29ca4004be..e43107e0bee162 100644
> --- a/include/linux/platform_data/cros_ec_proto.h
> +++ b/include/linux/platform_data/cros_ec_proto.h
> @@ -169,6 +169,7 @@ struct cros_ec_device {
>         int event_size;
>         u32 host_event_wake_mask;
>         u32 last_resume_result;
> +       u16 suspend_timeout_ms;
>         ktime_t last_event_time;
>         struct notifier_block notifier_ready;
>
> --
> 2.31.0
>
