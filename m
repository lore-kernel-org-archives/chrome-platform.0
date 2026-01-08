Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32BA3B28D
	for <chrome-platform@lists.linux.dev>; Thu,  8 Jan 2026 18:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767895856; cv=none; b=Rzo7wVlvPNFJhyJtf6UX+IynuAi7phwJD3dUmNkh+lqM5/1VjDFse7B5DZOiDNrnzoxmD7gbHWii66w42MgCqGvOQQ9LbVTA39tBxS1h55QZ2cDM0BXmzRkVTSkH6Wq0cv1vXLKm65Xbum8hJo4/wFfjlClibqPKDhAjv6gIdu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767895856; c=relaxed/simple;
	bh=F++6n/4BGi0DmBqIND7slBXRlIzqau20b8FuxBFnyb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDnACDvQjIoTakVQxDRucxZrJ6jvV1jbVZE5pX8Z/NtT1wvHbOS3ap2FBj9KqT006FhAp0b/aYOAoALSyOunpnK+66cqa9woppcwpU8eiGfaF8RQz6Y8QdtMuAf8vqcnNJOuEw2i2XthcbfwwvtBnsIHeB9H7FkwTGaqkEIJ3cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MiqqmN0c; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MiqqmN0c"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ac3d5ab81bso2316469eec.1
        for <chrome-platform@lists.linux.dev>; Thu, 08 Jan 2026 10:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767895854; x=1768500654; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F++6n/4BGi0DmBqIND7slBXRlIzqau20b8FuxBFnyb0=;
        b=MiqqmN0c+9422ZQZLcc0deWZPorovHfv5wrT7cFDmG+mnuRLT/BH1coWQJZQT1MBtM
         EGOAoUOGxAgqHs7oTI1G8Tkey95Ps3MMTu4KHYw5lBwsv7EOBvK9MJwuvxqBGElcVykV
         3vd8K/WtrAtMPho9bCYy5TPjlhWm8LzPCqa0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767895854; x=1768500654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F++6n/4BGi0DmBqIND7slBXRlIzqau20b8FuxBFnyb0=;
        b=WH9s6JBAMjXnzIjbHdwmRQQaDyk/kzBr/LWfozErnWYPEOfuDLENH86/Gbszx5fGpA
         JyB3iS16z3OwHvFaPpA7zRTTuiHrRE2n27+kDme5ndPzvav5DXljaWeftUytNtY75zYQ
         +X0hlIR+vIFDL6+mPxruJ408BJydSBe+HMHIO7638jiHsIhbso+aKTyv5hfvAd/evpwg
         8PIqBd3gug3GSS3H5jsXbMed4w/zicB6V87Bozb8nk1ctIYbUvGdbL56ru9d5gP3r3Cj
         VSbXubTt7992S0HYPQCuAS+wLitzsbo+tCP6QGC1tQruL0jlGIf57f0idQtGjDpob/E6
         5Gtg==
X-Forwarded-Encrypted: i=1; AJvYcCWYV/NYEkaYLHLb798LbZtfCp/CN4Z/jxKcjdOrD18tt4gRYGL6Z/9RpdTqPEEPvZsdjn+l7LpbujGgFJTrUDo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLmRaGQPlpZ2AYl14rBqKmro1NtdqgKi1QcIidaIno1Fovllfo
	TfS5UiXv3AT+790urfg/tGxzAwqAa8hRxzBvtJzY2XKLenNWZlAfOyz3oHiL+CDWYg==
X-Gm-Gg: AY/fxX5vxcgulA5fuHnSlA5gJ7WeddFPXyy2k7d8LqjFY+JAfQUaVroAlD06UExK5+j
	aGYIRU6b1I7fPlFj18MsnyOlc4bMijpfGEkHMqv89Sda/L/SaYgGw7JJHlTtYi2frxXptELE+F8
	YkGjNqBskaHSd6pwXK2/Sg8wCJ25pRXKXoJQ81fcvEgjYo7rrfzw8tEGubvshG/QNFTSkYBeMoa
	E3G6kl+qC2uZtlk74YDsWCvvZ+0KnWMtys1+Vyo9BzmjHQvql6i3djW1LRIk1JtaIQNfnw0UkvY
	TArDc9caKAcX3uTXJcmu9EbqNQcLSDBk6B+LIHwjH7/ckbZ7WnKTYdjaUnfmVDQFYA84c9bRQGc
	Gas0bR/gXf16QFFBniCgEmsfNIfaKK4CKuKkYxb4BtElmXaaOHst4oZxn6vFUgrRpmlnycmjgIX
	Haq3Ebkg4KlvBjLr9/P9jawloxc8ENATNVdRGqHi3lG5/2/OLJYw==
X-Google-Smtp-Source: AGHT+IFZtAq/oB19PHGm/upN66kIM4s9EQpoNAY5OElHt+T0zXtCo0DhAz7vQLfjH1DBmXAAoy7l3Q==
X-Received: by 2002:a05:7300:220e:b0:2ae:5092:934 with SMTP id 5a478bee46e88-2b17d344750mr4750303eec.37.1767895853821;
        Thu, 08 Jan 2026 10:10:53 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:d9f4:70dd:b942:60f7])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2b17078d818sm9030669eec.21.2026.01.08.10.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 10:10:53 -0800 (PST)
Date: Thu, 8 Jan 2026 10:10:51 -0800
From: Brian Norris <briannorris@chromium.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: tzungbi@kernel.org, jwerner@chromium.org, javierm@redhat.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, chrome-platform@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/8] drm, coreboot: Add DRM coreboot driver
Message-ID: <aV_zKzBth1TJNFvJ@google.com>
References: <20260108145058.56943-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108145058.56943-1-tzimmermann@suse.de>

On Thu, Jan 08, 2026 at 03:19:40PM +0100, Thomas Zimmermann wrote:
> Coreboot implements framebuffer support via simplefb. Provide a
> native DRM driver. Keep the simplefb code for now.

I'm not much of a DRM-er, but what's blocking us from just replacing the
simplefb driver with DRM completely? Just being conservative and
allowing flexibility? Or are there technical reasons this wouldn't be a
proper replacement? It sounds like supporting 2 drivers provides at
least some small complications, like in patch 1, where you're trying to
avoid repeating similar logic in 2 framebuffer-handling drivers.

Brian
