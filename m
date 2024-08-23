Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161B21925B9
	for <chrome-platform@lists.linux.dev>; Fri, 23 Aug 2024 20:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724445885; cv=none; b=gtcycNASYohmBr2mBdHNlOAmpFkA27idgslQuJ57/iBkqSnmRFV3UPoh9X2gLxIy6+cZbUGSz6PJ4KQbN68RTz/7QpmjfhmA3WorPdIW6x0Zj6l+wmRKop4hQWKJHue6JJ6oEXdrOSGAdoDOPBj8d6XaLoATxc8t3XMYW2uOpys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724445885; c=relaxed/simple;
	bh=ZwiuRkNlvL5/cpgehJtrZvPOsmmD7YzQQKxEkRl2Hew=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=olePJ1RIbIesgoZUkISQgq3om5z0idrHhT4mqiMpaPjc20GECLICL4iwaMcaq2H8JgdW0qnP6GjwmnjV3mFdxIrJg0B+vJmFX6GORZc1ymk7W5ELrn+UJkSHpX8gH6d/JWzdVm9YvkX4bZH3hgUpWGRZ2hNHwmYTHZX8BxhdxqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WN5SnOq+; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WN5SnOq+"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7a1d3e93cceso316935285a.1
        for <chrome-platform@lists.linux.dev>; Fri, 23 Aug 2024 13:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724445882; x=1725050682; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qHJoSIvn3TQXsP4HGj1BbikslhYUk1pFvCcRMop1S9M=;
        b=WN5SnOq+mKVCq/periohrDz725KReNeOS6/HjaPG8ciXo+de1KBKfzDQonUWl6AqxT
         C83/05KENzUCeNGMcRkP9sPs65o6uZ7wMe9f886I7uETAlkLmDONCd/EM1QlGgAVb4ns
         M2gmoq2kBB3YoCwcBGZzqPFuwXjQFu8qQJZbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724445882; x=1725050682;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHJoSIvn3TQXsP4HGj1BbikslhYUk1pFvCcRMop1S9M=;
        b=eKhXZ2aZfuh4SoT+J80Oc6Mq+pxQm5USG6uw9moJnXkJ29yD6zcoLubft+dG+sbsjx
         /nthBo8r5n+c6t8Xys63tuj5WQ/EoK/jJI3yQt9WEMJUFqgQ48MFzc6HerUXkbUS8xB2
         crY7xBlBNTfAH4vB5T5HfNZTAHPp7JX+Z16OxF7gxqPOwodHvA0+B5bpXf0BkwvJ4vE6
         1A50jcZG3ncUaM4KkDCOwkyBkD78neAVVk7IKLLDRQbG3u48+scd10hnGrke1xmHYQ1y
         E41P1w1i5wNkrUrVnC44VVMNf8BnXv4JE5gj3BESORPIiMD1Ps1aByRX4yqU3sUyCTKu
         CAOg==
X-Gm-Message-State: AOJu0YyhNPauI8f1I8n55gpM3WG9wygoSA1kZDzDN6eOQlMMa0DSLFDo
	gc0zLhBwkLTt5HebKbJnMSQIhGAn3utupxkhDfHBUoEreQJ/YHnY38gJgukoU5gZGGv9gukvOgI
	rYwE6astKcqsp3uOsjKdxbtnX+txu90yz2WPf
X-Google-Smtp-Source: AGHT+IER+vkUNoi1LrSh0oKYCE+8iNRAFkc0O4BKptBtu1VAQywG251TPcXwcoPrrjWuSke5xL1qPKa71h4z9pa/Llc=
X-Received: by 2002:a05:620a:1aaa:b0:795:e9cd:f5b8 with SMTP id
 af79cd13be357-7a67d497dd3mr1281397585a.23.1724445881936; Fri, 23 Aug 2024
 13:44:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 23 Aug 2024 13:44:41 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZsdNEWX-eeLiokZl@tzungbi-laptop>
References: <20240819223834.2049862-1-swboyd@chromium.org> <20240819223834.2049862-17-swboyd@chromium.org>
 <ZsdNEWX-eeLiokZl@tzungbi-laptop>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 23 Aug 2024 13:44:41 -0700
Message-ID: <CAE-0n50Tuxp0WjFoTx+_i1L4cSOajSNHWPh32PPoXvskJByJJg@mail.gmail.com>
Subject: Re: [PATCH v3 16/17] platform/chrome: cros_ec_typec: Support DP muxing
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
	Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Tzung-Bi Shih (2024-08-22 07:37:05)
> On Mon, Aug 19, 2024 at 03:38:30PM -0700, Stephen Boyd wrote:
> > @@ -671,6 +674,20 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
> >       if (port->mux_flags == resp.flags && port->role == pd_ctrl->role)
> >               return 0;
> >
> > +     dp_enabled = resp.flags & USB_PD_MUX_DP_ENABLED;
> > +     hpd_asserted = resp.flags & USB_PD_MUX_HPD_LVL;
> > +     /*
> > +      * Assume the first port to have HPD asserted is the one muxed to DP
> > +      * (i.e. active_port). When there's only one port this delays setting
> > +      * the active_port until HPD is asserted, but before that the
> > +      * drm_connector looks disconnected so active_port doesn't need to be
> > +      * set.
> > +      */
> > +     if (dp_bridge && hpd_asserted && !dp_bridge->active_port)
> > +             dp_bridge->active_port = port;
> > +
> > +     is_active_port = !dp_bridge || dp_bridge->active_port == port;
>
> Why `!dp_bridge`?  When will `dp_bridge` be NULL?

I'll add a comment.

'dp_bridge' is NULL when this driver is running on non-DT platforms,
i.e. ACPI, or there isn't a graph/ports node for this device. The latter
could happen if there's some AP controlled piece of hardware that is a
typec switch, connected directly to a usb-c-connector. This is the case
on Kukui where we send the DP lanes directly to the usb-c-connector.
