Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02AF1C6F77
	for <chrome-platform@lists.linux.dev>; Fri, 23 Aug 2024 20:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724446078; cv=none; b=fs6726hz/7frRiWVvgPVIyVk+WaMULAs2tSiM/IZvbHQFL6LwwkLPu8/d/Tq8gM2RtrQDvONvVP1GchLsK2d2bhCRYWHg3wdIJmuD7hsIVoZiIqfxfQt7VYZoVg+1QMyoZmoI+bgXSLNU7CAHGKSmL0Lz+SdM2x1JbouhiI96wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724446078; c=relaxed/simple;
	bh=id4PXH6g6b5ygcEfz+3/ImyFmiTcss8b3qGEx/u76XI=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S9GHDgj6lmhF5JxoO/a4yvniZCEkbci9x6PIagAavgNCvjvE48EecGJFcLm/Qk1Bf9kx9asxAGyp/Z/lGKjNmRMWuvXPajAzO4S1OzNIONBMhqRwdrplhOPSSV7aBvnuWI8B4vQzpSe4bQp24frpthKFH6+KMXRXj1d0HUzzww8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=igIf95L6; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="igIf95L6"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-26ff21d82e4so1706204fac.2
        for <chrome-platform@lists.linux.dev>; Fri, 23 Aug 2024 13:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724446076; x=1725050876; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=id4PXH6g6b5ygcEfz+3/ImyFmiTcss8b3qGEx/u76XI=;
        b=igIf95L6Q0RqkeCjPoaTwCHD8rmvbB9sHs0BpME1k7jm70e2k5a8xjILb7E61HwNZs
         4b3S6/gaPtSs3jA7iG0JkfJDvom4hFgoZ7ALlRVYf2fpp37Lry8/sJag7aNfhdVQM63T
         lNQ2B+WqMIabqofxATSkOSj81xI0FCvEGsGgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724446076; x=1725050876;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=id4PXH6g6b5ygcEfz+3/ImyFmiTcss8b3qGEx/u76XI=;
        b=eJQ3HnLGhKJAgh3/4LMCbBdH9aMp96g8ghdp5PZdGMxmlBDbuXPOlpTWn3FkjOPnpq
         ucqNC0vupVPNJithk2fZqt+06EGRftDr2a7Mu257QbYPOd9tCn9j09O5irKN8t+HGntx
         6miZ9ozYJqHdU2GqUEoElYagAgVa4Wkyt4QwzKbidyjKjLNiRHhyS6Xwls/YEv+tia0t
         EUIGqDylqtaNlGPDQX1k06aeFfZMZu+PtphXkSTpcNA5r6JDCxy2XuWb5sThZ1x1N6HX
         76dI9s5jdFdvfLFR5btlw/bbyvAh9n85L14vnHHyMhmhF93BCecF+1KF3dx+7txaXeFx
         JX5w==
X-Gm-Message-State: AOJu0YwqqnCerS4kv+HcwTtAvvLq2OJ6yBA4fdCC3rx8RRBE5ZvkuE1U
	ZfzNhhti0DamflfOHuOcf4t6zew2YfFkbd+o2JQN3oqTAl3O2bwK5nmhJYAoYwVpPqucIQBNnLu
	92XeYtBM8rNPskjp5A6mmBRfM0e8ML5FK4+/B
X-Google-Smtp-Source: AGHT+IFTlK1vgqPsQn2j9voF5J39I5gTTTzWpu4wouRlEDJLxZNqlw4ZgBfIqTn3IqcZNBM8n7tlqF0zt3kueWkW4Ac=
X-Received: by 2002:a05:687c:2be9:b0:265:b32b:c45f with SMTP id
 586e51a60fabf-273e60835d0mr3142337fac.0.1724446075865; Fri, 23 Aug 2024
 13:47:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 23 Aug 2024 13:47:55 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZsdMd7Ywa2b-GDT6@tzungbi-laptop>
References: <20240819223834.2049862-1-swboyd@chromium.org> <20240819223834.2049862-14-swboyd@chromium.org>
 <ZsdMd7Ywa2b-GDT6@tzungbi-laptop>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 23 Aug 2024 13:47:55 -0700
Message-ID: <CAE-0n53zPV8QHf7DxSDO8E4-kvsP=unFvevjo7i1ZjE1v6UgAA@mail.gmail.com>
Subject: Re: [PATCH v3 13/17] dt-bindings: Move google,cros-ec-typec binding
 to usb
To: Tzung-Bi Shih <tzungbi@kernel.org>
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
	Thomas Zimmermann <tzimmermann@suse.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Ivan Orlov <ivan.orlov0322@gmail.com>, 
	linux-acpi@vger.kernel.org, linux-usb@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Tzung-Bi Shih (2024-08-22 07:34:31)
> On Mon, Aug 19, 2024 at 03:38:27PM -0700, Stephen Boyd wrote:
> > -title: Google Chrome OS EC(Embedded Controller) Type C port driver.
> > +title: Google Chrome OS Embedded Controller (EC) USB type-c port driver
>
> Given that it gets chance to modify, how about s/Chrome OS/ChromeOS/?

Sure!
