Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B915A14431B
	for <chrome-platform@lists.linux.dev>; Fri, 16 Aug 2024 22:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723846378; cv=none; b=a8nisJIoefV96vrvchPOcVpMR7b/vzIH5WRGRFQMAkPVMLIazbUycni4he1hfvOImisSUkm9QqT/Y+kU5XSNLBYqIAzHyrWjXItLMvmOvWkHzZN9RJRYIvom6ubqV8wszHLtKz6Z6bh8gYNWLadPv1kXfLU5pwHXDat69ZwcB0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723846378; c=relaxed/simple;
	bh=27Aa5uP6ynSRq3MyGqYDRl/zOjMC3BQBnPalcqJi/4g=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mt+oMp61T9TgKJ8LjW0IZYKxOtP+KsQtc7NSjsBv0GiaLgkoAwwd9DQiCWDVyF4Ab9A6ZswiBPZS2vK6PbfwLlOYuQu1x9HJ0g12NUpJZYdXUV3s4iRU0S5U9AoBwQt6bUpdozCNdHykO/9cGS1vW+tYtq5QeX04zJ4zeKrrPz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Kton5+O7; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Kton5+O7"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6bf6606363fso13455216d6.3
        for <chrome-platform@lists.linux.dev>; Fri, 16 Aug 2024 15:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723846375; x=1724451175; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27Aa5uP6ynSRq3MyGqYDRl/zOjMC3BQBnPalcqJi/4g=;
        b=Kton5+O730cCec7LCyPD+29dFUFxaWLRDS263mB9WcYFl4etncLF0/NwY6uI5rcTh4
         0UxVN+AcPJgjsQGJZdMwc2TuqgqqgBpIO+eWPvhM7j6PLuc634NXvBntAYqQNb2tXi3O
         2u9qRf5veMw4mIzRufOyjAlLHRH2urQP140Bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723846375; x=1724451175;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27Aa5uP6ynSRq3MyGqYDRl/zOjMC3BQBnPalcqJi/4g=;
        b=K9ONuKlA0149a4Xq6SXtug21WJaY87JjGIK3PtPjMne5fk7/+wmzKdM44fEBuqw5da
         u7ucRRCURvUhs4qtzHaslPS2p0luhqDoHkb27rlPALN6mOcq5XqMgI/OV//KQdkR+CGw
         GgitVPZrdPJKROdsJkK/qcZ8GyIhO0KA1YIKOMiTK+G5VZudtTzR4hTpjiHyYVIKve84
         2SZNdMcxg/HjttCp3y2o89qRypd7eG0+CkAJEu7z1JGUglbvqxmaoEW0vsKygeBJLv7Z
         bfobZkaG8ofkujuEMQGl4BOnf4Cg0yn3UwQ4WvOqJJBoDSwVQqG0mGcW7k6vnE6GibLR
         nMaQ==
X-Gm-Message-State: AOJu0YxA1PQMHMEPpTQGWJdcl0EgLN6kCOxgzC8PaGx4aTVAwakyaKFb
	ElDbmxxZqY0iWoSHnxvTUPXr2i/diGiE0VvaKT7dkZn4zpnqfAmu9pQGWkkXV57xdp6hyn1YRPH
	SaaQ6tmrvnX/2dhA4OSCXY2tUhUF/bf8hBdc0tCNGbxpCRlA=
X-Google-Smtp-Source: AGHT+IEXgJVhNBbiykq2c9JLQpgdG+hj5r76CFo72LJUCN7wWKauh3tPqJtN47pGnDcVtY+0kRff3bANoaG4a/doWjY=
X-Received: by 2002:a05:6214:4a93:b0:6b7:9bc1:708a with SMTP id
 6a1803df08f44-6bf7cea2549mr55681266d6.55.1723846375483; Fri, 16 Aug 2024
 15:12:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Aug 2024 22:12:54 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240815003417.1175506-1-swboyd@chromium.org>
References: <20240815003417.1175506-1-swboyd@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 16 Aug 2024 22:12:54 +0000
Message-ID: <CAE-0n50J3vuSKEPM5Pum+8CiQ6_X=Q0eCzyEJLkyof0awCWjow@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] platform/chrome: Add DT USB/DP muxing/topology support
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Pin-yen Lin <treapking@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Benson Leung <bleung@chromium.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org, 
	Guenter Roeck <groeck@chromium.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lee Jones <lee@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Prashant Malani <pmalani@chromium.org>, 
	Robert Foss <rfoss@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Tzung-Bi Shih <tzungbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Stephen Boyd (2024-08-14 17:34:05)
>
> I'm thinking of working in changes so that the drm_dp_typec_bridge
> registers a 'struct typec_mux_dev' as well. If that is done then we can
> register a drm_dp_typec_bridge from the port manager and let the type-c
> framework drive the pin assignment and orientation directly instead of
> calling it from the port manager layer. To get there I need to add the
> ability for a 'struct typec_mux_dev' to associate with more than one
> typec_port (technically already done) and then make sure that the
> cros_ec_typec driver doesn't try to enable DP altmode on the type-c port
> that isn't muxed for DP. I'm working on this now but I'm sending this
> out to get some feedback because I've reached a good stopping place.
>

I've done this now, and it works well. I've extended the usb-switch.yaml
file to support a third graph endpoint for DP. And I've moved the hpd
notifying and lane remapping to be internal to the drm_dp_typec_bridge
code so that any device that registers the auxiliary device can follow
the usb-switch binding and connect the endpoint to the usb-c-connector
to get hpd notifications and pin assignment basically for free.

I'll send a v3 next week.
