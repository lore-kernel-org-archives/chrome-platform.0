Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A042C80
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 16:38:21 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id k25so8989201ejp.5
        for <chrome-platform@lists.linux.dev>; Wed, 09 Feb 2022 08:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2bpaabgrtYJFtSWtnDt9rsK7M4EGzei7gfruCVHVtO0=;
        b=ROCksdPQU7m2Uh0D2VoeXelPC9B8/qmuLXy5Wvk8qctfGSDafL5KjyOQ0wpKHDFWlw
         UW/eWHypzSeTwyCx1kORkaQuDTKp6bChFc4xOCTerihxHORL6KoMB7BU0IxXn4KHAM+o
         1kQUoF1ywyvp/DZ4HJGifQjSRqiyVdHy4ClZ0m+dsG2PVi7mXS1bhUzSX9Q+SB6q+jba
         qBsLmHk1pCLwVAfBgEFIcq+c6h4BPrfz7sJ1cw6aMGLRhAPBSaS2ezK/nk5F5C6SFzAJ
         NObBQfFX+d4LAAyH41k2fNIUDXBhcyFv21/bGz6f0Y52Ia0f7dc5LCDJAMNLlAsDYuuJ
         4hNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2bpaabgrtYJFtSWtnDt9rsK7M4EGzei7gfruCVHVtO0=;
        b=cbExjt8bWk1QWgKrh+xLRUa4a/UuWKZ3546NW3q9QGzTfP9pW36Anj+VkKJVRyZCHD
         00Gg2Ke7C8REOmQDq9z6V6wcKzch+384wMFFFuunxpzA6Sq3TT9PProlWHcRHljNPU7D
         R9MzXY6v+lDZ88l8lD51qoOztSDtPqzoGgzHvI/E9gRBTQeINfyBGBiyIxULozagG9+9
         ChoFHuuvZbzkF0ugPFh8CWsZA3aJ8gST8hQtK/+BnULAdqktKtcM+vugsM/xBwL/l6k9
         OrwMMvBQuTY5f/wxWYu8F4w7UNpCiCXAZSuBg7F57POiccbHeJhYsrh9vEKHUj+/OzYS
         OFcA==
X-Gm-Message-State: AOAM532tsk6v80i6he7OYmzs62nh2NSJNnOYT3gxUeSHu5PBj4ycZ7zr
	eG7UpHdMdPt36fDj6xo0Ykv5DvpY8E0/q7uNNKhHtg6UhZkfcQ==
X-Google-Smtp-Source: ABdhPJy51XpssjWczzi9Tk650P1KIXBlccHp9MRADNNTQaFQfVh5pgi5EQLa0vT3dqZsdeCCWKwRJ4tBDs8UUHpvjTw=
X-Received: by 2002:a17:906:64d9:: with SMTP id p25mr2774627ejn.189.1644424699376;
 Wed, 09 Feb 2022 08:38:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220209051130.386175-1-tzungbi@google.com>
In-Reply-To: <20220209051130.386175-1-tzungbi@google.com>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 9 Feb 2022 08:38:07 -0800
Message-ID: <CABXOdTdOeWoGv9ApR23Cd=SrViGFC7DL3eVqPpq3jwC-DJxtHg@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] platform/chrome: cros_ec_debugfs: detach log
 reader wq from devm
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev
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

Reviewed-by: Guenter Roeck <groeck@google.com>

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
> +
>  /**
>   * struct cros_ec_debugfs - EC debugging information.
>   *
> @@ -33,7 +36,6 @@
>   * @log_buffer: circular buffer for console log information
>   * @read_msg: preallocated EC command and buffer to read console log
>   * @log_mutex: mutex to protect circular buffer
> - * @log_wq: waitqueue for log readers
>   * @log_poll_work: recurring task to poll EC for new console log data
>   * @panicinfo_blob: panicinfo debugfs blob
>   */
> @@ -44,7 +46,6 @@ struct cros_ec_debugfs {
>         struct circ_buf log_buffer;
>         struct cros_ec_command *read_msg;
>         struct mutex log_mutex;
> -       wait_queue_head_t log_wq;
>         struct delayed_work log_poll_work;
>         /* EC panicinfo */
>         struct debugfs_blob_wrapper panicinfo_blob;
> @@ -107,7 +108,7 @@ static void cros_ec_console_log_work(struct work_struct *__work)
>                         buf_space--;
>                 }
>
> -               wake_up(&debug_info->log_wq);
> +               wake_up(&cros_ec_debugfs_log_wq);
>         }
>
>         mutex_unlock(&debug_info->log_mutex);
> @@ -141,7 +142,7 @@ static ssize_t cros_ec_console_log_read(struct file *file, char __user *buf,
>
>                 mutex_unlock(&debug_info->log_mutex);
>
> -               ret = wait_event_interruptible(debug_info->log_wq,
> +               ret = wait_event_interruptible(cros_ec_debugfs_log_wq,
>                                         CIRC_CNT(cb->head, cb->tail, LOG_SIZE));
>                 if (ret < 0)
>                         return ret;
> @@ -173,7 +174,7 @@ static __poll_t cros_ec_console_log_poll(struct file *file,
>         struct cros_ec_debugfs *debug_info = file->private_data;
>         __poll_t mask = 0;
>
> -       poll_wait(file, &debug_info->log_wq, wait);
> +       poll_wait(file, &cros_ec_debugfs_log_wq, wait);
>
>         mutex_lock(&debug_info->log_mutex);
>         if (CIRC_CNT(debug_info->log_buffer.head,
> @@ -377,7 +378,6 @@ static int cros_ec_create_console_log(struct cros_ec_debugfs *debug_info)
>         debug_info->log_buffer.tail = 0;
>
>         mutex_init(&debug_info->log_mutex);
> -       init_waitqueue_head(&debug_info->log_wq);
>
>         debugfs_create_file("console_log", S_IFREG | 0444, debug_info->dir,
>                             debug_info, &cros_ec_console_log_fops);
> --
> 2.35.0.263.gb82422642f-goog
>
