Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780584;
	b=uJ9gqYLtwG8MBojhFPRlH7V29SpxTvQCv319OJalrSMKwWjj8acJISyyBIIPkh3Aq3Dq
	 uIWwgmuHz3ctNkS+OzFueoYSTXuBvaFWwTn/NKSYQEV7zN37bE3OCTlxhFET8shsJqIO7
	 EKUO0E+a2Vqc+ix9eqlNffhOhpSv/YaQtVOblBVkzin/kYwZ30Y0Mr0yfbGkeWh5j9f/5
	 L61Kbpsy/ilxzGN/D64BKgfctJcLI5BqDQ79JaE59LDyR3vmYP+lToa/UY1uOOZNhIyi+
	 K9R3z1Mf3b53CLBdAcvJVtYZ+6IxkKPlzOLbIHBODazvdAY5IbmImQpdP0KGFTbGImQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780584;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=IkLuTMyUuvtAIOJvKS4W5OnPvsELCClQmcENJYo+ClY=;
	b=390Hb3WMpdyGfGHi4ASZXYYJkS3A2JnVfuZUH6pMQkZ4Ld3OBtAiPl4PYW/wdo2kh/iu
	 TQRmawtUElpaH8Vl3DiNfquHH1RsdLMICZdr6+CYVeV6qxoTtb4Q6/yJ122K2sP8ij1Zr
	 uklXrycCOObY66kkjioNjs8h+Y5pF67zugdnFGgJzMUqGkSwFEnTuY4/2MapZoyb/mGl1
	 L7AgKx4XtyLLmD6ThxgZG5WnpE3GHOxfaDTcuPLI44/Xzfg801DzDmagdLwGA6FHl2fyn
	 mwJCNHzVvpx/w1a3TWO7obEbY0SatrrSJ/lZVrtJek2FxOlmhKCJzucHkvTnNlIuRfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AMDtk+JA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC219606A31C;
	Fri, 27 Nov 2026 11:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AMDtk+JA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D67F41F00893;
	Fri, 27 Nov 2026 11:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795780584;
	bh=IkLuTMyUuvtAIOJvKS4W5OnPvsELCClQmcENJYo+ClY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AMDtk+JAMxtOsgCYR7Tusz2QRsZZkiHpXp/v/sh6QrwjcI3WBGSXtxfnxKtudM1el
	 k/fR9W90ToPqji3UmUEgWCcGVUt7Vxjy9ZvYn1qSYmpO+EAyboFVmiPYeeOXyxiQgE
	 /Xgna69TWzSsbE7X4Gi997HAaFWidlZG67RwmcW0tqiHzqGeR5MkCXfNvfX6Htg6hG
	 jq6ma+ygm98psveaQlvUD4oZpqRtgMS3QTxS6vlCIgUPHhe5ATRznlgnL7+qLqmjua
	 gbR1CaX3PKh3vkBFRiNdYNxSJ3Lbhv0HS97EV6E2zlOpIaIvqCjuZjvAX94/L851oc
	 Uc/w+4yjIbhgw==
Date: Fri, 27 Nov 2026 11:56:19 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Wang Yang <yang.wang@deepcomputing.io>
Cc: Yixun Lan <dlan@kernel.org>, Benson Leung <bleung@chromium.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Sandie Cao <sandie.cao@deepcomputing.io>,
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/9] platform/chrome: Add SpacemiT K3 eSPI EC transport
Message-ID: <awlv4wDjNQ8nXYiH@google.com>
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
 <20261118085742.1817536-6-yang.wang@deepcomputing.io>
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
In-Reply-To: <20261118085742.1817536-6-yang.wang@deepcomputing.io>

On Wed, Nov 18, 2026 at 04:57:38PM +0800, Wang Yang wrote:
> Add the K3-specific EC transport as a separate driver. Use a vendor-
> scoped Kconfig symbol, module name and compatible. The register mapping
> and recovery API are tied to the SpacemiT K3 controller, so this does
> not claim to be a generic eSPI EC transport.
> 
> Preserve the original independent eSPI command and event logic. Existing
> EC core, LPC, protocol and keyboard implementations remain unchanged.

I haven't done a detailed review as some functions in this patch
(ec_response_timed_out, pkt_xfer, cmd_xfer, readmem) are based on (and
very similar to) cros_ec_lpc.c.  Is it possible to refactor
cros_ec_lpc.c to extract the common logic first so that this driver can
reuse it?

E.g.:
- cros_ec_lpc_proto.c and cros_ec_lpc_proto.h for the common logic.
- cros_ec_lpc uses the common logic.
- This driver (consider renaming to cros_ec_espi_spacemit) reuses the
  common logic.

Similarly, instead of handling ec->irq in the driver, refactor
cros_ec_register() first and reuse the logic in the driver.

E.g., only set it to IRQF_TRIGGER_LOW if it was unset:
    unsigned long irqflags = IRQF_ONESHOT;
    if (irq_get_trigger_type(ec_dev->irq) == IRQ_TYPE_NONE)
        irqflags |= IRQF_TRIGGER_LOW;

Or introduce an ec_dev->irqflags field:
    if (ec_dev->irqflags == 0)
        ec_dev->irqflags = IRQF_TRIGGER_LOW | IRQF_ONESHOT;
