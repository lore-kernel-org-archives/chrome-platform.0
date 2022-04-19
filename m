Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1D11374
	for <chrome-platform@lists.linux.dev>; Tue, 19 Apr 2022 17:35:25 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-e2442907a1so18251395fac.8
        for <chrome-platform@lists.linux.dev>; Tue, 19 Apr 2022 10:35:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=agHIs+VZdJS46Y3XqFiZ3UMC8Gt+kedIPWtIqR6xPgU=;
        b=dswLEU5P2DhO7PyTlxe4R8xRzeg9AeO1LnbaSnSZDTZ3w4UkhJ6KYmMmwZZ+RBtTon
         WcmEm5hgx5dgpCR1I59jtjMLVHIiCNeiaXu3xzgbEaXnxuPdsLJ8x5/nE99fFxr5rcWe
         lrgqUQ9+OAmUzSSLK9w+NiwHuVZYmlrCmPpSnQFCQscoW/gcIeDIBBlOyhsgIPiSh6L2
         5kY5uvOgzr3ozrYUzcT2YfvuwxITbNTBhSW+R+xXzhfMqQEvXDhS8naCzoBE6PfDtTTs
         sg76fuRs3SH7fyEcnHHPHy0jm36riV2qCGlrP047g3xVoDIPFIGBqePeTGubFTkgq59V
         hn7Q==
X-Gm-Message-State: AOAM530pzJNm0M/2CXCk3ZrYx4qsLbQlsJ7CNXg4RmPR1daq4Ljhy2Ra
	2bXmgkF9b5mlJh+3kRmmUw==
X-Google-Smtp-Source: ABdhPJx32JE7TB2oA/u+IPAoml9rgBJIqcRsZxb9C1XqGhMlj/ji7s0MeOgBFLzylMO1ZhiiEzpLOg==
X-Received: by 2002:a05:6870:14c3:b0:da:3703:329b with SMTP id l3-20020a05687014c300b000da3703329bmr8561030oab.54.1650389724553;
        Tue, 19 Apr 2022 10:35:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q11-20020a056830018b00b0060470f9f5e3sm4741752ota.51.2022.04.19.10.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 10:35:24 -0700 (PDT)
Received: (nullmailer pid 3018580 invoked by uid 1000);
	Tue, 19 Apr 2022 17:35:23 -0000
Date: Tue, 19 Apr 2022 12:35:23 -0500
From: Rob Herring <robh@kernel.org>
To: Fabio Baltieri <fabiobaltieri@chromium.org>
Cc: chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Benson Leung <bleung@chromium.org>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v4 1/4] dt-bindings: add mfd/cros_ec definitions
Message-ID: <Yl7y29jgoB7GWWLf@robh.at.kernel.org>
References: <20220414092831.3717684-1-fabiobaltieri@chromium.org>
 <20220414092831.3717684-2-fabiobaltieri@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220414092831.3717684-2-fabiobaltieri@chromium.org>

On Thu, 14 Apr 2022 09:28:28 +0000, Fabio Baltieri wrote:
> Add a dt-bindings include file for cros_ec devicetree definition, define
> a pair of special purpose PWM channels in it.
> 
> Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> ---
>  include/dt-bindings/mfd/cros_ec.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 include/dt-bindings/mfd/cros_ec.h
> 

Acked-by: Rob Herring <robh@kernel.org>
