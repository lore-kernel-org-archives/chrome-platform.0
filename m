Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3113C6BA
	for <chrome-platform@lists.linux.dev>; Wed, 30 Apr 2025 01:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745977871; cv=none; b=YwAyD7kzwKXQBLxmc2/9eWPZ3Ak0uZEnBwTw7d8UE9HaCyBx9rzHaWCAYuBZgGr7C5x7V+iscL5Ez9Lc3w/f4XNcO/rAkwKq+lpGuJza+aHdr3AURC72tfTtB+LStaB9am1sXtTUOAaVhZq75aMR3k/N4awMCQGK3NCa+/0zrsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745977871; c=relaxed/simple;
	bh=rfrOgKpBCk7qPpaO75GltUUxet8hLfjCpRs6KwLqCqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMOW7qMQNtEKBzBBfahEOsVrdmvCPK+jMY4w67oJg/X88WtiHIt/r/HlDpEoDGBn4y6LV1eDwYpO0gfk4fmNxPN6emHsDhawkzVn8kB4B/RMukeGivpMPCTPJKWSsz+tC+oXIpVZyBzO5fk+Q/f/PyQxBh1z80bz2g2pQn0Fyg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BzpB5LWZ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BzpB5LWZ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7369ce5d323so5657456b3a.1
        for <chrome-platform@lists.linux.dev>; Tue, 29 Apr 2025 18:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745977869; x=1746582669; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x7xSxmgjA4Hl8qCX2/f7trj++E1dgn0NeNi1d5opTig=;
        b=BzpB5LWZEXrWqpSM1kY6bvPmB8SNIEJ9TtzkFrCQVWxQhLCGU5TZ4NwZrOYVyGYX12
         lAY/V0N1bfob++XpUZYGfU1zR//XtZAR9DDd3fKey3tAE26yTezgtq1kyWsNtxzDXPw2
         WXyRahHXzz2Os9uxbd2UKMrMW/n0nPzYSqP2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745977869; x=1746582669;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x7xSxmgjA4Hl8qCX2/f7trj++E1dgn0NeNi1d5opTig=;
        b=tyveuIfqwrVlAZ7cv6HZIpWOQcFwyqONUoOBwiUnMvWkc/Ubx1N2Zmb5FsM/bhHGk/
         y7r9Fhve5qiYihMWPUJPKFqucvxfqFeluR5dxmdfZD5f5q4PSQsCVAg6dxEWwv3iQWe+
         WDzSo8IzArvVk+9Zb+bCKejJzzIaHLpNRoBjve1o/qsliiqf9AEh4PZC1AfwQf8DQvRG
         6hYRv0yTS+6E+DTCutE5cuno64yhFwHmtwPUnISqWaiQy4RvV3Fyv3iiS9Od/0H5g41Y
         dz0CL61NrOUn7TmTdyG+rxE7bDa3VfLzJLAj7r/hRs1WX6tcWvYIskbcYsH9W0upIljn
         h4RA==
X-Forwarded-Encrypted: i=1; AJvYcCUOXNEfxE6/EvAoCnXja8rDnjYVY3f/UlKVJoZeBIz4TzG0LXSwi0jB2uWtE7dp+x8ZJEmMBsLkBSLPGJS4bF4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXeKQsyrdLQvEz8U7M8TH9DlBCylHh+h0W/aR0GnVP6SkJl/oh
	MVDHmSg7KNueZ4cUZku6JnN546OQQkKTF3EnfLwk4+SUvILiX+j7ndWQYtmJfA==
X-Gm-Gg: ASbGncuppu9IG4bUMtBwDoFk7dPILWhtQAaSxeivLPcquM+CaXAs+3ysVpc8gNNrF2t
	Dwym+mhEtwtx0tMuVqFWw0sn0enX2qMSNh7ZbaKaQy4mYS0FAdElN2crXbOqbg+ucAup9vpsImw
	gDXynMKC4ccdHvvmHk9HbqF4gOI9BC30sDm3/e1ZjKiw3i/AgKHP2Df16duL1R7rY4ANgclWKOZ
	OZ2PHPp3mPrIWJicCZFm+ANhSgs8JW3m5pbrhEI61Fx7XqHY0eDzC303dC4YrJOcRaq4T59SKz0
	7I0YlWGXrRVJP08VrAUaBJUjgcU1Cf6EGA==
X-Google-Smtp-Source: AGHT+IFRB1rzS2EHxndlOMO/eNYOCxxmki6CfyHz/pgYJY8goCmO9VQbnakhTKfmm95vXeql2kPVtA==
X-Received: by 2002:a05:6a00:3e03:b0:73d:fa54:afb9 with SMTP id d2e1a72fcca58-7403899f538mr1991527b3a.7.1745977868695;
        Tue, 29 Apr 2025 18:51:08 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:d326:d929:40d:c7f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a31018sm416334b3a.113.2025.04.29.18.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 18:51:08 -0700 (PDT)
Date: Wed, 30 Apr 2025 09:51:03 +0800
From: Sung-Chi Li <lschyi@chromium.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (cros_ec) register fans into thermal
 framework cooling devices
Message-ID: <aBGCB6_4XR4Z-vFI@google.com>
References: <20250429-cros_ec_fan-v1-0-a8d9e3efbb1a@chromium.org>
 <20250429-cros_ec_fan-v1-3-a8d9e3efbb1a@chromium.org>
 <ec2f7e54-0582-475d-af91-42d9be65cd3e@t-8ch.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec2f7e54-0582-475d-af91-42d9be65cd3e@t-8ch.de>

On Tue, Apr 29, 2025 at 10:45:56PM +0200, Thomas Weißschuh wrote:
> On 2025-04-29 16:14:23+0800, Sung-Chi Li via B4 Relay wrote:
> > From: Sung-Chi Li <lschyi@chromium.org>
> > 
> > Register fans connected under EC as thermal cooling devices as well, so
> > these fans can then work with the thermal framework.
> > 
> > During the driver probing phase, we will also try to register each fan
> > as a thermal cooling device based on previous probe result (whether the
> > there are fans connected on that channel, and whether EC supports fan
> > control). The basic get max state, get current state, and set current
> > state methods are then implemented as well.
> 
> There is also HWMON_C_REGISTER_TZ, however it depends on OF.
> But this patch looks very generic, so maybe it makes sense to implement
> it in the hwmon core.
> 

Hi, the HWMON_C_REGISTER_TZ is for registering a thermal sensor, and here I
registered it as thermal cooling devices, so they are different. I followed
other hwmon drivers:

  - gpio-fan.c
  - aspeed-pwm-tacho.c
  - max6650.c
  - qnap-mcu-hwmon.c
  - ...

. These hwmon drivers also manually registered other cooling devices, and that
makes sense to me, so I think it is good to just register cooling devices rather
than make big changes to hwmon core.

> > Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> > ---
> >  Documentation/hwmon/cros_ec_hwmon.rst |  2 +
> >  drivers/hwmon/cros_ec_hwmon.c         | 72 +++++++++++++++++++++++++++++++++++
> >  2 files changed, 74 insertions(+)
> 
> <snip>
