Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908182356D9
	for <chrome-platform@lists.linux.dev>; Wed,  6 May 2026 06:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778048402; cv=none; b=Mun4RRlJtVM6HkgA3cBiZNGiZD40vbfz3HeGdUJOdr2eKwRZzOBN8PS90dcHWmV1LyNq35VsGhnYuGVO6dywLXxWSnP1Lqogelz6dZ5ni6cnwHVfQTKS03XQ3vV9KLX8TF4rCbfmSpLesXhIdZYEXzf2Hnf6LalLi0CqXsuEKO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778048402; c=relaxed/simple;
	bh=OAR1MXoDX3oDzJIB2viWM1MLByiBueRmSn1HrDL8EYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uN5nvH/h4SFH0+7sfmGHkLN9hsOgQUJfY3v17VOhvuYms7/XKEOSfkl6dNhU9gnJc65Y0EZf8X3wZhtSZfu8MPH4vFfLgH9D0uJ37oJZGCqf5O+lXegMTV9PLNl4qnO1urFsRBIeg8paaupvvXxOTH9uUJYlmdQVJNFQxIBcWks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Y0Js75dI; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Y0Js75dI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1778048397;
	bh=OAR1MXoDX3oDzJIB2viWM1MLByiBueRmSn1HrDL8EYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0Js75dI0oJ0pebRI207JBKuCTwaawnfrauLc9KJMotV55BmV+TtegqPZbTdAYBC6
	 VmbLbqBUx//PeizdnMllWAD9b8zzGsQfCMRJZ1cbbs5QTrdJqEmS4Cx5rtQ8r+xCKy
	 0UQ2gC/oNtH4B+CP23+QzFlpLFnTnazehKzx1Jz8=
Date: Wed, 6 May 2026 08:19:57 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>, 
	Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>, 
	Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH] hwmon: Move MODULE_DEVICE_TABLE next to the table itself
Message-ID: <12d0ce1b-9d64-4cf6-9588-1f58d162bde5@t-8ch.de>
References: <20260505102923.189289-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260505102923.189289-2-krzysztof.kozlowski@oss.qualcomm.com>

On 2026-05-05 12:29:22+0200, Krzysztof Kozlowski wrote:
> By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
> exports, because this is easier to read and verify.  It also makes more
> sense since #ifdef for ACPI or OF could hide both of them.
> 
> Most of the privers already have this correctly placed, so adjust
> the missing ones.  No functional impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Thomas Weißschuh <linux@weissschuh.net> # cros_ec_hwmon.c

> ---
>  drivers/hwmon/applesmc.c            | 2 +-
>  drivers/hwmon/cros_ec_hwmon.c       | 2 +-
>  drivers/hwmon/intel-m10-bmc-hwmon.c | 2 +-
>  drivers/hwmon/nsa320-hwmon.c        | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

(...)
