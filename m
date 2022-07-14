Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB4F4A19
	for <chrome-platform@lists.linux.dev>; Thu, 14 Jul 2022 14:15:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F0D4C34115;
	Thu, 14 Jul 2022 14:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657808121;
	bh=qBmZXjqke+b5VZ+6GVDTR3FwyHeU/2fCZ+RRGekqLDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GEDiYXYP9asqFucy4QU2HoBridNPfm2W1ZdfWxhLEfe4bOmpd9AAwoNgiWWWzGjcb
	 wjhjnM8r5dEYw6UXFu3YPHaAQyFe9BKWmOYC4BFL6Xr1hVElcSD1ZXbHmDJVsjJd2p
	 2ZTL1TDTdC1Zfqu1Yf8VH/pB5tOwjyqsqbC5KV3U=
Date: Thu, 14 Jul 2022 16:14:10 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev, bleung@chromium.org,
	heikki.krogerus@linux.intel.com,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v4 0/9] Type-C switch driver and Type-C framework updates
Message-ID: <YtAksiKCuRZXs3fC@kroah.com>
References: <20220711072333.2064341-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220711072333.2064341-1-pmalani@chromium.org>

On Mon, Jul 11, 2022 at 07:22:54AM +0000, Prashant Malani wrote:
> This series introduces a retimer class to the USB Type-C framework,
> It also introduces a Chrome EC (Embedded Controller) switch driver which
> registers the aforementioned retimer switches as well as mode-switches.
> 
> Patch 1 and 2 introduce the retimer class and associated functions to
> the Type-C common code.
> 
> Patches 3-7 add the cros-typec-switch driver.
> 
> Patches 8-9 update cros-ec-typec to get and use retimer switch handles.
> 
> Submission suggestion (as always, open to better suggestions):
> - Patch 1 and 2 can go through the USB repo.

Patches 1 and 2 now in my tree.

thanks,

greg k-h
