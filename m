Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126A57E9
	for <chrome-platform@lists.linux.dev>; Thu,  2 Jun 2022 06:55:26 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id er5so5009991edb.12
        for <chrome-platform@lists.linux.dev>; Wed, 01 Jun 2022 23:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=JURECuzq90J5YQbvfKhH3hlm2+qtCq98+aU0mnZnfcQ=;
        b=QlXzSso7T638kpD4EL+9zv7YbBRuhJRvQF3SIm1Y0mI7w6nQUCR4StdGPg4mTCNOcU
         7B3Cb/OKTOQGp227re9YjpzhEADb7lhb9xDf+0zBcKPbgo94gKp53YBGrZQhcgX6CWqL
         ccrYHrn9gcoZNpXB7APr2C76Cz7LtZTCMtZlqep/uzaZM5vVh8uWzGZTHMOh2BgLCaqm
         JdQiyA1yN0aGzN7XRV9/YAO7QAWdDt9ypH2o+pHMq6jXM8vIYLaNoHZmjuqpRnu/PabP
         brAgFVdN9j9wSo4kV59ojhmQYzK9uS3YEd6qE+SHZiFAGQFKoGJtdIqcJNdqDEiZ6ZGh
         B0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JURECuzq90J5YQbvfKhH3hlm2+qtCq98+aU0mnZnfcQ=;
        b=j2pxabRhkFSqhYgQtnx/3qfaQ72zXWLORFS5rOInDRVV6oWf1j/6qZ+hKCHji+fBNs
         3vvvWqTn+O44ubSvoIhHA8yw/9f8ZeZvCYketcEXh+MAQz3ne59hVuOlLllkCOkdWav0
         utW7crixZU0aURnhXGAUCNga0JgtlxMwAAOj8A5IFQLl4iDeCaEeuHSq/iuxsCKtXvC6
         TkWJMuhR1nuYchqSiZQ/ff5Nm671pud5T7ujeA/ju4UaBeBwd6hqbMa8GVj93vgCYr5H
         xWm//fdPrUhk0NW4WBca+7juVjLpHllqWy1oaU37ti2jdM9nxVMJ5SLNoDafPQg4Vfx9
         5oeQ==
X-Gm-Message-State: AOAM531HOEVA+1HfUFqXwzGda9i2tJMGsz+TB1IFuwGOQV80stngQInf
	ZbXasINLtSPbn1EHT5zdmdGBPQ==
X-Google-Smtp-Source: ABdhPJzNPG3tPgcc4GjIw5BJCjzKPmvWH3e96pdUZFg16Zhu735+AWuSm934KX31gcS2jCWhE99ZKQ==
X-Received: by 2002:a05:6402:500a:b0:42d:d109:b7da with SMTP id p10-20020a056402500a00b0042dd109b7damr3715732eda.289.1654152925308;
        Wed, 01 Jun 2022 23:55:25 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d15-20020a056402000f00b0042e1cbc4471sm44241edu.3.2022.06.01.23.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 23:55:24 -0700 (PDT)
Message-ID: <476baef8-0255-45ed-85f4-2b9d877c4af1@linaro.org>
Date: Thu, 2 Jun 2022 08:55:23 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 01/15] dt-binding: remoteproc: mediatek: Support
 dual-core SCP
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Daisuke Nojiri <dnojiri@chromium.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 "Dustin L. Howett" <dustin@howett.net>, Tzung-Bi Shih <tzungbi@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Prashant Malani <pmalani@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Brian Norris <briannorris@chromium.org>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 Project_Global_Chrome_Upstream_Group@mediatek.com, weishunc@google.com
References: <20220601112201.15510-1-tinghan.shen@mediatek.com>
 <20220601112201.15510-2-tinghan.shen@mediatek.com>
 <dd3ea397-fa21-abe5-85ad-b8a4818dc011@linaro.org>
 <3c837acfbefa5b7e23e1121678b5b878f08e4ef2.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3c837acfbefa5b7e23e1121678b5b878f08e4ef2.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/06/2022 07:21, Tinghan Shen wrote:
> Hi Krzysztof,
> 
> On Wed, 2022-06-01 at 13:50 +0200, Krzysztof Kozlowski wrote:
>> On 01/06/2022 13:21, Tinghan Shen wrote:
>>> The SCP co-processor is a dual-core RISC-V MCU on MT8195.
>>>
>>> Add a new property to identify each core and helps to find drivers
>>> through device tree API to cooperate with each other, e.g. boot flow and
>>> watchdog timeout flow.
>>>
>>> Add a new compatile for the driver of SCP 2nd core.
>>>
>>> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
>>> ---
>>>  .../devicetree/bindings/remoteproc/mtk,scp.yaml      | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
>>> b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
>>> index eec3b9c4c713..b181786d9575 100644
>>> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
>>> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
>>> @@ -20,6 +20,7 @@ properties:
>>>        - mediatek,mt8186-scp
>>>        - mediatek,mt8192-scp
>>>        - mediatek,mt8195-scp
>>> +      - mediatek,mt8195-scp-dual
>>>  
>>>    reg:
>>>      description:
>>> @@ -57,6 +58,16 @@ properties:
>>>    memory-region:
>>>      maxItems: 1
>>>  
>>> +  mediatek,scp-core:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +    description:
>>> +      The property value is a list with 2 items, a core id and a phandle
>>
>> uint32, not phandle.
>>
>>> +      to the sibling SCP node. 
>>
>> Skip this. First part is obvious from the schema, second part should be
>> described via items.
>>
>> The core id represents the id of the dts node contains
>>> +      this property. The valid values of core id are 0 and 1 for dual-core SCP.
>>> +      The phandle of sibling SCP node is used to find the register settings,
>>> +      trigger core dependent callback, and invoke rproc API.
>>
>> Entire description did not help me to understand what's this. So far it
>> looks like it is not a hardware property but some programming help, so
>> it does not look like properly described in bindings.
>>
>>> +    maxItems: 1
>>
>> In description you said - two items.
>>
>> You need allOf:if:then disallowing this property for other variants.
>>
>>> +
>>>  required:
>>>    - compatible
>>>    - reg
>>> @@ -115,6 +126,7 @@ examples:
>>>          reg-names = "sram", "cfg", "l1tcm";
>>>          clocks = <&infracfg CLK_INFRA_SCPSYS>;
>>>          clock-names = "main";
>>> +        mediatek,scp-core = <0 &scp_dual>;
>>
>> This looks like phandle, so wrong type.
>>>  
>>>          cros_ec {
>>>              mediatek,rpmsg-name = "cros-ec-rpmsg";
>>
> 
> Thanks for your feedback.
> After looking for a comparable uses case, I find out a different approach.
> 
>   mediatek,scp-core:
>     $ref: "/schemas/types.yaml#/definitions/phandle-array"
>     description:
>       Enable the dual-core support in scp driver.

You describe desired functional behavior, not the hardware. What is the
property about? If you just want to indicate this is two-core processor,
then it could be:
	mediatek,cores = <2>; /* number of cores */


However it seems you want to achieve here something different and as I
raised last time - it does not look like DT property.

Or maybe this is for first core and you want to indicate the sibling?
Something like that was mentioned in previous description.


>     items:
>       - items:
>           - description: Assign a core id for current scp node.
>             enum: [0, 1]
>           - description:
>               Phandle of another SCP node. This helps to find
>               the scp driver of another core to trigger core
>               dependent callback, invoke rproc subdevice API, etc.

Items should be rather reversed, as [0,1] being the argument to phandle
for a provider (see examples with syscon)...

Best regards,
Krzysztof
