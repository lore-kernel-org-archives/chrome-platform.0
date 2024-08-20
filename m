Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112641BA87C
	for <chrome-platform@lists.linux.dev>; Tue, 20 Aug 2024 17:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724175257; cv=none; b=ptpIK/qA7tsVEaf4DjRQFdiztF0T1G1iNDbeCmA72wBx5/FInDTTU6qPNskVHhv2hiPXL7s6Kj8h4usCF6im+L1xk4BobFZ4BT6BLe2DxfmVOCFUXWQ2TC9qru9eEFGTXPNGzuoaT3hRiXrpWVhwkbgi8sHfZrdXAQWcGyTDRXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724175257; c=relaxed/simple;
	bh=+BGxKuXy5yuaKLKpL+P0IynbzYCeuLCHjDjm+SqrANU=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ssrZzFjFjH7CTZWYuiBAaIzSBXi+XQankULB4iki3asGoxN8TSAcSrJSQ945yT40M7vt0Dr5yTaLplNa1ztzEG0nIfi4ChlrzK8zxmXiyCMcLYZO7kobuM0orYScWMdd4E/t6oxL+YnzLo2RWMNDBVBTGtLztTjtgbyrYfiPMSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iUnj4ltB; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iUnj4ltB"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7a501dd544eso352834985a.2
        for <chrome-platform@lists.linux.dev>; Tue, 20 Aug 2024 10:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724175255; x=1724780055; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sT8btaeVFgKiZIC2/bVrNe0cKcp239nORrve01JKc1Q=;
        b=iUnj4ltBRN6/zIwXXwuWub+BZZq05egzTTIfK/96iDOtYvW1vezgcR51Yvq0m9rai4
         nStPjEl+iIo+R8EiuKv99N1SlePrA0mTmbm3mdI3DsH0fFQSa7lpzzCirgYt43GR8sas
         0j/0+3fGsgVaNEglZUm7X1OyvDQEMZeRVC27E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724175255; x=1724780055;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sT8btaeVFgKiZIC2/bVrNe0cKcp239nORrve01JKc1Q=;
        b=t/nV8CRz0YNFog3sMoSiZFhm1mO15++4+i2yylhCz8YcgSU4AaqJJhIkxv9AKzxln+
         oRxjmdjRXqK8HdP4hBKAbKDFNyyP3H2Xi10R11VYcuw0Hl8jLIj4fpZP/HZ7FVBw7/qQ
         pqfiayV5uq278DUW9mPJIhrJ70ZOzM8/2y8D1ZTvMASAtIjknDnrIP00OCCoEOk+q8Lh
         aqm7LEHw+zTPMgyiBD9XEh4SU17vyQctFv0w5oAmTvXR+tr/1RnSSnpx0Jb9YT23MzyG
         j/U0L2+YqpMG99/eGT6x4Pz7Aca7fAKH/9vUNIoSAE1Jp0MckWHG84J+GPGt/zXLY02F
         ViLQ==
X-Gm-Message-State: AOJu0YwWJ7d/6nNsBMgFRMgr/ZGk/KCJ2evCa1llJm+qS/u4yLNpZMVX
	kLipcDiUYnoWNcLXYfaq2c5ltYZ9rW0BW5PfrRM9ModHPxZLq8C87CX2xrX32GMwGOWcc4i2YvN
	Yjge/BvIiVUae9vZdCxMEeYUTpCrex+rxEZRP
X-Google-Smtp-Source: AGHT+IGGJj/BEL1gcz7E4TOfNemZPl2ZAZ1e0Im3r9+oB7B/patnof4GuWnoFzCxo19sTL6oKp0QcBKMjKB8KkoFPP4=
X-Received: by 2002:a05:620a:2453:b0:79f:8f3:6ad4 with SMTP id
 af79cd13be357-7a6740028d4mr2801085a.1.1724175254910; Tue, 20 Aug 2024
 10:34:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Aug 2024 10:34:13 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZsRt_I6y9MfWLawy@smile.fi.intel.com>
References: <20240819223834.2049862-1-swboyd@chromium.org> <20240819223834.2049862-11-swboyd@chromium.org>
 <ZsRt_I6y9MfWLawy@smile.fi.intel.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 20 Aug 2024 10:34:13 -0700
Message-ID: <CAE-0n516QBSg-ODNjaM-q52UtU17DJ45VC-pov+1oSfm2E_9Sg@mail.gmail.com>
Subject: Re: [PATCH v3 10/17] device property: Add remote endpoint to devcon matcher
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, devicetree@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Benson Leung <bleung@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org, 
	Guenter Roeck <groeck@chromium.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lee Jones <lee@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Prashant Malani <pmalani@chromium.org>, 
	Robert Foss <rfoss@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Scally <djrscally@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Ivan Orlov <ivan.orlov0322@gmail.com>, 
	linux-acpi@vger.kernel.org, linux-usb@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Andy Shevchenko (2024-08-20 03:20:44)
> On Mon, Aug 19, 2024 at 03:38:24PM -0700, Stephen Boyd wrote:
> >  include/linux/property.h    | 5 +++--
>
> > -typedef void *(*devcon_match_fn_t)(const struct fwnode_handle *fwnode, const char *id,
> > -                                void *data);
> > +typedef void *(*devcon_match_fn_t)(const struct fwnode_handle *fwnode,
> > +                                const struct fwnode_handle *endpoint,
> > +                                const char *id, void *data);
>
> Seems there is no explanation of the parameters here, can we add a kernel-doc
> to this typedef (may be a separate patch)?

Sure. I'll throw in another patch.
