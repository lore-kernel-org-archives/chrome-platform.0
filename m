Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE8064B
	for <chrome-platform@lists.linux.dev>; Fri, 21 Jul 2023 06:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D87C433C8;
	Fri, 21 Jul 2023 06:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689921548;
	bh=pPac8yPWmSjpPBsh2tgc9lsmk3v6K1eiIR2YrRDKCmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pIzdtq4z4rxbfnpL5U/XnFx1v7IJsNaG7Hw8Ha1yG2Lzvs4UdfQ2+p4A7bL/19nW3
	 vxZMBu7Ql4pxAt1lvhGu7vMu+2qHp6lvqPs5PdLRPu6nRC0h2IwUAa3DaEytV5IcKf
	 R8Bc7RtmqkdGcM4eRNoj9nxyaHPO90kPJ8miKTnBnTw+nhTmYzaGQuIkVQZvezBlCv
	 aF5drmXgGboVEsIfIuCCrexGm9W71CRtg9R1T5zCtjFi929ZjARL+9LAHD921jMpIC
	 RKAiL6hlVVAIse1xoXYG/XC8pEhfLGKS7+BkmyveacjxyZEAjBzlbwgK0txcnR58Ta
	 Y9PT4ef7tTbPg==
Date: Fri, 21 Jul 2023 14:39:05 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Alicja Michalska <ahplka19@gmail.com>
Cc: linux-kernel@vger.kernel.org, robbarnes@google.com,
	lalithkraj@google.com, rrangel@chromium.org, bleung@chromium.org,
	groeck@chromium.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: Add DMI definition for
 post-Skylake machines running custom Coreboot builds
Message-ID: <ZLooCXV11JCdWOdK@google.com>
References: <ZLm3G5G6/gmLZwkn@tora>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZLm3G5G6/gmLZwkn@tora>

On Fri, Jul 21, 2023 at 12:37:15AM +0200, Alicja Michalska wrote:
> ChromeOS EC LPC lacks DMI match for newer machines, which
> use "Google" DMI_SYS_VENDOR as opposed to "GOOGLE" in older models.

I'm confused about the sentence as it looks irrelevant to the patch.

> This patch adds DMI definition for MrChomebox's custom Coreboots builds,
> which we (Chrultrabook Project) are using.

s/This patch adds/Add/.  Search "imperative mood" in [1].

Looks like a typo: s/MrChomebox/MrChromebox/.

If you get chance to send next version, please shorten the commit title.
I guess "platform/chrome: cros_ec_lpc: Add DMI match for MrChromebox" should
be quite explicit.

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html

> +	/* DMI doesn't match modern machines running custom firmware */

Remove the line.

> +	{
> +		/* MrChromebox's firmware */
> +		.matches = {
> +			DMI_MATCH(DMI_BIOS_VENDOR, "coreboot"),
> +			DMI_MATCH(DMI_BIOS_VERSION, "MrChromebox-"),
> +		},
> +	},

Put the block after "A small number of non-Chromebook/box machines also use
the ChromeOS EC"[2].

[2]: https://elixir.bootlin.com/linux/v6.4/source/drivers/platform/chrome/cros_ec_lpc.c#L533
