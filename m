Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32F81EBFEC
	for <chrome-platform@lists.linux.dev>; Thu, 14 Nov 2024 10:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731580624; cv=none; b=UISVTD86nSzUt/DxezIY5vkqFVn0JKJWmkLIR0KkMS3quoQAKeJFNx8d0Y2qv9y3/rZJROhi9VlDo0vG+/J8krXNTLZJiUiVXY9BMTAfs3SAI7h01LmKRVB12cNxx//h8wniIYLWnn2ZYPhnGQpCx04p7buYrCFhe94PFNDqVcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731580624; c=relaxed/simple;
	bh=wldOVNo9OUOwFXKiY5hRYsqNo42KRGhqHsK0EVeiwXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EWJ1Be8H3oCYPFt6qV3e3fiYn+i0OBfWmQP+z1T5vIrHmWzMU/ECA5/Gq4jbRIu70GntKTUyMWdSpX71qpjMy9RMUvZhfcJNKvkp2z5XHjjKYy2oRefBELBkwcj2t9j6dA1sWNiMnBPiM5Mf4UDBLLSqK3IYXGLCENbRsnDmLyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MJtPs5zb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MJtPs5zb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731580621;
	bh=wldOVNo9OUOwFXKiY5hRYsqNo42KRGhqHsK0EVeiwXs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MJtPs5zb/Y97YcTz7MxdsCxTtSjWXopxmKh3oqI76IcUBNV8GD71iY12R5G9XolKC
	 bmtH4BwmEeMuevLJgO9dDJNmP8uLRXy/9KllwHH9afhmzgO/pHYPYmlOiSg/A8DQba
	 8Dsm98SFfDv8wl4fVGMSg70oWh9qinDaLvO1Oy+beV7vTierEOm7cuc1gX0aXmgz6z
	 J+fvhHbaWZqtFiXgLjCTWhCELnV+Dycj7xvUvaDUL2kLqySTPqpkfwKPAzPhcM+HJP
	 U5CBgzGJZ7qhNu1Y8KvOSAqPznx96HwahZuUTgJ1Irl+enPq/yDc8mWxJmi00WJskq
	 +FZ6rn/C3nl7A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4AB2917E35F4;
	Thu, 14 Nov 2024 11:37:00 +0100 (CET)
Message-ID: <7d9abefa-6400-424f-9cf5-439f4400a168@collabora.com>
Date: Thu, 14 Nov 2024 11:37:00 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/7] i2c: of-prober: Add GPIO support to simple
 helpers
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wolfram Sang <wsa@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-i2c@vger.kernel.org, Andrey Skvortsov <andrej.skvortzov@gmail.com>
References: <20241106093335.1582205-1-wenst@chromium.org>
 <20241106093335.1582205-6-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241106093335.1582205-6-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 06/11/24 10:33, Chen-Yu Tsai ha scritto:
> Add GPIO support to the simple helpers for the I2C OF component prober.
> Components that the prober intends to probe likely require their
> regulator supplies be enabled, and GPIOs be toggled to enable them or
> bring them out of reset before they will respond to probe attempts.
> Regulator supplies were handled in the previous patch.
> 
> The assumption is that the same class of components to be probed are
> always connected in the same fashion with the same regulator supply
> and GPIO. The names may vary due to binding differences, but the
> physical layout does not change.
> 
> This supports at most one GPIO pin. The user must specify the GPIO name,
> the polarity, and the amount of time to wait after the GPIO is toggled.
> Devices with more than one GPIO pin likely require specific power
> sequencing beyond what generic code can easily support.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


