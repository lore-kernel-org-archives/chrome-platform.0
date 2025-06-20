Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2D02D8DBD
	for <chrome-platform@lists.linux.dev>; Fri, 20 Jun 2025 15:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434989; cv=pass; b=PJWOKZhcvXz4wtp7SvaZr94HFZ2cdAk8YMZKrJLpA+3gZpz3dhu53zAjOYKx2XA/+p0Rm//OfcSMSZz4c/Vpce3TQeES0FG1HIzswaV2T8ngAR3ewT6GqyV2dWz7/FQWgjqQXpsESV25g21KmxNxr51WXltYznwYGvQgAbcCURg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434989; c=relaxed/simple;
	bh=5xnwn57hToUPm8QF6wQM7Wxtz/nSB0bNz8XLEqhjj0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r+5Cq7CYusg4UgXj+yoYiioe+GX7IACsBLLKCAJJLlIVjJD/X3SQ35Le8mU6hGAgx75x0Cxl5J6HOhv4FRKbwAZY6hN4U5UUXdq6Adhm7yuuYqD+OFwG63aNKd1RhNPqclPf5fTUtGaZTi3Qu/QsdsnT+xc3C6mhCij/Harvq+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=HGzRvcWB; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=Ai0PM/MS; arc=pass smtp.client-ip=185.56.87.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="HGzRvcWB";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="Ai0PM/MS"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-nlqb.prod.antispam.mailspamprotection.com; s=arckey; t=1750434986;
	 b=XtizEsYoFKSc+PT7SjMQkTCWfkyX77eo1d8wo0Hap7s9qACdWiIy88BlI14j2j4x9KfMW7VvOx
	  0BO100I6BZ4Exc3zdHSXb1OxlSzHbFvm+sutMfRJiuP1JSwLnQE/9wzDEK15JyjweZMxYnlT6V
	  xfmHOadj8i6vSMEOKPCSRMFzAOAu1BaT1O+x4/CpLhh5G7yrjs3vMr8iWjF3/V7Zvz+LB8fdt3
	  6jABYATvpIpY/S+AH5SUQ3RgAiYiItbB58iSMwkcZYhtVjCVyJ7MqEAwwcY6/Nxl+NcvYOdec/
	  23H/5mF6OZOh0xOiNwv6T+P3+FN87XL4VLaMRwkLZmrWDA==;
ARC-Authentication-Results: i=1; instance-europe-west4-nlqb.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-nlqb.prod.antispam.mailspamprotection.com; s=arckey; t=1750434986;
	bh=5xnwn57hToUPm8QF6wQM7Wxtz/nSB0bNz8XLEqhjj0o=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	  Message-ID:Date:Subject:Cc:To:From:DKIM-Signature:DKIM-Signature;
	b=xl4UOPc0rA+QFfDhMJhoOPFlXgHWzcdIYssaNePP5ickGj7PPJ07uLh0aHRhtUMxnjJ6kcP0Md
	  cErRBJ8T8uQjtQZV8NnunrNvSyrOV06wSY9O5KYfkrlZEAka0Wk3uqqJ8DVP+JxmdpFuIrpKzO
	  sDz7Cy2/7K8j3BnjKJlzuoUfqGDD8QCazXG+mK+QMNWgjkwkAIauMrKk2xnvUF0mlKXtpqa37c
	  DIZUOWh6TQ0idx6bYL9k3bZcL41jQmqmAqPjyyQXNl9UcAxTDaohTdYGORm2HowrAwHndyCPTA
	  FdnBndldz0pckA7hsVbW1jDDVAMaPXZrj+edhmKK5I3zrA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Reply-To:List-Unsubscribe;
	bh=3LVEzoRSold9GVypbu5ltp+xX0GVkhV3+mynLXoiQZA=; b=HGzRvcWBsElK0S8E+7VJepq7Q9
	2exYgdrhyfMnR9l1o7W3RFezag4sp25bH+xiaY7dwD2WY3n9YT4Xmzua0N2r0JbNSLS5vzkEim9PY
	vcYTgfWH7n0exTeBj+0HzIdpblvAcvPJtEodRU0CXGu5OP4LGtEkj8oTaznWhqbOz4cg=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-nlqb.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1uSe6J-00000009pLe-0jqg
	for chrome-platform@lists.linux.dev;
	Fri, 20 Jun 2025 15:56:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=3LVEzoRSold9GVypbu5ltp+xX0GVkhV3+mynLXoiQZA=; b=Ai0PM/MSA3RrtHq/pVxozvFBb1
	eYVoaJKyULwWR+OuPDhBoQCzgNUu84c0SH9K0+RYSSZOUheO9JMqU/Ajm6YFQeJGKiVD7OFwd+sSb
	ImY9RfmBPzb730BHd6NwTaOM6tWfPejdC2ZQfMLBmdJhiPvYQs6j0qO+q2GmeZE/q8Kk=;
Received: from [82.60.196.243] (port=62607 helo=fedora-2.fritz.box)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1uSe5y-00000000DoG-1ZGg;
	Fri, 20 Jun 2025 15:56:02 +0000
From: Francesco Valla <francesco@valla.it>
To: Sebastian Reichel <sre@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 linux-pm@vger.kernel.org, =?UTF-8?B?U8O4cmVu?= Andersen <san@skov.dk>,
 Guenter Roeck <groeck@chromium.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, chrome-platform@lists.linux.dev
Subject:
 Re: [PATCH v11 6/7] power: reset: add PSCR NVMEM Driver for Recording Power
 State Change Reasons
Date: Fri, 20 Jun 2025 17:56:01 +0200
Message-ID: <3135893.lGaqSPkdTl@fedora-2.fritz.box>
In-Reply-To: <20250618120255.3141862-7-o.rempel@pengutronix.de>
References:
 <20250618120255.3141862-1-o.rempel@pengutronix.de>
 <20250618120255.3141862-7-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 96f58b8ea06b3ed6f813aebc86b9b924
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1uSe6J-00000009pLe-0jqg-feedback@antispam.mailspamprotection.com
Authentication-Results: instance-europe-west4-nlqb.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Oleksij,

On Wednesday, 18 June 2025 at 14:02:54 Oleksij Rempel <o.rempel@pengutronix.de> wrote:
> This driver utilizes the Power State Change Reasons Recording (PSCRR)
> framework to store specific power state change information, such as
> shutdown or reboot reasons, into a designated non-volatile memory
> (NVMEM) cell.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
> changes v6:
> - rename pscr_reason to psc_reason
> changes v5:
> - avoid a build against NVMEM=m
> changes v4:
> - remove devicetree dependencies
> ---
>  drivers/power/reset/Kconfig       |  22 +++
>  drivers/power/reset/Makefile      |   1 +
>  drivers/power/reset/pscrr-nvmem.c | 254 ++++++++++++++++++++++++++++++
>  3 files changed, 277 insertions(+)
>  create mode 100644 drivers/power/reset/pscrr-nvmem.c
> 

Tested-by: Francesco Valla <francesco@valla.it>

I tested this on a i.MX93 FRDM using the on-board EEPROM as storage and
a single-byte cell. Unfortunately, the on-board RTC does not have a
scratchpad.

PSCR was set in two different ways during subsequent tests:

 - manually from userspace
 - simulating a over-temperature condition through the emul_temp sysfs

In both cases, it was re-read correctly after reboot.

This will be very useful to detect and debug anomalous shutdowns or
reboots on the field.

Thank you!

Regards,
Francesco


