Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB56352018
	for <chrome-platform@lists.linux.dev>; Fri, 21 Aug 2026 02:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787278213; cv=none; b=RYQK/Ss7Tvw8WrJC2d2I/MMJGJrB/M4gzdNFczTccZFqD/fCijLAl/KoUW/IK5QR1W+d5pPSKwnJOvlRR1E5PHyWhl38pb8NeYJkJ5UokhsBKLZny8AJCRyYiJnKf3PvreVhByCIGVV6GhAQoTRs5YIMZdXiWSBQ+Bd94sA/cAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787278213; c=relaxed/simple;
	bh=4xPM3Ye/FxcpyYek/S1irL41yRtOgBab2MQH645uGLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZNRnr8XmHRbkDhwMd6/3pLLRtlnoR2X9SGeTIhHvINzUlbg4zO0fWgIlSFpZWa6+rmkvJ14YxHDJPp5cN2vsYyUu4jNiiOw7NndGW2z2lI+eUSmMNU5VTCFp5km+8SrnUdvWiWHO++oRiFTa3uioTLMoA7hQaPKRs7VVm3umjU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Navs8Mlg; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Navs8Mlg"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so589584a91.1
        for <chrome-platform@lists.linux.dev>; Thu, 20 Aug 2026 19:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787278211; x=1787883011; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vmJf0qs2DgBsdsOJH4Zv4rn/Lap8Q6UgjlHrije8TRc=;
        b=Navs8MlgrDMdSzY3K3mTJhudhl+EeKzQfu0DrBSflrVtlYcR7q/+rx9GLEubh01647
         WAhaHqyvqleLhJHswmVSM+0wGV6IAUyPUaAKIwIGzejBIpChx6v2I6J0XQTqJoctcNzU
         4XhTMlmF28Ss0wTLLWQEjXaebxj1b44t8sqHRl289Dlo1SZD/NeahyRVxpM9HmktwQKy
         71fYkHDgTtGAN3lIxh2MvBXz5b/h/4lARvpDBR/QhCFOq7SItZhKl6pVy0mdPn2VHo7t
         3c3qcJ6OCyKJ7P4YwSIUNXoM5lqAXBehpbgbnmY20ClPyhYRQ01peC2/2uef8lLkmDYe
         kvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787278211; x=1787883011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vmJf0qs2DgBsdsOJH4Zv4rn/Lap8Q6UgjlHrije8TRc=;
        b=f8jIoUROP8rc6WjqvLMdmedjz/7pe6bcap60QIf2C6r+L2viGicWfsYzp+cSP7eWER
         X2+avym0579dKl2teOJh2FirkCqtP8RTPrDDNUCrrlMf632V7ObYeWZxtG6wDNOdd9zT
         5SYi6vTtejFl53TKSpAy5YNDlOYLzGW16/wKXwnnmrsJvDz46l7XIPN4TN3VMPmIrHd8
         Eg8pgCFGA6U+ZiPpFfwBNVzLfncOBUoyd2gVKpINI8Ge9EhjwU0ONRsc4hnnKF0MrpGN
         6GYPnLApSczomSvwU/MY4jFEcW0+6slJ48zibpQnLKKX3zFYXAlxe8p5KdWZDDlJXDI6
         ECLQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNvKO9wCYyh/CNz+ShFySLFfjzDTZOd9zq5elJRWx78ZxQ7E966BJMLhJu+bcU0qfBt7X56LJ6ZSUchjaddOg=@lists.linux.dev
X-Gm-Message-State: AFuF++nw4uNHndvIgPSBC6Vfxj6hbCpiF5IF7GXqgfJnJCxFH3A1GkaH
	5Ah4a/srZX35PPCyVRCPZ1dHcc+lUd4AkYH64Dk7DeOQC7F459cfyPs=
X-Gm-Gg: AR+sD13otMiPyOcBCpZAneA3uZdr2TBHgpWNVqntBNOA+K6OnuCcM8FQswlRmIFQNHJ
	DIiXqqZs2uByRfVb8yMrF9VHnPP0PHxOm8+/cC/f3AtyUhEXLwA57hRNSl/kDZA8Njk9KkoLdG7
	l8TJncFDfzBdG03DKk02vo6CrRJJz0L9a8zGCTk8L5Z8tcRbuG8fzCsF1W906+djcCnZ0oMFlzR
	YJF5omK1AoAxBaMpYNSjzHYk9GEeiNrbB/9GpuQ6qwqrPEOGxfN3bQ5r0hzo8RzoStPVa3sMOxQ
	nDwydpG+eBrhqQX56K9jdduj/xzEdgckEYB0d8qvpLh5pdAcJvm01q4O2aiX7TWS2t3qAqvx5rB
	BQYHczHm2KdYruiIZuU2Hl6dFI88pVdG/wzYOxWxv5BVvAdMNg0r8A/xI5u+NjxaG8/JqF5cyFR
	ZhTTYPWe2oUlJ98VKeqEwY5bzNo8Lf5dQT2G0BQayt99djSdkBtlF70M7OwsgVzdoEWztKbGNK4
	Q==
X-Received: by 2002:a17:90b:3d8a:b0:38e:6d4c:14e6 with SMTP id 98e67ed59e1d1-395c33daf0fmr5550724a91.3.1787278211479;
        Thu, 20 Aug 2026 19:10:11 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4baa594sm1008775a91.17.2026.08.20.19.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 19:10:11 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
X-Google-Original-From: Triet Hoang <triet.hoang@datalogic.com>
To: jic23@kernel.org
Cc: andy@kernel.org,
	bleung@chromium.org,
	chrome-platform@lists.linux.dev,
	dlechner@baylibre.com,
	groeck@chromium.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nuno.sa@analog.com,
	triet.hoang.dev@gmail.com
Subject: Re: [PATCH] iio: cros_ec: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Fri, 21 Aug 2026 09:10:07 +0700
Message-ID: <20260821021007.30946-1-triet.hoang@datalogic.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821025453.5944eb9d@jic23-huawei>
References: <20260821025453.5944eb9d@jic23-huawei>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 21 Aug 2026 02:54:53 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> Hi Triet,
> 
> Wrap to 75 ish chars for commit messages.

Thanks for that! I will keep in my mind.

> > Take a look at where this macro and the comment right next to it...
> 
> >  EXPORT_SYMBOL_GPL(cros_ec_sensors_pm_ops);
> relating to this circumstance.

I think we should use EXPORT_GPL_SIMPLE_DEV_PM_OPS here.
Should I send the v2 patch to correct it?

Regards,
Triet
