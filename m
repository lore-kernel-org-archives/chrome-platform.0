Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7E331A805;
	Mon, 27 Apr 2026 02:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777257300; cv=none; b=X7IuyCNSB0rkdr+yvcwrwJXOqEXhbDCLs0BAKBInnMeFbDVHZa1iZCD86R8DN434O4+tgWoy2R/rH+cnYhrtMS+wp1m/I3+KMcQpqZ048/GtR85pr4oHn3fV7gZDKHOkKp/idz3ZzT7Cpwtky3wwtQg9c13quGzXQHyNUjn5aBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777257300; c=relaxed/simple;
	bh=wpGkWdKGCPiyOxkGiCMszuu+DpWu0F7ydpdrwL4M/L0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhgUwSYO56xUFCCzGg3sTBAOLDU9n6BGm5uC/6jAmDnjIwB9DvimydXpWrPcnn34eKEWNS+g9tRbiFQd/qSBUCum23PNKtTOYEH9YykKpUCO5+WwNtY17EawgjreolNxzM6/u+v/CHg1ICjwSEUcQjEEIrEZGlVk1lbxWh41pe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HG7oexhm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HG7oexhm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9525C2BCAF;
	Mon, 27 Apr 2026 02:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777257299;
	bh=wpGkWdKGCPiyOxkGiCMszuu+DpWu0F7ydpdrwL4M/L0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HG7oexhmx5aXmnzm2/c7ddlUtiN2wyfkPB1bxbKWeu1Gmj12q9TKoaNKgJEP5PDr1
	 oGGgXgVCJ0JSlvMfq+NnJ6ZcgwQrF75SCMTV3qG8yCOZv2kQG7YjSopK3/2VfKeMS/
	 eaaWTQx12/Ttp74uzr5+QarFRqdieGarLfLwLKPCgOEFrBh/w5k8P7YeG/kX4DKdTu
	 z8uB2UKXeZnH3OsJM5fO1I7HqENrDvrDMddWlgUO9euA2VZa37VChsEec+xtVPgWhf
	 50hwfqPDRJ2HFrMuiLDPWR1cRtDCV6Ww8e7eOnrVD6FYEjLZPSWyeu3qECAV9/pWJg
	 Vhsy90PRRN49A==
Date: Mon, 27 Apr 2026 02:34:56 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Lee Jones <lee@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/5] platform/chrome: cros_kbd_led_backlight:
 Some cleanups
Message-ID: <ae7LUB6ej-lusYDk@google.com>
References: <20260404-cros_kbd_led-cleanup-v1-0-0dc1100d54e3@weissschuh.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260404-cros_kbd_led-cleanup-v1-0-0dc1100d54e3@weissschuh.net>

On Sat, Apr 04, 2026 at 09:55:25AM +0200, Thomas Weißschuh wrote:
> Some cleanups for the cros_kbd_led_backlight driver.
> 
> Patches 1-3 should go through platform-chrome.
> Patch 4 and 5 should go either through platform-chrome or MFD.
> 
> 

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/5] platform/chrome: cros_kbd_led_backlight: Drop max_brightness from driver data
      commit: d572049e6f4c46868d4d98c459618ed32bd93b2d
[2/5] platform/chrome: cros_kbd_led_backlight: Pass keyboard_led as parameter
      commit: 094a473e5dd6e02da5c09bf2c184c59c10a7b70c
[3/5] platform/chrome: cros_kbd_led_backlight: Drop CONFIG_MFD_CROS_EC_DEV ifdeffery
      commit: 0fd0fea2525d979c6de4ae546ac2ea1801849ae5

Thanks!
