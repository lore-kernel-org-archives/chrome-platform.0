Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736BB46B8
	for <chrome-platform@lists.linux.dev>; Wed, 18 May 2022 11:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F61DC385AA;
	Wed, 18 May 2022 11:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652873659;
	bh=L9LSlbkMeoTCZ5teJUzit5o/STvUaaZaTe1JmHGt9So=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FT5ZdUq4wO/dGHCQXxr/Z9ysXmdV2bS0aQ+fnv2b8GC7tNoPV+Xa66RBaJTOxgRmE
	 yhba7yzAR1+Cgn4BrRZkty9hP3/esmNAufSwGrR0JMB6PE9xxVLZb0fsZ5X2PeCiDa
	 EigoPlT4O0GPAuw7UnrbpKRr0q2Ul1Q4kdc3DriXizxlgTqsDej0+dSipZDesGnwY9
	 +xwM8HiJSCAEHdfBQC96H0fC9PcsQVSnbAN166hIx0IqGIMwKWEOlSJiSf097KOigt
	 HSOyF0ZYW2KD60f/rloxli92Pg90aa8Pzu30TIii/cBJlvsOmHDxv/MiySRe2fnfDx
	 sDQD21LvzBVbA==
Date: Wed, 18 May 2022 19:34:15 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	dianders@chromium.org
Subject: Re: [PATCH] platform/chrome: cros_ec_proto: update
 cros_ec_check_result() comment
Message-ID: <YoTZt+7rHC+HMIip@google.com>
References: <20220517082817.1591526-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517082817.1591526-1-tzungbi@kernel.org>

On Tue, May 17, 2022 at 04:28:17PM +0800, Tzung-Bi Shih wrote:
> At first glance, cros_ec_check_result() is quite like cros_ec_map_error().
> They check for `ec_msg->result` and return corresponding errors.  However,
> as calling from `pkt_xfer` and `cmd_xfer`, cros_ec_check_result() should
> not report furthermore errors.  -EAGAIN is the only exception.
> 
> See [1][2][3] for some known userland programs' code.  The return code
> from ioctl only denotes the EC communication status.  Userland programs
> would further analyze the `result` in struct cros_ec_command* for
> follow-up actions (e.g. [4]).
> 
> To clarify, update the function comment.

Pardon me if it is confusing.  The patch now merged into a series in order to
make more sense.  Let's ignore the patch and move discussion to [5] if any.

[5]: https://patchwork.kernel.org/project/chrome-platform/patch/20220518091814.2028579-4-tzungbi@kernel.org/
