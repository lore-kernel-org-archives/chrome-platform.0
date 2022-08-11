Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C6B198
	for <chrome-platform@lists.linux.dev>; Thu, 11 Aug 2022 06:21:59 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id l10so13733947lje.7
        for <chrome-platform@lists.linux.dev>; Wed, 10 Aug 2022 23:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=8hursMRXMAUUQjiQSUj1tnEyeQwqGDBpoW+39gp5mPg=;
        b=BfgQnUDurI1+TRka7634zdVW5kG0nSusGWy1dxJFfL56jhD1lQUWBkv8ImBSIMI500
         j1SxrhgzQDbbmc76vh/RjUUTg3bDkAy/Y15M0OwMjgF1mm6X0MHtFAYquZx21ggVXgQq
         vgy/quPIAgLfY0QTt4NI3QJv9rHZrrDrEm+34KE3rJmwgmy6zOt+nd1TUK3OPCZmZuJP
         0PYoktJsqDfpsUCfHhQFCPBEubFmhs8wDkXNlafgeLSMNDo037oZIw22dMAjaahATmmR
         GmM0XA9bfv5lG7pAZRYC5BgvmW0Gr+Tfd0idLtqg9gJFcPKmD9HAwZNuzH02jVGDF0Zp
         H9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=8hursMRXMAUUQjiQSUj1tnEyeQwqGDBpoW+39gp5mPg=;
        b=Sm7ntLHIpEnycryxftV//XqO09eHrUMDs92xjLwnzV8i+eeTy9scfAAOgJydznElXD
         5STpD7IoXh7zNXiL5lsx4l4BN3g8gJWLx04iQelwqUhLf94in0bTk7oz4rKI2TiLJc31
         MtKY6RMDojzRcxsm3q7SQFWmmk5v23GGMVfgWo5m4GzjvKAf+fqK1j/4ZsIseHidaSnS
         ieBAmODVeYuGqu49z56n7pgFfYy6SqfiqxNJwEbDPeyvMfT4vxdnwbzal8VmtBduy+gh
         WjhO3AuUtn4NfjDhdyiuA1cOVREWPsiX8hG9RzwGW7TSq1991Xqnb8t65PuvNdAfhNmW
         /nxg==
X-Gm-Message-State: ACgBeo38nKFtPLJzp1G/J4FHhDYGDzFDPBnOWskcs8MDTQwgmnyJWebD
	TiV8WPjUw7HB6qiZQe62z3zo+A==
X-Google-Smtp-Source: AA6agR720MOWvhibrkPPJh59VRmmw03TaKDN9hUt4FC2DPrhGE67ihwWpCEX4HtMhLVhjDlq1ZtQfg==
X-Received: by 2002:a2e:a58e:0:b0:25f:d8c5:3898 with SMTP id m14-20020a2ea58e000000b0025fd8c53898mr5715269ljp.302.1660198917599;
        Wed, 10 Aug 2022 23:21:57 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id t7-20020a2e9d07000000b0025e0c352465sm681240lji.82.2022.08.10.23.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 23:21:56 -0700 (PDT)
Message-ID: <d602099c-d054-d5d9-53dc-b7900f6567f8@linaro.org>
Date: Thu, 11 Aug 2022 09:21:55 +0300
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] dt-bindings: chrome: google,cros-ec-type: restrict
 allowed properties
Content-Language: en-US
To: Prashant Malani <pmalani@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20220810143613.482724-1-krzysztof.kozlowski@linaro.org>
 <YvP6u8SRHswA1Iva@chromium.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YvP6u8SRHswA1Iva@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/08/2022 21:36, Prashant Malani wrote:
> Hi Krzysztof,
> 
> On Aug 10 17:36, Krzysztof Kozlowski wrote:
>> Describe exactly what properties are allowed in Google Chrome OS EC Type
>> C port, so the schema can properly validate the DTS.  Existing DTS
>> defines always connectors with unit addresses, not a sole "connector"
>> child.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Micro-nit: the tag in the commit message is missing a trailing "c" in
> "cros-ec-typec". Other than that,

Thanks.

> 
> Acked-by: Prashant Malani <pmalani@chromium.org>


Best regards,
Krzysztof
