Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35EC3939DA
	for <chrome-platform@lists.linux.dev>; Thu, 30 Jul 2026 16:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429023; cv=none; b=KmvEBWsZ39/lN1iLisA0cvhiYta+BZMKFfrX3uVhOduaCt5hRiJ5IUBdL9DE5beCMLIZm3jI09gyanTBBobcnpIPU+b1kFpsPKRMyLkFbhia4UF0B2eT2JgWcGr0Savv2faPGkLEqW+bh/GUH1tcN+ApWpOxjFl/PpevFAqVSC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429023; c=relaxed/simple;
	bh=+7uiJy7c0mq/h2EZozzgTl0My66G0gGb/IGm//fPKk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gIG94jfo2FEShFY/ox1T6ptFpSGYB/p+g52tH9+aZOQII81RYdaS0tFpyh655SGfx5x1uFJPuNJv5qW7Z02+AIXwVjeC+Y1rNXWBSzlqBCubJ4MfcsK6iVn8tF/1tlHkSKizVtpBVGLH4MUA+fEIiCIBFo2JSgwBcRSd+C9NEkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0rwYVix; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0rwYVix"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cfff5f88dbso27137825ad.3
        for <chrome-platform@lists.linux.dev>; Thu, 30 Jul 2026 09:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785429022; x=1786033822; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TS0nLpk02bjAFhrrV/3dEEPbrbUjFkBR6sFXFkMMfOo=;
        b=U0rwYVixuulzcq+RUzdE12F7Woh6N2w46Wq7t7MQURRj73ugR2lL7vLaq8daDSCR6X
         zu5EjUZdT9yS0S5Pac6d0DIVn6IMLbxT0jbTE8gvMosZh475MvM1lPNLs8xUn8sQ3aIF
         SCDvxEizN545QridXvlNbnCDRFLh04Pg59nYrjw0kVp2HSbECwG/0snizv8Q7RFEN6SQ
         1SXgLCP3/A70fwyByVppITV2HljCDqLOxw2xjOR4hmWz3ajerSQBmnkiJhugmuv7DLfh
         /mfPWhjFHwHi7v3tSzP0AOvJlnyIeEUt7Yv7EqY31EYGozqyLq72te6Z/FIbdorZoi7i
         uhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429022; x=1786033822;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TS0nLpk02bjAFhrrV/3dEEPbrbUjFkBR6sFXFkMMfOo=;
        b=c1P0Q+UjNwkwmH/TFudsX9z7F4quHrxMJ85nW6z/uGft5s+rWGkC+IgJM2Ij7dd16E
         fP+L8Im27dtX4YkHc8dYNCiYeDFujkRCq/PyjStyMHN11V+RL3EmyhPMluF3QUyiK3pN
         Xz22M1y+nTbvEPvDUwG+3LlNxW/xHiuMQlIfJm19NEquLjllfcf1FvsEI17vJats3jJL
         uPSjGuxWPazMR8Ra+78kqI37ukeBrX7aUuAfGCPQRLTzJ6Y3q3yA89FUdw295zxu0lNf
         KBQ+TsvRRbSzjAkigqZKxr7ltcuAMqvm1+XKsrZSYLa770COXrEikQ0v1KIRAp78pppE
         E3Hw==
X-Forwarded-Encrypted: i=1; AHgh+Rq7scb5kQsKBwGPQT9QMczxSvKWu7Y0QDjX1VLfjbjHRExoShGkkN39kbAR5oUBcF6xHhoZFZfKUPQNeEd2eC8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5FDuU6RpLxhtIjRkDobVCV/lAgCpoq4aj/sWwPTeIiWpWFEdC
	CoxuOmTUKCMQWpZF+kDEWKrvmkhErp/0Iyms6BYSZxCurDMYb1eA7GY/
X-Gm-Gg: AR+sD13m238ZmuncEH5m+TjRgPNKLVRHrg4ziJjme1EzgTBAsjS7oOnor9jlY1UsxQX
	3ewRAZp4nrV8/lyxN99+DBwKp9jplthpvrdDkxMRmfIJNTFQ0TDqQdn/z4/7swtWIAH9BCuApME
	G/i5Iw870230xfBc7x0UZHXT8OqYMKRHX4oKWY16A9OHMCJs8+aCxuvhTgHzXyJNCU1aquAvsEK
	MKGAgGWkdavVAB0DiZosnjhkNns+RiiK2VT34hCMpyjaQkjwGgbgTgkejdoGA8UxXcE1dijwjIX
	4+3cXUv2xWZ2SAhCRbK5kFrR7FvOAdBRFODG0F3wQKO5L7CbqOgJuJDdFIgQL6lYnWL9txDrW0s
	ONThAZnsqDJNjkvlhdG3IzELjRR90ARxQkInHkEEJuS/MGJUDqHSg3WYrAyWnMo/AKjVirT7f/5
	AC/+33bmm75KPxlQrAN6xBHgU/uGETZj7u/DUHuWBH2TOFR2JBWZw7OnL4S/VC/31EGgpJnuipe
	A==
X-Received: by 2002:a05:6a20:d805:b0:3c3:a1e6:a624 with SMTP id adf61e73a8af0-3c90073ef45mr3157619637.29.1785429021942;
        Thu, 30 Jul 2026 09:30:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdb79a3796sm2433210a12.3.2026.07.30.09.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:30:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Jul 2026 09:30:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: (cros_ec) Avoid threshold temperature
 conversion overflows
Message-ID: <ac9ed0fb-69e5-4d2b-a429-36ca7926618e@roeck-us.net>
References: <20260730-cros_ec-hwmon-overflow-v3-1-c7198ba034ad@weissschuh.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260730-cros_ec-hwmon-overflow-v3-1-c7198ba034ad@weissschuh.net>

On Thu, Jul 30, 2026 at 05:12:26PM +0200, Thomas Weiﬂschuh wrote:
> If the EC returns non-sensical values the temperature conversions might
> overflow on 32-bit systems.
> 
> As these values wouldn't make sense, clamp them to 255 degrees celsius.
> The machine would die before reaching that limit anyways.
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Link: https://lore.kernel.org/lkml/0fbf7f69-bb90-4209-b9d5-258759711496@roeck-us.net/
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Thanks,
Guenter
