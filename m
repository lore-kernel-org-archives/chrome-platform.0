Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B667829AC
	for <chrome-platform@lists.linux.dev>; Wed,  7 Dec 2022 17:57:40 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id f20so8602459lja.4
        for <chrome-platform@lists.linux.dev>; Wed, 07 Dec 2022 09:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AF1O5/EVK+C+aW3v0W6bqwYPGmpIyoxTslLZPgMEYDs=;
        b=SjvPOxV85zKqCW/waOj5GKaDR4pTsAjzxpAxakG3QVZbxhRWK2333PcCmE5ltejXEz
         AHpU6vWWw4vfh91F+goytSaQzLpLEOdGjbtCDCZf8LGHAQXbHCKvNPkLN6w7GZHPjDIN
         7b60eo62EYV7Do1pLZYJ0KyDIsiDylZ49tdxoWfBqfHEvAJLf82W24skR94/lWQs6BYI
         KazA4SyFN/ACT8zQYsfu2LfuLpueKoHkcBvVnVGFq9+RRypsj2HNQPc3mFPeMslrRbs+
         ZfTGegIZQmPu6dWlwMjNTDnWCVCsFG4XYLqUiikhh5U/xDSHqppnyCBFxhyxQuxWHxXq
         FH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AF1O5/EVK+C+aW3v0W6bqwYPGmpIyoxTslLZPgMEYDs=;
        b=pnHBIdcuJj1YZZ5KNHn/dAnGj1L+wAqJZasJCEXvBYl0H0sIsLEfFgjgCZ0Z2iPVyT
         VJT2LR5wQa9lCU16huKRth9VKoHF4Whg5xmehtR8KA+F5zTNtGaHr5J/JDDNYifrHZ+/
         LCxMLnwsr50GtVRER0VQYXTLaDOmKiXU0QPdmQppmHao3CteSsNANlo+rgKJPg4yDB/B
         AL4YwnYjp2vVKXNq0EDgtGJzgreZ+CQaN63YWuJjPwAJF2OKo1gEPJXSL4KBG6kG6j5z
         +4iH1GfjpvDDHGX9hH+PQnEAivJsNfu5fUkr5oaNK6a0jm31u8riy6d1DNEa9qpXdUuP
         fHKA==
X-Gm-Message-State: ANoB5pnoJnDLCUteapbqT9vOpWWHpOKzJ52BBU3DXpLVVooywMQPWHod
	8ayePBKLnreeu1xPNHgEaklMOg==
X-Google-Smtp-Source: AA0mqf4DLjUdcCsEq44xXCZgbsAj6PjXPpF02zKV0ELS6OooLrky7XGCVpi39WLGW0DB4NNiG5ElQQ==
X-Received: by 2002:a2e:894b:0:b0:27a:1aa4:f24 with SMTP id b11-20020a2e894b000000b0027a1aa40f24mr1094514ljk.301.1670435858807;
        Wed, 07 Dec 2022 09:57:38 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o22-20020a05651205d600b00497aa190523sm2938489lfo.248.2022.12.07.09.57.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 09:57:38 -0800 (PST)
Message-ID: <185a83f7-d575-245c-8d11-1de7c8064a7f@linaro.org>
Date: Wed, 7 Dec 2022 18:57:37 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v10 2/3] dt-bindings: mfd: Add compatible string for UART
 support
Content-Language: en-US
To: Mark Hasemeyer <markhas@chromium.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Raul Rangel <rrangel@chromium.org>,
 Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 chrome-platform@lists.linux.dev, devicetree@vger.kernel.org
References: <20221207104005.v10.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
 <20221207104005.v10.2.I9e018ecb8bdf341648cb64417085978ff0d22a46@changeid>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221207104005.v10.2.I9e018ecb8bdf341648cb64417085978ff0d22a46@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/12/2022 18:40, Mark Hasemeyer wrote:
> From: Bhanu Prakash Maiya <bhanumaiya@chromium.org>
> 
> Add a compatible string to support the UART implementation of the cros
> ec interface. The driver does not support the reg and interrupt
> properties, so exempt them from being required for UART compatible nodes.
> 
> Signed-off-by: Bhanu Prakash Maiya <bhanumaiya@chromium.org>
> Co-developed-by: Mark Hasemeyer <markhas@chromium.org>
> Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Use subject prefixes matching the subsystem (git log --oneline -- ...)
and device. Currently it looks like you change ENTIRE MFD subsystem.

> ---
> 
> Changes in v10:
> - No change
> 

Best regards,
Krzysztof

