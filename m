Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6087566C70
	for <chrome-platform@lists.linux.dev>; Wed, 14 Oct 2026 17:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000276; cv=none; b=GqggZqTcs15wO6x2E2ulLdQPW+MO+0pkKTwUAHT6NLEG/zzz+fNbwnwJimkEGAeNdVGTDwx+xl75YeVBs978sjW//hFEsKYA9YF7Aed1fIAld/0mOtTHlUDpEPXpTCpRV0/cqpQyCExFUqeaOcsoTx24IYgaxy+VyEcZmdZve9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000276; c=relaxed/simple;
	bh=7iGNeJmfcOi2YoNxyNO1yWmrCItQX18NxpfvwkGF9MA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KcS24LMYWDq3xvBJko01KPC0Ebauug0/sA/LTeLd22sH/szXyMccI1nOj/Bm9hfBuxPglbMnBJk7G2DZTulaaOMYp7LeXMRdRNib2EbJWiBcC4mYhS0PIf0LJUPEITvNcuHinA5/Su7QKPQsw2zvLvboDEkPKUOQbkjxgE69pNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jdGXRamP; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jdGXRamP"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-154e9d2d979so1199636c88.1
        for <chrome-platform@lists.linux.dev>; Wed, 14 Oct 2026 10:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792000274; x=1792605074; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6nF2QdVqRFSLLz3favTr6+7W+Pw3c0RMBGNFXIbHvjY=;
        b=jdGXRamP0HL6uKoSp2y/u0Qmk679kLB9VlTn1On7KykPfuCveQ3RYoqcDx+NVwciIP
         sDK1tT0qHH1clrTlWrFe3hqObxDLpa+KOqVyOUYWAukDdE1Z80Q/vf2uLc3ecHiXCiFJ
         uPBCQ0OUpHhgYP+eKBY0ecY/GN8Roo17s1x5IbQvikjKNyQN4QTvJ8LMuyM90cjTe7Eb
         pGlGJEeQUcsf0OPbOD1CWuWx1v02x3bmrCbqDznAC6II+W5O45TZY0K0YRQQavMPMVa5
         34EwDVTQLql/BwI7gqDf541BxLlDsGf92iYRaDICml+2FB+YJZ2yl+Cbb4eSL0vBODLg
         FirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000274; x=1792605074;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6nF2QdVqRFSLLz3favTr6+7W+Pw3c0RMBGNFXIbHvjY=;
        b=1xdAD+7VAr82gUGArca7gL6Km4PuSlQMrWKreZ0muIhEomLYujHhUMCCy39p9A/lyP
         /DIIHHk8mQYnpqb1tTPRogBAHiZMhcM1jU85DWIGDAKVqfqPl8hLCBuLkqtU/IWT9XX3
         2VFf29r+xTlHFKd+r3/DV2PLWguR2Km7kFaeo1WHvJ2/JCZ6WbufqxSiinvBdOCaNsnY
         iTHZose80GyYdNRmeD6mWFJ6T3EwVJAVEx4rH+IGYDjAkfgM4t7er/7ykzxlkTrP8qn7
         EpXltPAtece+30TPNTIZQF2wxhgb0KdqS28VbnFgweZDkL/R4awfYvluXeho8ecx54Zh
         RpJg==
X-Forwarded-Encrypted: i=1; AKwUvBzVCnuCZeREhFtezvRo/l9BsWO86Op5svD8+Skj0meup2JErKiHk2UNASGIhyljpsMZ05sDH+W4xg5mFLSXY84=@lists.linux.dev
X-Gm-Message-State: AFq9FYL9hxiPKcR05zXnQIE0l94mXxcdKZ+ghhbOGwC7iQUWZFXezyL+
	S3U1JjvgDCO72v7zzmSxAtimXKnNJTw3jVfnnNCS5WkbxeIeZBX4g4PT
X-Gm-Gg: AYBFou23EJ4akkfDKJupOTvV6GJHBaFVJYnLhxM4GyBDDVbSUHiqlfsrXbi4uZi/1XI
	XKsG+60UiLTTrNZXRieA5px59zrjJjTlOAvQJo2dcTUfU5ivjSmgEB3P9VtyUc37vU+1K8F+rj2
	svKe0csGO1yMyAZUIg8X6uU8Aq1RfkMcThyFxGytDvmXrQyzuMQVZxAK2fn2s/+wrHi80fDYx/8
	iIAXs2oiMVrA9PEmw55e1OhRkTUOASIdI6wLv7vFz88CBcZp8Wr5TAFJxEFUj7slZehrGRjmGgK
	V+6YVJwOL/5nxdIAj6xmQ4nPrpy9K8tF6RAcqavNMgQG8n5DtG6TU2y8M0Rovd60MAy1oHhpxn+
	YisbmSse1GUKn1RAmiwpanL/px6ogN0egjQEWvSaItzDaTzFuKinzkmBnPq68YzngE0laOF6Dt5
	nA/QT4xWlSzRHrWIsd+cgnGKesAPtjUiQAc5SQkaz3Ro7H1NZ4d/vxZkskydpaukmQS8IK5N3yl
	qy41vvLeDSWtPxqF5jUxFKZuVWWzAn/wfyl0Ayk
X-Received: by 2002:a05:7022:e881:b0:14b:1ef8:698d with SMTP id a92af1059eb24-16a5d174c3bmr23967745c88.15.1792000273790;
        Wed, 14 Oct 2026 10:51:13 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:875a:117f:b9ea:5a08])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16997c21ff3sm48611107c88.2.2026.10.14.10.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:51:13 -0700 (PDT)
Date: Wed, 14 Oct 2026 10:51:10 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Nick Dyer <nick@shmanahar.org>, Hans de Goede <hansg@kernel.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 0/4] Input: use designated initializers for acpi_device_id
Message-ID: <as_A_l4h24eAtUE8@google.com>
References: <20261013-acpi-input-v1-0-53ad09ba82b7@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-acpi-input-v1-0-53ad09ba82b7@thegoodpenguin.co.uk>

On Tue, Oct 13, 2026 at 04:15:21PM +0100, Pawel Zalewski wrote:
> This series is converting lists that contain the acpi_device_id struct,
> which is defined in the include/linux/device-id/acpi.h to make use of named
> initializers (which they do not use currently). This work is part of the on
> going effort in the kernel associated with device-ids [1]
> 
> The plan is to convert acpi_device_id::driver_data to have an anonymous
> union, similarly to what was introduced for PCI and I2C device ID tables.
> The goal is to increase type-safety (most of the existing casts are gone),
> to improve readability and to make use intent a bit more clear:
> 
> ```
> union {
> 	kernel_ulong_t driver_data;
> 	const void *driver_data_ptr;
> }
> ```
> 
> But for that to work all lists containing the structs need to use named
> initializers first to avoid triggering -Wmissing-braces. I already have
> patches that implement this and touching a lot of kernel subsystmes that
> use the acpi_device_id struct and that list keeps on growing. Therefore,
> I have decided to split the series per every subsystem into:
> - pre-clean-ups that convert the lists to use named initializers
>   (which is this series)
> - actual implementations that make some of the modules use the new
>   driver_data_ptr member
> 
> That way the task can be fragmented into manageable and independent chunks
> of work and makes this effort easier to review.
> 
> Tested builds on x86-64 and a64 in Yocto using 7.3-rc7.
> 
> [1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
> 
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

Applied the lot, thank you.

-- 
Dmitry
