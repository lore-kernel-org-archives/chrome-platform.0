Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0979828C2BB
	for <chrome-platform@lists.linux.dev>; Wed, 16 Jul 2025 23:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752710224; cv=none; b=Cuc9kclBoge9raL4QOmH11oJQEiX07A3XUc/QWKAPNKpigSIHzo5/Y9BpRvLzai/JLT8f7LzWchG0kto8cjmVbccNmR9tknKsvzfSToCooAO6chhua9bEwfLtzIx7MfspsfoanqFhscGpdMGKDUUZhfDOMZlvbqhsxeOi1LPKz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752710224; c=relaxed/simple;
	bh=k3g0w9pa1u4j2IhXx0X3BkHrOmc8Cshe8hrnzc3HdD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtVvaiPXUS8FLGPVAiVVGNwWZneGNn3M3fpSk+Zdx764FYgBaPCyXYU/JyKb+F4fIAUllTDJA2Azb18BgfORqjn/oMC/cXyt++9O7ulpL0P1HnLoEVexEPc0Dp/EaonqDiNBFYzVXvimS/7DJpI+LUZHn+aMiFuh2j0uVSRmBgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTDlUloM; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTDlUloM"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7426c44e014so446073b3a.3
        for <chrome-platform@lists.linux.dev>; Wed, 16 Jul 2025 16:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752710222; x=1753315022; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qZ8pegaK19UnX8P3aXiZbwIlDfmCOBIl37WYmnvnaJU=;
        b=NTDlUloMdljpsskuTKblspfi+cR9OoYtni8tbyrkjXbPLDTDLryvKTOXACbWqISqU7
         V3UJt2rai+cCVNrXsFsodhpITm+VL0hhvTviZHD+ZidQ/ghdSSz7e8h6vkGz7/gkwE6N
         R+zwdLbyQZ0aBdvvZTtMZ26sKdhEZ8AppWuwKVvOKkz+IfndTCncIiaSEuR3WdwkOx8w
         3Bw5jIcmGqWBcqZNbRn1y0Ij2I/aCBRtLQPxfINkTHvpXQbebWgQF3vbSEWgqT/e8aid
         GV8mNPWXCwTA/8in78ISgSq5zMybOGE1dLUVPb/e4GTic+RThSNX6MoZCFKix8erPOnp
         krNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752710222; x=1753315022;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qZ8pegaK19UnX8P3aXiZbwIlDfmCOBIl37WYmnvnaJU=;
        b=KMcKbWJVyYqGV3N4aiaMudhAou7g483DnuDPpZh8jq3WitUKWQcw3SnlQ/8xo3OKL/
         2X9A6myxCg8rD/cFXuo6OZxbXQDj1yA8ZHwE4ZUeGtmjy5kxE1S/O61JEkkPiyS8k00n
         Qqi8/S/xfO08ivcd2X6MRoh3IcTLIHQkp89C8a3KpvvoCkbd5Th/78lsRM4cGWmXta7C
         /9DOVBm13VCi6gCD0LcAkr/l25NpEVBkP1CaCY97ymRBfOrf81Ka+cMIMgS53C1bP9+F
         tYAsCUu7DtviPBVmoOphh2eJqnzN6D4ahuJ6mH7/cucY8x8prIqqvI71MQsvbxkl33Zi
         /e7g==
X-Forwarded-Encrypted: i=1; AJvYcCVQ9wwdPc7CRmNJzWj8Yb6MegOVHZFKJt/otmmj3Gr0MibqUmwUu6c6YNEAHB7e6UXMPb5pobFR2j2668elceA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9MOZPKj9TPLIUYFsFSlzlr69TSWGtmcd/eyxeyOnD77Z2Zxwd
	JGVeT5GkX8KOdpjS6xtWhJDA9zCBm0mEFzKkorMRb/gpGmYJ4WUY8Tmk
X-Gm-Gg: ASbGncvfj9gsCWuoKEVBihMllKlI3cbB7jqD72UMfLDcQ8RZb2N2WWbzWlN0HGHmev9
	jskRsrynzWWLB8VcXbiJflGkQTMMZalgdP5bONk/jD73NNGfP9caAzi0H8b8M4tPwqYgJEEhajP
	/4FAaucKACsByLBuuyzeMToTubHTbFypt+vdaVs6FZ86LDnC3tVPZ4z9f4juxVUWV9uJhm5ybdV
	3Kn8T8lt4y7scKKk/01k2zUyfKG1nIOV+BR1n8GF/klXvhHePXZK8rkBCvd7LEIL4RCFhYJHLsK
	gyphNMboXxuE5kj6Tfbux8wpIA/k6p3cX2ouA5kyEIqwy06veKbAWEOCMHXT8wfUgZLy/nz1i06
	Yy6vG4hCKtGWbwwobsGVOlvYwpOk2nH+aaRM=
X-Google-Smtp-Source: AGHT+IHrZv6GVt9J8YNPbDKjaIrzg0I79N2W6dpo4CjweOKAtdxJMZFTo8vv4NtmBAMBPUMjBpq6Iw==
X-Received: by 2002:a05:6a00:3e0a:b0:742:aecc:c46b with SMTP id d2e1a72fcca58-756e99fc423mr6735056b3a.15.1752710222283;
        Wed, 16 Jul 2025 16:57:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5e9asm14800090b3a.25.2025.07.16.16.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 16:57:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Jul 2025 16:57:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sung-Chi Li <lschyi@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	Sung-Chi Li <lschyi@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>
Subject: Re: [PATCH v5 1/3] platform/chrome: update pwm fan control host
 commands
Message-ID: <50fbd7ef-8983-4453-92f4-cc9e8516449d@roeck-us.net>
References: <20250620-cros_ec_fan-v5-0-5979ea1abb31@chromium.org>
 <20250620-cros_ec_fan-v5-1-5979ea1abb31@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250620-cros_ec_fan-v5-1-5979ea1abb31@chromium.org>

On Fri, Jun 20, 2025 at 02:49:12PM +0800, Sung-Chi Li wrote:
> From: Sung-Chi Li <lschyi@chromium.org>
> 
> Update cros_ec_commands.h to include definitions for getting PWM fan
> duty, getting and setting the fan control mode.
> 
> Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Reviewed-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Thanks,
Guenter
