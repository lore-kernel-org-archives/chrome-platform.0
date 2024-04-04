Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA524131E33
	for <chrome-platform@lists.linux.dev>; Thu,  4 Apr 2024 18:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712256801; cv=none; b=J6KzCam4H0PjA1ex/YdM9PZGU7OlPYzFKqzqNpCoNre2MndQtHt0i5bH5QFobGaHWXiSHZ5UKDViFwZd0R0mF/SVSdGNhjISuWuAyzAMA9jXV8ZvXuhYm+N5HiaXqxen6QVHhuBvwXR7ZNVmMc009xNz73lAYvseuCy/9TR3RYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712256801; c=relaxed/simple;
	bh=V3RgW9G+JxkpzYSviePbvmkV3FFJfBDYWrMg62VFLGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AizA8M7LYMsUdH58GBmpdwVBHGvCXDNJksw1lm98u7HiZFN6+nMQGjK/IFfXl7s/4PEo6lubly6HRUZTMapOAtCYklp4B1MnB3jksNPRjJ18YcEZ29YguUND030SJ6DnIykfjHK0L42LEQ9c4KeLe0KG6tdPx6eGbAM3N5K3l4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=axfUhUDk; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="axfUhUDk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1712256788;
	bh=V3RgW9G+JxkpzYSviePbvmkV3FFJfBDYWrMg62VFLGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=axfUhUDkaDTTC4F/dmtn0k7fPVejNQILBcRC2lfw9mSm2tf/iG8p2qI5SksOyu5MM
	 qRms5Q1Z2NzZbwMUTpJqb66gLPyxheGUpw+3WdEQ+YhO8NEYWHxeIUJfhRMDKSawIG
	 AsnwfcG5mTvg7qpVhix+Pv8CYRi90YCuEp0rgWqA=
Date: Thu, 4 Apr 2024 20:53:08 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: "Dustin L. Howett" <dustin@howett.net>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v3 0/4] platform/chrome: cros_ec_lpc: add support for AMD
 Framework Laptops
Message-ID: <2fba7925-f22a-4ea9-9368-57e50d2bddda@t-8ch.de>
References: <20231126192452.97824-1-dustin@howett.net>
 <20240403004713.130365-1-dustin@howett.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240403004713.130365-1-dustin@howett.net>

On 2024-04-02 19:47:09-0500, Dustin L. Howett wrote:
> This patch series adds support for the AMD models of the Framework
> Laptop (both 13" and 16").
> 
> These models of Framework Laptop have switched to an NPCX embedded
> controller, which uses the original Chrome EC linear memory-mapped I/O
> model.
> 
> However, these devices are not configured in a way that is compatible
> with the cros_ec driver. Instead of mapping EC memory to I/O ports
> [0x900, 0x9FF], they map it to ports [0xE00, 0xEFF].
> 
> To address this difference without impacting cros_ec_lpcs' compatibility
> with Chromebook/Chromebox devices or the existing Framework Laptop
> platform, these patches add DMI match-specific driver data through which
> we can detect per-machine "quirks".
> 
> Quirks toggle changes in cros_ec_lpcs' behavior, such as remapping the
> memory MMIO window.
> 
> Changes in v2:
> * Separated Framework Laptop (Intel) and Framework Laptop (AMD)
> * dev_warn has been demoted to dev_info
> * Style fixes
> * Reworded the individual patch bodies for clarity and style
> 
> Changes in v3:
> * Addressed dev_warn feedback from Thomas Weissschuh
> * Removed the host command region quirk; Framework Computer is slated to
>   release a firmware update that addresses the I/O region issue from
>   this series' v1 and v2. This leaves just one quirk, with the potential
>   for future quirks (e.g. changes required to reduce EC bus contention
>   on the Intel Framework Laptops)

For me this works with todays 3.0.5 firmware.

> Dustin L. Howett (4):
>   platform/chrome: cros_ec_lpc: introduce a priv struct for the lpc
>     device
>   platform/chrome: cros_ec_lpc: pass driver_data from DMI to the device
>   platform/chrome: cros_ec_lpc: add a "quirks" system
>   platform/chrome: cros_ec_lpc: add quirks for the Framework Laptop
>     (AMD)
> 
>  drivers/platform/chrome/cros_ec_lpc.c | 81 ++++++++++++++++++++++++---
>  1 file changed, 74 insertions(+), 7 deletions(-)

For the series:

Reviewed-and-tested-by: Thomas Weißschuh <linux@weissschuh.net>


Note:
For new revisions it makes sense to Cc people who interacted with
the previous ones. They are likely to have an interest and provide
feedback.
I only saw this by accident.
