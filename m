Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB32B23B5
	for <chrome-platform@lists.linux.dev>; Tue, 15 Mar 2022 16:19:04 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id w127so21328299oig.10
        for <chrome-platform@lists.linux.dev>; Tue, 15 Mar 2022 09:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=IcWUs6pXL9TSfsOL915UYAmnTIoLdxHaRaQlaAHskdo=;
        b=fC7D4ln/VQfMzj10H2cDBMwXHWhwmi/bYBuuiME3ozr3PtrxThNWwSieW9Js8ihLCp
         ypoQwifiWuUf/ZxU3od5Odj36c/EzCWh45p3wPqqd88bhCGCI6NDW7sDp8vWxBQpZQaA
         FOhruyBve0+Q8agnJAvdH9HbSOMlR/bQ4B8gY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=IcWUs6pXL9TSfsOL915UYAmnTIoLdxHaRaQlaAHskdo=;
        b=u9lJ3BOfo6MMs/IOKzTfXgJOimh+xncIRxZ1dMhEmjcUcxZqB5DdZT4nTufN/0bxis
         qXLjN/PEUNiZfrls72qZ28Dx6tQ1xPqj1KykSU/NIaZoavXTQRFazaVabiILEvZk7GYG
         wRQu6/DjhCbPcDMJ1c2W2E+wBtz0/S5BrMn8tHXSrd+Hm/npvWBbTBCfR5sfjA5awjUq
         me5i42sa+3TThyDegkMMkN6MRDeCF1cv9jspaSM/0YFxWCmi5STS57oTrWhCSHLA24W5
         BijX4h/pX8/8yXylPTFtZRmKRmMistMnB68ttXDGopf5MOvGOagUeYoIB+fq2lg+p8l3
         1aug==
X-Gm-Message-State: AOAM532msUddgr8yXImBUi6+lm0KGO43JhAs4gceO2YaPwQaYYysg5IY
	t3Wwe/+Z0a/QmHe7I2vIDYSvwH42NKpP4/2Inmg7YA==
X-Google-Smtp-Source: ABdhPJzDk4xareUQkBQSNZRxRSYxzoeY5zSgGoPp9z3/x9XlUjsIxuVm1HaN2n2bXuM1Gl/1/KDfzaA7lh5uiELirgc=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr1986232oie.193.1647361144031; Tue, 15
 Mar 2022 09:19:04 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Mar 2022 11:19:03 -0500
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YjC1OLsB8/JXLEzF@google.com>
References: <20220314232214.4183078-1-swboyd@chromium.org> <20220314232214.4183078-2-swboyd@chromium.org>
 <e7f9466e-03c9-7754-0dc6-a04823d1047a@canonical.com> <YjB0JOKysPpg2KGF@google.com>
 <9ec3c26a-3b85-4bea-5a5b-de9ac570cfca@canonical.com> <YjB46Sq3IwvgR8MB@google.com>
 <CAE-0n51uDh2Cf_wGpAVH1t=T0A1eTT=+KU3WMtxtyPL3kLDAdA@mail.gmail.com> <YjC1OLsB8/JXLEzF@google.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Mar 2022 11:19:03 -0500
Message-ID: <CAE-0n511YyyfXoCOKpzm3ca0-sE9_wpby31XDu-eGQts=-kV2Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: Add ChromeOS fingerprint binding
To: Lee Jones <lee.jones@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Benson Leung <bleung@chromium.org>, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, 
	Guenter Roeck <groeck@chromium.org>, Douglas Anderson <dianders@chromium.org>, 
	Craig Hesling <hesling@chromium.org>, Tom Hughes <tomhughes@chromium.org>, 
	Alexandru M Stan <amstan@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Lee Jones (2022-03-15 08:48:08)
> On Tue, 15 Mar 2022, Stephen Boyd wrote:
>
> > Quoting Lee Jones (2022-03-15 04:30:49)
> > > It's tough to say from what I was sent above.
> > >
> > > But yes, sounds like it.
> > >
> > > We do not want any device 'functionality' in MFD ideally.
> > >
> >
> > I put it next to the existing cros-ec binding. The existing binding is
> > there because of historical reasons as far as I know. Otherwise it
> > didn't seem MFD related so I didn't Cc mfd maintainer/list. New file
> > additions don't usually conflict with anything and this is in the
> > bindings directory so the driver side maintainer would be picking up the
> > binding.
>
> That's not how it works unfortunately.
>
> This file is located in the MFD bindings directory, so I would be
> picking it up (if it ends up staying here).

The way it works is arbitrary and up to maintainer's choice. I'll move
it out of the mfd directory :)
