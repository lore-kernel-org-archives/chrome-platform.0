Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0712F1FBA
	for <chrome-platform@lists.linux.dev>; Fri, 25 Nov 2022 05:53:47 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id c2so2094414qko.1
        for <chrome-platform@lists.linux.dev>; Thu, 24 Nov 2022 21:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sJO4CKtz6uCVjlMUGm3BSASo1KZZ4zekB4W49uCXr0Q=;
        b=GEQWK1zMTOaNgc6Jsw7BvrlA2RvLaRBKdutwd2mWXuN32GcN/F/lh7Do+jJwhu/lKf
         eUQzy4v825QJ8od3gmSFrmEbBs06XRTg2khVxN2jX2t/NUFG68evKAZHk2uGyqoEdH/l
         BYs68ifkf0D5ULeS+KO0T9nvkikk56lTOVFYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sJO4CKtz6uCVjlMUGm3BSASo1KZZ4zekB4W49uCXr0Q=;
        b=PC8+qqcIcUySWGGpCXkjWx+YFU5O965hkcjrR31hv7+AR1FiDIeCZpe2dJf6wuiM43
         ZOKsyp5VkCvAiwpw+V3fNtsxAIN0uzfWzxUBe7tBuIr8ydzgXIRtdRA5FU83+AsVJfus
         Hr5dw7lDa7z7NvPy1ApSY5ZVfPu+BuWcswVd8gJLzTfGFsFm6YObTCgMI7ooWvfdbs1n
         sqM9KyxDT+DeAaKriAKjI8hhoHj8hPETbMG5MMY3KRiawDNmtwac3MSYK7JhEUc/a2yu
         QhN9di7lFKyx+VGihQf826AqsFDiUthzhIE6TT6CXPowjQdiUX8XNMJOYyRe84uJuLD/
         /TLw==
X-Gm-Message-State: ANoB5pnsA8FaRvmCbtWQpr2g4MIjCOPeqv0AQuPE1mbE02Bv7hZ0y4n8
	aGvlx2tzp5KL/9FvGM/UmbNlK2R+nYmUKoO9LxNpvg==
X-Google-Smtp-Source: AA0mqf6knSu6QR92mZ0wCOhRti8BSXDFhhs9fIvKI9CaT08+1NzMdooQC08kJNAEDw9GfohzPzP4gUJ+R3xq6VWqYa4=
X-Received: by 2002:a05:620a:31a5:b0:6fb:ff0f:e7e0 with SMTP id
 bi37-20020a05620a31a500b006fbff0fe7e0mr19622315qkb.747.1669355626882; Thu, 24
 Nov 2022 21:53:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221124102056.393220-1-treapking@chromium.org>
 <20221124102056.393220-3-treapking@chromium.org> <Y39ikbcqx5/pEc64@smile.fi.intel.com>
In-Reply-To: <Y39ikbcqx5/pEc64@smile.fi.intel.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 24 Nov 2022 21:53:35 -0800
Message-ID: <CACeCKaewXJYUJCyGyh==dsA6wsU4OESXFXJRiKm9AWPECS_ZBA@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] platform/chrome: cros_ec_typec: Purge blocking
 switch devlinks
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Pin-yen Lin <treapking@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <robert.foss@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Javier Martinez Canillas <javierm@redhat.com>, Stephen Boyd <swboyd@chromium.org>, 
	dri-devel@lists.freedesktop.org, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-acpi@vger.kernel.org, 
	Marek Vasut <marex@denx.de>, Xin Ji <xji@analogixsemi.com>, Lyude Paul <lyude@redhat.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	Allen Chen <allen.chen@ite.com.tw>
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

Thanks for taking a look at this patch.

Pin-Yen beat me to the punch with comment responses, but I'll add mine anyway.

On Thu, Nov 24, 2022 at 4:25 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> ...
>
> > +     /*
> > +      * OF graph may have set up some device links with switches, since connectors have their
> > +      * own compatible. Purge these to avoid a deadlock in switch probe (the switch mistakenly
> > +      * assumes the connector is a supplier).
> > +      */
>
> A bit too long lines...

They are within the 100 character limit [1] which is followed
elsewhere in the driver; has something
changed recently to make that invalid?

>
> > +     if (dev->of_node)
>
> Why do you need this check?

This issue only arises when using DT for this device. So the rationale
is we don't need to
perform this step on systems that don't use DT.

Best regards,

-Prashant

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bdc48fa11e46f867ea4d75fa59ee87a7f48be144
