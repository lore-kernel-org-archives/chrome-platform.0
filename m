Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C792DAFAC
	for <chrome-platform@lists.linux.dev>; Sat, 17 Jan 2026 19:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768678980; cv=none; b=uaEV0OCiKS0J6YDUy+7wewap7pJw/eU7PTqRKePWhDX2k0TAFMOEaVIaAVs6/7d/Musoub5GGsHx1LSlFVb1+XO667tIlb/2M88MCXpI6zvExNap+blSNlbZLlaQyE/qXq5pO43vEinrNy3P76N7/NK4ut+hcpjQp5mYhVf+csw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768678980; c=relaxed/simple;
	bh=kyADtZzJjqa9S3qeCD1Nc9zebIgMdiyTsz6JgRZYFxM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=A2jFCXfGragxRf1MFCJbziNl7xqMGOz0T1DDeVGnYwrGb6jXxnQy9Kv1i9uQlBa+29YoLGm0NeAn7+hMagPe0FvW2vFiNf3S3f6ueapVqWnZ73QWH5v5LjJYJyky/yV88IZlhCgukSjfrlXVtt6oBpNsv/hB9Wr280qmSnq/MBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSakuUCJ; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSakuUCJ"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-563610de035so2506583e0c.0
        for <chrome-platform@lists.linux.dev>; Sat, 17 Jan 2026 11:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768678978; x=1769283778; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jX+S0Sb3/TORvv49jMJHt7cR5imR7FosT/IXWBB8ZKA=;
        b=LSakuUCJ969QiqwX6xaQnjyqYOdRkqgW0mePfl1mV3/pdyXAwtpwM0dWOoN3nyiCiE
         FMSq06HzgYpVYA8CcPO7GtWEGvgOTDov32A/oYKSQdqaD01KokDAJKi4kqNiF+EkDB36
         v62RLK3da2h6r4dbEuc8zp9bowj/fxiBKXS1zcFIvY5i5eVphaQAbvAyEw8ArGUWRiyz
         wwJSv56PZKW8tyYW6V8sh0cUpjwrTrUE/d4t3FVgB6+474dufIO/arqPpuMl4odpMmKf
         9UZ6OtUfVyCmEY8jFFwD1g5hyWyH0S+P9xTGLVmlgv0hIZys+gfhbaC0XfNbLssSL4hP
         Asvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768678978; x=1769283778;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jX+S0Sb3/TORvv49jMJHt7cR5imR7FosT/IXWBB8ZKA=;
        b=rM2Tt22H2OoKCgNavgAZx7AU7rIp1IUrz9AWAjTzkua5bUhaO99f5NfBgu4QaEaJt8
         tparfbO3LtCKSzE8/5aVTwZex8nbB9XVEn3bHw/xrXIygYiLhYBWqjH9qVm+nimqXRIG
         Ud4XhH56WjifQBxkQI12QvzUPtSHRJVhGu8MXmCdoCO8LjYy4Ce6I9tOV4/lk1CDQU/+
         Bb1PNsE1QnvYspAiDoDwBfk4I4CbahAkwQUyZQB4jCxFTOxO5Ts2c5PStdQEm3ZdpPND
         2VP5PupQp+nXtaFZJiHrB/NPka0hf8Q0KxUXRvBYL/yz58GqpHI4r1XwENYpATTGmS7d
         Qopg==
X-Forwarded-Encrypted: i=1; AJvYcCXlggABRjvj8vYR94dKOyuhL1Voz7p0i94KFpZtX/cDBqMHtv1ZaQ+HkZu1rdulZuGgYBF2BIJjXD2IexdjFWs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx759hkBcj+S/5Tnlmrt6vsZJv+gDxkeDmsBGEOP27+/oZMCuJE
	GxZxva9UUVwZ1HA1q+2USmZi55bFtDmi1CTj/Ml+zy2G+ir9XSItBq5X
X-Gm-Gg: AY/fxX4in3GDhE1+HlMQ7H/1RCrR3xkprFx1SQDWsgsghnYjHE9V/lfxv8IfCtNSXjz
	kYriImfAcZ4QyxCfHI8z46APq90fkf5jS801gvgchSfGcQ0dUK39s2xwAucUAujqNfi7vcqmkTn
	qRN0s6Jv3lvFlmwDb3QidMrUYPm7wY241Plx+O1Kbz6OHwLn0wI3csOmw5jacUm+8xLClYj6LBX
	MH3bajxCQxzwTBOINgkZp77IKIAIS/8mmuQWuqB+99bHlvEmX6qtEClcWRMxacdDYoOJbjnkVe8
	JFO7+mrHzeYI6Edrk9dBq3RtRkB7FGaPNsn5//WruKHbClwd/xzAsBemXLJL98LF8Z9mmcwQfDY
	IQCvAL9CxSE8esgCUO12cCs5j6prF8APxkEnV/2YxK51An02jn3qi9sY67dtbQ/27DjGN6RT9XK
	Csvg==
X-Received: by 2002:a05:6122:1791:b0:557:ddc4:dea4 with SMTP id 71dfb90a1353d-563b5b8cfaamr2316062e0c.5.1768678978135;
        Sat, 17 Jan 2026 11:42:58 -0800 (PST)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b71226a0sm1568589e0c.20.2026.01.17.11.42.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 11:42:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 14:42:54 -0500
Message-Id: <DFR4DC4NN16R.2365N6R1B6A9Z@gmail.com>
Subject: Re: [PATCH v3 0/7] iio: core: Introduce cleanup.h support for mode
 locks
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "Kurt Borja" <kuurtb@gmail.com>
Cc: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Lars-Peter Clausen"
 <lars@metafoo.de>, "Michael Hennerich" <Michael.Hennerich@analog.com>,
 "Benson Leung" <bleung@chromium.org>, "Antoniu Miclaus"
 <antoniu.miclaus@analog.com>, "Gwendal Grignou" <gwendal@chromium.org>,
 "Shrikant Raskar" <raskar.shree97@gmail.com>, "Per-Daniel Olsson"
 <perdaniel.olsson@axis.com>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Guenter Roeck" <groeck@chromium.org>, "Jonathan
 Cameron" <Jonathan.Cameron@huawei.com>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260106-lock-impr-v3-0-1db909b192c0@gmail.com>
 <20260116203353.59a2a00e@jic23-huawei>
In-Reply-To: <20260116203353.59a2a00e@jic23-huawei>

On Fri Jan 16, 2026 at 3:33 PM -05, Jonathan Cameron wrote:
> On Tue, 06 Jan 2026 03:06:55 -0500
> Kurt Borja <kuurtb@gmail.com> wrote:
>
>> Hi,
>>=20
>> In a recent driver review discussion [1], Andy Shevchenko suggested we
>> add cleanup.h support for the lock API:
>>=20
>> 	iio_device_claim_{direct,buffer_mode}().
>>=20
>> Which would allow some nice code simplification in many places. Some
>> examples are given as patches, but the last two are the biggest
>> differences.
>>=20
>> In this version I dropped the RFC tag, as the general feeling is to go
>> through with this after some modifications. Main one is the addition of
>> IIO_DEV_ACQUIRE_{BUFFER,CLAIM}_MODE() wrappers to avoid drivers using
>> the guard classes directly. I also added comments on the forbidden ways
>> to use this API but I definitely still take suggestions on this.
>>=20
>> For now I dropped iio_device_claim_buffer_mode() rename, as this point
>> is still being discussed. My suggestion based on the RFC discussion is
>> to do it, but in a separate patch (using coccinelle) and while we're at
>> it rename the whole API like this:
>>=20
>> 	iio_dev_mode_lock()
>> 	iio_dev_mode_direct_trylock()
>> 	iio_dev_mode_buffer_trylock()
>> 	iio_dev_mode_unlock()
>
> I'm not a huge fan of flag days though this is entirely in direct mode
> so I can just do it at the start of a cycle.
>
> Anyhow, that's a job for another day where we can bikeshed the naming
> yet again.
>
> I do like unifying the unlock though.

I can send the patch, gather some feedback and then send a rebased v2 at
the start of the next cycle (or whenever seems best).

Should be pretty trivial, after I learn a bit about semantic patches
( famous last words? :) ).

If you feel up to it, I'm up to it.

>
> Patch 5 never made the list for some reason.
> https://lore.kernel.org/all/20260106-lock-impr-v3-0-1db909b192c0@gmail.co=
m/#r
>
> (I thought I'd accidentally deleted it!)

Yep, it seems it never reached. I'll make sure it does this time.

>
> Thanks
>
> Jonathan
>
>


--=20
Thanks,
 ~ Kurt

