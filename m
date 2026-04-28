Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5056235A952
	for <chrome-platform@lists.linux.dev>; Tue, 28 Apr 2026 20:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777407666; cv=none; b=G2NJlNPzhGoBPS6PzVNUd0oaoe87BATT9YwqJQNi/gGnfaSS7Liv4BuANwjkSnHzOKRhVDtwK8Q9SABGoF5p52nKiVAiZfewN1dv9rAulSUF/98vcFhOU+u+b48tvULqgCObsLNffPv4XSm2ODgoue3OzXuShXhZbKA821TyzQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777407666; c=relaxed/simple;
	bh=b3y0XwETp/+cTkGRrG43RAGkVJDpjROsO7uB28sz0+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3J/DBxfCDFzMhTNrIdHAEVPE6q1RifeNFD96NYGK8Eu9FGo7ns2UHlbdauqKE3f6Cdqgq0OBTDqlcXFQ+QJhgmPRL9Pki6aP+guqNU7a+qpTzfhOw8S1KnkvCg+7NDw23ELmlqEuB6NP8oApZbWbROkJOGNZijL+pKz5C00ZRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NcLAuzRA; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NcLAuzRA"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12c45281a06so16339111c88.1
        for <chrome-platform@lists.linux.dev>; Tue, 28 Apr 2026 13:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777407663; x=1778012463; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wAYKdy6rZGHPp+6vTJbxhAN2mtySYtF/dy0uwVb4Go4=;
        b=NcLAuzRACABpYgwE1KydsqAejVYWEGMbOcLr3JFg4m5sm/BKXvZgaRlDEl2Amnh2Xl
         N/vbArml8T1zVppKUTK4+aRz6UrXXXXnyPZK+H6KBYwLCuUhkas/VL5raB371ZfWpNiR
         Xd802Ms7D4xrN+RsanDdHrDrNeMp3+37AXe7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777407663; x=1778012463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAYKdy6rZGHPp+6vTJbxhAN2mtySYtF/dy0uwVb4Go4=;
        b=TYwphExAS9n5H8IT/jZeci4yZHWRzfOf4PKCGyOfhlqRaLW0QFKe1iFob65VVAnXQp
         WvPFCoaEYJ3Elv9f5jyowzu4tWmxf8y1k9Hu0MDdQ3EXie3YqZJeYJlWaIZUAQR5KVqV
         ysjekze9SVZrDuiRAJr/zzEJpgROygVusOsuAFyCbj2CIPVVOrYFv7lXCL8sI6ar0td/
         yQ6iIJONJ+9o+MJrmP7OmwAb5jc/bS/+UMZHGtfMUja7B3xGaQiJoT6aVDw9AryVIGCV
         toWho6juAU0KrPpZj4hKwYYJV8E+wPW6HC+yIyB8I5q5JxNm/ZjyV0t4F4zjMHFVpueH
         COEg==
X-Forwarded-Encrypted: i=1; AFNElJ9oHGljw27JeH7XUHjH5zoepxyfzt/SH5b/L4q30LRlcmviT3NEzuAZIe2S0x2OzX9SF3ywrDn5d/46uMVbGWQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw45ltmzNArIsxtlqRLWW2ytFEv96l+nuukyn7JGhgKzrjDZuKz
	BYaneaC26mxs8KGdlwW/Qxqf4RVlY7HEWO9xrqpPTjd3RecLawNZoYFMZ6fhgqGb/w==
X-Gm-Gg: AeBDieuzvYCRo8vSEhH7mSiNkQqIS5JvivIOM+uPVfizmnx9fTsjbuvOFOSkGziGXvR
	GK7bA+bIaCeH97IFnBlWLYXvbXUppvh+PrEZWBanWQ7ob4N5+4kJOmGoR3eM/gcEB6fmOwb0GaR
	iJ3gLnm5If8aPy+IZIk5J7WXBmLqV41a6d7tLTcVbGOuRE5Kg9i3apXICFOqQRZ5nR0QhrtE6yN
	pT771RKBTUEdoce5DRcibwWJvznQsJyV/6WsfGVPmKbldrwZt2RAPv3WPVsFUXw/AK2IrR05M2U
	Nru4fmjxecLbut1TwMkqVbL4U6WmLv8MwkYoTiy9OD4Mw2tEJjTGVU66IenbFtAIV9ZlOrVeBDt
	+5NghFAaFWcWXXMnjVvH/eRrESkg8gGtJ0kqzALyk+NdVkBSZJW2+xaHyc6uS/VdPEUI8NWX+Il
	BDADSU5w2lm6XbOD1Ktk0Fa1C0Xv5FWh/yXw6PEJGJAAkKaULstdIOu3rUYkSghMpHSG+56SDKb
	rrY0fmH+iQ=
X-Received: by 2002:a05:7022:6607:b0:128:d967:4678 with SMTP id a92af1059eb24-12ddd99c410mr1729142c88.23.1777407663085;
        Tue, 28 Apr 2026 13:21:03 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-12ddd933044sm2821511c88.5.2026.04.28.13.21.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:21:02 -0700 (PDT)
Date: Tue, 28 Apr 2026 13:21:00 -0700
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
Message-ID: <afEWrApcO-SRP5Th@google.com>
References: <e77669ea-9edd-4321-8d17-4da40161b59d@linaro.org>
 <Z0R6myuCR4Jpmc_y@sashalap>
 <CAL_Jsq+QBweDZ+1=FXq7Hez=+mhiOxOvurr3rP0+3y_FCd49Ew@mail.gmail.com>
 <20241209092809.GA3246424@google.com>
 <aeKlYzTiL0OB1y3g@google.com>
 <CAL_Jsq+UCYbKMXG5m8BRNVRA_03Ki8aGF0uoaDs8HHvOSCZ2Mg@mail.gmail.com>
 <aeaTSYyaqQjuP29U@google.com>
 <CAL_Jsq+qmHV8VJ1J61nUupNBZSQrqzwCV3oOjkeqc0VFBt2aDQ@mail.gmail.com>
 <aeaussSE6_TN7xk4@google.com>
 <20260421193038.GA1502234-robh@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421193038.GA1502234-robh@kernel.org>

Hi Rob,

Thanks for your thoughts. I delayed a bit since I wasn't really sure
what the right conclusion was and wanted to give it some thought.

On Tue, Apr 21, 2026 at 02:30:38PM -0500, Rob Herring wrote:
> On Mon, Apr 20, 2026 at 03:54:42PM -0700, Brian Norris wrote:
> > You say it's not novel, but then you say the only existing code is
> > either:
> > 
> > 1) completely different, and only applicable to powerpc or
> > 2) only on your local tree.
> > 
> > That sounds novel to me :)
> > 
> > Anyway, I'm more inclined to lean on my #1 and/or #2 than to write a
> > whole new fixup layer. But maybe #1 can be replaced in the future if we
> > come to really want/need a generic fixup layer in the future.
> 
> The problem with #1 is a) new platforms can then repeat the same mistake 
> and b) we'll forget what platforms needed some work-around and whether 
> we still need to maintain such a work-around. Well, I might not forget, 
> but the next DT maintainer (applications welcome!) even won't know. For 
> example, I have know clue if we still need to carry some of the 
> work-arounds embedded into the interrupt parsing code. That all 
> predates me. The only way I find out is breaking them (I'll never 
> understand why people still run PowerMacs from the 1990s).

Ack to most of this. I'll note that it's possible to write unit tests
for this, if we go for the in-kernel route though, so hopefully that'd
give maintainers a bit more visibility.

> Calling the fixup code a layer is an exageration. It's on my kernel.org 
> tree in the dt/fixup-infrastruct branch. And look, guess what issue it 
> was that it has a fixup for.

OK! I spoke in ignorance then. I really haven't explored the device tree
construction / unflattening logic, so it was new to me.

If it really comes to patching the kernel itself, I'll consider pulling
in your patch. On first glance, it looks good, and not that complex even
to an outsider like me.

> > (Frankly, if we do #2, #1 and #3 will probably both be redundant and
> > unnecessary. I don't know of any case here where we're relying on strict
> > DTB ABI compatibility with no opportunity to update some of the DTS
> > sources.)
> 
> Shrug. I thought the ABI was a concern here. It's ultimately up to the 
> maintainers and users of a given platform whether or not they care about 
> the ABI.

I'm usually on the receiving end of people complaining about ABI. It
seems like we bend over backwards in a lot of places (drivers, driver
frameworks) to maintain some idea of DTB ABI, while in practice, the ABI
is almost never a strict concern for anything I've dealt with -- 98% of
the DTB is generated from in-kernel DTS sources that match the kernel.

($subject case is actually the closest we get to DTB ABI concerns,
because it involves the small part of the DTB that is generated by a
program that is independent from the kernel tree. But even there, it's
possible to fix the issue in the kernel-provided source.)

So it seems to me like maybe it's best to just ignore the ABI concern,
patch the DTS and call it a day. I've done that here:

  https://lore.kernel.org/all/20260428200712.2660635-1-briannorris@chromium.org/
  [PATCH 0/7] dts: Add /firmware/#{address,size}-cells to Chromium-based DTs

If someone finds reason we should still go back to fix the kernel
itself, I can resurrect the fixup logic in addition.

Thanks,
Brian
