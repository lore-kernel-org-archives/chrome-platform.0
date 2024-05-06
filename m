Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDAC482CD
	for <chrome-platform@lists.linux.dev>; Mon,  6 May 2024 06:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714975806; cv=none; b=sXWvo4lTbclPTyKiZz4mokPM8XJdYJzDKJKrmYwNscWT76SD0FT2K0oygy8RBVeK9IHTRsEDwIWijYpPt9yRSho98Z+nYUQc8zdaaMpT5/WZp7uJi6Z9hW24lmMYo0peVZ5EaR4GNIM06dnJxWMDvhHbLE0ex9HSuIUo30C2bDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714975806; c=relaxed/simple;
	bh=sTMZwmVGPyNKhVYaypjAEtdGkY8Q2/gSqqldEhiPQqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPiNV+vDX69UpIxa7hEOCIBSXy4HlHpqCtKKm/JDBBZ8OAHnTVIq9bzQS2i+x2Uj4d54kJUehMg2lsZpALcQHyYnfkdxzT7L+2apPybwLmj4m7dEB/4iDnPClJ85URGoVjaoi6f3Dx//1SpmL0KG2jYCu/NpKHWcIY+x3AbfOMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Nq7NwWfy; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Nq7NwWfy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1714975798;
	bh=sTMZwmVGPyNKhVYaypjAEtdGkY8Q2/gSqqldEhiPQqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nq7NwWfyIHEM9rx4m3EW9x7iHW5HxdwFIn3MhCb1fe4y1YRqXbJfAfMZwfHMGWH8i
	 o43//nU43fPNTKQicGKJkjceFsXt6in8V9spgOouL5ttXQJU0/4B0B1bOYzga/KFDE
	 7Iurd9ZEwDVR1y70bCHQj/5yfM/X5WBu6Vk7OKK0=
Date: Mon, 6 May 2024 08:09:56 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	Mario Limonciello <mario.limonciello@amd.com>, "Dustin L. Howett" <dustin@howett.net>, 
	Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
Subject: Re: [PATCH 0/2] platform/chrome: cros_ec_framework_laptop: new driver
Message-ID: <613369f9-42c5-4a59-b83f-45bd1773ffe4@t-8ch.de>
References: <20240505-cros_ec-framework-v1-0-402662d6276b@weissschuh.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240505-cros_ec-framework-v1-0-402662d6276b@weissschuh.net>

On 2024-05-05 22:56:33+0000, Thomas Weißschuh wrote:
> Framework Laptops are using embedded controller firmware based on the
> ChromeOS EC project.
> In addition to the standard upstream commands some vendor-specific
> commands are implemented.
> 
> Add a driver that implements battery charge thresholds using these
> custom commands.

It turns out that standard ChromesOS EC defines EC_CMD_CHARGE_CONTROL.
The kernel headers however only define v1 of the protocol, which is very
limited.

But in the upstream firmware repo there is a v3 which is much better.

The Framework laptop only implements v2 which is also fine.
Given that v3 was only introduced late last year, it seems better to
stick to v2 anyways for now.

So please disregard Patch 2, I'll see on how to use this via a normal
cros_ec driver.

There are some other Framework-only features that will use Patch 1,
so feedback for that would still be good.

> Patch 1 adds the general scaffolding and device binding.
> Patch 2 implements the battery charge thresholds.
> 
> This series is based on
> https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
> Thomas Weißschuh (2):
>       platform/chrome: cros_ec_framework_laptop: introduce driver
>       platform/chrome: cros_ec_framework_laptop: implement battery charge thresholds
> 
>  MAINTAINERS                                        |   5 +
>  drivers/mfd/cros_ec_dev.c                          |  13 ++
>  drivers/platform/chrome/Kconfig                    |  11 ++
>  drivers/platform/chrome/Makefile                   |   1 +
>  drivers/platform/chrome/cros_ec_framework_laptop.c | 173 +++++++++++++++++++++
>  5 files changed, 203 insertions(+)
> ---
> base-commit: 2fbe479c0024e1c6b992184a799055e19932aa48
> change-id: 20240505-cros_ec-framework-10e627c46a0a
> 
> Best regards,
> -- 
> Thomas Weißschuh <linux@weissschuh.net>
> 
