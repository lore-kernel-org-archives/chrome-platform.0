Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A812EFDA6
	for <chrome-platform@lists.linux.dev>; Mon,  9 Feb 2026 18:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770661257; cv=none; b=sKmULFfbTDqAXt/cYotrSYM/O7U/gfb3j7DBPG14cUTY6Ct7+yv5/B/AXfJ9RdS02h0LvbOEYaoPSdKdrJHAteuiF8PWncFBENfrCyI3l5127wV8ALivvkYwwUgMdOq2gvhawKumaPhku4alWMHgC6CxbntQ+Z4iXim9Wz9vsuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770661257; c=relaxed/simple;
	bh=7dN/acDxRQuhaH/mCUZ0BOpdERh0fJXK8ZDUnBKwDD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cyi+6XigYCQrpenkuvm8W6ktU2dk528lqh8X9A6A98mCt6PlYH9AYXJiuoU/wZ2877P+VuGCp11rs5N7lBRTlpJLKneTQnj0Vh6JjCzB0XIrmMtPc9ufr1vdsMIbhqRFwiTeBGvEuetc9uVYWefbozWgP3b07Y/b8OoqZI7GsZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8rsYDJi; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8rsYDJi"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b81ebac5d6so2476eec.1
        for <chrome-platform@lists.linux.dev>; Mon, 09 Feb 2026 10:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770661256; x=1771266056; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zSV3vsUg8E13DVBRTy1EKOAg5TL6exZt8xqnFEN40xk=;
        b=L8rsYDJiZRWOFULHjKOKv9yk5hZx0gAEphQ2zOSsFzcShJq8ZKgNImLVARMl5mHbHr
         JdhiK6M4wEYsNsECRCB3Tux23FVe00vKCeUPVcZJ5nwazFSv1jvrp2DJfzNxNB9oKvza
         JXZNwYElhoPHdITUJPSNi0Vl3RKdYkFRnduxfx/sFbdKttF378YVcctOlcVBQvZO3q8t
         pQZtpYoBKdwD5gK0pIGV9+kycVu8bRJt1Ri5FKdfL6XaRKEXsVh0TIP9XH/FOUuMmSeZ
         vSRGvIrMb17WyiBfdVvH+JJi+ObrnVVKZU0/6wsTSOJ6E0u5ZHIW+CHV4WhP0V4toEST
         GBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770661256; x=1771266056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zSV3vsUg8E13DVBRTy1EKOAg5TL6exZt8xqnFEN40xk=;
        b=riRe+ji9HTlHol9LsIbIFCPeVZy1pCwRvC/ld+72ZuZEDVV8eXQU9UJ8wIIGThaVST
         tzar+ep3oHxxq2nMds/pcrtPkkT6lvPMPUbCrxbd9RTlxp9bqjGviYFBviobsTV03tjR
         8ZkpEbR6g6roXj+jxIlDgVuSavW0OMlSpRkAFJRie7UdX9zMo2CcmSZmSug8lMg8HaWD
         Jhduz9FhThcUr5W2YHQj3tK3RF6X9ll0i8uP+FpkNCpYM29K59nK4budgBAo9wb8hrz0
         AAm7fMK5YiW6au6shTpB4yF+Ir+xyf6fPtxvH0eIre44odbvfibRTU/HJUmNjhNy/ALs
         hyoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHtbEYnSFWnTKNzIwcDrKud0CChOgWb6peeTLRlBDC0EuKfV7xVvT1MDTSTKNe+go39MNg6cuXXJaXOUhgBNg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7OMiEVAP95c6mCBLB/rOskrtPKAbtFF7PnUf3mxk3Kq6xvLiQ
	6C3CctieZt57ZZBNWWhM6J9fiAFiOJgZaMUbmKty9ClIj5EmH0SeV+Np
X-Gm-Gg: AZuq6aLquxujYsFbqobPC2IFhK3mhhKolet65SDSodHO/g4KO2qmBUwUswfJjiPMRAY
	msPw8HdYUPG7GQeVhB8pvN7PYzR9KsXBTq3BxG/h/fVtGtWYaXTc5NqP/bqwCA6/LAdLIhQqvN7
	g8BebJ/+ElRNbmmh/TB4+ZqRvDfQb1Ntbarka9+VJi7cSPgMrOZWdEXOu0qkWlSwy8UPlAzDIk6
	9ul7GNMShdPeRxbbsCwNc8NL10paVHC7HxHlNDn/MjdSIlKwWQj0zEnGOwwhhjNBDF+ED4t/BOa
	74aFxIZILFnO5n8McxZb15Mp+gKEvMPblvOBE/VYBP4qQtJY9o0jbwEKMgDnmB8tHhQTXGmvHfb
	A/9Q3FxqklhzCTWtCt3cQ1lS2Ab/ANuCj34kACKJFSiC+Bhk5sijKmPBINRrAFmJzPV1NmfLbg6
	UqirrIuy5QBgJHhACB0s/unBKtgTIfyMXRNRUa7dJgb9Py9eW04VgB
X-Received: by 2002:a05:7300:e207:b0:2ba:7ed9:1566 with SMTP id 5a478bee46e88-2ba7ed91857mr794184eec.25.1770661256115;
        Mon, 09 Feb 2026 10:20:56 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:616e:78a2:cc03:4be3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b95505b8d2sm4714919eec.6.2026.02.09.10.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 10:20:55 -0800 (PST)
Date: Mon, 9 Feb 2026 10:20:52 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Fabio Baltieri <fabiobaltieri@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Simon Glass <sjg@chromium.org>, linux-input@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/1] Input: cros_ec_keyb - add function key support
Message-ID: <aYoZEztHrIx5CzwQ@google.com>
References: <20260112093309.240905-1-fabiobaltieri@chromium.org>
 <20260112093309.240905-2-fabiobaltieri@chromium.org>
 <aYYTgxi0mcPVgpTr@google.com>
 <aYoBTEgrirtcW96F@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYoBTEgrirtcW96F@google.com>

On Mon, Feb 09, 2026 at 03:46:20PM +0000, Fabio Baltieri wrote:
> On Fri, Feb 06, 2026 at 08:25:14AM -0800, Dmitry Torokhov wrote:
> > 
> > I do not believe this flag is needed. Always do FN processing. If there
> > is no FN in the keymap it should work just fine.
> 
> The problem is that if there is an Fn key and a keymap, hence we process
> the Fn keys in the kernel, then we don't send the Fn events, but we
> currently have devices deployed with an Fn key where the key is handled
> by the userspace and they expect KEY_FN events to be emitted, so if I
> let the "fn keymap" logic kick in it unconditionally it would cause a
> regression for existing devices.

Hmm, I see. Then I think we really need to have it as a device property,
because keymap can be manipulated at runtime, so depending on it to
switch processing seems weird.

It is like autorepeat, either device configuration asks for it, or it
does not...

Thanks.

-- 
Dmitry
