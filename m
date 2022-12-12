Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732036FD9
	for <chrome-platform@lists.linux.dev>; Mon, 12 Dec 2022 21:49:20 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id 128so12734793vsz.12
        for <chrome-platform@lists.linux.dev>; Mon, 12 Dec 2022 13:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HJe5NEtSkbd9smAWbsgSF2T73y6hJatTH6s+Fn1bMbI=;
        b=CBQRevtmEFAqd1TtAKxP52T/gInU3x1G/rR28CPD6d5LoM2NbmJtOCBmnkif99utni
         O5pCKwWTxzqjNRAWTW7BccuM2OxZGxZAHQskt0fzg9yCiIZ2uovsrKvuG8H5EnkFAZGd
         KMPYFsDGCbYshP2oszD+ifModnSqJq1MfwJ+mZn6O7Kpj8mAEQP95wgg/9Rup4brgWc1
         m6R7ufgPLJKBCW2XZpeO1hKSX+l5Qw8Y+i2mrV56PV/p9AXPwgqj2aovjc66a2WOlp03
         bjzZ5PHqOOX5ETDvZRg8YznZHdypMd0OpjbWabARTxRzoFldKlDS1KC1QKvbQcMs8Ns+
         UpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJe5NEtSkbd9smAWbsgSF2T73y6hJatTH6s+Fn1bMbI=;
        b=M0Zc/NfjkPu3RmfGmInxjMhjzj7j+CskBZOusx+3LWWQ5AQfq/7Q1wU+8mLWoCXKAV
         M2giK3PjgzbQnN0Q6tfiPF938mHriqehQ87p/BXNP2RWntmhTj20CDljU+lFakYqsQc6
         adpNki7wB7YzoIysHLBB1c5aMM7JnhNVrsstbxhXumnbRDwJa1xOgEDiVhnj/lKay2gh
         /+FgRcFvQQkDZe7pZOnT+e0T7iihZXdiIkOkG2SmO+XBpclHs6qLu7JgLWA8sGrjRyGf
         Ow0gOmx36yX3fMWftjohNoVEvvucnWnjzyy2kIjf9q4tWYSOnbujwwcbzyv2z79uYzV3
         qc2Q==
X-Gm-Message-State: ANoB5pmJrINaTrFyYgEDruMSmbzLqG53+LxGp5BSNukn5Ynlvorb8CYx
	EpNmevv8UR+1E98j8J838i9K/j/3TA4ct9OVuSHQIQ==
X-Google-Smtp-Source: AA0mqf5dJiRM2ruDp6Rvl99YdXcuYvQa1gNgQk9oBbm9lzyUbe0xFq/GifZUtj9oUrij8m1EjjXnDkdgpWTROSeOhX0=
X-Received: by 2002:a05:6102:6c1:b0:3a9:b437:8bfb with SMTP id
 m1-20020a05610206c100b003a9b4378bfbmr43679050vsg.70.1670881759303; Mon, 12
 Dec 2022 13:49:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221212213857.3636830-1-grundler@chromium.org>
In-Reply-To: <20221212213857.3636830-1-grundler@chromium.org>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 12 Dec 2022 13:49:08 -0800
Message-ID: <CABXOdTd34M1fCEdYfT7F7RAMDmvEj=Ak_Wcg+HgcU83nOFor8w@mail.gmail.com>
Subject: Re: [PATCH] power: supply: cros_usbpd: reclassify "default case!" as debug
To: Grant Grundler <grundler@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Sebastian Reichel <sre@kernel.org>, chrome-platform@lists.linux.dev, linux-pm@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 12, 2022 at 1:39 PM Grant Grundler <grundler@chromium.org> wrote:
>
> This doesn't need to be printed every second as an error:
> ...
> <3>[17438.628385] cros-usbpd-charger cros-usbpd-charger.3.auto: Port 1: default case!
> <3>[17439.634176] cros-usbpd-charger cros-usbpd-charger.3.auto: Port 1: default case!
> <3>[17440.640298] cros-usbpd-charger cros-usbpd-charger.3.auto: Port 1: default case!
> ...
>
> Reduce priority from ERROR to DEBUG.
>
> Signed-off-by: Grant Grundler <grundler@chromium.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

>
> ---
>  drivers/power/supply/cros_usbpd-charger.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/power/supply/cros_usbpd-charger.c b/drivers/power/supply/cros_usbpd-charger.c
> index cadb6a0c2cc7..b6c96376776a 100644
> --- a/drivers/power/supply/cros_usbpd-charger.c
> +++ b/drivers/power/supply/cros_usbpd-charger.c
> @@ -276,7 +276,7 @@ static int cros_usbpd_charger_get_power_info(struct port_data *port)
>                 port->psy_current_max = 0;
>                 break;
>         default:
> -               dev_err(dev, "Port %d: default case!\n", port->port_number);
> +               dev_dbg(dev, "Port %d: default case!\n", port->port_number);
>                 port->psy_usb_type = POWER_SUPPLY_USB_TYPE_SDP;
>         }
>
> --
> 2.39.0.rc1.256.g54fd8350bd-goog
>
