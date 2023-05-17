Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1A7290F4
	for <chrome-platform@lists.linux.dev>; Wed, 17 May 2023 02:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9DBC4339B;
	Wed, 17 May 2023 02:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684290919;
	bh=zmqv6MjM7oNtFc9qzavUTqOwali/HD/2c4swdlVL9iM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lPG0UaCSc3yYi7kqWgyXuY+XfrjqyLQZq8hVNijuB7BAeftnsErlXkuPVE+2K2rbL
	 6ZCx9VqiNcVIFjv+i9kduPtEvFVsp0u6vJcC3+LuhqBpbD1B7u7AmzpdN1Zs7yW5OB
	 hbSVIYOR/PeqY7BOrKfD+TVxiHGJ11A1ChFk3/1AA66peMylkwhVuVMvn5v8SJmRAc
	 I4MvYbyusg6yNbahSqtb6bV6zLvmtXUJ4q3m/l1L+yLnUJ2OjXULi4oW7/f9fAZQEA
	 bdLFU9ojbHyJU8vgBUNUTaSt3JDDZVIdqKzzRJqn1wzbfZQUg03LJOjNUqPi19z3X1
	 3UWx2RgVih19A==
Date: Wed, 17 May 2023 10:35:15 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Tim Van Patten <timvp@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, robbarnes@google.com,
	lalithkraj@google.com, rrangel@chromium.org,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH] [v9] platform/chrome: cros_ec_lpc: Move host command to
 prepare/complete
Message-ID: <ZGQ9Y+vqWhQLHAQh@google.com>
References: <20230515142552.1.I17cae37888be3a8683911991602f18e482e7a621@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515142552.1.I17cae37888be3a8683911991602f18e482e7a621@changeid>

On Mon, May 15, 2023 at 02:25:52PM -0600, Tim Van Patten wrote:
> Update cros_ec_lpc_pm_ops to call cros_ec_lpc_prepare() during PM
> .prepare() and cros_ec_lpc_complete() during .complete(). This moves the
> host command that the AP sends and allows the EC to log entry/exit of
> AP's suspend/resume more accurately.

I can understand the patch wants to notify EC earlier/later when the system
suspend/resume.  But what is the issue addressed?  What happens if the
measurement of suspend/resume duration is not that accurate?

Copied from my previous mail:
* Should it move the callbacks?
  * Is it appropriate to call cros_ec_suspend() when PM is still in prepare
    phase and call cros_ec_resume() when PM is already in complete phase?

It seems prepare() is a more general callback.  It could be followed by
suspend(), freeze(), or poweroff()[1].  Do we expect the change?  For example,
the system is going to power off but EC gets notification about the system
should be going to suspend.  Same as complete().

Moreover, cros_ec_suspend() and cros_ec_resume() do more than just notify EC.
E.g. [2].

What about other interfaces (i2c, spi, uart)?  Do they also need to change
the callbacks?

[1]: https://elixir.bootlin.com/linux/v6.4-rc1/source/include/linux/pm.h#L74
[2]: https://elixir.bootlin.com/linux/v6.4-rc1/source/drivers/platform/chrome/cros_ec.c#L351

> Changes in v9:
> - Remove log statements.
> - Ignore return value from cros_ec_resume().

The change logs are not part of commit message.  They should put after "---".
