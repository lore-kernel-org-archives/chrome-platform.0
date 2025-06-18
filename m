Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1F92747B
	for <chrome-platform@lists.linux.dev>; Wed, 18 Jun 2025 07:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750231606; cv=none; b=oPaXqq3jRXYhIoKDKL+4wCDS5yLCB/S0+6O8pd8sgoL9Zgj56x+bxCjuB0U5VrJaG12ZdLVs6O0417t2+3MkaCGXu3ITjWdHptFJdwQ5e09U/Ogjy/wOne3LiDZelKaXXlDz63tNMUoL6RuuAnw6+bdVKaWVOaMGEsxEahI0dow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750231606; c=relaxed/simple;
	bh=+KzNV4oOOMx38wmOYSChoYo8E3X2rejrMJIv37ZNqsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Atsd/JycKsrLM6M8X3d1VOJz0FQQ4JDOXHNcXSWKCrltsruBC+zjB7gCIRIR39f1izF3jKlfJYrLRRKfBcTxjttnLfUqVicsmYo0eRUQyzJ5gyTiBh59FUNcZKW6l+8HRR19Zmklhaf9M3E3B5sdpriHzL1dA6mN1/uXxmXEmAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aQCJeITC; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aQCJeITC"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so7041205a12.0
        for <chrome-platform@lists.linux.dev>; Wed, 18 Jun 2025 00:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750231602; x=1750836402; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hM1UhMnYVhQUG4NEkfTsgeOJp+Ekml0puj+o8yaatbQ=;
        b=aQCJeITCqOwoBJJP/QqSZZfleRoNu3KAw+W0fyB7TVnxZoZ8mORh8pzeCS8RHso2aE
         YER0zW7h9c6ZU9Fb7Z+owInikhrEp2cX97ZRb51QQlZXZtHlWz+NYaEowuvzicpQjMlR
         2qj7irPsV0+By/g9kHsH8rtxGY9wVJpLrXIXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750231602; x=1750836402;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hM1UhMnYVhQUG4NEkfTsgeOJp+Ekml0puj+o8yaatbQ=;
        b=gum2+9vSQYeEni4pzOmP3/Ftpj1Iywr/uVAa2Oz2jcTplA2CwalbGlTJValAjvcMwj
         jVr+HX6KVNWtHO4EW4OdrDMHBw6zrjsC4XXVVIo7NBGs9OWJcB92T09vVZ3QgMhYVAFN
         ImaebsWMtMgPErZaMWTK7evoOmdQWWb4zpIrHwAnAdTWIx/VI6Apr0YstTZsM9nzTGCQ
         BBj2M5fHZbsvBt7BYF9HfuK+uh2VnHLLru5XBYHYcPPa6P5lYsm3qZTyFzZ0UDMWKJ8V
         +QlNl1hnsss07VnYIn+hVmVU3l1qG6y7Yx6T5BzWNnDZleg5ly73ljlYCHYcNmIJrhTU
         O6jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLQZqog1MzBGN4Kc4NcubHSn92aXFVSbqhtZQDNhVmF1l/m9s985dlp4E0MAaMecFbFFhklxDK4Yspt0DW/eY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyg2l/Hq4fYUow+b4jcMzyCcnME74XuM+Oa2EM7oGLFc1KtIdMZ
	YiCCrNAg2/So8US9VjY+qs1UamQ4bzYZozU+tFulHSKgLA4ZLUfFY2TAbw5Z6iYw+w==
X-Gm-Gg: ASbGncv9O+2ZT/mzNlQ/A5GSUUz1HTaFhB/M+sMJnmNFMPkdvnnh0mEYSbvNhswQifc
	+IVKtfNPKXjxE+TRVhrSEX0dVlqpQLfpyKzCOpvRQHMz/NapCiTnANcBOVqAda6C1mZmmpCEiNR
	6UYWhR+z5g19RjAFGK0FBvhKY6dJb5Td6bHn4sIlK/rV7GAtmVEbbewnk/v5BVDaA6eNoul8FfI
	fp7S8Xbh4YBjD2angwj/8QUth6a1AZlOLCvRxP4tMZF+BeTfsTKdCt5zzDaEZJLzA5NISWn0C+2
	FZ+RYLSrK5HBfXY0b3olheQBAyKc6eUgkSiy9XG93aMiIyk8TBqXeMrZCNJhQEARLUY=
X-Google-Smtp-Source: AGHT+IGmlF2R53aG5doFh6Ww/jme75FfKP3jQE6NmFAaZ7BCSPsq9zGRmtfVZXCsvQQaCwhcGykC3g==
X-Received: by 2002:a17:90b:38c5:b0:311:da03:3437 with SMTP id 98e67ed59e1d1-313f1d05d1bmr23596610a91.27.1750231602456;
        Wed, 18 Jun 2025 00:26:42 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:50f9:5771:52a9:eef9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2369ebca745sm13850295ad.100.2025.06.18.00.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 00:26:42 -0700 (PDT)
Date: Wed, 18 Jun 2025 15:26:38 +0800
From: Sung-Chi Li <lschyi@chromium.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 2/3] hwmon: (cros_ec) add PWM control over fans
Message-ID: <aFJqLkkdI86V3fM9@google.com>
References: <20250512-cros_ec_fan-v3-0-a9f2b255f0cd@chromium.org>
 <20250512-cros_ec_fan-v3-2-a9f2b255f0cd@chromium.org>
 <ca2c10be-3dc4-45e1-b7fc-f8db29a1b6a0@t-8ch.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca2c10be-3dc4-45e1-b7fc-f8db29a1b6a0@t-8ch.de>

On Mon, May 12, 2025 at 09:30:39AM +0200, Thomas Weißschuh wrote:

Sorry for the late reply, I missed mails for this series.

> On 2025-05-12 15:11:56+0800, Sung-Chi Li via B4 Relay wrote:
> > From: Sung-Chi Li <lschyi@chromium.org>
> >  static int cros_ec_hwmon_read_temp(struct cros_ec_device *cros_ec, u8 index, u8 *temp)
> >  {
> >  	unsigned int offset;
> > @@ -73,7 +117,9 @@ static long cros_ec_hwmon_temp_to_millicelsius(u8 temp)
> >  static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> >  			      u32 attr, int channel, long *val)
> >  {
> > +	u8 control_method;
> >  	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
> > +	u8 pwm_value;
> >  	int ret = -EOPNOTSUPP;
> >  	u16 speed;
> >  	u8 temp;
> 
> Ordering again.
> 
> This should be:
> 
> struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
> int ret = -EOPNOTSUPP;
> u8 control_method;
> u8 pwm_value;
> u16 speed;
> u8 temp;
> 
> or:
> 
> struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
> u8 control_method, pwm_value, temp;
> int ret = -EOPNOTSUPP;
> u16 speed;
> 
> <snip>
> 

Would you mind to share the sorting logic, so I do not bother you with checking
these styling issue? Initially, I thought the sorting is based on the variable
name, but after seeing your example (which I am appreciated), I am not sure how
the sorting works. Is it sorted along with the variable types (
"u8 control_method", "u16 speed", etc)? If that is the case, why "u16 speed" is
in the middle of the u8 group variables?

> > +static inline bool is_cros_ec_cmd_fulfilled(struct cros_ec_device *cros_ec,
> > +					    u16 cmd, u8 version)
> 
> "fulfilled" -> "available" or "present"
> 
> > +{
> > +	int ret;
> > +
> > +	ret = cros_ec_get_cmd_versions(cros_ec, cmd);
> > +	return ret >= 0 && (ret & EC_VER_MASK(version));
> > +}
> > +
> > +static bool cros_ec_hwmon_probe_fan_control_supported(struct cros_ec_device *cros_ec)
> > +{
> > +	if (!IS_ENABLED(CONFIG_PM))
> > +		return false;
> 
> Why? This should generally work fine without CONFIG_PM.
> Only the suspend/resume callbacks are unnecessary in that case.
> 

I treat fan control should include restoring the fan setting after resume, so
I think if no CONFIG_PM, the fan control is not complete. I am good with
removing this check, and if you have any thoughts after this explanation, please
share with me, otherwise I will remove it in the next series.

