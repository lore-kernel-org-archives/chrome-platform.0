Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB85F1110
	for <chrome-platform@lists.linux.dev>; Thu, 29 Dec 2022 20:07:57 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-46d4840b51fso213851097b3.12
        for <chrome-platform@lists.linux.dev>; Thu, 29 Dec 2022 12:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XK/Ruv1Pelumosh8HtdAMa9kExPNcQRjllWX5JZtCz8=;
        b=e0V+rSACJ0eNcSG18Pb4mIbvx50ID4oFrR9knUfY0qevSHN6Uire8vOB0vUgGENxfl
         d4xThTPidGLUO7iEbr0CWjE38bWoiGTz4nCh73Mczd9etFJXFUqSLB4CB3i+yMv4CDWy
         B+rqDsOuu33wthDgg2LVyNueZLXB5MZEv+M7A8Ql9saowkFTLd4LdOCRkw/tBuwIJmTH
         MQhpsoKe9TRUSudHaJAgwXbc8y9VyZXFmj3dHn5a2BihGN3DwoYVHb/e6FH/cERBk3Zf
         l8z9JB7XREU9nilQqli7VXg49EoWdPSADa5BL5zpUfB6S7YhsriBQ10nYpo7s7JrdFoa
         l7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XK/Ruv1Pelumosh8HtdAMa9kExPNcQRjllWX5JZtCz8=;
        b=4AJDAWFp1UUKr8Ktt8w/cHjSn624F0zDh8jbwalhPj7XgUWeFAbaCSfbezSqX/5Eq0
         2SwCi6QYRA23jhyuC8LuUNvONvEi6S63AYbmOzOFz2PDZmb9hwR4nsiSVny2rdIv7m7C
         Vz1gtOsQ1jjitbRaw8Qu19gu9/8a8kEyDN2Q2do+JaGLvz/d7bNm0PKedGbcoKVYGVSM
         BVLsNg0gbKhCpAXzRMbwiYMahFo2iQttiXQHVpgZTaZjrHUIbVrh/hCWW/hxI8xzu7lq
         6lJ3gVIoTooJ7sF+T3Z0zQyY/7/IbseoZSjX/EP/+sJ7CjZYh/6P/gkuODoYJWw0evwv
         pREQ==
X-Gm-Message-State: AFqh2kpifdE1xrq6rBE38msZPR/5oHaddLTf9yRAPojyUMHK+1NALQUP
	wmbJOulm+LVHoSFHlKbjlRglQAKZeuE6nWjxUYo9ZQ==
X-Google-Smtp-Source: AMrXdXs41nttiSXHUauoxAwz0geqo3pMnDATl2i2h8H5bctGT+6BMJ58cQunIxJyu6s61Jx26H1EmnCvGL0CXl1nn1s=
X-Received: by 2002:a0d:cbd4:0:b0:475:5ef6:9679 with SMTP id
 n203-20020a0dcbd4000000b004755ef69679mr2216705ywd.402.1672344476568; Thu, 29
 Dec 2022 12:07:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221229094738.2304044-1-tzungbi@kernel.org>
In-Reply-To: <20221229094738.2304044-1-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 29 Dec 2022 12:07:45 -0800
Message-ID: <CABXOdTcrLdgEmpF=iDYfWu4f4MoJBtJomy-Jeev8FEUs2utzUQ@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_uart: fix race condition
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev, 
	robertzieba@google.com, markhas@chromium.org, bhanumaiya@chromium.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 29, 2022 at 1:47 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> From: Robert Zieba <robertzieba@google.com>
>
> serdev_device_set_client_ops() is called before `ec_dev` is fully
> initialized.  This can result in cros_ec_uart_rx_bytes() being called
> while `ec_dev` is still not initialized, resulting in a kernel panic.
>
> Call serdev_device_set_client_ops() after `ec_dev` is initialized.
>
> Fixes: 04a8bdd135cc ("platform/chrome: cros_ec_uart: Add transport layer")
> Signed-off-by: Robert Zieba <robertzieba@google.com>
> [tzungbi: modified commit message and fixed context conflict.]
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
> This is from https://crrev.com/c/3490635.  I just found the patch when
> reviewing some downstream patches.
>
>  drivers/platform/chrome/cros_ec_uart.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_uart.c b/drivers/platform/chrome/cros_ec_uart.c
> index 0cef2888dffd..6916069f1599 100644
> --- a/drivers/platform/chrome/cros_ec_uart.c
> +++ b/drivers/platform/chrome/cros_ec_uart.c
> @@ -270,7 +270,6 @@ static int cros_ec_uart_probe(struct serdev_device *serdev)
>         }
>
>         serdev_device_set_drvdata(serdev, ec_dev);
> -       serdev_device_set_client_ops(serdev, &cros_ec_uart_client_ops);
>         init_waitqueue_head(&ec_uart->response.wait_queue);
>
>         ec_uart->serdev = serdev;
> @@ -300,6 +299,8 @@ static int cros_ec_uart_probe(struct serdev_device *serdev)
>                            sizeof(struct ec_response_get_protocol_info);
>         ec_dev->dout_size = sizeof(struct ec_host_request);
>
> +       serdev_device_set_client_ops(serdev, &cros_ec_uart_client_ops);
> +
>         return cros_ec_register(ec_dev);
>  }
>
> --
> 2.39.0.314.g84b9a713c41-goog
>
