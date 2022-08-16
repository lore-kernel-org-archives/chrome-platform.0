Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15536AA9
	for <chrome-platform@lists.linux.dev>; Tue, 16 Aug 2022 21:44:56 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-33365a01f29so88312837b3.2
        for <chrome-platform@lists.linux.dev>; Tue, 16 Aug 2022 14:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=HVy2dhpgUq+TCa1+gNzXEDC+2DKw2nqR1kkYuPYSqUw=;
        b=ftyIhd9V+q2A29zdiypNsQVoUh2exbA2eIUGJcoay9088xFM15YHBmgU16PeKDsFuY
         Gw7FHeTI5lVY0Wj3An1IYErXR9AVLYmOw3opdXc0bpv5Ys90pXC4lxrI+QUWottezu2P
         eMWW6OTfY/xw5NMk9D/l+o1N2PaZ+HtfTZR+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=HVy2dhpgUq+TCa1+gNzXEDC+2DKw2nqR1kkYuPYSqUw=;
        b=vGv0N4N3m1WyNsDEK9APj1R5dRTcSGryYKRwhRZ27M2wU+DkTDmcprgCQ3jWvQI5mL
         6zhHOBy4gyu5tbXcId8rr3DcLY9aJl9BS+zHiKmVFkatP26Kd5j8R2jGUUfXybU1gozX
         gfQESroe03mvHdw6ijiWgB2MijDAAvnHTNgC13r7tB8XpDB0fsGjf0NonHNk9sAQ4teA
         H7UOj6ZNxB1EuAfYYYy1wpY08T9BmWpY37gebGnPP1oIzNEjDtzVOcRgaRRaW7GlVCLx
         5PV+vAWUtlaZrbaegitGqvB6UZyzrBskuGzgEykbSsiX4jYlA4zENpT79chhrnTd9765
         YxZA==
X-Gm-Message-State: ACgBeo1gQAwYbA83s2QEOvt/aq+ElTX88dRvY+LlnSskrJuFHnajJANx
	k2q7krNdaIAUePjH2x+inm+zeFMFBOmju4k5jU84ZA==
X-Google-Smtp-Source: AA6agR50R5+yZwR0E9gjbHI0sJwF86HfBORhJh0SzaLt1EEjVs6AYC4BYIG9uitnV3tHcz0Rs8DT4IcNwkM1uJT2dx8=
X-Received: by 2002:a25:4ce:0:b0:67c:3362:c396 with SMTP id
 197-20020a2504ce000000b0067c3362c396mr17283128ybe.336.1660686295674; Tue, 16
 Aug 2022 14:44:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220815063555.1384505-1-pmalani@chromium.org>
 <20220815063555.1384505-3-pmalani@chromium.org> <Yvsm7qEiCpoYPeTS@google.com>
In-Reply-To: <Yvsm7qEiCpoYPeTS@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 16 Aug 2022 14:44:45 -0700
Message-ID: <CACeCKadOK22FzOwyOEkmaqw+V4-Jna=QqetDmsqNhs27skzU7A@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] platform/chrome: cros_typec_switch: Add switch driver
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	bleung@chromium.org, Daisuke Nojiri <dnojiri@chromium.org>, 
	"Dustin L. Howett" <dustin@howett.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Guenter Roeck <groeck@chromium.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Lee Jones <lee.jones@linaro.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Tinghan Shen <tinghan.shen@mediatek.com>, Xiang wangx <wangxiang@cdjrlc.com>
Content-Type: text/plain; charset="UTF-8"

Hi Tzung-Bi,

Thanks for reviewing the patch series.

On Mon, Aug 15, 2022 at 10:11 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> On Mon, Aug 15, 2022 at 06:34:19AM +0000, Prashant Malani wrote:
> > Introduce a driver to configure USB Type-C mode switches and retimers
> > which are controlled by the Chrome OS EC (Embedded Controller).
> > This allows Type-C port drivers, as well as alternate mode drivers to
> > configure their relevant mode switches and retimers according to the
> > Type-C state they want to achieve.
>
> s/Chrome OS/ChromeOS/.

Fixed in v6.

>
> > diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
> [...]
> > +config CROS_TYPEC_SWITCH
> > +     tristate "ChromeOS EC Type-C Switch Control"
> > +     depends on MFD_CROS_EC_DEV && TYPEC && ACPI
> > +     default MFD_CROS_EC_DEV
> > +     help
> > +       If you say Y here, you get support for configuring the Chrome OS EC Type C
> > +       muxes and retimers.
>
> s/Chrome OS/ChromeOS/.
>
> Up to you, s/Type C/Type-C/g.

Fixed in v6.

>
> > diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
> > new file mode 100644
> > index 000000000000..0d319e315d57
> > --- /dev/null
> > +++ b/drivers/platform/chrome/cros_typec_switch.c
> > @@ -0,0 +1,170 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright 2022 Google LLC
> > + *
> > + * This driver provides the ability to configure Type C muxes and retimers which are controlled by
> > + * the Chrome OS EC.
> > + */
>
> s/Chrome OS/ChromeOS/.
Fixed in v6.

>
> > +static int cros_typec_register_switches(struct cros_typec_switch_data *sdata)
> > +{
> > +     struct cros_typec_port *port = NULL;
> > +     struct device *dev = sdata->dev;
> > +     struct fwnode_handle *fwnode;
> > +     struct acpi_device *adev;
> > +     unsigned long long index;
> > +     int ret = 0;
>
> `port` and `ret` don't need to be initialized.
Fixed in v6.

>
> > +MODULE_DESCRIPTION("Chrome OS EC Type C Switch control");
>
> s/Chrome OS/ChromeOS/.

Fixed in v6.
