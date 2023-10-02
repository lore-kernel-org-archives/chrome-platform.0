Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C05AA53
	for <chrome-platform@lists.linux.dev>; Mon,  2 Oct 2023 06:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A63A5C433C7;
	Mon,  2 Oct 2023 06:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696226471;
	bh=E6NHbvDfGdEjlAdElIutkw57ebLwqlv15g3KdfcOOkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gQsl1SOg6VvHVmF2WorijKzYYoHySmQfhTjFt5JMVeDMSmrQUW+cXUoQ3+PIvK8Iy
	 WppASh9kUzu1zWraN2/yKG2p+or5mOTelAHptdhBoPD8AP6NahHPQJsXf9QoO8A2mT
	 S4JLIxsC1iSqa4ctMspx3+Rpq78x2mwjdf6KZsfmsymjh8s394B9d8Q641fhlc/xi5
	 fgLt0F7vr+1We5/M8pifL5CVXORf298G3od2B6caozSC2405gqES4IYFlzsBtamoQx
	 kIy3yxL1cZ9HKAES3oGWXfw032IYhreGALrJXGfwOWJENTJvUE0FeavcdMhFAb/05d
	 UJMlZ6H5l4cbA==
Date: Mon, 2 Oct 2023 06:01:08 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-pwm@vger.kernel.org,
	chrome-platform@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [PATCH 11/11] pwm: cros-ec: Simplify using devm_pwmchip_add()
 and dev_err_probe()
Message-ID: <ZRpcpPhCX95ks2rc@google.com>
References: <20230929161918.2410424-1-u.kleine-koenig@pengutronix.de>
 <20230929161918.2410424-12-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230929161918.2410424-12-u.kleine-koenig@pengutronix.de>

On Fri, Sep 29, 2023 at 06:19:18PM +0200, Uwe Kleine-König wrote:
> Using devm_pwmchip_add() allows to drop pwmchip_remove() from the remove
> function which makes this function empty. Then there is no user of
> drvdata left and platform_set_drvdata() can be dropped, too.
> 
> Further simplify and improve error returning using dev_err_probe().
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
