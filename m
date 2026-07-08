Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563B14C8FF7
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jul 2026 17:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783530796; cv=none; b=hyR/NSbVOge8JtLyYloA3+zuF2cdmyrIkpsFrQakbr4TNScAEmElGuXYZoXRMoSwa2KHMMuFAR8Q1EbHONE89jcBQ4a0Kw7SCffNr0s7l82fdcJopwoIljr0HQRDwHHCMwJsrBPkMgMHnX2Ki40a7iJy0qfeQalQ3r8Ev5t+hDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783530796; c=relaxed/simple;
	bh=zfmAyoMMb2wOrJd1JOChx63QvBzEFg9LxEcj6r2lKq0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=d5XoBDnrgrHOWgpJ16IS2VvOsoShPVgiA9PthevY7CeyljMzdxq8FwNE4A5nGmwZhe2lUc/aLeQ8IKPnpDegR5KN0i+SCnZplWogW8gOlJaXEE+BfNtyJ9Z4/tNfb/YaxCu6Au3SChCKDkYiq4JiBT1n7ngmPXrCq7ETWebkhKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NULni/6N; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NULni/6N"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B8CC41A0E9F;
	Wed,  8 Jul 2026 17:13:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 79AB260339;
	Wed,  8 Jul 2026 17:13:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 537A811BC19AE;
	Wed,  8 Jul 2026 19:12:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783530790; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zfmAyoMMb2wOrJd1JOChx63QvBzEFg9LxEcj6r2lKq0=;
	b=NULni/6NFJ20KXh/pLbAeGrodYIPFdy8eBKw/RzQ8jTjYVIOvQUspy5qI1oy+zxGvEH+zJ
	WvoEK/O51fn4m48VZqqjYI81CQOxKWiScZbhJgJK2YVbNsZS1VGyuYZaMx3SLmnfr6jQoI
	YR2AKo/UgzIYjSUwzS3rpj+IKjb2Q+LhZ7cuFyaUM6XIR+e8wEmd4HbVythE68S0mmv3Cs
	j3oVLe6v+J9QSUhcNCD7mRipL0D8vtu88BOWe2ZQTs+kPxWTy/tKTtUto+VyBJhtPXpxqr
	+JFdA0Avyf2sOR23P7FkAyhriBrPYmbpdEOaTOxocTMTFz9QJqO1ky88LwxwQA==
Date: Wed, 08 Jul 2026 19:12:56 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, Joshua Peisach <jpeisach@ubuntu.com>,
 Sasha Finkelstein <k@chaosmail.tech>, Janne Grunau <j@jannau.net>,
 asahi@lists.linux.dev, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Ian Ray <ian.ray@gehealthcare.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Russell King <linux@armlinux.org.uk>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>
Subject: Re: [PATCH v2 00/37] drm/bridge: Convert all bridges to atomic
User-Agent: K-9 Mail for Android
In-Reply-To: <20260707-drm-all-atomic-bridges-v2-0-21d03cbca446@kernel.org>
References: <20260707-drm-all-atomic-bridges-v2-0-21d03cbca446@kernel.org>
Message-ID: <CB4505B9-E9E5-402D-B5A6-A72395D2E5E9@bootlin.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3



Il 7 luglio 2026 17:11:07 CEST, Maxime Ripard <mripard@kernel=2Eorg> ha sc=
ritto:
>Hi,
>
>Over the years, most of the bridges have been converted to atomic
>modesetting and hooks, but not all of them=2E This forces us to maintain
>two different code path in quite a few places, which is pretty
>bothersome=2E The switch to atomic modesetting for legacy bridges though
>is pretty trivial, and we don't have a lot of drivers still using the
>legacy path=2E
>
>This series converts all bridges to atomic modesetting and drops the
>legacy codepaths where relevant=2E
>
>Let me know what you think,
>Maxime
>
>Signed-off-by: Maxime Ripard <mripard@kernel=2Eorg>

I'm out of office so I'm afraid I can only reply from mobile, but I review=
ed the series on a real laptop:

Reviewed-by: Luca Ceresoli <luca=2Eceresoli@bootlin=2Ecom>

Luca
