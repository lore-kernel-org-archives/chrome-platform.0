Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5159735A925
	for <chrome-platform@lists.linux.dev>; Mon, 20 Apr 2026 22:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776725687; cv=none; b=sT2X3fFmhpZ668QIBrzio+wgiW3feUrBi4XEioniuOrK9acOr2QztF2drIKhWYhSshzMr2QMtFoXYJ754d/IG1Ox7evCJiZE2j/hgFacBqYZdPHUtrBQuB1SFAvxOzUvChor3esOpnYgWs5c5MGcLbCWVHEHe2r8LDyu+VcDwYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776725687; c=relaxed/simple;
	bh=LzWzhzcf1C6ni0bQispFtpLu+s0ydO/LCFQvYMYUdBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APC99uLYlhux9ak+AR/9xaO3XX1+fE5/+Z+UW5YeSLutsdrF5HTR02VIXZyXWcdOXwOnq1U3RwRlopdYEOzKcqF/IbrKYbrZPmu4VWUuA9JNOZJmgHAxzqOzEirbE4MdU8DkNq8aMC/tzBGBhOvyPWISmp9fp6rmVCvm76WyGJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jpojgPpn; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jpojgPpn"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12c1a170a50so4279818c88.0
        for <chrome-platform@lists.linux.dev>; Mon, 20 Apr 2026 15:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776725685; x=1777330485; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CUnGStOPn+XWhs8XrMu/ZlBc/4VQOcQ2/iqWR+erKXE=;
        b=jpojgPpnRsx0BKC6XyElaOe2pEOgXEg70UBafly5x5XosuQVeF1V7L2sxOcDavpSeE
         Tb9XWQCP/AJNXjI9sfN0/fyV+ynAKsDdK5FAUNH/9PJVxUNlzEbrrweIczWHLDFu5esL
         lOOK67Zg1ecq4LCCJ0g0BJ+GgBYw1g7q5Xkwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776725685; x=1777330485;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CUnGStOPn+XWhs8XrMu/ZlBc/4VQOcQ2/iqWR+erKXE=;
        b=Pkehe69/94464ZDMn1iWDNX/Xsiiwb7WSm7fBNVO2sB8kjJt8y+A/86l0jbT9A0sp5
         VqU/32FsR/8juIHHvFjEm42jQsLCrawchEz0IeKcdcxqVDEUbmyusvX4fz2imP6Uk5Ik
         FgKfUWSB32pY4JY+yzvXF8OgfRZC8iSRlnCrlulSxofq3YSgScPZTfHO2FQItABT7mio
         VeqJTLEVGksYD7vP3bxDXlSkIGzKW53QVjhevJnQ2PhCDVCBgrpsSTi9ztcCg+V9olhJ
         O/tXPVlargdyqn9uzVDKuxGBqzqzIvCskR56OQWdngRaXtA36+qG7mnm74g/JQLIPNUC
         4j9w==
X-Forwarded-Encrypted: i=1; AFNElJ9h6Gky+SyBwMgK8e8A//r/MbDtM56YEC2YWNaOK0lpmh0VyAJ9G6awkhI3WwSHcrHaFZ2bA3x5xa1pasW3cdc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYa95PxIOZ5lHa5zLG3b4Y7w59LBy9p91uUYHeZd90HKh9xAO1
	2Va5DvQt+8CVZBc714ovpwRDilomXunoIsetqiw8TAyCUVS9hYOMNwC2OZzS5bKUtw==
X-Gm-Gg: AeBDiet3+Aa3Sq4vqFKSbBzzkzrwN7G5upjckYBT82CIv2/CEbaji0X04Gdd571+FS9
	0c1vFN8I3nZSy54Uray2rIFQPdo0rEAP9DDi6sPihXako88yK/wnlLQix88ePrM4cVNkoNQilCO
	F4nrHBskldHR1ynGbRE7GYr3IaB5YtPw75oZtts/7W3P6694D5k1UpbNd/i5k1keE4MHhbAZ8qL
	C43/Rgfh7NUP4MWa8eqR0dJtAXSbS94WTpSoDGxWmdKOqp4/TH2078TI7SUY7SHshBraoYNfqrS
	kASjYPt3Y4GGLFsVIPBzkv1wzN/IjOJhxnTTBh5vNwmPewjpDMvKoXiildHZCL8s+k3f0M6MITm
	JDIPXYcg68YpH/DM8hGNo912aMa2dH3gA8e+GrZVcj+Fx+kBU66b45PQUXZJAbZ6bCsa5w9DrRA
	0ATEa0IFJWZwXU0Bm8x3Rc1yrDaweypTCwZ2iF33aDnPeLAFCFmLjFyOk46wHjD1NyZuzgkBFV
X-Received: by 2002:a05:7022:f9e:b0:128:ccb7:7fa3 with SMTP id a92af1059eb24-12c73fa8fa3mr7564950c88.34.1776725685322;
        Mon, 20 Apr 2026 15:54:45 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:b635:62cc:359d:682d])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-12da8b8fbc4sm3231421c88.4.2026.04.20.15.54.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 15:54:44 -0700 (PDT)
Date: Mon, 20 Apr 2026 15:54:42 -0700
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>
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
Message-ID: <aeaussSE6_TN7xk4@google.com>
References: <CAGXv+5FLkZbZVHNkfRWuT+OioZ0TG=u2WfaFCx-jZFi73QHnVg@mail.gmail.com>
 <19ba4910-f909-41b4-ba62-c904bc37d41d@linaro.org>
 <e77669ea-9edd-4321-8d17-4da40161b59d@linaro.org>
 <Z0R6myuCR4Jpmc_y@sashalap>
 <CAL_Jsq+QBweDZ+1=FXq7Hez=+mhiOxOvurr3rP0+3y_FCd49Ew@mail.gmail.com>
 <20241209092809.GA3246424@google.com>
 <aeKlYzTiL0OB1y3g@google.com>
 <CAL_Jsq+UCYbKMXG5m8BRNVRA_03Ki8aGF0uoaDs8HHvOSCZ2Mg@mail.gmail.com>
 <aeaTSYyaqQjuP29U@google.com>
 <CAL_Jsq+qmHV8VJ1J61nUupNBZSQrqzwCV3oOjkeqc0VFBt2aDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+qmHV8VJ1J61nUupNBZSQrqzwCV3oOjkeqc0VFBt2aDQ@mail.gmail.com>

On Mon, Apr 20, 2026 at 05:19:06PM -0500, Rob Herring wrote:
> On Mon, Apr 20, 2026 at 3:57 PM Brian Norris <briannorris@chromium.org> wrote:
> > On Mon, Apr 20, 2026 at 07:57:40AM -0500, Rob Herring wrote:
> > > On Fri, Apr 17, 2026 at 4:26 PM Brian Norris <briannorris@chromium.org> wrote:
> > > > Can we patch of_bus_default_match() to accept an empty 'ranges' [1]? Or
> > > > should I go patch every Chromium-device DTS file I can find? So far, I
> > > > think I can get that done in 17 files in the upstream tree...
> > >
> > > Both.
> >
> > To be clear, my options were:
> >
> > 1. fix up kernel parsing to accept these /firmware/coreboot node
> >    structures (with empty ranges / no #{address,size}-cells)
> > 2. add #{address,size}-cells into the kernel-included dts(i) files (this
> >    will merge safely with the DTB modifications patched in by old
> >    bootloaders).
> >
> > I wouldn't call #2 "kernel fixup the DT", personally. I'd call it "fix
> > up the DT source that happens to be provided by the kernel." This
> > assumes no one is using device trees that are exclusively maintained
> > outside the kernel. (I believe that's generally true, except for
> > OpenWrt. And even there, it's still acceptable to patch the DT source,
> > and I've already done so.)
> >
> > > Though I'd rather the kernel fixup the DT rather than relax the
> > > parsing code for everyone. Then we know what platforms need this and
> > > don't let new ones in.
> >
> > I'm not sure how to parse this. This paragraph sounds like a 3rd option:
> 
> Well, not in the sense of pick one of 3 options. It's another option
> in how to fix the kernel.

Ah, got it. So it's an alternative to #1.

> I think we should fix any .dts files we can
> in addition to fixing the kernel.

OK. I have patches for both, and I'll see about sending them out in the
next day or two.

> > 3. "kernel fixup the DT" -- sound like you want the kernel to identify
> >    these specific /firmware/coreboot structures, and activtly
> >    modify/patch the FDT at runtime
> >
> > Is that an accurate interpretation? If so, that sounds rather novel, and
> > nothing like "both" (#1 + #2 above). It's certainly possible, but seems
> > like a large lift for this particular incompatibility.
> 
> Yes. It's not novel though. The powerpc code is littered with such
> things. Some of them due to the commit in question here. Look at
> commits from me in arch/powerpc.
> 
> I started some common infrastructure to apply fixups, but the case in
> particular that needed it ended up not needing it. So it's something I
> have on a branch somewhere. Also it worked on the unflattened tree as
> not all things need to be fixed up early.

You say it's not novel, but then you say the only existing code is
either:

1) completely different, and only applicable to powerpc or
2) only on your local tree.

That sounds novel to me :)

Anyway, I'm more inclined to lean on my #1 and/or #2 than to write a
whole new fixup layer. But maybe #1 can be replaced in the future if we
come to really want/need a generic fixup layer in the future.

(Frankly, if we do #2, #1 and #3 will probably both be redundant and
unnecessary. I don't know of any case here where we're relying on strict
DTB ABI compatibility with no opportunity to update some of the DTS
sources.)

Brian
