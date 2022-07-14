Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE2117C2
	for <chrome-platform@lists.linux.dev>; Thu, 14 Jul 2022 03:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5130DC341C6;
	Thu, 14 Jul 2022 03:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657770116;
	bh=eT9omIn4kKWdfUlUaQXR2a5ggi02sLElztkOMF5CfQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U/svTuRMpeD2b+EYgWTK+toxwaKs0RsuIEf9qV2MoOBLZ/7VAyvqp1VtLYuN4R0AS
	 lwWJG/YbXw9Ua9SdDXGGdp3zoDLqcrQJc8iOKQrw8h/azhSceACMEYuPLp5JiD1Y4M
	 LbXH1PSugsDaiVbzinTvkOLa8xUFDMcD+muezCvBvh7Yb17OUHwefVBZDsWTiGZl/f
	 mjN9oVONMzJoX8cPSC8J5CPO6ykjVz5ux/ROH8ihl86H4VwBeFpmwMROBqJ1vHXz6G
	 K1JrrTXqeuG6CT8iuqeYlbemy0Z1FKJtAU4ZuomIgA7s0rZ3OG+24B7rHhNta7rJB1
	 FBsHX5OZN9S6A==
Date: Thu, 14 Jul 2022 03:41:53 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <groeck@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH 09/11] platform/chrome: cros_ec_proto: return
 standard error codes for EC errors
Message-ID: <Ys+Qga+5B0150BwY@google.com>
References: <20220628024913.1755292-1-tzungbi@kernel.org>
 <20220628024913.1755292-10-tzungbi@kernel.org>
 <CABXOdTeCFsXYdd6uVDYkOY-tGno_wW-ZyuMb44a63tFABic+NA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABXOdTeCFsXYdd6uVDYkOY-tGno_wW-ZyuMb44a63tFABic+NA@mail.gmail.com>

On Wed, Jul 13, 2022 at 11:23:58AM -0700, Guenter Roeck wrote:
> On Mon, Jun 27, 2022 at 7:49 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > cros_ec_wait_until_complete() checks `msg->result` for
> > EC_CMD_GET_COMMS_STATUS.  However, it doesn't return standard error codes
> > like most of others.
> 
> The callers of cros_ec_send_command() do the mapping. I am not sure if
> it is a good idea to change that; it may have undesired side effects
> (such as changing the userspace ABI) for callers of
> cros_ec_send_command() not expecting this change. It would also result
> in double mapping in some situations.

Agreed.  Let's drop the change.
