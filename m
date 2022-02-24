Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D88184D
	for <chrome-platform@lists.linux.dev>; Thu, 24 Feb 2022 10:02:53 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id d28so2123265wra.4
        for <chrome-platform@lists.linux.dev>; Thu, 24 Feb 2022 02:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=40TX6IOrMXHDsEdOBMZQbSaofRg2Iai14g2HKUHylIw=;
        b=nIFsjDJSyJvelTiW19Y2pdK/O4i+9yNv5cuL+tRpK/le1Nl6LXGbhGsl7YWZsZxHt/
         Sbye4mwANzSPldhUUvl/v6UIK+pKfB2gBq3RTFFyXP+cugEnDFb/IqE1kumtGqXuPMGc
         zXOfnip7wWySwA7Vlm1AEVyeylQFIq1j3nczruP8t/zJxGz9cdfGCRYORw/KIvYQcJd5
         nXfSgnkBHZxifyKDchIWU6ulF0plIhwCqpFU6BdDUTlqjRxbb0+4HenZTwjfPDWtQo9/
         xjHoGUL3yPFRRUfiYHAWh5n+a+GdX6CLtJmYF1U3KbiU1tqiWq3f1fSLdn5gd9Bw9PXX
         9ezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=40TX6IOrMXHDsEdOBMZQbSaofRg2Iai14g2HKUHylIw=;
        b=eZpPF8sp5aMftN+3mzd9Rv96r8TsOYJfipX00tJExuhp+Z1YLOjgNqg7S8VNFUU5Jn
         Wrzs9Q2hXfXIpNe8pfoY44TDP6tYXW3Mid7LxzWNYZiJ6Gb2RhF0DWGXYfOEu94FXhdx
         WwLRHF7QcYApb/WVE5n1Pr0zE3LQlQb/o2vH0BjuTaoxRr/RCz+AUyOVKLOtftcYhvYE
         1oXzncsISnC+eY45SILu7Lu9R/uSjlEF7m5dNGq3F/0HUbPMGnHhJTz0p8PMlZ0gBhQ5
         Xozgztt7C1ECVkOzin938KHgt+IGn98tg2pfh9i71dDTGa8YLwVVDeu0154ImUhqAuPB
         lOEg==
X-Gm-Message-State: AOAM53360wf3xO2pWBYXILjpVKxhKAHA8KCSJQ4h78KYEXt9BXkZL/dn
	+65g4m89DqzGpAE0peoHSgoT7A==
X-Google-Smtp-Source: ABdhPJznPtWWQWN9tp5giTO0YPGHa54YOMlq33inQa44gWu66H4/BUMLLet4Alf7TttQUZm0TrpHWw==
X-Received: by 2002:a05:6000:178d:b0:1e8:310a:5a51 with SMTP id e13-20020a056000178d00b001e8310a5a51mr1599998wrg.642.1645696971765;
        Thu, 24 Feb 2022 02:02:51 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id c5sm2650428wrr.54.2022.02.24.02.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 02:02:51 -0800 (PST)
Date: Thu, 24 Feb 2022 10:02:48 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Rob Herring <robh+dt@kernel.org>,
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
Message-ID: <YhdXyBvAbdHzc4gH@google.com>
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
 <20220214081916.162014-2-krzysztof.kozlowski@canonical.com>
 <YhX7UZSDaqNyD1rV@google.com>
 <3248917.W5uN0jUHDo@phil>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3248917.W5uN0jUHDo@phil>

On Wed, 23 Feb 2022, Heiko Stuebner wrote:

> Hi Lee,
> 
> Am Mittwoch, 23. Februar 2022, 10:16:01 CET schrieb Lee Jones:
> > On Mon, 14 Feb 2022, Krzysztof Kozlowski wrote:
> > 
> > > Include generic pwm.yaml schema, which enforces PWM node naming.  Keep
> > > the old name in bindings as deprecated.
> > > 
> > > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > > ---
> > >  Documentation/devicetree/bindings/mfd/google,cros-ec.yaml    | 4 ++++
> > 
> > Acked-by: Lee Jones <lee.jones@linaro.org>
> 
> what is your expectation regarding this patch?
> 
> Are you planning to merge it or are you expecting this to go through
> some other tree?
> 
> The binding-change here is backward-comaptible in that the old
> node-name is still in it, only marked as deprecated, so in theory
> this patch should be able to be applied on its own without
> causing defects.

In an ideal world, it would be broken up and I would take the MFD
part.   Is that possible or are there dependencies?

Or, worse still, does the whole set need to be applied at once?

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
