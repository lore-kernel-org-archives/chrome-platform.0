Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ED77F6
	for <chrome-platform@lists.linux.dev>; Thu,  4 Aug 2022 08:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FDF1C433C1;
	Thu,  4 Aug 2022 08:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659601328;
	bh=KLpRf8GWODIrXa1KLD+EWJqERcB8DPQYRo2/5i5npqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H0w1ZjDVk1uwds7LK50xsibM0QoIS44ocB+lWbdXS+t41QrHuSmBZszMb/9/wZCTq
	 dlKIEXlcGMqDDmA5x5zDFicOOBbWSfYTKZjlKPCK3y14OzRf9tCx1EJU4/h/mjEUtj
	 cGzvnuvBZlorA7oa//m+yGzdNidiyvm4XP5D0qViuvSikmbHNFiOGmSDdAIh/nItpB
	 eTNwtlsd95jU+EzUpbL6YlsjkXFTfD0XqifF5ap/YQPUQ9XJM/rWuhORaN2uF7qRDP
	 O+I3W1ABLRZ4YjuGwUIOM5F9PhtCdmMxqbEsZPXM12CQXZDr8Zyz9CNyXZ5F92pNG1
	 eeUIjcPLYgC0w==
Date: Thu, 4 Aug 2022 08:22:05 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jack Rosenthal <jrosenth@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	Stephen Boyd <swboyd@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6] firmware: google: Implement cbmem in sysfs driver
Message-ID: <YuuBrUmiRYoaSmPw@google.com>
References: <CAODwPW-eQ-dYvfCGZ13tOzh4gPdLU9ZoFg9joWpRTX22OXa4Ow@mail.gmail.com>
 <20220802140343.3468976-1-jrosenth@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220802140343.3468976-1-jrosenth@chromium.org>

On Tue, Aug 02, 2022 at 07:03:43AM -0700, Jack Rosenthal wrote:
> cbmem entries can be read from coreboot table
> 0x31 (LB_TAG_CBMEM_ENTRY).  This commit exports access to cbmem
> entries in sysfs under /sys/firmware/coreboot/cbmem-*.
> 
> Link: https://issuetracker.google.com/239604743

I doubt if the Link tag would be useful for public.

[...]

> Reported-by: kernel test robot <lkp@intel.com>

Suggest to drop the Reported-by tag even if the robot reported some compile
errors during the development.  Given that the patch isn't a fixup but
supporting something new (which isn't "reported by" the robot).
