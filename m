Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC045D462
	for <chrome-platform@lists.linux.dev>; Tue, 20 Feb 2024 08:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708418338; cv=none; b=odX4544bMKVsKs5PaOhldGrF56bA4vvp1t2M/7TFSCoLs1Uj/uOy/NU+W4yLEdWNWhyYBfBVLbpTWsUAyRtOg7JT6H1/vzIlhK85NnT6JjOtBOUX1WYCTOu02WYKRBiTYvNCg2qxrTg9XPmxa3nlxUV5HVxTdxnKq5Xpv5uE76Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708418338; c=relaxed/simple;
	bh=xaQQvYpzmBVHnCracW1/zWSt6cgfuwxk6XJIuCevoKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z8eYcmVvi/HIQ7hexE5StHtgnJO5dyWal3dimwXI6BRgqVF4bUDf6RXRAi8YoraAc/dLaiAT2dCdzFXRtBHGCdh3OtAMlMeXPSAkxo7gn8wWIpz7r+89xvp6ulUihfPHkkm0NswvGm1cV6A4JHGLHe65xswAXA0oG4x6Rwpz+oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u5ctaNuf; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u5ctaNuf"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dc6d9a8815fso5016488276.3
        for <chrome-platform@lists.linux.dev>; Tue, 20 Feb 2024 00:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708418335; x=1709023135; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaQQvYpzmBVHnCracW1/zWSt6cgfuwxk6XJIuCevoKo=;
        b=u5ctaNufKP+d4oUrcE+PC1kdk2QqlxFV1+dhxpVuI/VlQQ2bUW9S5J5CMnSlA5+KqM
         5oNm4Q6mhly/aD93Yh10T1xlOLxF8cKAc/6+N2b0IKvLXNHgGhGv0+lxRVZOKsH04NJO
         4nxnJA8xSf3TtlIEm4tc8CqnsInppFDbXQiyvp/boCePc7vrqQfuLfYj5Rf4e/LvuMzj
         MH5PIr65s3lbSO3i6hucc/8U6Cql47f/KU5asnjLCOFCG8Q+RbQ0f1hHRUUjcT/zKpno
         PYMkgrPjth3zkGqQf8BCBcjqJ18wIP/ArnzW6gQzVh19cbf0UNeZ55QUqs7iqALo9Gnl
         uCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708418335; x=1709023135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xaQQvYpzmBVHnCracW1/zWSt6cgfuwxk6XJIuCevoKo=;
        b=jOGX4XxYY1NWk/XugeN4bLczTf1JtUdUZNf5VIzbQrkmvsD/+MVicfCAd5CnCfyUAK
         sKI6/jQqNg3r+4jheGrOpm61k3cL7fU08oaK1xDBRbef+Qea1Q2eaoxlTVZCBA0ngZzd
         8Lif3rF0cFk26aFqeeYzQ3zPksMh1qF+UaRkgOGT2N25baUxjq2bcBSPBXKWDy0VK6KD
         u4yGBj0TcxGWte+z/h03zFl85YIumtDBndWJVrwZ44Ak441J2VHUxtic01YDU4wf4ke1
         TobzPeTiJBfQ3cGyT+t0a+KoM/m01zUA6nEXZFWlbXsavkv7NAqGRedpnjWByMCzgUEV
         arzA==
X-Forwarded-Encrypted: i=1; AJvYcCUPKOUVYD5T16W4reillHdtaZe7e591isXZeRDn0GbksTwgm+GKwdrbkhGIewRvFfUDuAgFANgn6+1xhFGoIaJWtyR860bmFvX2yTqR49s6
X-Gm-Message-State: AOJu0YzMXDC8/NBgPO/4jHpa69uV688njCg+H0EYJzH3jw6BSAE4qVt4
	ynPVBrBdgu59ocjD+FCJjOPdOxZffpXw+l14FKAv0siqy0K7maMuYToaRS2+lzpmamcwtYILrqz
	Re6/8ywTI7yO6tWpDCNlHkXfqEIGCJFXwPUQldw==
X-Google-Smtp-Source: AGHT+IENmsrAW3hNZ65FtN4Wch6Ui7UqnKl8CYVsXo+LBVt7opEcneA5tQP/7szbzlwQuVHBwtF33xDyl73OiskgVQo=
X-Received: by 2002:a25:83c4:0:b0:dcd:59e4:620c with SMTP id
 v4-20020a2583c4000000b00dcd59e4620cmr12705446ybm.49.1708418335046; Tue, 20
 Feb 2024 00:38:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240220045230.2852640-1-swboyd@chromium.org>
In-Reply-To: <20240220045230.2852640-1-swboyd@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 Feb 2024 09:38:43 +0100
Message-ID: <CACRpkdY0DE-XxPO3vj34zmMvGj-sfGrjkkwGLuCKFdj=ksMJAA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: Add ChromeOS EC GPIO driver
To: Stephen Boyd <swboyd@chromium.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>, 
	linux-gpio@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 5:52=E2=80=AFAM Stephen Boyd <swboyd@chromium.org> =
wrote:

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

This looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
