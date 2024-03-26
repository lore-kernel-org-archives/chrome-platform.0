Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF00218AED
	for <chrome-platform@lists.linux.dev>; Tue, 26 Mar 2024 00:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711413562; cv=none; b=qM/T5tmgZQEOdvP0P12EhXw1hZDBRvouOXCz491YKfuRnbfM/d9e4rYJRXpKNfefVXCpiLdQw5GNTj4boBaJuejXYi8d8nrt/Jum5iD7eWNTH357apcBkEHcAhHGxywn6RFjRCpOoP2xfl4FjwTBN6u6LzfwPl/bfAGWvuR+aeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711413562; c=relaxed/simple;
	bh=9gKlpAbqJ9G3tiym20+wEsqTadiIAcUeSc98kxAYpQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n7MtpUOpVOGtOlQ3Gsy7CEbqoBroauACosv2uGOJxKbwELSAc7Xy/0wDSdGpbCXWGY2A2hFj1Tzzkh00zonGY+RWKign8ypZRwGBqr6DpQuY+LBLXad6fERTpERbA/Iw2JIEfTXt5h3Mxl6O1p0ReYaPLsYfTqOVuWVv7y4pLUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NWkIuDSV; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NWkIuDSV"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-513ccc70a6dso8508180e87.1
        for <chrome-platform@lists.linux.dev>; Mon, 25 Mar 2024 17:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711413559; x=1712018359; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gKlpAbqJ9G3tiym20+wEsqTadiIAcUeSc98kxAYpQQ=;
        b=NWkIuDSVMi4nWdUXYTpEesfQBFGq4wSZqNpiyusvQaAxePf79ysAilj2T+ckK5VTQw
         7bAio77t+f0zEW5R34kNTfCfqpEDSjRwBPs7OyG+dLhjrB0MV/hbtdcnLwINoHWSCNQs
         oFoAmXP9Kf7hk8Zrye784+RD+58V0wRbLUzhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711413559; x=1712018359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9gKlpAbqJ9G3tiym20+wEsqTadiIAcUeSc98kxAYpQQ=;
        b=MjtrpwPI3a3SR6c6F02b5CWCTeRvVT3xseRLn5RWJflgGJQfhUN0YhG2CtjUMcEPFg
         aRC4mUkDEE7qOQ7uJJaCaC5NNh7dDoHw8474om76FKMbZOhNXBacZMz6lbc2QdBllplT
         lGqUl5FvU4RCYSKBfxR5aRHVveR998AppIbGGoIUp+bCu4m4mZWgWYV3E8UOHnKTbXxx
         5IptLUNy7AwEUfsfdXFoDwcgAz3qewHgGSgRhGxrIDSz8giXeqpx3jsLTruNpKJ2jTb0
         mD9IMDLPeqcRqop5MfQB7t4+DWceZh9cJUqdPhFquUDyAn+9CHGb4U2neYwiUQofsXRG
         WBgw==
X-Forwarded-Encrypted: i=1; AJvYcCW+d80xjwKbva0jFVdsGt4MDvHf7+bUzuqtPRqvGWO6H2wbvIK5Fr+ycSXaqXUpUtyRSkxkkTjXHPR/0dRhEGETMeCC0RiOm/AS/66e8Mdo
X-Gm-Message-State: AOJu0YzyRczaWloMqenwa1JzZMAj+4eOLtkGB/qneE1xBhHiLM1/i05x
	J00oZrHynsbcyUhQaFVmpWgL573oyiEev8+DH6JgtVHBXWc0UuzVG5AD/1p/EHL+rG6ViOy3MzE
	o4g==
X-Google-Smtp-Source: AGHT+IHsTab2nrP/RF6EbzgU8b4dKzhe0CJRFuag6L8ez7pKPMH3FI4yQ5Kqbm48vQi0R2+m/SosJA==
X-Received: by 2002:ac2:4841:0:b0:513:c50d:db59 with SMTP id 1-20020ac24841000000b00513c50ddb59mr6731005lfy.15.1711413558797;
        Mon, 25 Mar 2024 17:39:18 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id x18-20020a170906b09200b00a47df55cf5esm2072084ejy.13.2024.03.25.17.39.17
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 17:39:17 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-341cf77b86dso1188801f8f.2
        for <chrome-platform@lists.linux.dev>; Mon, 25 Mar 2024 17:39:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUPrJ596aGUbuKER7H4iliJAR+4/tv1FqPVl55FEAC8gGhnVsNCRbAVcfQX8fs+9uTPE6dTmKhH+0ytNJdDxCb3G+BeihPbTlVuExLvSB95
X-Received: by 2002:adf:e045:0:b0:33e:db44:9a5b with SMTP id
 w5-20020adfe045000000b0033edb449a5bmr6963918wrh.14.1711413556919; Mon, 25 Mar
 2024 17:39:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240322102800.1322022-1-s.horvath@outlook.com.au>
 <SY4P282MB3063D447DA09D35F5FBD4721C5312@SY4P282MB3063.AUSP282.PROD.OUTLOOK.COM>
 <CA+ASDXM9=0jQA=MWpBOttUT7k67wmEDFGoOObQfYm=ca_HL8GQ@mail.gmail.com> <SY4P282MB3063048C537120C8D3477774C5352@SY4P282MB3063.AUSP282.PROD.OUTLOOK.COM>
In-Reply-To: <SY4P282MB3063048C537120C8D3477774C5352@SY4P282MB3063.AUSP282.PROD.OUTLOOK.COM>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 25 Mar 2024 17:39:02 -0700
X-Gmail-Original-Message-ID: <CA+ASDXOj71wn1D1fxcScoLFpMFCN+-1UU9a7j=6FurVDsp4nug@mail.gmail.com>
Message-ID: <CA+ASDXOj71wn1D1fxcScoLFpMFCN+-1UU9a7j=6FurVDsp4nug@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/chrome: cros_kbd_led_backlight: Remove
 obsolete commands (EC_CMD_PWM_*_KEYBOARD_BACKLIGHT)
To: Stephen Horvath <s.horvath@outlook.com.au>
Cc: Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 5:30=E2=80=AFPM Stephen Horvath
<s.horvath@outlook.com.au> wrote:
> my laptop seems to support both so I'll agree
> the older commands are probably the safer option.

Huh, it's surprising to me that it supports both, if one was marked
obsolete. But I haven't tracked the development in the EC firmware
that closely recently.

If the old command works, it's probably safe to keep using it. But
it's possible we'll eventually see some device with firmware that
doesn't support the old one, and we'll have to update the kernel
drivers for both. Note that there's an existing driver for the newer
generic PWM command protocol:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/pwm/pwm-cros-ec.c?h=3Dv6.8

So far, it's only been used on Device Tree systems as far as I can
tell, and one would probably have to wire it up differently for an
ACPI system. I just mention it as an FYI.

Brian
