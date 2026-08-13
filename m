Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD363603E0
	for <chrome-platform@lists.linux.dev>; Thu, 13 Aug 2026 03:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786591809; cv=pass; b=A8R586zks4BEUuG5V0wLFg+iE8gIBZa/SSIDtH+KfPVeLOtbO4QxuxkOytXHDRWnre/5/5cPSxk6P35NhnmASZun3EcHovwwibVV/y05gDIZ2OoVss+ZlTmZI5gdEARnVJKRwL5HvoK4X/sHq7aEEqT9CiZRgR4C+4mzHJOAIwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786591809; c=relaxed/simple;
	bh=vnxLhaj6tQ8Clxuh5zpbuIzE7N05yzLZnFlnrerBSX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q6+9AqzTOP4KSX0uX8+zowpszPhfitYiWk2SNCtGZ97ElntRtIetwSGP9Di8zxI5hqhM6LRnm76jC0YoECiQpa46coq3vq6jo4whPImH3JdcrculSsj7Ag+CLBIJXXAAIOa8rcHlhNA3pK5Um3WDVASn7utF/vcXx/mBeX4S5Og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VhBdQgAx; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VhBdQgAx"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66b13ee8801so2363342d50.1
        for <chrome-platform@lists.linux.dev>; Wed, 12 Aug 2026 20:30:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786591807; cv=none;
        d=google.com; s=arc-20260327;
        b=pb18ZgRmLjnjI8S7KMOqUTcUXNe7Vube1tdHq9z4LpG4zDcr3SkH1v+81PpXCvcWhp
         ILyww6CEQmIo8nouIwqDSBOfgUTGY3peCYTFIXXiYa5XzcQGaB8vdm7619qt3jr+RHwT
         M1DnbM120V5LCCPXNQOE6P9c+K6icYAOvGtKU8l4PF6hO8gXnUfuJ/78LZ8eXEBONncj
         Cr4SjOY1Ke100pVIb1iWsF7ki6oKwHjBwmkM7/Vjfs8zUFY4ze9/mDgxQWdxYd0/SWUE
         2ZnyluUltiMZk+cUeUhoXZlR3E9FgBJ7TU+fPbnOgClnYPcTWiG8cnrcRAqBS4Qf5tTD
         QK3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uAJYxuWYQfJvsQUaJRIL+oMrK23LCX8rJso9NIjzZ+0=;
        fh=3JtZBybbsr20+FQp+h2RRwWrmt0ia0+T60KRD87WFvc=;
        b=XSxY5gmBAZ1hjFNX6sNk/rQgYtqd85dZ6KTri84hLoSbC8A/w7hpQEmZN7/O/mbvkq
         TnXbrxFY2ntBpK2/X/DEhKm5MQ16itx0cqfgDSrHHjxnm6HdUhGnlit1aqjQ5O8CtaAE
         WKlNZAiEF8Hjw+15vRWC+pBNhOTZaujJyKBoSwfOWu1TjWi7g9/CCpTDjdrZHIUoVd0K
         TZ3rJMfnQfuBvaoY2tW2P7ChbsnOSmtbnJwwTHnS9Wz0atW5bsgPaEio4kI++VZjVo6j
         02tMyI0xcwLc0m3NDioAeSP4JFHmp1dPULDCgWYC/w22+CiLt4YgTFOb50MPmj/hBBjV
         olTw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786591807; x=1787196607; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uAJYxuWYQfJvsQUaJRIL+oMrK23LCX8rJso9NIjzZ+0=;
        b=VhBdQgAx84OoskvwX5rIZOScu51pXyXI+7Bp+Dras2PvsvK+Fhae8SMZiL51qPV/Q9
         hdzJaRR4aUuev3nUnWZ6LoclSUutCNo1wNXqY82ta499nrBmZf2ROFIUyyFE2rgIV/pZ
         4FuMNbXoAa+cNsSCvF2dy/I3/gN8q7O1pSfw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786591807; x=1787196607;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uAJYxuWYQfJvsQUaJRIL+oMrK23LCX8rJso9NIjzZ+0=;
        b=ADHeZNuo+MsCsYRSKdLEc2Tkz9KCYStVB3Zu2A1lj/+cYgI3ybf0wbgMmxAMuy/Jcx
         bzVcwvSVnR/XkS6ga5yxX67ILjZ39bmjttClEyDD5/p45tCzizgQ9/of/IdoDR/NbXbD
         q7mfvncbV0C21tFHGseitwqUQOpEWbWsD7ved2SUhcCC+eqQuFjsLK7wUogERLdBcjAo
         uJ+7B4QHnkSaHEBG70+OtX1sVz5eSFZtIzLgGXbLaI1Zl/7dDa8wk+twM+x89puu+pxI
         LDTur2O+91rpFZxLQ9fG/DoTSxoSsOQv7VT+cRejiPBLTCHP+SwNdMVAa9DQS0KJjw38
         w72Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqv14/rEHIT8PBNxzu5E2S1QVgZ0XtfdhcL3hvuMTosmFUvaSGruNTrRJuokBjqD8hIPahGUBWUOCCVsTMtC0w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh2xoESZlVSdFFamX+11xUCpY6oK5nsnBT5JGv7dUoskEEe57x
	8Hgp46uSS6YYKuDx6OwZZAttEfV3N5IFTegAFd64DuCeNDwv9uBcVCg+Xmno3BA4/lhwN8TO7QY
	4k9r1Q0g2/JtqAvmH5VHTmwzSTrzHvlsCU2XU9IbB
X-Gm-Gg: AR+sD13iRs4li+xiEyfgspBbp4g2LKyVNnghbcaC/rWJ1zHoPGD+nazos8WxO6OSJyg
	Cj3BMtq8lUcHvo+RV7/io7uoeHk/DWQPP8r/B2wdYU387T/TLWFMffPLWA3U30iBzQhXD9FklT3
	XW8f+IvpmFqPj8BYmXON+MRW4MlnMEP15u/mHpHBnoaKO7VQ19SpyNiGI6956xUa4sIIgkaWkWN
	86tCzOwqXpNhtgL/yQBkQXMWLQ66VYwb18gF56zpnJioNu9VfO75nSa8qjAFz/qVShqxdxS7+NQ
	/EM++JFDk34B+h0ioT4TZyPU3uBWXvAjBlGhJgoCyP2Zf5a1EOTv3TIkzY5+yh5ET1qhxo3B64p
	46Z2HDeNMpA==
X-Received: by 2002:a53:e5ce:0:b0:667:bae0:e565 with SMTP id
 956f58d0204a3-66c515b62fdmr981398d50.30.1786591807078; Wed, 12 Aug 2026
 20:30:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811122011.3539250-1-wenst@chromium.org> <20260811122011.3539250-8-wenst@chromium.org>
 <an02idvk4GtZIMfn@google.com>
In-Reply-To: <an02idvk4GtZIMfn@google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 13 Aug 2026 11:29:55 +0800
X-Gm-Features: AUfX_myrCG3oNTwmlZwHDJSbsoCHFr7jcGIFmX0-QgCkqwSa3XLy1HbTAXteqh4
Message-ID: <CAGXv+5Gf0sYKvvd=JsdPsahvHCKr5rk+YiVu6SCY6ZQicJzd6g@mail.gmail.com>
Subject: Re: [PATCH v4 7/9] platform/chrome: of_hw_prober: Add delay for hana trackpads
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jiri Kosina <jikos@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 11:14=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> On Tue, Aug 11, 2026 at 08:20:07PM +0800, Chen-Yu Tsai wrote:
> > Up until now, the MT8173 elm/hana device tree has set the dedicated
> > regulator supplying the trackpad as always-on, simply because the Elan
> > driver was missing proper delays. As a result the delay for the
> > Synaptics trackpad was also omitted, as it was not strictly required
> > under such a model and delayed the availability of the trackpad to the
> > user.
> >
> > The Elan driver recently gained proper delays after power-up, with
> > adaptive skipping of the delay if the regulator was originally
> > on. The I2C HID driver and I2C OF component prober library gained
> > similar adaptive delay skipping. The device tree will be fixed to have
> > the regulator not be always on, and proper post-power-on delay time
> > added to the I2C HID device.
> >
> > Also add the post-power-on delay to the ChromeOS OF component prober,
> > so that if the regulator is off at the time of probing, the prober know=
s
> > to wait for the hardware to initialize.
>
> > [...]
>
> This looks harmless even without the aforementioned patches.

As mentioned in the cover letter, it is harmless, but will delay the
probing and subsequent enablement of the trackpad.


> Applied to
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux=
.git for-next
>
> [7/9] platform/chrome: of_hw_prober: Add delay for hana trackpads
>       commit: 81c1c0cb68a13d14dd1bbffcf4c49e26f9a6478c
>
> Thanks!

Thanks!

ChenYu
