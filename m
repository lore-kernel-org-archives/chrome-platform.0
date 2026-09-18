Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86374A8FD3
	for <chrome-platform@lists.linux.dev>; Fri, 18 Sep 2026 08:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719849; cv=none; b=kJxwzShXVbvzEIrw1pXWLfnMLlSluTTnAG6WCN3F+fYKLafZC+Z+CmFiLuxDSe5BbIM38/wgUVVhAqUzDHvo9KFPS3x4pOR8tLjaP9NgqhYecY8W4Jz9Vxa5hby2OL6HFHg+WVWiwIDj2dsRSTjKIsITHQloDVWFkIvKvfCy/5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719849; c=relaxed/simple;
	bh=0ORtPf5rfrOcpgyi/FO05MAHQySi4ZeH+yKwjJ5NuVg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t0TbBVNStekREDm5TwIXFbT6BczN6rBUuVTDwja7/gRi+44Yo+nHe+2fAL4GkXcrYlDmblVX38qaPcWBKWHKpm+RoNss3eBJYogeT2Ab2iU+Obhy4o2erJGODYLS+T3JUJxUqlXFB4RmoIu5FnhE/yaU94m9Fme4GJrJvSISl/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tt4q5Ipq; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tt4q5Ipq"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa4c24cso69026266b.2
        for <chrome-platform@lists.linux.dev>; Fri, 18 Sep 2026 01:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789719846; x=1790324646; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0ORtPf5rfrOcpgyi/FO05MAHQySi4ZeH+yKwjJ5NuVg=;
        b=tt4q5IpqIpSKkNViOOrWauzHOXWBCWlKikFlDaKHaMzHj3qn+d9bdCqLhRJHZwE3KA
         FGwmiYXdxLKJgU5/lH3K/gJM2bAAnubfBKNARJ2OYUVbBaq0h6ZNs3Pn7J7zQfBUPhbb
         9PhhHNdIAIPvjJXhLJ8Diu87ewzJ+8WZDIyH8ofMqvJQcOZEr6DcIrCyF0S9mU4ZutG5
         JZCGmOdnNXESrZ7Axhz+4+y1P0FpFtsUPptelX/fExlVLcpt+0RDu21BdlUUqz4lC0pT
         Rp/Csx79ANQz+Ag+cU7mgcyQSDFlMUJlv+59eX0iLNi+nWKzuElnId7XPcAtkeSvrM2v
         ML3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719846; x=1790324646;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ORtPf5rfrOcpgyi/FO05MAHQySi4ZeH+yKwjJ5NuVg=;
        b=zLWoyir5ug4RAkTPM0w9V0ZKvhnT2bdsble9dys9ZzNt3OZyvOxRNaWYftw+Rpl2b2
         Q4k9NH0eZZSHozcjlswPcgBRjw96mRddZzgs+f5Zx+gZtc7Bo65ZddEjRmvQhsuY3Ncz
         pEHgnlAyjYyzuU2oRDD2WtjThTc22WNXfbzZx/FMA4ZOi4PxU6gV4fUjrGLdRgDxrzzu
         Wnyfi+2xLwGYbMppD83304meWhZIWCLkvZDgJ0lKOoYpP1qPjvRjlKoQfb/SOkfCwEQp
         hrkiCsvhXkmlPt7tLXaZTuVe8VmxPpgpZmodwjoYQdreTw6EwPekAJGOcb7h8P/jWqvc
         QUug==
X-Forwarded-Encrypted: i=1; AKwUvBz+DrSXsfgMhekUlTqJVLIgg3aEDZ+P3GbzcuUcBsqObR0jXc2zT8rGY9UXX0wzXIxU1ewnSOf6qTByC//J770=@lists.linux.dev
X-Gm-Message-State: AFuF++ky+Acef1a5auixZWizENWXOcKuMBRoouJZORgZj3KlMh8hhvV+
	Fo5I9HVFT98dM37MhM07pUvpnMEf5+YyszCVL2KoT5IzWtbCtLmGszpvykTEPXDrzMk=
X-Gm-Gg: AYBFou1iA6kBQpFPbYIPaq0A1VVFxT6yPQsuqdYRKgJJ+8Aw5ceI7XnaNFwtuwY60Fv
	6u4TjltsqiE3hylJq9auTJx2Nuen1nHcV3KDIZlpSalNwAEqPEuDloQhED0pLdO43ZSmi9fIG8u
	lVfapXoS4ypxGSa7BnCs0wp7F0xmQmhv79ag/pvwBD6O1+t0MU+Xqu8CEcz5iPEUTUFI5soUGWq
	LGZoyx658h5iF3161Mg7FWE16V8R2103fkBHtvulnO+S/4vTeIyNyK8xzAv8LFt2u/a2j+YAORD
	qAuLGdVqQi6ESXnXaXRKIX0Q64kMikBNmnv+C0m7+30z8XhkxGMrnelQThA7qZvGsVJdgrZBE7T
	HKR9wDIAaZT8QbJQStDvF19eRy9YFLDXuWd6wJ13FPbBkZGC99PNCSA0OxofvpLC7CpY3NF0ud4
	BwDocm8n3LAOmrE3w1daFV5tG/b4Q0IXF/sjD6+nmZeHOaNjJfQ0PMkqF/Zz6tWHNKAXY2hfCJq
	Hc=
X-Received: by 2002:a17:907:72c7:b0:c26:3190:296b with SMTP id a640c23a62f3a-c2a15e7df89mr192409366b.48.1789719845848;
        Fri, 18 Sep 2026 01:24:05 -0700 (PDT)
Received: from draszik.lan ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc6aafsm33384266b.51.2026.09.18.01.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:24:05 -0700 (PDT)
Message-ID: <b567cb05cf1508be7474e2874d267d8e8a09e49c.camel@linaro.org>
Subject: Re: [PATCH] dt-bindings: Expand flow lists to block lists
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Daniel Matyas <matyasdaniel006@gmail.com>, Lee Jones <lee@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Liang Yang <liang.yang@amlogic.com>, Miquel
 Raynal	 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman	 <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller"	 <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski	 <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Bjorn Helgaas	 <bhelgaas@google.com>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=	
 <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Ray Jui	
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Will
 Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,  Vinod Koul
 <vkoul@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, Jonathan
 Hunter	 <jonathanh@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown	 <broonie@kernel.org>
Cc: Jose Abreu <joabreu@synopsys.com>, Ray Jui <ray.jui@broadcom.com>, Scott
 Branden <scott.branden@broadcom.com>, Atish Patra <atishp@rivosinc.com>,
 Shawn Guo	 <shawn.guo@linaro.org>, Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding	 <thierry.reding@gmail.com>, Ibrahim Tilki
 <Ibrahim.Tilki@analog.com>, Okan Sahin <Okan.Sahin@analog.com>,
 devicetree@vger.kernel.org, Paul Walmsley	 <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley	 <conor@kernel.org>,
 linux-rtc@vger.kernel.org, Ricard Wanderlof <ricardw@axis.com>, 
	patches@opensource.cirrus.com, Lukas Wunner <lukas@wunner.de>, Chunfeng Yun
	 <chunfeng.yun@mediatek.com>, Eugen Hristev <ehristev@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux@analog.com, linux-input@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-riscv@lists.infradead.org
Date: Fri, 18 Sep 2026 09:25:27 +0100
In-Reply-To: <20260917144028.459053-1-matyasdaniel006@gmail.com>
References: <20260917144028.459053-1-matyasdaniel006@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2026-09-17 at 17:40 +0300, Daniel Matyas wrote:
> Running dt_bindings_check returned:
> [error] string value is redundantly quoted with any quotes (quoted-string=
s)
>=20
> The files used quotation marks in flow lists because the strings had
> commas and these commas were interpreted as separators. Convert flow
> style lists to block style lists, so that there is no problems with the
> commas.
>=20
> Signed-off-by: Daniel Matyas <matyasdaniel006@gmail.com>
> ---

Acked-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
