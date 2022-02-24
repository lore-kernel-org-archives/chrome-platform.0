Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9FC185D
	for <chrome-platform@lists.linux.dev>; Thu, 24 Feb 2022 11:44:33 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id v21so2566160wrv.5
        for <chrome-platform@lists.linux.dev>; Thu, 24 Feb 2022 03:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=By0koPKvfxcMR4uami4q6nEo7H/plZ6B7hXdRpr9zos=;
        b=i8qMcPf1Q3mE5GCDoGg5rN2z7KNR4v1QkWzdeaMyW3k3kXIOY/PIZZoO6jIzrS9GXf
         N9J6MgxVHAl8cKqQeyfCQQDG4qPlkD5aYJCyfFSPkTwQNcaQ9gYSWj1kbxmzh8jUh+4o
         WC4u08jO9c1zBuBLLsiQa8Spwvz7ssr2B3BAWulYxl4FnxeAYyvP13FtiYVEawCyqc0q
         +yzoQlx6Y4aTL5/fh1nHkgZbx5plCCjmpVTf1t+MWsHwZBuivtQnySk8fM3G6A5NiXCZ
         sXHHBvZ4aTdUjMWeM2AYEuCPcWqA5p7ojUQdIZHcKCaRG/P808wP/zP8G+Ji2NOxc4zc
         g81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=By0koPKvfxcMR4uami4q6nEo7H/plZ6B7hXdRpr9zos=;
        b=lNN2IzyGldQ9rXdVOAFJ3VM9CF+cU6SWA6Srzq7MChXF7An9U58TNPwEjWNCljyPeu
         zdsEDPEjjjo5eoJ/4SkvijJvBRZUxeqd6UFC7B5nbV45HX6q7YqeDaEsMLCuFC32FATA
         oQ4EyhOy1mHooRv6H4jx3ObiqJYfONuAD6iiJVHwMZ8lGfMBJO5+4tpNS901YaxCFkHP
         FwJuxXdyuVo6D2fjM0obcrucAfRPfmrS2NErK7Cy9lMECIjYyv9qiR1OrGtKrmWSbEjI
         TTTjcjPZEuXC5iWO2+/KsQ+/MW3pOG2IR8I2gewYoJpcvyyiN7PrYMxO9bTm0IcQ5NCy
         rv8A==
X-Gm-Message-State: AOAM533V991kamZQSby8DY8zLv/uNNf9CH/Ia3YXcbgcy7b2ItAzyZWS
	Rbnevnpvbe+S3D+B9ZVUNMEj6w==
X-Google-Smtp-Source: ABdhPJxFyXliu42yySrAeEXNzyWqVzug0J0Iti33/VcWEhV2LbIEmmE4MOW6ths5lINZk21h7SfROw==
X-Received: by 2002:a05:6000:186d:b0:1ea:8e14:21c5 with SMTP id d13-20020a056000186d00b001ea8e1421c5mr1880571wri.635.1645703071405;
        Thu, 24 Feb 2022 03:44:31 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id u14sm3164913wmq.41.2022.02.24.03.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 03:44:31 -0800 (PST)
Date: Thu, 24 Feb 2022 11:44:28 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: pwm: google,cros-ec: include generic
 pwm schema
Message-ID: <YhdvnCnXbzFz63ys@google.com>
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
 <3248917.W5uN0jUHDo@phil>
 <YhdXyBvAbdHzc4gH@google.com>
 <1817486.VeUe9BSz9F@phil>
 <ad6e347b-a25b-5309-2a6a-8fd3faba256c@canonical.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad6e347b-a25b-5309-2a6a-8fd3faba256c@canonical.com>

On Thu, 24 Feb 2022, Krzysztof Kozlowski wrote:

> On 24/02/2022 11:06, Heiko Stuebner wrote:
> > Am Donnerstag, 24. Februar 2022, 11:02:48 CET schrieb Lee Jones:
> >> On Wed, 23 Feb 2022, Heiko Stuebner wrote:
> >>
> >>> Hi Lee,
> >>>
> >>> Am Mittwoch, 23. Februar 2022, 10:16:01 CET schrieb Lee Jones:
> >>>> On Mon, 14 Feb 2022, Krzysztof Kozlowski wrote:
> >>>>
> >>>>> Include generic pwm.yaml schema, which enforces PWM node naming.  Keep
> >>>>> the old name in bindings as deprecated.
> >>>>>
> >>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> >>>>> ---
> >>>>>  Documentation/devicetree/bindings/mfd/google,cros-ec.yaml    | 4 ++++
> >>>>
> >>>> Acked-by: Lee Jones <lee.jones@linaro.org>
> >>>
> >>> what is your expectation regarding this patch?
> >>>
> >>> Are you planning to merge it or are you expecting this to go through
> >>> some other tree?
> >>>
> >>> The binding-change here is backward-comaptible in that the old
> >>> node-name is still in it, only marked as deprecated, so in theory
> >>> this patch should be able to be applied on its own without
> >>> causing defects.
> >>
> >> In an ideal world, it would be broken up and I would take the MFD
> >> part.   Is that possible or are there dependencies?
> > 
> > That is also what Krzysztof had in mind - see his reply to patch4.
> > Binding going through the MFD tree and soc maintainers applying
> > the individual dts patches.
> > 
> > As written the binding change is backward compatible, so no harm.
> > 
> > I was just confused by the "Acked-by" and wanted to clarify how you
> > see it ;-)
> >
> 
> The bindings patch should not be split more, but itself can be taken
> alone. DTS patches can go via SoC maintainer trees.

So in answer to Heiko's question, either Thierry, Rob or I can take
the patch.  I'm not overly fussed which.  If I am to take it, I need
Thierry's go-ahead and info on whether he requires a PR or not.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
