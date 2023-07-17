Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EB315B4
	for <chrome-platform@lists.linux.dev>; Mon, 17 Jul 2023 03:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 970EAC433C7;
	Mon, 17 Jul 2023 03:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689565817;
	bh=gXfYH7V2kM1Y538mSmiEnBw9D2Olq+4SnpNIVM3FhNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tDuYNli+lCUffUuvmVeq+JucDtgYy9hvhCBF5b7KYRdTGh4g03kmMB5x3XS6Jkrp2
	 5193jfvFuoerRJqNPNV0+Wvlc5aOEsdXA0dGWiQZ0LaHTOH97QdbksGKpKlCTO/n0o
	 O/WENGr6HGKjhW54yM+rWQRRd0Y6QzBCetlyD/jbsEfD2i72LLfMtPUwE3NXwABQJp
	 jfRN7MZF6DySzTLq01L55Rt38hTGImMgCWXvGtYwU5bO61VAgHfqTG6sz+QEZ5OcAa
	 AYTM2u6RQlfQFgNTZssR3v2nYb7PM9ER+Ige0FH/qUgOTPi53n87PuoyPSuTRAoSNp
	 0B+dQxPNQNwYA==
Date: Mon, 17 Jul 2023 11:50:13 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Vadim Pasternak <vadimp@nvidia.com>, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform: Explicitly include correct DT includes
Message-ID: <ZLS6dchiyqFQlRwJ@google.com>
References: <20230714174909.4062739-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230714174909.4062739-1-robh@kernel.org>

On Fri, Jul 14, 2023 at 11:49:09AM -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

For cros_ec:
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

The driver uses platform_device_unregister() which is in platform_device.h.

> diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
> index 8b7949220382..5d36fbc75e1b 100644
> --- a/drivers/platform/chrome/cros_ec.c
> +++ b/drivers/platform/chrome/cros_ec.c
> @@ -12,6 +12,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/slab.h>

nit: if we want to maintain the sort, "platform_device" should come after
"platform_data".
