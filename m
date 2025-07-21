Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EDD3C0C
	for <chrome-platform@lists.linux.dev>; Mon, 21 Jul 2025 01:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753062263; cv=none; b=CAkxoQgujPGLY/RfPTjIIBUxU7cMjxuu+RNI/0h6Mk/B3e1bn0HDKaU5J6Qx7LuZS2ZoGBN5DcRtl4vKKxNF7W5427bpMDx+Fcp0hRFYLlmJPr0CwiC8gNKeNxzwuwaTQHGr8mwhU0SjmbQhO1fqDTEQuEjqXXEjcfSKtBUlc3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753062263; c=relaxed/simple;
	bh=L0Z9t9Wh/A4zDDhS1MGR1fwaP7pno+4uy6OTqGnwfSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOy8J39Z/55EI+Z97vxGOaJHYUILRNf/bzgjw/zoJVPqQK2q9xoieUDOxTYRhlkS7jU/+vfcNQQ/kglI8IQHXx/A88dzfpJWpMTX3vgb/6duTnzu4jw7xpgZ1ENLEsvfRR98e+kWea2599Jx9UyGuUdk8W3Xq2qrRPLeuGrOcHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hm35wkDP; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hm35wkDP"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2352400344aso33542475ad.2
        for <chrome-platform@lists.linux.dev>; Sun, 20 Jul 2025 18:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753062260; x=1753667060; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tHBrdYq45/4WdF0whEY2tHmY6Z0msFU6dYk6tOWf77k=;
        b=hm35wkDPpQc0xnZqG5JIxcjndpSHASn9uafgVhR8GMdwrjNPcy/8WdmncOoGU4kqWr
         31CrpCO9/5sww5BwD92OXlsdgu/LsOi6qX737ulG169UIlB9ai6tp7H645mmRBIxtWXX
         AZlMm0xQ8ImMCdx3oJ/D43dkrdBa11QWILHas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753062260; x=1753667060;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tHBrdYq45/4WdF0whEY2tHmY6Z0msFU6dYk6tOWf77k=;
        b=BEy4WtZna4vydVnG2qDPQ/SnLbmNJqmgTYvM1IJtR53UL/ppD/S826z9WWMFVjRHs0
         diLCLI4xVxY7SNskKKr0OsEMeNnsApVZ78BCOvLjVmSXkceBrbxQMpbFpO+uaWWnEDUC
         zmPlqK9xphVm6gIYvgnCgitaaE21qPqA9l1bQEb6HlFlNRBEsL5fLU1mYf6lDuIfQY/s
         0QOvuha5QKkz0u3N+XWrr0m8I1rKSJTVYkIWl8iov9L5dkSMyK/xhD1mWmFjKGglMa89
         2PYjeGmG1r6VN1Xk/Zp1f3QdHSoG4HnuyLeRmXuMayU7xjrbDyJQOU3DbFoM8XssH4F+
         D7pA==
X-Forwarded-Encrypted: i=1; AJvYcCWN3/kYSzNyP7YeD9viYN3RuLt74C+dSm6Ez43G4U2r1ypo4kKS3Bocw+p83ul4Gc88aEP5/rJbnkiSSy+eLvM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0XqMWYuuPtVaDwYzC0ssyBAgB5I0hTj/YyHKL3Qep3DvBrRG/
	k0cjCUuEUxuvMKKxn1V3dWY6GNrQDAvGNrAG+pb7Q7G3qG/VgYIvip7rJ6O9ayM/Yg==
X-Gm-Gg: ASbGncuJq4FJhxUm26N32a7eH3AGlafsRpHk5bLO59Z7cuNP3zsw2uxMjkGmSUQ6ck5
	Qe7PnvXc9+tfd+wh8G2Omilxey3f9sfG7Qx/Om+O5ZZE4avC6+AoC9m30vuK1mMWnUWwRydW9mb
	v+OjS9vzgWT1N0hkYYp42eBD/LkxsDw2EB/EB8f/tHdPZb4vA6CWag14DpqwAb+UrpgS5rellq3
	cYHWmBozfHNddIHv+Rq8J583zVBcWmvMNqmO0MOrax/dtAAnbaWt9mKx9cWOnVVXRv+kOMiT5c4
	rO2S2bs3kwX6BVKMMomaaQunCXHC3wphEMJJ2vVopy05fFGvHm0N7rKFjg1frrUGGMEHECG25cd
	ocMeaSJZvtypyDH6c
X-Google-Smtp-Source: AGHT+IHHK3JkTcCKaUDYK0J7ie9NU72X6OylFLHnhOs1ylG4T57NGJcGpo7Az0XrymfkUHKXHfTIYA==
X-Received: by 2002:a17:903:2f06:b0:234:914b:3841 with SMTP id d9443c01a7336-23e24fe9429mr272868615ad.39.1753062260496;
        Sun, 20 Jul 2025 18:44:20 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:43c7:b6cd:7386:78ec])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b48e5sm47188745ad.101.2025.07.20.18.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 18:44:20 -0700 (PDT)
Date: Mon, 21 Jul 2025 09:44:15 +0800
From: Sung-Chi Li <lschyi@chromium.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 1/2] hwmon: (cros_ec) add PWM control over fans
Message-ID: <aH2bbzDbpf3RMcMp@google.com>
References: <20250718-cros_ec_fan-v6-0-8df018396b56@chromium.org>
 <20250718-cros_ec_fan-v6-1-8df018396b56@chromium.org>
 <8869b525-c32d-4a8c-8e1c-b2718896dd2a@roeck-us.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8869b525-c32d-4a8c-8e1c-b2718896dd2a@roeck-us.net>

On Fri, Jul 18, 2025 at 09:45:29PM -0700, Guenter Roeck wrote:
> On Fri, Jul 18, 2025 at 03:08:29PM +0800, Sung-Chi Li wrote:
> > From: Sung-Chi Li <lschyi@chromium.org>
> > 
> > Newer EC firmware supports controlling fans through host commands, so
> > adding corresponding implementations for controlling these fans in the
> > driver for other kernel services and userspace to control them.
> > 
> > The driver will first probe the supported host command versions (get and
> > set of fan PWM values, get and set of fan control mode) to see if the
> > connected EC fulfills the requirements of controlling the fan, then
> > exposes corresponding sysfs nodes for userspace to control the fan with
> > corresponding read and write implementations.
> > As EC will automatically change the fan mode to auto when the device is
> > suspended, the power management hooks are added as well to keep the fan
> > control mode and fan PWM value consistent during suspend and resume. As
> > we need to access the hwmon device in the power management hook, update
> > the driver by storing the hwmon device in the driver data as well.
> > 
> > Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> > Acked-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> > +
> ...
> 
> > +static int cros_ec_hwmon_read_pwm_enable(struct cros_ec_device *cros_ec, u8 index,
> > +					 u8 *control_method)
> > +{
> > +	struct ec_params_auto_fan_ctrl_v2 req = {
> 
> ec_params_auto_fan_ctrl_v2 isn't declared anywhere. Looks like some patch
> is missing, and I don't immediately see it. Dropping the series.
> 
> Guenter

Hi, these structs are defined in the patchset v5
(https://lore.kernel.org/lkml/20250620-cros_ec_fan-v5-1-5979ea1abb31@chromium.org/).

I removed it from v6 because it was applied before. Can you help pick that
patch? Thank you.
