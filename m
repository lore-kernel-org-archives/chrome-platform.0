Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C9F7E2
	for <chrome-platform@lists.linux.dev>; Tue, 25 Oct 2022 01:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8800C433D6;
	Tue, 25 Oct 2022 01:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666662014;
	bh=gkrqEzZjX+JO3SWqKnfGYcSo7apaLNgUd7x3orRf+38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lMUJb+pILZBcocldnW+V++nTnRR18GCbdAoOEg2/zweh+aKkfYyuw9WK/rvmNXmTR
	 xGOe0KBG2sgPaSV0+Q/37tuLg6ndluXgVUcUjPMog+RrCDL1ITXxvS5pcamuyo4H4a
	 F8mNMEw3C6bh1lYosnM3eibI3c6LGPzJr+G/wdTWhIPsrE+mxPguNA6W084yzmkQVv
	 w3cWIuj2+jnsZVoEvj2KwBrG5eD12IOBtgIZBu7wP3aAqQyGeXqBwjvEclg2OykC6S
	 Nwl3zDXMFzy5oU0Go5i5Im2BsKTCpxaXxF4II2io735qk9tSYcFxL6uOnOU8T8WCpe
	 Erw3BnsOau5lg==
Date: Tue, 25 Oct 2022 09:40:10 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Brian Norris <briannorris@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julius Werner <jwerner@chromium.org>,
	chrome-platform@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] MAINTAINERS: Add drivers/firmware/google/ entry
Message-ID: <Y1c+eheUMjiG/fqh@google.com>
References: <20221021172624.1.I119456791d197eb7d159f09e7479d8759008a954@changeid>
 <Y1NlwY+RnKth++bW@google.com>
 <Y1bCNs76nTGWcS3l@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1bCNs76nTGWcS3l@google.com>

On Mon, Oct 24, 2022 at 09:49:58AM -0700, Brian Norris wrote:
> On Sat, Oct 22, 2022 at 11:38:41AM +0800, Tzung-Bi Shih wrote:
> > On Fri, Oct 21, 2022 at 05:26:47PM -0700, Brian Norris wrote:
> > > +GOOGLE FIRMWARE DRIVERS
> > > +M:	Tzung-Bi Shih <tzungbi@google.com>
> > 
> > Please use <tzungbi@kernel.org>.  I prefer to use it for Linux community.
> 
> OK! I was just imitating your existing entry for CHROMEOS EC CODEC
> DRIVER, which lists google.com email. So you might want to fix that one
> if you want people mailing @kernel.org.

Thanks, I forgot to update that one.  I'll fix it.

> I'll assume you will fix that when applying. I can send a v2 if someone
> else plans to commit it.

Ack, I'll fix it when queuing this.
