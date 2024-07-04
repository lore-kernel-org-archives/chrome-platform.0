Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B0B1B141E
	for <chrome-platform@lists.linux.dev>; Thu,  4 Jul 2024 15:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720106418; cv=none; b=Huls7mVQ7G77bY9coJYhtAh1yipqsKdgXUWHAARYwhiNP+DLRTEPFn/ZrHy/dGuvJeNUKJH1PH0jIRjrj8Vo8t1m/KdH6ZvjEBzlyM8QBT5bqaxsEjkPQbsPGfrbzcGLkj+VYBNANHMFrtxizkK7SOXvy2tFJKdy7Mnozgd28Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720106418; c=relaxed/simple;
	bh=9fcpUZmQBe4/wJw31hTEzN5Ihq9BhdDEvNPjOs/sXRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kCNXLjMrqrDac2nwIqILq+w6k2Oi7c5Co3qCGmBc4j41XpPso12A118Jh5N+mCuovxvNEFrB2y5uLFih7YKq4YZSFC49scjBAmXps15O+uqcztFndK3/FaH66uElf/U2+xZhrp7cdoSVPQKl15MTVv1vmf5QN2zHAq4quqh1Nuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PJFPCeJk; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PJFPCeJk"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-25957dfd971so310646fac.0
        for <chrome-platform@lists.linux.dev>; Thu, 04 Jul 2024 08:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720106416; x=1720711216; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCfjSnd6ABJJVRUZ+CPHucIGLcyOLzefU1zOQiTQK8g=;
        b=PJFPCeJkN0rlv3vJTb+V4/dLX82qiccJIe0Vrwzz7uKuEzWbxPl6aoApV/7+pR0aIM
         hj5G843hA5kxhXOCNLqy5oy2qNUh7xSWuHUobw17b7gS7p+2U8WqMb2Zx80oKsIfnTI0
         5PrcxV7clxVJHPFSrmlgrPtoPkLl7HjqdT54998IhT6EwmWfHL+leehL1/wdJI6q1PbG
         v03b+WjAwngX/Iw3oHXYIAeLfpFY7wlU+QKa/gaXAa3lLTWfBw7q8D5U/EAe/UVK/eed
         xLLDPNLgPyH1JuvsAKW+I6Dbzp+UcypgRwsEJAvlsiFOKVpYtrL2SORKISgEqXIs4gOM
         SBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720106416; x=1720711216;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCfjSnd6ABJJVRUZ+CPHucIGLcyOLzefU1zOQiTQK8g=;
        b=m33K6oz08qe9dpq6DZ4GUkhsURMN+CWdWk5qyxO480vmsQufgox+PHdLbqeYGtVT67
         AZanMkVo+kvODMk6sNx4Yx1UnKAqlcyNvk7+pQFD4vwCv+SCVviM0DtbQ17nZ1077NbN
         Q8v8XdanJnxlQ7ooyc5pNG8GYGlKMDp3TuUfwUs2mrvjkR44zL+nUDKWaKUSm6hNh4M0
         DytvEPauptU7cJ/QE1hIEOMvsSM4tlQlXr36i/fo54hnUGqCB9FLwNeMN1qpM1kuQBa6
         Mk6xuVaZoI0yrPbTjJ4B1fBHmK8j6EuhY50scYRwwJ5yqg61cvmshPJcCfRKGoeIb1yC
         Dssg==
X-Gm-Message-State: AOJu0YwLaanYvCV+MWk/346TYrZuNKvx37X+vesjVa7jmpSP4Z5YVw96
	gBn0LOEofJB9q4677eIu9eZ2ZE9NqS0STB8T5CCVf4lb/Dtv3n7m2IoqC5Gppqw=
X-Google-Smtp-Source: AGHT+IGkdGTi7fxMJctO244tjIW92v9O4UBG0QZMpG4vg2tmRLLeggtdAWPyCy6ptnpDYeqigJc4nQ==
X-Received: by 2002:a05:6870:171b:b0:229:f022:ef83 with SMTP id 586e51a60fabf-25e2beb00cbmr1713074fac.43.1720106416480;
        Thu, 04 Jul 2024 08:20:16 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:96a0:e6e9:112e:f4c])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e22761de0sm541756fac.54.2024.07.04.08.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 08:20:16 -0700 (PDT)
Date: Thu, 4 Jul 2024 10:20:14 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: chrome-platform@lists.linux.dev
Subject: [bug report] power: supply: add ChromeOS EC based charge control
 driver
Message-ID: <8af72a2f-60c4-454a-a930-b951325db5ea@stanley.mountain>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello Thomas Weißschuh,

Commit c6ed48ef5259 ("power: supply: add ChromeOS EC based charge
control driver") from Jun 30, 2024 (linux-next), leads to the
following Smatch static checker warning:

	drivers/power/supply/cros_charge-control.c:318 cros_chctl_probe()
	error: buffer overflow 'priv->attributes' 3 <= 3

drivers/power/supply/cros_charge-control.c
    304 
    305         dev_dbg(dev, "Command version: %u\n", (unsigned int)priv->cmd_version);
    306 
    307         priv->cros_ec = cros_ec;
    308         priv->device_attrs[CROS_CHCTL_ATTR_START_THRESHOLD] =
    309                 (struct device_attribute)__ATTR_RW(charge_control_start_threshold);
    310         priv->device_attrs[CROS_CHCTL_ATTR_END_THRESHOLD] =
    311                 (struct device_attribute)__ATTR_RW(charge_control_end_threshold);
    312         priv->device_attrs[CROS_CHCTL_ATTR_CHARGE_BEHAVIOUR] =
    313                 (struct device_attribute)__ATTR_RW(charge_behaviour);
    314         for (i = 0; i < _CROS_CHCTL_ATTR_COUNT; i++) {
    315                 sysfs_attr_init(&priv->device_attrs[i].attr);
    316                 priv->attributes[i] = &priv->device_attrs[i].attr;
    317         }
--> 318         priv->attributes[_CROS_CHCTL_ATTR_COUNT] = NULL;
                                 ^^^^^^^^^^^^^^^^^^^^^^
The ->attributes[] array has _CROS_CHCTL_ATTR_COUNT elements so this is an out
of bounds write.

    319         priv->group.is_visible = cros_chtl_attr_is_visible;
    320         priv->group.attrs = priv->attributes;
    321 
    322         priv->battery_hook.name = dev_name(dev);
    323         priv->battery_hook.add_battery = cros_chctl_add_battery;
    324         priv->battery_hook.remove_battery = cros_chctl_remove_battery;
    325 
    326         priv->current_behaviour = POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO;
    327         priv->current_start_threshold = 0;
    328         priv->current_end_threshold = 100;
    329 
    330         /* Bring EC into well-known state */
    331         ret = cros_chctl_configure_ec(priv);
    332         if (ret < 0)
    333                 return ret;
    334 
    335         return devm_battery_hook_register(dev, &priv->battery_hook);
    336 }

regards,
dan carpenter
