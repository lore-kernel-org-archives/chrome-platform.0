Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1468D261
	for <chrome-platform@lists.linux.dev>; Sat, 23 Dec 2023 11:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="a/+V/RHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1703331233; bh=6STJI24I6hd4IfJY2OqV+aLcsEceG7PxLbrxAT294LM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a/+V/RHsI1TYlchk6q3AiTQrboYaoVU2VJp1GI4NUTk55LTVk/p1ICHl9oidIDXOF
	 dsAKv3I8aOvMre6Kfm+qDsPj/Y9cqhRjM63Tgzfcr08SQxtaTu/LG9aFOHi57vr4Gz
	 pawAGdl5BDr/5KcfnQbBlPD8v2TQq/GCedmQnsWA=
Date: Sat, 23 Dec 2023 12:33:51 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: "Dustin L. Howett" <dustin@howett.net>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2 0/4] platform/chrome: cros_ec_lpc: add support for AMD
 Framework Laptops
Message-ID: <1285b3d2-c7de-437c-bd6e-663a88eedd6b@t-8ch.de>
References: <20231005160701.19987-1-dustin@howett.net>
 <20231126192452.97824-1-dustin@howett.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231126192452.97824-1-dustin@howett.net>

Hi Dustin,

On 2023-11-26 13:24:48-0600, Dustin L. Howett wrote:
> This patch series adds support for the AMD models of the Framework
> Laptop (both 13" and 16").
> 
> These models of Framework Laptop have switched to an NPCX embedded
> controller, which uses the original Chrome EC linear memory-mapped I/O
> model.
> 
> However, these devices are not configured in a way that is compatible
> with the cros_ec driver. Instead of mapping EC memory to I/O ports
> [0x900, 0x9FF], they map it to ports [0xE00, 0xEFF]. Furthermore, the
> ACPI node for the embedded controller incorrectly indicates that it does
> not use port 0x8FF for host commands. It does use port 0x8FF.

Do you know if this incompatibility is intended, a technical necessity
and/or possible to be fixed upstream?

> To address these issues without impacting cros_ec_lpcs' compatibility
> with Chromebook/Chromebox devices or the existing Framework Laptop
> platform, these patches add DMI match-specific driver data through
> which we can detect per-machine "quirks".
> 
> Quirks toggle changes in cros_ec_lpcs' behavior, such as remapping the
> memory MMIO window and reserving I/O ports differently.
> 
> Changes in v2:
> * Separated Framework Laptop (Intel) and Framework Laptop (AMD)
> * dev_warn has been demoted to dev_info
> * Style fixes
> * Reworded the individual patch bodies for clarity and style
> 
> Dustin L. Howett (4):
>   platform/chrome: cros_ec_lpc: introduce a priv struct for the lpc
>     device
>   platform/chrome: cros_ec_lpc: pass driver_data from DMI to the device
>   platform/chrome: cros_ec_lpc: add a "quirks" system
>   platform/chrome: cros_ec_lpc: add quirks for the Framework Laptop
>     (AMD)
> 
>  drivers/platform/chrome/cros_ec_lpc.c | 94 ++++++++++++++++++++++++---
>  1 file changed, 86 insertions(+), 8 deletions(-)
