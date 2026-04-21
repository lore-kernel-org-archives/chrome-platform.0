Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DF2178372;
	Tue, 21 Apr 2026 19:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776799841; cv=none; b=Pe04CyId9gBW2MQT3lKrm1pttFCdaUzxoo/gQReUjeseX4P7jC021/pTMMSur1JwpLFS9L3jV4qnM0x8va1PBwEaH/fjn58NHjoKgAIUo8aTy8/JIE7Zm1YArevgovzsbknOeu5TG5am6lR9ZMMZ0medCt7a2AP14yIG/2leiEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776799841; c=relaxed/simple;
	bh=7uMlFjChuPJucFEsN8ZR3X9EfEMuFJmHjVltbGWpwhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awOKiBXYGnWdmfyk37X8Ff5QsiO5rAaGweqyLq0uvSnuTdpK5iqeucjfLU0vd7+CnYpNsm2eQhUiyVabAal2Lh2tZfAIFAP8fIfxccPxUyhX1blSaCEex9+CO0C/oDlyn//fRNCiQ/gm4TIBVeZw0TjWw9xWszAhqTzx+AyqkKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKjwFVd3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKjwFVd3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B20BC2BCB0;
	Tue, 21 Apr 2026 19:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776799840;
	bh=7uMlFjChuPJucFEsN8ZR3X9EfEMuFJmHjVltbGWpwhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DKjwFVd3iAiiLkDUt/mNsXagiZYiM8oI7WYB5SF5bOtRlu87pEH1LtFvqovxvZRaK
	 w1fVgIU1nddYCKZHtfeygt4MQcO5EHGsQ6QHx1uW/SP8SXezCjTbzosVluHCfMLxWV
	 xD6xsbNM6s6Ha16/O1Scy4rgNO08I5/ixFSSZLq0B6RaUa+JVzCfk4LcClpM5x5urn
	 Bl9nBxZm0g846cfX6k87tpLZXSBz8tQ+5xLb+GCobKTw1HEC58THVmJ4Xv8itXHtuo
	 e1Xs29x5/2HgJUb5i+xumC+6//7TAvGsNbQ4Y4bb/irNLzeFh9NCfph+Q2G7e6BYNv
	 yt/1CcMkS24Aw==
Date: Tue, 21 Apr 2026 14:30:38 -0500
From: Rob Herring <robh@kernel.org>
To: Brian Norris <briannorris@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Sasha Levin <sashal@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Doug Anderson <dianders@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: Re: [regression] of: mis-parsing Depthcharge's /firmware
Message-ID: <20260421193038.GA1502234-robh@kernel.org>
References: <19ba4910-f909-41b4-ba62-c904bc37d41d@linaro.org>
 <e77669ea-9edd-4321-8d17-4da40161b59d@linaro.org>
 <Z0R6myuCR4Jpmc_y@sashalap>
 <CAL_Jsq+QBweDZ+1=FXq7Hez=+mhiOxOvurr3rP0+3y_FCd49Ew@mail.gmail.com>
 <20241209092809.GA3246424@google.com>
 <aeKlYzTiL0OB1y3g@google.com>
 <CAL_Jsq+UCYbKMXG5m8BRNVRA_03Ki8aGF0uoaDs8HHvOSCZ2Mg@mail.gmail.com>
 <aeaTSYyaqQjuP29U@google.com>
 <CAL_Jsq+qmHV8VJ1J61nUupNBZSQrqzwCV3oOjkeqc0VFBt2aDQ@mail.gmail.com>
 <aeaussSE6_TN7xk4@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aeaussSE6_TN7xk4@google.com>

On Mon, Apr 20, 2026 at 03:54:42PM -0700, Brian Norris wrote:
> On Mon, Apr 20, 2026 at 05:19:06PM -0500, Rob Herring wrote:
> > On Mon, Apr 20, 2026 at 3:57 PM Brian Norris <briannorris@chromium.org> wrote:
> > > On Mon, Apr 20, 2026 at 07:57:40AM -0500, Rob Herring wrote:
> > > > On Fri, Apr 17, 2026 at 4:26 PM Brian Norris <briannorris@chromium.org> wrote:
> > > > > Can we patch of_bus_default_match() to accept an empty 'ranges' [1]? Or
> > > > > should I go patch every Chromium-device DTS file I can find? So far, I
> > > > > think I can get that done in 17 files in the upstream tree...
> > > >
> > > > Both.
> > >
> > > To be clear, my options were:
> > >
> > > 1. fix up kernel parsing to accept these /firmware/coreboot node
> > >    structures (with empty ranges / no #{address,size}-cells)
> > > 2. add #{address,size}-cells into the kernel-included dts(i) files (this
> > >    will merge safely with the DTB modifications patched in by old
> > >    bootloaders).
> > >
> > > I wouldn't call #2 "kernel fixup the DT", personally. I'd call it "fix
> > > up the DT source that happens to be provided by the kernel." This
> > > assumes no one is using device trees that are exclusively maintained
> > > outside the kernel. (I believe that's generally true, except for
> > > OpenWrt. And even there, it's still acceptable to patch the DT source,
> > > and I've already done so.)
> > >
> > > > Though I'd rather the kernel fixup the DT rather than relax the
> > > > parsing code for everyone. Then we know what platforms need this and
> > > > don't let new ones in.
> > >
> > > I'm not sure how to parse this. This paragraph sounds like a 3rd option:
> > 
> > Well, not in the sense of pick one of 3 options. It's another option
> > in how to fix the kernel.
> 
> Ah, got it. So it's an alternative to #1.
> 
> > I think we should fix any .dts files we can
> > in addition to fixing the kernel.
> 
> OK. I have patches for both, and I'll see about sending them out in the
> next day or two.
> 
> > > 3. "kernel fixup the DT" -- sound like you want the kernel to identify
> > >    these specific /firmware/coreboot structures, and activtly
> > >    modify/patch the FDT at runtime
> > >
> > > Is that an accurate interpretation? If so, that sounds rather novel, and
> > > nothing like "both" (#1 + #2 above). It's certainly possible, but seems
> > > like a large lift for this particular incompatibility.
> > 
> > Yes. It's not novel though. The powerpc code is littered with such
> > things. Some of them due to the commit in question here. Look at
> > commits from me in arch/powerpc.
> > 
> > I started some common infrastructure to apply fixups, but the case in
> > particular that needed it ended up not needing it. So it's something I
> > have on a branch somewhere. Also it worked on the unflattened tree as
> > not all things need to be fixed up early.
> 
> You say it's not novel, but then you say the only existing code is
> either:
> 
> 1) completely different, and only applicable to powerpc or
> 2) only on your local tree.
> 
> That sounds novel to me :)
> 
> Anyway, I'm more inclined to lean on my #1 and/or #2 than to write a
> whole new fixup layer. But maybe #1 can be replaced in the future if we
> come to really want/need a generic fixup layer in the future.

The problem with #1 is a) new platforms can then repeat the same mistake 
and b) we'll forget what platforms needed some work-around and whether 
we still need to maintain such a work-around. Well, I might not forget, 
but the next DT maintainer (applications welcome!) even won't know. For 
example, I have know clue if we still need to carry some of the 
work-arounds embedded into the interrupt parsing code. That all 
predates me. The only way I find out is breaking them (I'll never 
understand why people still run PowerMacs from the 1990s).

Calling the fixup code a layer is an exageration. It's on my kernel.org 
tree in the dt/fixup-infrastruct branch. And look, guess what issue it 
was that it has a fixup for.

> (Frankly, if we do #2, #1 and #3 will probably both be redundant and
> unnecessary. I don't know of any case here where we're relying on strict
> DTB ABI compatibility with no opportunity to update some of the DTS
> sources.)

Shrug. I thought the ABI was a concern here. It's ultimately up to the 
maintainers and users of a given platform whether or not they care about 
the ABI.

Rob
