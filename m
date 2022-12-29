Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C168E1FAF
	for <chrome-platform@lists.linux.dev>; Thu, 29 Dec 2022 16:58:00 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id i188so19015905vsi.8
        for <chrome-platform@lists.linux.dev>; Thu, 29 Dec 2022 08:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sG4bujA1nh3G7gbqjXrN7dBPMasBMEZO+AKcRzylCgU=;
        b=GF/Tkq7Zd2lrEJArEXBZjdZwinAZNEJMlHVog7/mL3qAMKvVLEayxZ/Teshk6rau3L
         lJJOy3lmPUFYIdIZlGbPrb0UpcPlMp2k4FnChZFB2gMLvo5OrjeBezy5wed76YfTd0v/
         nv46rvcQkCn30QK/EMzbdzOOj3/lFvXppZCvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sG4bujA1nh3G7gbqjXrN7dBPMasBMEZO+AKcRzylCgU=;
        b=qhV+BzrqGz7VBp9MZzp3uZdC868VFiY1v5q1RlqrQ60rnOa4qM8ynxxu+plixk99t4
         +JtjS/qF0z4D2Q5lYcDSsUYdiYsAj7v32ZHN00WGu6JF6NQa9HQsA5O79F56HKE7KVBO
         xX3zCscgU5OJoRJLmBAFwlWjJqRzO/QXN50g1WYp0RmrF9WxUjkjyIAhW1vx8QQ4C1R8
         wgJTcgdlADOFOkMe1IjingBuwuW6QzR8D2+IdC8xY6IVDmInwPhZrxNgzQYavpzE85K/
         chiJrsGgHkRhFoMimQc1moOb6ODRtg90y25Fc+7vajJdCkNKmcpT5Mg29rA3bqzO1Rxl
         xnuQ==
X-Gm-Message-State: AFqh2kqsnHFiyI5qvfnd9o/FMBnVJaWocsQTz2Z0iSwEgdai4eWl7kIf
	AcC8LRKffZ6rlQkYF/nQbbS2QNLv6dnoh2Jn3Sxftw==
X-Google-Smtp-Source: AMrXdXtEM0eRZxFTiPoSmDqzg4dY4HsNCdxt+YNz0Sd9pWnH1FVVVTOZIHjaweEJ4hoN1mCiNBDPht6kGCTAJsrI4Mo=
X-Received: by 2002:a05:6102:679:b0:3b5:1e92:f898 with SMTP id
 z25-20020a056102067900b003b51e92f898mr3441465vsf.63.1672333079608; Thu, 29
 Dec 2022 08:57:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221229094738.2304044-1-tzungbi@kernel.org>
In-Reply-To: <20221229094738.2304044-1-tzungbi@kernel.org>
From: Mark Hasemeyer <markhas@chromium.org>
Date: Thu, 29 Dec 2022 09:57:49 -0700
Message-ID: <CANg-bXD_KiMTR2UWbCQOpCJZqHMb3Txi+VFLw6iS6F_nE5aJEg@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_uart: fix race condition
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev, 
	robertzieba@google.com, bhanumaiya@chromium.org
Content-Type: text/plain; charset="UTF-8"

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
Thanks for catching this. As a sanity check, I compiled and loaded the driver on
my local setup with these changes. LGTM.
