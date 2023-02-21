Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2691878
	for <chrome-platform@lists.linux.dev>; Tue, 21 Feb 2023 09:45:44 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id s26so14603796edw.11
        for <chrome-platform@lists.linux.dev>; Tue, 21 Feb 2023 01:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/PK2BfkpiLdNJHc78+c5wCnYytKxPCOH9JODGsT+Sq0=;
        b=wjkgqNVhSpIjWrfFumTFJx9NgMl4d88J9tYLaPJDVzMEUrhFTXm1gbEnWULzRpmMF5
         tJ/H+k0EdaDoQr3mK2J+xP/gUt09/9hOFyEmwcakSn76K8tTqtNhLx+WMLjHoLuo9OGg
         CUA2x5PRVmk49bQyUljQv7HTxTO/jU1bnSh013iGeOin2d+60yafhbq68gT/VB2cZOaG
         aQRgAYMKMQ1Kw8YlxOPt9gaHiW85l47o6nfcZ1EoVffLPLYAPbo0SFlRXXgBMnFqWnFX
         JKYKWVDob4LI9A6+ZiYTZn05TzyByK2Kyw/KJsBTIpK8chqvyfLI1rUw2SBcB8LXxkxW
         Wodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/PK2BfkpiLdNJHc78+c5wCnYytKxPCOH9JODGsT+Sq0=;
        b=Gb2tibUk+kK0dF3eE15wtUJSu1w21LHkD0hmOK/BdVBTiBrXGEFqjFRR6iASnJzfTe
         jBGBI4BcqaDx+jbOOw0IVaOGyFslWIH/Qql61VFt6vD2p73h68pVuIkYzpLJG+flnHE3
         OFjVd2zWu0JMRqkgKWaMjYj2X9hdAFTvgrDUq3xAlUF9AS8Qj03HCLwszbGDeKCqBOYh
         kG4IUo7FesmowBTPvya8rUaYP74NPZ8ohGYUcinpUXSPcihzHw4J2G3sFnm9mgQp/LFl
         hZ4h9Oo9sxMFEjrEfBu1mWVfbFUGJpNmlGaBt13t8WFp5RJf1sTP5Tn6uC03q0WgRAUY
         ugWw==
X-Gm-Message-State: AO0yUKVrRwwjJK/vtz9C3F4kcPkyTGcMTKOcZU4iSa2pSL5cMtePhGPl
	cXY2VqkRv+0iR2jxSN4xssSwFA==
X-Google-Smtp-Source: AK7set/nhtES+EmSr0ewBQL+bKcLDyq0xL+oiEJyxDgGr5e9Gv8UiNern63ikKa/1KSjV/+Z76+aVw==
X-Received: by 2002:a05:6402:b38:b0:4ac:bd6e:9975 with SMTP id bo24-20020a0564020b3800b004acbd6e9975mr4367614edb.20.1676972742739;
        Tue, 21 Feb 2023 01:45:42 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y21-20020a056402359500b004ab33d52d03sm2782953edc.22.2023.02.21.01.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 01:45:42 -0800 (PST)
Message-ID: <1478c506-de42-e7a6-c652-a569968c8c29@linaro.org>
Date: Tue, 21 Feb 2023 10:45:40 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] dt-bindings: google,cros-ec-keyb: Fix spelling error
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230220135531.1987351-1-linus.walleij@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220135531.1987351-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/02/2023 14:55, Linus Walleij wrote:
> The dependency had an obvious spelling error. Fix it.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

