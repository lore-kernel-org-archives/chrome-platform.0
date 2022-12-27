Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D0AA56
	for <chrome-platform@lists.linux.dev>; Tue, 27 Dec 2022 10:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 816A1C433EF;
	Tue, 27 Dec 2022 10:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672136174;
	bh=+q5W7WleDYVMITIm3acgRbVrF2RJrwwLXdEOds9e0AQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hQ+AdUpimcuOwZDw5/w1Iiaz2eVYaNWYpkwbd2UIdYR2q1VdB/8U/jn/YEJPewZUU
	 ngKOo4s/x5kGHNBH/gyR5dYNsVpNgZ5XFXoy3IhTnwu9sqRiYw6il4V5ACotrgctsk
	 LkMwRON9hcQVR8TgXe4F96ej2RjVZ8mpg3jBtuf29yZNX18DpBK6Ue3agaN2Q02XM/
	 ZqIa7TtTyv6BndzPegIHzLcJHKGMo9Ieox6bDgx+Thc1j86n1EZHq5FtWB1CB9Dk1b
	 +8TjouRcomvej6UPWBbgS/u9BdTQyuxl7GaxFWPAolxN/CmzbWou7/f6WamOf1hKeu
	 F1tOfDkNED+ww==
Date: Tue, 27 Dec 2022 18:16:11 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Mark Hasemeyer <markhas@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Raul Rangel <rrangel@chromium.org>,
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
	kernel test robot <lkp@intel.com>,
	Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v12 1/3] platform/chrome: cros_ec_uart: Add cros-ec-uart
 transport layer
Message-ID: <Y6rF63MClDySamGs@google.com>
References: <20221209092619.v12.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221209092619.v12.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>

On Fri, Dec 09, 2022 at 09:26:22AM -0700, Mark Hasemeyer wrote:
[...]
> Reported-by: kernel test robot <lkp@intel.com>

Missed 1 comment from previous email.  Please drop the tag as this patch
isn't a fix.  The robot didn't report to add "cros-ec-uart".

One comment for the title "platform/chrome: cros_ec_uart: Add cros-ec-uart
transport layer".  I think you could drop "cros-ec-uart" as the information
is duplicated.
