Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5AD2F43
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 21:30:27 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id v47so9855492ybi.4
        for <chrome-platform@lists.linux.dev>; Wed, 09 Feb 2022 13:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gQGHdWjWEdMxdVwZie1xiHKbO85HJ5NAeoXm9CQ4vZ4=;
        b=eqSxGmvyD5M95o2vQQHkWhn0uVJ1e4JCojLWrLfvYelDdUbnImRIdjUkYXAQP1Djw0
         wvRdB96coffMfGsX0TQQeYwSLDT0KzKiuWbHGAi2xNdD7ZlkxFyrqut8SdQ1tJOhU/BJ
         ri5xlZS/oPwNNnMiRjfhA0hd0KC9vuetPC9Z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gQGHdWjWEdMxdVwZie1xiHKbO85HJ5NAeoXm9CQ4vZ4=;
        b=uAb4iN6VV+U2/kF6xXh0UG3u6e8tUfYk+HO+e48/TiCpZq4+xaryeFdjTOciTOsTBo
         uBUrMvxxf+QjCtoxmXY3cea/tdEVW14YfBhe/GFPkVQO92hhL24K7AKiy1gA/R9nM+xr
         4cCpeX+8fRTfmpQPESckWk09bPaArCXSN9Y4BZTJ2KfPzNAmPylkGoh7sRrKe4aBkemg
         wWBUyUkzsQKRvZDTUq9vPbb6CAuuagE+F07tn4y6LLbmbTdqTCoTdCwQwFEZDTep7UpQ
         M1OKiRgxe6DIVgP5nz1wJEv3j3SHWRs5cMROH12Jhukik9Bh58ki6IIlXX8rz9kOoSWX
         1t/w==
X-Gm-Message-State: AOAM532qA5nD6NWjyDeTbk6phzysyFOZv6lVXTUvRiVVyMJKkAjukMW2
	DjypfoMf0G/UwY8kjjYHrL26OU2mpjUruDsCbkKMrg==
X-Google-Smtp-Source: ABdhPJwxkhjCX/v87k2VhoXaekFvOkw2/JIrLMCZjE2D2ocLeqVBUwIgS8yzE+0qI8KouAkWJ39vjByZ3LZ7YJoYXlo=
X-Received: by 2002:a81:b54a:: with SMTP id c10mr4184624ywk.283.1644442226369;
 Wed, 09 Feb 2022 13:30:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220209051130.386175-1-tzungbi@google.com>
In-Reply-To: <20220209051130.386175-1-tzungbi@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Wed, 9 Feb 2022 13:30:14 -0800
Message-ID: <CACeCKadXU+pX=3m5d6SMnx4pxpRpgsCWN15HhOUpxocTadKFtQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] platform/chrome: cros_ec_debugfs: detach log
 reader wq from devm
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 8, 2022 at 9:11 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> Debugfs console_log uses devm memory (e.g. debug_info in
> cros_ec_console_log_poll()).  However, lifecycles of device and debugfs
> are independent.  An use-after-free issue is observed if userland
> program operates the debugfs after the memory has been freed.
>
> The call trace:
>  do_raw_spin_lock
>  _raw_spin_lock_irqsave
>  remove_wait_queue
>  ep_unregister_pollwait
>  ep_remove
>  do_epoll_ctl
>
> A Python example to reproduce the issue:
> ... import select
> ... p = select.epoll()
> ... f = open('/sys/kernel/debug/cros_scp/console_log')
> ... p.register(f, select.POLLIN)
> ... p.poll(1)
> [(4, 1)]                    # 4=fd, 1=select.POLLIN
>
> [ shutdown cros_scp at the point ]
>
> ... p.poll(1)
> [(4, 16)]                   # 4=fd, 16=select.POLLHUP
> ... p.unregister(f)
>
> An use-after-free issue raises here.  It called epoll_ctl with
> EPOLL_CTL_DEL which in turn to use the workqueue in the devm (i.e.
> log_wq).
>
> Detaches log reader's workqueue from devm to make sure it is persistent
> even if the device has been removed.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
> As for 2 other related cases I could image:
>
> Case 1. userland program opens the debugfs after the device has been removed
>
> ENOENT.  cros_ec_debugfs_remove() calls debugfs_remove_recursive().
>
> Case 2. userland program is reading when the device is removing
>
> If the userland program is waiting in cros_ec_console_log_read(), the device
> removal will wait for it.
>
> See the calling stack for the case:
>  wait_for_completion
>  __debugfs_file_removed
>  remove_one
>  simple_recursive_removal
>  debugfs_remove
>  cros_ec_debugfs_remove
>  platform_drv_remove
>  device_release_driver_internal
>  device_release_driver
>  bus_remove_device
>  device_del
>  platform_device_del
>  platform_device_unregister
>
> Changes from v1:
> - rebase to next-20211029.
> - change the commit messages.
>
>  drivers/platform/chrome/cros_ec_debugfs.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform/chrome/cros_ec_debugfs.c
> index 272c89837d74..0dbceee87a4b 100644
> --- a/drivers/platform/chrome/cros_ec_debugfs.c
> +++ b/drivers/platform/chrome/cros_ec_debugfs.c
> @@ -25,6 +25,9 @@
>
>  #define CIRC_ADD(idx, size, value)     (((idx) + (value)) & ((size) - 1))
>
> +/* waitqueue for log readers */
> +static DECLARE_WAIT_QUEUE_HEAD(cros_ec_debugfs_log_wq);

Hmm, I'm always wary of introducing statics to address races like this.

Doesn't re-ordering cros_ec_debugfs_remove() avoid the race? :
diff --git a/drivers/platform/chrome/cros_ec_debugfs.c
b/drivers/platform/chrome/cros_ec_debugfs.c
index 272c89837d74..80bd898c3271 100644
--- a/drivers/platform/chrome/cros_ec_debugfs.c
+++ b/drivers/platform/chrome/cros_ec_debugfs.c
@@ -485,8 +485,8 @@ static int cros_ec_debugfs_remove(struct
platform_device *pd)
 {
        struct cros_ec_dev *ec = dev_get_drvdata(pd->dev.parent);

-       debugfs_remove_recursive(ec->debug_info->dir);
        cros_ec_cleanup_console_log(ec->debug_info);
+       debugfs_remove_recursive(ec->debug_info->dir);

        return 0;
 }
