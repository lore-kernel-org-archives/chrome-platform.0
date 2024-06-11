Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48072570
	for <chrome-platform@lists.linux.dev>; Tue, 11 Jun 2024 04:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718079432; cv=none; b=fX6XgDaAtK1DdQ/fW9EmiFYZ1em9ZGNbGvz+GFdnVxyjy2i0KZ3JMt/YU2oa3DdtzuB++uIXRuDOdiFEs8mlHnUG72sn8LH3yk3fB41nxWLmw4MykQsUvyK4Ypx0y/ZZ51/wGe6m9PXxhxlCyKo2y0ZWexvpmCDXqIwIflRfABA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718079432; c=relaxed/simple;
	bh=pOqxnzpHsqOorNOTPo+6rMsXtOAA9gSB1Pi1l3jkIyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cLIjLj2A4Z/0T5l63bFzp0Y33Ep6+lCYnHy379N+pIe4kzAe/5weHKeDkzbqIl/aAyFAdyvVJDp4LAH9Beal3BBBgmKAAK5fEZOE7sbmrPOk1nao0mbcbJJxT92pbWCVhQ/S/8q5r15OSsTXdJ3GTFCCf5giEq02QQl+JP62Urg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=fqdbYVdI; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="fqdbYVdI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1718079423;
	bh=pOqxnzpHsqOorNOTPo+6rMsXtOAA9gSB1Pi1l3jkIyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fqdbYVdISC27qrrAvuV+Kb8aqggOdTRwNbAKDNHhALa+nHwlBqh61kx2cv2uP37hD
	 V3KOLUU4EUEkmJl7Z3MQoWywK78uTVjAmByvSBO+dkY9cs6i6z8+Ogo3PLh6/oBPi9
	 sggBP+WGlZ6IjSKX1xasoaDRvmCIj55DVx7GUzKU=
Date: Tue, 11 Jun 2024 06:17:02 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Jean Delvare <jdelvare@suse.com>, 
	Dustin Howett <dustin@howett.net>, Mario Limonciello <mario.limonciello@amd.com>, 
	Stephen Horvath <s.horvath@outlook.com.au>, chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 0/5] hwmon: (cros_ec): fan target, fan pwm control and
 temperature thresholds
Message-ID: <26d68031-233f-432a-b395-cdbafc31191b@t-8ch.de>
References: <20240608-cros_ec-hwmon-pwm-v1-0-d29dfc26fbc3@weissschuh.net>
 <536e51a1-5968-4493-96ce-287167b89288@roeck-us.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <536e51a1-5968-4493-96ce-287167b89288@roeck-us.net>

On 2024-06-10 18:18:05+0000, Guenter Roeck wrote:
> On 6/8/24 01:12, Thomas Weißschuh wrote:
> > Add support to cros_ec_hwmon for
> > * fan target speed for fan 1
> > * fan pwm control for all fans
> > * fan temperature thresholds (RW) for all temp sensors
> > 
> > The EC also supports tempY_auto_pointZ_{pwm,temp} but that does not yet
> > seem to be usable from "struct hwmon_channel_info".
> > Guenter, is this intentional, do you want me to add support for it?
> > 
> 
> When I wrote the _info API, I figured it was too chip specific to make
> it generic. It is also at least somewhat questionable if it makes sense
> to have all that configurable through sysfs in the first place; normally
> the ranges are device specific and should be configured through the
> thermal subsystem using devicetree properties and not be touched by
> the user. There might even be warranty implications by playing with
> thermal parameters if someone manages to overheat the system as result.
> I really don't want to help enabling that.

Fair enough.

> Which leads to the next question - we are going way beyond just reporting
> system operational parameters with your patches. What is the actual use
> case ?

The pwm control is something that many users want.
There are a custom daemon [0], its gnome-shell-extension [1] and quite a
few scripts shared in the Framework forums to adjust the fan pwm through
ectool.

Personally I'd like to avoid some thermal throttling for shorter compute
tasks where the default curves are not aggressive enough.

For the others, it's mostly because the information was already there.

I'd be fine with dropping the write access to the thresholds,
not even ectool exposes that.

[0] https://github.com/TamtamHero/fw-fanctrl
[1] https://extensions.gnome.org/extension/7053/fw-fanctrl/
