Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B552405FD
	for <chrome-platform@lists.linux.dev>; Sat, 27 Dec 2025 18:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766859287; cv=none; b=Jz+VG08+AV1Fj/6+BMYTiK8PNdFQg8KfEvvCvZJX9pXNbZX+pPmdIll4cKDQ9CKLKBDxG4O64cbdbg7PNcYjVN7WgJhQleTIOYkg2762jeOo0rLicACquo32FrU+e7VmyDsLuV7nyu9ElwZsg0R2ClJuzKSGvwLFciTo/DnJB9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766859287; c=relaxed/simple;
	bh=jtZl1rksLgH4OhhMZngvkORRQ2UYOOaPcULqCG0VIRU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=ENhS3sD9GzlYJAxMSdguZ0yKAwVpVgBu5dLSqRIyDQTcOFTBWtIPkNLgukMqwc9NZ2udqXtwJ9KHFVl6UL/2NWZ3LzO2p/NC5D8QtohUWX+9NqKd8QRyHPuNGm3lpr+IWiUOnKj8ERGhJu99Ph4yMUgCM6y1o5Zc376eA9ZTFlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1nHLj/1; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1nHLj/1"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-55b0d4b560aso5843221e0c.0
        for <chrome-platform@lists.linux.dev>; Sat, 27 Dec 2025 10:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766859284; x=1767464084; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ghxu4ot+eFHQNDRPaz+Edo5yrH+9SNDJLR+N7OfHFPo=;
        b=M1nHLj/1KCW+KBwPeLz4RqHhVg48VFT4LJhrPH6vMSCyntmNEV9QfZ/QL6RLy27Gpv
         lwABQap9V9upnRwl9uI9NKeHW3S91CGAz6b0yZh1B0IH831PhnCRvG1rWW6p7h7an4sC
         54Ylka55Ndiu5HLd+PQ566OrOBCFvTxjQ9mdYgAGg8DYhs0R6i/sAAnYE4eTDMmW/fze
         QIV3+4too4d2IGTHD4SLRqKYnSHQuz4RC82OEDiWgZxkxLgEbKm3dIAItBzROequo/6v
         S2Br4+GNd+1lX2Idgks6UHx0WEzTjywLpNnydeMhC+HoIG88W3hxau+67vyywBuZrvoY
         0+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766859284; x=1767464084;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ghxu4ot+eFHQNDRPaz+Edo5yrH+9SNDJLR+N7OfHFPo=;
        b=TS3OS8/H00cUnA8lLdnF9BOiQk2He63IzHXMRDnh0dMFLLjRMhDvhGZM4iKdTOcaj7
         2jIZRmNCB/tC2/xyPOsH/eFpZ/s+5DiSvJ6lovoWJSrXTcavY6OiaPtOGfiio9Vdpatv
         0UcFsWdsdxoSy/1WxRB8SWsgFiM6kU2qcI/31vOiLxt8zstZn9xj+y3MRsP2LPAG/lhI
         zn/oWaStiRw4bbtJbGLpPx5U/ycvM9aMxXbwJ7oc2qbcmf7pj2IQ546k/q4y3QMatG32
         1BDgjYp0InM3XA66pQds6+zOEr6HYAl+HeqtyzShEyKoubsQQvNMdE5vKO9itvUmK7o5
         kBgw==
X-Forwarded-Encrypted: i=1; AJvYcCWg5OyEK1Lkc+wm23H+wAEWBEgZaExj5pur+o+cuQxvW8aaSG75LvusojuzFXmmYgbczuEbjcDZzO+J812mP/k=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJQHQSY+QLovGvdZ405xOr66uwQXcTA7kgfHRSkJWsDmX1XUG0
	SHt/tufx7v1TOdh0l6HkbBdaf8w9hczFcF2dw3GFwXk4Ll6RuQBfhL5Bna+4UA==
X-Gm-Gg: AY/fxX4lip90IC5e77vvK9eGadcMBeTW2bOsH6ImrHXMpxJl49RV+1qM5zGxYAh1ELB
	2Kxs+QMTXnMZonGXjHFjxGF2+FavI8d9Bbs4OjKJnO8e+tWEDqp9VnYao949aUlcNVuBI5RZebo
	u97a2epIPGmtznWZpWq5IcNYkt/y+i5FHnFlWeYgKo76K+iOBmFm8m/FLvwJpAbLwFvT8PsGBy2
	zATwFl61Oif5fb0k/Zg2/2dFgrnJjKv7kSrRTUXX8umxc8jXxOfGx6GGI6jRxYplNKetTNF8OuB
	rKcrB7g5D4ymv1R7d1JBmm8fLUBD1N10nNtvZrIRS0tt+hViKEQ7Do/Mf3iszBEEPYRZTARozoN
	1jq3fffmt3PZlcI4ezZCFVC1nYlCRQgq1ojVQHYuadqLiClQtX4/By6dvV2PmSkQHPuUhGDR0yX
	6OqQ==
X-Google-Smtp-Source: AGHT+IG6QFsM11nSf+wH5akB4IrY1tT7ey0vsWf94Wek3IawljHIPBjEQqvpOIg1Nj26GugIf5w2ww==
X-Received: by 2002:a05:6122:4f9c:b0:55b:7494:383c with SMTP id 71dfb90a1353d-5615b8a7534mr8403453e0c.7.1766859284454;
        Sat, 27 Dec 2025 10:14:44 -0800 (PST)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d132a6csm7849496e0c.10.2025.12.27.10.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 10:14:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Dec 2025 13:14:41 -0500
Message-Id: <DF97CCMNGWVP.2JBZR7CQF1FID@gmail.com>
Subject: Re: [PATCH v2 3/7] iio: core: Match iio_device_claim_*() semantics
 and implementation
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "Kurt Borja" <kuurtb@gmail.com>
Cc: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Lars-Peter Clausen"
 <lars@metafoo.de>, "Michael Hennerich" <Michael.Hennerich@analog.com>,
 "Benson Leung" <bleung@chromium.org>, "Antoniu Miclaus"
 <antoniu.miclaus@analog.com>, "Gwendal Grignou" <gwendal@chromium.org>,
 "Shrikant Raskar" <raskar.shree97@gmail.com>, "Per-Daniel Olsson"
 <perdaniel.olsson@axis.com>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Guenter Roeck" <groeck@chromium.org>, "Jonathan
 Cameron" <Jonathan.Cameron@huawei.com>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251211-lock-impr-v2-0-6fb47bdaaf24@gmail.com>
 <20251211-lock-impr-v2-3-6fb47bdaaf24@gmail.com>
 <20251227144707.1bebcf27@jic23-huawei>
In-Reply-To: <20251227144707.1bebcf27@jic23-huawei>

On Sat Dec 27, 2025 at 9:47 AM -05, Jonathan Cameron wrote:
> On Thu, 11 Dec 2025 21:45:21 -0500
> Kurt Borja <kuurtb@gmail.com> wrote:
>
>> Implement iio_device_claim_buffer_mode() fully inline with the use of
>> __iio_dev_mode_lock(), which takes care of sparse annotations.
>>=20
>> To completely match iio_device_claim_direct() semantics, we need to
>> also change iio_device_claim_buffer_mode() return semantics to usual
>> true/false conditional lock semantics.
>
> I wasn't rushing to review this set because I want it to sit
> a little longer than a typical series to get more eyes on it.
> Anyhow, long enough for this version at least!
>
> Whilst I find it hard to care strongly about out of tree drivers
> and in place flip of the return logic seems a bit unfair on anyone
> trying to keep those rebased on mainline!
>
> So with that in mind, maybe we need to name it differently even
> if we are getting rid of the old implementation all in one patch.

You're right, I didn't really consider out-of-tree drivers.

>
> Given earlier discussion about this one being rather more tricky
> to name than the claim_direct because claim_buffer sounds like
> we are grabbing the buffer, I'm not sure on the best naming to have
> here. iio_device_claim_buffer_m maybe?  Ugly though and
> these are super rare so maybe this isn't a particularly major
> concern.

Yes, it's a bit ugly, but as I proposed in the cover letter, if we go
for a full API rename, it shouldn't matter for now?

What do you think about that?

I'll go for iio_device_claim_buffer_m() if I can't think of something
better.

>
> Given I think the people maintaining most out of tree drivers
> are Analog Devices maybe this is a question Nuno can answer
> for us?

--=20
 ~ Kurt
