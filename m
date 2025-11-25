Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FD9D271;
	Tue, 25 Nov 2025 11:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764068446; cv=none; b=g11tc/5PtuEYfP790G1ym7Im+IhKza2/rkfJmtPWFiLI9U4xI5nvA7mAwfv+9X7ygobm9/wa1rFSLR/STUrTAXZ6yn2o/Tue9J1rvtoKMQq60OwqxQbkDoqlBHWUNMs6Pgm/l3SD/k9gmonlQ7LF+CXyCEaGraVc+ZM7ua8oX6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764068446; c=relaxed/simple;
	bh=QiOgoJoXqDk9M6kPeTKYdXRgOzf255a/k246EvsS2gQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ulMV1v2aKLTbznYQaAm+mQAHwwN22wi3oIWGl0MPJHMCCm1Oio/mo4XpLho2tN/sSB3ZIRBOB1zu8O7V70OGEAlvwLZhqYUnve+3z5ZSIXpGCl+hhjZLk4QfM2js/p1/UqOG0cTwbTw8RNAtPX7g68hHgcA1EEFzpFCucpwaLA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yb8IaVk8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yb8IaVk8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7036CC4CEF1;
	Tue, 25 Nov 2025 11:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764068445;
	bh=QiOgoJoXqDk9M6kPeTKYdXRgOzf255a/k246EvsS2gQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Yb8IaVk8lxZFuHa84VJqUArkGxDdR1eb6k/enxf2TEAf46rpXl/9aoySTcS0gYEHI
	 NXmUrLr/haloP6mbpuZJRRz9kPzaQzfoCe9COK7CAG2TEVRE2bjd1vDnmANEK2aYWP
	 z0qBsks04D/X/DW8rq+UhwUhXLDePpUar1sRQsqbkkZvmTIJp6fEgy8qDtYM+D8gfj
	 BGFQDR1pAl9J91CsWuOA2AAzZZK9aF3liUM4XPSWWixCuNxNYkItV9ARC0O1AdIgLx
	 XFuyIjfA7WO9kf3NBNuJPwc1EoYSAZpvvsIzm6Fq3dP8ykasNKiUDAraOr2jFb1zHj
	 T82gAXSDVItFQ==
Message-ID: <25ee55eb-91d6-4da2-a798-b704acfae4fe@kernel.org>
Date: Tue, 25 Nov 2025 12:00:41 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: firmware: coreboot: Convert to YAML
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 chrome-platform@lists.linux.dev, Julius Werner <jwerner@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251125064851.3781993-1-wenst@chromium.org>
 <20251125-outgoing-boisterous-millipede-6dabaf@kuoka>
 <CAGXv+5FPaJMuN7wCP7g0Rxa0mXD3Ru0rxka=m8B_rv+XUkJPWA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAGXv+5FPaJMuN7wCP7g0Rxa0mXD3Ru0rxka=m8B_rv+XUkJPWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/11/2025 11:41, Chen-Yu Tsai wrote:
>>> diff --git a/Documentation/devicetree/bindings/firmware/coreboot.yaml b/Documentation/devicetree/bindings/firmware/coreboot.yaml
>>> new file mode 100644
>>> index 000000000000..568afd1abb92
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/firmware/coreboot.yaml
>>> @@ -0,0 +1,60 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/firmware/coreboot.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: COREBOOT firmware information
>>
>> Coreboot
> 
> OK. Side note, coreboot is stylized in all lowercase letters.
> Should I follow that or just use standard English rules?

Just choose one. Here was capitals, but in description not. Preferably
Coreboot or coreboot


> 
>>> +
>>> +maintainers:
>>> +  - Julius Werner <jwerner@chromium.org>
>>> +
>>> +description:
>>> +  The device tree node to communicate the location of coreboot's
>>> +  memory-resident bookkeeping structures to the kernel. Coreboot's
>>> +  FIT image payload can insert the node into the device tree. If a
>>> +  second-stage bootloader (a coreboot "payload") is used, then it
>>> +  is responsible for inserting the node.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: coreboot
>>
>> Blank line (it is always here, there is no example without, which makes
>> me wonder which file you took as starting point)
> 
> I actually converted the existing text file directly, copying
> boilerplate, i.e. the top few lines, from another file.
> 
>>> +  reg:
>>> +    description: Address and length of the following two memory regions
>>
>> Drop description, redundant.
> 
> Ack.
> 
>>> +    items:
>>> +      - description:
>>> +          The coreboot table. This is a list of variable-sized descriptors
>>> +          that contain various compile- and run-time generated firmware
>>> +          parameters. It is identified by the magic string "LBIO" in its first
>>> +          four bytes.
>>> +
>>> +          See coreboot's src/commonlib/include/commonlib/coreboot_tables.h for
>>> +          details.
>>> +      - description:
>>> +          The CBMEM area. This is a downward-growing memory region used by
>>> +          coreboot to dynamically allocate data structures that remain resident.
>>> +          It may or may not include the coreboot table as one of its members. It
>>> +          is identified by a root node descriptor with the magic number
>>> +          0xc0389481 that resides in the topmost 8 bytes of the area.
>>> +
>>> +          See coreboot's src/include/imd.h for details.
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    firmware {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <1>;
>>> +        ranges;
>>> +
>>> +        /* Firmware actually emits "coreboot" node without unit name */
>>> +        coreboot@fdfea000 {
>>> +            compatible = "coreboot";
>>> +            reg = <0xfdfea000 0x264>, <0xfdfea000 0x16000>;
>>
>> That's the same address in both places, so the same one entry. You need
>> two distinctive addresses or binding needs changes to have only one item
>> as well.
> 
> The description does mention that the latter block can include the
> former. It's really up to the firmware. If you like I can include
> two examples to cover both cases.

Lovely, I don't think we should accept growing this binding at all until
coreboot fixes this mess (duplicated entry and missing unit address).


Best regards,
Krzysztof
