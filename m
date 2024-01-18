Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093A1200AB
	for <chrome-platform@lists.linux.dev>; Thu, 18 Jan 2024 10:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705572125; cv=none; b=GrxA7EOcpqiVO8Zg7Yc+xlOho48p3lhuwMK2i/vvjQ1JGkdgpWIPHf3127tmDAXR49v9Tmos97Yb0y2WRw4cwFomhNNvvPBuxs5vxe2MCJmHbb5mVBSBjm1PXI4emOmBL/4cQspQqe2CCMArH+I7L8wEDOg4UvhD/N7kSPGW5sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705572125; c=relaxed/simple;
	bh=soHeTw8nucVzer4yQdR+I0O2Kl9v9GMUXLJfbUAO134=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding; b=ACMdlethjYT/7sJwR+HYFlTmBf7r7cH/BjbX+m0NUYjK2OHlZNw03X7L9eIc7r0wExUsfhw+vfwNSYSU1bRfpNCGSGyXkjnQi2/8ktmV5crCUUza6lqExFtEj9Zw9eA//hjd5zVnIJTDmC9zIaczBQE426RU9TVV3m15uTg6y8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W604PzDr; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W604PzDr"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-4b7e4a2808bso3516167e0c.1
        for <chrome-platform@lists.linux.dev>; Thu, 18 Jan 2024 02:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705572118; x=1706176918; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsG4DowCs4KKFZiNp7kWGzZfbLS3E3qjNg9PmSz4SaI=;
        b=W604PzDrjo7hf7c0aDiGaSjo/M72ik7WDa5erFLp4Zk3nHvARI6ar9OEYiy4rq1bbG
         vEheZTfbthroWQZMcLcH7U5zEtWekapr3dfA4vbJzBqszXRnA4iYDTFzEACHN256xG3v
         WoH0DGOhNYF90kqQIYhRsfX8AbeOSMY9dVJfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705572118; x=1706176918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UsG4DowCs4KKFZiNp7kWGzZfbLS3E3qjNg9PmSz4SaI=;
        b=e8PVdsGa9v9IntnumhhT5KuC+lwE9iex79FF8VnDXhQH305yItPKaGHbl8P2ZGY0bt
         +FFfug7UWDB+ZLBwWHlIieAaF/8BPpm/n0ClrPkLZ6MaMBxaz+9OZn/c2awCTl0edjzs
         izkifmH6DaGv1LugrOkMPE57kdw0bhW/ijumHBUvqUvHdRtxmgc5gwqOsC/UGjOv0J2B
         u5jXbzuzmw4rGzwWOowIGi+VjXwpXsLS3KJZ7zidiS/G0Ku77hyeZp5OS8oHGMnHw8tf
         BowsMWQm5VB27FgsUGeLJ3uqAIXfkOf4uOX4/PsClmY+sGxXZZcR960Ccv/CODokb1H8
         hQUg==
X-Gm-Message-State: AOJu0YzAb7xMbPguS7dFSVGElx0ZCsPIcwTAw9bWOqAW9QKQAUmIgO6C
	6/WS9uB2qoHALD1qiJh8BK8HKEo99X4x/FYbkyqr9HbnGM4TnzvH4XEn8Pn8EvOquJ1mX6o+Rwo
	=
X-Google-Smtp-Source: AGHT+IGpo4PFzYIYHMChpERsN0wHIbqLaFCr+/yQ8AeJc4Qf0VRouOA5isVY6wphsBSn5aNvLv9FUQ==
X-Received: by 2002:a05:6122:1199:b0:4b6:dc25:3d4b with SMTP id x25-20020a056122119900b004b6dc253d4bmr312850vkn.12.1705572117902;
        Thu, 18 Jan 2024 02:01:57 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id ez19-20020a0561224a1300b004b7236c7715sm780761vkb.53.2024.01.18.02.01.56
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 02:01:56 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-4b72f2bdbdaso3235786e0c.3
        for <chrome-platform@lists.linux.dev>; Thu, 18 Jan 2024 02:01:56 -0800 (PST)
X-Received: by 2002:a1f:fe0b:0:b0:4b7:1d62:b48f with SMTP id
 l11-20020a1ffe0b000000b004b71d62b48fmr299907vki.24.1705572116196; Thu, 18 Jan
 2024 02:01:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240118085310.1139545-1-phoenixshen@google.com>
In-Reply-To: <20240118085310.1139545-1-phoenixshen@google.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 18 Jan 2024 18:01:19 +0800
X-Gmail-Original-Message-ID: <CAC=S1njRz=d73J0ntKma2L85icqbCO79wLjrMpkQ0HgiDpdbrw@mail.gmail.com>
Message-ID: <CAC=S1njRz=d73J0ntKma2L85icqbCO79wLjrMpkQ0HgiDpdbrw@mail.gmail.com>
Subject: Re: [PATCH] Input: cros_ec_keyb: add support for base attached event
To: Ting Shen <phoenixshen@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ting Shen <phoenixshen@google.com>, 
	Benson Leung <bleung@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	chrome-platform@lists.linux.dev, =?UTF-8?B?am9ld3UgKOWQs+S7suaMryk=?= <joewu@msi.com>, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 4:54=E2=80=AFPM Ting Shen <phoenixshen@chromium.org=
> wrote:
>
> This CL maps ChromeOS EC's BASE_ATTACHED event to SW_DOCK,
Hi Ting,

The change itself looks good to me, but the userspace can already
detect keyboard attachment through USB events. Can you explain why
this becomes necessary?
And the Linux community doesn't use the term "CL". Please use general
terms like "commit" or "patch" as well as imperative sentences [1] in chang=
elog.

After that,
Reviewed-by: Fei Shao <fshao@chromium.org>

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html=
#describe-your-changes

Regards,
Fei



> to allow userspace detect that a keyboard is attached to the
> detachable device.
>
> Signed-off-by: Ting Shen <phoenixshen@google.com>
> ---
>
>  drivers/input/keyboard/cros_ec_keyb.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboa=
rd/cros_ec_keyb.c
> index 30678a34cf647..d2e0d89d4ffdf 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -128,6 +128,11 @@ static const struct cros_ec_bs_map cros_ec_keyb_bs[]=
 =3D {
>                 .code           =3D SW_TABLET_MODE,
>                 .bit            =3D EC_MKBP_TABLET_MODE,
>         },
> +       {
> +               .ev_type        =3D EV_SW,
> +               .code           =3D SW_DOCK,
> +               .bit            =3D EC_MKBP_BASE_ATTACHED,
> +       },
>  };
>
>  /*
> --
> 2.43.0.381.gb435a96ce8-goog
>
