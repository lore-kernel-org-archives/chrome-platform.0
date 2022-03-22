Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39594C64
	for <chrome-platform@lists.linux.dev>; Tue, 22 Mar 2022 12:07:24 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id p184-20020a1c29c1000000b0037f76d8b484so1458706wmp.5
        for <chrome-platform@lists.linux.dev>; Tue, 22 Mar 2022 05:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=e3ViaRO1Rr2sI+l49irYHhSyo75k9Je9Jgyertt2k5E=;
        b=GgC5/8cQ71t5bSlOD9BnaRPBc608es5k4URD9kvqaEkT5DWFsenaaorsTuFWteaFEd
         hpAgAGB6IWCH2dJaavSJ8jFwayIZcsQp1IRPc0iau+6hitpeD+xeFMSCkcUaPvtQGyIw
         AWVLJ3L+lhqEBpo73QXJIPEoxkhP5agkIxkUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e3ViaRO1Rr2sI+l49irYHhSyo75k9Je9Jgyertt2k5E=;
        b=sfE2PtYF7A9Otg66eFobOoNTtOb4PPmJt6i2hjFntPOcdARZpV68WTVqvfoGBScmxg
         zqs46LKbhu0nHfS/eNF21T4G+fJAEd/zU20TK1WTKL7ResB2NxRNtlqW0I7nzC2EE1WK
         +VK/R9QdHYF4RYqaCx7Btw0zAxBM/TG7iC0iRwZzcM5nsyW+jTfGm+LFqsi+p3KKiuWV
         C7zfeAnf8Y+XU8bS4ghjAeRb0A2v4bQ3roQIiAk4MK4MFJy238f93l4J7myVkrdlQElK
         VHuTpX7U1NB6NLZsUT0cJ7NtEcdiMxFsTigoOUa3trSVAcGa5RRGO9tI1oBXYf5T3VZd
         vtXQ==
X-Gm-Message-State: AOAM5310Atkox8lPqkmQV7RTRPbAbqsxfJFENy3PZqN7k/PPgflUVoyl
	qx63yD/NKTrvdqO5CNcgewvICw==
X-Google-Smtp-Source: ABdhPJzzDktpUdftxhms3YkoLwxzADyuJj5fnu5TzuR25YBbuhb6hxkCKVsQ1/mv6cY18+N8sYJWbw==
X-Received: by 2002:a5d:6da9:0:b0:204:16b9:ce7d with SMTP id u9-20020a5d6da9000000b0020416b9ce7dmr6518191wrs.293.1647950842504;
        Tue, 22 Mar 2022 05:07:22 -0700 (PDT)
Received: from google.com ([37.228.205.1])
        by smtp.gmail.com with ESMTPSA id m28-20020a05600c3b1c00b0038cb3e1773asm1704764wms.44.2022.03.22.05.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 05:07:21 -0700 (PDT)
Date: Tue, 22 Mar 2022 12:07:19 +0000
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	chrome-platform@lists.linux.dev, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: add mfd/cros_ec definitions
Message-ID: <Yjm797USkb6nUGXq@google.com>
References: <20220321143222.2523373-1-fabiobaltieri@chromium.org>
 <20220321143222.2523373-2-fabiobaltieri@chromium.org>
 <2942ea7a-3e23-7df1-daff-c266a82682fb@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2942ea7a-3e23-7df1-daff-c266a82682fb@kernel.org>

On Mon, Mar 21, 2022 at 04:46:49PM +0100, Krzysztof Kozlowski wrote:
> On 21/03/2022 15:32, Fabio Baltieri wrote:
> > Add a dt-bindings include file for cros_ec devicetree definition, define
> > a pair of special purpose PWM channels in it.
> > 
> > Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> > ---
> >  include/dt-bindings/mfd/cros_ec.h | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >  create mode 100644 include/dt-bindings/mfd/cros_ec.h
> > 
> > diff --git a/include/dt-bindings/mfd/cros_ec.h b/include/dt-bindings/mfd/cros_ec.h
> > new file mode 100644
> > index 000000000000..e02414eae622
> > --- /dev/null
> > +++ b/include/dt-bindings/mfd/cros_ec.h
> > @@ -0,0 +1,18 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> 
> Same license as for bindings (GPL-2.0-only OR BSD-2-Clause), unless you
> cannot (is it a derivative work?).

Ack, it's not, will change in v2, thanks!

> 
> 
> Best regards,
> Krzysztof

-- 
Fabio Baltieri
