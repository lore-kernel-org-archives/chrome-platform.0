Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9CC334374
	for <chrome-platform@lists.linux.dev>; Mon, 20 Apr 2026 12:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776689875; cv=none; b=joCZ9krNxZOS+Y/wCv2Q5pWgxpFthfWlZt8K2hwS72KL7soMM5EQLXVlGCA0mcX6QlExrvssuwYUWnchPkeT4tnYVEPZRnGLHk+hudl4DLz+q4rqpZSaRZ0aoawTYPVoxgVI5v9xkqCHCg6JmEiSg49kknGObRtdRa5tOL4w8Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776689875; c=relaxed/simple;
	bh=V7FPj1tNedM8iIeydBk5vJ5jEFd2bEmcvSkLalKsPgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oYsDd0o500woiCkS4R4nMnQuiURUV3wufoK8XMqAYSvk8QUSjeqUXsHax6KTyAudGZ2kOq9LJVy936sn+APTvJq77x3j9WVWwv9dyXGKacZarSTXJ+2rjKAnJmMm+vtpeQl9mU4MYLrgZBhXVHxi2ij65c882nnO+mpfPSq7GE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AcB0x+5y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AcB0x+5y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC5BC2BCC7
	for <chrome-platform@lists.linux.dev>; Mon, 20 Apr 2026 12:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776689875;
	bh=V7FPj1tNedM8iIeydBk5vJ5jEFd2bEmcvSkLalKsPgA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AcB0x+5yK8zovu97jPpPqtQLolANMJ+gqGd+k1/iN7MbXEqgHquebk6W9duSyxBCZ
	 WoY26lmrZeBmMi+6/HIAb2hNr/E84LrtMARh1sbKDt58L3Ywg4lvDY2jKaw6f5Udxu
	 4gY6ChryeWG5azxUwiDoeE5zATL2FB+GhepIsgyTPNrJfwjfa4yOqhaZce5dSCp12D
	 Fg+TAJkLvE+S/4lK+qdEzcQgJf1p7LN6ffpylojCIs1wr8DcHBD480DXpD4HPXaX8O
	 vrfDo/jvJ9LuIM/d8EBFXQWGwFC+3GZmpFBpuPnRQ54k6r1k/xCBXuy9feFZ7+Dadm
	 8iQXDCR/H2k7A==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9c3a9fe80fso376148066b.3
        for <chrome-platform@lists.linux.dev>; Mon, 20 Apr 2026 05:57:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9atOlqmW7XC/fz1X8/sZl7SycTaEMWlk1y/xSKl7q8HPH4/m+MouZcmpCd1DoUcGiEWgfFeHy+VJJAebDinKc=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywo9nqXx9LmDj2A62EGbww4vskWk+WRH26Vxj+qCYl/d5z2f4ae
	ngEE/OOrjB76Fwt7jKtwJcd7ccN+6tQv7uKbYm8IfIbEDHP8esTjZXFo7py3a/F76GVZJa7CXe8
	ZkXd7VJts2kG8nIfoCjH1wfgFgkwNZw==
X-Received: by 2002:a17:907:1682:b0:b9d:872f:f5b9 with SMTP id
 a640c23a62f3a-ba41a91e1abmr709097466b.23.1776689873405; Mon, 20 Apr 2026
 05:57:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z0NUdoG17EwuCigT@sashalap> <c25e6a80-f6dc-4ef9-a90d-0fa09cbbc217@linaro.org>
 <Z0NbeyTwxo-M4Lgi@sashalap> <936bf452-3d1f-4940-9a91-69efcdc6985e@collabora.com>
 <CAGXv+5FLkZbZVHNkfRWuT+OioZ0TG=u2WfaFCx-jZFi73QHnVg@mail.gmail.com>
 <19ba4910-f909-41b4-ba62-c904bc37d41d@linaro.org> <e77669ea-9edd-4321-8d17-4da40161b59d@linaro.org>
 <Z0R6myuCR4Jpmc_y@sashalap> <CAL_Jsq+QBweDZ+1=FXq7Hez=+mhiOxOvurr3rP0+3y_FCd49Ew@mail.gmail.com>
 <20241209092809.GA3246424@google.com> <aeKlYzTiL0OB1y3g@google.com>
In-Reply-To: <aeKlYzTiL0OB1y3g@google.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 20 Apr 2026 07:57:40 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+UCYbKMXG5m8BRNVRA_03Ki8aGF0uoaDs8HHvOSCZ2Mg@mail.gmail.com>
X-Gm-Features: AQROBzC2C_xA3b0Mjz0zbeaIOwFHYjnlA51sUwMWExHOdDIrYqslHpa-2xJeEdo
Message-ID: <CAL_Jsq+UCYbKMXG5m8BRNVRA_03Ki8aGF0uoaDs8HHvOSCZ2Mg@mail.gmail.com>
Subject: Re: [regression] of: mis-parsing Depthcharge's /firmware
To: Brian Norris <briannorris@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Sasha Levin <sashal@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, Doug Anderson <dianders@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 4:26=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> Hi all,
>
> (New subject; was "Re: [GIT PULL] Devicetree updates for v6.13")
>
> On Mon, Dec 09, 2024 at 05:28:09PM +0800, Chen-Yu Tsai wrote:
> > steelix.dtb is the same, plus the firmware now inserts #address-cells
> > and #size-cells under /firmware. This fix has landed for all future
> > ChromeOS devices via our main firmware branch [1].
> >
> > AFAIK they also have a bad FDT END symbol. This was only recently
> > discovered and fixed for future devices [2].
> >
> >
> > ChenYu
> >
> > [1] Gerrit: https://crrev.com/c/6051580
> > [2] Gerrit: https://review.coreboot.org/c/coreboot/+/85462
>
> This all comes back to bite us, since nobody went back to patch the
> existing Chromebook device trees, and now we've added a true regression
> on top:
>
> In commit 6e5773d52f4a ("of/address: Fix WARN when attempting
> translating non-translatable addresses") we now reject devices without
> '#address-cells', and this breaks the DTs generated by bootloaders
> without Chen-Yu's https://crrev.com/c/6051580 fix (this is ... pretty
> much all Chromebooks). Specifically, Linux now refuses to add 'reg'
> resources to the /firmware/coreboot device, and we fail with:
>
> [   11.886271] coreboot_table firmware:coreboot: probe with driver corebo=
ot_table failed with error -22
>
> This is almost certainly a DTB ABI regression.
>
> This was noticed here (OpenWrt supports some Chromium-based WiFi routers
> that use Depthcharge-based bootloaders from many years ago):
>
> https://github.com/openwrt/openwrt/issues/21243
>
> For now, I just patched up the OpenWrt DTS files like so:
> https://github.com/openwrt/openwrt/pull/22951
>
> But what should we do going forward? I note that Rob says "We may
> revisit this later and address with a fixup to the DT itself" in commit
> 8600058ba28a ("of: Add coreboot firmware to excluded default cells
> list").
>
> That never happened, and a ton of Chromium devices are still broken.

The above just silenced the warning. If they are broken, then
something else broke them.

> (They don't have WARNINGs, but /sys/firmware/vpd, etc., is still
> missing.)
>
> Can we patch of_bus_default_match() to accept an empty 'ranges' [1]? Or
> should I go patch every Chromium-device DTS file I can find? So far, I
> think I can get that done in 17 files in the upstream tree...

Both.

Though I'd rather the kernel fixup the DT rather than relax the
parsing code for everyone. Then we know what platforms need this and
don't let new ones in.

>
> Brian
>
> [1] From ePAPR:
>
>   "If the [ranges] property is defined with an <empty> value, it
>   specifies that the parent and child address 28 space is identical, and
>   no address translation is required."
>
> And:
>
>   "An ePAPR-compliant boot program shall supply #address-cells and
>   #size-cells on all nodes 16 that have children.
>
>   If missing, a client program should assume a default value of 2 for
>   #address-cells, and a value of 1 for #size-cells."

ePAPR may say that, but that's not what the kernel implements,
defaulting to 1 address cell (on !SPARC). dtc however does default to
2 cells. Relying on defaults has been a warning in dtc essentially
forever. I'd like to get rid of defaults in the kernel

Rob
