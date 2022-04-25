Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0207133D6
	for <chrome-platform@lists.linux.dev>; Mon, 25 Apr 2022 21:58:57 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id z2so18706727oic.6
        for <chrome-platform@lists.linux.dev>; Mon, 25 Apr 2022 14:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=giYEePQGwfyo/twGmZzP8uZHE1niv7Jue0jlfyNBG/w=;
        b=NJylzGU47kCtZ0AEDCLQtRIrdXWMRgicVTy2r1DOtCIVCcRiD4rUAoRk1kTNvV1cUT
         s8Lkq7bh6fiLJmfrDmDNcdElHw+5bVgIrVm6bPtKgkXj9Kxd0xWlIwx+fqlSiuLKuLwi
         VSS74b4WXXlLJYpGM23PI8e6Bs5jp64svrBISUbJ30O/rUNTGtQoFZaiLkkqEZgbmKSB
         gcR6zDkKTYnsM/mID8BessvNuilUVrvnvlgMqpMXX/P2TM61f+cUq6MGNNEtkSqE2qNs
         0ryVqdh2lSPuBYJZDNtJisC38TMtanWlWaZTiYeKGP1sgy/ypBwGlH/iKxnfWJRsx5Wf
         Vtpw==
X-Gm-Message-State: AOAM5327RpqSS1kFxWTHuUEA5jetk9tQFnwSUBSqNtIeDF48jEsGcDWV
	o5+ov0+5BRJ1hqLvXSM39j4ppnf9tw==
X-Google-Smtp-Source: ABdhPJw07VATwV9Pi6FNS0BWGKvJTnXzmA3vvTfsUF3ThnLFDbsVteQpIwHVnR4kBKSYrwLDl8g+AA==
X-Received: by 2002:aca:6c5:0:b0:325:5bce:bbc1 with SMTP id 188-20020aca06c5000000b003255bcebbc1mr84990oig.221.1650923937051;
        Mon, 25 Apr 2022 14:58:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c25-20020a0568301af900b0060579b0abe2sm4225067otd.61.2022.04.25.14.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 14:58:56 -0700 (PDT)
Received: (nullmailer pid 367439 invoked by uid 1000);
	Mon, 25 Apr 2022 21:58:55 -0000
Date: Mon, 25 Apr 2022 16:58:55 -0500
From: Rob Herring <robh@kernel.org>
To: Fabio Baltieri <fabiobaltieri@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>, chrome-platform@lists.linux.dev, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] dt-bindings: update google,cros-ec-pwm
 documentation
Message-ID: <YmcZn8mWQveT5HzT@robh.at.kernel.org>
References: <20220420141556.681212-1-fabiobaltieri@chromium.org>
 <20220420141556.681212-4-fabiobaltieri@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420141556.681212-4-fabiobaltieri@chromium.org>

On Wed, Apr 20, 2022 at 02:15:55PM +0000, Fabio Baltieri wrote:
> Update google,cros-ec-pwm node documentation to mention the
> google,cros-ec-pwm-type compatible.

It would be good if the subject provided some clue what the update is. 
Every change is an update. And all bindings are 'documentation' so 
that can be dropped.

> 
> Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> ---
>  .../devicetree/bindings/pwm/google,cros-ec-pwm.yaml      | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

In any case,

Reviewed-by: Rob Herring <robh@kernel.org>

