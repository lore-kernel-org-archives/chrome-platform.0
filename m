Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5D925DAFB
	for <chrome-platform@lists.linux.dev>; Wed, 30 Apr 2025 15:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746028327; cv=none; b=jgFdAVXgiEkaLjlMgkUe3BsLd+PCbw9x0miwqoDCsbbmEWSR5X21S/oQWKNhaQLG9BiK3+b1JyTYlNEjTfENNJrMRt5KtNQrSFAA/S3kr25oPFmqO2xtuM/42EMvL9LIyY1osmcqCQzS7J4JiMw5BI8RogYc5q/m/ZReOniBf9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746028327; c=relaxed/simple;
	bh=9LtmMorPZzn1CDLSUkR5sDQj/vapTL2vnbBygv/Tdmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ALSFamAjyv+ExgCw81K29zxxNOIP1/2mDXIkPvZ/ZzCoiLNUCJd4fW5pyEtL5lYggkksQRIT9ySTQs59XMqOoM+HU42+QESkcuHGgcC/6s/TrtB55ZaGIyMbs4mT4gay93OBAF4UPL5dl5nP/u11fJLs59AyTbune8EjF4PexE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R5Ts7Bbs; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R5Ts7Bbs"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22423adf751so76305385ad.2
        for <chrome-platform@lists.linux.dev>; Wed, 30 Apr 2025 08:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746028325; x=1746633125; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LtmMorPZzn1CDLSUkR5sDQj/vapTL2vnbBygv/Tdmw=;
        b=R5Ts7Bbs5fvJhGf0cY7fooFMf2kcjZw8+bNOy3HftA5qmX203zimc2Yuxj4VHzZ+xq
         8sf6K6fsl5e3Y43qsAQTupJcLTJ83B5j2q9xTGQdYixzOWOSK9G33+g77W66W5AIfIpT
         LAbVih9nwudoJj6cRGI0HLaipmQix/Dn/kL7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746028325; x=1746633125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9LtmMorPZzn1CDLSUkR5sDQj/vapTL2vnbBygv/Tdmw=;
        b=ns22RQiRJnv7FnEufPyUXm2vEVAlT8t701O0+TdsR0MaNeCnsFeVXxO82GV1tnN+zT
         JlnlkCLWxDo7m6oaMVkzXqdO/QCYDh+hFIj9xijhWSvpN14Avc/PNIlmTkq7kNGv1q4J
         I/rvAyk51vYjo0MQAO5HvZ+doucak6YT0g+jo9pS4VJkTPCiS0o/De6bQuEPpmZwEi9y
         XLcgWFYh/4uG/1RGfNjnBC9eJgsnEtJFXK4gYaN66J6hhTl11pqAawbMtcgEo5YnduSe
         +IYY1SOeJdbJpNBSrYlVdxnXHUtFBY59mwpf+5A+OnXFPTqn4PPjI+oZvNhOX20b3oZB
         plCw==
X-Forwarded-Encrypted: i=1; AJvYcCU5DvOp0O8gbBMfXWFLvvO2s5ZQ1EeRXspJegx2HratuWSX+pJbByh7jkIHGG0l3M0HYdpPcUyMMVFCHYR690Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKC2u9DRiWz6KnsXoJ4bgc+gdrbL3MYqySF7Bbq0EfAJfaQqNj
	rMLE5zV840h1EHR/GJDnOedHG1JlKDbXUz7zAXB3rMPplrRbkgNuJ5s5Uu5eJ/ck3jMtsHzuAtg
	=
X-Gm-Gg: ASbGncuvBRoeSleK5sU6ErymBkqA2dj4Y93UgT5ZpUm//zZC07GIe6DgAz+svh6k58M
	uN4XzNpaP10PsSS4zB1kSjliO6ZwA6DtXeGMrE6p9kt3w+NliBlyNCR6gUCRYBSFmytI18EwDic
	oIyF4J5eamKpwWhLXLA4663Qiggfy/UYmX8gUEj0qS02xU+GnYeOG0v4kRfcuCzSWBj6MHbwc4X
	JVmDXXMsZvyUmgc6h1ZlncXpeANZBpkua2WHIEi6COw08lvklhlRY/6OFF0aw1XQX8L6zRnEEVD
	HQlgZmUZki/NgodpDRKtKSdagysF9zL4zINpNxVABWJ43NdJgBKm4k3L6BO5zBgsEXwNLRDV0uZ
	cy28B
X-Google-Smtp-Source: AGHT+IHXpSN+bOKUsSu1XQ1w9FAEqhjY1hjEePwSGeR55oR0t8DOfJ4hmPBx05XHfqXb2xGVGw4Ykg==
X-Received: by 2002:a17:903:144f:b0:220:fce7:d3a6 with SMTP id d9443c01a7336-22df3508d30mr61265675ad.23.1746028325108;
        Wed, 30 Apr 2025 08:52:05 -0700 (PDT)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com. [209.85.216.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22dc5a696a0sm92228365ad.131.2025.04.30.08.52.04
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 08:52:04 -0700 (PDT)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-30155bbbed9so58371a91.1
        for <chrome-platform@lists.linux.dev>; Wed, 30 Apr 2025 08:52:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMLWrseCezHqnmSB6juqu1fOl/0pvl6Q/Qrt9hUuk8sXygcZqBoQ1y8/W2kMPHybZHR2jiChF91Uo77nsd2js=@lists.linux.dev
X-Received: by 2002:a17:90b:17d0:b0:2ee:d371:3227 with SMTP id
 98e67ed59e1d1-30a3330bd2amr6121407a91.17.1746028323966; Wed, 30 Apr 2025
 08:52:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
 <CAD=FV=VmV5yb0HWWGTiKyyC8+WNPJpM7vE9PQGh5_=KPk6+HCg@mail.gmail.com> <20250430123557.3d8b1de4@booty>
In-Reply-To: <20250430123557.3d8b1de4@booty>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Apr 2025 08:51:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UBFhCGOUuwtCtdT75nCu_7EzM-SVY-=6Xh6UxUuxKCMw@mail.gmail.com>
X-Gm-Features: ATxdqUFfYEEYqvpO67K1TXBYapYURxE3d7Z_gt9FzIWHk5tUMzE1QBIfnvJL-xI
Message-ID: <CAD=FV=UBFhCGOUuwtCtdT75nCu_7EzM-SVY-=6Xh6UxUuxKCMw@mail.gmail.com>
Subject: Re: [PATCH v2 01/34] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, Adam Ford <aford173@gmail.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, Aleksandr Mishin <amishin@t-argos.ru>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Christoph Fritz <chf.fritz@googlemail.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Detlev Casanova <detlev.casanova@collabora.com>, 
	Dharma Balasubiramani <dharma.b@microchip.com>, Guenter Roeck <groeck@chromium.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jani Nikula <jani.nikula@intel.com>, Janne Grunau <j@jannau.net>, 
	Jerome Brunet <jbrunet@baylibre.com>, Jesse Van Gavere <jesseevg@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Liu Ying <victor.liu@nxp.com>, 
	Manikandan Muralidharan <manikandan.m@microchip.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Phong LE <ple@baylibre.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
	Sugar Zhang <sugar.zhang@rock-chips.com>, Sui Jingfeng <sui.jingfeng@linux.dev>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Vitalii Mordan <mordan@ispras.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 30, 2025 at 3:36=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Hello Doug,
>
> On Mon, 28 Apr 2025 13:59:50 -0700
> Doug Anderson <dianders@chromium.org> wrote:
>
> [...]
>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org> # parade-ps8640
> > Tested-by: Douglas Anderson <dianders@chromium.org> # parade-ps8640
>
> Thank you for your review!
>
> However I'll be sending v3 with some differences w.r.t. v2, in order to
> fix the 3 bugs reported by Andy Yan plus a similar one I spotted. The
> fix just is replacing PTR_ERR() with ERR_CAST() in the 4 cases where the
> involved function is returning a pointer instead of an int.
>
> Your review/test tags appear global to the whole patch, thus being the
> patch different I think I cannot include your tags in v3.
>
> Let me know if you think I should do differently.
>
> Sorry about that.

It's fine if you want to drop my tag. I didn't have time to review the
whole thing but I felt like I should at least review the drivers I'm
signed up as a reviewer for. That being said, I'm not counting tags or
anything so I'm not offended if they're dropped.

My understanding is that the hashtag at the end is at least a
semi-standard way to say that my tag only applies to a small part of
the patch, so it seems like it would be OK to carry it, though...

-Doug
