Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534291FB2
	for <chrome-platform@lists.linux.dev>; Tue, 17 Jan 2023 08:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D2FAC433EF;
	Tue, 17 Jan 2023 08:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673943164;
	bh=AEgSQRQF3beX/Txu8GD7t68PN6lGSaTwol9ZRCqQCSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nizUvPta5T0ptW/NLb5dPL8U9MQBcvw+96Aj5EVO1pgNXxGDk3at4BhuoFbdkHf3Z
	 XVUclDJVJPTzVRXsY04qRjBVnmOHNTKkSyrUNdVIknV98p7x3TFcaVxoDVr4PU4VfT
	 F+ED1ZOEwMkPJq8YFlTRgdwoiAwbFm4TP3yH/v2c6wObcuWDY6tCuBadBv15O4aHbt
	 9AYhWBJ0T8OpPeJrVnqNl3SqVKr1Y9XUax2FvBS0lrbvnmfOgIdq8WNmCk09nTHyto
	 +RXmLWXY3ga4MMHH+03UdyKtBhUyvRdbZSqAtJkls1HU22fM75tx5abJzSfihbptP1
	 Oo3wNvYfKfo0A==
Date: Tue, 17 Jan 2023 16:12:40 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org, groeck@chromium.org
Cc: chrome-platform@lists.linux.dev, markhas@chromium.org,
	bhanumaiya@chromium.org, error27@gmail.com
Subject: Re: [PATCH] platform/chrome: cros_ec_uart: fix negative type
 promoted to high
Message-ID: <Y8ZYeIev6SR2vMs6@google.com>
References: <20230109081554.3792547-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109081554.3792547-1-tzungbi@kernel.org>

On Mon, Jan 09, 2023 at 04:15:54PM +0800, Tzung-Bi Shih wrote:
> serdev_device_write_buf() returns negative numbers on errors.  When
> the return value compares to unsigned integer `len`, it promotes to
> quite large positive number.
> 
> Fix it.
> 
> Fixes: 04a8bdd135cc ("platform/chrome: cros_ec_uart: Add transport layer")
> Reported-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> Reported in https://lore.kernel.org/chrome-platform/Y7fhw4S7Tb0GcHMF@kili/T/#u.
> 
>  drivers/platform/chrome/cros_ec_uart.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/chrome/cros_ec_uart.c b/drivers/platform/chrome/cros_ec_uart.c
> index 6916069f1599..788246559bbb 100644
> --- a/drivers/platform/chrome/cros_ec_uart.c
> +++ b/drivers/platform/chrome/cros_ec_uart.c
> @@ -149,9 +149,10 @@ static int cros_ec_uart_pkt_xfer(struct cros_ec_device *ec_dev,
>  	resp->status = 0;
>  
>  	ret = serdev_device_write_buf(serdev, ec_dev->dout, len);
> -	if (ret < len) {
> +	if (ret < 0 || ret < len) {
>  		dev_err(ec_dev->dev, "Unable to write data\n");
> -		ret = -EIO;
> +		if (ret >= 0)
> +			ret = -EIO;
>  		goto exit;
>  	}

Does this patch make sense to someone in the mailing list?
