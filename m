Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C7F382374
	for <chrome-platform@lists.linux.dev>; Tue,  9 Jun 2026 20:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781038436; cv=none; b=fJ5ZiJDmBfOFGIFq1Yfza7XlbQNh1bqpuFlN+e/G9DXhTlIkq9IHFZYXs4NZHPZR+v6n9c3IjGwoP3rgnTE2oMZCrySGWcgI+w1wrxhEkV6bhA/+10srPKFFHkLMG4OGG2UuPZSMj9PcxE9dX9RFiYdggT05AIvVCdaoigycztg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781038436; c=relaxed/simple;
	bh=Qw/3uIxuvhR9pkkQn0Fun90WWrW+XXIONdsi/Hw7s9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0pv7onMnQjVEMA6TOJwGVWrsJ8i/Ct/d65rd4N+sRx4jfQI0FlKO9Zs3LFsqVxYE1SJwzm+HyqkgdyIR8+rP8YLYBHcsX6cvwr39Lkng+o+HWzlvhnPwCDWaSu8RzxPC26RUE0Bpxj6b4ff/YboIf6iZ4M/BfmwwriH0XnYZq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q1+aCzzY; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1+aCzzY"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36ba285e98bso5970950a91.2
        for <chrome-platform@lists.linux.dev>; Tue, 09 Jun 2026 13:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781038435; x=1781643235; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RZ90DIeQT+39qjB/FIaskdYlqdzdVSYmD3rl7EwwUds=;
        b=q1+aCzzYBSWTJSlt2U1lVEcwHP83Kp5ZooearNQLMD6GnmHI38EvfwxGwDKknZp4il
         nO9cuzf+hfnPxGuyIsANjlxxZohOFos5f9YZDWsHqYUpZvM++lk1cwk0ZXkM9OrlQMlv
         C3mfRry0fK8ytk+KTeMcmOgyG3Fycv/pAC9Tpx5CdizR3P5L5yvvnsPdIXQGkhWwAZE2
         JgzHetRUSUBF7JPY4ci0pWCRHsk9uuG6VZXDSwmboeHdJ9hmjjhdEquXxl44GrY1R/sC
         rBeoCemdUi7kaK97zDaO2rmEre22XI3pDk/MZfUO4Gv5YoCrx1jlATP5uHfm83T0OuFo
         CN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781038435; x=1781643235;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZ90DIeQT+39qjB/FIaskdYlqdzdVSYmD3rl7EwwUds=;
        b=Zs4QPWZDJ7a8A0Enu9m2WDf+hE+v09KDKzHryZWYy2XKOr1MfryVgXVb5fGZUYjlKA
         TKJ2WieMIlOm/9HvtkjgmrDSv3osr4wgadqhHy4RKc55MNSKM6dxEspJx3dSvcCDQ0hn
         091pwfGyFHxj522jARsrfkbURMM4bGqcSZPQT71MowVE9+9XEHuWr9tfKwl99JsPTXbx
         tOohWFyVJNQt6ViyAv7WIu24SPSN9qaw118MP7A79du+G8zX4MKv47gWT7irawQB9j1m
         V7mS3+KxXmnCYuhRyzR+U/1HzQ8cH0GfAAh3gydvXq2jA2uUp6S/bn+ZR1zAeZ8vUK+J
         fzSA==
X-Forwarded-Encrypted: i=1; AFNElJ/1iFDiryThXO4y/YxID+cwhgrwZsdhW4uN3rLyvFck1VY3RZ1qxKinZBgg3VwxXeHwW++MrsgZbdbn+acxFZ8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdDCWpN/wsjhGFTAvOb0S4HhHr7mn+lm7nxa6QyGEp9mh75dfp
	6Fxj57D+e4WcaSiNcqdDioosYxDn7B1O9V1M8lyHzi5gvdBq0cffXG88
X-Gm-Gg: Acq92OEB6ltLmcj/gC6gulPkt2GIfFD+0sgZ0N7Ts4xy1fyCP/xnZhFc1hyYteFHxEF
	+v3yhOrxhKeLu+EYIdr/MwH75kaolOcrjJkvICRkVcKPi+kUt6DIdQoete7u211Ezu4C4pa2z11
	Vzq88u17vDoXVnPH4WRIGUhlB/Ngto45Ll+lZj9yBWNR7XUgMPrE6naKpbdJdv7cfU8CJrqwSBv
	ECgyf+aG8bs1ETVC0xIInfulVTbBuDJ8IzYqI4v1PR0LNd2rdymcTO0bbhIUFnvZJKbTg6zw+o7
	iryd3QcVc11ll8hZZv/i0NxhxpAWdRhtxNuYy/eE3dwWNPjKHO/LCMR0axY1R0fp9G8CwdQgsHw
	D90xJBm52HCYfXM73ZshOBXgyujxSUN+KcITTSgoUVGdl6ktRvOKtTL2Dhbn7PCa6HWsSaJfLSm
	TInCnFiBTJDcJjQKUWGDxznbFQYqmY8Gn8AUOVbgLFSTvIOe8=
X-Received: by 2002:a17:90b:5890:b0:36b:bb66:fbc3 with SMTP id 98e67ed59e1d1-370eec11205mr22415053a91.4.1781038434724;
        Tue, 09 Jun 2026 13:53:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f710ee4f3sm21059611a91.13.2026.06.09.13.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 13:53:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 13:53:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] hwmon: (cros_ec) Add support for displaying fan
 curves
Message-ID: <3a3a7d58-010f-4754-bd07-a7f34b21a83e@roeck-us.net>
References: <20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net>
 <20260529-cros_ec-hwmon-fan-curve-v1-4-da6792b3830f@weissschuh.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529-cros_ec-hwmon-fan-curve-v1-4-da6792b3830f@weissschuh.net>

On Fri, May 29, 2026 at 10:31:55PM +0200, Thomas Weiﬂschuh wrote:
> The automatic fan control mode of the embedded controller uses fan
> curves with two trigger points to calculate the target fan speed.
> All temperature sensors affect all fans.
> 
> Expose these fan curves through the standard hwmon sysfs ABI.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Thanks,
Guenter
