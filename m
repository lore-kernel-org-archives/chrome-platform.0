Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD23EEEA9
	for <chrome-platform@lists.linux.dev>; Mon, 17 Mar 2025 03:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742183485; cv=none; b=H9jAYk/D6iJTNMjZMnacQyUrpf0ssL1qT2Az9Mf+4LIZ+rbUByod7XXJsdmmMWOYUFym6jjzBpm82fyY2JG+BolZ4BmSboiaGAvF4aKENITiQVhkXS76vHNQg5wOAhqszR1Jul+SZhA95O+ULkH/Nx2S6vuSzsdRTMGxHkwUvP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742183485; c=relaxed/simple;
	bh=Bn92wbaIQwnR7LDXhf2VNfpNMnGgk1DVNZHihOSS96s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXoXmlgatQU33DmgMckOk28Z2idPqbeGVS4AH+ryxu4hfXtEb8hyTUxjeStPxZq1pFycLrE73Q/d5HsAVnl8VGG7IDBfg7VkeSyrKcsQ2KxlKZKEAq9JOsPnrDFznCighp9DUn5F8QlyFkSNXybKod8ONKUj9Uc/Tj8dNJAju4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CSKU0akH; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CSKU0akH"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22423adf751so60122575ad.2
        for <chrome-platform@lists.linux.dev>; Sun, 16 Mar 2025 20:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742183483; x=1742788283; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mNZBfMvSNnXJiaeX6hMwSsN7OOb+ypIwewtzoH1j+pU=;
        b=CSKU0akHnUHIAT4i5X3xmk/3Dl4XrhKALJQZyyii6YZWNJIcJ/eygzUFGPLudh/fMg
         NpY+DRFHNGwfX/O65sdHgNxHT0leFCt2Ev2Hnls/mbzmnwumaOxlPIEfyxwtrEDWxlU9
         kgKY/EE03CWQkpLMgGrk2+3trMqJUvddzmdM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742183483; x=1742788283;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mNZBfMvSNnXJiaeX6hMwSsN7OOb+ypIwewtzoH1j+pU=;
        b=eiAHCab/GJ4P5aJ7gzoBv5UftvjX8PwOepe+RKtIjkCVhDBPSz/gTh030wJTAwXVhd
         4hUdicGdd4is7iZcjeFw8gYDNCtsIwe7gyY/4bGIDnwFBWrReOcpvdQfCSFrg4bjW5fe
         RRrbKg8zJWMT5xY/Vcv69Zt2f+vF12ZjkTvumGeRmN9ilPaazA5S4jGJKGxhVvrtodEz
         GVUM4P3XuUD3QNhb/X8l/mUqzD9O8w63XLIjaU3itYSDp19YAtEK7IVIc2Oe6+knebtb
         JYtTBu1i+SfK9TPSWBt3gzWtXh+/vNh+Dw3QhOkX9BpKEqDdyMCFd+/CGfy9VuJmxo0G
         d6KA==
X-Forwarded-Encrypted: i=1; AJvYcCXqa5BgRaYi2g/Mfx1clvyC3FWcthOXGDxi6KJdPWuF6M1GLJTUes/jn4Aidw9IpFKMSY7VOwzxEU/MRWM8tKw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0mjif25ewPxhXT4484k0q3XLvHI9+587n77Vj3kPHfmmku/Jl
	UE+n/En3DXjxqJwzqdPcxmia9EP9O7c7VPynekpyVItymW5uA2trOWkwLaXeJg==
X-Gm-Gg: ASbGncvJt+udws840kxovKHuLs97N6BxaYOWS1S/9b7cCm51JvUIWcCfjmEAPBFmBVw
	ZRKeHnr0sqNUfnrgbRJn7YU2gKq2TE2g/RwSn8f5xN0KSeHaD/fMqgA+EqAsGtj7+0/wnhDNGoO
	rtSm11Uf/kxuEQdxUyqX3wit1HbZyHcDWH6jIkZ4S7Lf6iaWDpxSxwyC2tN6sq13/FrTPxzW/7x
	RwmAdHx0kpRIxac6NYS9eSK+PVUQK0V3Ii48ACrH2x2y5nN3rOJQ23ayVpZLwAiKfP5dsnEKLaR
	RQE+0tFSDGYf/Nc4cFMIUCrj/ny8BRF79HSQm4Y=
X-Google-Smtp-Source: AGHT+IEPQ1bRD4grN06N92KNZWUf4hENnVZkATK1o9ytsZfQcCKJcjED3P0YY6Zn6G9M/+mPJ8xpdA==
X-Received: by 2002:a05:6a00:9a7:b0:730:927c:d451 with SMTP id d2e1a72fcca58-7372246dacbmr14550119b3a.20.1742183483104;
        Sun, 16 Mar 2025 20:51:23 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:77b5:e0b8:95d2:83db])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9ddf44sm6193099a12.18.2025.03.16.20.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 20:51:22 -0700 (PDT)
Date: Mon, 17 Mar 2025 11:51:19 +0800
From: "Sung-Chi, Li" <lschyi@chromium.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] hwmon: (cros_ec) Add reading target fan RPM function
Message-ID: <Z9ecN4ZWx1P5csrK@google.com>
References: <20250313-extend_ec_hwmon_fan-v1-0-5c566776f2c4@chromium.org>
 <20250313-extend_ec_hwmon_fan-v1-2-5c566776f2c4@chromium.org>
 <782e6319-2082-4f05-9987-fa68439701ef@t-8ch.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <782e6319-2082-4f05-9987-fa68439701ef@t-8ch.de>

On Thu, Mar 13, 2025 at 05:24:28PM +0100, Thomas Weißschuh wrote:
> On 2025-03-13 12:47:43+0800, Sung-Chi Li wrote:
> > Implement the functionality of reading the target fan RPM setting from
> > ChromeOS embedded controller under framework.
> > 
> > Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> > ---
> >  drivers/hwmon/cros_ec_hwmon.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> > 
> > diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> > index b2fec0768301f116f49c57b8dbfb042b98a573e1..73bfcbbaf9531be6b753cfef8045fd5dab5b2ab3 100644
> > --- a/drivers/hwmon/cros_ec_hwmon.c
> > +++ b/drivers/hwmon/cros_ec_hwmon.c
> > @@ -36,6 +36,19 @@ static int cros_ec_hwmon_read_fan_speed(struct cros_ec_device *cros_ec, u8 index
> >  	return 0;
> >  }
> >  
> > +static int cros_ec_hwmon_read_fan_target(struct cros_ec_device *cros_ec, u8 index, int32_t *speed)
> 
> int32_t is a userspace type. In the kernel use i32, or even better u32.
> 
Sorry for missing this important detail, I will not use userspace type
for following changes.

> > +{
> > +	int ret;
> > +	struct ec_response_pwm_get_fan_rpm r;
> 
> Switch the variable declarations around.
> Also call the request "req".
> 
> > +
> > +	ret = cros_ec_cmd(cros_ec, 0, EC_CMD_PWM_GET_FAN_TARGET_RPM, NULL, 0, &r, sizeof(r));
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	*speed = le32_to_cpu(r.rpm);
> 
> r.rpm is not marked as __le32, I'm not sure if sparse will complain
> about the usage of le32_to_cpu().
> 
It did. Currently, all devices are running little endians on both AP and EC, so
I think it is ok not to explicitly call the le32_to_cpu?

> > +	return 0;
> > +}
> > +
> >  static int cros_ec_hwmon_read_temp(struct cros_ec_device *cros_ec, u8 index, u8 *temp)
> >  {
> >  	unsigned int offset;
> > @@ -95,6 +108,7 @@ static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> >  {
> >  	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
> >  	int ret = -EOPNOTSUPP;
> > +	int32_t target_rpm;
> 
> Also u32.
> 
Same for the kernel type changes.

> >  	u16 speed;
> >  	u8 temp;
> >  
> > @@ -111,6 +125,10 @@ static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> >  			ret = cros_ec_hwmon_read_fan_speed(priv->cros_ec, channel, &speed);
> >  			if (ret == 0)
> >  				*val = cros_ec_hwmon_is_error_fan(speed);
> > +		} else if (attr == hwmon_fan_target) {
> > +			ret = cros_ec_hwmon_read_fan_target(priv->cros_ec, channel, &target_rpm);
> > +			if (ret == 0)
> > +				*val = target_rpm;
> >  		}
> >  	} else if (type == hwmon_temp) {
> >  		if (attr == hwmon_temp_input) {
> > 
> > -- 
> > 2.49.0.rc0.332.g42c0ae87b1-goog
> > 
