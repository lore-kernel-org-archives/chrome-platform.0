Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA3D26ED3D
	for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 19:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768851108; cv=none; b=hul+LjJFHV+qynG4iuoCdsPeV+hs+K9UBaWwZMqmt6yh3MA4K2rxYnb4nmoohwTAYKGzxl7CbISltNxvhmhO01YljMWamBkSBVMIW4F4EfkbJo96VXKvrF7Z65XcOxd+GDhn+ZlHIiSNiww9N9d2LBHDqbYsUpL784iwFaUMJ8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768851108; c=relaxed/simple;
	bh=x2b9lNEGCQygYR/3W/mNW1fFVMbpAS2G13sb1IHGSSE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=rI2fK5xuIUGBzD/VIVEIA3ogZgqCPnSfUMdDNRqU3yctTQh/bdBx7OnUGRarRSLPCfNzyuajgBNYymX3sapZBTaYBmu6zH7fESh0Fgw/gr8KPKDLM43If/XVo4NUt1S22c/m3rPduoZGnbDdPMBP5AAlpXEJ4DW8BpmcXEDZrxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G4bNOGtf; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G4bNOGtf"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-559f4801609so1759512e0c.0
        for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 11:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768851106; x=1769455906; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2b9lNEGCQygYR/3W/mNW1fFVMbpAS2G13sb1IHGSSE=;
        b=G4bNOGtfdUFN1EawrDmyK0PhgdmHIyPZznnnt52XaEd4uBaYwPrvxNTm/973KvI13a
         CaJ6EbOQ2wn8+X9HDiDxPM5R0jBEBCOWduw0CD2L8PuCFU/RBYSvMqvtwVhP90m2/jcr
         XTTt2/spWu7iNaR9IfzzwymxZyabW8rL9tLzdLCm7y0b5eo0J360l1QONvnDeCynB7M+
         zScE9wiT3O7V6+F5kaqbXidkzFv3Pp+lWoHpwQeWT5w272o8qcyap9OqN2UzqanzBGM/
         wlGOZP6zzGuss1XWxlyGyUJxUYvF+oYEZNx/CG4bSQUrpQkCvFC4FFR4Lv6y0v/l0YuU
         GPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768851106; x=1769455906;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x2b9lNEGCQygYR/3W/mNW1fFVMbpAS2G13sb1IHGSSE=;
        b=IGoa5UgdPlZhBResnvJ96Shnbcy7rKKIw6fzqyug5tAI3YuhslezICT87KxlCHwRl6
         0gcQ2dtQ4LWiVUM67xEyUtCMcqjBs7xoJbRN1+uHkADpE+U7PSCX7vXZpqF0MUJR9KjB
         mEVCYhZWA8nXnzhwOZ3BChj8QDmK0XmqUbeXw/RL/lohMH5StfLc+J6WEtgEUVwmRYF+
         mWOszwNY7D0Uz+fACUCf9qKkqCY7sRMo+wGkSpcRO4p7E3zwo3eX8E0iTZPGhgWla6Oa
         od6+FJdd5eMQRux5dNctn4H+v1Rkx0pPC0OUOORpwx7qztnUqT2j9pA+6u2lbXJ57xOD
         XqFw==
X-Forwarded-Encrypted: i=1; AJvYcCUH2WWwCPnFKAy0n2UU9s7YP/w6ZkyHONEiKfXGA2Uxs5lE6TO7ZCXItzHRtvkNsEVaXG15KKyjFAV3FWtwOgc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyS3dxWFjGRc4lRoHi5m/jzQTAWEbdApxaXe6/M/idGHrOjp82O
	SZJtVZF+iXpRPHUWHi5EGKB2mqyItpERjjWHQ0CKGlfV5GXGZdDMFhLC
X-Gm-Gg: AY/fxX458wF+QFN9h8bgbhilYeNt6T2p7EIuiCjE3i7jYzGOMe2lkZmpYKeqNtGNf7X
	4+P3cPa72VVJ0EIIUZyQUatRAPIafqP4Ey1csccK5/vcJExDsdCsMBqqMGMkSBSQ2ldaY9MR0hk
	JbRITRxUkE3kih8b6lMvq42sqREIfHzDIUGCYs11jETvMdnw72q88CpOqhrsrRB0mBIjAZJ3IF7
	UKwqygt041ljzz+hg5dsIKQLXebGklc1oMT23eZPr1xi/sAt2P1mN8YVh6Ds2YcfQEO4+TeXlW5
	/Jyh7Y+pMy5z1gxc3eYq2+qdNersZaCnWum2eBAPSHPbifPVRZgqtYZUCB+YsWERii11zG41Gfq
	B1S7wUnrZPr7JoEH0hjp3AB+4CUlMd/AyeWUPyM0CQp19m+IZN+wWTtE0PkDEZ7vFr6IQJfUQFv
	rdBw==
X-Received: by 2002:a05:6122:3d46:b0:563:5a97:ad78 with SMTP id 71dfb90a1353d-563b5c35871mr4451376e0c.6.1768851106440;
        Mon, 19 Jan 2026 11:31:46 -0800 (PST)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b70e7eaasm2974068e0c.12.2026.01.19.11.31.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 11:31:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 14:31:38 -0500
Message-Id: <DFSTDSO5P9RC.DGCGPD10KYPG@gmail.com>
Cc: "Lars-Peter Clausen" <lars@metafoo.de>, "Michael Hennerich"
 <Michael.Hennerich@analog.com>, "Jonathan Cameron" <jic23@kernel.org>,
 "Benson Leung" <bleung@chromium.org>, "Antoniu Miclaus"
 <antoniu.miclaus@analog.com>, "Gwendal Grignou" <gwendal@chromium.org>,
 "Shrikant Raskar" <raskar.shree97@gmail.com>, "Per-Daniel Olsson"
 <perdaniel.olsson@axis.com>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Guenter Roeck" <groeck@chromium.org>, "Jonathan
 Cameron" <Jonathan.Cameron@huawei.com>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>
Subject: Re: [PATCH v4 4/7] iio: core: Add cleanup.h support for
 iio_device_claim_*()
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Kurt Borja"
 <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260118-lock-impr-v4-0-6c8d0aee8ed2@gmail.com>
 <20260118-lock-impr-v4-4-6c8d0aee8ed2@gmail.com>
 <aW3oEZ2WSp0JGl90@smile.fi.intel.com>
In-Reply-To: <aW3oEZ2WSp0JGl90@smile.fi.intel.com>

On Mon Jan 19, 2026 at 3:15 AM -05, Andy Shevchenko wrote:
> On Sun, Jan 18, 2026 at 10:44:31AM -0500, Kurt Borja wrote:
>> Add guard classes for iio_device_claim_*() conditional locks. This will
>> aid drivers write safer and cleaner code when dealing with some common
>> patterns.
>>=20
>> These classes are not meant to be used directly by drivers (hence the
>> __priv__ prefix). Instead, documented wrapper macros are provided to
>> enforce the use of ACQUIRE() or guard() semantics and avoid the
>> problematic scoped guard.
>
> Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Hi Andy,

Thank you for your feedback!

--=20
Thanks,
 ~ Kurt
