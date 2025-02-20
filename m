Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1811F151B
	for <chrome-platform@lists.linux.dev>; Thu, 20 Feb 2025 09:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740044894; cv=none; b=mLH2MwQmXOG9zIJP5264Kx9595Yy13jD1sAKkwz7g0Bn/CLtaOIgBqtSM7GCvTydf9HiYZKsXDWPPLMOKItRvwTYd9rQqBWrUmuplIgNiCar0p/c9W38nT6sE5OcmX71WW5fnYFQqqDablzbdFf0hxqHRifgKbcDc/BhwJZ8Pto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740044894; c=relaxed/simple;
	bh=fn+x7hQpkWHUgoK4Xm5vM3HNl25OuzoXgrarP1Ztd04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DrAt5YBxbebhmnsQo1R7dLyJj3p2fmFynfXHgLk0Q3+e6gGThqAazjKnHfl1/n7ExaFrL2ViP1SeeNK2eL0sV//EmsdlqCkj3GIPY8tkfw+v+zXA/DJLTZItR1n83tLY6VJZYr0iLmNq/5qwdQ8Zock2+6K9tGRi3yIMpWnZXTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fOZv/wX+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fOZv/wX+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7630C4CEE3;
	Thu, 20 Feb 2025 09:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740044893;
	bh=fn+x7hQpkWHUgoK4Xm5vM3HNl25OuzoXgrarP1Ztd04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fOZv/wX+fw7r9lk4+UFEjKmPdqrBM4U6ZQS7taG81FQ+z2rptW2bgDpBdfhF1UrYx
	 41MvK/5u8mQwwD1lxigir4jDbxCujQlYXz9zI0kj7EG951cCVpVW95NXgF7KlmmSnr
	 tPbnEn7PE/YIVguLk6EHVm8J/iNEE10nV6p1U8Mm6oWh9aeRf1iXhCPEt4pmkMBCae
	 ziQvQLIlVY18Ppw/HDp6/UA8cRLsb0TFFMl68S8sVkzMBNItjQ8GMmrhtAg78dIE1h
	 Z1zq/GJRTtcU5Cxog4B4nSC8L3J9R8eHeBiX/erQ9+2W3Zut0pAZxRCU3QRqfOqPmy
	 S5lXS9ux9AR1g==
Date: Thu, 20 Feb 2025 09:48:10 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Daniel Schaefer <dhs@frame.work>
Cc: chrome-platform@lists.linux.dev, Benson Leung <bleung@chromium.org>,
	"Dustin L . Howett" <dustin@howett.net>, linux@frame.work
Subject: Re: [PATCH] platform/chrome: cros_usbpd_logger: fail probe if HC not
 supported
Message-ID: <Z7b6Wg-Ui2p_bnCO@google.com>
References: <20250220023441.158615-1-dhs@frame.work>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220023441.158615-1-dhs@frame.work>

On Thu, Feb 20, 2025 at 10:34:41AM +0800, Daniel Schaefer wrote:
> If the EC_CMD_PD_GET_LOG_ENTRY does not exist, the driver does not need
> to stay active.
> 
> Framework Computer systems don't use the PD infrastructure in the chrome
> EC firmware, so it does not support this host command.

Does the firmware still report `EC_FEATURE_USB_PD` feature [1]?  Similarly,
do "cros-charge-control" and "cros-usbpd-charger" need to stay active [2]?

[1]: https://elixir.bootlin.com/linux/v6.13/source/drivers/mfd/cros_ec_dev.c#L263
[2]: https://elixir.bootlin.com/linux/v6.13/source/drivers/mfd/cros_ec_dev.c#L89
