Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAB5198
	for <chrome-platform@lists.linux.dev>; Thu, 14 Jul 2022 02:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B594C3411E;
	Thu, 14 Jul 2022 02:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657765378;
	bh=ItcGA7/dhxXIJq7TylmxzfE+dFvsuHcRuQOMvhzSjto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n/9/io+1zJwADGP14tDvnzZsbia2PEvU5OUMCF/j5g+TAapI8JnkPuKQZwO8NGOgk
	 lPn4fc7hY6HQjwlz2YdBbq1zuuXaC0Wd9wxOpej7aRgRRZ6dg56KR+42bVDS/naThM
	 yy9WMQ4cE/yftvcVpduyOxXiLYLVYCLW5diRIIj9pt9KYdU2eSxsmE7aQbS8lxuEWR
	 Np7R1/kvH/WdwXqSDuPk3PSnrMH5eCdiIfUUyqP/hzGXk7cDQV1tXFpLav81yf7NHe
	 o4X9xTPBunZ3iP0l+SjyI4lyp302s07xNlw/hOumkzZELdWiQJlaH03y1KPT/HEHWw
	 5SOp7JrSO7N4A==
Date: Thu, 14 Jul 2022 02:22:54 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Tim Van Patten <timvp@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, rrangel@chromium.org,
	robbarnes@google.com, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2] platform/chrome: cros_ec: Send host event for
 prepare/complete
Message-ID: <Ys99/jJW8hzXOqg1@google.com>
References: <20220706205136.v2.1.Ic7a7c81f880ab31533652e0928aa6e687bb268b5@changeid>
 <Ys40uw4QIe4fQKA/@google.com>
 <CANkg5eyehcECGeDHBEsxR=iOoyMwzkcpvX+oRxy7PJPYLD=VuQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANkg5eyehcECGeDHBEsxR=iOoyMwzkcpvX+oRxy7PJPYLD=VuQ@mail.gmail.com>

On Wed, Jul 13, 2022 at 12:05:14PM -0600, Tim Van Patten wrote:
> This patch changes *when* the EC outputs the host command that indicates
> the AP is starting suspend and finishing resume, due to the change (in this
> patch) when the AP sends that host command.   This makes the EC's logs more
> accurate when correlating them with the AP's logs in regards to when
> suspend is started and resume is completed.   Previously, those events were
> sent when suspend/resume were already in progress.

I see.

> We'd also like to keep the new logs emitted by the AP to make it clearer
> when the AP is starting suspend and completing resume, so we can correlate
> it with the EC logs more easily.   This should aid debugging and timing
> analysis.   Since it only occurs during suspend/resume, it shouldn't flood
> the logs and follows the logging of other driver PM functions.
> 
> I didn't see concerns in [1] have been addressed.
> 
> 
> I replied to the first email stating why we want to keep the log message
> (and reiterated it above).   What's the correct process to indicate we
> don't want to make the change requested in [1]?

I didn't see the message in the v1 thread[2].  What did you mean by
"first email"?  Checked my mbox but got nothing.

Also, I found the message didn't show in [3].  I'm not sure what happened
but perhaps you should use plain text next time (see [4])?

[2]: https://patchwork.kernel.org/project/chrome-platform/patch/20220701095421.1.I78ded92e416b55de31975686d34b2058d4761c07@changeid/
[3]: https://patchwork.kernel.org/project/chrome-platform/patch/20220706205136.v2.1.Ic7a7c81f880ab31533652e0928aa6e687bb268b5@changeid/
[4]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#no-mime-no-links-no-compression-no-attachments-just-plain-text
