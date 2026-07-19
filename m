Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055B739C63E
	for <chrome-platform@lists.linux.dev>; Sun, 19 Jul 2026 14:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784471749; cv=none; b=bxE+E7Lzue9J684fL8apSj9TNNUdbL1vRd5R5l6G0JA337gRENlVyu7kKiY1ItIHTfxGiNtqD2bHqXaRF/Z690LxsjzFjvihlAs/plPi0I0AAo3/SL396ObLAEnRLy1FLjLORUFaTTlGhKOhEHRGGKkBlppybYZ2jHku7S9n8u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784471749; c=relaxed/simple;
	bh=rK2PtXjn3jqhV6HCZZs3u4lbX1egUIpYzYwhCEti/C8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1UyWaAHIpOvHFBOthh14ZSppXk3teK4uTQ1lvx8og8/o68KzsmOhecXV1CPRlLAGgYGnlOfV7yfoUs+4JbIw7rh5X48GP9UMBn715cXEOt0OG2YOneDxN7O9HVO8pLdDErsyVemtIcokXI77cwsFNbtnHqdUGSENUVmXawC6Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LC99Z0ub; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LC99Z0ub"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc61541f8cso34603455ad.0
        for <chrome-platform@lists.linux.dev>; Sun, 19 Jul 2026 07:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784471747; x=1785076547; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGxQpu6DbEFbZMC8BTbqJAHmxCtesQu+mVg153D593Q=;
        b=LC99Z0ubvhkwJgzceGAqcbQy3p5OfJJ07HccjyOn0EkQI/cCWq2lzR0S/w0WRHcdKL
         um6jV1b+HXKNYP6caseYlf0N0AnPXTeVUt1Kp7EBM/HJnRP3ilwjO6OE/l184Y/7jAWY
         R3BNHO9SLwL0z/sGaTVq9NB4g+/dzTtTvAzwAHC44IQwJ12/3COcSw6qa5/kV8EyASQm
         A6yK7kpXzSuQe7L0iP0NDjb+yFkoKAVEYSzuv9Gaw55B/zwaDBASPpGVlsWj09gtP+ei
         Ru1B1GRh60JNc0CTDxKVRRBHfBthsMjOIiNOMyY9zSKqmbEkVqjb9IFWauiIMteKlMSw
         aRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784471747; x=1785076547;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HGxQpu6DbEFbZMC8BTbqJAHmxCtesQu+mVg153D593Q=;
        b=otQfns+F8suqmWBOMRiwhwN7cLgs7OgQftp3dfvpiwVmEUuZmyMNKgylhF8WPcQ2tm
         hrpcB20GVUaGGuXxYOxdf9Yc8r1hiWeL/pvri9DA/WWUmBWWhLmJ7AVq9qJF/erh2KSe
         oyMB6De/kQ+rRo4CO0Uk8inZFmKVXcR7vdEqyyOVg8C+wTa7v+AOJIOZbvnfTaeHSfSk
         yIAYz/O8PMplJoMEeZHM+UHcIgvkT4w2GtlHJb5InswrDtq5bA4uzyAE+IkiaumKZu1U
         ne2Tqcu8fnGcV1hDWcetpiSCyRjWgtTP/csSmk6YywKoykgI1tfXXlpAQKEbuQaLsQYS
         7CLw==
X-Forwarded-Encrypted: i=1; AHgh+RrgNWAzeTxZpUeaQKvkfSfPiZ5bnxkLM8da98+9kKlBu9x8xRSlQuXmyS5uC4gWXIHHSIjyeS+Yit3qASHywrA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx89+lh5ju7ue+Dx6PXcsalk9tCsnIpr60Ki6g1+IzQhh0C9/sw
	dCZm4KVyUrEdp0imvjwFFk1D7HU0tSZ+QoCYdXRFDF68WcDcIIjTAy2I
X-Gm-Gg: AfdE7cmMlQk60AsNJN5H32Z1wJn0hPftsWvqLk82R380yYXDK2fNKmkK98L5m4KGR+y
	RKwm0X9yA/7U2vSzBIsfRTosQPlRO2VQyhd6D54JI0LewgLDVLiZgF9SmnwfAAzIFtzl8/9XH29
	z2FPvHzBuucRTkROTMezsypV2Hh1kno5FOmGOyObtLcJG9TvfG0Fh0tmS/y9lZORQaatV4FmVVI
	D3vpLrlbKihKfF+kjS+/U2+XPIpvqcpMEW6ojhY4XlfZR8W+2xJOxLTE83j+sFY0JvAwIEkr+Iv
	XzvBjBhbHk3SrOFO+/5X8AJOYs3WOYG00xNK7o/QYgUXHvk8DSLLabEJP26rZIFDSHo6gMfzuwh
	z68F/SNLFqWllJWlx2sCKs1hI/HsMZQYHjIJOgxfwU6OBpxM/c32QowGwkZepMpujmHntXGFIb3
	bU+BUO5Swd9Tv+de8=
X-Received: by 2002:a17:903:32ce:b0:2bd:2c3a:2a36 with SMTP id d9443c01a7336-2cf1f028edbmr160307485ad.0.1784471747422;
        Sun, 19 Jul 2026 07:35:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b1353sm41322405ad.19.2026.07.19.07.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:35:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:35:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Sung-Chi Li <lschyi@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (cros_ec) Synchronize EC access from the
 thermal device callbacks
Message-ID: <b305afea-e28c-4a26-9c92-5bf2cd2b4f41@roeck-us.net>
References: <20260711-cros_ec-hwmon-locking-v1-0-cb6d0fdbb2d3@weissschuh.net>
 <20260711-cros_ec-hwmon-locking-v1-3-cb6d0fdbb2d3@weissschuh.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260711-cros_ec-hwmon-locking-v1-3-cb6d0fdbb2d3@weissschuh.net>

On Sat, Jul 11, 2026 at 11:59:07AM +0200, Thomas Weiﬂschuh wrote:
> To guarantee consistency for the read-modify-write access in
> cros_ec_hwmon_cooling_set_cur_state(), locking is necessary.
> 
> Use the existing hwmon device lock to do so.
> 
> Fixes: 5798b62867b4 ("hwmon: (cros_ec) register fans into thermal framework cooling devices")
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Thanks,
Guenter
