Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D622BF001;
	Tue, 25 Nov 2025 10:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764065311; cv=none; b=gBQlmPIb/C5f/hX/8KIfjIvvn+qwmndmCAIs7ifr/UCpI2YuRsWRpOgO1G6qKoWY2VLUUG4a92av9Yw6Cua7Dua4ReMEc3LKE4TUsrUxeQQhT0d798+CxmTr9YJXhgr1i+uan2OBopi9Hk58O2PuO2Ib5fZxOX0k07bsKvqfX74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764065311; c=relaxed/simple;
	bh=u7nA8naH/Nk9T87dm41ugNF9Vzr3Lh/Iymt452RomTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KCY4ap8vHaYeohbZKZj/PGGzcIjZeLCJ2SphFLwqA4ge/4SfOgcXdqVlhFEVxwoIS9/Q4POQxmN3RdG6FIpHGgtv01mmulr2fva/BH33y5jb68cz2Gib5xYpGeMETe9A6FFlQRpwe29N0T6yQKPL3lEGvtMC+Zkc+y6PiDXJPCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRz+24Kf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRz+24Kf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 398A2C4CEF1;
	Tue, 25 Nov 2025 10:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764065310;
	bh=u7nA8naH/Nk9T87dm41ugNF9Vzr3Lh/Iymt452RomTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hRz+24KfBodAGNL8IFDfGJ0QkUudCNBdNY9ZNHQtdwYNAUSVaqgt/Tk52Xmj2/Aqq
	 bEmb0rGfzn1u2Zc0Z1gC/15v2TORcGcjDmHkkInQqm8DCsVVPYvwwK6WuE4gJlCh5z
	 Pi2tTNpuxdaHcoEs7+bxKTefAm8oQqC+djtd5qxcuIgmct2iff/pE+qDfDXvomGCir
	 gib0/xgHUjrSfREz/5TWiREiDlJOhAtDzM0FrRUuEfqsf4RqEtl2IDJFHBjA4apqGQ
	 QCsb798xUluwf1mNvgDqmCP9N5VPXTHgx3EbV+GySq8FXpIfxtZGz0ks9ZyxBj0EbS
	 7LGcLW1mMn/Iw==
Date: Tue, 25 Nov 2025 11:08:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Julius Werner <jwerner@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: firmware: coreboot: Convert to YAML
Message-ID: <20251125-outgoing-boisterous-millipede-6dabaf@kuoka>
References: <20251125064851.3781993-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251125064851.3781993-1-wenst@chromium.org>

On Tue, Nov 25, 2025 at 02:48:49PM +0800, Chen-Yu Tsai wrote:
> Convert the existing text binding to YAML.
> 
> The description has been change to reflect the possibility of coreboot
> inserting the node itself.
> 
> The example has been modified to compile and pass validation without
> any errors. A comment was added to note what the firmware actually
> emits.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../devicetree/bindings/firmware/coreboot.txt | 33 ----------
>  .../bindings/firmware/coreboot.yaml           | 60 +++++++++++++++++++
>  2 files changed, 60 insertions(+), 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/firmware/coreboot.txt
>  create mode 100644 Documentation/devicetree/bindings/firmware/coreboot.yaml
> 
> diff --git a/Documentation/devicetree/bindings/firmware/coreboot.txt b/Documentation/devicetree/bindings/firmware/coreboot.txt
> deleted file mode 100644
> index 4c955703cea8..000000000000
> --- a/Documentation/devicetree/bindings/firmware/coreboot.txt
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -COREBOOT firmware information
> -
> -The device tree node to communicate the location of coreboot's memory-resident
> -bookkeeping structures to the kernel. Since coreboot itself cannot boot a
> -device-tree-based kernel (yet), this node needs to be inserted by a
> -second-stage bootloader (a coreboot "payload").
> -
> -Required properties:
> - - compatible: Should be "coreboot"
> - - reg: Address and length of the following two memory regions, in order:
> -	1.) The coreboot table. This is a list of variable-sized descriptors
> -	that contain various compile- and run-time generated firmware
> -	parameters. It is identified by the magic string "LBIO" in its first
> -	four bytes.
> -	See coreboot's src/commonlib/include/commonlib/coreboot_tables.h for
> -	details.
> -	2.) The CBMEM area. This is a downward-growing memory region used by
> -	coreboot to dynamically allocate data structures that remain resident.
> -	It may or may not include the coreboot table as one of its members. It
> -	is identified by a root node descriptor with the magic number
> -	0xc0389481 that resides in the topmost 8 bytes of the area.
> -	See coreboot's src/include/imd.h for details.
> -
> -Example:
> -	firmware {
> -		ranges;
> -
> -		coreboot {
> -			compatible = "coreboot";
> -			reg = <0xfdfea000 0x264>,
> -			      <0xfdfea000 0x16000>;
> -		}
> -	};
> diff --git a/Documentation/devicetree/bindings/firmware/coreboot.yaml b/Documentation/devicetree/bindings/firmware/coreboot.yaml
> new file mode 100644
> index 000000000000..568afd1abb92
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/coreboot.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/firmware/coreboot.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: COREBOOT firmware information

Coreboot

> +
> +maintainers:
> +  - Julius Werner <jwerner@chromium.org>
> +
> +description:
> +  The device tree node to communicate the location of coreboot's
> +  memory-resident bookkeeping structures to the kernel. Coreboot's
> +  FIT image payload can insert the node into the device tree. If a
> +  second-stage bootloader (a coreboot "payload") is used, then it
> +  is responsible for inserting the node.
> +
> +properties:
> +  compatible:
> +    const: coreboot

Blank line (it is always here, there is no example without, which makes
me wonder which file you took as starting point)

> +  reg:
> +    description: Address and length of the following two memory regions

Drop description, redundant.

> +    items:
> +      - description:
> +          The coreboot table. This is a list of variable-sized descriptors
> +          that contain various compile- and run-time generated firmware
> +          parameters. It is identified by the magic string "LBIO" in its first
> +          four bytes.
> +
> +          See coreboot's src/commonlib/include/commonlib/coreboot_tables.h for
> +          details.
> +      - description:
> +          The CBMEM area. This is a downward-growing memory region used by
> +          coreboot to dynamically allocate data structures that remain resident.
> +          It may or may not include the coreboot table as one of its members. It
> +          is identified by a root node descriptor with the magic number
> +          0xc0389481 that resides in the topmost 8 bytes of the area.
> +
> +          See coreboot's src/include/imd.h for details.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    firmware {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        /* Firmware actually emits "coreboot" node without unit name */
> +        coreboot@fdfea000 {
> +            compatible = "coreboot";
> +            reg = <0xfdfea000 0x264>, <0xfdfea000 0x16000>;

That's the same address in both places, so the same one entry. You need
two distinctive addresses or binding needs changes to have only one item
as well.

Best regards,
Krzysztof

