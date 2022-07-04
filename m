Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF39B15A3
	for <chrome-platform@lists.linux.dev>; Mon,  4 Jul 2022 06:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA70FC3411E;
	Mon,  4 Jul 2022 06:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656916327;
	bh=2ekcqSvi0Fjef1pZ1Us6IGyplCXV15YiS06ugPQfX+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tbXRCLY1XXcSeCZqEwDGc2X7gG35ngn9tD7yoWYulO9Uwxd8RXLbl8eIrosJ2cZCt
	 Sg4sCgChSHTq422xx5RpdVNB1BP+EFmbweY+PyqnvErCeoBmGj13fIe64mJhK9Lzf1
	 vfAe1PrnqLuHjXQgIzwTLcouctZqxH4oZPruo8Fhx5f9apmvPVKFgNLkBhEILaFRd2
	 wIdsQU6Fe3PC62peOOABGlGtkpEQh05ucoMea8vInZ8bFz3ZvQzqiseJf8OSH7U01M
	 jvjECuZPE7JOacF3cSbDgr2c1O/WFYHYFSAN2Um3p0jfrex0eJGZxvQfTyJmjMOBeX
	 S4lt5tSigkuIw==
Date: Mon, 4 Jul 2022 06:32:04 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 05/11] platform/chrome: cros_ec_proto: separate
 cros_ec_wait_until_complete()
Message-ID: <YsKJZKfmpe5NyNJO@google.com>
References: <20220628024913.1755292-1-tzungbi@kernel.org>
 <20220628024913.1755292-6-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628024913.1755292-6-tzungbi@kernel.org>

On Tue, Jun 28, 2022 at 02:49:07AM +0000, Tzung-Bi Shih wrote:
> EC returns EC_RES_IN_PROGRESS if the host command needs more time to
> complete.  Whenever receives the return code, cros_ec_send_command()
> sends EC_CMD_GET_COMMS_STATUS to query the command status.
> 
> Separate cros_ec_wait_until_complete() from cros_ec_send_command().
> It sends EC_CMD_GET_COMMS_STATUS and waits until the previous command
> was completed, or encountered error, or timed out.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Could someone on the list help to review the remaining patches in the series?
