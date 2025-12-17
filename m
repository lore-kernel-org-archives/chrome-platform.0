Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609AA238178
	for <chrome-platform@lists.linux.dev>; Wed, 17 Dec 2025 18:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765994751; cv=none; b=LQzD47Ux81D7B/4D9zCkZnLHixXKPZXlezG0lySaSnNEQqdltI7b8pzwirQPilEOt8g5pCXSnepSaFP5XCX8ENcfHZzsrsMDJxIJzB9lsIC4QtaS80Dl6WXDYOo/lbUftH4ITJpdKsH3B+VpFgFDkC4Ae5i7NdZLApkBmOxoM+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765994751; c=relaxed/simple;
	bh=fCWiyQYPca+nvNeYkPrsg8l58+2d9hcv3WRYXCFhOAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omSOu1EqvxTH+giQVLF8bJEy2Iy0JqHo2T0LZ7WDmyDcCsPnlRphywucBlrKsarAvuBQ/QMGhAig7SF++ruHDdSwJTvxWUzMjKE2sv6tIvGzfxurtKAV/Yuzw70ZOUAJGa97kHZ52YruVe3dtjVN4wpQl4E1yJATnFn+DVvhoPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExCLf9vi; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExCLf9vi"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a1360e1392so21367465ad.2
        for <chrome-platform@lists.linux.dev>; Wed, 17 Dec 2025 10:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765994749; x=1766599549; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eJ+Wh0xNBReUdUR45vUeWefJp7cP+N3hdwazYMqKhgo=;
        b=ExCLf9viq8DuIkjRb5lOjDeaFPpnfHmmX/eSnNQU7sDvGMYwZ8HssSbuSUW+WoowF8
         ghQvCc6SbdXMi1BlbYmfiBJ/onO7K8Slfz+353n8gAfZfWeWoOGIR8hyBQwNs0xoUfue
         sklqnMSUjCtQWBw53DyZ2svw8yx/iM7kkdQa1Vj3H/bmbasOzl+2M7oNoC1Pi1NN/Cj5
         KITmlESPIAbGPE3283eeLoO4p1sYvKJrUUToabOUSdPHs7W1jAEfzeyP2Z8BISGJSMa4
         eGPxxyCbKLEXlFcWuB4Dd7q4pO6lqPe3xlCDYE5NA6PYn5J/kW7uwfUo9WbQkS9MEtRa
         LnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765994749; x=1766599549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJ+Wh0xNBReUdUR45vUeWefJp7cP+N3hdwazYMqKhgo=;
        b=s7ZyoMiIe36Kn+eIUdXxsMV2/8zv08RGtfnpRLvQfaIDbhukmcokuZZls4DJ33PWQ6
         eK3hGqUgJRvLG0GXgD1vX4VpTtkb9k06NrM8Lx9i4twDlpRF4Hq+BcNp0AJKJdBQsIU8
         p4R5oJS2hHAAp3hYyIkAQY5Fol6cZDF+/ccsYZ1UwCQd8QRreuYTG7CHMrjqKusIhOKr
         dJEng4xOoa+ASo1PRc9jQY2ZG/I82nP0cRScq6EaS779ZUDHA+G6rYCEkKUcIu8uRK/J
         DlPBq5Fy/vXfAFRCI0hA93mkafzBFFXUPLmkhLsQmUyG41mZnGmm6KVC8fzNUIf5Za95
         y2tg==
X-Forwarded-Encrypted: i=1; AJvYcCUWOkAhTJAgex/yI0LfSAogqeoEiJWhyYZPjvihlpLzPcUwhFuusdwYyOte5D1m+hDRo1hFmklTXzgfPsvF97U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzk4CxI5SW0JCAHlkMRDShRpdE8O+mv0KHdkVWy0isvbJWDdrvq
	Cd5Kopeq2pP1gqNHY336NwnWsH9VhcIT1tTZlCdQprrvCiiaL4aRk1G5
X-Gm-Gg: AY/fxX4YT5buc0ErFdjHFPklD6/0Rw4QQ4Rqis/OC6/SYH76240/6Wb/fpIYbV3t8kY
	iRADvGbnIPn9qNshw6ysf02CJladq+MpS1Q/A0m1p84pmYYUPHcdqnYkWTmo4uZcWkRzBRU/KAc
	Vyv4c82t1/Yhfa1XBcJWyHj+cu6IDDVk78dwCooJMhm6KbdNbMYGMsMY93J/MhDKNKk43KsHWXE
	NTuLPohQvYHLW2klMLSmPlQgA5+RWoeyfACNCVPFu4tE8wPqp5y75IG688+QHPnxrDok6KPtnVt
	KhQr3mVs6fC9sDYjn9MzhdBMHiLNav3YwKG1zAu/NC2F99ofLVon/Ss6W2jMaQohknM6GZj8aZS
	uLZmIUNdZLbVL4HWgxwFf4JqcCNLB/S6gCGuX7+sfha8+YpiqcGxi35T2d2XzL4buHrN6eHBnQ6
	KVD5nQFNvQPUm26d0fMIV2PpiDGM5L6M8CC6++/991Ie0aHPgePg==
X-Google-Smtp-Source: AGHT+IEsG5kPC7PFC1E5kE+BODk9O4ruJ6wx9lSNpfYD+lFEkTLCuj5suLNYSIL43zw4PUMGaxx2jQ==
X-Received: by 2002:a05:701a:ca0d:b0:11b:8fc9:9f5d with SMTP id a92af1059eb24-11f34c4d15emr13268343c88.30.1765994748500;
        Wed, 17 Dec 2025 10:05:48 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:86:f92f:a027:b12a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12061a93616sm409533c88.14.2025.12.17.10.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 10:05:48 -0800 (PST)
Date: Wed, 17 Dec 2025 10:05:45 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Fabio Baltieri <fabiobaltieri@chromium.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Simon Glass <sjg@chromium.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] dt-bindings: google,cros-ec-keyb: add fn-key and
 f-keymap props
Message-ID: <nx4lo6qfyfoxha7poyipa2hjc2vogp6twxbcap2555aj4y56gg@ddhkfh7eifvm>
References: <20251209154706.529784-1-fabiobaltieri@chromium.org>
 <20251209154706.529784-4-fabiobaltieri@chromium.org>
 <20251209192243.GA963693-robh@kernel.org>
 <aTm1PVLrS7Ra0OTF@google.com>
 <2gd2npolfpo5jruwraamwpn3wurm7w447jnwsbcfonmhos2owf@ejrqiz3qdxj4>
 <aUFPKni-iFkxQQGu@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUFPKni-iFkxQQGu@google.com>

Hi Fabio,

On Tue, Dec 16, 2025 at 12:23:06PM +0000, Fabio Baltieri wrote:
> Hi Dmitry,
> 
> On Thu, Dec 11, 2025 at 08:44:02PM -0800, Dmitry Torokhov wrote:
> > On Wed, Dec 10, 2025 at 06:00:29PM +0000, Fabio Baltieri wrote:
> > > Hey Rob, thanks for the review.
> > > 
> > > On Tue, Dec 09, 2025 at 01:22:43PM -0600, Rob Herring wrote:
> > > > On Tue, Dec 09, 2025 at 03:47:06PM +0000, Fabio Baltieri wrote:
> > > > > +  fn-key:
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > +    description: |
> > > > > +      An u32 containing the coordinate of the Fn key, use the MATRIX_KEY(row,
> > > > > +      col, code) macro, code is ignored.
> > > > > +
> > > > > +  fn-keymap:
> > > > 
> > > > If keymap is linux,keymap, then this should perhaps be linux,fn-keymap. 
> > > > Depends if we still think linux,keymap is Linux specific?
> > > 
> > > I'm open for suggestions, trying to understand the pattern, these are
> > > specific to this binding I think if anything they should be
> > > google,fn-key and google,fn-keymap, similarly to the existing
> > > google,needs-ghost-filter -- no idea why function-row-physmap was not
> > > prefixed but I guess it slipped in and now it's not worth changing it.
> > 
> > Just double the number of rows in the regular keymap to accommodate the
> > FN modifier, no need for separate keymap. Also no need to have fn-key
> > property, use whatever key that reports KEY_FN. See how it is done in
> > drivers/input/keyboard/tegra-kbc.c
> 
> Had a look at the tegra-kbc driver as you suggested, first thing it
> seems like the fn-key functionality there is dead code since 2013,
> `use_fn_map` could only be enabled with platform data, not OF, and that
> has been removed in 3a495aeada2b, as it stands kbc->use_fn_map can only
> be false. I could send a patch to rip off that code if you want me to,
> clearly it hasn't been used in a while (unless I'm missing something).

I guess you are right, we shoudl clean that up. We have another newer
driver that uses the same approach:

drivers/input/keyboard/pinephone-keyboard.c


> About the extended fn map, I've two problems with it:
> - it seems very wasteful: the normal map is loaded in a linear array
>   so it can be access directly, which make sense as that's typically
>   very densely populated, but in the case of the fn keys that's going to
>   be mostly empty, I'd expect ~20 keys top from a 18x8 matrix. So that
>   would waste load of space, direct access is good but for ~20 keys I
>   think it's fine to scan it, especially since it only happens when Fn
>   is pressed.

I am not concerned with this, as this is a singleton device. You
probably "waste" as much space in the code segment by implementing the
custom scanning logic. Additionally with the consolidated keymap
approach you are not breaking ioctls dealing with setting and retrieving
key codes.

> - I'd end up with two values for cols kicking around the driver, the
>   real one and the one used in the map, which I feel adds confusing in
>   the code.

Not sure I follow. You still have the same row and col reported, just
when figuring out the final keycode you need to add an offset.

> - more importantly, one would have to keep the offset in mind when
>   setting the keys in dt, we rely on OEM doing this and I think having a

Do we now? I thought we retain greater control over this. Maybe we
should sync internally.

>   separate property with a meaningful name and a map with the same
>   row,col and different code is more intuitive and would make their life
>   easier, especially since we ship with keyboard of different size
>   and the offset would be different depending on the device.
> 
> As for the fn-key property, unfortunately based on past experience I'd
> expect such OEM to want to change that code, I could specify the code
> rather than the row,col but I would not plain hardcode. Even my
> (thinkpad) laptop sends KEY_WAKEUP for Fn.

Again, we need to make sure we control OEMs better. On Lenovo Fn sends
wakeup only if it is not combined with another key, so it really has
custom logic with events delivered either through the main AT keyboard
or through custom interface in thinkpad platform driver. We do not need
this in oiur designs.

Thanks.

-- 
Dmitry
