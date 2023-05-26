Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A3A156C0
	for <chrome-platform@lists.linux.dev>; Fri, 26 May 2023 10:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685095505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LG3N8DT4XtkxWSup6j6+Ux4lt7ZzlfYQe6wlymM94BM=;
	b=QcCUCDbG7BFOfYJw0g+fGW/2818nl9GA+m7woPXGpHn59c6Z50F034naHz8kJLYCE+PgcT
	7M9G8HurJHml7XhnM7I/Jix4luYv3iJQdrI1cv9QdufBqJeMy1PhQj/vuanF8ZnUTsUJa0
	nwaBQLGFcchFZEJD8icGMUuCj+6oWQg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100-IR-7TsQhMCqDfc7bxb61PA-1; Fri, 26 May 2023 06:05:04 -0400
X-MC-Unique: IR-7TsQhMCqDfc7bxb61PA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3f42bcef2acso2838185e9.2
        for <chrome-platform@lists.linux.dev>; Fri, 26 May 2023 03:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685095503; x=1687687503;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FUVjbXUCqsHJD5Imn0elHIyL11VBFby+G2+E5K6mj1w=;
        b=c8NcjBvd0FLYvphai5N2sEhnbMhYoJl250tYhItlW0hlk/UE0dDZ92nT9RsbtGYUN8
         jpaDO9nA/t7GxN/9xv4dDVnowMga5rjDkwLLwlyKlv8zCp7IW05zsxeEvLNB6skQ9aJn
         PpnZXEGhJFz0xHS7PLP89AX6FG8vNi680oODUsjvVCsTx2Kid5UDMLe2qah/tAlcNcW5
         aa/cmMhes1kh7eLdlVlbgAcuZyhe2jZSxgd41DVKDi00zPz/W0/+rc7peQhxXzNu66fX
         GQsL3LutmgqKpMVwBCY4mxt2U1i4b19UNBPgvAcjQ+I/EAxI7JHp7eV/hnkMeSD1/sSS
         Amng==
X-Gm-Message-State: AC+VfDzBmRonwlL5ymPvu35O8ie3M88IIEmygCFh4xvQ5NLvkupXSlQh
	bnilS/z337PKkKuDAV08T0/LrImyWRn9NIreiJAF48R0+40maYM5MVXh6+a9cWdlm8n7Z0CP69U
	e/1b11yFqSfzV/x/oiwFNeqr0zorR
X-Received: by 2002:a7b:c4d9:0:b0:3f6:244:55e3 with SMTP id g25-20020a7bc4d9000000b003f6024455e3mr895822wmk.35.1685095502963;
        Fri, 26 May 2023 03:05:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4O+PGcB3hPDA3BOc3Y0NueCcMuKZ3kw+zpqPvuF3jNk8EKeK9Y2hx4flWckOsoGfT+sCY3HQ==
X-Received: by 2002:a7b:c4d9:0:b0:3f6:244:55e3 with SMTP id g25-20020a7bc4d9000000b003f6024455e3mr895759wmk.35.1685095502610;
        Fri, 26 May 2023 03:05:02 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m19-20020a7bcb93000000b003f605566610sm8353757wmi.13.2023.05.26.03.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 03:05:02 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Uwe =?utf-8?Q?Kleine?=
 =?utf-8?Q?-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>
Cc: Antonio Borneo <antonio.borneo@foss.st.com>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, Crt Mori <cmo@melexis.com>, Martyn
 Welch <martyn.welch@collabora.co.uk>, Peter Senna Tschudin
 <peter.senna@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Sam Ravnborg <sam@ravnborg.org>, Marek
 =?utf-8?Q?Beh=C3=BAn?= <kabel@kernel.org>, Jagan Teki
 <jagan@amarulasolutions.com>, Florian
 Fainelli <f.fainelli@gmail.com>, Robert Foss <rfoss@kernel.org>, Stefan
 Mavrodiev <stefan@olimex.com>, Liang He <windhl@126.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Adrien Grassein
 <adrien.grassein@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Martin
 Donnelly <martin.donnelly@ge.com>, kernel@pengutronix.de, Jonas Karlman
 <jonas@kwiboo.se>, Jiasheng Jiang <jiasheng@iscas.ac.cn>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, linux-rpi-kernel@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Ahmad Fatoum
 <a.fatoum@pengutronix.de>, Hsin-Yi Wang <hsinyi@chromium.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Xin Ji
 <xji@analogixsemi.com>, linux-arm-kernel@lists.infradead.org, Neil
 Armstrong <neil.armstrong@linaro.org>, Douglas Anderson
 <dianders@chromium.org>, Phong LE <ple@baylibre.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Alvin =?utf-8?Q?=C5=A0ipraga?=
 <alsi@bang-olufsen.dk>
Subject: Re: [PATCH v2] drm: Switch i2c drivers back to use .probe()
In-Reply-To: <168509448433.130277.3243909863879735319@Monstersaurus>
References: <20230526090709.1517297-1-u.kleine-koenig@pengutronix.de>
 <168509448433.130277.3243909863879735319@Monstersaurus>
Date: Fri, 26 May 2023 12:05:01 +0200
Message-ID: <87zg5rflwy.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Kieran Bingham <kieran.bingham@ideasonboard.com> writes:

Hello Uwe,

> Quoting Uwe Kleine-K=C3=B6nig (2023-05-26 10:07:09)
>> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
>> call-back type"), all drivers being converted to .probe_new() and then
>> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") conver=
t
>> back to (the new) .probe() to be able to eventually drop .probe_new() fr=
om
>> struct i2c_driver.
>>=20
>> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>> ---
>> Hello,
>>=20
>> I didn't get feedback for (implicit) v1 that was sent with Message-Id:
>> <20230427175954.666464-1-u.kleine-koenig@pengutronix.de>. This is a
>> rebase on v6.4-rc1 as the former patch doesn't apply cleanly any more.
>>=20
>> I also added more people to Cc, maybe that helps to get feedback.
>
> Having been invovled in b8a1a4cd5a98 ("i2c: Provide a temporary
> .probe_new() call-back type") and definitley expected 'temporary' to
> mean less than 7 years, I very much approve of this patchset.
>
> Thank you for all your efforts Uwe.
>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>

I strongly second what Kieran just said. I was also involved in the commit
mentioned and it is so great to see your efforts to finish that change.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

