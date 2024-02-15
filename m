Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA471420DE
	for <chrome-platform@lists.linux.dev>; Thu, 15 Feb 2024 22:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034428; cv=none; b=Ws4b9i3P0r4EEsIg9IcaV4yRBv38bVbEwa/4fk1L3aMY17697CSBovR6OA/016CzqGEnPOq3uIJQaFZSbwk7drPzCgn26r7hD/b2XQYKDPVdPtAyOHMlCJzAPf2sLodAYPw8GBIzsz/Bgm8sDEdIMIdR52CxHhEX39eqX9qlAhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034428; c=relaxed/simple;
	bh=m0ottLDJAZHNYRCNzmWiH7yuWIWrCPNNHSBS/QgSsrU=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f1TNe1QHHM4ZQt3gI/Sb1DgkFfPKwVSgZyzJCqQEtSe0dRqC7BMVdoLDXmejUrwjOCSlInFTZRvilhK26d83EWwjC8YbSP/W74RvNp0KBh2usok/4+SA757eeXc3sh9p1aojL2j6Er/+3aSh2ES38zqF4SvIGcgsvrmP99ThVUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V0WuFR4k; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V0WuFR4k"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d180d6bd32so2013741fa.1
        for <chrome-platform@lists.linux.dev>; Thu, 15 Feb 2024 14:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708034425; x=1708639225; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDDVrcRz/Ycf8cdbcrLManVLDT9HHxZVyCSEzgV1aZM=;
        b=V0WuFR4kwvL1Eb8QsFxA0Dczf/TyJFiyOvkIYvIOZP5qUTFESJ4xistnL3vldnamQN
         gRy70qA2sZbMDjpa4poQSdsGbPJYzJVXshcCiHvnmw3VM9fOXpyULx/PJSnJJSP6f0tG
         lWVtzL0yiUt3oYS92scB8Nwr49AkeA7EGSMDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708034425; x=1708639225;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDDVrcRz/Ycf8cdbcrLManVLDT9HHxZVyCSEzgV1aZM=;
        b=bu0dGjc9YRAif7OBaMtNid4KzMi0HbxQarfuk/5UKq4uSK32vAop3qL8PcIUT7XT3J
         PFYPw9Rvmj1HFrgcOdcAqN2WyB4zrgwvF+WnMh15/W0Vo5P6Zg1igFLmLJaHdkR4VCeZ
         9SzhhdoOwQPmun2c5k1Gsh1VRvCGzWqlUy9RwcGkEhLfH3PcgscKK6nLhKGi+o8+CWXR
         1/1peP6ggzX7GBr8SYVmrBQNnmyyNuO4FoFMGWEjf/36lTw8m6oYO+nGctePRE8RL5mQ
         F0DOVUDJXkt5ViYfAGGbW9HBe2s0Vn6p5LTqIdXBfNvZwrt2xCEcTzdowWvvTsOKU7Eo
         UtOw==
X-Gm-Message-State: AOJu0YyT/hRGVof0918PzbZpsmhQLqszH9IZalpoeifX9q/Lrv4Ooc2V
	qJ2Lkej74xtTV2vGiRJAwcVFunLh1wz0Scz88CdX25hlawb0UQveytkKBM0uJrvcxknKqlpMg5O
	+OScPFVnVzP/YwEDizY8DwmcCm1U9eid0DoHQ
X-Google-Smtp-Source: AGHT+IHZsX1oCvcJlSf5XfTcHW/43KxOJRGh8S4YaM6TXMZR2b4sKxAd9QenLzmlOUm+lpukKlbDAdnYnvVvVUmkqm4=
X-Received: by 2002:a2e:a98f:0:b0:2d0:c490:affe with SMTP id
 x15-20020a2ea98f000000b002d0c490affemr2710448ljq.19.1708034424733; Thu, 15
 Feb 2024 14:00:24 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Feb 2024 14:00:24 -0800
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240215140638.GA4162082-robh@kernel.org>
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-2-swboyd@chromium.org>
 <20240215140638.GA4162082-robh@kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 15 Feb 2024 14:00:24 -0800
Message-ID: <CAE-0n51R307Tg7p9=GNFfUB2tE0o5JWBNpU=rX_HUe9ydSXW7A@mail.gmail.com>
Subject: Re: [PATCH 01/22] dt-bindings: gpio: Add binding for ChromeOS EC GPIO controller
To: Rob Herring <robh@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Rob Herring (2024-02-15 06:06:38)
> On Fri, Feb 09, 2024 at 11:09:12PM -0800, Stephen Boyd wrote:
> > +
> > +description:
> > +  Google's ChromeOS EC has a gpio controller inside the Embedded Controller
> > +  (EC) and controlled via a host-command interface. The node for this
> > +  device should be under a cros-ec node like google,cros-ec-spi.
>
> Why do we need a child node here?
>

When in Rome... but I get your point. I will work on moving #gpio-cells
and gpio-controller into the cros-ec binding and populating some child
device from the mfd driver.
