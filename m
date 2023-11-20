Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDC6F4F3
	for <chrome-platform@lists.linux.dev>; Mon, 20 Nov 2023 08:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dOMDZPb7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DADEC433C9;
	Mon, 20 Nov 2023 08:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700470493;
	bh=ngjDvUn9q+QedfoN11X78gSytnT4ehNNgoyO5WHwviA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dOMDZPb7Dj7FPocPAfqmp66+k9MTZtRVQWUtHdTWU8hqJ6nLLwkxzEfjElB6Q6avq
	 D4MzRj/S5kJP6sCeZUra7U8so/snekW2mH3bkfZjfdLxqsGt7zaZNoZtmdgzZcI/AW
	 4xWcO0/0fpYnLr+eB5PVL9UpWyQF9rLrMwJUGk6yucj/27mFxjn5IyChMUayC9VgXo
	 1Z5uwJEtfTvxz8yBHltPtBBNwPLn+gYV6cvQr3d/r1H28n4URLty1rvNCyTiGlgd5L
	 b6RqhuRRRssF6ULs88Y9bkzFFxVVG4+1bAmcVXUYRNLpEeFV2b8LqZToVvJhD5iWZy
	 ayBZjsRMZprEg==
Date: Mon, 20 Nov 2023 16:54:50 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-pwm@vger.kernel.org,
	chrome-platform@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [PATCH] pwm: cros-ec: Drop unused member from driver private data
Message-ID: <ZVse2h-qt6w08diL@google.com>
References: <20231116105212.650951-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231116105212.650951-1-u.kleine-koenig@pengutronix.de>

On Thu, Nov 16, 2023 at 11:52:13AM +0100, Uwe Kleine-König wrote:
> .dev is unused since the driver was introduced in commit 1f0d3bb02785
> ("pwm: Add ChromeOS EC PWM driver"). Drop it.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
