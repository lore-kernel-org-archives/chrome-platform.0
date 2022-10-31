Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0157B17CB4
	for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 03:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C938C433C1;
	Mon, 31 Oct 2022 03:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667186808;
	bh=K7fJIDBZ9sghIrX7z558eOwkI5MBy/4uAVIbC63i3HQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HJbnJPZvaYXQ/oydCCLVqh1oWpWjOXpPn4ApRW1LLeaeVIWPVIgAckcg6H2Cgr8LA
	 gLrWvEqZj0ePI1OsBS5Y3eREQyrwCJvX5/oB8Lkj0fgP+L7CaxiKRDg7c6l8EREbxU
	 jLZGLB082BhHA3RiEE1R456go4l7OCAmZGWcbGffI0Ve+DugbRf40XpPbih+DL4g7t
	 H/GnAxx32ItKm/nN2+H0e/p9rO64R2Pzv/guK7+33KQBx0xjRsJib8OfAV6vie78hZ
	 MQkXcX/JoUjo/qUa+ccKAfnCdlPxYTrR7YRWOY3qHE7b+2XTVIz8wGhmlWx5Nu6ki3
	 u6kdvPgk/AiFQ==
Date: Mon, 31 Oct 2022 11:26:44 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Benson Leung <bleung@chromium.org>, linux-rtc@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH] rtc: cros-ec: Limit RTC alarm range if needed
Message-ID: <Y19AdIntJZGnBh/y@google.com>
References: <20221029005400.2712577-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221029005400.2712577-1-linux@roeck-us.net>

On Fri, Oct 28, 2022 at 05:54:00PM -0700, Guenter Roeck wrote:
> Drop error messages in cros_ec_rtc_get() and cros_ec_rtc_set() since the
> calling code also logs an error and to avoid spurious error messages if
> setting the alarm ultimately succeeds.

It only retries for cros_ec_rtc_set().  cros_ec_rtc_get() doesn't emit
spurious error messages.

cros_ec_rtc_get() could preserve the error log; cros_ec_rtc_set() could change
from using dev_err() to dev_warn() since cros_ec_rtc_set_alarm() calls
dev_err() if cros_ec_rtc_set() fails.  But this is quite nitpick so anyway.

> Cc: Brian Norris <briannorris@chromium.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
