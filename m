Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36096931
	for <chrome-platform@lists.linux.dev>; Tue, 22 Feb 2022 21:13:34 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id k13-20020a4a948d000000b003172f2f6bdfso19477024ooi.1
        for <chrome-platform@lists.linux.dev>; Tue, 22 Feb 2022 13:13:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cgkndvT1T4jmwO27r780XgLtHhcjKRbYMWE4rDOy7BI=;
        b=Tyu6z8NPv6cAOYSY+CHMN52FWpRXtl26kiEXk2Do5Ca+DBXR3twaG/+UJhbWJgy6yP
         PGmOV2nFzFI/aW7heyjffv2zQhcuLfwlCVpVIcoAwEm4swz+Ad9ZQ6oPaGZobe3tTxUs
         4WAiMpr9BJK/q/6e31N/AZCCKtpKsit+vvU8GfJVIUqBH3hoC8/wBzR4CDHOY0XCoDhE
         0zAta/EUOmidfobLa9Ck/TaWGfoMBQlttCmWU/C3Sqk85od9lgI9JcHUlJ88dxrz2pwX
         u4DX1JrFBNjXxmguGEapXE5c3tqDq+6mAoPT7Nd1bd9zjyUW5t191v2s7FnsiFMoY4yK
         JLYA==
X-Gm-Message-State: AOAM533UetgxzVZH6/9jhfmwkphaiQQkTdlIo9rQP/+JkwNLVqPgEMJR
	gl3UPHOp9rhJetkM6Yic7Q==
X-Google-Smtp-Source: ABdhPJy2NX8pMjrtMgNUu4fjsnzN/bbxQgfvS1zRIpcdc0Lc8SuOVgeKX9OsMW7ynJcbMh2oqPNIZw==
X-Received: by 2002:a05:6870:e38e:b0:d5:20e6:2b63 with SMTP id x14-20020a056870e38e00b000d520e62b63mr1599153oad.141.1645564413901;
        Tue, 22 Feb 2022 13:13:33 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bj38sm6235745oib.20.2022.02.22.13.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 13:13:33 -0800 (PST)
Received: (nullmailer pid 3597239 invoked by uid 1000);
	Tue, 22 Feb 2022 21:13:31 -0000
Date: Tue, 22 Feb 2022 15:13:31 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>, Benson Leung <bleung@chromium.org>, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, linux-pwm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/4] dt-bindings: pwm: google,cros-ec: include generic
 pwm schema
Message-ID: <YhVR+66zwVrqs1QQ@robh.at.kernel.org>
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
 <20220214081916.162014-2-krzysztof.kozlowski@canonical.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220214081916.162014-2-krzysztof.kozlowski@canonical.com>

On Mon, 14 Feb 2022 09:19:13 +0100, Krzysztof Kozlowski wrote:
> Include generic pwm.yaml schema, which enforces PWM node naming.  Keep
> the old name in bindings as deprecated.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  Documentation/devicetree/bindings/mfd/google,cros-ec.yaml    | 4 ++++
>  .../devicetree/bindings/pwm/google,cros-ec-pwm.yaml          | 5 ++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
