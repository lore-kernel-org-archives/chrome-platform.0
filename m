Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66152FAF
	for <chrome-platform@lists.linux.dev>; Wed, 16 Mar 2022 07:25:05 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id h23so1017345wrb.8
        for <chrome-platform@lists.linux.dev>; Wed, 16 Mar 2022 00:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=8BgdaLCDN6ytbgA7o8PQn3N09wAKTlqYsotJMbZ94HQ=;
        b=t7PLX2bnFJvh2OuH8ldQ3pGj0uGpLjvI9yGGDUiqTDd7SSumcM4cnuTcNRyMpaRwAC
         h5HtFuQ/ZdMrdt2qM+73TPfgoqxj+IcVeFIA256djzYWu7ghKi5saQi0lFK3vl71MPD1
         02oa4G8StCr3dhefjZqhhiTuzY/JBONjGDmZTPnsxwlf2yb1U/mztbaxUu2ndWHRXc7q
         +WWXFgf4jFI/4r3oUahqOe+JpxT03Ep9hmPGg3S83ztNt8A2YPQqgPIjE09lYpOjIBT9
         4GMdGjAX1+hIFKtm0KnIyuYypZghIOV5P6DTbMmIVJ5HufNysqVkMaEI/nklElepRLn4
         Edaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8BgdaLCDN6ytbgA7o8PQn3N09wAKTlqYsotJMbZ94HQ=;
        b=7Yw4pbvg6/H1vBSP9yQQ4VWiAKpxN/AuwhxWtXzSK70WHP+PZXDB26esmvsQQde96c
         crNp+2LI4FaiV1c98+a5jYV76mt5ken41VF/Fg1uuFgYpoHC4L960jOp4rVOVff+ptcs
         YKFapCf4OlwnwlvwlYiunBi79yOvffyeY06Q3bTaiT2N5qqU6MIUnw/HZxFHaIMcx7iw
         dtxtzIb6uXxDmIMYQmWJLQcqmYP1JSWHHeolX50AUMq9GbzmpfySD4ykx+J2lPrv0CSr
         zX5oWQlBAAjg1KJO8n2TfvVj/5f6Plwya6xnOktqTRn5O7/by1PvlNNE87fV+Q9iajgL
         4NLg==
X-Gm-Message-State: AOAM532GzrJMdcNml2TdAbS1BE/J0BKxwAHvKeZlPc8eweE0jY1Aocka
	MyE7Y4IPBhfPsminNyR6q7+nzw==
X-Google-Smtp-Source: ABdhPJwUBkwggjNof9CJhQ+Bfj+6ZOtK4GoDq5/024E6T6MIY1EyUUZpVIGGx2JSQ6fwq8YH99lWww==
X-Received: by 2002:adf:e38f:0:b0:1f0:3383:77d9 with SMTP id e15-20020adfe38f000000b001f0338377d9mr22651010wrm.599.1647415504002;
        Wed, 16 Mar 2022 00:25:04 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id p14-20020a5d59ae000000b00203dcc87d39sm1559468wrr.54.2022.03.16.00.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 00:25:03 -0700 (PDT)
Date: Wed, 16 Mar 2022 07:25:01 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Craig Hesling <hesling@chromium.org>,
	Tom Hughes <tomhughes@chromium.org>,
	Alexandru M Stan <amstan@chromium.org>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: Add ChromeOS fingerprint binding
Message-ID: <YjGQzeIz7kGPOV1H@google.com>
References: <20220314232214.4183078-1-swboyd@chromium.org>
 <20220314232214.4183078-2-swboyd@chromium.org>
 <e7f9466e-03c9-7754-0dc6-a04823d1047a@canonical.com>
 <YjB0JOKysPpg2KGF@google.com>
 <9ec3c26a-3b85-4bea-5a5b-de9ac570cfca@canonical.com>
 <YjB46Sq3IwvgR8MB@google.com>
 <CAE-0n51uDh2Cf_wGpAVH1t=T0A1eTT=+KU3WMtxtyPL3kLDAdA@mail.gmail.com>
 <YjC1OLsB8/JXLEzF@google.com>
 <CAE-0n511YyyfXoCOKpzm3ca0-sE9_wpby31XDu-eGQts=-kV2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE-0n511YyyfXoCOKpzm3ca0-sE9_wpby31XDu-eGQts=-kV2Q@mail.gmail.com>

On Tue, 15 Mar 2022, Stephen Boyd wrote:

> Quoting Lee Jones (2022-03-15 08:48:08)
> > On Tue, 15 Mar 2022, Stephen Boyd wrote:
> >
> > > Quoting Lee Jones (2022-03-15 04:30:49)
> > > > It's tough to say from what I was sent above.
> > > >
> > > > But yes, sounds like it.
> > > >
> > > > We do not want any device 'functionality' in MFD ideally.
> > > >
> > >
> > > I put it next to the existing cros-ec binding. The existing binding is
> > > there because of historical reasons as far as I know. Otherwise it
> > > didn't seem MFD related so I didn't Cc mfd maintainer/list. New file
> > > additions don't usually conflict with anything and this is in the
> > > bindings directory so the driver side maintainer would be picking up the
> > > binding.
> >
> > That's not how it works unfortunately.
> >
> > This file is located in the MFD bindings directory, so I would be
> > picking it up (if it ends up staying here).
> 
> The way it works is arbitrary 

Correct.

> and up to maintainer's choice.

Which *should* be reflected in MAINTAINERS and by extension
get_maintainer.pl.  As is the case here.  :)

> I'll move it out of the mfd directory :)

That does sound like a good solution, thanks Stephen.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
