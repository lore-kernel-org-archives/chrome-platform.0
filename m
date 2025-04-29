Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E9E267714
	for <chrome-platform@lists.linux.dev>; Tue, 29 Apr 2025 20:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745959102; cv=none; b=pczDOKc7e9HGaxlo0rIbroQnXhITwtOEsC4hI6QBgB0LZTgoqyKPOCGBCux9h9hTTqgaQry0TkY9UilZzkkqymRXB/W2E0GR5O9lKY4cTlp5D6DG5vpty9/25OIP0VFtiVNnjspqrlqaZVWbNoviuHLe3W3uJxbdXsrdtJJnF9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745959102; c=relaxed/simple;
	bh=/eWBP36b0R6vQ02TvTg1IX/OQuDQ0fjODeXqIrCufOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s2Yyz4fQ90UYNY2V0hbIO/CHLSFrJ1HBr96duq+93GIyATYm5Uwnhd5YIwg821gjJo149764Nbtj002Wz8mDKXt0YY5E2K2CvBeAIWffp74mgYI+ERxV1kQ3yu4+eTmKZY/bnFPFFBZo/dg211ZHVgmNv76LEzsa9L8Up03vVBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=F1KxhSkH; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="F1KxhSkH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1745959097;
	bh=/eWBP36b0R6vQ02TvTg1IX/OQuDQ0fjODeXqIrCufOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F1KxhSkHutUmilajknwg+FUaRBHlfgi8EAHlRtfKQGWf4PPdvz/xb+5FHc0rtJX5r
	 BvZDkqwQjhQfiBo6mdBeRICLEyXGOTgDD5K5t9cNcrnuOQ6Gzqo/UupaO+GpKuHeSX
	 kILIEEc3GwPenxaL5E7k3mDevKdS/D/jGQPld0x0=
Date: Tue, 29 Apr 2025 22:38:16 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Sebastian Reichel <sre@kernel.org>, 
	chrome-platform@lists.linux.dev, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2][next] power: supply: cros_charge-control: Avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <f920aa2d-b180-4532-bd29-d8740883617f@t-8ch.de>
References: <aBEwnKtUOTYzS7C3@kspp>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBEwnKtUOTYzS7C3@kspp>

On 2025-04-29 14:03:40-0600, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Replace an on-stack definition of a flexible structure with a call
> to utility function cros_ec_cmd().
> 
> So, with these changes, fix the following warning:
> 
> drivers/power/supply/cros_charge-control.c:57:40: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks,

Acked-by: Thomas Weißschuh <linux@weissschuh.net>

> ---
> Changes in v2:
>  - Use utility function cros_ec_cmd() instead of DEFINE_RAW_FLEX(). (Thomas Weißschuh)
> 
> v1:
>  - Link: https://lore.kernel.org/linux-hardening/aBEmk6ixfrQ2XpTw@kspp/
> 
>  drivers/power/supply/cros_charge-control.c | 23 +++++++---------------
>  1 file changed, 7 insertions(+), 16 deletions(-)

<snip>
