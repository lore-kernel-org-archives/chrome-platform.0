Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC6B23A6
	for <chrome-platform@lists.linux.dev>; Fri, 25 Nov 2022 08:28:06 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id p12so2270589qvu.5
        for <chrome-platform@lists.linux.dev>; Fri, 25 Nov 2022 00:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pu77Y1NhgCyugJCMjWhDtk2X5EOd4VpeA0QYq3/PVyc=;
        b=KMFbTjVe2V4Dbt7DQUyNK2pKUS6PppmdW2f/dih2lFZum0vQtTMZ7KdQUKLAyARoca
         hZj4y/a6nrYiXIU2zRAqVJLqEFgTPKEuI3oJgKEet+GCGTZDrCaxUPG3CfIpZV22Pb3X
         g7/tf7OHB3VE1reio15pjScG4imnv9gWMiBTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pu77Y1NhgCyugJCMjWhDtk2X5EOd4VpeA0QYq3/PVyc=;
        b=3CFRDn/dG+1Gx/3wCvp23pRg8YbC5TjjFh57dnkgDELrG33euYZejLCB7T8hLC2ttM
         ydDg4ejguh8iqksSIpsBCL47Jra0x5DmqEsJMJXEuosUmEGjiW0z2KC5OatSPAL2yOXw
         RfNM/Mv0RQnr4uemY1L7w8Hc2g8qluRqFHeyy2DScDFTmB6/3n37m7HC5nA+aZQJbBhn
         Mew/RtEF0nUWtEgfLoAwrsq+maRMKVwFOTTOMFmoDT0OHU1BpBb5BqDwjyzznJuF77vV
         ejyyLPQp/Xd9eQbb5/WpjM7stCJyX0veHDk1tjXjovvXDg3WRNt198gNVn6AIE7bN5P9
         lW4w==
X-Gm-Message-State: ANoB5pnDi6WhVMciMFLisbBRcyiptqctIXmOePOFz6FhoT/I2IQu+BF/
	wDAxGVFtkrDZh616vmg55rhk/rPrAZJVK8Ixh7DgBw==
X-Google-Smtp-Source: AA0mqf5DKkXzTCcwrpb8ivhHpG56FhbYNc3rVKh2HZx4KwhEDl64v3lNb9SfWJJ8AaAD5X/NDId7yUVuYAFtq6nhYnE=
X-Received: by 2002:a05:6214:1e2:b0:4c6:8f31:2dea with SMTP id
 c2-20020a05621401e200b004c68f312deamr17542212qvu.127.1669364885114; Fri, 25
 Nov 2022 00:28:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221117080823.77549-1-yuancan@huawei.com> <CACeCKafbbVsLrprzvVzsVgUUwExf==Ck-SOhQ2RCZbMVAnHuJg@mail.gmail.com>
 <2d89c054-9962-bd8a-9180-6a72545cf7e8@huawei.com> <CACeCKaevCdGYkC0+3rj3THJrabHC-j=qxHbCaCDZExoh4rH-Rg@mail.gmail.com>
 <4abd6f64-34ee-80e4-c5b5-b70f26000175@huawei.com>
In-Reply-To: <4abd6f64-34ee-80e4-c5b5-b70f26000175@huawei.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Fri, 25 Nov 2022 00:27:54 -0800
Message-ID: <CACeCKae2g7Ngp9yZ4zS7QEhS_uJ-wi-juuSuM4Ctbw4kYw3CkQ@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_usbpd_notify: Fix error handling in cros_usbpd_notify_init()
To: Yuan Can <yuancan@huawei.com>
Cc: bleung@chromium.org, gwendal@chromium.org, jflat@chromium.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2022 at 12:33 AM Yuan Can <yuancan@huawei.com> wrote:
>
>
> =E5=9C=A8 2022/11/19 4:11, Prashant Malani =E5=86=99=E9=81=93:
> > On Fri, Nov 18, 2022 at 2:18 AM Yuan Can <yuancan@huawei.com> wrote:
> >>
> >> =E5=9C=A8 2022/11/18 3:07, Prashant Malani =E5=86=99=E9=81=93:
> >>> Hi Yuan,
> >>>
> >>> On Thu, Nov 17, 2022 at 12:10 AM Yuan Can <yuancan@huawei.com> wrote:
> >>>> The reason is that the cros_usbpd_notify_init() does not check the r=
eturn
> >>>> value of platform_driver_register(), and the cros_usbpd_notify can
> >>>> install successfully even if platform_driver_register() failed.
> >>>>
> >>>> Fix by checking the return value of platform_driver_register() and
> >>> Can you provide details regarding why cros_usbpd_notify_acpi_driver r=
egistration
> >>> is failing on your system (logs or other details) ?
> >> The reason could be an OOM happend when platform_driver_register() tri=
es
> >> to allocate memory,
> >>
> >> a simple call graph:
> >>
> >>    platform_driver_register()
> >>      driver_register()
> >>        bus_add_driver()
> >>          dev =3D kzalloc(...) # OOM happened
> >>
> > Sure, but is that what you're seeing? Can you share logs from your repr=
o case?
> Yes, that the reason, this problem is triggered by the OOM
> fault-injection test.

Alright. Thanks for providing that detail.

Best regards,

-Prashant
