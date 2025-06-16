Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD30B288C9F
	for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 18:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750097282; cv=none; b=Qwo6NNlf6o7BfNidb/ejeB5r+H4J4WIxMa/QkYMX2np3b3lPxhn3DcU6N2hjdgnYAHA0E9Ul6vFgcLn43h8zA3L//FGZL6PLxqK2qBlSunpVGwK/bOP2nMcW8Pzg16GwRuSLzQkhEzXJg88v/m+VfKHVHwqm43eKq4w62POKjPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750097282; c=relaxed/simple;
	bh=6cLdgidlJv6w6KQELlVvmDxiRDMx1k7iQtBaw/5LwaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GjU5q6Zd3QFF2ArGz9X9q7NCvFGYPhJSREPpiCJu1R3Fkz8+LZE/zVo7r2YH3g2jNfX41hvAILlqAhK069XJue4Tp6l2rYO2BYjKvJg2lo28VcLBNwY/VKk3ObfQT8PG9xqTbIN2domYd+CehjI20BHLDua5IOPy5USd0IcOX44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cgZcNbDl; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cgZcNbDl"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-235a3dd4f0dso30830575ad.0
        for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 11:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750097280; x=1750702080; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=19cd+2622jkVW4A8W/znmrcI/n7aq9QpatNtRm/ZHls=;
        b=cgZcNbDl6VvYZuz3TAvJAyx6OpQuBHk3GAcL/swNRa6EF9zcHyHvTYA/mT1NGzyhgk
         WyuoB5wYVfxlddPtlEj5x56J71cOaIUuqDpuwXiK/ykpjhxGSphw/zpvNVn4L44Re/hH
         TDGD9cXJwo8LqNWoVUKSRPDD2xtZhL7JBjydo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750097280; x=1750702080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19cd+2622jkVW4A8W/znmrcI/n7aq9QpatNtRm/ZHls=;
        b=tul67bSgIfizqVdbopbGEv4xSZCHLDWnHEsY6K/bwKVPwjPJXC7tAcNzMoameY3FUK
         pidcSFosTvBm3QVfji+Ko/IhwQf8JCP0/0SI6+duTxpun1hk2IMAfEu/gw3tCjyG2nbi
         GJWmg/rQ478b/Wt4vhjrZYHAgAGuE4IBeI6QugW5z0eCCTz6gu4iTe/sQQrm72R9tyyM
         EzRV1M1FmR/qVRlOTgwVdiVJF35b8Rl2LS4cVWhGADAxa9B1HD6eT9a52BnH/gc41Aje
         YLueH6RhbRt1eVNR682ix4nl1ZRmB4GufHo2Xh8+TdgnveuxqxXsG5IrrBQjamGWhInh
         AvFw==
X-Forwarded-Encrypted: i=1; AJvYcCXjRf3H7O2xO86jfBQvWcbJJ0MLj18X8CDaTFV5WXyG6Hz411FX7GBnqiXVeihGe9fe2jytaKnkG/O6kcfZoks=@lists.linux.dev
X-Gm-Message-State: AOJu0Yze4or/1R0s4fVFxCmvqrpBl2ZjyzSAK6n0mgl5KUW2CxsxDXPi
	wWtBVDBNHJBXH8cwc1Y1oHEp+YsvdOIW0Ktb3/yW7iDnMdJVMo7C4pYTBGWu06cWlQ==
X-Gm-Gg: ASbGncsf6iU9j7kSnbd3Kfm9o6l0ARvb9wP6G1OVEIpo8y2F/mhPQhKFg+WtglF8+bP
	RHEc+KEdMOV6o/WOTR7WZcvhep+ex5KvDdu7X5RKhxSuKT3haNV9mL+QV5P5GRS1omdI7440Rsq
	liqgF0Ay+32OwLcLk2kJ/SLPqM9rNSqZjbRX9AMSENkAHze+VCukBXxYwKzlvf7nQQ13nXzQ+Gr
	JTrFeNF1R3UrtVpAdsVgKsTrS7z4r/9BBRkO0WXCGFfizT+c0G73E6ezvINlq4/lv9Yd7SyHkVv
	4jtC5yFauX/IQo4SyY3TuBJQsp+PDBL+u7opgvMfOY6UV/3TWEyV8naBT/SVZ7ZPzJwSeoGy694
	UEsbPI+MhEHVv92KNRgPj1C4=
X-Google-Smtp-Source: AGHT+IF9wOdbzTX5SenKvPHOb9O6Gh1k3ujxoM4nMHpO2ER/DcWiRytNzZjlYy7IS2Qj18nFSYbPLA==
X-Received: by 2002:a17:903:2ac7:b0:22e:421b:49b1 with SMTP id d9443c01a7336-2366b14a654mr163999985ad.48.1750097279978;
        Mon, 16 Jun 2025 11:07:59 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:89ef:e9ef:a9e:d5b3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365e0d1444sm64124785ad.256.2025.06.16.11.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 11:07:59 -0700 (PDT)
Date: Mon, 16 Jun 2025 11:07:57 -0700
From: Brian Norris <briannorris@chromium.org>
To: Michal Gorlas <michal.gorlas@9elements.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Julius Werner <jwerner@chromium.org>, marcello.bauer@9elements.com,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] firmware: coreboot: loader for Linux-owned SMI
 handler
Message-ID: <aFBdfckccRv7Pbc6@google.com>
References: <cover.1749734094.git.michal.gorlas@9elements.com>
 <6cfb5bae79c153c54da298c396adb8a28b5e785a.1749734094.git.michal.gorlas@9elements.com>
 <aEtW3e7mwjTTvfO9@google.com>
 <aE1yNZ484DcWjR4h@cyber-t14sg4>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aE1yNZ484DcWjR4h@cyber-t14sg4>

On Sat, Jun 14, 2025 at 02:59:33PM +0200, Michal Gorlas wrote:
> On Thu, Jun 12, 2025 at 03:38:21PM -0700, Brian Norris wrote:
> > > +	mdelay(100);
> > 
> > Why the delay? At least use a comment to tell us. And if it's really
> > needed, use msleep(), not mdelay(). scripts/checkpatch.pl should have
> > warned you. And, please use scripts/checkpatch.pl if you aren't already
> > ;)
> > 
> 
> Long story short, SMIs on real hardware like to take longer from time to
> time, and the delay was a "safeguard". It is probably not the proper way
> to handle it, but locking here was not helpful at all, lock was released
> regardless of CPU being still in SMM context (I assume due to SMIs being
> invisible to whatever runs in ring-0). Have to admit though, that 100ms
> is a consequence of trial and error. I would actually use some on advice
> how to handle this properly.

Sorry, I don't have any advice here at the moment.

> scripts/checkpatch.pl was not complaining
> about it. It only gave me:
> 
> WARNING: quoted string split across lines
> #57: FILE: drivers/firmware/google/mm_loader.c:57:
> +		     ".return_not_changed:"
> +		     "movq	%%rcx, %[status]\n\t"
> 
> total: 0 errors, 1 warnings, 0 checks, 186 lines checked

I must have either misread or misremembered checkpatch's behavior.
Possibly both. It has various other delay-realted warnings that point
you at the kerneldoc comments for mdelay() and msleep() though, and the
mdelay() comments say:

 * Please double check, whether mdelay() is the right way to go or whether a
 * refactoring of the code is the better variant to be able to use msleep()
 * instead.

Brian
