Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C09DDAB
	for <chrome-platform@lists.linux.dev>; Fri, 19 Jan 2024 08:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705652116; cv=none; b=Rs9w+yWua0H/LXqvXK8T6gLprXmXfCdg9ehVutRkeCDTFKKua0fyQaGyyTE6rBOLzDuoCUeoVx34vwckZBGGzIa6PhL+QE86LpdgXi6xA6WbxTT3QSF1tRUbOjhXNnoB8XDtitVKD8121SAun8ec+1wgpqp1K8l+EU6SqdM+rKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705652116; c=relaxed/simple;
	bh=Brs4I8LeGv/nD7PSa7xlIQSgiZc+XxvPNqzYhGnyoNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P81na710lda6CRWBa4Kd4Ok967Mxg6mZbxXVWNfO8Zg8UENKXTV5967NO3s+KxP8nd61n2qpq5y6wUsgi/e6EGKmV2dpkLnT/vn+pb0k2YSIvWZJzNKQpqS/0TAsAufdJL1xIu4yCaQUZT4pDrwXy2NNylngwcFftHKCJXi1PqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c90nFHFT; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c90nFHFT"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d3eb299e2eso3116065ad.2
        for <chrome-platform@lists.linux.dev>; Fri, 19 Jan 2024 00:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705652114; x=1706256914; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TFiyPVIeN48MBC4wX1Z72krh/+iVgMlLmTO4HYqgbs8=;
        b=c90nFHFTKHYmO48PNJgZvnUloumJyb3InYKFKAuD3t8M6NGp4JKL45iuLZvPDVhirB
         goBwU3oRdoJPGxaE2pRUzmdNbZtA4NoJoEkEm1UqIDZaP+pA/Uujh4idEfu4xOU2hxyn
         HxPPOyixv3evR0gtCaorg2H0ur1hE6Tx/LeN37kyEK3qdIEqW0nOeCeIiAUE9/MrSDwB
         gtDG3uhp6oTNVj1BS5hE6FAnw16e6HHvLYyUwuICa3pHkMpdrOXYriM15W7v/TKGzgut
         nPzVu8TaRgF6cGfBCgSpfCeg6+iqhUJEjEJAnoR9BZB2n8Q0WQVTZ48okedeEEYhhZqC
         NnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705652114; x=1706256914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFiyPVIeN48MBC4wX1Z72krh/+iVgMlLmTO4HYqgbs8=;
        b=KsQgvG6rkhK9zh6dWIxsAVldAuxYOAu+WXIKfFqOZbT9l5bDL7jUSvxlnQ3NtKoxuB
         uempP0iRCg6u9gua9/oI7gNSqxiFvVIPiSocNDejPeEWEwNOuBfthlklzeOGLygc5RAc
         PD6y/MEF2BVRcNYTM5HsAi4CWu7VzClyBilOgAzLL9POF6PqcUOlu//zW31B8bSPyP9f
         x5qgpo5rKIAXMz+XVwbmAc0Btq+pc50fJ8R6yuWJ63XMUljoL8kFoperEhnRKL8UXK1L
         hPM8UPiVwWQLr2x1hiD5972xFcZfDxTtI4N54TRspXHFJY2uUgBudIX8ONpkreroCEDn
         f6dA==
X-Gm-Message-State: AOJu0YyQjL/0JmVmjg9+Y8Mf6fucLU2rA4M+rUZOwxyOSeYuzNxSVJbN
	xX1Hoj8jriNqNCQ9cl6uy75JuFcGTbNWM8XvmM2Lo5KGWj8bdMzX
X-Google-Smtp-Source: AGHT+IF3CUyn6OpGy2SQVSG2RlMUA3LqbIze/2BkMRUySl0E6xO3DVCRPA6t/t02ovMMqlaVUobUJg==
X-Received: by 2002:a17:902:ce90:b0:1d4:e308:d6ff with SMTP id f16-20020a170902ce9000b001d4e308d6ffmr2172134plg.113.1705652114201;
        Fri, 19 Jan 2024 00:15:14 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:f04f:73f4:b79:a70c])
        by smtp.gmail.com with ESMTPSA id k6-20020a170902e90600b001d720956b8esm610126pld.77.2024.01.19.00.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 00:15:13 -0800 (PST)
Date: Fri, 19 Jan 2024 00:15:11 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ting Shen <phoenixshen@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, fshao@chromium.org,
	Ting Shen <phoenixshen@google.com>,
	Benson Leung <bleung@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	chrome-platform@lists.linux.dev,
	joewu =?utf-8?B?KOWQs+S7suaMryk=?= <joewu@msi.com>,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: cros_ec_keyb: add support for base attached
 event
Message-ID: <Zaovj86pZIZdDQiJ@google.com>
References: <20240119074831.2979671-1-phoenixshen@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240119074831.2979671-1-phoenixshen@google.com>

On Fri, Jan 19, 2024 at 03:48:17PM +0800, Ting Shen wrote:
> There is a new type of ChromeOS detachable keyboard that talks to
> the host via CrOS EC host command interface, rather than the USB
> interface.
> 
> To trigger the firmware update daemon (hammerd) on this keyboard, a
> signal is required to replace the typical USB hotplug event. This patch
> addresses this by mapping the EC's BASE_ATTACHED event to SW_DOCK.

I think emitting an uevent on attachment might make more sense here,
SW_DOCK is to signal attachment of a legacy docking station.

Thanks.

-- 
Dmitry
