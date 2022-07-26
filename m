Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E481E2590
	for <chrome-platform@lists.linux.dev>; Tue, 26 Jul 2022 14:44:32 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1EF7F4000E;
	Tue, 26 Jul 2022 14:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658846670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QlIFllD92SV1e0Wm3Ne0TmkhkIkCbI4gUrB2X7fsWJU=;
	b=h1LOtzYLP3bJ0oRX/LvVFtgvV6W3RBdBrzl1NthytoS8+XadGHfJvUEFOwVKJXZ3GQAY14
	5HW90FlKQ08/vGp42sh6vZRy/LkFzkIMtwZX5BX098TLDdr/My3yYA2ResSproN7u0qnTS
	t6EBYePHVWyqkP88r2zUQfFdsBaSRY8uOK5bx3D1RzBrJR3GsayITq7sn90qBiB6xMp393
	wXo5EztXdZfvc9veoAK1shV1fxKkrUTYa18voTIGOlD06fgS1lmUIE6smcCCXnjVhtdT44
	uL9xhwO5qyYwgPWcksBxAqnpOGuYiRDlP4GE/9XZl8mgJITFqBkQws+Z28xsXg==
Date: Tue, 26 Jul 2022 16:44:29 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: a.zummo@towertech.it, bleung@chromium.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: kernel@pengutronix.de, linux-rtc@vger.kernel.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH] rtc: cros-ec: Only warn once in .remove() about
 notifier_chain problems
Message-ID: <165884664842.3159950.4214538626084209259.b4-ty@bootlin.com>
References: <20220707153156.214841-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220707153156.214841-1-u.kleine-koenig@pengutronix.de>

On Thu, 7 Jul 2022 17:31:56 +0200, Uwe Kleine-König wrote:
> When a remove platform device callback returns an error code, the driver
> core emits an error message ("remove callback returned a non-zero value.
> This will be ignored.\n") and still removes the device. As the driver
> already emits a more specific error message, return 0 to suppress the
> core's error message.
> 
> This is a preparation for making platform remove callbacks return void.
> 
> [...]

Applied, thanks!

[1/1] rtc: cros-ec: Only warn once in .remove() about notifier_chain problems
      commit: 5c9f41443e8d5fbd414ad0dfa8e0996b937d135a

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
