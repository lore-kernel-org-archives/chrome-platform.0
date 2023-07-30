Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD03E15BD
	for <chrome-platform@lists.linux.dev>; Sun, 30 Jul 2023 11:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B37DDC433C8;
	Sun, 30 Jul 2023 11:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1690717150;
	bh=qMWIU+f5yjvvP0Z6YT5sLX6EstSebAQh9vRstxRwT24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gFcBX5MgCppgO2SzzMLDXtla6lHT9VxURUoMFbCIUzbQ3cQUhkO9pgTYYDmjpDa00
	 NoE7vR5gEJkpWu/8iHLE/UEGal6Fl2GnBIBaiBFqlho2Fy3OZSu1XpsNAa9pJwqLCK
	 mxP4JHL6ijpQNzySF/SsGEOdU50Osfn2PRspchAM=
Date: Sun, 30 Jul 2023 13:39:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH 01/22] Input: cros_ec_keyb - use device core to create
 driver-specific device attributes
Message-ID: <2023073050-syndrome-abreast-391f@gregkh>
References: <20230729005133.1095051-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230729005133.1095051-1-dmitry.torokhov@gmail.com>

On Fri, Jul 28, 2023 at 05:51:10PM -0700, Dmitry Torokhov wrote:
> Instead of creating driver-specific device attributes with
> devm_device_add_group() have device core do this by setting up dev_groups
> pointer in the driver structure.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/keyboard/cros_ec_keyb.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)

All of these look great, thanks for doing them:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

