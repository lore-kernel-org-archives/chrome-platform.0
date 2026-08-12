Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E787404E
	for <chrome-platform@lists.linux.dev>; Wed, 12 Aug 2026 19:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786564085; cv=pass; b=H1n6GC8n9+JjSDtjUTFjtcDrHotaRuIKI20d6glUcwEJtZFMthrDxgO19qq4cEe5MsPoaOl+sx4mWLsVEdHJUz7Qrhx1cmYLvW1k3pTNeB0JPMD0gMCMzS3E36Rpq2652HAawZETT5QqBo2NzQ+uWEbYAVb7dqM4GAsa7k6maO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786564085; c=relaxed/simple;
	bh=1DVjTbKTXkhH1yUwpD/lgRqJn/mvRVunuCZAxUjSgDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rzIAY0SbEyWsJoqG2/Gom+VFw8pTgIqpgnozKjQwt/0XvBskNyE2e5YALf6PeiUQ81bKUgQFI5FcwR68EQrAef2JhFWEfX+M66tMX3F78XrZauX253RHHBfPbTY5qUbxS6nLqCEC3gRABB2maPJMA+xZnkJKcUbXv4NxuA+TeTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LqCbGhTv; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LqCbGhTv"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4994d67d260so1695e9.1
        for <chrome-platform@lists.linux.dev>; Wed, 12 Aug 2026 12:48:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786564081; cv=none;
        d=google.com; s=arc-20260327;
        b=gaxG3cUe3K2465Y5KTcjQ4PHkdNTcB4HtOFJ9lnCyygg6bTOgvFA5g1ftGPnRzxzSc
         JbOR//Hza5yLJUu4/1LcxSyn8fxJYZL9np0QUzBe0SSMqnzOemx4Jez4dNpomaQBUFGg
         pIIJUxPFD8TTrwVaOzgLXv5tSrW6hEfsPQKSqOJVrc8GmpALD++pSafWvAHu9MyAxNJh
         0KYeI5rQj3AWa70bk4uQEC4uSEeVNZpqucIcF7Vo5WGrTw+Z4m/AD2DIuuEnc6zqUHVw
         1UwzYfiUZiq+tj8hQ3fbOvZJRGkvyAj4MQTFOhyb8jlAbRSXrQcM8J1xnXvFOFdkc+L/
         /h+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1DVjTbKTXkhH1yUwpD/lgRqJn/mvRVunuCZAxUjSgDU=;
        fh=ic6d1XAEzDwn+sM+OksOIRHNZvsvkD9B6a504hm2T+k=;
        b=hR9TZGeFxmhDX4PL7Wsw3LPII5QqzjWgWIlh14dmu4DThTJqnWvUiAimqi8L2hCtDR
         AVHfRYOfnn8D5czCpy8i5oFDtYXNykhUuVh0/rXRyOUfw8rchPVqqsEHEB6LIaTxbTGa
         XNthq7GZL40znWEui1dSqmnQg3NeopRx8dmMBKxWXuUgBEjcSQLWSOrbxT0AzTGAmzlW
         OxvRYNCe7QGPg7QFDWX90g9NUBTI1dm6pWgf8QAmz8aqQCf2LbiYYAeX10+Itfd07gWS
         p6HSJB461TEPQRVgeG+8lJf1CmdI+Kdggrd1oFKeQyX7hPcjEyCSdtpdWqlFxFVQRumq
         xepw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786564081; x=1787168881; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1DVjTbKTXkhH1yUwpD/lgRqJn/mvRVunuCZAxUjSgDU=;
        b=LqCbGhTv/RdhhUa9zB9AgeGP1lCFVw5hNApSkHqoFa3V82KxpfFVE4pjkR0BJs57xL
         19tJ/z9LbBSVAKApsMTxJkRL0JZQOWgmd/gSXwVJm6RhGROXWZjMtO29hRL5VGNjXhpY
         WRllj1YrccTdFzhDxeTBMlZqLAL1JAknYHltI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786564081; x=1787168881;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1DVjTbKTXkhH1yUwpD/lgRqJn/mvRVunuCZAxUjSgDU=;
        b=RaFnDss1Fbzf+1uExKWpvsMBMWcfP+SwLtnDDsvRsKNZTCFt8lUmxBKZ+fmp+PnHy7
         49d3E6jIBUXTJ6EEyshqmrm+ecdalhRwc+8nbRrEVRBNLCdGhDBz8VpU1Bb8ajW7cL2s
         EYFqZyPp5V/yU35rE2R2RsEu/55PEO+S087bRhU/eMMMnWr6rK5LwhmDMRV5EC+5YGDw
         eQ6xS0i76755bIZcwJkqLQsCJaMdcqlvvBttSG70ecfbaFxJ8eE+NyDuKxYsr4jCKx42
         aSSgfK2uTO45RjhtQ1V+qatnj+A8EkkGevz5ypObexPNegWgMI7O2nO1+tAMr49qOey0
         tgRg==
X-Forwarded-Encrypted: i=1; AHgh+RrBg46bg7E2PDxoEDT4RfuzL3A893clsQZjLogNUBB1VZUJiAISpJh/UPdhH0hXRF3docOdYljc4eezI3WLi2g=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdBW1AUaJshIu907u4ooGCTiwszEcQVkqwkjnHTntSw0oHBWim
	le/Nbfg4+6gRGeuBvolVsWdHyJgDj62H2XFXieerBwx/iJHswM08tH/7qfAvZIShl8jVwj6mjJ8
	02lDwX1Yhpaa3nrAuCyEa4ft9nCMavF/MzUjqVvy8
X-Gm-Gg: AR+sD132OZnKRcJkY2dyc3JOHqwp4IJNlgIvWNNfFQE2qoPynLFJF66MpVHaY2D7xHu
	AZSNywdVUncRfx8wvGHKG/P/l+UsH/8JAgtwkk7Z8hkgCbe3RRLScg533TpkFzfi/IF7KARb9PJ
	sOflfBanMOM/NWx7k7iqXeGDttDbC3QFqgL+e/p7jeoh7wm+DZcvtMlSeO6Qy1HfTcfLByb/6Yc
	ecCDPj16ROPZ2jzd8QDGYErEfHz2x5rARfhY6gBNYB1jod9Y/95j657TsuDGmzyl5fS7Vj/DQ/S
	iSs/g0qvjjWgglwaUZTmbJa/Rd3xb5g+3KZqEJ49T6JYpSH4ZESIU0VkqMrcTXfrKly4VZ7C2cV
	X88s=
X-Received: by 2002:a05:600c:a29f:b0:495:4069:b0de with SMTP id
 5b1f17b1804b1-49981fabe30mr92875e9.9.1786564080986; Wed, 12 Aug 2026 12:48:00
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1785838269.git.sean@starlabs.systems> <6f65c9869714188539f2890aef6cf30e7bd2edcb.1785838269.git.sean@starlabs.systems>
 <e0d2a22e-a0cd-4a71-82c4-b88abcc7456e@oss.qualcomm.com> <04db0ee0-a8d5-4f30-a494-5c7f8ac757c8@oss.qualcomm.com>
 <CABtds-35m_cfT=Vm4MZkJYRe=dOPAKR6HYO_fu3SnwkdVQE0nQ@mail.gmail.com>
 <64d82edc-87a0-47c7-8a17-f0d1c806a294@oss.qualcomm.com> <CAODwPW8B2-i4Ne-ZTVUM_H-EZwn2hoaC4joRhxNM=CREDd_aUg@mail.gmail.com>
 <c8e4a3d3-a96d-4fd1-85a6-881e68385c83@oss.qualcomm.com>
In-Reply-To: <c8e4a3d3-a96d-4fd1-85a6-881e68385c83@oss.qualcomm.com>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 12 Aug 2026 12:47:48 -0700
X-Gm-Features: AUfX_mxfmohhDd7NwZ5OlHrJ4eVefwPyRshu_429PA-DB0FUH4Xn3jxZI6eV4zY
Message-ID: <CAODwPW__tskkkqSREHFAf9iG17oYfG5Li-1kh0y8pX=z0W_31A@mail.gmail.com>
Subject: Re: [PATCH v11 3/4] firmware: Rename google firmware directory to coreboot
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Julius Werner <jwerner@chromium.org>, Sean Rhodes <sean@starlabs.systems>, 
	chrome-platform@lists.linux.dev, Corentin Chary <corentin.chary@gmail.com>, 
	"Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Prasanth Ksr <prasanth.ksr@dell.com>, Jorge Lopez <jorge.lopez2@hp.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Joshua Grisham <josh@joshuagrisham.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Huacai Chen <chenhuacai@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Chen-Yu Tsai <wenst@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Brian Norris <briannorris@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Javier Martinez Canillas <javierm@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Eric Biggers <ebiggers@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	Michal Simek <michal.simek@amd.com>, Sven Peter <sven@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>, Kees Cook <kees@kernel.org>, 
	dri-devel@lists.freedesktop.org, Oliver Lin <oliver@liuxiaozhen.dev>
Content-Type: text/plain; charset="UTF-8"

> I do not consider marketing or pure "I do not like this name" as valid
> reasons, because this is developer string (or kernel/distro
> configurator) not end-user visible thing. And for us, the developers,
> this marketing does not matter.

I'm not sure I'd agree that naming doesn't matter for developers? The
style guide has an entire section about choosing good names for C
symbols, I don't think Kconfig symbols are fundamentally different in
that regard; they're still strings developers read to find and make
sense of things, and leaving something with the wrong name makes it
harder for the reading developer to find and understand it. (This
isn't about "marketing", btw, Google the company doesn't care whether
this driver is called GOOGLE or COREBOOT. I care as a kernel developer
that this driver has been mostly used for something else than what it
was originally labeled for for a long while and it's high time that we
correct that to avoid confusing people.)

> Anyway, defconfig change must be separate because it goes via different
> tree, unless this is non bisectable. Keeping it here initially confused
> me into thinking you are actually breaking use cases (which you are not).

Fair enough. So Sean, could you maybe split this out into this patch
which does everything (the renaming and adding of transitional
symbols) except for the arm64 defconfig change, and then the defconfig
change as a separate patch at the end of the series so that it can go
through a different tree?
