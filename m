Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D817B
	for <chrome-platform@lists.linux.dev>; Sat, 22 Oct 2022 03:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A41C433C1;
	Sat, 22 Oct 2022 03:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666409924;
	bh=QHhBqOVsoir8NrYGC8i2Ktuc/XQbzsVjDpeGNuvAGk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k5zV7G9AB30cJvxK8l0HnAxAL0QOikInNMe2zPdEQhX4Ku4JzFp6udbda4i+HETLe
	 wSMOktGxa0vZB7Q4XtO/PapaRcpAcypRLQqHtdVIuNRr4UdXz2KyxlcdC2xq1XhGkj
	 HlySsdbBfuwGudxppY4R6gStQSMVwIr676hHzBAzHj9Ak3HITWP/Fg5miyfPasL/HA
	 yiv8p+eHP2TR7yl3b057RkICbOM5J1AwtApCRi+HFbdmEnTWDIS6StrXEP+fg/IMjl
	 P+vb13OiSeXv8VQGvu0nijPKoCwF6uhYOg3DavXOmnnH/eQRcbHaeUNmU3O/e1j0Ql
	 InMYO8CXsZasg==
Date: Sat, 22 Oct 2022 11:38:41 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Brian Norris <briannorris@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julius Werner <jwerner@chromium.org>,
	chrome-platform@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] MAINTAINERS: Add drivers/firmware/google/ entry
Message-ID: <Y1NlwY+RnKth++bW@google.com>
References: <20221021172624.1.I119456791d197eb7d159f09e7479d8759008a954@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021172624.1.I119456791d197eb7d159f09e7479d8759008a954@changeid>

On Fri, Oct 21, 2022 at 05:26:47PM -0700, Brian Norris wrote:
> Per this conversation:
> https://lore.kernel.org/lkml/af9c4bfd-d3fb-1c7a-fb38-0d8bbd507449@roeck-us.net/
> Re: [PATCH] firmware: coreboot: Register bus in module init
> 
> I guess if this is fine with folks, Tzung-Bi might queue this up?

Ack, I can queue both if this is fine with folks.

> +GOOGLE FIRMWARE DRIVERS
> +M:	Tzung-Bi Shih <tzungbi@google.com>

Please use <tzungbi@kernel.org>.  I prefer to use it for Linux community.
