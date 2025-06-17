Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157C12DBF74
	for <chrome-platform@lists.linux.dev>; Tue, 17 Jun 2025 11:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750160373; cv=none; b=SQuukQiOz8JfAxOUcpbdcqQhjAU+zNUB8tMhwkJ4Vjp5CkfVEgtaGddGXSo5O7oUney1oWycFav0PqgM/u8MDnOdVNSdCXv7joGGdGTOZZ2bEnBgMvIRMbFlbLl0k5hiG0JShMfi7hUHz6zswYLrr3a2AxBKBlM7GP0vx8mXcV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750160373; c=relaxed/simple;
	bh=aHr7ZCdGKdUx/X7yilpI5xZxQAjoyhpSsv3WDHso6bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YA9h6gES3pQMCFhLi8mpSGP99ZxyHuDIgGi3/jySgIl/3NcyIl3lUZThA4MUD+tW6BRj6U0Z6+A4/GITHs/Um7ncEJIkXPA8g6r+CZsjv0eBUoxxPa4zgiXIMBEnPPKfxULJ8Vr2E0tZ4js5tTB8a6XFsV+5R4bcONrhD3MxyuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=eF9vNq9F; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="eF9vNq9F"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-453426170b6so16681255e9.1
        for <chrome-platform@lists.linux.dev>; Tue, 17 Jun 2025 04:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1750160369; x=1750765169; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qW4YqwwFCuMF0+LE9SQ/jZp97dNuLzD63AryOXprXzU=;
        b=eF9vNq9FhwJrP2hD9ZWYOQ4crI9EcPBzAiB2K/XVxEYj7RL3yBpuynJTmPDd2NuCc2
         +zVfoLC3cIM/Dac5teOlM8jX6aJpYVanobCPZ2UcNsCgqtTvqjU8Ssmkb4OGvUZ5nfqc
         awA/zk5I5wiOmI7fCnd9sxK8yf8la0RkTKA0xpJPtVEohNrUbaRXfdzQ55mZjjHlbtJm
         +gs+0e5X8NaO4OPjcYyuXCRe/Upb5eZ23UsR2Eysdtr4ivXXE2mdaEqlGMvx66elNd4p
         nMywxUDLOt6rr40RNTEQlbrMPJDpaTdSRWK59RDdBNGdQgDGM0ajYWSsqv4MrbbOI1To
         55WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750160369; x=1750765169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qW4YqwwFCuMF0+LE9SQ/jZp97dNuLzD63AryOXprXzU=;
        b=EFzyNrcCmNR9WKQDDUfJisEqA0y9QDAxw7r+62se5LhMk1LEfuPUcvDDGfCrB2uvaF
         OOTsNhVxJqTQ4fyea7N63YxDfTWxxmqcsJRxNhfsRdXVxbfg2KVgQZHW0PXgb/B729nO
         bsXx9DusQynrPHFHIMeB+mhJvd+i+phmb5BboSAqoz2NCBrOojiWmXzME8nbScnAVJsP
         jwrvoKYDf45Qb37XrHMtsugqrODLAWUw9Bf//4sAMvRSxXv8vz2i12va0G/Jq1uve61B
         E9PYjoocwVqtN8+LzOte1r8V7+8H7yyH+wtU6arVacehh6iQIV+3a9Quus8RU+cApIHn
         +nJA==
X-Forwarded-Encrypted: i=1; AJvYcCVJEFQPep7IqjsnhkEVtcVkCbu1mXCbL4Hvz6WQSagWSild0Ap5FLSPDZ3SIlLyNpb2HjZUGzw1GKzQ4goB2kI=@lists.linux.dev
X-Gm-Message-State: AOJu0YybvGCCbe/4TXhtDcofgRGyi0XPNgDoaLUfe1kVLcGt8QOZ7Xfj
	1G66iBJ2DMqrzV/M9hFrNMpsQl5CxTxvdoSJ5zsonWu4pNwXaZC0DHiHhaz+AlH0Bw==
X-Gm-Gg: ASbGncuH5lfL3pb3kEqUBjTHvU3PMyp6eQERlPj8zGacCnMWgGBBOm8DsCHyDuXkmjZ
	kLoxgb9tEBe7QWyUiywEIfJEwWLd48MwzjpcWZJVDUVj64Fp71Uo/0lz8IdLyuuzuGB5F1MW2le
	rwK/eDXPQUSl9TkEGrsIAFaFfapA7Er0IgQc1goHMONLZLdjwv6qZDqp3AUP74lUROXe/WN9UdF
	XnQ1o4sY99xjtgjO7Jgr/RO+GSHQzPDDD2Gy93Fw8T4GowNBU9KHnHrLqYtL1ayjIaD0a4jnze4
	t45h910TtkS8spYSvsVTDXGXM7nOhHmdRsrfJKU4LAPUn8WLQhI6TlNHr1FaoGGg42lOw9u/ovH
	j3z82cjHNwGZb23RFyG6/dnYTts4Z20nKM9IvtGBOUQ==
X-Google-Smtp-Source: AGHT+IEUvDRURTMB/hVyl5/+Dq/7PwoqgbYAYF8XZZB0DJfGgwJu+ruqrz8OL2hC2gyw87LK8X5+3Q==
X-Received: by 2002:a05:600c:1549:b0:43d:fa5f:7d30 with SMTP id 5b1f17b1804b1-4533c97c5eamr119451035e9.16.1750160369154;
        Tue, 17 Jun 2025 04:39:29 -0700 (PDT)
Received: from cyber-t14sg4 (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e25302dsm167878505e9.26.2025.06.17.04.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 04:39:28 -0700 (PDT)
Date: Tue, 17 Jun 2025 13:39:26 +0200
From: Michal Gorlas <michal.gorlas@9elements.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Julius Werner <jwerner@chromium.org>, marcello.bauer@9elements.com,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] firmware: coreboot: loader for Linux-owned SMI
 handler
Message-ID: <aFFT7g8w4kTJZ-1w@cyber-t14sg4>
References: <cover.1749734094.git.michal.gorlas@9elements.com>
 <6cfb5bae79c153c54da298c396adb8a28b5e785a.1749734094.git.michal.gorlas@9elements.com>
 <aEtW3e7mwjTTvfO9@google.com>
 <aE1yNZ484DcWjR4h@cyber-t14sg4>
 <aFBdfckccRv7Pbc6@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFBdfckccRv7Pbc6@google.com>

On Mon, Jun 16, 2025 at 11:07:57AM -0700, Brian Norris wrote:
> I must have either misread or misremembered checkpatch's behavior.
> Possibly both. It has various other delay-realted warnings that point
> you at the kerneldoc comments for mdelay() and msleep() though, and the
> mdelay() comments say:
> 
>  * Please double check, whether mdelay() is the right way to go or whether a
>  * refactoring of the code is the better variant to be able to use msleep()
>  * instead.

Okay, will check if msleep() has the same effects in case SMI takes too
long.

Best,
Michal
