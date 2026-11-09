Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253212;
	b=G/SKsAz77Q0Xo9wqvGEkdqikHnC/h94A5Eaio4TojKZFmf9dN9TwluUIBRQgBONNEgkT
	 sz7Sluln49NTNvR5CtaCHiBUQi/IWFuTQm79R2mAaudfad8NfiZUvVUZ4MOdVXT3eb9Yc
	 N4iz8aU29nrt2dBIAnFy8jqJcivJWobyjQ+FJN/wnVj2tOwICF3JWL5Cu1rhOQW+PR2iA
	 pZdMtPSdgGq6W7xgas7unv1+DPHySa6/jBMlLRhyZBP/sfcG6vfMQi+5oDduREmYMrLy8
	 zR8M3lHX6jdWR37GRRPsankDaiYJdsZz0apfuu7W7GNM/TJBAPy9g39YvX2o/u20aQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253212;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=4Wm2J/Rwm9e2g/zE5Ghv/n1yoFpaR5DeMNlmeAfXp5E=;
	b=QTZw4MetfwU/cfLbFJd1a3qqqxPITdSJS5BDO8ZhYphdaBfqMIJOo1sEoQAW/UJcm9+J
	 m5tz5yaJTCtUtaAHRfkMl7mjAd700mWd0IrX9gzG18i+mY7KLSyMze8/y1CQDEuzWzF0z
	 vfNxRss0nI6XRUcREZFKz9ED8RpUfwck4A0OvmLClj+6jHTQuY9y+9M3u4pgOhyivd8OK
	 pS7rkK8BVlH3TTuM41m6ia0GC088GWWgSTgV102bci8f0J2Qd/mYEITWpyzAKBWveZiuu
	 1b8mZbF64NTuXBmeQs0V3KFt94hj+QEqQQ1x1qAD85HruFGGMRFYeWGzr3MADOIXy1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nrzPmfHg;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39390606A31C
	for <chrome-platform@lists.linux.dev>; Mon,  9 Nov 2026 19:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39390606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nrzPmfHg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794253213; x=1825789213;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=pNrs0GhiFl2Onw5lHsU62rnokYtXhv/ZC6egY3NlFSM=;
  b=nrzPmfHgC9nogs9lKacbqNZgHKGkSCkp0D01FoWyES6QiF9S7wCyxfWX
   X9AT53GIvvsMGT/CCIRnZSFBQCoDQ/KnifLbqcw6lSRJso+sGVKIuu+mm
   YXZZMHw4kM6KzKwDC6ggitaji+53gAktCw+2ZcFKsOkNj1tTtZ/znSOSX
   iVLq7zjMg5WD6Wm6Y5adf18qXTtYdHqYe5xFXgW8La9AHP3BQ+KmjQIty
   kkkKlfJm2GSTzQezF1aTKj4Rv2yJ5Dz9dBT4LPhiEN6pSMOFoXplKrHP+
   IJ4QLsZ3w1MseuimzAs2tmr5tDh97d3c6qp9fAkmw1KU1EVl6SBXSAjKp
   A==;
X-CSE-ConnectionGUID: UQnB4wJyTTK456odb0xsag==
X-CSE-MsgGUID: gnAJ4kxASPyjrZ4fi92lrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2867552"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2867552"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 11:40:12 -0800
X-CSE-ConnectionGUID: 9DAS3eDqQU+YUNTN4PwKMA==
X-CSE-MsgGUID: oMGM5B6wQjqPytry7vo6uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="9727724"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.139])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 11:40:04 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, Ike Panhc <ikepanhc@gmail.com>, 
 Rong Zhang <i@rong.moe>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
 Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, 
 linux-leds@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org
In-Reply-To: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
References: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
Subject: Re: [PATCH v7 00/13] leds: Add support for hardware-initiated
 hardware control trigger transition
Message-Id: <179425319974.10927.7190572777719580956.b4-ty@b4>
Date: Mon, 09 Nov 2026 21:39:59 +0200
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 21 Sep 2026 03:40:14 +0800, Rong Zhang wrote:

> Some laptops can tune their keyboard backlight according to ambient
> light sensors (auto mode). This capability is essentially a hardware
> control trigger. Meanwhile, such laptops also offer a shrotcut for
> cycling through brightness levels and auto mode. For example, on
> ThinkBook, pressing Fn+Space ("shortcut") cycles keyboard backlight
> levels in the following sequence:
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[01/13] leds: class: Always protect brightness_show() with led_access
        (no commit info)
[02/13] leds: trigger: Move led_trigger_is_hw_controlled() to the right place
        (no commit info)
[03/13] leds: class: Remove hardware control trigger when writing brightness
        (no commit info)
[04/13] leds: trigger: Move led_trigger_group to the right place
        (no commit info)
[05/13] leds: trigger: Add hw_offloaded() callback and provide trigger_may_offload_to_hw attribute
        (no commit info)
[06/13] leds: cros_ec: Implement hw_offloaded() trigger callback
        (no commit info)
[07/13] leds: turris-omnia: Implement hw_offloaded() trigger callback and declare hw_control_trigger
        (no commit info)
[08/13] leds: trigger: netdev: Implement hw_offloaded() callback
        (no commit info)
[09/13] leds: trigger: Enforce strict checks in led_trigger_is_hw_controlled()
        (no commit info)
[10/13] leds: trigger: Add led_trigger_notify_hw_control_changed() interface
        (no commit info)
[11/13] platform/x86: ideapad-laptop: Serialize keyboard backlight tracking
        commit: d288a6f989b7b9e6a730140c601987b886af327e
[12/13] platform/x86: ideapad-laptop: Decouple hardware & classdev brightness for keyboard backlight
        commit: 7d6c073d181d7855561831cb4bba17dc9b7d4aa9
[13/13] platform/x86: ideapad-laptop: Fully support auto keyboard backlight
        commit: 5d805ca01382d63d54c9984e7f19922c4ae6f3dc

--
 i.

