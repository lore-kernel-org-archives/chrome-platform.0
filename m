Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB963211
	for <chrome-platform@lists.linux.dev>; Tue,  3 Jan 2023 18:33:18 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id h4so10829880vkn.3
        for <chrome-platform@lists.linux.dev>; Tue, 03 Jan 2023 10:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nyUet6x4uqQhhxhzGyUmhrj2wUnBNVlP6nKahm4i9RA=;
        b=KyE7PTKiBM+a+b5Ipuv1hMvUzrc/qGS91TMQ6OMOHMBZsKqsQrbgbKt1pvBg/cUEoT
         owVlUI9ak5JUcnuH0nNVZCC6AKjxoL/EmjOuHC+tyk1oUbRSHyHZY9m6elOGG5ORf8H5
         P4tHtLOpF58qPEfGnObhWh5gaPnI1uhyqs58Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nyUet6x4uqQhhxhzGyUmhrj2wUnBNVlP6nKahm4i9RA=;
        b=IgHXN00j2ZdMbVH/Av76v84PDGVS4cetioXWMNLJmZ1FkTXIepSyQDNQ8cAZWWvdzq
         /MsL+8pizxmjXItPJLKNDk8ZMgc844LDItXFRSmDtPQXqWLgNe/HgcwiHP1uB7XArotw
         BgLa4QpRXqrfPl5st3Z9lKJwvVenFYzHoKZ4b+NxzuV7yCqIwqC/5H8gZBxSxJ/Wq78s
         yJr+8YDu6za14iyZemGwVNUdMuVZGHLhLWE22C5F42iHCbvBOPJF/3ZoD/G7Tdj5kcOL
         kXL24/f0nNGrWiglD2j9X+hrVG49O7d59wqFfdyjhiTHACxQrFjB5E9oLuOYvQMyVgu7
         QBUQ==
X-Gm-Message-State: AFqh2kqQaLW7hF//i443DlaAs75nLoouuLr0hIr7kX2JKAkDbraKF9Xg
	+j+Z5snaEaMVbCWpZJj1ohlhrQgyTQn055gfKqbPjg==
X-Google-Smtp-Source: AMrXdXuxNghyaFh6lv9WT1/cwGuWasBEt6KQO52RE6J6u8MNQSYCu16ebesgMg8YeTM3hjL41ccT0bFA+17M8OT2lJo=
X-Received: by 2002:a1f:308a:0:b0:3d5:b2c7:f1c1 with SMTP id
 w132-20020a1f308a000000b003d5b2c7f1c1mr1236699vkw.29.1672770797873; Tue, 03
 Jan 2023 10:33:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221229094738.2304044-1-tzungbi@kernel.org> <CANg-bXD_KiMTR2UWbCQOpCJZqHMb3Txi+VFLw6iS6F_nE5aJEg@mail.gmail.com>
 <CABXOdTdA-DxCvM-=YPqb-GXKJhFLujTRWEmsTKkPH6OtiZfWew@mail.gmail.com>
In-Reply-To: <CABXOdTdA-DxCvM-=YPqb-GXKJhFLujTRWEmsTKkPH6OtiZfWew@mail.gmail.com>
From: Mark Hasemeyer <markhas@chromium.org>
Date: Tue, 3 Jan 2023 11:33:07 -0700
Message-ID: <CANg-bXAijWJJbWGDsWXP_CUsB_bkbvHRw_WpYngQKcJ7ktAPaA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_uart: fix race condition
To: Guenter Roeck <groeck@google.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, bleung@chromium.org, groeck@chromium.org, 
	chrome-platform@lists.linux.dev, robertzieba@google.com, 
	bhanumaiya@chromium.org
Content-Type: text/plain; charset="UTF-8"

> > > diff --git a/drivers/platform/chrome/cros_ec_uart.c b/drivers/platform/chrome/cros_ec_uart.c
> > > index 0cef2888dffd..6916069f1599 100644
> > > --- a/drivers/platform/chrome/cros_ec_uart.c
> > > +++ b/drivers/platform/chrome/cros_ec_uart.c
> > > @@ -270,7 +270,6 @@ static int cros_ec_uart_probe(struct serdev_device *serdev)
> > >         }
> > >
> > >         serdev_device_set_drvdata(serdev, ec_dev);
> > > -       serdev_device_set_client_ops(serdev, &cros_ec_uart_client_ops);
> > >         init_waitqueue_head(&ec_uart->response.wait_queue);
> > >
> > >         ec_uart->serdev = serdev;
> > > @@ -300,6 +299,8 @@ static int cros_ec_uart_probe(struct serdev_device *serdev)
> > >                            sizeof(struct ec_response_get_protocol_info);
> > >         ec_dev->dout_size = sizeof(struct ec_host_request);
> > >
> > > +       serdev_device_set_client_ops(serdev, &cros_ec_uart_client_ops);
> > > +
> > >         return cros_ec_register(ec_dev);
> > >  }
> > Thanks for catching this. As a sanity check, I compiled and loaded the driver on
> > my local setup with these changes. LGTM.
>
> Please consider replying with a Reviewed-by: and/or Tested-by: tag.
>
FWIW -
Tested-by: Mark Hasemeyer <markhas@chromium.org>
