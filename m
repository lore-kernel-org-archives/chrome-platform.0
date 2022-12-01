Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4A87C
	for <chrome-platform@lists.linux.dev>; Thu,  1 Dec 2022 02:41:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB51C433D7;
	Thu,  1 Dec 2022 02:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669862494;
	bh=kQz0+HFGrtKeoRxgeRsrcDdIbIuMKBAN+HJXhL+YDtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rrs9y+bTAbbO6cz8wALB0IgVIV/wElGRRxR5D/om7JFpS6dMGBMhA4WZbmnW/zlJI
	 /qmjDxsit77tn1c2LxAg6aBXETyXClxhc0I4YeBSGy3lwaQBiab1HBfQurckTF88S4
	 t6iCkCB8s+sGIWHw06IgeU4UhzijAlOk3I9ryPinWL73dHizcO5q8OHVaPMewEfQQo
	 1bX59jtyYNwJz/Lf8X14gmFqVObaoc0Wg8d9yrBzg+WE1NSLReps+xmV2B+hkCzkCx
	 AiXRF4Lu3m0OVImOX/reMCxn88o4bl0HLUz5UE98qola0OiCquIawUnZ0fqvvzd0wY
	 kJHp3xqgF+tHg==
Date: Thu, 1 Dec 2022 10:41:31 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-pwm@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2 06/11] pwm: cros-ec: Propagate errors in .get_state()
 to the caller
Message-ID: <Y4gUW3imlkugimQE@google.com>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <20221130152148.2769768-7-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221130152148.2769768-7-u.kleine-koenig@pengutronix.de>

On Wed, Nov 30, 2022 at 04:21:43PM +0100, Uwe Kleine-König wrote:
> .get_state() can return an error indication. Make use of it to propagate
> failing hardware accesses.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
