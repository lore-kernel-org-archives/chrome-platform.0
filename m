Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914A1D519
	for <chrome-platform@lists.linux.dev>; Wed, 11 Oct 2023 05:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QdE3Q/Az"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEAE3C433C7;
	Wed, 11 Oct 2023 05:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697002151;
	bh=sPvzHxpER/7iDR7K8Wx0Kr1mtX2aUQLvC6abzIyMiCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QdE3Q/AzvoNvM3Oh3Fo189sikdxmt4b6cei5LFFCG4RZeQhnjEtZAxjTXJv/LQhXk
	 Aj/jj6DRohPogHxAz8089K2pGL6u+tjiHNElPAnNuZT80oyv1DXs6c0LuijERF+0TS
	 kMFYDPf/8WrUh8PTyihHAAOepBe1k1y99immaRtSxnEEJ6Ytpz/iWVh82Cqfm/HMYF
	 u+2rL0+IpcNJWSVi0EX0+KAVCXFVIk5fOLBnsJJU20gbjdt/FZwfrJ6BI1p0fDbfh/
	 qBdDltWKJZd0ckCwCAmP0Y4Waauwikl4V3Aci8BqtHY4cZMxuiJbHRg/3FKGdeLArJ
	 xc7egwV0kz6OQ==
Date: Wed, 11 Oct 2023 13:29:08 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: "Dustin L. Howett" <dustin@howett.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, Kieran Levin <ktl@frame.work>,
	Mario Limonciello <Mario.Limonciello@amd.com>
Subject: Re: [PATCH v1 0/4] cros_ec: add support for newer versions of the
 Framework Laptop
Message-ID: <ZSYypHZiRXo7qK5_@google.com>
References: <20231005160701.19987-1-dustin@howett.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005160701.19987-1-dustin@howett.net>

On Thu, Oct 05, 2023 at 11:06:57AM -0500, Dustin L. Howett wrote:
> However, those devices move the MMIO region for EC memory from the original
> Chrome EC port range of 0x900-0x9FF to 0xE00-0xEFF. In addition, the ACPI node
> for the EC device on these laptops indicates an I/O resource spanning 0x800 to
> 0x8FE when in truth, the device supports communication all the way through
> 0x8FF. 

I don't understand the description about 0x8FF.  From patches in the series,
it looks like 0x8FF is unused if CROS_EC_LPC_QUIRK_SHORT_HOSTCMD_RESERVATION.

> Dustin L. Howett (4):
>   cros_ec_lpc: introduce lpc_driver_data, a priv struct for the lpc
>     device
>   cros_ec_lpc: pass driver_data from DMI down to the device
>   cros_ec_lpc: add a quirks system, and propagate quirks from DMI
>   cros_ec_lpc: add quirks for the Framework Laptop

The series should prefix with "platform/chrome: cros_ec_lpc".
