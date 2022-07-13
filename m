Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A76A15AA
	for <chrome-platform@lists.linux.dev>; Wed, 13 Jul 2022 02:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E3CC3411C;
	Wed, 13 Jul 2022 02:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657681086;
	bh=ppGPQRz71SyIIbpVVd2z7ECwSLRj01ZGyLWURlj+GMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eteu4NCCWfn+jiUzOIs19qru53PJJ87Bxq+f2JvAP/5JrNd9VG2tONn7NsH6d/WpZ
	 G1oEWQOFSwV4KuhaKZiEgkhUerBhycdNCuwO9faN2XpUm5WIE8HkOnbpmVc/HnL16Q
	 7G9Ma7xtC3pJhhCEG2l3t6u8He3TqCgu3bGciGhWV9Auia7N5XG1x0ZRddUqnfhayW
	 wvBSpZMiDl0F8uymLhgiL60tFA8TwvClk4MRVuVieTUBwkynEo09jWpV37/fluQMYe
	 sDa/yAMnGFJnF22ok3ZWdFAeW+4HtxcOPu4TKqkJwj8MW9kDnCzH+O6ImeUWfwwQ/u
	 hVagCi1Dg+DFg==
Date: Wed, 13 Jul 2022 02:58:03 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Tim Van Patten <timvp@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, rrangel@chromium.org,
	robbarnes@google.com, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2] platform/chrome: cros_ec: Send host event for
 prepare/complete
Message-ID: <Ys40uw4QIe4fQKA/@google.com>
References: <20220706205136.v2.1.Ic7a7c81f880ab31533652e0928aa6e687bb268b5@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706205136.v2.1.Ic7a7c81f880ab31533652e0928aa6e687bb268b5@changeid>

On Wed, Jul 06, 2022 at 08:51:39PM -0600, Tim Van Patten wrote:
> Update cros_ec_lpc_pm_ops to call cros_ec_lpc_suspend() during PM
> .prepare() and cros_ec_lpc_resume() during .complete. This allows the
> EC to log entry/exit of AP's suspend/resume more accurately.

Please be consistent.  Either way:
- .prepare and .complete.
- .prepare() and .complete().

The patch doesn't allow EC to log anything.  It makes AP emit more logs.

On the related note, the commit subject is confusing.  The patch doesn't
send "host event".  "host event" is a terminology when EC wants to notify
AP something.  Also, s/cros_ec/cros_ec_lpcs/.

> Changes in v2:
> - Include cros_ec_resume() return value in dev_info() output.
> - Guard setting .prepare/.complete with #ifdef CONFIG_PM_SLEEP.

I didn't see concerns in [1] have been addressed.

[1]: https://patchwork.kernel.org/project/chrome-platform/patch/20220701095421.1.I78ded92e416b55de31975686d34b2058d4761c07@changeid/#24920824
