Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590EE3876A9
	for <chrome-platform@lists.linux.dev>; Mon, 20 Apr 2026 22:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776723559; cv=none; b=lQt2T9NPICSekM9JRj5VhlqNfdTMg4h8RgBgFz4kuOd3TXUtsVh9cLpV+QuvqJTpPoGpWY41wjeQhcU01xgH6Db8+OPKO2/lzZT8kzEUbxYTysLCxs90vomthQeGW3e9BCVPTbvIg3atQZIMbIIPGFGH7JNAhgmJSvWjQTuKksE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776723559; c=relaxed/simple;
	bh=Mlm9xOGo953YRVmfw9CUO3wBtbYFiSPHu6Tzu71IRCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U2wPOMWDgKF6WvCDVqi+qn2oQDO9NGZHeziRV7WkHt+ErT+9wQsM6bE0tU8lC5VFwz/J33+wypvJMGT7BN+YmTbM+WpZ6NLpZZsHWs32c1Oz52lJ4jIkkJse+XbN4w4x8GP7yf0iV8mC6ZQg5ZIXrq9t7kn1fQoSfPc02iJ45VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A4XVKAfx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A4XVKAfx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E2EFC4AF0B
	for <chrome-platform@lists.linux.dev>; Mon, 20 Apr 2026 22:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776723559;
	bh=Mlm9xOGo953YRVmfw9CUO3wBtbYFiSPHu6Tzu71IRCI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A4XVKAfx/rjoc+y/DD+NSLpk9qUhnYYvjJ98sEvsprRyuCD+M7UmW2nL2ugffQTQT
	 RrWZQAsChucd34D3NdtcPNmj9m261a2gYfQ5IQ++myG9xozz+b99WDsjROO0A6r8XJ
	 PfJIy/672PLtAnSTYQM0lhn9bGqDwx4212VqpmvQxcYH0n5QAfeGa9faVoeQzoazhE
	 mTwFLEDkIPmr/ZHOHnmbY24GkaAbhuSFQFtN4IIHMDR/Mr01F994bEAoUpAgdCxEYi
	 2RHyjouX2kynyfD8XMBANYCzQHYrNd1kkZdgutlMxTCk70XOylzAKrQF3oa+f6RvcE
	 BxuXQJYPgO4Pg==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-671c5eb7fb0so4487759a12.3
        for <chrome-platform@lists.linux.dev>; Mon, 20 Apr 2026 15:19:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8hEAab0MKIEG8XlbQ/rbVs3w3IfatzgI+ZSk9TIPFtm/Eo2VnI46CVxyILrg4ydFHDlqb6Vf6BgGXfebW2eNU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwoRPtcru2G89WqeltTtku8Fju0mrcmKwV/tATRrC9eZWTUXuIr
	B9m1p27SBuv52pkfeiGmzBaVuF8zJOIikJ3ThSy9ttk2GOZAIjzImpQEZYt0iLHkazEENZ7AJIS
	NV9funC97FKEhVMRUbiFmIynXvszoew==
X-Received: by 2002:a05:6402:46c5:b0:672:c1d6:6855 with SMTP id
 4fb4d7f45d1cf-672c1d66a46mr4967770a12.3.1776723557736; Mon, 20 Apr 2026
 15:19:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z0NbeyTwxo-M4Lgi@sashalap> <936bf452-3d1f-4940-9a91-69efcdc6985e@collabora.com>
 <CAGXv+5FLkZbZVHNkfRWuT+OioZ0TG=u2WfaFCx-jZFi73QHnVg@mail.gmail.com>
 <19ba4910-f909-41b4-ba62-c904bc37d41d@linaro.org> <e77669ea-9edd-4321-8d17-4da40161b59d@linaro.org>
 <Z0R6myuCR4Jpmc_y@sashalap> <CAL_Jsq+QBweDZ+1=FXq7Hez=+mhiOxOvurr3rP0+3y_FCd49Ew@mail.gmail.com>
 <20241209092809.GA3246424@google.com> <aeKlYzTiL0OB1y3g@google.com>
 <CAL_Jsq+UCYbKMXG5m8BRNVRA_03Ki8aGF0uoaDs8HHvOSCZ2Mg@mail.gmail.com> <aeaTSYyaqQjuP29U@google.com>
In-Reply-To: <aeaTSYyaqQjuP29U@google.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 20 Apr 2026 17:19:06 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+qmHV8VJ1J61nUupNBZSQrqzwCV3oOjkeqc0VFBt2aDQ@mail.gmail.com>
X-Gm-Features: AQROBzD3ukelB2dat7D7-v2TbiE8tGH1cpyZcJloe_3f9vx9YEb3SZs8T3tqu0M
Message-ID: <CAL_Jsq+qmHV8VJ1J61nUupNBZSQrqzwCV3oOjkeqc0VFBt2aDQ@mail.gmail.com>
Subject: Re: [regression] of: mis-parsing Depthcharge's /firmware
To: Brian Norris <briannorris@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Sasha Levin <sashal@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, Doug Anderson <dianders@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 3:57=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> Hi Rob,
>
> On Mon, Apr 20, 2026 at 07:57:40AM -0500, Rob Herring wrote:
> > On Fri, Apr 17, 2026 at 4:26=E2=80=AFPM Brian Norris <briannorris@chrom=
ium.org> wrote:
> > >
> > > Hi all,
> > >
> > > (New subject; was "Re: [GIT PULL] Devicetree updates for v6.13")
> > >
> > > On Mon, Dec 09, 2024 at 05:28:09PM +0800, Chen-Yu Tsai wrote:
> > > > steelix.dtb is the same, plus the firmware now inserts #address-cel=
ls
> > > > and #size-cells under /firmware. This fix has landed for all future
> > > > ChromeOS devices via our main firmware branch [1].
> > > >
> > > > AFAIK they also have a bad FDT END symbol. This was only recently
> > > > discovered and fixed for future devices [2].
> > > >
> > > >
> > > > ChenYu
> > > >
> > > > [1] Gerrit: https://crrev.com/c/6051580
> > > > [2] Gerrit: https://review.coreboot.org/c/coreboot/+/85462
> > >
> > > This all comes back to bite us, since nobody went back to patch the
> > > existing Chromebook device trees, and now we've added a true regressi=
on
> > > on top:
> > >
> > > In commit 6e5773d52f4a ("of/address: Fix WARN when attempting
> > > translating non-translatable addresses") we now reject devices withou=
t
> > > '#address-cells', and this breaks the DTs generated by bootloaders
> > > without Chen-Yu's https://crrev.com/c/6051580 fix (this is ... pretty
> > > much all Chromebooks). Specifically, Linux now refuses to add 'reg'
> > > resources to the /firmware/coreboot device, and we fail with:
> > >
> > > [   11.886271] coreboot_table firmware:coreboot: probe with driver co=
reboot_table failed with error -22
> > >
> > > This is almost certainly a DTB ABI regression.
> > >
> > > This was noticed here (OpenWrt supports some Chromium-based WiFi rout=
ers
> > > that use Depthcharge-based bootloaders from many years ago):
> > >
> > > https://github.com/openwrt/openwrt/issues/21243
> > >
> > > For now, I just patched up the OpenWrt DTS files like so:
> > > https://github.com/openwrt/openwrt/pull/22951
> > >
> > > But what should we do going forward? I note that Rob says "We may
> > > revisit this later and address with a fixup to the DT itself" in comm=
it
> > > 8600058ba28a ("of: Add coreboot firmware to excluded default cells
> > > list").
> > >
> > > That never happened, and a ton of Chromium devices are still broken.
> >
> > The above just silenced the warning. If they are broken, then
> > something else broke them.
>
> Right.
>
> To be clear, the regression is in commit 6e5773d52f4a, not 8600058ba28a.
> But 8600058ba28a (and this thread I'm replying to):
>
> (a) started the precedent of treating this known-problemtatic DT pattern
>     specially;
>
> (b) started to consider "fixing" those old DTs (but notably, not
>     reliably/proactively -- even if Google updates official bootloaders,
>     many devices are far out of Google support; or even if supported,
>     don't have a systematic way of receiving Google-provided updates
>     because they run non-Google software); and
>
> (c) because (a)/(b) hid the problem partially, it was less noticeable
>     that commit 6e5773d52f4a *really* broke things a month later, in the
>     last days of the v6.13 cycle. (Official Google testing probably
>     didn't notice, because they only tested devices with the latest
>     Google bootloaders. Only people with old bootloaders / non-Google
>     software noticed.)
>
> > > (They don't have WARNINGs, but /sys/firmware/vpd, etc., is still
> > > missing.)
> > >
> > > Can we patch of_bus_default_match() to accept an empty 'ranges' [1]? =
Or
> > > should I go patch every Chromium-device DTS file I can find? So far, =
I
> > > think I can get that done in 17 files in the upstream tree...
> >
> > Both.
>
> To be clear, my options were:
>
> 1. fix up kernel parsing to accept these /firmware/coreboot node
>    structures (with empty ranges / no #{address,size}-cells)
> 2. add #{address,size}-cells into the kernel-included dts(i) files (this
>    will merge safely with the DTB modifications patched in by old
>    bootloaders).
>
> I wouldn't call #2 "kernel fixup the DT", personally. I'd call it "fix
> up the DT source that happens to be provided by the kernel." This
> assumes no one is using device trees that are exclusively maintained
> outside the kernel. (I believe that's generally true, except for
> OpenWrt. And even there, it's still acceptable to patch the DT source,
> and I've already done so.)
>
> > Though I'd rather the kernel fixup the DT rather than relax the
> > parsing code for everyone. Then we know what platforms need this and
> > don't let new ones in.
>
> I'm not sure how to parse this. This paragraph sounds like a 3rd option:

Well, not in the sense of pick one of 3 options. It's another option
in how to fix the kernel. I think we should fix any .dts files we can
in addition to fixing the kernel.

> 3. "kernel fixup the DT" -- sound like you want the kernel to identify
>    these specific /firmware/coreboot structures, and activtly
>    modify/patch the FDT at runtime
>
> Is that an accurate interpretation? If so, that sounds rather novel, and
> nothing like "both" (#1 + #2 above). It's certainly possible, but seems
> like a large lift for this particular incompatibility.

Yes. It's not novel though. The powerpc code is littered with such
things. Some of them due to the commit in question here. Look at
commits from me in arch/powerpc.

I started some common infrastructure to apply fixups, but the case in
particular that needed it ended up not needing it. So it's something I
have on a branch somewhere. Also it worked on the unflattened tree as
not all things need to be fixed up early.

Rob
