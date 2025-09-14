Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF1A1E5B78
	for <chrome-platform@lists.linux.dev>; Sun, 14 Sep 2025 01:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757811985; cv=none; b=NhvNlDmdXvtKzu3Zncgf59M7OgeFkEOGVFR+L8fjGEDJVIok4rGetyC43f68svYkNWYQJROqSdIUysNjAeiYOW0DKwi9TFeDfHBc3rIGvzuUgKYkko2dI+g8aDmQ086KXOBTZrUsi1bsNAyLi2jxwdsZKaexAHuUXQgwwBxJjHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757811985; c=relaxed/simple;
	bh=ktRIj1BWMRAgHuTHhmcHnZIEjgDrBOtlqKH+mBToSIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=liecfn4hxr42ma1FCqastQwyrzvqj85RVNmTeICwMdxYTI17iUweZuld7noxmN5Stvty8E68mF3UKn1Sp53HPuzBTlV2SKC8FBPwkYltXbFk1pkVx3mI6xDvXaFIQRU8yl8WK/F6P/hvPBqbINOnvPcEb9h+Tnl/9E0EqImI6Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OiQcOnbi; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OiQcOnbi"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-26060bcc5c8so9469855ad.1
        for <chrome-platform@lists.linux.dev>; Sat, 13 Sep 2025 18:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757811983; x=1758416783; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YJIU8Q2R9kdfT4ukS71DR6sEqvnpBsLUAFZdleMjmYc=;
        b=OiQcOnbiXGpiO3cbyW7OEOKPTUR6uOlGPRX9LMk99MDiqcbnjG4muDDJQIknCSaDLi
         HpQp7veIUfz5a2pHRTXNFN3mxhuPW7vE+p6vt/LtZOd3imKojFomjK0yceQ9xIRxa1zh
         W3cjygp4YIYdfqn9tmRJsnc4PJA14Ba+y+a/R4HeJb3dVFugAapueIFh8e/EtoaZdgzT
         mh92gd6zLBN0ESjycAyKRlO6lyLmZLW8uhGZtcuO7RNFyUQGkbN7XP19AaR2TGDJAAU/
         wOtw9WgvcGElYY4RgVBAkPrnxgV8iePKdxEzMHIpvHLXtYulkxo0P4de2/HhXszks4UG
         dzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757811983; x=1758416783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJIU8Q2R9kdfT4ukS71DR6sEqvnpBsLUAFZdleMjmYc=;
        b=FhtU6nV3PS6A25wIENRHOXeMfQR5jOTSqhGKi6SBgC3heOSqL5x8yBLOSW6+wcuapg
         lmMKKTdd5Lcy41N3jFqdLpDfUqc5C4HQXmCJnxcYFYV25HcJIU8+PDzG+3IS3foRidRl
         YTk9gX9e2t72mV9usaHTSho+7fwLQmUZnTPG4R3trnOW0rC4CtEEJLlHh8nDYjroBrge
         5zGQkEs5NGJDKgMsd1zJdgCgRprZOjbFM/9yiUKDQUz6oYw1A4qe/mdNvJk3HZbuXfjH
         9SyXnzGvavmqWk75dRXatnfwHKcb7SANkuP/dg1D81NVDIF+Rz4PcZDSM5PY96KVdHqT
         6Huw==
X-Forwarded-Encrypted: i=1; AJvYcCU7c0DjlhQG42tkty1TJRXrIM8jzbUF939CclNAUKkT/zQcHbLytabBSeCG+TXtW1LUq67lIddpaWp4Tljt/T4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1/je0vCEcNdw1SPd+cePbRRLhbWZ7stf/fz8t3Iko1y0KXoWr
	gDqpA6YwfHjt9YWfKJZ42mTaf8AZXetJP7j+gLqO0olUPbXyxpEItqvT
X-Gm-Gg: ASbGncsRudoWEyax2aLqFP5lTP0s8o4waX1Zih3MYLoU9uSBN+4KMofmta55rfa8Y9e
	I4SiM+spaucp+bcaWJbPFRenU0YXjW6KbHv/U+BGD43RX7ebiqsuw7kEZR6puu+idzsZZPdirU3
	8qcHbVFNP7W/n1R1TM3FAhMSiebDEzJ/AHKiAfgHervDtYL8l3EseT3PjQr4XPjvtQgmSCikef+
	QdW8R7DAyrUihRqIgExhslq5Jcl7b1Bol8Dw2OCtuLMyfc/pyFCKgl4tA6asf8ClfhUtrINa7ns
	uKiZc6aZ8+YdjJJMW7i5LUs57uXpq+Kxr5eYPchp0yO5wLiq5kR9nHadl/Vleusu8uANGHuh1hf
	AUcd+JNkOmzwZZOEFVPCp1kLekZdnm2pi
X-Google-Smtp-Source: AGHT+IGFFpvSpJArs1iawlJwQfacD/sqeThJpnPi1hhTHReWI0+qiuV9oOalWTxS1gOfFGdm+7/JVA==
X-Received: by 2002:a17:903:240e:b0:261:1210:7b81 with SMTP id d9443c01a7336-2611210844dmr44826625ad.44.1757811983295;
        Sat, 13 Sep 2025 18:06:23 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:81bf:abc:6590:f690])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b306192sm90174085ad.143.2025.09.13.18.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 18:06:22 -0700 (PDT)
Date: Sat, 13 Sep 2025 18:06:20 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, linux-input@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH 5/5] Input: cros_ec_keyb - Defer probe until parent EC
 device is registered
Message-ID: <473egrw7dn2xbe3likrfekyvh6z4uingywp3w5wjqcwo334fqb@j3ffdzv3723w>
References: <20250828083601.856083-1-tzungbi@kernel.org>
 <20250828083601.856083-6-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828083601.856083-6-tzungbi@kernel.org>

On Thu, Aug 28, 2025 at 08:36:01AM +0000, Tzung-Bi Shih wrote:
> The `cros_ec_keyb` driver can be probed before the cros_ec_device has
> completed the registration.  This creates a race condition where
> `cros_ec_keyb` might access uninitialized data.
> 
> Fix this by calling `cros_ec_device_registered()` to check the parent's
> status.  If the device is not yet ready, return -EPROBE_DEFER to ensure
> the probe is retried later.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
