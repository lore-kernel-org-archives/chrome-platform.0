Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0078F1373
	for <chrome-platform@lists.linux.dev>; Sun, 19 Mar 2023 12:11:37 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id fd5so36775757edb.7
        for <chrome-platform@lists.linux.dev>; Sun, 19 Mar 2023 05:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679227896;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zjQK98wMTvC2q3E7fdiQTGy4CfE9nib0P1aeqr32BDM=;
        b=D1fP3GN2Ho75ugMAWO87ldGgGppe72Z3Y/fiWx4nspzwK7rloaOBoF9R19b0JbiRD3
         /mLXqx0QXb4f0L0ilB3j1w+e9Fwq4+LAGzNO+pIUKuu81K+Dhs2nyPPhOdR1hF6bDzbu
         0y3KFtdlTTRo3LySMTaY9gOhQSMrBFk88A8n+//C69MZejED+xn55zfOI7TYqDszOPc+
         fKWW/risjXSXRSuUrm5fQoJv/1hToGx7tQSgd3glFjr0Y54XW8bJZTY/vYLNslJ4g9T4
         gGptc50sPXOMaTIvYxS6fPpQP0vMqlYdWsQdm9P5lE+f6mWTqVQd8o0LR1x8SVnpFN1o
         NnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679227896;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zjQK98wMTvC2q3E7fdiQTGy4CfE9nib0P1aeqr32BDM=;
        b=a4lhtjZsvQ+AY4fNVhBotWVX22XWANDUNVClc2Oix1SxQXn6UuNOYkISpeDL8Yovgv
         7eLcSHg3BUroohrycplWFt2yYcqs89qDUql5+SFGr3lq47U9Cy9De+eazoeVNsGSsEWm
         Or6A9PwOO4kzpT4T/YwYNAxvSEU2f+2m1uDWGZ2/6z90d2K2jXtlelywFVniIqp67KvM
         CTlX2znUN9JDFip1eB/yBdBULjjGilBDFURjytY2eWBpo/H9M14Int8Pr4RISesDsP5i
         pYeFXw1OQT5UjjXuLhQ7bc5OpTjeKWJk7pA81ypltJgTWLofbwVzBFn7I1jxKbUaCtA9
         T2Ag==
X-Gm-Message-State: AO0yUKVVO5fqW1E/apdamAuuhCAx51h9rkydfwoI2l5FHYEuvMQe2tlT
	RcZ6dVHuT6Kr2pVKdhnhcI3+4g==
X-Google-Smtp-Source: AK7set8iy8PHLbwswKclQFdAmwnEMv+GMXgczERgugb4jIY36ndBXldESO9YpLHBZGsBIL348OtAog==
X-Received: by 2002:a17:906:35d6:b0:932:be78:a728 with SMTP id p22-20020a17090635d600b00932be78a728mr5583291ejb.68.1679227896102;
        Sun, 19 Mar 2023 05:11:36 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id ja21-20020a170907989500b0093338259b2bsm1635711ejc.207.2023.03.19.05.11.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:11:35 -0700 (PDT)
Message-ID: <652a5f5e-6f01-4e5b-d1e3-4161b58d5ae5@linaro.org>
Date: Sun, 19 Mar 2023 13:11:34 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] regulator: dt-bindings: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Robert Marko <robert.marko@sartura.hr>, Luka Perkov <luka.perkov@sartura.hr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
References: <20230317233616.3968003-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317233616.3968003-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/03/2023 00:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

