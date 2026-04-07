Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2380381B04;
	Tue,  7 Apr 2026 06:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775542770; cv=none; b=JtsMg0MLFBsu8TXgFcV2C1u3WHjxzLLY8254JRga7VYu2j3Nh1i4PNv5ZPO49bTVaoS6/oFvcelOFeGgrlRst1EM8vq+ZtY8Hr8EXgk5+M0igD669Zi40XzMAh364CpzD48qaosOwlCe9dI7umsz+0qc2Lc2Cn8HWDcdGgeiIuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775542770; c=relaxed/simple;
	bh=UmfjfWvxUBwrJpc6KTuowh74EUvhEC6p673QnlwmR1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g6c4xAwgHURw3aQRzWdIo+s8h2IyGFV3dwuUVXioqNqD8wAqNMy+9xTMEtTbe53gQA5yUZwXkmw+Q/hWDaeeSdsdkm0lMvNkAJzM5x9SDVV42YFL+S4iwC5Rx8MfQsdlz2P5K0+53p7K7VpxGryA51Aqf2bN/X3deUgcn79BRAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IyLfLsJk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IyLfLsJk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 097D9C116C6;
	Tue,  7 Apr 2026 06:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775542769;
	bh=UmfjfWvxUBwrJpc6KTuowh74EUvhEC6p673QnlwmR1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IyLfLsJk6eYQBy7bFYCPx1FMYuzrggXUagP+GDqW4zC/4bBbscDxmEnyqLsHR2GfP
	 BKFTH0DeYO5pFHkTtoHra4MfrbwyqlO5ZPWTdVfCP7kUAi1ex/i4WQKgOxO83kXAHg
	 P7BI2hmb/4u1M2GeReWAvgyqzplrNAAbMQxyfxy4eFkWgCr1nfo3slYn60e54hMSrg
	 7gclUbZh6WyKNLmFoScppMW/05855xiYExiwFyrSQjeix71risew1KI/j0yJh/Kw7I
	 M52mw1uYQTR7+iGkDeiiiz077Jkxxd8ka+fMq9UFf7kv7tqr7G3DnxAU8i1w1y7pVm
	 WpuAHBE2/u3og==
Date: Tue, 7 Apr 2026 06:19:25 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Lee Jones <lee@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] platform/chrome: cros_kbd_led_backlight: Some
 cleanups
Message-ID: <adSh7Uh3lJusWOKT@google.com>
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

The series looks good to me.  I plan to apply at least patches 1-3 after
v7.1-rc1.
