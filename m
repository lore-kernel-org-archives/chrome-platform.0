Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A7E21767C
	for <chrome-platform@lists.linux.dev>; Wed, 24 Sep 2025 19:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758742268; cv=none; b=njtw6A3drO5j7usEJ07SHKKOpnTqvFfr3QU1aMgUWZPLXXPSt75StC/eN1wK88KCvqQFvncCrbD3yy03TQXFDTnnlwRf8aPore9irMYrkS02HUiNY2moB7W0tUrtagqKvVT9lpcGPtgD1P3hYiKlXcL6KKeRIJvEMXD7YO3Kz4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758742268; c=relaxed/simple;
	bh=GI9Xl+MPFOHHEWNS6m62yjXMQrhju00mYgKx0uA5d/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OK+YVxrhYP+8GhdQXMQZA5Orq9tip1Few4DQLuO/1nHerF6hXVP6+PJZQ6ubflgmyb7+34uxEdXzh8qo3wkiuEiPO/7DDrKXSFT6ckCmr9f/hpecVLtXtc4qaAQXpLHU8nI9Itul8VLxGNVA4t7wkHEe1IUSgaiQaNsQ+JFcuwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHmpa4bn; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHmpa4bn"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-77f207d0891so246311b3a.1
        for <chrome-platform@lists.linux.dev>; Wed, 24 Sep 2025 12:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758742266; x=1759347066; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PmXYYWuE84Zx3GWpt8FZ0tAm371gI0YIhPYxwUcYz5Y=;
        b=gHmpa4bnYIXXUSE7ec7xzHhjbMHB31UIeDcafzhg817zzel95qNU9Z6nPaYm0hljjP
         Cr2p7iQPFL41GbgdChXBiWCup85qVw1OC5OFSQXSkVpeaD6pNhrSvdkpvc/6ZbWNARAi
         5AmqQ6Yh8EMzrt5NqWYyoDPxjr/96J1OPdajGU4JG0LCzwG10ZRqoA0++QhspqYbD3sY
         6O8dxDmAxOtwz7jyoYLzcFLbbESd2OKy42qjCqFlFperNtZje5NaNKqenrdtNDIJUMAN
         1TCHAkbZM3xOGig2M9eevwI1PpZplqhCVY3QOcx+z9ibIARvhlLbGTpnB4GTLsmZ6GE5
         YeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758742266; x=1759347066;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PmXYYWuE84Zx3GWpt8FZ0tAm371gI0YIhPYxwUcYz5Y=;
        b=vG97CpV02QXdqI/jkn/ecsNK+Y1asIwcTGCa8GRve9LivGMGJQmbNRTriZOg4WXfGO
         iZijTPLVpQbtUKdHchGK1D0GX7RQS/UpSpOJDUevxo8KL4nESsdpPj+XX6ezxgZAJsZO
         sukBKfNg/q2bcy1EZ5ZkJHoJETpR84ore4EPTz8C77gh9ZKVT7GtWXYQvCt1OIKYzysZ
         STTBENfAzGmHuAE25diyIzNpaV8ZwbOXk2eASYkwb8TedFy0Y24ydVjNl/kPxSSkIdwU
         Gvg6eZrPKeTbMUmWz5xq7zUaw89s6vKDsv+6TA88IQlIcOV3D2a46Kie2Xnqs+rWFfiU
         M2UA==
X-Forwarded-Encrypted: i=1; AJvYcCXoN8nal6fKQ+RR3nF3QmT+nPoHnINoy3MvM5IPCC+FyaTxZ/MO1KPcZ7rYbaAFFTV0N2ZouMJLcNtoG9ekJUs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz75FYhF7P+k4ZQjAXnY4g2vpn74COaiktrMMRU1aVdTaIcE7nG
	KJhJgXgnyLdYpNtUZnwxPqiGmeqVQY7e4mEE2pJe2umw0jLhrN475r9e
X-Gm-Gg: ASbGnctZq07f1XuqiE0rBCwiMJiOwH9LbV2gjFE6/vZ41/50mtaqeeoIJdSR56sJuuT
	bjpPKlOqMKqo9He7Ozorp6qDtbdrjqrI8GmLLYW8leDRpV+jxPJB57pegtnhMGIwc42J/mqSf2j
	AaLrIZldVgKVu8W7QxiX0nIejZRPrFpaF7GdIN31vLitPCGvrAAljFtPy7jsGlOdJaFEicoeS0o
	4Vz9wCjZlZnmH4lieNnEDKmKCKm8uddjUtZu981XWZoC69t1dCjTTv5svrraWBCiGJBjotq3N7F
	bc5lB4OFmh/30mcnSdMxYsRYKUsrHzZ+bOhx3D+s4bl8WyUW8NbSmV5V7tWDyjgYS+i8J4KBuTL
	+23vHaJTjmjeEThjSlyL1yp5EOX801G2wSyQ=
X-Google-Smtp-Source: AGHT+IF5CXklsVDvXe6vgWeVR2NFBBfKBUg2RT7kvwKZ6Qe4Syfm8nnQYr4AnphsGc3zSzkp7zeq+w==
X-Received: by 2002:a05:6a00:1382:b0:77f:383f:61f4 with SMTP id d2e1a72fcca58-780fce1fa18mr1117807b3a.12.1758742266232;
        Wed, 24 Sep 2025 12:31:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2f02c15bsm10810811b3a.95.2025.09.24.12.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 12:31:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 12:31:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sung-Chi Li <lschyi@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Jonathan Corbet <corbet@lwn.net>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, Sung-Chi Li <lschyi@chromium.org>
Subject: Re: [PATCH v6 2/3] hwmon: (cros_ec) add PWM control over fans
Message-ID: <41c71099-d9ad-4beb-bdc5-c8d15293d41c@roeck-us.net>
References: <20250911-cros_ec_fan-v6-0-a1446cc098af@google.com>
 <20250911-cros_ec_fan-v6-2-a1446cc098af@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250911-cros_ec_fan-v6-2-a1446cc098af@google.com>

On Thu, Sep 11, 2025 at 06:56:35AM +0000, Sung-Chi Li wrote:
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

Guenter
