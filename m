Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17163292904
	for <chrome-platform@lists.linux.dev>; Tue, 29 Apr 2025 08:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916056; cv=none; b=Lj5yc0RnM5oEj7GUcLkCsLZyf50xatALh5fa6LGx0OHW28vejpDQx6Y/1XTjUwd0/dsCB6OXGlBNvMGt86ExxfjUjbrys35uM4HT7qDraf5lzwEUQ38SA3NMxs/aAK+vJ9J1fYk/p66o4bW4Bj5Kf/5ZdRNMokFiG90zldh2gcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916056; c=relaxed/simple;
	bh=KyAtXWPUARsz+iDauIm3noZwAgvzeeeL/6Xih7T8GDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UWScKWq6B2t6wY55tt0ITTvA0nHVq5hWtIvtS+ZIwFVj7/7Pn6EIj9JKM2hvaO7bkp6GQQSOn4UF7vgGAn2q6lDwvRZyXXy0wWZ5stspU5QoYoADtf3caJUBwjffQZiHzgy4EOvd97P+fJ2xMeks6NOHES50N84UFvd8OX2pNnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ttrSkmC/; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ttrSkmC/"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3106217268dso54204141fa.1
        for <chrome-platform@lists.linux.dev>; Tue, 29 Apr 2025 01:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745916052; x=1746520852; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyAtXWPUARsz+iDauIm3noZwAgvzeeeL/6Xih7T8GDE=;
        b=ttrSkmC/spoOcIS+tBlQgx2imhr4JE/4d82uPIzuJvH3EiZcCw9RPvSPVs6eGTXbdb
         NXqOLGj3e9fwY/zREAKHSdmTCEqClzMLmWOvGIul3qnKuQDnQbfAuhtzSMHC7GODjLIX
         OWcfh5Z4wYCF6WqkeHxi6bIfDHAYhuF2Xr7H/D3jfAeMtqz82WTUpvAV2lNwH6RI/5Qr
         ho3u/R4B29jtHwUzqTKG2nhhXnwLflxX1NF6htV4uSrZF83b1Bvfmb7CPxCIMx9JMAqD
         2dYxOPwi1gOfx8F2MN1ONqPRsYgNcElznopGaBHcav2CyU+p1ooO+XNETY8Bn4MA1j53
         DLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916052; x=1746520852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyAtXWPUARsz+iDauIm3noZwAgvzeeeL/6Xih7T8GDE=;
        b=YHTPn0YixXlj47xZqwl7+ll76p0afCshc6Yc1SlZTa4jeioMnpqKd+n1ZZf9c5/+ri
         cX/wPDY18fF1pHt6SMvA4gIHqjvjhyYdH6I8L5j3u4KyC8jRTNCNiKTDbcQx1H0DaCKR
         tPV+3uAMcr6KeW69nGJLnaZNJN9iYk0G9HZhKx9VS1pIx2d9Beo0Hsg2MSJFzU1AkmPR
         +wN8j3hb75ptzW75anOWKJqfHCy82b6JZDGQyvQlXeIZq7frpp5n1qYzw7zsiTKYlKs7
         wejNljZu0qXntuYTx6rG2DACMl+xz1yWBe8aQmgSVhCYy9ZcQEK/o9J82sK9qBzdpMBG
         URgw==
X-Forwarded-Encrypted: i=1; AJvYcCVmIEfuOrX/do2aVrI7oa4GOaUJvlVY7a8Wb46xLFB7qS//vB5UsxgeVmU/YMFSMpdc/kCvmEary7PkvBg8p0I=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPPyeUJC4Rbg0wA4ovanSDvXQvkU9UwZtmlu6VchGMwcsBySmk
	V745sc2D995GoHtR1GoSJ0vY0JfpRu0oiIooyxzt25nYqwBLPXf1xr/SRslPPCvgCYZgC2+uyOK
	xwmNUlX+u6IRAI2FtmRTGzgZB9kDZ1bVq+IUN7w==
X-Gm-Gg: ASbGncvWx+1AoozrJC8oj0rJNJN3z3EnXjJsSpEywmO21p/C4CzJf27/Ib8zrJs7oIK
	gmzlchffCM4/cb9D03Z+y8kOdggcoThTF0b3JyHHL5szsDuKwU9sKzs0FnOagLMh1Rn7k8+7P4c
	+Kq2Ho1QXhAKGdC6eSSvZ3BQ==
X-Google-Smtp-Source: AGHT+IEUiqYB296CVrwZ+xxBw7BC+pTcJa/x+6Bu5GNB2EvNhnBwa7BLSUJNRUMp+Ehtf1mLBoE9JSmzpMhMYJBukms=
X-Received: by 2002:a2e:bc0b:0:b0:30d:894a:a538 with SMTP id
 38308e7fff4ca-31d34b6c243mr8766341fa.21.1745916052135; Tue, 29 Apr 2025
 01:40:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-15-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-15-8f91a404d86b@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Apr 2025 10:40:41 +0200
X-Gm-Features: ATxdqUEhPh2HxY_cKMawBJnfuogL8n7jPhFvg8U9jTR5km8hYrNkb1VPdIYXtGQ
Message-ID: <CACRpkdZt8zem0hFUiq3-Z1feNZHRh3R=Y0cEtK=pVt=bJ9Qf1g@mail.gmail.com>
Subject: Re: [PATCH v2 15/34] drm/mcde: convert to devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 9:00=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> This is the new API for allocating DRM bridges.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
