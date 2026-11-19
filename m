Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079172;
	b=qqW7uX5OIw9hvgUJROrvGdO4XqHIJT0syYTRiJzK9qJwe02/Qgo13gcPrj3Jy+iNWKo1
	 kmhxaOX9Ngs5V2Tms1Up/Mrber0gBeb5M/JJdwz9cbivuHD2wYuRtU9wpswqUafsng6dl
	 E1WGKoUMnlzylvYZqc0ty9M9bujI8mmxdWwlrQhwOosRpOkT6qj/QjVS8mZnGGaOwDxGJ
	 IK5mjS8jHLGoaVP2Z69nHcsHbAar3GZgxfTzzpT1YfdlpBNr06eyfk22cVaOWaMjDSo9G
	 vNTQqulozJ2FvoT23H0HaqWAJp7K4kFlL/xP7vOT14dvy5czMbjKp5DCCO8TddyL5Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079172;
	h=DMARC-Filter:DKIM-Signature:X-Mailer:To:Content-Transfer-Encoding:
	 Content-Type:Received:Subject:Message-Id:References:Mime-Version:
	 X-Lms-Return-Path:X-Original-From:Cc:From:Date:In-Reply-To;
	bh=4HX5+/MoRFuL5friO42awFlJeeVyzzPj59afEXfj3X4=;
	b=ldetUMr4SdgVKMiChYY9FW1BwmdXDt2JO+zrM/NT/4yGjwUcdlz6z/aKyU8WikjQoLtZ
	 kQGXv1/fiRBSIj0dFBa2POZkVvFTqTueQnWaDIbm9Y7rrQYuznS381yec8nNM2MY0nhJn
	 283JdN0rrl9WTWCHjBYUCDUCgjnAE9Ee/BDRPgebYAH5bkDkC/oZdwHf1xuyevD0qfD6Y
	 /pogmXCje4Q32U7kokmFL50yfJeM8AQ8wHoA6U7A5680pl6SaEact0xpMQvCOF2Xxbxu2
	 FNr/EOfPMGuhhuppb7wPz5Kntg0GeRDqbZDK39V8RFs+oe6GkEgh/3uHilCeKvp9GCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=grjpUPxq;
	arc=none smtp.remote-ip=209.127.231.36
Received: from va-2-36.ptr.blmpb.com (va-2-36.ptr.blmpb.com [209.127.231.36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2DB606A32F
	for <chrome-platform@lists.linux.dev>; Thu, 19 Nov 2026 09:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC2DB606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=grjpUPxq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1795079166;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=4HX5+/MoRFuL5friO42awFlJeeVyzzPj59afEXfj3X4=;
 b=grjpUPxqeB05GIa1dPz1KJ9Rbrca6OpaoKotakoD7K3u5Yb3UX0SyVmQkUH8ft8bPaoy1Q
 7JzTCIsAwNlQYLTeYnFHnVv2n2GBbtfAmLO4YWi+GWGJldsjpEX8JKGZL1w+gYzEGcHQee
 tw+CLuKJejl+sKk+3iXjU0tjS/h7FSLqLLukiFb4hxRsYMQ8xzym9o++8eeRW30QVYvi0y
 YrNf3Ok4ZCFfuxPdO8xU0MVxZbxxjnzXeonBG4rWUxIp/wIyvXuMWFjjexsi09teMvSIWO
 jybF2WA6Ag12mHLIPmJNUWjpL5Y4z+ak1MAMgufr5w+AlGg7L/NQcHKbm6jqEw==
X-Mailer: git-send-email 2.43.0
To: "Conor Dooley" <conor@kernel.org>, 
	"Aurelien Jarno" <aurelien@aurel32.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
Received: from ubuntu.. ([183.23.99.162]) by smtp.feishu.cn with ESMTPS; Thu, 19 Nov 2026 17:06:02 +0800
Subject: Re: [PATCH 1/9] dt-bindings: bus: Add SpacemiT K3 eSPI controller
Message-Id: <20261119090553.1886090-1-yang.wang@deepcomputing.io>
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io> <20261118085742.1817536-2-yang.wang@deepcomputing.io> <20261118-backdrop-scrap-1bee34e06336@spud> <av4iWQb33bya48G1@aurel32.net>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26afebbfc+51d873+lists.linux.dev+yang.wang@deepcomputing.io>
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
Cc: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Tzung-Bi Shih" <tzungbi@kernel.org>, 
	"Guenter Roeck" <groeck@chromium.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, <devicetree@vger.kernel.org>, 
	<chrome-platform@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, 
	<linux-spi@vger.kernel.org>, <broonie@kernel.org>
From: "Wang Yang" <yang.wang@deepcomputing.io>
Date: Thu, 19 Nov 2026 17:05:53 +0800
In-Reply-To: <av4iWQb33bya48G1@aurel32.net>

Hi Conor, Aurelien,

> How is this "eSPI" different to the eSPI described in fsl,espi.yaml and
> implemented by a driver in drivers/spi?

Thank you, Aurelien, for clarifying this. K3 uses the Intel-defined
eSPI interface intended to replace LPC. It is a different protocol from the
Freescale/NXP SPI controller described by fsl,espi.yaml.

On K3, the controller exposes a CPU-accessible window for the eSPI
Peripheral Channel. The EC client accesses its command, response
and memory-map regions through this window, rather than exchanging
ordinary SPI messages.

The proposed controller driver handles clocks, resets, link
configuration and window setup. The EC transport handles the EC
register mapping and host commands. The distinction is therefore
the protocol and access model, rather than the use of MMIO itself.

I will make the Intel eSPI terminology and this access model
explicit in the binding description.

Regards,
Wang Yang
