Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC79E2451C7;
	Tue, 10 Dec 2024 23:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733871688; cv=none; b=RRPIRMF9okCJXSlFfQrMqnOXikmyQUagvjGB+cgqLy6w8XJRjNsCMk3FGLwg2+3eODSXnBVJsA7hOO7A0sOdsE98k/uBpjZMOd78Fyr3pE6seUfs4A6z8P90X7LNq4hx9QBwKpYLdK4uX4PzsBZqx/dKtffP0XQ1kaBeYPN327k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733871688; c=relaxed/simple;
	bh=a54ebm90iRSy8tMv4x7Bs3m33w6WRuSwIQ32x1SCINg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERFWMI/4fEmWliLJ1nQsgRWNXPG24dZj7KPx+IZg0vln3MZPeUcA+456Qgb5c4X0jGrZeZfBaIZdXZL3G0+TDIdprhngiKnjerif2FlsGdaP6MmvfjYYOh+2chKShfyKmZuZQCbVzNVi+mX9c670w/xYW+pbWncNeRlcgMBiRYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hDSafgkh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hDSafgkh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78966C4CED6;
	Tue, 10 Dec 2024 23:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733871688;
	bh=a54ebm90iRSy8tMv4x7Bs3m33w6WRuSwIQ32x1SCINg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hDSafgkhvXwDzu32v5BPAqsxyoT6unbvxG06jd8yikdsrK9zx0VBumT4s0F9t/mPe
	 dRR+0BBPfGs6ZAI/sXMrYsNv8xNk2+XSz5cIMROUMxsFzc0v+NBs4SObi57NGuOTjC
	 UjXgVTol+z6GbvwV+8x0cEGUZ8sF59P7upAZYZAhkqa5HVuu26YScUMSWMovHvUT4e
	 ULhSciN6MzqB3McOYG2CW13eWJZBvKbGR/0+9xLM3TUvecrbqWGZG25E9XsoW61PEc
	 zXiZAtjEnf91KsEhALQcBa+RWI1H+urFYNi/NkroSUAOaCoXDveTGtzQJ0Yoa0q8F9
	 ykUcmr7leIUKA==
Date: Tue, 10 Dec 2024 17:01:26 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: conor+dt@kernel.org, linux@weissschuh.net, nfraprado@collabora.com,
	linux-mediatek@lists.infradead.org, groeck@chromium.org,
	krzk+dt@kernel.org, matthias.bgg@gmail.com,
	chrome-platform@lists.linux.dev, lee@kernel.org,
	angelogioacchino.delregno@collabora.com, bleung@chromium.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: cros-ec: Remove
 google,cros-kbd-led-backlight
Message-ID: <173387168591.762034.8434485915273819545.robh@kernel.org>
References: <20241206031405.1711996-1-tzungbi@kernel.org>
 <20241206031405.1711996-3-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206031405.1711996-3-tzungbi@kernel.org>


On Fri, 06 Dec 2024 03:14:05 +0000, Tzung-Bi Shih wrote:
> After applying 4c03a44e2668 ("arm64: dts: mediatek: mt8195-cherry: Remove
> keyboard-backlight node"), there are no users for using the OF match.
> Instead, the device is added via drivers/mfd/cros_ec_dev.c by
> 970c3a6b7aa3 ("mfd: cros_ec: Register keyboard backlight subdevice").
> 
> Remove the DT bindings.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  .../chrome/google,cros-kbd-led-backlight.yaml | 36 -------------------
>  .../bindings/mfd/google,cros-ec.yaml          |  3 --
>  2 files changed, 39 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/chrome/google,cros-kbd-led-backlight.yaml
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

