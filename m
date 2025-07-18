Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DFA2E7BC5
	for <chrome-platform@lists.linux.dev>; Fri, 18 Jul 2025 17:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752860260; cv=none; b=kKBHM5vutdDUUqKYONdCZJDrDSSzTpcZUhAJIZBKbc6GwW9/ctmXqgDmIocipqjVbXuSTptXFQRvu4zsHac0jsf94MjcdxLPh0pwp+fslCegDI3Q+S1picMy76Tlpm3hE9wM1JcqVVlt5o7p5pqnOOovPCzcec3/wdnFn9+UNWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752860260; c=relaxed/simple;
	bh=IleGqfkJkac9ehTcogGyzSzaiN9An+RKyaQHJZK1S2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=azjuTzaLS/hYJbYhT8GzkK1cN7y8F2Sg48BhzFXlWTjz1qOZmvn/7blcEvSw6Y9WXDzW5WSJ/p08UsJdJFchJRwATYrPkAbcHgBSG8k4esDnAzGy1TVxGn+RQu9dDZzrV9wpPkjGdzP4k9/Z9fNq/ywmWRkqrVDGoGwJkLibyB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BI6yq5bH; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BI6yq5bH"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-235f9ea8d08so20244945ad.1
        for <chrome-platform@lists.linux.dev>; Fri, 18 Jul 2025 10:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752860258; x=1753465058; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=34BI7Tti7vnbJ5UQzHNX3MpcNOQlW2ff85WQKd4ASjo=;
        b=BI6yq5bHZv8VWK1I7GDB+s1EA3Iwb/7EQehzSRMteU4S27JGirZ+As6Gl18/YCUB8b
         Bd7JOPdCN7M/XR0yyUCMOlgrgHnaFjWQOqXNFSWzDfW0xvFL833WcKBpWQ0EzOfOaZl1
         ZPX2I69HI9e3EwfSQRGEWunmjoamykHt7Td/a3K2JgOLr8QS9LJ6oviKxBHk+3//iR/u
         zr/msu7mIj6zJdiT4N9gPg7Ny4C7/NryswDB5GjPiaHmmivjj6NDfsj4SlxbNGs/lvXr
         DEjqXZp/Ua1WFG/CSOKLnAgqCzsGlTw11fNF2fDLBNkxOEoTYQLxN648X48WzhQpxhXn
         Pq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752860258; x=1753465058;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=34BI7Tti7vnbJ5UQzHNX3MpcNOQlW2ff85WQKd4ASjo=;
        b=r4P+vAbpUSQ7lxGrji2WVP82H+jZI1EnmN/8P4gFNJdKskMdqaL7DWn9I2cmNCsumc
         gjpNaU+/Wd/YzTYFDcbXbj1AB6V2oxZTGlw93dOGVQvJdkmNSh/Cs/YcJzgEVMQAXDw8
         OQm2CMKy5HxxnazvrlVV2fX8bY1z0ZpNep7GFzLtGdmDjpoQahza9rKLSoV3GA0MZEFA
         X5gnLncDdaRte6nrdZX02AVNNqJ4kKAzgiHSvzmgkH44eo04/BPbAIQr2T2KvxVppj58
         oJg78pami2qZH3bN8MTCYXOOglUv/gcQJvvndXDJovqxXG+cWTmlnCB/pB6xP0I7MbZk
         U3ow==
X-Forwarded-Encrypted: i=1; AJvYcCV4HHBUwmEl5IGluHBGD+evTtvWR6OPEIqY1mGwWqbY4yBVEIzB7KUBugIKnaCE1oAihcXmQQVXzo6W56aetTE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8ZqOC/dA8KCUAyu1NXeZk0q5P7QDo7Er8eU1Qdz/vwiii/9bq
	/1sWzDor9kozyP2tlc8V1ER8evcppg3GLwlCTtrxhxMeh5vLsVmwYg5z
X-Gm-Gg: ASbGncuyXysrSPp2sI58mt6KExm6tK0NbZBSOkubdsP0/YY5EuAjfJPT8lxH6fjuIg3
	KA6ZEJn11StFLFxhWWzvRDAz1BYFoe6va9ANqpDSqLECC6BtFxYJEKip4ETFkR3HXmFaGYmt+iH
	ci31+ntUjNIYplXRK5m2XK8a6ADtECIDtx1Y+B1qzh/ECAHzjVg+60Dko7DiPtMAJaCwG6hRy4K
	vQaJ3+UT4/sDp614Zg0iFBgDek2XT8NtEMy5DfOdMt0cgIvY71TQTMU0ipNuByJnLuanYS+U1Iz
	pDbiqkbM/xOR7Mw9i/ilF7u/2NE9ZgiAO8E9yDE4TNwCGoJknTRxyplRKWbgRxVHUCkuFakClhY
	AvuRkhwFuE0uxYkm+If8OXLQjQu7EZPZ+FW0=
X-Google-Smtp-Source: AGHT+IHVxMAAz4AU6bAb5gLGmWo4lVKYAEmo5o6hXKACzpOC5VB+9J1tjUCvYwOHqFDytRvz7OmIaA==
X-Received: by 2002:a17:903:990:b0:234:ba37:87b0 with SMTP id d9443c01a7336-23e24edc246mr139779395ad.13.1752860257697;
        Fri, 18 Jul 2025 10:37:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6ef976sm16066225ad.202.2025.07.18.10.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 10:37:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 18 Jul 2025 10:37:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sung-Chi Li <lschyi@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	Sung-Chi Li <lschyi@google.com>
Subject: Re: [PATCH v6 1/2] hwmon: (cros_ec) add PWM control over fans
Message-ID: <b985d231-8d66-4541-bcfc-27e0d9c8cbe7@roeck-us.net>
References: <20250718-cros_ec_fan-v6-0-8df018396b56@chromium.org>
 <20250718-cros_ec_fan-v6-1-8df018396b56@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250718-cros_ec_fan-v6-1-8df018396b56@chromium.org>

On Fri, Jul 18, 2025 at 03:08:29PM +0800, Sung-Chi Li wrote:
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

Applied.

Thanks,
Guenter
