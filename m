Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8361E534
	for <chrome-platform@lists.linux.dev>; Mon, 25 Mar 2024 18:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711392334; cv=none; b=RsZeE6rx8cJlB6xpTSOXohFwctoTQ2dtW4HfsypG+AwWeN3XQufEDdlSS4ifeB90CTalSdO/uNNm7YLpLMnNLoqpSyFBhDR3srASeoN4pm/VVN19TQOu4Ge44/SN6LLNY2993skG3F6XmmrT3uen6aJtvRY6wWn6VKZ7lHZUCPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711392334; c=relaxed/simple;
	bh=hqfeXNrriRE+vaPKUWSarAmC5GZL1ffLl1p6HZH7H0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bMH9dEddos+kfmICtu55HdvgXPGpOkhOFnMyWBJIr0I8g8nEGvW1vMH2c9tLnkaZWE9u74yhwqtrVdE4ldV+rrFs/NtjT0xWyGOB/ZrGp5JnxAWOC7i1Wsc0l+y1L0u3CASOaOjzC83WJmfMlVzVhew2dsxSAv8MQ8tyKvOBDPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CU56ZVq0; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CU56ZVq0"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5684db9147dso5449403a12.2
        for <chrome-platform@lists.linux.dev>; Mon, 25 Mar 2024 11:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711392331; x=1711997131; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqfeXNrriRE+vaPKUWSarAmC5GZL1ffLl1p6HZH7H0Y=;
        b=CU56ZVq0fVbq0o8m2JsGV18e6GH77E51KTPqjkk6ewEPetaOhnUALmn1ZwyCdo0VQG
         rh3Q1BEfaSBv3fPARblL4h9zkN21+qldVkUeH354ncuomkHwQAu5I1FlehfdpxlrdTGz
         vNrUd2Aje+YcUb+LlFrQDA5+FznHgEex9oEf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711392331; x=1711997131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqfeXNrriRE+vaPKUWSarAmC5GZL1ffLl1p6HZH7H0Y=;
        b=hOsbHj5CtRB/h+4XFJC6dBqinTtycgsfTiem6vsQtmSOIOoca0DaoH1LU9tmsmdchH
         Nmwl4IK4nk9EKleH5aDy2bBCwjxI7Whlx1joxlyQV2I5jZg6rl6vLK4faDvV/MOUVCUs
         Qom0Tdrr+ma1g99InGBDS3TV+3uIwYVZQEPhOfxeeqceJKcWR+AdqWfqC+sE3x7baR6o
         5UPG0l1HtsksV0WQSpkzenP2ytJLdNmP/RuPZ9YoXmn3D1m1aotWq393VXwT1SoVpbmY
         3FRRt/p2qnFgHA1ylB9xxzsPhCqMplad7U65rcG+3o98QxBgbCZwt6bo6KFlWNkE1W3j
         AEeA==
X-Forwarded-Encrypted: i=1; AJvYcCWwnWu8Vr5bFKsaUB+C91PcRcHbSc03gBQgtUXoxqOnI7cRVMl0qoz/CQaI7mKJ4vNr6deKRNsZIkax1Rrlq1fjr7+2eHQ2NXvtClvYanox
X-Gm-Message-State: AOJu0YwoCXeo2KCYvMFBCkvBbedf/CXcgCfOz6vrbfyqmoX1JJWqLqV9
	ILWkBCXcgJOR43EkMLglgIz69aKdzBRgXQtQu5c3rf4lwTHG7Ow+R4uQK1Mcw6qotDKr+raTSTA
	=
X-Google-Smtp-Source: AGHT+IEGrw70cEfyyP6GTE2jUfDWqFuScNGj9UYBiIughHMA0DV4WhGh50H881G/mpRkRznxNDKp0A==
X-Received: by 2002:a17:906:128d:b0:a47:3796:1ef5 with SMTP id k13-20020a170906128d00b00a4737961ef5mr5294710ejb.5.1711392330780;
        Mon, 25 Mar 2024 11:45:30 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id m23-20020a1709062ad700b00a46dd1f7dc1sm3318991eje.92.2024.03.25.11.45.29
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 11:45:29 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4148d1b4a26so665205e9.1
        for <chrome-platform@lists.linux.dev>; Mon, 25 Mar 2024 11:45:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWHDwMmcj12sY8vetx8d7CsxM29tC5+qhLzhHKhR08sAlJuusY+JDF129PHHoxa32PnwkOIg0iyadJnv74sVqEhODnZOvYDIHGun8iPC8zA
X-Received: by 2002:a7b:c4cb:0:b0:414:24b:2f4e with SMTP id
 g11-20020a7bc4cb000000b00414024b2f4emr5741343wmk.39.1711392329122; Mon, 25
 Mar 2024 11:45:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240322102800.1322022-1-s.horvath@outlook.com.au> <SY4P282MB3063D447DA09D35F5FBD4721C5312@SY4P282MB3063.AUSP282.PROD.OUTLOOK.COM>
In-Reply-To: <SY4P282MB3063D447DA09D35F5FBD4721C5312@SY4P282MB3063.AUSP282.PROD.OUTLOOK.COM>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 25 Mar 2024 11:45:13 -0700
X-Gmail-Original-Message-ID: <CA+ASDXM9=0jQA=MWpBOttUT7k67wmEDFGoOObQfYm=ca_HL8GQ@mail.gmail.com>
Message-ID: <CA+ASDXM9=0jQA=MWpBOttUT7k67wmEDFGoOObQfYm=ca_HL8GQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/chrome: cros_kbd_led_backlight: Remove
 obsolete commands (EC_CMD_PWM_*_KEYBOARD_BACKLIGHT)
To: Stephen Horvath <s.horvath@outlook.com.au>
Cc: Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 3:34=E2=80=AFAM Stephen Horvath
<s.horvath@outlook.com.au> wrote:
>
> EC_CMD_PWM_GET_KEYBOARD_BACKLIGHT and EC_CMD_PWM_SET_KEYBOARD_BACKLIGHT
> are marked as obsolete in `cros_ec_commands.h`, this patch removes the
> usage of these commands from the driver.

Just because the EC firmware repository marks these as obsolete (and
yes, we copy that header mostly as-is into the kernel repository ...
but it's still a firmware header) doesn't mean it's truly ready to be
removed. I believe the intention is to direct *firmware* developers
not to use them -- any new developments should be using the new
commands.

From a kernel perspective, we could still be supporting old firmware
on old devices, and so we may want/need to continue to support these
commands.

I don't know off the top of my head which firmware branches support
which commands, on devices that have such keyboard backlights. (The
Chromium EC repository is open source though, with various firmware-*
branches still around, so this information is available.) But without
a better explanation as to why these are truly ready to be removed,
I'll say "NAK."

Brian
