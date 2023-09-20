Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4179B2584
	for <chrome-platform@lists.linux.dev>; Wed, 20 Sep 2023 07:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E69C433C9;
	Wed, 20 Sep 2023 07:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695195928;
	bh=vyU8wQPi6oh/NjWmtzvVpS8tL4Q//A1RZnrGiTgWwE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j+tpIOP9B9Kw6nLCMGc/BdMZVi9Y8skhvp2CX1mePe4qQFSCe4m3f7n7WkU3X8JI5
	 lsMU338oKFGg81pTihTKNfqOIuSJ2PQgvOzIA+0tvRndpPspxcKnQuA/g4cj9x7Fn8
	 P4UNbY9ctJsrIqtrwKfLmWr8QhjTYWwfykRh9JiNEjRgY30BtYvxxkAouHVQ6nijhl
	 s+AoKczkyld3fKOfwxICbXS6qJXEnEjypt4vDWTppT9pf7uE38n8tmx01wUchwo0gg
	 PH0xeQadAa6f4q1d65VoDOUXrROHlm8cre1mBWWEMPgroXrVAoyAjFqPxOSu89xPcr
	 cuoBlFdIHUURQ==
Date: Wed, 20 Sep 2023 15:45:25 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-iio@vger.kernel.org,
	chrome-platform@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [PATCH 45/49] iio: proximity: cros_ec_mkbp: Convert to platform
 remove callback returning void
Message-ID: <ZQqjFWBPti2c734w@google.com>
References: <20230919174931.1417681-1-u.kleine-koenig@pengutronix.de>
 <20230919174931.1417681-46-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230919174931.1417681-46-u.kleine-koenig@pengutronix.de>

On Tue, Sep 19, 2023 at 07:49:27PM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
