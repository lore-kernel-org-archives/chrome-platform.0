Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984F5621
	for <chrome-platform@lists.linux.dev>; Thu,  8 Dec 2022 02:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A72C433C1;
	Thu,  8 Dec 2022 02:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670464900;
	bh=N38wXucF+hF5PyocURbX3I6VBx7GbBgyGw4H55pF/kI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KQVAbKnZciV0/8X+Scesz7mDBs3Am3DVWFJa8YNKi8FdiCLseuQizXAeiWuXDH4g9
	 EBo/d1Fa2ZnIAVw4OJvLu8NJ5MajQ5cPLaNhLbE5cl8ppcpVJVeg7fkmjwD5v4M7as
	 +6mMk3t8HeJW1niyvGSeui6Q5fjwXDJADVOeERgUcMT72Ac0TKAIetDSAGZEoGJgle
	 kliBIhOleVnV1kKdxFrT/rwmngevG9lgvQmZbA9+K1qinol+6c8KKz3BSLyqxQZjYm
	 jj7RLiBrTExT29ZekVHhIv8rM+VxtomKcsfotbSZ+PdO2r8bQJJWqP+nI/s8fuP0t+
	 PjwgSHt57coDQ==
Date: Thu, 8 Dec 2022 10:01:35 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Prashant Malani <pmalani@chromium.org>
Cc: Victor Ding <victording@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev, groeck@chromium.org,
	dustin@howett.net, gustavoars@kernel.org,
	gregkh@linuxfoundation.org, sebastian.reichel@collabora.com,
	dnojiri@chromium.org, lee.jones@linaro.org, bleung@chromium.org,
	tinghan.shen@mediatek.com,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v2] platform/chrome: cros_ec_typec: zero out stale
 pointers
Message-ID: <Y5FFf+VjViglELbZ@google.com>
References: <20221207093924.v2.1.I1864b6a7ee98824118b93677868d22d3750f439b@changeid>
 <Y5EZmSSbOFRpfBNj@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5EZmSSbOFRpfBNj@chromium.org>

On Wed, Dec 07, 2022 at 10:54:17PM +0000, Prashant Malani wrote:
> On Dec 07 09:39, Victor Ding wrote:
> > `cros_typec_get_switch_handles` allocates four pointers when obtaining
> > type-c switch handles. These pointers are all freed if failing to obtain
> > any of them; therefore, pointers in `port` become stale. The stale
> > pointers eventually cause use-after-free or double free in later code
> > paths. Zeroing out all pointer fields after freeing to eliminate these
> > stale pointers.
> > 
> > Fixes: f28adb41dab4 ("platform/chrome: cros_ec_typec: Register Type C switches")
> > Fixes: 1a8912caba02 ("platform/chrome: cros_ec_typec: Get retimer handle")
> > Signed-off-by: Victor Ding <victording@chromium.org>
> Acked-by: Prashant Malani <pmalani@chromium.org>
> 
> Hey Tzung-Bi, it looks like you've already created a tag for the
> v6.2 pull request, so I don't know if it's too late to apply this
> for the current dev cycle.
> So, I've not applied it, but have left the Acked-by tag.
> 
> Please feel free to apply it if there's still room for it before
> you send out the pull request.

Given that the patch fixes an use-after-free, let's include this in the
coming merge window.  Have queued.
