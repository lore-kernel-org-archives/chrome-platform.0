Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DDDEED6
	for <chrome-platform@lists.linux.dev>; Wed, 26 Mar 2025 02:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742957084; cv=none; b=DmIw6Z4kKfC/AuEanQtRHJrQHIsSrjN0kSdEZnqdFNDGO/8rt2tjJid8EZTiMXvm3f4yImffUcOc4/wvflf+2T06T/XEyqxT24YiFRVZK1EyueLcZyHtKAhdgBEJSr+gU8keZNA1nCxVRGf6UecZj/32AWlfOK/SisrxbEmu+T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742957084; c=relaxed/simple;
	bh=XxPAydEN/QVzZOUrNuNHLVqKWZeO4X//CfD2Ek1J4cM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cr10npvHKWODESDc0wdTp6nqKyAfMw0bGWVJK6sqJ7m5KwR6hENHC9E9qK0MPCkwPjN7BnlAVgcjxuIQ66JEYjoBKVMz4SLAKxvYeiGcEgMXx95SvTJRpPXhgNCmZeH1aGKOkIAU1mwIK2F+AM9QvmF2rKLoFvSKAU+EhHObtmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mE0y/C4U; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mE0y/C4U"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-226185948ffso123566415ad.0
        for <chrome-platform@lists.linux.dev>; Tue, 25 Mar 2025 19:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742957082; x=1743561882; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n+QVNWHqDnDbjGyo3K6bEwTsBkwG4P8ZSV0JdfZxw+I=;
        b=mE0y/C4UJaaHERyGkTka58JNjosiIG0TlQgexUdLgjOwGKVvebbhqhtzzNuWPck7t7
         XHhfEiVcfYxHh5Pu2IHaUkq4reR3UteZg14X8pl/8Mq9b8hFCK/o+vsA4CWOsoI3M6kv
         sDt46xa1dvEEpGXckwIm2LJamq72e1lyZhOtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742957082; x=1743561882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+QVNWHqDnDbjGyo3K6bEwTsBkwG4P8ZSV0JdfZxw+I=;
        b=cYEAWPXywVu+2CVIGcV5SWA6bsAht4DA0yzze0sEornoopez15nJaSRfRbMckAn+g4
         0scoDnB876kiKZE+I+WJ3WFTcmFiGfKFJWf87nFP5qKdG69wJ6F3KDZbpkjRpnJRGduB
         8UwC1PBV0iqgW/oO9FFTab5u2vM9XOqzpk5N30HvLT3d0sDmXLegCpwVWXPaPeAKR/W3
         a2hcKCWrYFE+UG7LfjZ6edMEEk6kwBwRpVMBXlzlv19RrclVboqGNV1ogihL67WVEPD2
         +reZrrPRXo6ws0jvXZmVtCcBRaDZAwlPNCO8UWbs5jyUcqVNZHj4QdjaZDRCs5qyP4Sh
         U1Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVYZIprZb6SpqBuZVmSR7DCNTjhdL6S2XAEJcvjT5A8rxvGZQvmKS3BJVfJ8cVskTdrSDn+/XDX985wG3MQ3iQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzK8cjxdNO+2iep2WZsbKq7DeUZvSP5nq3jBD3eWqMY14U8TGz9
	k13QQ45eerQAIIQfd8A169OloYaXp/HLogQyAJFV/jqAnXR9COCbiZ6upLXWfA==
X-Gm-Gg: ASbGncs5IxtKLjOrXtLvMqW5AuECrBJ7CfFFC5JTq7MqZkwsyFURs+LupNfZg3jmOo9
	usnR8ZE8Gd15vtPM3F4zRLgIthzM1uOKapYZwq8dtr15nPu/2cxDCxh6HYyzKsJM1gGpa3lz+Ip
	VSeOPTAhVj9xiQhxp0Rj7UQZTHolcqBOAqO6CX0pGzOpg6gRDWoupwaupXeTYFx5Q7/09TYDFeM
	ZhBed2N3YqUXU1r19Cs1xHtzbVYngRRPQ88HdtKY2f18/NIOH/oMl2aal/18THwxaQlnZce9K/t
	vjyasAw7Zb9TRMmxuuli56pFp01r9QXpWVUW/fkV87afBm9rWz/sFYRrvAnsiRRdYaEypFUG28k
	JrtDjov4q2bw3SgvT3v595DE=
X-Google-Smtp-Source: AGHT+IF5YnTVm0OKmRRmeSaZC9AvdQvm4Gu8QZGPFptt8d07uMe5+ho57hgYCPcyGlZxhVtV7UesPw==
X-Received: by 2002:a17:902:d504:b0:215:bc30:c952 with SMTP id d9443c01a7336-22780c68a03mr259297625ad.6.1742957082124;
        Tue, 25 Mar 2025 19:44:42 -0700 (PDT)
Received: from google.com (198.180.199.104.bc.googleusercontent.com. [104.199.180.198])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811c156dsm98109075ad.117.2025.03.25.19.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 19:44:41 -0700 (PDT)
Date: Wed, 26 Mar 2025 02:44:37 +0000
From: Sung-Chi Li <lschyi@chromium.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: (cros_ec) Add set and get target fan RPM
 function
Message-ID: <Z-NqFTZuW5yJ_FC5@google.com>
References: <20250318-extend_ec_hwmon_fan-v3-1-4c886385861f@chromium.org>
 <e4da28be-66ca-45d3-9ccf-34819460b463@t-8ch.de>
 <f50221fd-1d76-465b-ba53-62c08c6f8536@roeck-us.net>
 <780ce6e8-11fc-42be-b4a7-9cffbf811d78@t-8ch.de>
 <42c49b0b-cef0-49ca-a5b2-5bb05eae8dec@roeck-us.net>
 <45d0681d-3446-409c-8d9b-0309dbb93ff8@t-8ch.de>
 <7b5c4001-1a5b-4ea0-aca9-e0c88ec7a98b@roeck-us.net>
 <Z-JYQyxJErCQKo4i@google.com>
 <aa034893-405e-4f71-8cb6-0ccb112c36da@roeck-us.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa034893-405e-4f71-8cb6-0ccb112c36da@roeck-us.net>

On Tue, Mar 25, 2025 at 05:55:07AM -0700, Guenter Roeck wrote:
> On 3/25/25 00:16, Sung-Chi Li wrote:
> 
> > 
> > Currently, when sending the fan control setting to EC, EC will switch to manual
> > fan control automatically. When system suspends or shuts down, fans are going
> > back to automatic control (based on current EC implementation).
> > 
> > Do you mean the driver should not change the fan control method if there is no
> > pwmY_enable implemented, or it is the user that should first explicitly set the
> > fan to manualy mode, then the user can specify the desired fan speed?
> 
> The user should first set the fan control method to manual mode.
> 
> Unless I am missing something, setting manual mode means that pwmY_enable does have
> to be implemented.
> 
> Note that the suspend/resume behavior is unexpected. The user would assume that the fan
> control method is still in the same mode after resume. If resume reverts to automatic mode,
> there should be a suspend/resume handler which restores the mode on resume.
> 
> Thanks,
> Guenter
> 

Thank you for the clarification, I think it is better to implement some missing
EC control points (For 1. getting a fan PWM value, and 2. for getting individual
fan target speed) first. After that, I will continue working on this seris.
Thanks all for these details that I missed.
