Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618292F24
	for <chrome-platform@lists.linux.dev>; Wed, 10 Aug 2022 18:36:46 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id 15-20020a17090a098f00b001f305b453feso3048051pjo.1
        for <chrome-platform@lists.linux.dev>; Wed, 10 Aug 2022 11:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=z73/wP9z665YsaV/uDYD+wi6MjcJk/XyGVgycD2feRY=;
        b=GCesbzgRbUeNcglykgQOzG+Q2EGPGkSq1JQG9RGFGHXpvf/Xub+RfbVhbB4Onwq59z
         lfAW+gLONLo9sprR3soPhZr076B7uZ+VxQ2kB/ZyHNi5NsuVhGSY5yrzT6GS9OJcJSv3
         NUYsxm0PRK+/jrK5SPJ8u5WFQfetM7KeATnCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=z73/wP9z665YsaV/uDYD+wi6MjcJk/XyGVgycD2feRY=;
        b=A14ifhSudTcVLX/damD+d9ENkP1pi5mFVInkmqejd82RHdQcV4kLKFvUCqLbWEiUws
         aDzJHZjZnN42p8iNjceBPIhidDwIOzMgQuOPEUS+xOWZiNU3FNqxJtym3ROiTJ8WvoZP
         KlBQZertg/B3ybYDYocPsNdXn8GPQC1pc6juhTeASopJnThSonobPD12JAjzHBaCxJjG
         9291Q4oubXk59m0qBkoKI1IhVGN8R1j5XA+CSjB48o/skDrwLs2uS//6pPmNjBHkPwJV
         2cQKEccwtOqcnulDS8l6a7Z5lw06LTa4LGQKE8xhB1YXzriyBH8Ni2M6uIBYuixRzWf7
         NqBA==
X-Gm-Message-State: ACgBeo05KKMkzp12pTft70WHZHxGu/tI83pn1aBp+w+VmgQbf4y5rMFz
	qM3p8Iq6WlWTHpDeTLO8pTkxZA==
X-Google-Smtp-Source: AA6agR6CqEED+d1nIP977dwhdcJatfkdkn8f/WnJslQTl/9kRO5X2uQslJIZAvUqqjXMmKvJtwTn7A==
X-Received: by 2002:a17:902:cf0c:b0:16f:9023:e07b with SMTP id i12-20020a170902cf0c00b0016f9023e07bmr25466298plg.143.1660156605778;
        Wed, 10 Aug 2022 11:36:45 -0700 (PDT)
Received: from chromium.org (137.22.168.34.bc.googleusercontent.com. [34.168.22.137])
        by smtp.gmail.com with ESMTPSA id n2-20020a170902d2c200b0016db774e702sm13413462plc.93.2022.08.10.11.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 11:36:45 -0700 (PDT)
Date: Wed, 10 Aug 2022 18:36:43 +0000
From: Prashant Malani <pmalani@chromium.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] dt-bindings: chrome: google,cros-ec-type: restrict
 allowed properties
Message-ID: <YvP6u8SRHswA1Iva@chromium.org>
References: <20220810143613.482724-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220810143613.482724-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

On Aug 10 17:36, Krzysztof Kozlowski wrote:
> Describe exactly what properties are allowed in Google Chrome OS EC Type
> C port, so the schema can properly validate the DTS.  Existing DTS
> defines always connectors with unit addresses, not a sole "connector"
> child.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Micro-nit: the tag in the commit message is missing a trailing "c" in
"cros-ec-typec". Other than that,

Acked-by: Prashant Malani <pmalani@chromium.org>
