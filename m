Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794306273;
	b=a4RAPGOfd3PDYpwrF1D/d0WHsXMUh2gRJDcW6HKd29lUkPCThuIJTdoUFAhYefrWWOD2
	 gpqyNczML5qLZquCzl3UBebkuvNjjwZOSuwu0BglS7hgNH6czm7MzE6kAoEfu367J9hUV
	 3vAiFVYtvrd3hKinAjD5/QcwkLQVV35VPjSOVHIHvkVQogritd7ifFyU0zVFgtm5WJBSB
	 cxMCab+TWCb3NA5VhmpZevVGRmvGj6rzwONGdHYBkg3Kwz6mvxr/usFB40FewhnUIMVhF
	 p7Te1Ga2UrARA2Pimy8bY+ztxl7VZGm1Wqlhvkzd0tuEIy1cP1dQuCLXDKiQVFTooOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306273;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=0k92K8b49X9cIdh2GF82mc+d2Q8OVuyS6TzYE36ZPtE=;
	b=llKpz2xvfDf+PL0g3w0dj9Ytq0z1urXrYxceGEmcxrrCpDvKIkUpVMOIP90GNbWDlzMH
	 JY5fhU8WSYvUKpp6/rAZ0YC92sGFEQw1n0Hj8bAryS2HkExQwONTbCNREz6e2zdLgpfxq
	 RMIGqsGuk3uz74wcKHt+2kLI1nN0wGW8VzHx8vYp9er/JENJDuMiFiPsi5eFJZn5XWIUn
	 EIB/KoZffuut1qGqqnQ2/Exmf4qo6R4nEX9Fjd7dlm9UxTB3KZ7g2PSYa1rnoXMDiEiHF
	 3A+gfvv11CDgAGYZ/RK5ifhDmLIUWoU37MzgwJ/J69vH1ahxIkSUjX/ve1DlaG8GBag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=CixjJzFD;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D728606B988
	for <chrome-platform@lists.linux.dev>; Tue, 10 Nov 2026 10:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D728606B988
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=CixjJzFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=0k92
	K8b49X9cIdh2GF82mc+d2Q8OVuyS6TzYE36ZPtE=; b=CixjJzFDIKVpJGj+e0HN
	K1hHUYCLcVXcQKua5AIHTqIEXd5XLR2K1xiTJiW2GZNBtgbADz+FWMM9nZCm5O2A
	ZuOK98Piur0oC5bOuegmdwsw69YpeqRvB7bwO92tbfcETkfdXVUD92zjWf6oteO6
	XKkCKkyuLtfqXlmZriJXEm7hdU9Iyuw3nI7V9OP/3t/+WHRZG95vERR+3slbMEg+
	a0OOYfzzjZax/bZsoodgw4a8unf3OW/TkvCAUmHGjZKm8h5uvQ1C9b2Qe8gikhna
	7D9iw2niRkO5MQh3Xk8tUGLp562kgtB84GdmAOkIZkeIxxtr+6Gaj4Gt84AXxuPH
	gg==
Received: (qmail 187841 invoked from network); 10 Nov 2026 11:24:25 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2026 11:24:25 +0100
X-UD-Smtp-Session: l3s3148p1@rcKKe+lfZuoujnsO
Date: Tue, 10 Nov 2026 11:24:24 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/8] i2c: of-prober: skip post-power-on delay if
 powered on sufficiently long
Message-ID: <avLw2AiqcnO9Blun@shikoro>
References: <20261103043734.2179858-1-wenst@chromium.org>
 <20261103043734.2179858-5-wenst@chromium.org>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103043734.2179858-5-wenst@chromium.org>

On Tue, Nov 03, 2026 at 12:37:28PM +0800, Chen-Yu Tsai wrote:
> On some devices the I2C component is powered from an always-on power
> rail, or the power rail has been left on by either POR defaults or
> the bootloader. By the time the prober probes the device, the device
> most certainly has finished initializing and can respond. There is no
> need for the delay.
> 
> In such designs, the system integrators tend to work around the delay
> to avoid the boot time penalty by simply omitting it from the device
> tree and the component prober. This is undesired, as the device tree
> is not fully describing the hardware.
> 
> Switch to the new regulator_enable_and_wait() function that makes sure
> a certain amount of time has passed since the regulator supply was
> actually enabled.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

@Andi: Chen-Yu is the maintainer of the of-prober, so I suggest these
changes just go in together with this series.

