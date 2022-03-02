Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658276136
	for <chrome-platform@lists.linux.dev>; Wed,  2 Mar 2022 21:54:23 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id x193so3095133oix.0
        for <chrome-platform@lists.linux.dev>; Wed, 02 Mar 2022 13:54:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FT7qXkd3XFxv8GYIIHo4RitAFBU5L9E0sYaLEAc3SV8=;
        b=WECSlaAjh5/217vcH52WHP+toPY/P/vCip+ITJI8BOZqSLJh4yePqirwc4L5MJGC7/
         tnoDc/3qZFa22vlH9AJ65N/sb51Rk6k7B4grAfeYn+PeFMTwpj4gncKpxI9NX6GWVLoV
         XO7cN27ZFQseTTjJyiCff56sMFMcCRIkj10pxfSaFVDech6cG2q70KRIaYW/jHxze1Fa
         NbFS70WJ1vbXNq0HK5XBb7A2vpy8IGM3awHv2Sjn+wmNESqfgsGgUpU5ezjwMuexrFHX
         SpVkBCHJWSf5GtMDsM0uKdVWTi6h4szEa0ouO/eRh7XxZnd+ukyiHM1xudn653/Hnk9f
         o5gA==
X-Gm-Message-State: AOAM531fb+noNBlgeq8ogMmRIPn7afe6I3t/xIA2aqYXb6s7bYTTEg53
	daafor1sDt5xQMNkFq+gwg==
X-Google-Smtp-Source: ABdhPJxECvNsWJt/n5xjiUpSjwKgUMd5ZuCLEID3xAjfwZicO5bFYzbFaHZ+FJejuPb9qOGrg3tA6Q==
X-Received: by 2002:a05:6808:179b:b0:2d9:6b9b:b24e with SMTP id bg27-20020a056808179b00b002d96b9bb24emr1770709oib.149.1646258062522;
        Wed, 02 Mar 2022 13:54:22 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id i2-20020a056870c1c200b000d7355852b3sm172623oad.19.2022.03.02.13.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 13:54:21 -0800 (PST)
Received: (nullmailer pid 125552 invoked by uid 1000);
	Wed, 02 Mar 2022 21:54:20 -0000
Date: Wed, 2 Mar 2022 15:54:20 -0600
From: Rob Herring <robh@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, bleung@chromium.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, groeck@chromium.org
Subject: Re: [PATCH 3/5] dt-bindings: add google,cros-kbd-led-backlight
Message-ID: <Yh/njNrNgy+MWtz0@robh.at.kernel.org>
References: <20220214053646.3088298-1-tzungbi@google.com>
 <20220214053646.3088298-4-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220214053646.3088298-4-tzungbi@google.com>

On Mon, 14 Feb 2022 13:36:44 +0800, Tzung-Bi Shih wrote:
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  .../chrome/google,cros-kbd-led-backlight.yaml | 35 +++++++++++++++++++
>  .../bindings/mfd/google,cros-ec.yaml          |  3 ++
>  2 files changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/chrome/google,cros-kbd-led-backlight.yaml
> 

Acked-by: Rob Herring <robh@kernel.org>
