Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B758460
	for <chrome-platform@lists.linux.dev>; Tue, 25 Mar 2025 07:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742886987; cv=none; b=bmWzlTL0vsQEGQXnPeXu1cK9doBcCnBKsouaHGw/5cwO+98n2CBhaeGDFE4hgZmg7PpXn4TNaa+6I+yqKDXEhx3TTzZekGmj6Wwk5bJoi3jIJfo0htMHnmKWqVVIC51115ZUDgW+o4VLRaRKbtB9O7fljN83caTz4ZPhh33cFnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742886987; c=relaxed/simple;
	bh=VX7Z2BcEl7LEw3P9lpNuF7yvZA5FVYjGM4FCtV9IcVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVltIj5MjAZtOBaVJhQC41IUGC3FwShUV/SWYng0hByI2Xh3Rn7jWxN5q43oaZRiwiuoTPjCulCRb3nFBahbW2wvvZBTDx1G8r+6ZcEKdqGgMRwgzFKeHih+k81DxuirMaH4b57ZkKGafC02YSM/T95NBluTI47RJYuf8HCHk2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aC5RQbZY; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aC5RQbZY"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-227c7e57da2so29838235ad.0
        for <chrome-platform@lists.linux.dev>; Tue, 25 Mar 2025 00:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742886985; x=1743491785; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IisfiPaIOkCLLpc8arAPOmyPGwJllNrmXJ0/RbB2duU=;
        b=aC5RQbZYQKJzqehYXcFkzFFDeLsVDAHoA2fqAQsWEnryAkKPJ2tsyR3LEjlhAgzWT5
         n/BIjwUG5DQzHR+JP9LVc2OhpDmNG2RNMmFtGO8K4w7ChgDwuxjlz2TSVRZ6aRGOYJIp
         oSoLFTJfMxsaoLVe6mFus0Zh+QEVx2SSCNgvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742886985; x=1743491785;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IisfiPaIOkCLLpc8arAPOmyPGwJllNrmXJ0/RbB2duU=;
        b=gOTmW35KZHIckwSzrQrbu+WrhayO7vtCi1CQuPnKSIx3TZkjsC4c2iZMZsTaIjURm/
         Pc4w7zMxdaYOqm7C8C5tF7h0Q1BPE7FHkiTmaURMCjifDqsSStKmvKveMnH7DQaxByqS
         yLrK3QvHmyAufC0bDPlqJ8xcm9PF+q4xY2IocrIx397DmFcnUxh5gPzfGCsw1N0T7iQd
         gZmm0CsWdJ2aYpQDIDsBt2cfnkqJRR7PDxW5Z1C06A66+tL2yHINdO1/gF4TKBnm+7AJ
         qD88e3IWE4zwfSmboi8/lmWw4Ry4A/LFZQ3pJGZVamoZEqQ2rQe40LLtvq6EGG3ykZ3B
         lCkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWFUTTzlPH8byPH7d1w/5Qd0BDxCJL/GqYVJBQH0WBUbTaT6gZ/T7Q4AyYzfIzJuiyTRQsGQjtIdSCcXNA19w=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQrDSumDA8g9sDVf6YzG8J/Zv7TvyCfjcoLjMBJ3hXUWgKc5om
	KyOvmSArlmBnZ2bRwqFyFSkC2wFjZoIkcPITo3P2ilyNt5I7Xm5lZvUUmTsr7g==
X-Gm-Gg: ASbGncvXpn9HsBru3OHz2KmFIqF9/tpo8IyAUAsrKb2gqVW4Jx/VQsUqSiezF4TsBw8
	LKTL6U5PuYH3NIQJnrBbYi2/Pi/q5YIUCsuBLM2rH4m63/NfBLH8gRhHAlvafwY9X0jx0EbJ8Xc
	22y5/R9xJs6FI2NeokzdS2UHZdJHVMYPsWkK7BcgyIo8VlJeYSzewxlboPhgSDVwcHSLPgNsJGC
	/DKWLZLC1N7FKZsLYFgum7zdD+/GKdL7h5zoOPnJmV8qJJ02Y2dVIqvcub/8qomFGqI4nGdY26r
	vjcEqVKIzkyKH8aca/aY7Ah1bxYKLfP70hB1+atzUEd88USTSZeP/GjCoI1pmsGl6/FeONRCzcN
	fLXsuU1zo+kS0
X-Google-Smtp-Source: AGHT+IGvsZAEZCX/vePKQx4i5F9EPnQZlLG8BNBsTXHhTqAFQFOWqLRWG3HsEIjrRLj8ZuZiUpReYQ==
X-Received: by 2002:a05:6a21:50c:b0:1f5:93b1:6a56 with SMTP id adf61e73a8af0-1fe43323a0fmr26538191637.33.1742886984766;
        Tue, 25 Mar 2025 00:16:24 -0700 (PDT)
Received: from google.com (198.180.199.104.bc.googleusercontent.com. [104.199.180.198])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73906159fa1sm9314317b3a.151.2025.03.25.00.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 00:16:24 -0700 (PDT)
Date: Tue, 25 Mar 2025 07:16:19 +0000
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
Message-ID: <Z-JYQyxJErCQKo4i@google.com>
References: <20250318-extend_ec_hwmon_fan-v3-1-4c886385861f@chromium.org>
 <e4da28be-66ca-45d3-9ccf-34819460b463@t-8ch.de>
 <f50221fd-1d76-465b-ba53-62c08c6f8536@roeck-us.net>
 <780ce6e8-11fc-42be-b4a7-9cffbf811d78@t-8ch.de>
 <42c49b0b-cef0-49ca-a5b2-5bb05eae8dec@roeck-us.net>
 <45d0681d-3446-409c-8d9b-0309dbb93ff8@t-8ch.de>
 <7b5c4001-1a5b-4ea0-aca9-e0c88ec7a98b@roeck-us.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b5c4001-1a5b-4ea0-aca9-e0c88ec7a98b@roeck-us.net>

On Sun, Mar 23, 2025 at 09:22:07AM -0700, Guenter Roeck wrote:
> On 3/23/25 09:05, Thomas Weißschuh wrote:
> > On 2025-03-22 09:10:40-0700, Guenter Roeck wrote:
> > > On 3/22/25 08:23, Thomas Weißschuh wrote:
> > > > On 2025-03-22 07:12:48-0700, Guenter Roeck wrote:
> > > > > On 3/22/25 06:55, Thomas Weißschuh wrote:
> > > > > > On 2025-03-18 15:45:23+0800, Sung-Chi Li wrote:
> > > > > > > The ChromeOS embedded controller (EC) supports closed loop fan speed
> > > > > > > control, so add the fan target attribute under hwmon framework, such
> > > > > > > that kernel can expose reading and specifying the desired fan RPM for
> > > > > > > fans connected to the EC.
> > > > > > > 
> > > > > > > When probing the cros_ec hwmon module, we also check the supported
> > > > > > > command version of setting target fan RPM. This commit implements the
> > > > > > > version 0 of getting the target fan RPM, which can only read the target
> > > > > > > RPM of the first fan. This commit also implements the version 1 of
> > > > > > > setting the target fan RPM to each fan respectively.
> > > > > > > 
> > > > > > > Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> > > > > > > ---
> > > > > > > ChromeOS embedded controller (EC) supports closed-loop fan control. We
> > > > > > > anticipate to have the fan related control from the kernel side, so this
> > > > > > > series register the HWMON_F_TARGET attribute, and implement the read and
> > > > > > > write function for setting/reading the target fan RPM from the EC side.
> > > > > > 
> > > > > > Should it be possible to switch back to automatic control?
> > > > > > I can't find anything in the hwmon ABI about it.
> > > > > > And neither in the CrOS EC source.
> > > > > > 
> > > > > > Am I missing something?
> > > > > > 
> > > > > 
> > > > > Not sure I understand the context, but the fan control method is normally
> > > > > selected with pwmX_enable, which is defined as
> > > > > 
> > > > >                   Fan speed control method:
> > > > > 
> > > > >                   - 0: no fan speed control (i.e. fan at full speed)
> > > > >                   - 1: manual fan speed control enabled (using `pwmY`)
> > > > >                   - 2+: automatic fan speed control enabled
> > > > 
> > > > So far I associated pwmY_enable = 1 with the pwmY attribute.
> > > > Also controlling it through fanY_target does make sense though.
> > > > It could be clearer from the docs IMHO.
> > > > 
> > > > That also means that the patch under discussion needs to implement the
> > > > pwmY_enable attribute.
> > > > 
> > > 
> > > Does it ? Does setting the target fan speed automatically change the fan
> > > control method ? Normally that is orthogonal: One does not necessarily
> > > want to enable a specific fan control method after setting a single related
> > > attribute, but do that only after all attributes have been set.
> > 
> > With the currently proposed patch setting fanY_target automatically
> > switches to manual control. And then there is no way to go back to
> > automatic control.
> > 
> 
> The driver should not do that.
> 
> > > For example, there could be another attribute specifying how fast the fan
> > > speed should be adjusted, or there could be minimum and/or maximum permitted
> > > pwm values. I am not saying that this is the case here, but setting a target
> > > fan speed should not automatically change the fan control method.
> > 
> > Makes sense.
> > This goes back to my original question: If pwmY_enable is *not*
> > implemented, how would it be possible to switch between the different
> > mechanisms?
> 
> It isn't. However, as I said above, the driver should not change the fan control
> method when writing fanX_target. If that happens in the EC, the driver would need
> to check first if it is in manual mode and only permit setting fanX_target if
> that is the case.
> 
> Guenter
> 

Currently, when sending the fan control setting to EC, EC will switch to manual
fan control automatically. When system suspends or shuts down, fans are going
back to automatic control (based on current EC implementation).

Do you mean the driver should not change the fan control method if there is no
pwmY_enable implemented, or it is the user that should first explicitly set the
fan to manualy mode, then the user can specify the desired fan speed?
