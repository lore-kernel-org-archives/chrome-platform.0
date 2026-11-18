Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.154.119.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036259;
	b=OCzDhqC+F/TSp8n0/c87VrK3DhE0nRnbQKc0buD2VtzSPUx/bSqLTFQy3GJSBgXyiUxK
	 r1bBiFrGXTxkRQFnexjmnKMkAJSYZ9hvWv8JTSfH4P4eV5AO5mCmM2aGxNgVxrxz49fL2
	 AJAc5NuXkRPX2UUQP7bIBciDPjHROSzH9WRjm85wGPkLSMJ96lqn3VFztbcv02vsWam7I
	 XfV6M07TXCvZCUJws6/ZH2U2HveU/EyAesOn5RnoBHoeb7898uWv1GVrl5CS8viIJFfgV
	 fprElAp6AqqsjjRJv2ogT9jiyKAl7oUV/MfiMD1n+k+ghOKlCKVU2Tv/sGuSKCVdSXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036259;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent;
	bh=tIKDVSjVcHAwPM4Udn/N9uTGDPYtfcGsqelMKv/u8Vw=;
	b=QQeQZQ8NaOXFkuSlOCoJwKufXa44Sqitd0H2uMZpsqz0iGP5P1GHFMkp0JU+C07QXYhG
	 VUwnFzjqSa9JpxkBOf01Gqg/hRUy8CV5HKQAPpz4vIOy1zYsrgf+L1oXG9Ghpm/p1Tpnn
	 7h8eQmJGaKTnoZtDrcBKl4HAMjEb4x9NaMxhe7wzR0QDMr8qP7fhSAzdiVP6dqns3QEVn
	 DR5xBXPgYC1nwpk0bmQUE5WMJtY6A5mmI5X7fC9c7ADl/F+IB6t9hqSI94LKCtc9osVfs
	 lqo+3OzDKJGXfLjUPvO654rQ+4fH4Rw+tzonSOYsfGA5M9MFqeF4NQE2p9avUjE5O5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aurel32.net;
	spf=pass smtp.mailfrom=aurel32.net;
	dkim=pass header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=YMwfenKF;
	arc=none smtp.remote-ip=195.154.119.183
Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C1A606A32C;
	Wed, 18 Nov 2026 21:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8C1A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=YMwfenKF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=tIKDVSjVcHAwPM4Udn/N9uTGDPYtfcGsqelMKv/u8Vw=; b=YMwfenKFu77Rd4cA50Ct4iw/xK
	+YUal108UpuW7zj8Ytkx7sxnfwT9P/GPoDsTDnNRgGysory7cLx829c4tlj8lUvBJ8a114rtvkZ+l
	aEgauDnKaKDcWfZt8WRyRuJyvGccC2GgEH35dI9hiWNqk2VxjIOOiDQ6lGOBHiRDAC7DqFfVPgrK3
	cjJ/qSKM8G0FqFda/sKjhmBNbBG5yAP2KaFU1EEFglmpdlDn4DK9XZHILHYUvHcptdyYfyhGewxTL
	sysJ4pUIxw9tOdKTuxo5WGfzysSwbAEJTsWYOr7lm1EcRX6weP1/daTWtZhfnxbMxQsKYFN0Uirr7
	Z9CQDg5w==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xTmvU-00000000TjL-0wR2;
	Wed, 18 Nov 2026 22:10:44 +0100
Date: Wed, 18 Nov 2026 22:10:43 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Wang Yang <yang.wang@deepcomputing.io>
Cc: Yixun Lan <dlan@kernel.org>, Benson Leung <bleung@chromium.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Sandie Cao <sandie.cao@deepcomputing.io>,
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] bus: Add SpacemiT K3 eSPI controller support
Message-ID: <av4UUyCtDBJNU0h5@aurel32.net>
Mail-Followup-To: Wang Yang <yang.wang@deepcomputing.io>,
	Yixun Lan <dlan@kernel.org>, Benson Leung <bleung@chromium.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Sandie Cao <sandie.cao@deepcomputing.io>,
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
 <20261118085742.1817536-4-yang.wang@deepcomputing.io>
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
In-Reply-To: <20261118085742.1817536-4-yang.wang@deepcomputing.io>
User-Agent: Mutt/2.4.1 (2026-07-04)

Hi,

On 2026-11-18 16:57, Wang Yang wrote:
> Initialize and recover the K3 eSPI peripheral channel before populating
> its children. Keep controller register programming, clock and reset
> handling in the controller driver rather than in the EC transport.
> 
> Port the existing vendor-derived implementation separately from the EC
> client. The controller logic comes from the vendor BSP at revision
> 29b78afb484b, authored by goumin <min.gou@spacemit.com>. Preserve its
> register programming and link-recovery behavior.
> 
> No matching SpacemiT eSPI submission was found in the archived SPI,
> RISC-V and Chrome platform searches used for this port.

While this is correct, please note that there was a try from AMD to 
define a eSPI bus framework back in August [1]. However I haven't 
spotted any further progress.

Anyway thanks for your work, I guess this can also be useful for the EC 
controller on the K3 Pico-ITX boards, which drives among other things 
the fan PWM.

Regards
Aurelien

[1] https://lore.kernel.org/all/20260804115259.4065638-1-krishnamoorthi.m@amd.com/

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
