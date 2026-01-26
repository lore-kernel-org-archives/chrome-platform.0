Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D757D30E0C8
	for <chrome-platform@lists.linux.dev>; Mon, 26 Jan 2026 10:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769423114; cv=none; b=tFXxbWJAdQqwOhJbiwjKBaU4DdqHSx2Yg6UG9eU4iZAehkOnUbUgnfDcAC99wrZgw7wtdmEbJpEAs2QO3f6sSFeoEkBAWY7d7ejcUcn+SHCIZ1kRtpSH8D7RoM79fS6YaramiLv143J9GsBLaI9CQtKu+p0jwJMUjcMlifgSQxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769423114; c=relaxed/simple;
	bh=1Rl/NJhMTYCsDeKJhDknpfhqitogEoQQWuJfyg+0UsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hl3n+yVhougqfRE4fyaKltwBH/LUehHzIK/MCjOuPQ+dVObV1FlaClPFQ5UsAJYgkwqqEn6xxVyCL3i9AA1e9Htcc97GTkx/SqVudqJcY04BW3nhbla1qUNaZZPo4GJjDFz99oadDYzGEukXq1ZERqXqRF/5kG/tbqLFx82QMZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wmcy2gK3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wmcy2gK3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC2DAC19421;
	Mon, 26 Jan 2026 10:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769423114;
	bh=1Rl/NJhMTYCsDeKJhDknpfhqitogEoQQWuJfyg+0UsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wmcy2gK3gzl5rqmDjmIUi1KlqXc9G5SvIix+BvfRQuiZWPCm8dzQ7qoOmDD7u/dt2
	 qb9GCHkoZmLfNH7E9jcv6dytfIpW9+6ELA5UC/+APDrV2vitourfMnYepwn+Bb5VsE
	 8y78zia0ZXtWBtsyTp0Q99v9pIv/EXSu1A5Cwpr3QRXUgYY97Ebo5gXoXRgiTJyq6O
	 CN2feiXdgvdpTcYuUZrVAmpm5m88o6TrvbaqWtbzsMEn1eVwEPMq/MBuslE1/L70wr
	 YlEARsn+8DmRx7VaaOCu6YRyQqVnBEPoA0/imxGyXLqGFnoxti76/OPyC1QTUl7Jwi
	 vTZe1pllR2Sbw==
Date: Mon, 26 Jan 2026 10:25:11 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: briannorris@chromium.org, jwerner@chromium.org, javierm@redhat.com,
	samuel@sholland.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
	chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 06/12] firmware: google: Init coreboot bus with
 subsys_initcall()
Message-ID: <aXdBB89WR-DVxDHi@google.com>
References: <20260115082128.12460-1-tzimmermann@suse.de>
 <20260115082128.12460-7-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115082128.12460-7-tzimmermann@suse.de>

On Thu, Jan 15, 2026 at 08:57:16AM +0100, Thomas Zimmermann wrote:
> Using module_init()/device_initcall() is too late to initialize
> the coreboot bus, as there might already be drivers that depend
> on it.
> 
> So far this hasn't been a problem, as coreboot controls all device
> creation. Initializing the coreboot bus earlier in subsys_initcall()
> will allow for external coreboot drivers to register themselves
> with device_initcall(). Prepares coreboot to support additional
> coreboot drivers from other subsystems.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
