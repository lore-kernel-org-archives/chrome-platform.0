Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC43E21D5AF;
	Thu, 18 Jun 2026 04:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781755790; cv=none; b=mr2OBtZslp3/3UegCHMDqXqKq9Y/itSFDRdEwc/ArbvJMYKt4b3NCnY8zDoRMQO8TvS1F7Zxadt4E8WmXyL4fxZOlgTTHhuryYCw4VmjuKpx2uUNEIa671TaChstj2TfCHjpS/xfPnwW+LQUU/q+4CGQby6K50n20ruwx97+74s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781755790; c=relaxed/simple;
	bh=fHiEeqflGmXYpxl5bejglxU0NIzrDayVzP7tvoqPQaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VjzdjnnMFvurN6wL/aNp7R27CwaW/VqvIkKFcWS63oxcu6n9B5UBeN8Yxd/8otmEB+Nci+zLKKX/dD+8PDYqOnlqzCN0OeK2r2bGZ9gUboQE+k33vK5HBJeUcrgC7dT1JJwx4uZM8HNLvoumljF1KdSSyeRNT1WRTfKsyrxgfj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9uGoqxl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9uGoqxl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDADA1F00A3A;
	Thu, 18 Jun 2026 04:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781755789;
	bh=6ZRexcY3/UntpDr1F9dpRjOgHMajWSoVc+vgwfurl4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M9uGoqxln7LHzcR2zjX17+4ieBKLHBJbgfgorlNM7bits5dmA7a69/xebG44BjJnp
	 ZZYJmV6XoOFtjV/GDEL1pUzCtWX1ILC61BdE4T7gX8WvOUvcPHbU61QzpV/kYiBY91
	 AphcUdlRr0UL/uyjvUwW3oDAAtfUnjoGS72RjgzOTVFIRhqsKy27jSq7OnRrZpi/q9
	 RXf9V2jUFms/8PwRojvTQphbrysI2ccmhx8p5kpdZ/Qk371HAz8CDUT0q8RGh4M9/h
	 CwCNGShKXlp+1rgpV3xTMjL9GJxV1yp8KZZBqIOv1IvrPbwLHFb9Q4Owx3n807UIuF
	 pG5oGilggYECg==
Date: Thu, 18 Jun 2026 04:09:45 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Benson Leung <bleung@chromium.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Guenter Roeck <groeck@chromium.org>,
	Liao Yuanhong <liaoyuanhong@vivo.com>, Kees Cook <kees@kernel.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] platform/chrome: Drop unused assignment of
 platform_device_id driver data
Message-ID: <ajNviV8P9eXXpgZh@google.com>
References: <5b72bac661bdf1c874bea4b91ce3c2eccc84bba1.1781690554.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b72bac661bdf1c874bea4b91ce3c2eccc84bba1.1781690554.git.u.kleine-koenig@baylibre.com>

On Wed, Jun 17, 2026 at 12:04:13PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> The drivers explicitly set the .driver_data member of struct
> platform_device_id to zero without relying on that value. Drop these
> unused assignments.
> 
> While touching these arrays use a single space in the list terminator
> consistently.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

For my reference,
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
