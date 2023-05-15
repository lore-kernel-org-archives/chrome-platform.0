Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48E43D64
	for <chrome-platform@lists.linux.dev>; Mon, 15 May 2023 06:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E20EC4339B;
	Mon, 15 May 2023 06:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684130717;
	bh=f6bqMU+euOnxpPgqmR9h+2rAd+JPlhMh/M8elKFs1VE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EPQ+1Cdaf+upl9IkJQltBUGaJM7a91WJKbJBF6Zwd2EkvCJ8r5imfCvCgkN4Z+n9p
	 3O2lyXPsvOtYvvruTpEyv2YXA9QmDWpTFcU6bfGjy6R2xmO4hMVDikh9smPCnPiL47
	 TcSl/eJ655OnhkDDbgP1IerZhUfrsreBgObcqGvrb+ciQ1E0tpGHjDFYF/H8fwQbaW
	 ty+W0ZuOqxZPaLb1ftnD7ZNWrO2QV5/KDz1Pkdv8gG+9kc6sAnE+HmEhTo+kmrsZUu
	 2CIkzU2gEWwxjcVGh4vTzqMefcvnQQKoeox3qyH1Q5KT3Xz77psRTkn8V0ljpazSY3
	 np4oSFILWhwWg==
Date: Mon, 15 May 2023 14:05:13 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Tim Van Patten <timvp@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, lalithkraj@google.com,
	robbarnes@google.com, rrangel@chromium.org,
	Tim Van Patten <timvp@google.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: Move host command to
 prepare/complete
Message-ID: <ZGHLmVZbpBC7pNS7@google.com>
References: <20230512113556.1.I55189adfdb8d025fc991a0fa820ec09078619b15@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512113556.1.I55189adfdb8d025fc991a0fa820ec09078619b15@changeid>

On Fri, May 12, 2023 at 11:35:57AM -0600, Tim Van Patten wrote:
> Update cros_ec_lpc_pm_ops to call cros_ec_lpc_prepare() during PM
> .prepare() and cros_ec_lpc_complete() during .complete(). This moves the
> host command that the AP sends and allows the EC to log entry/exit of
> AP's suspend/resume more accurately.

This is an old series.  It should preserve the version number and change logs
(at least until v8[5]).

Went through the series again, and put all concerns together:

* Should it print more logs during suspend/resume?  See v1[1].
  * Which is more like local patches for debugging some specific issues.

* Should it move the callbacks?  See v2[2].
  * Is it appropriate to call cros_ec_suspend() when PM is still in prepare
    phase and call cros_ec_resume() when PM is already in complete phase?

* Should it print return value of cros_ec_resume()?  See v3[3] and v7[4].
  * By referencing other use cases, they just defer it to PM.

[1]: https://patchwork.kernel.org/project/chrome-platform/patch/20220701095421.1.I78ded92e416b55de31975686d34b2058d4761c07@changeid/
[2]: https://patchwork.kernel.org/project/chrome-platform/patch/20220706205136.v2.1.Ic7a7c81f880ab31533652e0928aa6e687bb268b5@changeid/
[3]: https://patchwork.kernel.org/project/chrome-platform/patch/20220802113957.v3.1.I2c8c550183162e7594309b66d19af696b8d84552@changeid/
[4]: https://patchwork.kernel.org/project/chrome-platform/patch/20220823095915.v7.1.I55189adfdb8d025fc991a0fa820ec09078619b15@changeid/
[5]: https://patchwork.kernel.org/project/chrome-platform/patch/20221028171820.v8.1.I55189adfdb8d025fc991a0fa820ec09078619b15@changeid/

> Signed-off-by: Tim Van Patten <timvp@chromium.org>
> Reviewed-by: Raul E Rangel <rrangel@chromium.org>
> Signed-off-by: Tim Van Patten <timvp@google.com>

It shouldn't need duplicate S-o-b.
