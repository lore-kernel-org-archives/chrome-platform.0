Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0DD1EEA5D
	for <chrome-platform@lists.linux.dev>; Wed,  5 Mar 2025 22:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741215038; cv=none; b=biNnANDdyJvOwaMjMnTJHY2SklQW0D5Md4d460WYnq1k01rJgadjaFN7TyTelazRd7UfQgWZIuBNPu8Bt4btk2cA/h9m8YG16p7I+YDkMptV/pvQWVVheYcBt6mDm+zxJjem095EbNI76nzzqV7QazmNk3ghf8MeeG9b9Eb8xOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741215038; c=relaxed/simple;
	bh=hINIG5kxOwV7liYzl/+ZFhE/Yh0+VkapvzoZ/yUMGP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=to0XfuNNmhdUrq2o3rtGHzTkgCcBmCMIUH2jGEbE32or1qYprQ4gypVWcmqKhojb/bDYNJ5pwTGUg9aqNLX2dsXLt0FE82a0XFwFLtMSxLhJMHFzUIRjgjYs4OHM01cTbiD3SF0dN8iMD3AJWMvEzj/kZlGbReQcC/HQJsZvxDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YT7b0Ju2; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YT7b0Ju2"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-474e1b8c935so99161cf.0
        for <chrome-platform@lists.linux.dev>; Wed, 05 Mar 2025 14:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741215035; x=1741819835; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RsjM4YASNleulr3tBXWY5lzfU3eAoHcF5KVgOaYjt5c=;
        b=YT7b0Ju2R5Q5D1jDtvE+7MMM74hH+8XKhnrJPN/BekHJ9AF4KjkZs0A299rF7sGV61
         c5/3ZVjthA3l2FXt4RLReBS7B4k7RiAqU4eML9tpZ7RGXLs1UAteCF788FfgmEyfR0ZN
         GMObrWApb+VDFubyflLWu9RFlptbu7wekGEH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741215035; x=1741819835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RsjM4YASNleulr3tBXWY5lzfU3eAoHcF5KVgOaYjt5c=;
        b=JodLpvAAmPRdOGbt9zs9Jji29DXPkA/naHHuPUA/KzZJlf+VOTeG02ZVCIrSH3+lDd
         gLHIa3DQQhcn0P59kQ0nqQLuZg/j+zT54WgqG+aYl84aF4x21An2OXIIrmEJI8+8URUN
         AL/gBBhLwGmZIOh/Dgks/QbthTd8aZU5XEmQSN1cNvGoBWBDZemiKRyXaJqLlfrrdnHX
         z1cjcBFmxZ4+HSJYtYc4qDb/DrYmg5beLnpugLE/u2lmsKmr8l5KWAvWZkOIZorj2uEM
         qErmywjzoGltEmHsIqWNbrkDoSjl32m7+ZfidN7I1D3cdfhTyE1eCRwy6c6YGUA5UslA
         SEYw==
X-Forwarded-Encrypted: i=1; AJvYcCUfp4E7VDsC3Eud7r/18/BCU/1eu6yBXutkZ2U0MwCvLNyNLmHOpA9QdczvGc/shdj+YhahdttoovKmDqvby7w=@lists.linux.dev
X-Gm-Message-State: AOJu0YxR/bWZVnR41n9KWrOc1ECh5kdvXoppbInKYN5jgQOg4EBvRkMv
	7YfUiWfiUI7hyPXRAv8U7GnAPpwiX5mlPEaTzOrxyj6R13jsKCmNPwVol3iHAxa8Fy7v4rJFzrB
	1r5sf65kd8txDS8WQW856N3y7WR4NKhK2ZLGV
X-Gm-Gg: ASbGncukWumH6GoRLvRJ1OoPe7Gv8PhLfkj7GtClE3rwjK29WmOVaMlhJGjECQySfN2
	Wg+EmR4QYfa5+9pz/a4Rfv3ehVnl91MnKdB8yOsTlD0ZVsx9IW2jnHHK4/PRtGqLD9aEFqi0xkz
	Scujw6TGTduGAofCRzbpTd8771Eg7t+MCNQVBoTXYfQmALKRPHnYCJids7ZcM=
X-Google-Smtp-Source: AGHT+IHvK+t3RyIjKaNCRJHSF0lsNgux1FRjfJb7Y820KcKp5rPghSBOwl1IAFSXci0ouoP0BoEyc1UcQ1d61NKzM3g=
X-Received: by 2002:ac8:5905:0:b0:475:1754:e044 with SMTP id
 d75a77b69052e-4751c567b75mr312741cf.3.1741215034513; Wed, 05 Mar 2025
 14:50:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250305101025.2279951-1-george.cherian@marvell.com> <20250305101025.2279951-2-george.cherian@marvell.com>
In-Reply-To: <20250305101025.2279951-2-george.cherian@marvell.com>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 5 Mar 2025 14:50:20 -0800
X-Gm-Features: AQ5f1Jq5WN2NBjpsa146UgayYxAH8L0biqGumwPp8sUUsQ-SzcQC8JeVH7zSTCI
Message-ID: <CAODwPW_3BCfTcTu=K+6Q3PMe8DtWTiKFHC6+HO2q+cTqs=EPAA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
To: George Cherian <george.cherian@marvell.com>
Cc: linux@roeck-us.net, wim@linux-watchdog.org, jwerner@chromium.org, 
	evanbenn@chromium.org, kabel@kernel.org, krzk@kernel.org, 
	mazziesaccount@gmail.com, thomas.richard@bootlin.com, lma@chromium.org, 
	bleung@chromium.org, support.opensource@diasemi.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	andy@kernel.org, paul@crapouillou.net, alexander.usyskin@intel.com, 
	andreas.werner@men.de, daniel@thingy.jp, romain.perier@gmail.com, 
	avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, naveen@kernel.org, mwalle@kernel.org, 
	xingyu.wu@starfivetech.com, ziv.xu@starfivetech.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	imx@lists.linux.dev, linux-mips@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linuxppc-dev@lists.ozlabs.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"

>  static const struct watchdog_ops adv_ec_wdt_ops = {
> diff --git a/drivers/watchdog/arm_smc_wdt.c b/drivers/watchdog/arm_smc_wdt.c
> index 8f3d0c3a005f..794cf0086912 100644
> --- a/drivers/watchdog/arm_smc_wdt.c
> +++ b/drivers/watchdog/arm_smc_wdt.c
> @@ -90,7 +90,8 @@ static const struct watchdog_info smcwd_info = {
>         .identity       = DRV_NAME,
>         .options        = WDIOF_SETTIMEOUT |
>                           WDIOF_KEEPALIVEPING |
> -                         WDIOF_MAGICCLOSE,
> +                         WDIOF_MAGICCLOSE |
> +                         WDIOF_STOP_MAYSLEEP,
>  };

I don't think this driver can sleep, unless I'm missing something?
`arm_smccc_smc()` does a synchronous call into firmware that always
returns back to the caller.
