Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E82C39E6F1
	for <chrome-platform@lists.linux.dev>; Mon,  9 Feb 2026 19:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770665589; cv=none; b=O1EqJBAQHOHQRtjNmnALBH0HnXCIGdtsRgJ69qkHFbNt5CIwjznjJR8RSBqBcs+d0pAW1M7GiArWDnLWqNvG7MKZemLiW9JWOnDJUshm7scpq4kr86YiI0sDgJii2TmWJH8zLitlSAC5DYswmgo3/KAPzCxdIJm+qUpE2w5xPuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770665589; c=relaxed/simple;
	bh=y4/WL8DraOGgFsWhKFSg+J7rQqnclmJ+j8KLygZoKww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axE09XhxqeA3fiv4q/EWzh9C4yIt01VgU68uBf4MT0Af2cEUBasUdV5ar+Zku+5c1lX6xdHP6+f7zcYg4YqgvoSC3dAFYs6wfDl8Aq4WZ3GGYZpzf7YHecrQsJRxCsDwI/nR/0CSU0ueSpH5HSbF0v68wZJFTqH3aY5ALGJVYEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fJO7MlME; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fJO7MlME"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso1123945e9.1
        for <chrome-platform@lists.linux.dev>; Mon, 09 Feb 2026 11:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770665588; x=1771270388; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bQq96nnOOaZZumZQZN40bit2z1YPrLWrmhauKMPeMdY=;
        b=fJO7MlMEUFdOD+j53wUIDObEHFDGUa5rcmFYcQObIhV9nicHTidL3dC6BhOQAXdix4
         pfieAra4tbozKfSCR7I0+hDhJ/Ni9l44FS4dP6H+ttmdzcgApER1+GW0khuVVESa04N/
         +XBqa77d104PHkJ3+GTaWwdTIYC7ZVOsrhWC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770665588; x=1771270388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQq96nnOOaZZumZQZN40bit2z1YPrLWrmhauKMPeMdY=;
        b=ET0i52iK2cy0xxRswQ4hB/JLJAR+gdDJoSZv6UxEFiUB4G5Sb/0RSuMgaHin3WbfFn
         7C2DYkKCni9uYRODXQSqJuK+Go31qDeGdbul8ClxntxmxeCuL/ydkKZThIfmCDn0X1dl
         qLmpG07BkE0UkL8+3ZQtkPEmXAgUxrttpxFYAkdM7vYqsBJDUwYxztkVCnjKC12WuH/C
         91cQPQWhIlmELTL8eYnFXg+zezC+rrsnIK9zkCEfmxrl8/cvqFYQRsJ1NXR/6ebWLfSY
         yKLqGnT6xYWtkHLc7MRz4PeLQu5t1rdL8lrZCVrBIuG9sf9Sjh1wLK0AvD8+lyHkWW2C
         mt8A==
X-Forwarded-Encrypted: i=1; AJvYcCXMBnJqpQ0Wy3KlX1SHda2OhbpooupovW4ieyIrBQJLjysfssKVvL+6J45oOxxKYimaaBVWZKZkakmFsNqwejk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxYszm6iwOKmQfosozOEIqObGQR6BGm7WZl2FXhpRujvZWvtazo
	fV9uV9ieGOB2w+5x/8kAyI3bIQqLn84NXPN0PiWtHPDYaA6KCIbFUCyPsjsRPNJO+Q==
X-Gm-Gg: AZuq6aJx5LH1RXznPgiT1/doWlC0DLRVYy3civBq/ttFNUbwzIg6RjX4yXEvAKGdDEG
	wOjj+gFxg8LdNHKiJnu7TWtwNtpi5qI4dDnyvIN/zsSA1F/25tzWIMwUIlTSnVR9UclWQyeE1fO
	PxDB701G4/S40k0fXY4wtJ8J3suS2mHAiZpLHFv+GlUWX64krkYN9tLQtoke7hymRfMidakT9DR
	iaIpHw/GNHwsrnSUZJmlRO9H4+8dM6n5fqglX1DJasDiWKlo84XP8McIGV30Fa7deQoW33Et3f+
	HDhttVJszyPcsiTvdAuxePrImWxff0JGGRq73R2WmYoTIy55yV1lh3K18wZQiBLAJ4pHjY+k8ol
	tqKwPsaXavpsd9kUhJ4mPVfuxhOu4b6S+y3kr7fyfiEif/yUicNXnqUvRSq/r9U4kY4rB/h9npt
	lYb9qafyGcJmg6PytGJQ==
X-Received: by 2002:a05:600c:3b23:b0:47f:8c05:786b with SMTP id 5b1f17b1804b1-4832021eae9mr177212155e9.28.1770665587652;
        Mon, 09 Feb 2026 11:33:07 -0800 (PST)
Received: from google.com ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d77f9sm9355785e9.3.2026.02.09.11.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 11:33:07 -0800 (PST)
Date: Mon, 9 Feb 2026 19:33:05 +0000
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/1] Input: cros_ec_keyb - add function key support
Message-ID: <aYo2cYhd-XCcLa43@google.com>
References: <20260112093309.240905-1-fabiobaltieri@chromium.org>
 <20260112093309.240905-2-fabiobaltieri@chromium.org>
 <aYYTgxi0mcPVgpTr@google.com>
 <aYoBTEgrirtcW96F@google.com>
 <aYoZEztHrIx5CzwQ@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYoZEztHrIx5CzwQ@google.com>

On Mon, Feb 09, 2026 at 10:20:52AM -0800, Dmitry Torokhov wrote:
> On Mon, Feb 09, 2026 at 03:46:20PM +0000, Fabio Baltieri wrote:
> > On Fri, Feb 06, 2026 at 08:25:14AM -0800, Dmitry Torokhov wrote:
> > > 
> > > I do not believe this flag is needed. Always do FN processing. If there
> > > is no FN in the keymap it should work just fine.
> > 
> > The problem is that if there is an Fn key and a keymap, hence we process
> > the Fn keys in the kernel, then we don't send the Fn events, but we
> > currently have devices deployed with an Fn key where the key is handled
> > by the userspace and they expect KEY_FN events to be emitted, so if I
> > let the "fn keymap" logic kick in it unconditionally it would cause a
> > regression for existing devices.
> 
> Hmm, I see. Then I think we really need to have it as a device property,
> because keymap can be manipulated at runtime, so depending on it to
> switch processing seems weird.
> 
> It is like autorepeat, either device configuration asks for it, or it
> does not...

Ok, the DT folks were fairly explicit about not wanting anything that
even remotely looks like configuration into dt. Right now the behavior
changes based on what's in the keymap, which I think is fine.

I see the keymap can be manipulated in runtime but then I guess I could
just install a custom hook to idev->setkeycode, recompute
cros_ec_keyb_has_fn_map() and then call input_default_getkeycode()?
I'd have to make that function public but then it'd automatically change
the behavior in runtime as keycodes are defined/undefined.

Would that be acceptable?
