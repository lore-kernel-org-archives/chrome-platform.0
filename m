Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8336184D
	for <chrome-platform@lists.linux.dev>; Thu, 24 Feb 2022 10:14:26 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 060823F1BE
	for <chrome-platform@lists.linux.dev>; Thu, 24 Feb 2022 10:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1645697654;
	bh=R2XzFGsa+EKmA5bAQUzuu09BXbD6MYmLaXLgYZlWR5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=H9yJlbwPbmWZN4SlZsuarVphwBuYWZnn666W0MTUW8Ls4vRUVON+EQmwheOpvqIZ2
	 miNcbBzsKdlmD0ls2lMyLEcZVySRUlIzkzmaDUEtKEeObI0OKPEwuB7T5DZvlyKYzz
	 G4J5sWIDhh0vhoJP7UkArbioRsNzlqwr/aEmuo7Q/wkiWEsYa9huo/0XLCosdRfC7J
	 WFqjBglh7h9Dc3cWjbKEJVLB6EGudaFv//LJrwT+UmY3HNXLadp57LYjfSqm7xsiFN
	 gHHVVbH0ZQ2V1W4n/sWITz8D/WflqaaWvaj8uZ9bKPlrFK+d8xAgUMsOvtjEvwGfs/
	 9QZowr3GNJhVg==
Received: by mail-ed1-f69.google.com with SMTP id s7-20020a508dc7000000b0040f29ccd65aso540429edh.1
        for <chrome-platform@lists.linux.dev>; Thu, 24 Feb 2022 02:14:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=R2XzFGsa+EKmA5bAQUzuu09BXbD6MYmLaXLgYZlWR5Y=;
        b=M+oxkGsmmQZcnVuS4tNVSvIQGBs1/Xw0G8iSyNUlRoXHSadjU6cH4hghkqzjVv3gsQ
         TsqLranip7Yxi/9reXd8Oi5rxkfeyZsU8cPCzoUJAbnwTqH0yIatV5JmBK36vAumm7yK
         1+vp2kLdOQ5f3WXKfqsUV2pjos3zVSoDSGsDthV0a1kWIuURu7b5geuzKcqpLh8DpkM3
         lufrS6XeB3lU7EcjytmwPP3gDoBkq0X8SFtkdO2YO4CppEiM255cvzxrARAahL86j7PE
         KTrygb6R7B6kKjR8D6dQim75CaaWsrJYsccOVMx6KieQ4Ou20vLcBY4zQ6O1r0GZ+hDi
         9bVw==
X-Gm-Message-State: AOAM530sy9BvoPFlYXR1Lz/ZMek0/2H16Lb99gtsTtcf9oHKrIcMbPH7
	StVMkN55PVHSvA645qflJTsDZti1Yv9JOSeVYbm3zT3SENw65F5uN7OCO4kk0oqe/kP8TjkXkP+
	ZMMUC2lMNTHu/mobtKjEuCIAKRlRUHpJM8vdTm44BPMTryw==
X-Received: by 2002:a17:907:766a:b0:6cf:bb20:70c with SMTP id kk10-20020a170907766a00b006cfbb20070cmr1665281ejc.94.1645697653728;
        Thu, 24 Feb 2022 02:14:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/sLltZSTx8KWRJjI2K/qwIBaOPcUKmFt3AKY4TZ4EYzdTbH9CKy+iaxTYab7Mf5+E65BCKA==
X-Received: by 2002:a17:907:766a:b0:6cf:bb20:70c with SMTP id kk10-20020a170907766a00b006cfbb20070cmr1665264ejc.94.1645697653535;
        Thu, 24 Feb 2022 02:14:13 -0800 (PST)
Received: from [192.168.0.127] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id o10sm1117979ejj.6.2022.02.24.02.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 02:14:12 -0800 (PST)
Message-ID: <ad6e347b-a25b-5309-2a6a-8fd3faba256c@canonical.com>
Date: Thu, 24 Feb 2022 11:14:11 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/4] dt-bindings: pwm: google,cros-ec: include generic pwm
 schema
Content-Language: en-US
To: Heiko Stuebner <heiko@sntech.de>, Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
 <3248917.W5uN0jUHDo@phil> <YhdXyBvAbdHzc4gH@google.com>
 <1817486.VeUe9BSz9F@phil>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <1817486.VeUe9BSz9F@phil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/02/2022 11:06, Heiko Stuebner wrote:
> Am Donnerstag, 24. Februar 2022, 11:02:48 CET schrieb Lee Jones:
>> On Wed, 23 Feb 2022, Heiko Stuebner wrote:
>>
>>> Hi Lee,
>>>
>>> Am Mittwoch, 23. Februar 2022, 10:16:01 CET schrieb Lee Jones:
>>>> On Mon, 14 Feb 2022, Krzysztof Kozlowski wrote:
>>>>
>>>>> Include generic pwm.yaml schema, which enforces PWM node naming.  Keep
>>>>> the old name in bindings as deprecated.
>>>>>
>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/mfd/google,cros-ec.yaml    | 4 ++++
>>>>
>>>> Acked-by: Lee Jones <lee.jones@linaro.org>
>>>
>>> what is your expectation regarding this patch?
>>>
>>> Are you planning to merge it or are you expecting this to go through
>>> some other tree?
>>>
>>> The binding-change here is backward-comaptible in that the old
>>> node-name is still in it, only marked as deprecated, so in theory
>>> this patch should be able to be applied on its own without
>>> causing defects.
>>
>> In an ideal world, it would be broken up and I would take the MFD
>> part.   Is that possible or are there dependencies?
> 
> That is also what Krzysztof had in mind - see his reply to patch4.
> Binding going through the MFD tree and soc maintainers applying
> the individual dts patches.
> 
> As written the binding change is backward compatible, so no harm.
> 
> I was just confused by the "Acked-by" and wanted to clarify how you
> see it ;-)
>

The bindings patch should not be split more, but itself can be taken
alone. DTS patches can go via SoC maintainer trees.


Best regards,
Krzysztof
