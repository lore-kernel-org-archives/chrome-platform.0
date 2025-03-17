Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A59F2E3377
	for <chrome-platform@lists.linux.dev>; Mon, 17 Mar 2025 03:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742183731; cv=none; b=Wze2C6CJOSACwIdTzySVHE2CjMl4mMtUfYTV9C3wpWfSCrVpRvKXQh+fL/OP6/dVW4T44ywPrNFul64VmFdiRIQWYwtBZ9lArtAJZ3x9hOKlCe55cMaYhg2HnLscSiO1fhlbWGVbjvmhOw2a+CAVfHqmJtJ5hbbasS0+WDX/h1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742183731; c=relaxed/simple;
	bh=hXHELc8xnpl+q7yyJCE/ro7GYj3uJ/qOkojU06P1S78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqGKGU/tuDFdU1olzBrSCd6kzy6Sg1P6SDV7H60/Q5Oi9gou8eNdvXZxT3m7WPRAjPh1a2wl/71CIZxBN/9V4Z5VwsD2D8zcK1MYlD3SwwgogbvLIqzlW/h80lbgyT7GdQrXz13hGws9XQDUS/VbMgaQ9NAmpljDIUgDihSSLR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V+qLRkl7; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V+qLRkl7"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2254e0b4b79so91887875ad.2
        for <chrome-platform@lists.linux.dev>; Sun, 16 Mar 2025 20:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742183729; x=1742788529; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CBTWj2JRao6hEYbpJcvmwDMWkAU9+qspu6K1SR4O2CU=;
        b=V+qLRkl7pR3yb6ZtmJCqQsnJ4CJoenEqrNO0bAFuVRu9bMggEGSLsM7kiZz+NdF7qU
         uYMvTxqgcesPa/TDoB8aGT9Dl4kaxHZa3sJaWrMQk8HNRgz7UmJ/xfTBwdQiPNLVcADS
         Jfbt7AOShoj/qTE8NmrcuTv9N+RF9T2XGrqNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742183729; x=1742788529;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CBTWj2JRao6hEYbpJcvmwDMWkAU9+qspu6K1SR4O2CU=;
        b=FdlkC3xUH/EkqIM//+9jtbF2Z4ZRClb4k1VPEIAm2AciD3f8UN0mbzkRf5/FGQ/Gdb
         NBS1iYNxf7RTrHCEd9Sqm2fmU5V0NWjEwNqJ1SjiSvaYgQ5nGaUHbEIXcRKoUjBtjJ+F
         rWoJqq8Ek6AE8DNqfd2s7lS2CpXf9HYeh4x1c+KRXuRPPZxBmLhbQpj0HfXcCQknOkVY
         vVfVS9PKZFj5Tz/55s6+4yEbL+pvQb9RhDSxYFmMaPou9leBTkUJcH8/iA25BdmrfzAS
         wpGRRy+e4Di+blGbf08j3qdP/dEGoEPu/aA4XGcpMAgZh2SuSBrN/f6hAe4qjRUQaLzC
         7TnA==
X-Forwarded-Encrypted: i=1; AJvYcCWlJXB6PGT5m9ZypaNdFni58pu5E8bOZFMqtqddnnRghvFxnZx+AFSvFMygDRa8G8iR5Cm6YWJUmMsRdR49i6U=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdcO5FQa22op9pgU1TVJX9nscks+0IbGC/ZT+qaTlSnKUtzxmJ
	R7R/7XQfmFkfOS2Rn55xguFGWBHFhGdbOO3DMziSPYHcF6IDmPPhbjulj43w0g==
X-Gm-Gg: ASbGncuErpQwxA2q+2Axkr2f1ZHe1EvByFQH/gzjzwXxhQEX/e7BQA+BzvHrr5wW87B
	IDSE0/yXEwHJu5au+JPJ1VyKbhXPYa+oeqBt08IsYwlP3oK5Vi3u0reg83QRB7WVLEbhbdhdXXs
	Kuw29pBJ0XUqzgVZGPPthPK9rJdeYLzv3s+48hsiTPYFMdsiYKkFCnVi6jpJmRuSrQZXy/tFXzB
	v6o/Rvnh/MJs7tEYlBlGshd/Grpn/nFnHzLKcvsNg94dYIQna5hQdTK3EjLUwa7Pd+xH5q4ryPo
	fddeCYNzv2KG4rSJOnaU5AfmyrByiz8akGvJ4DU=
X-Google-Smtp-Source: AGHT+IH3J7SE6tEIIitDjSkDltLraVGoaJjVC2z0o5w6R0wVkSrN3Zf1UMSWDRTpV7zvnevMPEVf0g==
X-Received: by 2002:a05:6a00:b91:b0:736:5e6f:295b with SMTP id d2e1a72fcca58-737223bec84mr11823501b3a.12.1742183729670;
        Sun, 16 Mar 2025 20:55:29 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:77b5:e0b8:95d2:83db])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711557ee8sm6764462b3a.52.2025.03.16.20.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 20:55:29 -0700 (PDT)
Date: Mon, 17 Mar 2025 11:55:26 +0800
From: "Sung-Chi, Li" <lschyi@chromium.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] hwmon: (cros_ec) Add setting target fan RPM function
Message-ID: <Z9edLnXKlc_L2Fmb@google.com>
References: <20250313-extend_ec_hwmon_fan-v1-0-5c566776f2c4@chromium.org>
 <20250313-extend_ec_hwmon_fan-v1-1-5c566776f2c4@chromium.org>
 <714be928-a655-4561-98fb-800bcb15cbfb@t-8ch.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <714be928-a655-4561-98fb-800bcb15cbfb@t-8ch.de>

On Thu, Mar 13, 2025 at 05:21:35PM +0100, Thomas Weißschuh wrote:
> On 2025-03-13 12:47:42+0800, Sung-Chi Li wrote:
> > Implement the functionality of setting the target fan RPM to ChromeOS
> > embedded controller under hwmon framework.
> > 
> > Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> > ---
> >  drivers/hwmon/cros_ec_hwmon.c | 34 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> > 
> > diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> > index 9991c3fa020ac859cbbff29dfb669e53248df885..b2fec0768301f116f49c57b8dbfb042b98a573e1 100644
> > --- a/drivers/hwmon/cros_ec_hwmon.c
> > +++ b/drivers/hwmon/cros_ec_hwmon.c
> > @@ -52,6 +52,26 @@ static int cros_ec_hwmon_read_temp(struct cros_ec_device *cros_ec, u8 index, u8
> >  	return 0;
> >  }
> >  
> > +static int cros_ec_hwmon_set_fan_rpm(struct cros_ec_device *cros_ec, u8 index, u16 val)
> > +{
> > +	struct ec_params_pwm_set_fan_target_rpm_v1 p_v1 = {
> 
> The v1 protocol was "only" introduces in 2014.
> Could it be possible that devices without that command are still in use?
> If so the presence of the command should be probed.
> 
You are right, I will probe the command versions for both get and set fan RPM
values in the next change, and perform different handling based on the version.
