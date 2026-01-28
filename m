Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5217E26CE2C
	for <chrome-platform@lists.linux.dev>; Wed, 28 Jan 2026 05:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769577028; cv=none; b=mBlPMttUPpE0a2wxq680gSq3Mh4GGRsfKE9drs0UD0ovcYv86WA1rSeogLIuFJaqREFgBLaVwi5gVp16MslqqrRs6oaP8NiquJ006bJTCt3oO86aNXx/kfhXhgpOdthHLSMkXahteBKEo+a0zziN6pedymDnFR+d/NQm1fHhb2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769577028; c=relaxed/simple;
	bh=1WYhV1sX0nepiisBN76UWwcSOBodT2mQa0z/EznNXvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SaDqlkGJjBwcO9WRkmb0yEhoiN0Jac08PzdyCCCipOo83zGZ3gmQcQdJj+lFt8adr+c3Zg0neVcbSLjjHuI9yB+ywf0V+d67guUArym3EPsO/DK98qFY0CUckRKP3cA8G6TtVZsvdhdi+XGdP4Do45RjJz+ndcXR2/dkLYN6xRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzQBTfWM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzQBTfWM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FAE2C4CEF1;
	Wed, 28 Jan 2026 05:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769577027;
	bh=1WYhV1sX0nepiisBN76UWwcSOBodT2mQa0z/EznNXvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hzQBTfWM4MLrB+Iwvpv6ptNoxzQjpRTRiZrAMaxmI8UHRu3voafxQMyfinKBzgKHq
	 bYkw/dyVjOBOiJS3f3vOQsWKTE0YTxSZk/qUCVQIL4SZcg/FiDGmmnr1q4TibEmJAS
	 zWD8J79f8ZsqrJ5HSvj4+CaqSLYwCqiBy3TRewvAkjSMxwEbE8MxfQ7L7Q+7eIxF8x
	 kUmaaErQayt1g6UKyICPCFawl1X4r0xijan3dwAvTG/OYPauw1CNXrMkAmuUGf8AV6
	 ijkypz3RiuTprzSesAVrfNKBLy/4SIqNfme08oWZoPDEqcGoBOCpi6hO7luMKxemUa
	 I124RVa7ef+vg==
Date: Wed, 28 Jan 2026 05:10:25 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: chrome-platform@lists.linux.dev, Gwendal Grignou <gwendal@google.com>
Subject: Re: [PATCH v3 1/2] platform: chrome: lightbar: Report number of
 segments
Message-ID: <aXmaQeTV0oTqi_KB@google.com>
References: <20260128030259.1703848-1-gwendal@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128030259.1703848-1-gwendal@google.com>

On Tue, Jan 27, 2026 at 07:02:58PM -0800, Gwendal Grignou wrote:
> diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platform/chrome/cros_ec_lightbar.c
> index 87634f6921b7..30f3e24c84c0 100644
> --- a/drivers/platform/chrome/cros_ec_lightbar.c
> +++ b/drivers/platform/chrome/cros_ec_lightbar.c
> @@ -119,7 +119,7 @@ static int get_lightbar_version(struct cros_ec_dev *ec,
>  	param = (struct ec_params_lightbar *)msg->data;
>  	param->cmd = LIGHTBAR_CMD_VERSION;
>  	msg->outsize = sizeof(param->cmd);
> -	msg->result = sizeof(resp->version);
> +	msg->insize = sizeof(resp->version);
>  	ret = cros_ec_cmd_xfer_status(ec->ec_dev, msg);
>  	if (ret < 0 && ret != -EINVAL) {
>  		ret = 0;

The change is independent.  Can you move the change to a separate patch so
that we can submit the fix first?
