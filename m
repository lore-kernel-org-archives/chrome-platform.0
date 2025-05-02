Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D6B1CAA7D
	for <chrome-platform@lists.linux.dev>; Fri,  2 May 2025 05:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746164137; cv=none; b=sW2kNH6RPEQ15zgUsoEUYtrp8TGybVj/0zvJKMFUsVlhuB6DaKb/WEzqzWT2Z+S1dZ4cwLhZjGpZXjGbGLEwHTTsMa+NsXQ+0gE1XKDPESrmYaLkxDXZzP8CRHLTJ4Twxjl2c85srXWszZAyR76/Tb5XM6iVAO2Gl3J5ANxhoVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746164137; c=relaxed/simple;
	bh=2fKNAd0m/28SZvQm9wt/n28vAWZEcdn9JNM6XgU03NM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R50KQAdsJg1ybBnRKfU9leFzYkIzfPbX7bedAEpBmm81UvohOTzBSbYWkQOQzQHclOo3mylr8ilMiTpH1b0vhj1qK3Fq/v53Xu8WFHNZcKqMNtsvfCm5A8bmHfi8xMRWtOx7H88IsSgAm8MDm4NoZyBCRucBkx9pS29cqbde5+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gRTu1BWl; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gRTu1BWl"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-aee773df955so2519699a12.1
        for <chrome-platform@lists.linux.dev>; Thu, 01 May 2025 22:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746164135; x=1746768935; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tz4yf40mtzEV4/YpTdm2/hirFctImt4in0cV4OGFkho=;
        b=gRTu1BWl9kmlj6QLxWPDdTDealmABVlgAs6xs1YZS7B9pnwlng7pJUNjeRPeq1KF16
         Qg0m7gS6dZUQSymo4yNrvrK/j89AKbBXKtEy8uYobKBqXqlzxro0MLoVJAoW2A5I6c4k
         0SdM9ghnHLfxFsImsApXjuxa/OyKEifIHc2/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746164135; x=1746768935;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tz4yf40mtzEV4/YpTdm2/hirFctImt4in0cV4OGFkho=;
        b=uMcpr7DCUEKWpaiVt4BAEiGbu5bz3NrH7T0a0LXWHCEv7QB/s26tqdQPbb/sfqn3iz
         OaHJUJ79YlgD2SMyPr5daZ3Hovmfp2ab+YD/vsebgNTQtcwzth9OBv/G7T14A9NIAYX4
         9LdRVFNLvTrJKJP5dnV365PqXKDdEbnSWZ8BtTDgDYl1VFLnEPE2HtV815MQbkexpa2c
         cQVJRHFXHDJRDVme2z1zpZkZMMipK7aiQXc0sKZcrJsLxV70VpV8oGUGeI3jpgheFxXY
         j3EGvXG6oDpa0+oHygepcN62JX7bWJbhbKwyFJz/0JaohRv7vEZFo155b0It/ipLu2YF
         sWTg==
X-Forwarded-Encrypted: i=1; AJvYcCUTyJ2NX4wy4TYgGCl0BoZ+xACaNklHRL1O0wi6zke+SGMPmGYtCa8MyikxLsbJZPOMHVGfuTRAgrfUcN9fh6s=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPWy40+DKEzE824yj4El5JeCXDjClt29AtlEncSlsvr7fAjCHW
	a/JRW7DiGdg8WLTPoUAr112g6kYshZEUQIvdv014syLHYQdX8jDHB1H1u3Vixw==
X-Gm-Gg: ASbGncswkB2KKGcpEER1aZISz8DVthb0vUucOelWBKD0fNS9lyHp3749K7xVz2IAqW0
	mwFjoSD2goRt82tgbsg0FD6nlx2pvZT8qaMjTh34UZA7frS1sRTmoZMngLOOg8lYvpv/SDdre/4
	7iBV+43DdNooRwiCj8YjY3JWlnPx03q071S6EmW/x7rid+Gbe2IlKSF0oM0jmiGhC6CIj3WYNqS
	gJRqadkEuSk6wE+eYHSFDsDnJ0j6Unq4nDyslW1cs7X1OolbsxyskEmRrpe/GvvPe0yFmNCmXxg
	LNJ62Z4CC/+6n2oufoi81OdVDZt2HP8l6Q==
X-Google-Smtp-Source: AGHT+IF7WZbxLedaOYtnoAo4B+GdGFwceB1cOYhZurL9ySD5fBpkCR2CSB9s+2yvylGfqu1unwieKA==
X-Received: by 2002:a17:903:1c5:b0:223:5187:a886 with SMTP id d9443c01a7336-22e100b754fmr26447245ad.22.1746164134693;
        Thu, 01 May 2025 22:35:34 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:e66e:6e73:436b:6b0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e108fb8ebsm5785905ad.118.2025.05.01.22.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 22:35:34 -0700 (PDT)
Date: Fri, 2 May 2025 13:35:30 +0800
From: Sung-Chi Li <lschyi@chromium.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (cros_ec) register fans into thermal
 framework cooling devices
Message-ID: <4x3ouuawdtee3cbj7wwad5aazgfsjo2vbzsib5oxbmjcmny4re@kiseb26pciyj>
References: <20250429-cros_ec_fan-v1-0-a8d9e3efbb1a@chromium.org>
 <20250429-cros_ec_fan-v1-3-a8d9e3efbb1a@chromium.org>
 <ec2f7e54-0582-475d-af91-42d9be65cd3e@t-8ch.de>
 <aBGCB6_4XR4Z-vFI@google.com>
 <2518c6a3-6524-48b3-8e64-8990a61cc608@t-8ch.de>
 <63b2d985-92d4-40dd-b2b2-ab55796abc52@roeck-us.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63b2d985-92d4-40dd-b2b2-ab55796abc52@roeck-us.net>

On Wed, Apr 30, 2025 at 08:38:06AM -0700, Guenter Roeck wrote:
> On 4/30/25 07:36, Thomas Weißschuh wrote:
> > On 2025-04-30 09:51:03+0800, Sung-Chi Li wrote:
> > > On Tue, Apr 29, 2025 at 10:45:56PM +0200, Thomas Weißschuh wrote:
> > > > On 2025-04-29 16:14:23+0800, Sung-Chi Li via B4 Relay wrote:
> > > > > From: Sung-Chi Li <lschyi@chromium.org>
> > > > > 
> > > > > Register fans connected under EC as thermal cooling devices as well, so
> > > > > these fans can then work with the thermal framework.
> > > > > 
> > > > > During the driver probing phase, we will also try to register each fan
> > > > > as a thermal cooling device based on previous probe result (whether the
> > > > > there are fans connected on that channel, and whether EC supports fan
> > > > > control). The basic get max state, get current state, and set current
> > > > > state methods are then implemented as well.
> > > > 
> > > > There is also HWMON_C_REGISTER_TZ, however it depends on OF.
> > > > But this patch looks very generic, so maybe it makes sense to implement
> > > > it in the hwmon core.
> > > > 
> > > 
> > > Hi, the HWMON_C_REGISTER_TZ is for registering a thermal sensor, and here I
> > > registered it as thermal cooling devices, so they are different. I followed
> > > other hwmon drivers:
> > > 
> > >    - gpio-fan.c
> > >    - aspeed-pwm-tacho.c
> > >    - max6650.c
> > >    - qnap-mcu-hwmon.c
> > >    - ...
> > 
> > Indeed, sorry.
> > 
> > > . These hwmon drivers also manually registered other cooling devices, and that
> > > makes sense to me, so I think it is good to just register cooling devices rather
> > > than make big changes to hwmon core.
> > 
> > The implementation does look like a lot of boilerplate.
> > If Guenter doesn't chime in, let's stick with the current approach.
> > 
> 
> Someone could make the necessary improvements to the hwmon core and clean up the drivers
> implementing that boilerplate today, but that should be a separate patch series, and this
> series should not depend on it.
> 
> Patches welcome ...
> 
> Thanks,
> Guenter
> 

Thank you, I will first complete this series, and see how to improve hwmon core
afterwards.
