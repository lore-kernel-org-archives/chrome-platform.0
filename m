Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84B336405B
	for <chrome-platform@lists.linux.dev>; Tue, 16 Dec 2025 12:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765887793; cv=none; b=AvGG4YB35AK94W9nsmzKnEwJUe/Je3ZbOhEbODJETNHaKBRdkuOYcoxwEuM+Hg0QIO+wNSLvQP0S/pxh/RaNvF7UZGeBU5ZC7zoEEZETVrR7MQReVqojZOb8P4hfNb0eFWZE9ycxotIGfhl9UAo665ltfj6djYKrGCPdNLWnO34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765887793; c=relaxed/simple;
	bh=dfFLfO0ptAFRHmhExPG4tG+SrOWLV3PRoWoWAvlCWZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQLNNQkU1N+owHQHGQM2OAENMSkKklu18D2lYRtR5RiV5pXDBlnylH/b+AkN0C7cxY2gI0g8KoGc5v8Kyff7ewG3FaNKLgRB9PlO/eRjmIwAMGZNQWVp0zBLXWKrD58MIH01qH4MFhsqNnUf31z96uMoG5kQ5ykG+DUEO1EFOtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PoreEi2D; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PoreEi2D"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477b91680f8so44578685e9.0
        for <chrome-platform@lists.linux.dev>; Tue, 16 Dec 2025 04:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765887789; x=1766492589; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h316dcGD2rwPUezt7Sha/j6r4wregmlx5HRe5NTOxZk=;
        b=PoreEi2DzD86QB/pXBXjVk9wgfqF82MgZYvPX1bOKZrb84zuAm46660Kk8e24FPGCh
         ZgW8KoQKwp8EWXfhRZgzZZVuw4RMpGABKS3a5MoymYRg2dx6OkVR0mR/bz/RbxcZ17UH
         K302bYUoNMrrQEiKQXPQIDCwKvJr3YH2N3Xu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765887789; x=1766492589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h316dcGD2rwPUezt7Sha/j6r4wregmlx5HRe5NTOxZk=;
        b=EalQn2/k8+eaSzjKnMxk7op9drY3IZ673YInOK7MUeDQPw55sLQ27nUMVN7JjabUPP
         V6WQWwfuxn+olL9AetQYt5biysBWxY/AfpzWsbmghfd1Gf0icWkm8rkL4LJtgdbrdR3U
         wcaF9tyx3cgchhe4s7SycWIw3qfLOwZqiujNyiASKZq6kxWpA+urOWsTN7F29HC5JANv
         qh4N+fA9V0wCWm1eXXGCx94y41hfMkKuJe93u6byJVBDZYZQUgbMJ4oEGbEU3np9Ut65
         U6BNcDd898jKG1AIorbPtUs5CBezG9fSIaPVcMp9AzbYBkN3vONLXQir8Tyd4BnaXIax
         6H8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKK2XeLUkP6qDpaEbBTU4i7oX1RGw7gIf1YuOEzrm3IrIcwjnf/iSF9bEWjK9wr/A9YsyIR/8CmD9xorUbZBQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzw1ZFBFbfAN9H81Fqx1OSwT/eXCairzWWGTBv0BtOz2VjZhyeq
	0jy1ptPLaJUeTQl05xoMFIK0SiQZ+qeNETnFKztQIeZxxmRckQyD8r8WSAl/+pxnEQ==
X-Gm-Gg: AY/fxX6muNbpbc5+ye3se0z0Kflb79fQdK3gb/IluuPcJy7pqigkslVD9PJ/SWWhA6E
	s9HAG5FF+I+p19RNyKmJn7piTjDE1xJ9Z+HkEYx6L9VMICBw/RujvtGdAcWOV0lC+YvoTk1v5J/
	pkNHmd0pCnYyEO7gAAH++Zw/8oFPj38WX5XAvLqdQgCTfxD1d+wSWuINs8Nkjs+W6Lqzgq3ZzML
	ciwmzfXJaSXOko97ebrqVqfg/d2d+JalsH1YQ09PLnN+kkyU9LzJACe+DrzzFyhhyOP0KQB+Xww
	chiGyvwHYFaaulWv2mKQCc3vIdIoROMqtg9QC4AGKYCcWWZyynPXyuk0CO7OYqfnClzufzWhVtG
	2/QcYAhyi6XNLtCJI00kLdzf4K6BOLS2SOifKlPWCj6o22RIjxPSvHDKeTTluKRNicOJWdFHX0j
	5omUSmMKtIew6hA1qpbA==
X-Google-Smtp-Source: AGHT+IEm+5HCpyXQp1oGKIquvN54q28Rxd93e/rPeh39dklBFP6Br1IgDSqj5RZRcvjkEJoAcLyZ/A==
X-Received: by 2002:a05:600c:4f84:b0:475:dd89:acb with SMTP id 5b1f17b1804b1-47a8f904528mr153930615e9.22.1765887789170;
        Tue, 16 Dec 2025 04:23:09 -0800 (PST)
Received: from google.com ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f38a4e9sm308116605e9.2.2025.12.16.04.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 04:23:08 -0800 (PST)
Date: Tue, 16 Dec 2025 12:23:06 +0000
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] dt-bindings: google,cros-ec-keyb: add fn-key and
 f-keymap props
Message-ID: <aUFPKni-iFkxQQGu@google.com>
References: <20251209154706.529784-1-fabiobaltieri@chromium.org>
 <20251209154706.529784-4-fabiobaltieri@chromium.org>
 <20251209192243.GA963693-robh@kernel.org>
 <aTm1PVLrS7Ra0OTF@google.com>
 <2gd2npolfpo5jruwraamwpn3wurm7w447jnwsbcfonmhos2owf@ejrqiz3qdxj4>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2gd2npolfpo5jruwraamwpn3wurm7w447jnwsbcfonmhos2owf@ejrqiz3qdxj4>

Hi Dmitry,

On Thu, Dec 11, 2025 at 08:44:02PM -0800, Dmitry Torokhov wrote:
> On Wed, Dec 10, 2025 at 06:00:29PM +0000, Fabio Baltieri wrote:
> > Hey Rob, thanks for the review.
> > 
> > On Tue, Dec 09, 2025 at 01:22:43PM -0600, Rob Herring wrote:
> > > On Tue, Dec 09, 2025 at 03:47:06PM +0000, Fabio Baltieri wrote:
> > > > +  fn-key:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    description: |
> > > > +      An u32 containing the coordinate of the Fn key, use the MATRIX_KEY(row,
> > > > +      col, code) macro, code is ignored.
> > > > +
> > > > +  fn-keymap:
> > > 
> > > If keymap is linux,keymap, then this should perhaps be linux,fn-keymap. 
> > > Depends if we still think linux,keymap is Linux specific?
> > 
> > I'm open for suggestions, trying to understand the pattern, these are
> > specific to this binding I think if anything they should be
> > google,fn-key and google,fn-keymap, similarly to the existing
> > google,needs-ghost-filter -- no idea why function-row-physmap was not
> > prefixed but I guess it slipped in and now it's not worth changing it.
> 
> Just double the number of rows in the regular keymap to accommodate the
> FN modifier, no need for separate keymap. Also no need to have fn-key
> property, use whatever key that reports KEY_FN. See how it is done in
> drivers/input/keyboard/tegra-kbc.c

Had a look at the tegra-kbc driver as you suggested, first thing it
seems like the fn-key functionality there is dead code since 2013,
`use_fn_map` could only be enabled with platform data, not OF, and that
has been removed in 3a495aeada2b, as it stands kbc->use_fn_map can only
be false. I could send a patch to rip off that code if you want me to,
clearly it hasn't been used in a while (unless I'm missing something).

About the extended fn map, I've two problems with it:
- it seems very wasteful: the normal map is loaded in a linear array
  so it can be access directly, which make sense as that's typically
  very densely populated, but in the case of the fn keys that's going to
  be mostly empty, I'd expect ~20 keys top from a 18x8 matrix. So that
  would waste load of space, direct access is good but for ~20 keys I
  think it's fine to scan it, especially since it only happens when Fn
  is pressed.
- I'd end up with two values for cols kicking around the driver, the
  real one and the one used in the map, which I feel adds confusing in
  the code.
- more importantly, one would have to keep the offset in mind when
  setting the keys in dt, we rely on OEM doing this and I think having a
  separate property with a meaningful name and a map with the same
  row,col and different code is more intuitive and would make their life
  easier, especially since we ship with keyboard of different size
  and the offset would be different depending on the device.

As for the fn-key property, unfortunately based on past experience I'd
expect such OEM to want to change that code, I could specify the code
rather than the row,col but I would not plain hardcode. Even my
(thinkpad) laptop sends KEY_WAKEUP for Fn.

Cheers,
Fabio

-- 
Fabio Baltieri
