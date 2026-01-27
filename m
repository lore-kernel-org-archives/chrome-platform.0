Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3073318CC13
	for <chrome-platform@lists.linux.dev>; Tue, 27 Jan 2026 00:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769473470; cv=none; b=q2hJkyEOtpc5j9gAHJE7S8xPNXZe1uzD/UxxNebL616FKNrY6tiJ/W79jzhTkLeChjKVteMy+hSVQ33IhV2Gk4KjgBLnFs3/GWjnjYr330ISjlRXKQyIRyEdNDI5tkC8/48Mk4IO9WIJQ6PuwYmwgMnHsEJaX9wotJUQmeo02Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769473470; c=relaxed/simple;
	bh=ACpZPpzSm6uu6fLQoYPtsLzX6esHERNtAJ4I1LSnkgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGyMw9kzwETh0E9IKDZG3xNQeWo4AzfjS4o6ksMJY9uKUwXUx9p4Z7y1DAIlrVJ2H7zgU6EHSPQMbTT8C/+BDC6BQvvtNZR0yMGIk0dVOkoRB55MKhRX6OMWnNz1Drwz4LUCKLMi/40u793I6SV+YjKymmsP/SAREzhIDGkMFcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bX9LDwwM; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bX9LDwwM"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-81e8b1bdf0cso2731154b3a.3
        for <chrome-platform@lists.linux.dev>; Mon, 26 Jan 2026 16:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769473468; x=1770078268; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uvE6c4On0NDkZlHYWRtTJlRv2fTiNlkcBcwXsGT/WiQ=;
        b=bX9LDwwMP3QS6EGmsElX/H05rpkohWPmSv6Bfwh90k2hlZLdIg9UO7wOchFkKuMbmJ
         /8t3VRlojeEhZuJWiQIENm0gqA7PvqheKlYXwKUFmb1V/0ILfHPhIokm0uK9R6nX2WxP
         WLPNt2USAlpC6T+K32AQO6T1c9vQbNdYGD5chJe0dkP3amsoVRX4/LKIP8uJNnFJ7/KY
         Ol1HyMnf0V7dQt8l/MbARRdgGVnbHio67iBWBa8n47OWtquc36Vw5FCFRpTdp1/2Kzv7
         AWGszGFQAEHB7WYS13Kviw/6OLWV5e8OArcrrQkK7zWuWTwVv/TkAyyQF+7/gZgfcrfB
         Ztyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769473468; x=1770078268;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvE6c4On0NDkZlHYWRtTJlRv2fTiNlkcBcwXsGT/WiQ=;
        b=ZiUf5d03/5GAM+nw6EBttkmaqXGtoI27mDt2wmumXS8E5vG8EDrqeTK3GZPk8DavxJ
         V9HGZRQkHzMAmunbmfS2f8sErLY961nBaLE7OCtlovDXJYlBdBea4Nw30Dl5nmuw813X
         Hqqo5KndhBWS/DCX1nTFaGqg2buT0OpWDGJtSazfXXA6HVWSmnXflk5wC7Vt+p9Bmxch
         NYZ9V5m0luz0BK1Z3y6d79dK4tT1PJ83IMBmIpk/5lOqh/FHyYsXhRrFgFxrbDGFesqx
         dk5mPBbGGfExnlirQh5Zt2CIU8ql4RwWrCHg7O0igLXiU9UamlK2tHVnRMX8cSpuJCOC
         MN7w==
X-Forwarded-Encrypted: i=1; AJvYcCWHnzzjp9xoFmkWvVW7x+/BlfW8iHCbA9gfRkH5LSa8oQr9q0yMrUVDnEWa5Ha5j9lTnR6b3AqV0+rt3bt4MJs=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywke8OOuLgCtpytis5Kt0rmYjCds6Mh1mp15tOcn13wbMozCiTB
	E7uV2eixgcWSsYUaCM8TOD1VOc3nfi2AUxdO9dlXZ9HnIcj1r/PlFjBi
X-Gm-Gg: AZuq6aJVSuV/O8vkQXEE1AXG4yClay80SkuUhaz5vLqw8gfu1hppqbwQEMC3eUH5TnW
	EuLrMdI8g8mgGjtTE5XjkFRyLO5XRvpx9oDVJ6yi13z/hi01MApPjonL0Yc5yyJhabxwB0HOp8r
	vQZ+HaWpDntaqlAqqRFXZ5N0Xg5c3XidlBlLUkVLuCNkqhEH1sb2XUZgB5hacmEFKrwisM5x6tg
	fcg/S+J2bDSzkrQe2aGT0gns+e2JXgwTnV59QverJxEGiJ5BRQusQIlSeiL2Fua8qSSkjaUxDgC
	0D+1r3OinHMWVgjLqpYesi4DimQegsjBnuPBBkcaPeSjyr4tfSVBAElInz4Xfg/JkngVbm7h1uc
	tWB273WyiIQluxduw26PKacvEE6NqA+5ynKcbFIsmV2gubzNAhkphrzH+FdjIqMWEbK52bZpNQ8
	tjt08X4v+ZhmZ3o8UB6kZ5yr81
X-Received: by 2002:a05:6a00:2496:b0:81f:3c77:a24c with SMTP id d2e1a72fcca58-823692f3e1emr3516b3a.66.1769473468610;
        Mon, 26 Jan 2026 16:24:28 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231877005dsm10131115b3a.68.2026.01.26.16.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 16:24:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Jan 2026 16:24:27 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Dustin Howett <dustin@howett.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Stephen Horvath <s.horvath@outlook.com.au>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Sung-Chi Li <lschyi@chromium.org>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/4] hwmon: (cros_ec) Add support for fan target speed
Message-ID: <f8cfde51-a2bf-4718-b9d4-064a4375a057@roeck-us.net>
References: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
 <20260118-cros_ec-hwmon-pwm-v2-2-77eb1709b031@weissschuh.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260118-cros_ec-hwmon-pwm-v2-2-77eb1709b031@weissschuh.net>

On Sun, Jan 18, 2026 at 10:45:56AM +0100, Thomas Weiﬂschuh wrote:
> Use EC_CMD_PWM_GET_FAN_TARGET_RPM to retrieve the target fan speed.
> The EC only supports this for the first fan.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Applied.

Thanks,
Guenter
