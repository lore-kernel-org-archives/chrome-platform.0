Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18551A23A4
	for <chrome-platform@lists.linux.dev>; Tue, 27 Jan 2026 00:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769473577; cv=none; b=WtQFI2xJorGcG5kGuxwrXLziEXEsxnLc8HXQBa2zDABUCH+rO0srGTClq6aVOB958tiRKwtpA6x0NFcuC+L0AvAp7dmC3bdk7nRjD2dS/5HjwW0+rYssjHkQd3WXKDNbcnyEmY+PCHoTBoOYpuV62tbAwWY6E1zVNRSK5mDScgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769473577; c=relaxed/simple;
	bh=fdMi7TfKrS7Cmghmf01IPyUxkj4PPBLbj9OGu4MkLsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=covMs+rUYXfMBBiON0lAf9LOArFPfjIDXdfInxUkxf1gSAtaY5wE2VxPWTplCeoPkVg90Bsp+4+GiIEQaA8Q7C8FD6KJHVhZEoB5j+NQ+IDuSLKhSjZI0+G7oj/scPXpmbWjhLDV/vv9PzWjy7weLLjD1pEWw3gyHctmqoq9i7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfkGwN6U; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfkGwN6U"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0d52768ccso33890185ad.1
        for <chrome-platform@lists.linux.dev>; Mon, 26 Jan 2026 16:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769473575; x=1770078375; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nIkKftRmvZrX00LdvEp/NTz/bb5lQOW0F+qle7ug6ME=;
        b=SfkGwN6UhvmjfRkX+GpVdDfVIHYv/8H/E1XkFmW5S/1Td3SJwOQK1bYIXg0PFTGAli
         PX4ek/+JaUuu2m3uAfQJ2ZsBWfQh/Wcq7Qrt3JNV7/pL8x4mxENJTS2wqsw1u6mzn+Gj
         s2RHduWAu1jAZYlVIZBlgaEN9JAO5GFzRkRU7X3wGE/O54bHVtth+2glraNTbButzZW0
         daHsfNzi5o1DTkwzxs6/NviJYVq/OFRBW/cR2ymA3sxfYQlWmaxjSFZtTHwV9UJCwST5
         AqvKv6hPMNcUxrmDIo+C3htRKbY+bFha2Ysd6MuOj9+5uVvxuCblovCFLyD/YP+191In
         +k+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769473575; x=1770078375;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIkKftRmvZrX00LdvEp/NTz/bb5lQOW0F+qle7ug6ME=;
        b=G1JmzDSHua4FTY0fMseU7ltcy9Ryojg1Xh9CFzZZUp9KqdyHSc0VDpDmP/NpvCmG4Q
         4D9Kk/NuW0kdrBKde3NPQNlHwi6LtCjwjl2dksfM+3DJTv5Bf2gV4+MsTIomIpE3pSlW
         ns24gQWhZyvwvD0lo8TGy5kvNoTygjGtJXtocg52WbQJ+8QbLlaLQW+RY3QMzhco7ECR
         uLNlM4Ih6C9IwFO1y/M77xnkkEhKESLqly7+07eKbfEAUpaPgyFRoRFdH1K0a5Pj+H79
         H6pztk+pVzYvG8edhJ4PZayuoUFm0W0eeRNemauDppBDf78iS94LkgZVv2DgTEfBwAH9
         qqVg==
X-Forwarded-Encrypted: i=1; AJvYcCW/wh4ScgURVKzeGJCV72+oO3zzZCiQ13Ibd2TN+mf2CxdTqNv0mQjP+/R2C58vuwuJgGfsSxSoB5YBVBSBbtA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmAqW/0lKe9jCEk9WQUIWXoiMZJ5n2j54zCJNESm1C2ZqeFy0D
	JgAXLoIhBpfT25UG0h05ohUYZvjb6Q1T1ylzoUmI8HMbeHQ97fB4zz2OQaqauEHb
X-Gm-Gg: AZuq6aJYIQhsiMCINXUFPq11mzPpv0f/mAXQtZKnaUymsWuz9cIMPwjAO9JogvBIkT3
	YDaDcjcVOw9fMDpwZmx65ZonAkkC4j971epUlO9QS7KvjEnPt73chWPeP5HKKLKbAbRQ4w/hpZm
	SSUTo9tQG7aI3Fk+p41aUo0DqjgFEdiXLR5pTV1OUCKAjEkejq7X36GfZX3e2WPEZJQkmYERu6c
	vdxKVClBIdD81F9HLOQc/Cc8c3chyiQq/WcQNSn9Yy153bLyaJa0ksxEQWdcLsBcOizIbd89PnV
	k+cFgirK75bFc2ZYaBLiTLqXRjVouuFkt1PaDpkT+jDeaKZlkHydNKanxAeuHbZyQlHwgayi9Mc
	OTZZoQSIv85fmRUBnsniY0gfWKutt5H+mqkBTEMmSMmM5uoNQozTQUk1kAB7IIpzzV/CxsNB+ym
	sf9TZzPAXsQM0NEOi+GYwm9gF9
X-Received: by 2002:a17:903:178b:b0:2a0:d629:903c with SMTP id d9443c01a7336-2a8452f0c02mr62071425ad.30.1769473575154;
        Mon, 26 Jan 2026 16:26:15 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f98583sm99346985ad.54.2026.01.26.16.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 16:26:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Jan 2026 16:26:12 -0800
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
Subject: Re: [PATCH v2 4/4] hwmon: (cros_ec) Add support for temperature
 thresholds
Message-ID: <0eae08ff-22ba-4c85-a2da-4cde7b50e156@roeck-us.net>
References: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
 <20260118-cros_ec-hwmon-pwm-v2-4-77eb1709b031@weissschuh.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260118-cros_ec-hwmon-pwm-v2-4-77eb1709b031@weissschuh.net>

On Sun, Jan 18, 2026 at 10:45:58AM +0100, Thomas Weiﬂschuh wrote:
> Implement reading temperature thresholds through
> EC_CMD_THERMAL_GET_THRESHOLD/EC_CMD_THERMAL_SET_THRESHOLD.
> 
> Thresholds are mapped as follows between the EC and hwmon:
> 
> hwmon_temp_max       - EC_TEMP_THRESH_WARN
> hwmon_temp_crit      - EC_TEMP_THRESH_HIGH
> hwmon_temp_emergency - EC_TEMP_THRESH_HALT
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Applied.

Thanks,
Guenter
