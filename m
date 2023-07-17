Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B68717C5
	for <chrome-platform@lists.linux.dev>; Mon, 17 Jul 2023 03:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2ECAC433C7;
	Mon, 17 Jul 2023 03:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689564875;
	bh=gumOmQ9H5ZNL4mOAlqBRGIcAVcsoguAmIqGYv9QD4HM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OZ++MktaOg9+wroeqlXbz/1/3N3V9anziqx48qTmeyeEg980yB2tJI/z5cv58ikmM
	 Y52jIwhpj9CyF/5Zrd3erScG3HUbFGmq6rzRU9Nmuors554/H8ukH38odsDmr0Fg1I
	 mxVcZZ0y0MScBug8XxRTgvKpX1gPqPIntIpL5ILQLNrBi/RbOW+nwLTHLlLTDbgAh2
	 /UfLK/T9eoJdgMxxjUgCdkHHST10gB8NoM+xlq5Rf/zAlGosc+C1FL3rcs+l6L+O1z
	 dt7zwPJb4BsnZ3H4rNiqYOyE0Ai2M9smqwD9gpy49RK4IEop9e8V0nVIiwp0JnhHS3
	 WJo0Q6w5H8xcA==
Date: Mon, 17 Jul 2023 11:34:31 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-pwm@vger.kernel.org,
	chrome-platform@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [PATCH 05/10] pwm: cros-ec: Consistenly name pwm_chip variables
 "chip"
Message-ID: <ZLS2x0ZN1dE+2nob@google.com>
References: <20230714205623.2496590-1-u.kleine-koenig@pengutronix.de>
 <20230714205623.2496590-6-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230714205623.2496590-6-u.kleine-koenig@pengutronix.de>

On Fri, Jul 14, 2023 at 10:56:18PM +0200, Uwe Kleine-König wrote:
> Most variables holding a pointer to a pwm_chip are called "chip" which
> is also the usual name in most other pwm drivers. Rename the two
> variables that have a different name to be called "chip", too, for
> consistency.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
