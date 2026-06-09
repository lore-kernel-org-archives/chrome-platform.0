Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF499382374
	for <chrome-platform@lists.linux.dev>; Tue,  9 Jun 2026 20:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781038315; cv=none; b=RsfOosg+mSBWjvcUwf2xkQj4Zy9/8qWX9QHNxTVSL7+Krx17429hbliogsfso/xIgcbK8aK5a0FZS1TvYP9xrssvx3Z5ce5DIeSCULMXLv7T/crsfzL0ZkrCR/U2TB75K6Ag0icwtZFvN2YQhGRqlRWQzxecHfPlqACvYL2CdIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781038315; c=relaxed/simple;
	bh=q09taP5tBk4Lcw407r6hewZnj85tQkEpw7jC0qG36Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2YxrPMqSXqe/b/8FamhQ9L4Y1+Yj7Ddj+NN80cW2hr68+mxl8FBIqQ2SjS5PBOqHTv0YJLaUUtJGIDMb1XwM1ntgnrSV0zQW0o9fKaEi8r/tvXsc5+gCPm/LDKHVb+roeYTsxV06kKQxwFQliyl7cFdkUmHpHFRkGY94QVgD30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AhiFnP9y; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhiFnP9y"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bf1f074a12so62058005ad.0
        for <chrome-platform@lists.linux.dev>; Tue, 09 Jun 2026 13:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781038314; x=1781643114; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ikKWrgQ/DAI1p7i6Ea9OKMWeL/DQ2eJ+hNZTL5L35eg=;
        b=AhiFnP9yrMZdeaJkeTU2tajcCrsCvu5zpZpFnX26F6yW04d9GHuIZTzyOwcj3/CTls
         +0HI4RMmD1KgCUEEK/na19y2t3bU+2sY/L5Yic5TYt8zpcnARNmG0Nl34UmsFgSEUpF4
         QBEb0d/zhTwFACh9sCVoMUVNC6XBnsfwRS4LtdF+Z+tyzD/VhxWPb/sDWEOrIpVV1yJ4
         M7PAfqCrfovoezvBMBXKbZuT/ccx/r+HOe6k24nzhR3qzO6QuJ7YxDOHUQEpjMQDJNTs
         lXA5MH3aTJ6el0m1m/bxiaUr1nPgaDnpUdri9WB6oDF0J+p9iEsb6GIhzOSsEe/KvYGv
         lcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781038314; x=1781643114;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ikKWrgQ/DAI1p7i6Ea9OKMWeL/DQ2eJ+hNZTL5L35eg=;
        b=kUsPgU/EmOTTHHGA8lO9M8/R9/e0ozKkyMFWhtjZk7gjn8/vRKW+Hh9q1wpKxWIUsw
         DtEn2trxMw2m/BF8yahgeOyCqEAZ+/KBLm8uvmw9Uc5ueXHKHd1KlSm2PrnXc+0NuS22
         746t1JhpFGXaS9fEqg4rkaQbKrcpm7u4FgC/dkiQ7OknKYoqC/fkVyKs2AlIaxmMZBIP
         FvcTQgKqI+whpVyOEBjqVjhyeJFz2EU/uufNKGzh2TTakkX+brsDsvLaTmn7lkwyRqVY
         Z+6rO3MoIrww2zKVkIZ0qAC4+iKLhEYpMUO1x/JacXEKcnZizFnBsqQUVcnnsWh1HV8s
         i2Jw==
X-Forwarded-Encrypted: i=1; AFNElJ/rTr/p7Ips8gD9PEK2byprKcxepmeCgQu25sqewh0oaQ4bH8FvilT3H6ePnVnRRRHfZCDcqWJSKnMfL08SQ/A=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMooXRl7U2+YU8Y4Jwn0aA0q993rY4LM4JwvMr9Rcm8/rjuOZ1
	RaVv1ZlfBsBOmCN6y1tAcfLYtP82im6RRTFJYSSR4Y6PZp2E67KUrXgB
X-Gm-Gg: Acq92OHZoO28r9L7gZKm5mPAhjKprXMd5XJqZH2cgI0Wyr+iidMT+vKxvAPVInl0P3C
	gvkas15KGhAWpR84qX4P3t2ZELH5PSD0SFubHxSjEuM63TANLafoxcZjPvANzzdUk85u8O08KU9
	f0+DFeOzt2qA9L8VCyAfAu1THWCJ4FTX4s6JiggNmY3N6kcabjQpLKtvdcLlPWlumgmYkO6RL1s
	ggBSufmlVZ3zseNQ6iNulGSSfOoYeSnD8Xh3JjzpbS0q/feLUfEL1qH1fotwGQBWRmWwQC1jvS3
	crcftY328/6PYQuIgLbjtteUwYbmp/gnlFBIbpm/yqgDQNNnTXdSRyOmMOJ2gNI/VJ5LloKf3eJ
	+vo9+6261926lHPSOADRJc7YjcLgYp5W4qishh4BvQksCh0S2wZXHduMpR845AwMzNUgaON7lZw
	fBH3m/CvroOXATSMbEusIQtNCWCej2l2B1EX4GKTF4UCrvBII=
X-Received: by 2002:a17:903:291:b0:2c0:c940:dc32 with SMTP id d9443c01a7336-2c1e821dde8mr260514775ad.16.1781038314139;
        Tue, 09 Jun 2026 13:51:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649c302sm216009535ad.73.2026.06.09.13.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 13:51:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 13:51:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] hwmon: (cros_ec) Prepare the addition of custom
 groups
Message-ID: <457271f3-b8e0-460a-9537-2127c252769e@roeck-us.net>
References: <20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net>
 <20260529-cros_ec-hwmon-fan-curve-v1-2-da6792b3830f@weissschuh.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529-cros_ec-hwmon-fan-curve-v1-2-da6792b3830f@weissschuh.net>

On Fri, May 29, 2026 at 10:31:53PM +0200, Thomas Weiﬂschuh wrote:
> An upcoming change will add a custom sysfs attribute group.
> 
> Set up the scaffolding for that.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Thanks,
Guenter
