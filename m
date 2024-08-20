Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D0F19047D
	for <chrome-platform@lists.linux.dev>; Tue, 20 Aug 2024 17:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724173271; cv=none; b=mPsj2E7haa+kShNKD6GRRc3mcyPW+mBV1r638GKdA1Fn0xB8g7nqJmS/wXXKGUPn5n1uuAwLFj3bvQxJZ3V1Y5NnO2UoG8/U674MkN24IX+jmat44a5d3P/2fWlOw3iWMq5eNC+nlnbK6zDyNloAoePSLBYZDg0Zbyj+MRw/fdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724173271; c=relaxed/simple;
	bh=La7oWIUhSUge3ERKvxgz51d9R1GNWxKb2F4RDC0zKH4=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nGtuz2FBreJ33XiMAkAnyeogy8+X0cXnQj3fOhI2BjUlMRTmr5sDLOiMFVi7lNPb5XR4erZ69WsQNnmRle8Zd47I1/MQdpD3AR9m0u78CVydVatOwKiiGMd3VYJZBfiPUd/hCc6ohv2g6uwR8ITFmky0grjiPxAbhaJQ8M5tXTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E43Vsz0G; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E43Vsz0G"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7a1d6f4714bso556396285a.1
        for <chrome-platform@lists.linux.dev>; Tue, 20 Aug 2024 10:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724173269; x=1724778069; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JCcO6kIoHTHBJk3fFwoj4wvVEMn4emufplXdO/fW0XM=;
        b=E43Vsz0G4QSGKYAzhBvLjHfLFz7iFTePIi2brFJUMYLT5ijCVhdhJwNZYB6O4O53Rs
         vK0ai3pWRNiSVLeBH2Q67p1me7IgObHuKV8Cnd+HN7PQ51mgSOQJp9ro/IqG2l6g1tgK
         /3M8bG6uhTXynh6S10vWiso1GXQ4fK/TXX5IU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724173269; x=1724778069;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JCcO6kIoHTHBJk3fFwoj4wvVEMn4emufplXdO/fW0XM=;
        b=fj+sJNEA3KO2JY6ovyJ6d4rBrcFlQnx8imW8QP2jjG0HZ2drPUj9NyR+WWDVNVOBhj
         Te7TfGcoiHZR7ZJxi6ybrCdyY6FksmvdWFv7wZbikdIIfbi9YHrgXteruJBR2/yQR6Nk
         WLxyDyWPcHCgwDMmLysG2V5DwzVEyuSdLit4Ms+oZ9IK/GsmfLvhy5DFogz0eWJ7Edso
         7j/iWyn8OvhRnLju3PAgZ36iKkDK+y3BHYLGdjnnm7jdXKylFeFtM6e+MZHP+dMdCK2P
         GNPpXovp5MdWsfJKD47RpTCpVwFM3kmsiFGLZ/eSNb2OtYCMrxkBlcgJ46ZIOqDoQMgh
         5b/w==
X-Gm-Message-State: AOJu0YyY4+mGQD6g51iw7wD6V1EAfATRl3QHfHFGKozB2Oh6rU9j/uHe
	6mKwMJipjn5yoEKGokab2BouJDzj+lpnEyUmW0Ys13bV10iwgNQsSv2PKq2Mkt0vG4MBtDpEdwq
	R+H2qYDnpZS8DJqJfmr6Caih2SnlTu+MdtHQA
X-Google-Smtp-Source: AGHT+IExsG5zHtAEYfaM6InbVgUuGomzcusJF6tz1OfpCX6Xn6bckfcEN/xUs+8krdfm3hDwFaOzE5atXUvwN9QFkzg=
X-Received: by 2002:a05:620a:3942:b0:7a5:1e9:7ff6 with SMTP id
 af79cd13be357-7a667c53799mr601135385a.34.1724173268451; Tue, 20 Aug 2024
 10:01:08 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Aug 2024 10:01:07 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZsRs6d6uOMb4DqQQ@smile.fi.intel.com>
References: <20240819223834.2049862-1-swboyd@chromium.org> <20240819223834.2049862-6-swboyd@chromium.org>
 <ZsRs6d6uOMb4DqQQ@smile.fi.intel.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 20 Aug 2024 10:01:07 -0700
Message-ID: <CAE-0n52O01UgrDT2=-JJpZj39BOJNyyQC4w_pgDUmKDmcN=8Yw@mail.gmail.com>
Subject: Re: [PATCH v3 05/17] usb: typec: Add device managed typec_switch_register()
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

Quoting Andy Shevchenko (2024-08-20 03:16:09)
> On Mon, Aug 19, 2024 at 03:38:19PM -0700, Stephen Boyd wrote:
> > +     ptr = devres_alloc(devm_typec_switch_unregister, sizeof(*ptr), GFP_KERNEL);
> > +     if (!ptr)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     switch_dev = typec_switch_register(parent ,desc);
> > +     if (!IS_ERR(switch_dev)) {
> > +             *ptr = switch_dev;
> > +             devres_add(parent, ptr);
> > +     } else {
> > +             devres_free(ptr);
> > +     }
>
> devm_add_action_or_reset() ?
>

No. We don't want to call the 'action' devm_typec_switch_unregister()
when it fails because that would unregister a switch that has never been
registered.
