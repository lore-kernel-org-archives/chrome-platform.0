Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87969182C5
	for <chrome-platform@lists.linux.dev>; Wed, 18 Dec 2024 01:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734484615; cv=none; b=PJ4UDU/i0yn08lorW0fr7PuXCa64/u3nypSayxGjrhvTQfJ8B3rDKtnVGGUZ0PXThogWL/2O/Wtyey/kx4WPlWq5B/9fsf3o9TdgyFgxCUI1nQU4QqALrpmqMUdALwkEce+6R4r1IVueIS6IajqtAR9GD7jUlmk64Sy1pOQNmdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734484615; c=relaxed/simple;
	bh=aJ+jKfs8vOkx5Gsw61RenhEFgwAHCYAz6byzGMuMsmg=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e5enVoLU604RF+Xu6uzR+wAVA4lkd5/ouJdLj3zvYQb5n6ZWc7YD7DGe7IuBLwWugqsLYDKeSPwlw1KDizb913VTZNSZNsL4fafGUp70DBUepR36ZXKiKmfY4DLf7pXYYA4oj/J29xI0gJAEZCQyKNn3JblgbzMZnZq4ZI8JFd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KXvQe6WQ; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KXvQe6WQ"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4678664e22fso53419491cf.2
        for <chrome-platform@lists.linux.dev>; Tue, 17 Dec 2024 17:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734484612; x=1735089412; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pceT12MgPX5LYeNYoGKuH+9kRM2/umAtaQqiUzTvSW0=;
        b=KXvQe6WQbekEKJH+pqMdOxXWcRWXL+bhCzg+S4R9iciFsIH4+1RCCbPZLivlFD7gSA
         rut7+6Ryv0B/9ZmoBVNrp7zVDTjkJWAH6KycCoHd0/TUk9WFCB718IkY3wne9f10rCCb
         vkgkTgYFVO4FWRQvPEqr3LudEzJJ7rPpfJahE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734484612; x=1735089412;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pceT12MgPX5LYeNYoGKuH+9kRM2/umAtaQqiUzTvSW0=;
        b=bu7IkzVpA5Bygk+lig3GunR8tNRwqIGhfjaxbbiWPiEDPAyGJK8bZqq/qeJDeKjQx1
         dW2CyfS+KdFbu6HLh2b5C9N+vvhpeDPS5N7i2d3wyICEa688e+sG+VASkriR5hW0AxGr
         821K3oCnxZ0Ubmiea1Stag35xqiepJKrtWR9ekC6N0PpDpL0fWTEVJ0DdU6L6SiwNdnE
         FGa8qte1yyrau/UumKQot5t5/4AJfTo+870BeX3nduL8HRvHixkvYCUavH1+6mAfxxq4
         fnmkU/sXmT/wQgBqNDvClaotX9qVISV5YvxlSqi2v3+/tjNXi6y04lAGCyN1cZ9+/zDf
         DT4g==
X-Forwarded-Encrypted: i=1; AJvYcCXkgHVBVXZphWD8yFqokkSWlaQVclRJ0n4wMNTQUnG2ZbYy97qBLGPHNerLvWDBqFjEC7KGZTGIRjVefnXeK2s=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBM7a53zohiz5GnYafwEa2URCr13HEU/Ad4ICM3ctcX0OKaWcq
	ntn4IsOnZSbTBnn0uk0keYvRbPrz6cQk8csvna1OsRpMRIVeu27v3nugBs0RWVSoX1dVagYMNmP
	ubf/jSpnTchRt9cetMGHwZg+AeAuRma9bm2w2
X-Gm-Gg: ASbGncsYWcVuzv/oEQEO2RXE9WHoF6RQtaduMnuxfnK5m+Qwye84kPbf8RFpew+Z/2K
	VwRC0TK/JaT2Xaf3BNexW4yQ20g0jyNUv4pZ3bXact6UGqHoUV5NmjzfnmrVslBv8Bg==
X-Google-Smtp-Source: AGHT+IH0sag0Q8DdRb4YIYS5LquPPnmmZcz9FS1OqVkQ8B6udk4bdQhF22/vJ82rq6mCziYWZgvqWq+BtlhyvIOSsmY=
X-Received: by 2002:ac8:7c4d:0:b0:467:8378:9e8 with SMTP id
 d75a77b69052e-46908de32d9mr17129991cf.17.1734484612535; Tue, 17 Dec 2024
 17:16:52 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Dec 2024 20:16:52 -0500
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241213153543.v5.6.I142fc0c09df58689b98f0cebf1c5e48b9d4fa800@changeid>
References: <20241213233552.451927-1-abhishekpandit@chromium.org> <20241213153543.v5.6.I142fc0c09df58689b98f0cebf1c5e48b9d4fa800@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Tue, 17 Dec 2024 20:16:52 -0500
Message-ID: <CAE-0n52Y-t0TEuGS25GQsctCLC8FTm6A5tfQb3XLbwh2G5W_MA@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] platform/chrome: cros_ec_typec: Displayport support
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev, 
	heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	tzungbi@kernel.org
Cc: akuchynski@google.com, pmalani@chromium.org, badhri@google.com, 
	rdbabiera@google.com, dmitry.baryshkov@linaro.org, jthies@google.com, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Abhishek Pandit-Subedi (2024-12-13 15:35:47)
> diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/Makefile
> index fb8335458a22..1a5a484563cc 100644
> --- a/drivers/platform/chrome/Makefile
> +++ b/drivers/platform/chrome/Makefile
> @@ -19,7 +19,11 @@ obj-$(CONFIG_CROS_EC_SPI)            += cros_ec_spi.o
>  obj-$(CONFIG_CROS_EC_UART)             += cros_ec_uart.o
>  cros_ec_lpcs-objs                      := cros_ec_lpc.o cros_ec_lpc_mec.o
>  cros-ec-typec-objs                     := cros_ec_typec.o cros_typec_vdm.o
> +ifneq ($(CONFIG_CROS_EC_TYPEC_ALTMODES),)
> +       cros-ec-typec-objs              += cros_typec_altmode.o
> +endif

Can this be simplified by collapsing the config in because it is a bool?

	cros-ec-typec-y					:= cros_ec_typec.o cros_typec_vdm.o
	cros-ec-typec-$(CONFIG_CROS_EC_TYPEC_ALTMODES)	+= cros_typec_altmode.o

>  obj-$(CONFIG_CROS_EC_TYPEC)            += cros-ec-typec.o
> +
>  obj-$(CONFIG_CROS_EC_LPC)              += cros_ec_lpcs.o
>  obj-$(CONFIG_CROS_EC_PROTO)            += cros_ec_proto.o cros_ec_trace.o
>  obj-$(CONFIG_CROS_KBD_LED_BACKLIGHT)   += cros_kbd_led_backlight.o
> diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
> new file mode 100644
> index 000000000000..6e736168ccc3
> --- /dev/null
> +++ b/drivers/platform/chrome/cros_typec_altmode.c
> @@ -0,0 +1,285 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Alt-mode implementation on ChromeOS EC.
> + *
> + * Copyright 2024 Google LLC
> + * Author: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> + */
> +#include "cros_ec_typec.h"

Please include this after linux headers.

> +
> +#include <linux/mutex.h>
> +#include <linux/workqueue.h>
> +#include <linux/usb/typec_dp.h>
> +#include <linux/usb/pd_vdo.h>
> +
> +#include "cros_typec_altmode.h"
> +

[...]
> +
> +static int cros_typec_displayport_vdm(struct typec_altmode *alt, u32 header,
> +                                     const u32 *data, int count)
> +{
> +       struct cros_typec_dp_data *dp_data = typec_altmode_get_drvdata(alt);
> +       struct cros_typec_altmode_data *adata = &dp_data->adata;
> +
> +

Nitpick: Remove extra newlines.

> +       int cmd_type = PD_VDO_CMDT(header);
> +       int cmd = PD_VDO_CMD(header);
> +       int svdm_version;
> +
> +       svdm_version = typec_altmode_get_svdm_version(alt);
> +       if (svdm_version < 0)
> +               return svdm_version;
> +
