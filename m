Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993379447
	for <chrome-platform@lists.linux.dev>; Tue, 25 Jul 2023 10:35:36 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9922d6f003cso916476266b.0
        for <chrome-platform@lists.linux.dev>; Tue, 25 Jul 2023 03:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690281334; x=1690886134;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xRSCjzoFlf7+1pwK2274OEG2qCHzv1zVFI3OEYWB7Ic=;
        b=L1ESNfLDThRmEQmyq3QCUnymgcDRa9+iMV1l0gch6YrnemwC+/tkPL+B7TmaO6Pvh/
         5cd2FDEeuJQZIe2/kkjbqTU/2w1ChrWHkTx17VDsvmmaxwtSdMzHv8SdYlfffCAvLpL4
         cxK4SgaE4gUXapWGotW0u05hBwCqeOqqr8mV/isGLZ2NC/QJ4mKTs+EXHZhceS3HCwfT
         KQMmYBIfazv7GjgIue973VYyYpM1JrkbDjTTwfSc0+9WUkdHDR41tItjmPoQ3FzHg+V+
         74mH8j3bp0zDZxr+Vu30SMhl4s8eMqlBL9R681gqSTTacMQzTHLLYslGKHjsMmBwrSGi
         BRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690281334; x=1690886134;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xRSCjzoFlf7+1pwK2274OEG2qCHzv1zVFI3OEYWB7Ic=;
        b=RHdLHgwXiCEAb1a29BLQmryjG2kx2rtxBzszgFeL/a5tuIDHflgQWdtNdWT1KCodfa
         rsnbsVUKT0NWmtf9Dxs/yDGK2G6n6/zvFLKqYar9eU8RqJhuENyTxkPW6naYbQQVkuFl
         rHs78vjz1LjrGF4ryETp7WHWJt2rSR/O0ZLgxaHfql7bgEa0vo1sQ0+sNUedE1tfIRfn
         hjNMLEYgwHeNSp6v0urdoQ7GYCIV2P08+bZ6I1I0r87PW+r/ZGDszEYBmFRFY1n5/SJK
         57mkTR3KR6G+QFfN+/lUr9pa5zkogeJD99ORJazxLrVO79Rn6xj+DnAC6AVrUrJWDOgE
         fUBw==
X-Gm-Message-State: ABy/qLb22XdOqmBI6zIVVdoLj3blYdtRgiMFvd033APY3C3VTqSsSZqx
	ZV4rG0M+rPoxf2/Ac5X395L5zw==
X-Google-Smtp-Source: APBJJlEeAYXZil/XyuB5ylTiwIPKbvsDFmDdl0tv2VrAlD7DtAQVb1lRFLJxpnumFOyiReYDJEeKFg==
X-Received: by 2002:a17:906:cc0e:b0:99b:465c:fb9f with SMTP id ml14-20020a170906cc0e00b0099b465cfb9fmr12834886ejb.8.1690281334516;
        Tue, 25 Jul 2023 03:35:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id dt19-20020a170906b79300b0098242730348sm8090252ejb.72.2023.07.25.03.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 03:35:28 -0700 (PDT)
Message-ID: <00980fa2-5f8c-d616-ef3f-957090c25d48@linaro.org>
Date: Tue, 25 Jul 2023 12:35:25 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] dt-bindings: usb: connector: disallow additional
 properties
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Prashant Malani <pmalani@chromium.org>, Wayne Chang <waynec@nvidia.com>,
 devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20230725102325.76336-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230725102325.76336-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/07/2023 12:23, Krzysztof Kozlowski wrote:
> USB connector bindings is complete, thus no additional properties should
> be allowed.  Add missing 'reg' property and change additionalProperties
> to false, so the schema will check for anything not unexpected.  This

An MIT linguistics professor was lecturing his class the other day. "In
English," he said, "a double negative forms a positive. However, in some
languages, such as Polish, a double negative remains a negative. But
there isn't a single language, not one, in which a double positive can
express a negative."

A voice from the back of the room piped up, "Yeah, right."

Obviously:
"... will check for anything unexpected".


> also allows to drop the 'reg' from other bindings referencing the
> usb-connector.yaml and make it required.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Best regards,
Krzysztof

