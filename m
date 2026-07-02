Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9971C4DA522
	for <chrome-platform@lists.linux.dev>; Thu,  2 Jul 2026 14:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783001764; cv=none; b=GAnBOFveX7bHq9X2DK7xNOA90sDwvinwwJIAdZyUHfeoRPvKUTplUrbplhjsPjoiKywP1xa7wdf6t/4sCOgCARqDMt31MUSbil9X1PDSoin7YtZbA9gKmKvTSHUxiIAk1Zgn84N1O/blKIexRO9rcarifh944CnUlGj4RYbcqFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783001764; c=relaxed/simple;
	bh=Q8LfXyWD+ugHdVFd7y1IXdhd01kusDlV6qIfR2/k/Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cBizzJc5TTTkwFaGtKbONfH+ZDX7aRSeTdhPWHriBaVBuoahT2ERt/bslZsCIxLSQHt4fvdQ8RqqTf0EUmak1nBLBCZ2/Lcy+dr8dl/VkSQBWfu2OuZxiNnFKoPpoP8p6n17/ySqGsp3Tj534dktf978YonsjrKKPGg52+Vz0xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ac9Gd7Vx; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ac9Gd7Vx"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84532e3dbf7so1439209b3a.1
        for <chrome-platform@lists.linux.dev>; Thu, 02 Jul 2026 07:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783001763; x=1783606563; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P0jEyHCnJ5D4fHZToMgk1wOdXO1iLLZLCoZumGMTQYY=;
        b=ac9Gd7VxzNhnDogK2G2p/YOny91vNz0uZ/tZ6XeNDdTnzprjxgto/lhZfksnFdJE43
         4KxcLaXdtE1Rv0OlzTsRWRtodFhbjnDA44QFrEFXBcGERGkxKQxE+uW1tuCV+t36bFjo
         w4LraNnZNOjwvhRoocALhZ1iOypE3AjKoRgEptpx1q78kmgioCvCojFcTsYVQDogFFFa
         c0q7B7J9a56A1NxqtfLMvb7Ta5xDvBBgCwOAQclxBTQ7OyjaGYv7LlhI75C3QWp9///L
         rVbmJo83RrYVTiq7HhNRB77i6QbxARHVz7fcsay8T/laBn091NGKkW10nlnsHjITlj81
         GuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783001763; x=1783606563;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P0jEyHCnJ5D4fHZToMgk1wOdXO1iLLZLCoZumGMTQYY=;
        b=YbnUUXXbXRtl4YUTgE1aC+8flJ/dyt5p9hmAk3UOpAE50zKz1YhyIfzLexR/my6xIR
         5k7qb2SItlMg2HrUQsDHPRRfAm/WuN5i4Flywf91QYyLVoYdnGO4GUIOyM3kaexBKlL2
         k35e/NgjXYWamcpuY8qqABkZHw+50lwEFumTtI91a8/cuP2rNsWbPGhsPAi0jWkubctk
         LyU2NFrn6Z2t7y9dwvVceRIrL8tnP5XPcvH/UmFky5Efz/ISMWfIA4jiBGY3kamJwUa5
         Lsk7Cl151eMNNnPdSO0ITPibTifmriBdAn6YAvCjbta66U207N+qpJhHSktcwHC5edUv
         mE1g==
X-Forwarded-Encrypted: i=1; AFNElJ+3DFLuPQBBCNJfdxxfU5Kg06nQmVo6yqCdh7fHsK+SJn3R2E5Y46yAVMwv6bTpqhPOVSCqjwGi2Ta+rW3H7Zs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy18vC0FjMgHtNYXo7H6mnRVDdmYvj/+qGyD4nvsk+Xo14kNiXQ
	gviDVTwbAL9yHpFyXKwcYMqlbzc4xojJfaiQpGqKdGWSAIYXlmqUIGCC
X-Gm-Gg: AfdE7clI08lwi6xNymsiOZeCOL+ZrESbk5w6W6ySvOKUFijoU//oRUwRQFWdxvuU2aP
	DIiwE6y7Iiz7iGTC+vuP8JjszlGXEbWI+8LW30uHSOEVed9qScJpe2s60zS6+oe4I12scV1/edD
	TTJapEZ/lBQCdrvVn0/NsOkF3I8oLqEKADvjtNisFlKSMDXJIxMXm2zNF5fj/gZ8RsAPNnOi03I
	kuPrhuEa9dr6QkOGVz47sLLCCiaMnxV9+gyt3V3vZPHhpKnAi18LgSYmyDGRliuU9lQYpnD/OWR
	blyqPFoloPkD85CvqDFwhmSF8UeRdMG6X5ZYGx6dwW0F1Jor2BWJeuXORXnqfbyPOMGoFmy1x24
	XR1i+SSJCsNmFpgicLyN90EoTraUQyB/CXwspvf8YxEVaudjt+6WIM30h+znCOdS/+lRfuQSkmS
	ZxYuoUHhQi7LUiri8UePyEjg3RoQ==
X-Received: by 2002:a05:6a20:258f:b0:3bf:8b8d:3151 with SMTP id adf61e73a8af0-3bfed3efa54mr7547366637.44.1783001762737;
        Thu, 02 Jul 2026 07:16:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8f6bd050sm1315024a12.14.2026.07.02.07.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 07:16:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 2 Jul 2026 07:16:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Lukasz Majczak <lma@chromium.org>,
	Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] watchdog: Use named initializers for
 platform_device_id arrays
Message-ID: <c8d7d052-6cd9-49ce-8db9-af6b84441165@roeck-us.net>
References: <22bc09d0c9c8dfe75a205b0a9ccc98ccfba1de10.1781622532.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <22bc09d0c9c8dfe75a205b0a9ccc98ccfba1de10.1781622532.git.u.kleine-koenig@baylibre.com>

On Tue, Jun 16, 2026 at 05:25:10PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous union.
> 
> For one driver drop the unused assignment to .driver_data instead.
> 
> While touching these arrays unify spacing and usage of commas.
> 
> There is no effect on the compiled arrays.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Applied.

Thanks,
Guenter
