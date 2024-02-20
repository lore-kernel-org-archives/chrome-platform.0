Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DC2664A5
	for <chrome-platform@lists.linux.dev>; Tue, 20 Feb 2024 11:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708429722; cv=none; b=EPoo7jiQogM+2OxQBd95/ZXxQKW4WaqaZ0/SePiUKaHqKOJ3UXbhrHzjdVFR17UIF+Vx6cFDPItmnjhq0Xhyk/TmrCf/iYdzrk//+HbHcdupTX3NxG0FSI6ti73doiOa1Ld93uhyhfXpcE/ufBvwJPLzEQvIF5vdtwbQL/nDFGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708429722; c=relaxed/simple;
	bh=1paBppa9kXyF4t6jx2dx0KVwu75oULYWFXwh3w7uJhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EU2srKATBVvgxtmoxvD88iXLQ1SwW9YlYwf9zLOT8Ys30qHpS37N3QBgb/9faQJ2bZa4RDOeZboLiSOVAICtu02WUmkZa0EozWRbh5dC4uqBPImoYmjZqP7bnTRYlw/E/DcUHvcQ6xi0JjOpPLmNTDgWCb+gW6lpYQzx9dbMrb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=V62S1Jz/; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="V62S1Jz/"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-4ce2cd0cee2so382216e0c.2
        for <chrome-platform@lists.linux.dev>; Tue, 20 Feb 2024 03:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708429720; x=1709034520; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1paBppa9kXyF4t6jx2dx0KVwu75oULYWFXwh3w7uJhk=;
        b=V62S1Jz/17tCFx8uetXi0oSDK+WXUoLB3Y0R2/lOMdq7S2MGsvA5bgokwJD4TJkVm0
         ZnpkMrziFyqWTkLhS6H6TK50/WEr8ELntiWVsBDpa7lNOwj4x1HB1y/ZGxipbgQin3rb
         DA0GY0gpFFVQu0NwEmh73VbxVLtDWE8TpeNX21b5cPtId5KiW8M5h2I13axsqPeiK+kG
         Lh6TqBrSWdDqIHQ6CBhXcWUQTBoFRd9GBJ/0uYymf2/DIrH+qXRdTqG2J38X2KGvRYvk
         hG8XlQ0XBxVDmxwixlb6ofRu2ObQpW/II+c2/KcTFgURD6Y2VjUy8lA01M39WPvNmHBr
         guBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708429720; x=1709034520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1paBppa9kXyF4t6jx2dx0KVwu75oULYWFXwh3w7uJhk=;
        b=B/abbzjkg7k1pnRWf0TI8NLaDOfBgJwzJkXapXi40JsEo5dvoEJNRLTjJ++GZnErYD
         ZRw/kpXl520C1z/sOjKwzr8B8yEzyod77WHAB0Xq+b3rrqPJf5uzKyIbGj2vZAI2AEFv
         dG7u51mD6RLCCKEnCRFM+eIcFv2ruVRvoHv2dLd6tnMjM5hew1mXfRm0tZWCANHPxord
         2UFEpLmXcXKkhNt50oHeAY0j5gHMlcc/zbHOxdGLz4AcBiqqG2vL0PYdplNuT/WOjPKH
         Yb4Z/OGLt9phy/3OKL81qR36wt1yj/guuNfvznTMen4ZL5KasdbgrsitQ5IdvDMfj5cX
         QyxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVroMiv5fjLYBBD1rfjOqlFm00nu6Ay7ZnW/fpzPfFOdoqGFFxKTOzzJNnO7tSpMzgUiE4tQlghP2+TfcsdzQQ40kFqpWILG+mjY96naDbu
X-Gm-Message-State: AOJu0Yxgf3XqGn+ZONJlxxShvoi6LUkvwOOSm7UK1ddB2NzWg3uksRbg
	tKtIqaovTDUAVz/Kg2HPsHS4CMmnlhVOE9VbGPpA4EKnKvmHYyh31JsAoOejoVixDifG6YFAwqz
	t9LRixQ4CVwi8EFDoj5jick/jGocmaGwAAwVMLA==
X-Google-Smtp-Source: AGHT+IGSt+7LYikhDFYx0cLtpCAuzEqPHpTuVYE+MOnTWdXCL9GlyvAMZDlwfESCgNKoolfZRtNBCXYNBKzP3Qf2Hvs=
X-Received: by 2002:a1f:c743:0:b0:4cd:510f:4137 with SMTP id
 x64-20020a1fc743000000b004cd510f4137mr3182381vkf.16.1708429720382; Tue, 20
 Feb 2024 03:48:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240220045230.2852640-1-swboyd@chromium.org>
In-Reply-To: <20240220045230.2852640-1-swboyd@chromium.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 20 Feb 2024 12:48:29 +0100
Message-ID: <CAMRc=MfqOxOO3DXhvQ4W2THGc0vzkTTGWeoyDrzG6JWZB3Ao7w@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: Add ChromeOS EC GPIO driver
To: Stephen Boyd <swboyd@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Douglas Anderson <dianders@chromium.org>, 
	Pin-yen Lin <treapking@chromium.org>, linux-gpio@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 5:52=E2=80=AFAM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> The ChromeOS embedded controller (EC) supports setting the state of
> GPIOs when the system is unlocked, and getting the state of GPIOs in all
> cases. The GPIOs are on the EC itself, so the EC acts similar to a GPIO
> expander. Add a driver to get and set the GPIOs on the EC through the
> host command interface.
>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: <linux-gpio@vger.kernel.org>
> Cc: <chrome-platform@lists.linux.dev>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>

Applied, thanks!

Bart
