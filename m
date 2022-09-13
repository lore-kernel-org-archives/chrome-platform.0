Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22CC1FCC
	for <chrome-platform@lists.linux.dev>; Tue, 13 Sep 2022 03:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6552EC433D6;
	Tue, 13 Sep 2022 03:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663038880;
	bh=8JC/B9JZUQhenRRvDd8NvsyFCs8a+rvxeJIV+37n1uc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CtZYL39qCjhggC/pWxPskSbkNP9uuCWLQsmbY86AyzgIQI1wSDl44In7gsYviKI7r
	 fXMFfAjRX3YuOLKlG6ALd4JKE/LS7+MRhxnQUcJvVWN1etoGDLdtNQIkqIHkA/j86O
	 9wykrI1aDhVGequLO2di0gvdT00AKSeniPcGvP9OP+C5gzZMBWmH5vdjgLVTkNKaZZ
	 mIg7q7MZKW19PwBK+wWxbqkIP+GtM1HgbI1qOLwc/KnIQASSAIn0/J5U2vwJuMFr5r
	 rOwkmu9+9SJ0QmFAK2P7EDDAEEpFmbk7KBIbZT7z2xtbkTCvxK9JGdMQLmlzXrp6zH
	 447bSZ6Wpje/w==
Date: Tue, 13 Sep 2022 11:14:37 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jameson Thies <jthies@google.com>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	pmalani@chromium.org, bleung@chromium.org, groeck@chromium.org
Subject: Re: [PATCH v2] platform/chrome: cros_ec: Notify the PM of wake
 events during resume
Message-ID: <Yx/1neGOF+0jsqvz@google.com>
References: <20220912224745.2716345-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220912224745.2716345-1-jthies@google.com>

On Mon, Sep 12, 2022 at 10:47:45PM +0000, Jameson Thies wrote:
> Update cros_ec_report_events_during_suspend to notify the PM of wake
> events during resume by calling pm_wakeup_event.

Could you add some more details about "why"?

> Signed-off-by: Jameson Thies <jthies@google.com>
> Reviewed-by: Prashant Malani <pmalani@chromium.org>

I didn't see where the R-b tag comes from which has been attached since
v1.  You shouldn't attach the tag even if the patch may have been
reviewed somewhere but not in the mailing list.
