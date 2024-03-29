Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B4C13342F
	for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 15:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711724410; cv=none; b=SXlB/oqfbdw6meTeJNg6eGPNMnV7iWhOr2cTMGKK/zuYukt0FGwekgr2IvT/m1aaOIC7M/ZNCDevnN0E4qlC12nZGJFmOxA5OWoyrtV2Fh5y7Ok8iCtvB7FrTA0qb4hESB8NXCmrCL8xphOMbyJUZKfLs1iBggvJbnGhwZQZGws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711724410; c=relaxed/simple;
	bh=P9Vm4HV7eB9CErLuKE9yaISuOH76tr6hyyC6siL9E88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eP8xoLMEoxls08nMj98//q2UG/yGqpXEI4svgCNLPHXp8pNmOls6iDJGnrWUuXkP9EVgQev/kdcTaN9yXDKAUHzOOlDZIP1ov5r8Wn0ZBRhHg7Y/wIEz/6Od/rjqm/GmAeOBAF1jRRY2O3Dc9ClbUblP5mloOBKZWJg1A1RdN84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XXt0/Ns+; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XXt0/Ns+"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 907EDFF806;
	Fri, 29 Mar 2024 15:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711724407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9HY2TI8IWDIktitx942jVAoOzJFNrwa90SfNY0daxKQ=;
	b=XXt0/Ns+SVsRqak5GdBcAwMGUJs+p3sIdgQvrqKAQmjDdBeZGSZu3NpgRdse/1thTTsE01
	puQwOfnxiOUNCENooLmQKNeu62f6jVUEcelSDWFkHjrUg5m3eqUw6lgj7JXkclTZok+YUU
	q3Eq2J1MG0EcZVIcRWcmPtRPeaNom4PUMlTCqcjYa8fnHcL5BaKTC46YCdnkg5Iz4JnN1K
	uFOR5L71US7w0sEdqOaKvViDB3mMCKR80jmazquFqD+R6JL+Lhei4dbmnx66Iun9xQ63qC
	B8q1T+2upAeWboz+3B3QdeB6yxmnrF8xhYDIoizm7FelniU7b68MdjtCxheEdQ==
Date: Fri, 29 Mar 2024 16:00:06 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: (subset) [PATCH 03/18] rtc: cros-ec: provide ID table for
 avoiding fallback match
Message-ID: <171172436462.1832232.11393823959733318559.b4-ty@bootlin.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-4-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-4-tzungbi@kernel.org>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Fri, 29 Mar 2024 15:56:15 +0800, Tzung-Bi Shih wrote:
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
> 
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c#L1353
> 
> 

Applied, thanks!

[03/18] rtc: cros-ec: provide ID table for avoiding fallback match
        https://git.kernel.org/abelloni/c/61c86d14745d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
