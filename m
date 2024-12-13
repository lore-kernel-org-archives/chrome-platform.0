Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851C827715;
	Fri, 13 Dec 2024 01:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734054550; cv=none; b=lCSzCKuhYTxQ0v8PDVtL3oNmxln0MAui81p1cRbFZv+UY7JDi9qr2Xl7sbfG5222x6glXJrioTKfNAY8RLaqkcYakRIaWSWZrh+lyomBTWzetnu1GcJqS+roovcJ/NeIXho4wL//Ixa0QkBcm8/7UQyPojtlUIHhRHEW+vnlIaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734054550; c=relaxed/simple;
	bh=r4EaCGo2gxuViKp1Wlydj2Tw1dW0Da8pj1POpitSggc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6Vm+MlpuJ3G0XkJX38ghBVjiHZhN9AjMa/SwPNYmwToTiLPm73WLpUhuIIJ0Ghm4Qqlq7GTbLmhC9iZbJMTpVzLHKkTp9smoJJ4qEFNzguY1fpUqjZd1RAea5aR3WqSyh+P5fuAyFK1rHyUg47qyrwhhAX6cqDWiEm72q6EChc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eIQnzp4B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eIQnzp4B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65CABC4CECE;
	Fri, 13 Dec 2024 01:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734054550;
	bh=r4EaCGo2gxuViKp1Wlydj2Tw1dW0Da8pj1POpitSggc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eIQnzp4Bv6neyKVzOUKHWnIqEVa306JpeUPeIEbYEalZQFG8Elqg/H6LiFE11L66H
	 dQwyMzQnjGLOotSItxHwwogKcXxlkzus0yySHk7gBV23ielaBCpECIshJB9LddJYcP
	 /m0JMDbAN7y0SUHU1bQunnzlO0TgSCktoEmnaczCzDBjJRQHKUI4rbQk7RRmEBn9XN
	 Aq67tvyxqxo5g8hxumIrhYBxO/obX5qUVfJhwO6Kf/+728e2tobYTYSr532bz4CD4+
	 W2hU5yAhAvMeMt0P7BfYSwF2Lg8HTjMnKQsjlsiGnR5LG6lX9zsj0J7+b2gq10nBUd
	 dQzmjeYegGOkg==
Date: Fri, 13 Dec 2024 01:49:06 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	lee@kernel.org
Cc: nfraprado@collabora.com, angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com, linux@weissschuh.net,
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-mediatek@lists.infradead.org, bleung@chromium.org,
	groeck@chromium.org
Subject: Re: [PATCH 0/2] platform/chrome: Remove cros-kbd-led-backlight
Message-ID: <Z1uSkny2GVCEXozm@google.com>
References: <20241206031405.1711996-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206031405.1711996-1-tzungbi@kernel.org>

On Fri, Dec 06, 2024 at 03:14:03AM +0000, Tzung-Bi Shih wrote:
> After applying 4c03a44e2668 ("arm64: dts: mediatek: mt8195-cherry: Remove
> keyboard-backlight node"), there are no users for using the OF match.
> Instead, the device is added via drivers/mfd/cros_ec_dev.c by
> 970c3a6b7aa3 ("mfd: cros_ec: Register keyboard backlight subdevice").
> 
> The series removes the OF match and the DT bindings.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/2] platform/chrome: cros_kbd_led_backlight: Remove OF match
      commit: c42951620dd473835f653ec5e127c8f284f4381b
[2/2] dt-bindings: cros-ec: Remove google,cros-kbd-led-backlight
      commit: 770aed02a55a249362ba3c2e6c361107b02aae7b

Thanks!
