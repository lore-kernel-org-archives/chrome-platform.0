Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D3B4411
	for <chrome-platform@lists.linux.dev>; Thu, 21 Sep 2023 03:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35328C433C7;
	Thu, 21 Sep 2023 03:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695266501;
	bh=rx0lV0XY3QhgXMp4TLjOqLDqdJJaH8x9Ozj9/UaXFd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m/w0/nMsnVgiNFiD0PwSWGXuKFooA/+XFlEuszfnBoM1hSUqWc2ALpw964SEwX7Up
	 Rw5VfCYrVdQi6mvp3+Erngo5hYccLoiVgl+zusIfgCSUnuZqK5OKv9ZKntBXq6V8HE
	 SxfG0v5N0Z4zpzBzfKG/hpfSdJcp6Bx+S/MlhdaRQ4WZ4Loz8elvrEPG4IAdKSevDY
	 r9wjCDWDCm+CdaTBZ4XwHDAk279Ej34DaqdwoFYJoZwKPmvvVZcQuxk0FR/bWPchOa
	 KNQ8aO76dC0bRrEUyqPlW/nfbI/rTaOaZnkXBch4ZfFmI8JvMtsrXYKLf9wj5vDCaJ
	 wLx0dD0jBDBJQ==
Date: Thu, 21 Sep 2023 11:21:38 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	joewu =?utf-8?B?KOWQs+S7suaMryk=?= <joewu@msi.com>,
	linux-input@vger.kernel.org, chrome-platform@lists.linux.dev,
	kernel@pengutronix.de
Subject: Re: [PATCH 02/52] input: cros_ec_keyb - Convert to platform remove
 callback returning void
Message-ID: <ZQu2wtdyGtIl472x@google.com>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
 <20230920125829.1478827-3-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230920125829.1478827-3-u.kleine-koenig@pengutronix.de>

On Wed, Sep 20, 2023 at 02:57:39PM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
