Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FD615AA
	for <chrome-platform@lists.linux.dev>; Wed, 13 Jul 2022 02:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D939C3411E;
	Wed, 13 Jul 2022 02:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657680036;
	bh=VmkzAB14DLBxIZBlZROnfr8StDMPBFB9ZTFTn6CIvbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RFjHlWWsq1LkuKZNlV/sTU82LxSBRvsNJe4fGNN4aunc+0wwXfXj+LaGO/3Shgpxu
	 niyBh6DTQxwGJV9H7qKd9Yci5vbLDpAFpLzCgvC7stmGApnCsCpXZt8nwS+i9yUP2L
	 b55cxCnCKFE445xcpudPIIVK8Q8iOyVyjGdXeau9hKTu8vxHyMalBCuHqhUVy+qT2c
	 lxetGWHj1fZeqJsGyNKN6lk0e9rXXYqV6Iu0NBO5CbPZEA5d2UuUrVwdXWA0AWNY1O
	 2r5eBTq4ZSmGAVfv5LDRf07gH3QiMyqWkP1pdo8HX19rVClixXU8P7K5XpJeXR2S0A
	 xsPGGu8FXFLoQ==
Date: Wed, 13 Jul 2022 02:40:28 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-rtc@vger.kernel.org,
	chrome-platform@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [PATCH] rtc: cros-ec: Only warn once in .remove() about
 notifier_chain problems
Message-ID: <Ys4wnOshktFC1b0q@google.com>
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

On Thu, Jul 07, 2022 at 05:31:56PM +0200, Uwe Kleine-König wrote:
> When a remove platform device callback returns an error code, the driver
> core emits an error message ("remove callback returned a non-zero value.
> This will be ignored.\n") and still removes the device. As the driver
> already emits a more specific error message, return 0 to suppress the
> core's error message.
> 
> This is a preparation for making platform remove callbacks return void.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
