Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E779921A6EF
	for <chrome-platform@lists.linux.dev>; Fri,  8 Nov 2024 15:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731080025; cv=none; b=jnMI7yQG930Y8KpHs03VaTq7fof6JztAyP6q12fMI/RP6pwlrmqF33TCYeGYYUFjrLeZadd3+33uGvFLWW4tiKjU424wjoYYUCbAroZWuhBRGPZAJvUlloeswyUlGZMzqeUsqDZrwaq7W1r1vUHYseGl86U9qeAeXH1ZVhn9FbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731080025; c=relaxed/simple;
	bh=jFmMnUeuC+ny2eEdkRs99LX3eAoH4643Yv0UWsCgWwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CK7f8Yah0FdkwEjjybaFijcAIXkZmlh30iCKe1UOg507viPtUNLxwW4F6HqGm+EzzzLNXyUdgXIrYC9w+TL5K6JczkOqmr2nY0qg/+r3l163Ug7+6eJmgljPM4EphD6Hjzldcq+fHscMaDc6nKvvUI60CWJMYzT2I57F0VfBmHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YB5ENZMd; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YB5ENZMd"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so3958690e87.2
        for <chrome-platform@lists.linux.dev>; Fri, 08 Nov 2024 07:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731080021; x=1731684821; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3tUwRMCHHdqZVRtxZCk5aPJdbR5inXLEUzSQYIspWM0=;
        b=YB5ENZMdXNYCXy/NfjnXrlI6rlD84Xe+2C7L2cN/H1HC+lQeHAcXR4LQNIvl3PJwTh
         24cRQVwaMWG4puWtHfaGFVeZ/X/+FqIx3pQLrdq6WMbqneCxs8NbMcxJIqyxgJ8izF1M
         uKlEDl39MgPF8U16mLGmL6KJrhnpNmkN4SrTV8Ym/RISOlwlcGiacPQc/3xygxNwDDPN
         8qrv8xe1d9goVUljYneuj39X/6FM1gmvUBZ0bN+ULnLeOmd4to0yed5j1XnMVOcASqOf
         0jNPBpOmtyB1GCa6qDjh3i7bC+7uf8mk8vIQXtUWspeC2uTyIR8rjBrhiR6nb6VWSlnA
         pEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731080021; x=1731684821;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3tUwRMCHHdqZVRtxZCk5aPJdbR5inXLEUzSQYIspWM0=;
        b=IboisiY7Dr4r/ko5NjHPtRpGpvFfan1wdi0zldQt7wUZ8nmhNQZrDSPyUDxiZAzSIo
         PIepkX3iTy6TmOcCqjZVomij+fS2D54CQvRYqKJ8ARZ9+PiD0X3xp5+RHAj+M1GRK34I
         XH5+IhXYM9bhXT0IIEa3yoN42s5afuq9+ItOKAMR7VYa+NUKPS9xqhKnvh0BYyXgcyh5
         qA+We9BZfP/5RRMZHZDSgrtu5K2zGf6l0yQanGdssis3hDusEZzWD885aLnK39jPgPRk
         NPY6GFmnMllCQ/B1E1/px7qweydcosoUaD11Ma8UlbGlFvi1VwzEsGc34p0VJ28/LtUM
         oJQA==
X-Forwarded-Encrypted: i=1; AJvYcCXSZLgxE742LlnXJNdpmuX2k87/IvdJA5lmduPCXSJiD7VsjC78jNpEpGXxMOrPVBhxEWyH5/Z46gwMZYyaRYk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMgEdtSWXEIUduheVbqC4xrfYNiMOvIv/uFfiVfEmxMFnTm/rX
	cDdMm6bzLb0Kz4qvBlrbTg7qHJmKQCLSSe220f6VArdgA+HdXHd3
X-Google-Smtp-Source: AGHT+IH6QlPf0c6ztccp5zye1I+rJwIhnxrhIVUrE/U2zUAMlS2cVf9rlvp4D1Xd2iX5jOQ4HGOkBw==
X-Received: by 2002:a05:6512:3084:b0:539:8a50:6ee8 with SMTP id 2adb3069b0e04-53d862f84cdmr2869650e87.57.1731080020655;
        Fri, 08 Nov 2024 07:33:40 -0800 (PST)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d82678474sm662970e87.42.2024.11.08.07.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 07:33:40 -0800 (PST)
Date: Fri, 8 Nov 2024 18:33:37 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v11 5/7] i2c: of-prober: Add GPIO support to simple
 helpers
Message-ID: <Zy4vUQj26-rkXrgk@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
References: <20241106093335.1582205-1-wenst@chromium.org>
 <20241106093335.1582205-6-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241106093335.1582205-6-wenst@chromium.org>

On 24-11-06 17:33, Chen-Yu Tsai wrote:
> Add GPIO support to the simple helpers for the I2C OF component prober.
> Components that the prober intends to probe likely require their
> regulator supplies be enabled, and GPIOs be toggled to enable them or
> bring them out of reset before they will respond to probe attempts.
> Regulator supplies were handled in the previous patch.
> 
> The assumption is that the same class of components to be probed are
> always connected in the same fashion with the same regulator supply
> and GPIO. The names may vary due to binding differences, but the
> physical layout does not change.
> 
> This supports at most one GPIO pin. The user must specify the GPIO name,
> the polarity, and the amount of time to wait after the GPIO is toggled.
> Devices with more than one GPIO pin likely require specific power
> sequencing beyond what generic code can easily support.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> ---
> Changes since v10:
> - Added include of linux/types.h for |bool|

Tested-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>

Patches 1-5 from this patchset were successfully tested with hardware
prober for i2c magnetometer on PinePhone on next-20241107. [1]

1. https://github.com/AndreySV/linux-stable/commits/in-kernel-i2c-hwprober-magnetometer/

-- 
Best regards,
Andrey Skvortsov
