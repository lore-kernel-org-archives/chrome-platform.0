Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49977FA
	for <chrome-platform@lists.linux.dev>; Thu,  1 Sep 2022 01:52:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE5CC433C1;
	Thu,  1 Sep 2022 01:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661997167;
	bh=5OYhr0FmcZUpnR6J3fyt7LZstNlDXPjm3a0A16QDWu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tCpTgXf62rt1UA8F0L0XKAkFBFFD6y2DI+LNXSX8d0vFc/D4d+SGdDlGKlnSTwHQC
	 xgzNzcu8NhSFhcefjhw1prLlpCuaWh6hxhzeG49iVw4Pjogiw8MRa5qb/9G7RJpqm2
	 p2fYJyZgAdIuJ7ShqkeuBbkz8OYTLOFv/hZzw5AxFLO1rAncVHFU00hjEbWLQuqGf7
	 Yr07nhPYY6F5ayCbrdOSFFknzKiWwZEUCGZB6IU/R6ArlMczyPZPXQn8TI/wJCn/Z0
	 toxylcHnehd+mFSWL4M0dPG7It7YOOb8h4isUbJoXCmrhDIZTDonsmRRHcT/xkJ3dk
	 BYgHqczmBr7LA==
Date: Thu, 1 Sep 2022 09:52:43 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Tim Van Patten <timvp@google.com>
Cc: rrangel@chromium.org, robbarnes@google.com,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] platform/chrome: cros_ec_lpc: Move host command to
 prepare/complete
Message-ID: <YxAQaxQXn2YTN1BJ@google.com>
References: <20220823095915.v7.1.I55189adfdb8d025fc991a0fa820ec09078619b15@changeid>
 <CANkg5ezTvzSFLkRWbhMDUqezQXW6996DYVohWMUa+cYwSB+YBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANkg5ezTvzSFLkRWbhMDUqezQXW6996DYVohWMUa+cYwSB+YBw@mail.gmail.com>

On Wed, Aug 31, 2022 at 12:00:55PM -0600, Tim Van Patten wrote:
> Hi,
> 
> Friendly ping on this patch.

We don't top-post on Linux kernel mailing lists.

> On Tue, Aug 23, 2022 at 9:59 AM Tim Van Patten <timvp@google.com> wrote:
> >
> > Update cros_ec_lpc_pm_ops to call cros_ec_lpc_prepare() during PM
> > .prepare() and cros_ec_lpc_complete() during .complete(). This moves the
> > host command that the AP sends and allows the EC to log entry/exit of
> > AP's suspend/resume more accurately.
> >
> > Signed-off-by: Tim Van Patten <timvp@google.com>
> > ---
> >
> > Changes in v7:
> > - Rename "host event" to "host command" in title/description.
> >
> > Changes in v6:
> > - Fully restore fixes from v3.
> >
> > Changes in v5:
> > - Restore fixes from v3.
> >
> > Changes in v4:
> > - Update title and description.
> >
> > Changes in v3:
> > - Update cros_ec_lpc_suspend() to cros_ec_lpc_prepare()
> > - Update cros_ec_lpc_resume() to cros_ec_lpc_complete()
> >
> > Changes in v2:
> > - Include cros_ec_resume() return value in dev_info() output.
> > - Guard setting .prepare/.complete with #ifdef CONFIG_PM_SLEEP.

I don't buy-in the ideas from the discussion in v3[1].  Thus, I would defer
to other reviewers/maintainers on the list to seek their suggestions.

[1]: https://patchwork.kernel.org/project/chrome-platform/patch/20220802113957.v3.1.I2c8c550183162e7594309b66d19af696b8d84552@changeid/
