Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F2139099B
	for <chrome-platform@lists.linux.dev>; Tue, 28 Jul 2026 16:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785257764; cv=pass; b=WZpOZ96dZH90pPGsRKwUqN/18f3czSHErPcyNS0dnTYK3T5l/Ej+opU9vhUfkizQW3MTa8IZuukm7u0iquTknm0Caytev3w1O93mrICbRM0/S0nUomzHBuP3UKBEmoKm7yfrMygULWMpj2o6ICj8KYuWB4fRnjEkcB2b35ztc28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785257764; c=relaxed/simple;
	bh=ORQ3uuUcwYgox8e5bvbPCBzj72M+unOHD6ZV+zlLAVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R89uqf9zwp8s3PaXl3txFMBJ5YXCccaPMdhnI8ldohEE/mGNXV+IGpvWHF2GfQp7Ut8ubC95GJpB0Xm0eilAXf7M07KO8X+ZfglvpWtqPTCJyrKUVdNrQY+O9B3UiTmQl/wbMR8JfPRCxQUDhKWuyOAIUG0JCLvAFaMTXfYr3/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work; spf=pass smtp.mailfrom=frame.work; dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b=vak/ddlH; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frame.work
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b="vak/ddlH"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-667b0ced2d3so5527485d50.2
        for <chrome-platform@lists.linux.dev>; Tue, 28 Jul 2026 09:56:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785257762; cv=none;
        d=google.com; s=arc-20260327;
        b=OCi1GyZHbOnboqLHv5u5fsheLbXjAsL0suY967GnT6Z6CnptVEm9XQNDJYjL/Hpaly
         /0hnj19s/p4LAS6y2TGsY8qgSUK08E1fWKDtmD2QHE3JIhpELxHgpQRG4J83c7FNYgqg
         k9cS3Ea4HFTGqL6sYWJ6cu80HVxAVgsTCTRpn5FQ8OUCm71xEclzitoYZm4QqUu2Prwr
         Mzx0ngsm0AgYgYS8xIr3/XRNupjRxCqLGSBA1XLyLhrgscdSprHIZ96dmLkXPENsNGiX
         fQKtrPZKXu8oRH0e67llQx70QF2iosj1K6zxudvZLEM+mDojYNcg+E3P4AHph+phvCjM
         KEag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ORQ3uuUcwYgox8e5bvbPCBzj72M+unOHD6ZV+zlLAVk=;
        fh=YrTELMoAn6Myflaozc9vvJFEHQAeXXKCR3OvLvNfY9k=;
        b=FwvS2+uyZVwfcv/DFBiTrTinw1VAHUYrfo0Un+Ls6/2Zo87k2plFBmwn+kOjKzaFGK
         Xkv3DiPnPR963ZX+4GJi1++qA60WMVOFOHcrbMpZeQqB9GDkC3iKpEl0sQbKAwTTjFit
         ooPGWr+ZQl/wdAu86rlj2xfkBUP7p9gQtGiVQFxxjg3jDrtCHZFb/PfW+zD9JkVcaqEI
         xZahuj+PIHRu4AJVdeyMzL8na2exCUnRCn2xL7p0UA8PDemmpIBoB16pKJk1lFKUeVqi
         sv7B3irejINs10KtVmWXWNBt+2zs0TR19ygw1fI4Q8w2AuuUssTdndyh69fPp/lhoT+h
         2P/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frame.work; s=google; t=1785257762; x=1785862562; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ORQ3uuUcwYgox8e5bvbPCBzj72M+unOHD6ZV+zlLAVk=;
        b=vak/ddlHZJ01eaoPoCn+UcrLhfpQukerJymR3w5PszsuTvPr79bt8S8WgQ9aaNAJnn
         AznBkwg+CmFFLbxe9SXZJt781EL9vM18MgMzwv2qZM5Xcxy3NbD544zvmVcVU3rr+CBF
         tsl/yoYpVBxXoZOuGHMIlEXcsdiIMnI7Kq6B1AEGm4ld9ue9WEx2OkUHvxPoVnhQ2GUC
         qoZt1VxRR75nVL65vrHJjH5wiUZst/hMHuwTI2VOB6NslxxheSAjZGt8ApWh5qQ0AOXN
         tVJ9alOJ4QZ4NK5+dhCuOk9av3mGRV7tyMQK6toupVZDjxqi6h7VmmkqfQ/j15imPynw
         Gx5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785257762; x=1785862562;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ORQ3uuUcwYgox8e5bvbPCBzj72M+unOHD6ZV+zlLAVk=;
        b=Om5s4lR7FXcyfH3lQvkY90fFx745HTfZddgRmTDWBBq+zjUq4U1KMXRRfnwK1pIM4b
         TzPHNu6uB3Tcg7NXgO3kRR4SZ2CldSELD3edfwGR8LmjWt85FlbLoT6bWZHavsPCyqjF
         jB96lJi1CG9KZJ65XLG760slc9yvLG2Wj4j48nbmNV5WDOVI5a4uDJdrO2V4lnWNjNv7
         2yEStCttf/Mta4tSVUkKHHg59rJzR6ALRhCvqOQF8WC5IHbOXfgvJ9Ig0P9W8rstNmjC
         kgRuXn2pvyvwVWQShJr0yjLS9HjMoxwaxsNmYd2Xc4frZuOhstE4HNezJ3R92YfAorvG
         tEcw==
X-Forwarded-Encrypted: i=1; AHgh+RqxA7F90s9wxgrCgXLjTjpAAkDaLfd5eT+yRyvCpvAWCJtOgbRxXnQ6iHrSqziFXcghg98STMYFOB1fSl2oWoU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzKrPXjpxgs6BpZlWvxqjxHzbipR2lNiqdqkPAc1BkRHKN57d2
	p1JyXdiOoZfDrFtimIsv8D7E1+0fBR58UApFa/z+VlG6BAfB82rAsz4dH+KjarDG9ban/vfsf3c
	bb4nD+zCX6495J4KJhFYG+3d3Lbe6FxTOwiCCiS6Ccg==
X-Gm-Gg: AR+sD12GbttF1Dqvk6VKAFrXkvkzvnmQE+DxfNX5nx1rAxYqoS8nPaCIptTMaWiUYRt
	mdWyE2BMoCv9yIQcvbM5cFQFu2hV/SnkrYamK+nC7OIIDGAwstwCK3009eGjvGT7YWFPP2rzPb1
	SH1CMMiSPhE85UIiwDkkGSktIfAsxt/2buQxf/JxxlyanxX0ibPmzwr1NW64i50SIOCnQ42BApS
	NVlFTJF4hviPF2c+HDv+E5feEKrcDpEG4l3RaSQT4v7Di6fjW92Hocd4wlaHTyWuUIXhwSvHeqr
	5nHsYMbmMF8iwa0fPt50TOjxMQ9FGw6RDY6W7sdm256Oj+26DHh1KEbZpiS21TOgkXPRgde3kSH
	50Q==
X-Received: by 2002:a05:690e:4889:10b0:668:8b5b:75a7 with SMTP id
 956f58d0204a3-6690549bf89mr827910d50.11.1785257761849; Tue, 28 Jul 2026
 09:56:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729-crosec-hwmon-warn-default-v1-1-d1eb39656a60@frame.work> <67a9f9ef-3007-4f62-9af7-7604a8771f4f@roeck-us.net>
In-Reply-To: <67a9f9ef-3007-4f62-9af7-7604a8771f4f@roeck-us.net>
From: Daniel Schaefer <dhs@frame.work>
Date: Wed, 29 Jul 2026 00:55:25 +0800
X-Gm-Features: AUfX_mxrBw-u-dfHxP7yXeMeYxkfFaS7xYAfoz_HESKDoKHXDSHmOYKJmPVvyAM
Message-ID: <CAAjcXz641LW9JCrz_kNDBCw7kZPt0H5wyvk_qRoFgT-9xe0b+A@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (cros_ec): Hide unconfigured temperature thresholds
To: Guenter Roeck <linux@roeck-us.net>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tzung-Bi Shih <tzungbi@kernel.org>, linux@frame.work
Content-Type: text/plain; charset="UTF-8"

> Is the limit just not configured or indeed unsupported ?
>
> If it is indeed unsupported, this is ok. If it is supported but not set
> (and it is configurable), this is not ok and will require a better solution.

This driver only supports reading thresholds, not setting them.
So I would say not configured and not supported are equivalent.

In our case if there is nothing useful for the EC to do with a
specific threshold (e.g. warn), then we don't set it.
I think chromebooks send a notification to a userspace daemon on warn threshold,
but we don't have that, so we don't do anything and don't set a threshold.
