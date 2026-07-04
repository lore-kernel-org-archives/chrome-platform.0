Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D6D2EEE86
	for <chrome-platform@lists.linux.dev>; Sat,  4 Jul 2026 23:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783208664; cv=none; b=EegD/1vT4S4QpkKSPHrhigSxcX8w15m3ATLCyx71PJDiiph5R0Q3+fcKgm98X3zuTjH6FmTx+n+HJ5bhwII9kCK26A4AjsQ7Wi+FZP+IedQtxiR8KED2H2cvT5qZw5sD6KQ3i/Zk1XH3UaLft0dbMWiwHhD1jL0viglUmruwGy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783208664; c=relaxed/simple;
	bh=XIsNZqam6KN+ptafPrdhyS2Xv8HOzf1ASRI1tweH4UI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdStBj20Q1G/aHwBf7H8NkwWNSsxcUdAOYYlZxJBgqNIY7sH/Unwh9fRjPvZDfueX4j9LxoKK+tZ1xi0bquYi4ijhAKmkF1pexXcUYMm/AwN89uEeOiUp0CJlpGQH1eSjpraUH6sY9nQrZCeLMX7S7FuWBR1aCzZV5sQQ72r4H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eoS+ykhW; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eoS+ykhW"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cac59f8b64so19800115ad.0
        for <chrome-platform@lists.linux.dev>; Sat, 04 Jul 2026 16:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783208662; x=1783813462; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ijJ32Xash5Jt49SnX7A5/BLB4XwCy86Iuli9undALZU=;
        b=eoS+ykhWhWuzFpksgkaWlyhkN0UNka01LQ28ZNx6iuBazF6hPw6fM7BzSBKuaEavpE
         9etUk7pYXM0pvT53fsHf5lX99ElTly0DYvblJz4wWaQjrWYIj5CTrIEzxxlhqWTp2bP3
         iaSCaZDjRAtHesR/7WLDrdESuDXOHX92CyYPIkT5LrwzKY4d/+bBKF34GrbnE47FaMqP
         wjY2fiWkGuxRebqvImnrt8d4iC6KVEeoH82mxhdVs2PzEuGfqzUoCZobj5muGlY3Lo8e
         WvX6lwPfeYwcgyDA6o85uNsVecBaTHx1cPleTTeB1N5UoNw5bBS7MMlXUtGhWETbntfV
         2oUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783208662; x=1783813462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ijJ32Xash5Jt49SnX7A5/BLB4XwCy86Iuli9undALZU=;
        b=KVtDUltTXqR9GE3Yc8NGjCMbe3vpouSxLuxQzJo3JbnLQIjTLYCcKCa4w5Q43q3LYz
         GTPFY7LAd3BentyfNSXGaXV9UG083Rth6WJcofQjNRVzo0q68qjdXY34TyyLibGx55A7
         lZsStTeQE/LSk/ijZgIw3ebeTxCQM2O6AcIB7FIxde+dIm+Mz5xqIaNuspVcrwRxVDNF
         42bKPFiJ3S+Z+4qQp53CeS7tijt6UXLugwkN0QGqZM6VuTgAyIjHQCx2qy4jXkNYoaIB
         mFv1e1KPyotNz3GXSDKztRrVC2wT3H6Eq0pdYdX8/oPzEB7pUNOmbeNyfiKqRPMO9Z/y
         Pl9A==
X-Forwarded-Encrypted: i=1; AHgh+RrIifw+RnjQBlXlMllYIR4AwlyfEfyt+qjEQa97xrQLq0RTDliHwDHADDlf/BwdOo8jedfQ/PSKapOePeCxDOs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxjYvEg2QfvIO+Rq5J5IsaUOUVw0zF4BwJvr6HdmV1uu0FZHFH0
	CBB2RWEjfKUfPwgaeoMcjxjkCKAbXan0dsIqv2h3J/RTBk6IIG8uoMaV
X-Gm-Gg: AfdE7ckJ5HzS1b4dpLRBUX5TscV/Ljhs52RLHlx+ggepV3RXsm33WycU/5szZpv6RI1
	Lm/oT6JFsJ+NxuKCW8Ive8GjQVeBv/LisbzC0QIWIq2FigCiLfmc44SrTwU9FCmuJgACLbBDXti
	P40eC66zcTuu8Mql2VBulRSbTV8zhQDrTaxIBQtgu+kENBR5hZDKNz5ZX3YQ/Ya/QDMpa7ytcVy
	Fa5/nHCW/OAOVXYLALNAhBYndawkrKeIzbXYLudu2G25lLwullfc+fZVqueKVXVGNFk2CAJ55bJ
	0Qlgv7tegp6vC3/qUzHnJlz3Wj/PdX5fsZ4K3ZSTDaQ1MdoXjuJbk8+x4Aks2v+h1s0a3KL3QP5
	d4LBXXRLhb6l/dk5rCIh3wwwol/En2uGoUgaZ1p9idj6O4AVSvVMleKIs83XX2ErQxnln+GPpQW
	HG58e6/exdM++SmhPV8XOJqKWHxDlPH96XFjTBTxJvRbKcZ0AIFVvZwJtrmvLIsGzq
X-Received: by 2002:a17:902:db05:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2cbb74ff24dmr43520125ad.12.1783208662110;
        Sat, 04 Jul 2026 16:44:22 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:3f90:534a:314e:e11d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef188sm34410696c88.2.2026.07.04.16.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 16:44:21 -0700 (PDT)
Date: Sat, 4 Jul 2026 16:44:18 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] Input: elan_i2c - Wait for initialization after
 enabling regulator supply
Message-ID: <akmZOC_J2ZTl4zLX@google.com>
References: <20260703115601.1323491-1-wenst@chromium.org>
 <20260703115601.1323491-2-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703115601.1323491-2-wenst@chromium.org>

Hi Chen-Yu,

On Fri, Jul 03, 2026 at 07:55:54PM +0800, Chen-Yu Tsai wrote:
> Elan trackpad controllers require some delay after enabling power to
> the controller for the hardware and firmware to initialize:
> 
>   - 2ms for hardware initialization
>   - 100ms for firmware initialization
> 
> Until then, the hardware will not respond to I2C transfers. This was
> observed on the MT8173 Chromebooks after the regulator supply for the
> trackpad was changed to "not always on".
> 
> Add proper delays after regulator_enable() calls. To avoid impacting
> the boot time of existing devices that have the power rails always on,
> skip the delay if the regulator supply was already enabled. In this
> case the regulator is either always on, was on by default at power up,
> or was left on by some other driver, such as the I2C OF component
> prober. Either way the controller has had ample time to initialize.

Unfortunately we do not know that [it had ample time]. For this code be
reliable we need to record the time at which given regulator was turned
on and then execute/adjust the delay as needed. Until we have it we need
to assume the regulator was enabled at the time of regulator_enable()
call.

I am not concerned with increased boot time too much given the driver is
set up for asynchronous probing.

Thanks.

-- 
Dmitry
