Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2602E62AB
	for <chrome-platform@lists.linux.dev>; Wed, 16 Jul 2025 23:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752710363; cv=none; b=oi517OHtFujVG+WdBzpRZLAE9AYN0+a7CuRbeZQKjX/4I/alL6tv1I8Q1m5J+XdCX8FlysyEW3O1hephaR+AJ/VeakzO3HVlhK1eCcrZGtXEnD2rOKRqOYjeSeb6O69gdB0r2CqJ4RHCSQXea7D+Li6XLp3R/bHZnmMW4RZVbxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752710363; c=relaxed/simple;
	bh=6y9a+l/XQaojXIrKW+ab5aq9WDMMK73JMWW7yPE85V4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BiTfPQCyihNIVIMTWEEz+70YbTU/Rtgoesy/23iNM49IgdLCSVoNAQvPsa9FpoqxhEUU4UdlU/ozPyFtqE7zxYV2VQZmvjyCkkGQ7Kzz2AeW46JDuo2gSW+9R1q9OIO5QA0+4ApZMkQ/GgftcBO++zWXH+Skt0KNHKAWu8j07Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UY9dL1Vp; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UY9dL1Vp"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-311ef4fb43dso324016a91.3
        for <chrome-platform@lists.linux.dev>; Wed, 16 Jul 2025 16:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752710361; x=1753315161; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2S5eMLw9uQ0ySw8KP/ZOHT+KFFuQg4GIcgB7Vydc+Sc=;
        b=UY9dL1Vpsm29DRfyZ18DMR1wXqMhh6C6k191V0TrW3LkyLcfTYkKVN8iKoknk+dt/O
         gmXT9/sVKXRATiD0i7mnM7gGs+85wV+sGehMF2tApUgM8ItII0kbansRc5RytSUPnls/
         sMV9LwBe+1FYced2XiMLUetRV5kbZTSbjWv+klxZOa4EqR0h8OILnStqW5NJ5ueK6zck
         ndQVJPwkGLfp8wCZXDbkLZNRVF3T/ox22GVJFTFEKep165fp0Kbw0wXG0cafUyOQ6MbX
         UBmXdpVIRBywzAUeSmphwaSAnNqf+JMSmNdBKlRxvc824eL/clBdnPb/mjsl+2je6HLu
         SHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752710361; x=1753315161;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2S5eMLw9uQ0ySw8KP/ZOHT+KFFuQg4GIcgB7Vydc+Sc=;
        b=dAd4SKf2OAoIY3IjAcFEYHgna0BfpKF9skPPIV/F9t9ZFu7dJhHyMoKQsI64jWl/FS
         cekOc42kkNbTrtbJeSj7EFp+qkk72NP2Bjx/w6wt+JAmTosRsQa54Gvqp2yk3w985JUD
         3QMW4aHhWJNM5cgCHuh/OpA5gO4uzeWcLrYnzho+Iu4DhQkFuTg+a9WZTnYrWaa0Devk
         vZF4KQiuUoAVhxttw6HlIRXWhz51bZDC4lQbs6aKvkZU8/bXTH21hzpA9AIGzF17sNtb
         ZntcM8pyq7MyDvWHj/h36/Qo8hbf4JzHwdj6doi+AYW3WgPxdCIWfTjjwe3Bl8fBWRV2
         J6dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhV/Yh0CR84ScZYaUK58FioKm7DZ1YZQ2H/VWe8WNg39jIZK0IaovLw53VIa+XxABNRvfRKJk8ocZh1z37zM0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMbMAeH9eUXEndfoufFpjwEhEFML271VvPceeafnmbdK3xn+Hr
	O4X4m6SMM9dy4klnXI7WJRep368MaiwGnFUqXQiwCeultzfGtuja0jfP
X-Gm-Gg: ASbGncsY9hZOKb+eN9KAh+psqGLUjdtSQ4DG9Dt2l5Is596iT6hdQlLDlReyx6ueame
	Vzw6Vz5/MAwTfwaNH2QuhjyNo1MATdbukKmlnAtR4e+54zFrv4vfmxlMZ4qnmckGuTc1rSaVCp4
	PUqfmW7YznSfKYai4VO0+v1CqRFVczL9szdEA4Xr/Lbaj+hLbT4zknmEPlvYvzgnH3DGQqJ05po
	oNBvNpmujKFuiVZA2IM8XxNxEWSTLgpHEtytXgSBE9CpJlwM6yc2rf+QnJ2kkCalO+ryJsvoKD3
	Z+Wtt4ESoEYJ+xUsWFleXgujUhVjuTZT3koEAyu9lDluIKsH7uaGA8hr5LoJZFV6lQYOfoaVWM6
	aL0tHYkmPELAI8684JCiq/jTbo03wPLM1LqIR3qzZUdTAcA==
X-Google-Smtp-Source: AGHT+IGEqNh9D03iPQ8quMHgQIGgMrUR2i8dWb9uWRCCr4HyrV7qhDcogx0sw9ePeqLApgKSm8l4MA==
X-Received: by 2002:a17:90b:3909:b0:311:e305:4e97 with SMTP id 98e67ed59e1d1-31c9f4a6b52mr5533427a91.19.1752710360663;
        Wed, 16 Jul 2025 16:59:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f1e684csm2164598a91.12.2025.07.16.16.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 16:59:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Jul 2025 16:59:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sung-Chi Li <lschyi@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	Sung-Chi Li <lschyi@google.com>
Subject: Re: [PATCH v5 2/3] hwmon: (cros_ec) add PWM control over fans
Message-ID: <d6286473-31a1-4f16-9c2f-8a39534c22bb@roeck-us.net>
References: <20250620-cros_ec_fan-v5-0-5979ea1abb31@chromium.org>
 <20250620-cros_ec_fan-v5-2-5979ea1abb31@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250620-cros_ec_fan-v5-2-5979ea1abb31@chromium.org>

On Fri, Jun 20, 2025 at 02:49:13PM +0800, Sung-Chi Li wrote:
> From: Sung-Chi Li <lschyi@chromium.org>
> 
> Newer EC firmware supports controlling fans through host commands, so
> adding corresponding implementations for controlling these fans in the
> driver for other kernel services and userspace to control them.
> 
> The driver will first probe the supported host command versions (get and
> set of fan PWM values, get and set of fan control mode) to see if the
> connected EC fulfills the requirements of controlling the fan, then
> exposes corresponding sysfs nodes for userspace to control the fan with
> corresponding read and write implementations.
> As EC will automatically change the fan mode to auto when the device is
> suspended, the power management hooks are added as well to keep the fan
> control mode and fan PWM value consistent during suspend and resume. As
> we need to access the hwmon device in the power management hook, update
> the driver by storing the hwmon device in the driver data as well.
> 
> Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> Acked-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Please run checkpatch --strict on your patches and fix what it reports.

Guenter
