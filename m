Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEAD7A
	for <chrome-platform@lists.linux.dev>; Wed, 23 Feb 2022 07:18:48 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EDA3F407C6
	for <chrome-platform@lists.linux.dev>; Wed, 23 Feb 2022 07:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1645600181;
	bh=nimhNkIt7mdxahM9C8qO53ZAeN7FCRJYbKKsVkt4SHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=h22+cI+gAEjcbUMBp5foBzMgjpbik0QosKLk8iA6qSbP193D3ZB7Ch+BKmCelnwWZ
	 KWPZZckeyOOtt9zTioOo8u38Vi1w+M9xCTwa2QrlIldjVrSitzbnqcq8qMR91DBKjL
	 zey3nC/jSa5bJfz0e/0HuR/Mx2aVEB683H0aYYk4YEvNR9HTzdy390LU/OxOk5K9hG
	 9DEVtMqzMHH1rLhPQThZfmPfe8dfzsFtNBk0chsdMN5V4eH44uFIGqHyxsorynKIGg
	 zsHX8C/juRLqSHrR0jnDaJ1Us1XF6MSZpLCBaCX+pPtQsAlv4/6Um/ChLKKYKROqW+
	 XqHsOhBq4KgpQ==
Received: by mail-ed1-f69.google.com with SMTP id o5-20020a50c905000000b00410effbf65dso13144015edh.17
        for <chrome-platform@lists.linux.dev>; Tue, 22 Feb 2022 23:09:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nimhNkIt7mdxahM9C8qO53ZAeN7FCRJYbKKsVkt4SHg=;
        b=DgmOr7A+wDWq/nhhzorzmJvjmy8h6gMfbGjtbZAv2qC6QQ+BrkWXiq84FLHh3GcSHu
         WTic/kXjpZwQaPA++lbxXmPD0vfTebd/b7giX/mCJirnTPjn4C4VnIzHgv4eqIU6AM8l
         +jrY72gLWctoHPraqM8wdc9VAZKkMXEy6oXPioBP/pnDIKFKs7PVDMQSkA0/ajDsIdwD
         pXXrOv3MQ9Mo5iLz8SoRw2lHZAPyw/0zuXt0Rj1kXDEWVzG1BWKsId5591zzqGe2unAV
         dIlmgwQ9RoONshGoYB72LmPZoTtZUTUlYR8QnnwBABzE8XUeBfACbrczO+NvKGiilAcr
         FCUA==
X-Gm-Message-State: AOAM531uFwn7U/nULqSpBZKBEkusjnWYJUtdjmAYEVeHk1p9e/0C8pw9
	YPndKkWJpAVnD1gRHivezXQmMoKFbdBetbxOenlqEt9XAsKCHJiGEqdx5Ff7KeAHxp4+zMXDjC/
	HzQA22/SGa3e53u6QVqZcR4uJGSODGXnQuRYhhIwWc8vvSQ==
X-Received: by 2002:aa7:dd9a:0:b0:410:b875:ab95 with SMTP id g26-20020aa7dd9a000000b00410b875ab95mr29494445edv.248.1645600181672;
        Tue, 22 Feb 2022 23:09:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzCfvOZRfs9gbRYzkE2QJAiHsybZmRR4vAzmtPrnH3egKFJYppepwp/EaGxvawIkcSpK6J/A==
X-Received: by 2002:aa7:dd9a:0:b0:410:b875:ab95 with SMTP id g26-20020aa7dd9a000000b00410b875ab95mr29494428edv.248.1645600181505;
        Tue, 22 Feb 2022 23:09:41 -0800 (PST)
Received: from [192.168.0.124] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id kw5sm7198688ejc.140.2022.02.22.23.09.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 23:09:40 -0800 (PST)
Message-ID: <18bdf4ae-c445-ad10-b344-324436cbe445@canonical.com>
Date: Wed, 23 Feb 2022 08:09:39 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: (subset) [PATCH 0/4] mfd/pwm: dt-bindings: google, cros-ec:
 include generic pwm schema
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-mediatek@lists.infradead.org,
 Douglas Anderson <dianders@chromium.org>, Lee Jones <lee.jones@linaro.org>,
 linux-pwm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Benson Leung <bleung@chromium.org>,
 linux-arm-msm@vger.kernel.org, chrome-platform@lists.linux.dev,
 devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
 <164557235424.1264579.14486504733557463529.b4-ty@sntech.de>
 <20220223062233.4m2xejozz4d47gmo@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220223062233.4m2xejozz4d47gmo@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/02/2022 07:22, Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, Feb 23, 2022 at 12:27:08AM +0100, Heiko Stuebner wrote:
>> On Mon, 14 Feb 2022 09:19:12 +0100, Krzysztof Kozlowski wrote:
>>> DTS patches are independent. Not tested, but I really hope no downstream kernel
>>> depends on pwm node naming... If it does, please change it to compatible. :)
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>> Krzysztof Kozlowski (4):
>>>   dt-bindings: pwm: google,cros-ec: include generic pwm schema
>>>   arm64: dts: mt8183: align Google CROS EC PWM node name with dtschema
>>>   arm64: dts: qcom: align Google CROS EC PWM node name with dtschema
>>>   arm64: dts: rk3399: align Google CROS EC PWM node name with dtschema
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [4/4] arm64: dts: rk3399: align Google CROS EC PWM node name with dtschema
>>       commit: 474a84be692d893f45a54b405dcbc137cbf77949
> 
> I expected that all patches in this series go in together via an ARM
> tree. Or are there expectations that this goes via PWM?

I would propose to pick individual patches by each maintainer. bindings
by PWM tree (Rob acked it) and DTS via each SoC tree.

Such approach gives flexibility, although `make dtbs_check` will spot
the new errors when run in PWM tree. Next will be fine, though.

Best regards,
Krzysztof
