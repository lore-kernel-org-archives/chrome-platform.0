Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3D21DF74F;
	Fri, 30 Jan 2026 03:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769743619; cv=none; b=H2MwPUtNzovcMEli+8jqrrJQrNMBP7coNoNR1bNGOQGlj/JTC/HA32+Krahqz5LTGcut1MUuUPyHlmNQR8E6GjDjNsdm6dj004KetwVYWy2Th3bbkHTNaBXNlaQD5VCskaJXYrpyzTRmyDyTUUArUvFg92Vui+FI9AfbATI5ieQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769743619; c=relaxed/simple;
	bh=xSUD5ZCNJ4zuPw4QXBqNcX8VkKnd9/Qvr8VoEPT+h2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ku3DcafHOoDUX1CgrNiOuotNy6ypvFwx5+ZyS1rZLzreLyq9GuEgQxzOf6hB2ZQLVA0OzpMOyxrQ5Q5+0xmYxcfFajo//aSBJJ36QxeWp9FpcMJeOMPoHSRDuRUCLdtJz/bKOon/3Iyw8aCE4EmKOkCPqrB2t+gACBMCMekdkbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bYhpZi+I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bYhpZi+I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE9FC4CEF7;
	Fri, 30 Jan 2026 03:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769743619;
	bh=xSUD5ZCNJ4zuPw4QXBqNcX8VkKnd9/Qvr8VoEPT+h2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bYhpZi+IiJ808fOvJf0xddvUnUp9YU8eXRELDXW2zPFTe/+36l7o20XvyU6rb+dN/
	 xt/kAiSHD23pFMikQCI4eUXA2F4rSO90+ZYxD332UH8fGAW1UZ055GZpiHsWj6kjhi
	 nmPC+cHP+p5tcdC8IBW+vklxWEQfiFwjRjR4X6u3G+Ok4nP2ELpFrN5IYQ1oDxDogw
	 mOmKzGQ/XT0iqc6jkoQZV/tJJ7o6uBeZiKIsCVu8jAYd4lDarndSYk3rWz6KUitB1X
	 7+kzTucDsyCbtiu6sap2zU103Qk+Jl7UrSUwwTIgEAX6dLlg4XQonKiB/p10ek3tbt
	 LGRzmxd/PjW/A==
Date: Fri, 30 Jan 2026 03:26:55 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] platform/chrome: cros_ec_typec: Enforce
 priority-based mode selection
Message-ID: <aXwk_wzeF9UPd5DK@google.com>
References: <20260129131928.794768-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129131928.794768-1-akuchynski@chromium.org>

On Thu, Jan 29, 2026 at 01:19:27PM +0000, Andrei Kuchynski wrote:
> The driver sets mode_selection bit for each Alternate mode, thereby
> preventing individual altmode drivers from activating their respective
> modes.
> Once the registration of all Alternate Modes is complete, the driver
> verifies if USB4 mode is supported by both the port and the partner and
> activates USB4 mode. In cases where USB4 is not supported, the driver
> invokes typec_mode_selection_start to initiate the mode selection process
> based on mode priorities.
> The driver communicates the current Type-C mode to the mode selection
> process via typec_altmode_state_update.

I find the message doesn't help me too much for understanding the patch.
Can you rephrase them and assuming readers might not have too much context?

> ---
>  drivers/platform/chrome/cros_ec_typec.c      | 39 +++++++++++++++++++-
>  drivers/platform/chrome/cros_typec_altmode.c |  8 +++-
>  2 files changed, 44 insertions(+), 3 deletions(-)

The patch uses some exported symbols which aren't yet in upstream
(drivers/usb/typec/mode_selection.c).  Ideally, you should mention that in
either cover letter or note after "---".

> +/* Delay between mode entry/exit attempts, ms */
> +static const unsigned int mode_selection_delay = 1000;
> +/* Timeout for a mode entry attempt, ms */
> +static const unsigned int mode_selection_timeout = 4000;

The commit message probably needs some description about why these values.
