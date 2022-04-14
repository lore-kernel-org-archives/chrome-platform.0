Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8A715A7
	for <chrome-platform@lists.linux.dev>; Thu, 14 Apr 2022 19:24:29 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 123-20020a1c1981000000b0038b3616a71aso3850729wmz.4
        for <chrome-platform@lists.linux.dev>; Thu, 14 Apr 2022 12:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TzIdGf0orlPzlsnGm4d1/wOp9Ug675hNbMOMT58Ay5o=;
        b=anV+lLXHdPoCvNvo4uqR9yVnraezCiI/gR7f3+/73+6+e/d+CvXkykdbFlf45Cak9p
         yT/StOCyPW9e06boapRmdlJRlJoo9WnJYC5nAZfit00iz+WieHSZA23/C1Ws48LVJH7I
         o3k9PJAs5zpKNhfC1/M859nQEVYjTW6pQhAYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TzIdGf0orlPzlsnGm4d1/wOp9Ug675hNbMOMT58Ay5o=;
        b=VBpYEsXfzoYetOARCHlS/ZPbpGjseiwv3KycRlS/WKxgEJGP8JL0bRYFlZaE8RliO7
         bGhs4URRvNkLZC09hppAHHGZOETVqgdT1/m/80qzC7J8lrjk6cfJWCrDIQR3j4LjTBnJ
         e49rUPc0wLdO6JVW5eRqy4I8o6sA6vpoq/ROjZw3yZRltv/VrJ/+oNR95uJQfQ557Rdo
         deuJtmSwkKQyDEbsJdJWuCBAi1ugo3uxefCLOR02/+2UUUW39s7DdhpAE380JdeVXppC
         t0rL1WFNXqN8V9DTqPgxyzHCdGPY3oUo+MTVjd39wj1lGesjyFFMxAAHtcJreqWYi9uB
         FoYw==
X-Gm-Message-State: AOAM532fKdfH1l9ne4r5XK6wWIIrV9hwh2pW0HFTRxEU/b9ttaAMIpYP
	oKIAwieJUpuCpBDrU+0bR0/c8w==
X-Google-Smtp-Source: ABdhPJxgazeepxjQX/HIuYCUv+KWXKHE1HKC70Rms9bSy5mDaYHGosh9IMV8XRSLBN/aN4BdLq7q8w==
X-Received: by 2002:a05:600c:1e85:b0:38c:ef05:ba5d with SMTP id be5-20020a05600c1e8500b0038cef05ba5dmr74515wmb.119.1649964268274;
        Thu, 14 Apr 2022 12:24:28 -0700 (PDT)
Received: from google.com ([37.228.205.1])
        by smtp.gmail.com with ESMTPSA id v13-20020adfe28d000000b0020375f27a5asm2608680wri.4.2022.04.14.12.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 12:24:27 -0700 (PDT)
Date: Thu, 14 Apr 2022 19:24:25 +0000
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Benson Leung <bleung@chromium.org>,
	Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Guenter Roeck <groeck@chromium.org>, linux-pwm@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v4 3/4] dt-bindings: update google,cros-ec-pwm
 documentation
Message-ID: <Ylh06cG7bII6rG77@google.com>
References: <20220414092831.3717684-1-fabiobaltieri@chromium.org>
 <20220414092831.3717684-4-fabiobaltieri@chromium.org>
 <1649938809.993469.1698375.nullmailer@robh.at.kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1649938809.993469.1698375.nullmailer@robh.at.kernel.org>

On Thu, Apr 14, 2022 at 07:20:09AM -0500, Rob Herring wrote:
> On Thu, 14 Apr 2022 09:28:30 +0000, Fabio Baltieri wrote:
> > Update google,cros-ec-pwm node documentation to mention the
> > google,cros-ec-pwm-type compatible.
> > 
> > Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> > ---
> >  .../devicetree/bindings/pwm/google,cros-ec-pwm.yaml      | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml:27:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> ./Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml:30:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> 
> dtschema/dtc warnings/errors:
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:

Missed out on that, will fix and resend.

Thanks!

> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 

-- 
Fabio Baltieri
