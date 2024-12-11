Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEEF153BF6;
	Wed, 11 Dec 2024 11:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733915478; cv=none; b=XKIJ4ahp9FTd1WwTA8mLd7aAGFtbxAV5H0pZB41yd8HeMGrjM42/QHhXXYVUhpjp/v30yeWXKK6fZHMmZBSOU0B9olfLwz2vWxMwNrF9AdBKjaOc9X01jUXbb5hX9QB5YgGncSThoXRqhE2dD3+XBKNFIvVgnJcGWQxknHDVgvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733915478; c=relaxed/simple;
	bh=QD7ULHKWVkhxuRiK98gMf9JFOXMuuvch3kUNLecq9q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F2WbUYul1EtIWaMJSEQwuWLGuvjqKrWfL+r0JTXM1Mq0M/L5fQgjylRyTFGujlupzF0VCN19J4QOz8K84sMDTl2TKeQf/xSLMyXyP+L5et76Q8/TV9AwrylldcCjujmK18vmWwhFMcv1nKZLTiLyCLGLnoZn2fwKfakMjKzETtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l2Z++UJZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l2Z++UJZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF373C4CED2;
	Wed, 11 Dec 2024 11:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733915478;
	bh=QD7ULHKWVkhxuRiK98gMf9JFOXMuuvch3kUNLecq9q0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l2Z++UJZ42ij54T3mTbjKDuAP/LCbQpcdPKSZ55obe3Gnufnst94+GJdLhgtRqsuf
	 Ywd+z5hBuhoNwJzPnLLfXE6dElAvFg1rAKfU0GYvsOht44fzzfGx5rC90kkHx2r9py
	 WFi+BdvQ/IoB10z7NOqFKQqoRdfqDv7KWlMqEsWkqd1twe1Sc41ya298++oBINbORl
	 NhgzO+Wlyl8xdiFDPibVVdlO33rjBj1+JNOgzxZhcnYgARWioxEAFKmMQPD32SZnKx
	 WsImhGLGv9zatFaHzIfTb77tpVJ1Bad9Bk9D7MhHYDAMh/cMUnd5OSqZRLaKFas+WI
	 z5RPGaHkLST+g==
Date: Wed, 11 Dec 2024 11:11:09 +0000
From: Lee Jones <lee@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nfraprado@collabora.com, angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com, linux@weissschuh.net,
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-mediatek@lists.infradead.org, bleung@chromium.org,
	groeck@chromium.org
Subject: Re: [PATCH 2/2] dt-bindings: cros-ec: Remove
 google,cros-kbd-led-backlight
Message-ID: <20241211111109.GA7139@google.com>
References: <20241206031405.1711996-1-tzungbi@kernel.org>
 <20241206031405.1711996-3-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241206031405.1711996-3-tzungbi@kernel.org>

On Fri, 06 Dec 2024, Tzung-Bi Shih wrote:

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

Acked-by: Lee Jones <lee@kernel.org>

>  2 files changed, 39 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/chrome/google,cros-kbd-led-backlight.yaml

-- 
Lee Jones [李琼斯]
