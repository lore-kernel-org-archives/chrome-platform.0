Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9832565
	for <chrome-platform@lists.linux.dev>; Thu, 23 Mar 2023 07:31:58 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id ew6so19638185edb.7
        for <chrome-platform@lists.linux.dev>; Thu, 23 Mar 2023 00:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679556716;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ekZUPnt2Vozh7f2sOzqBtvIcIMLGfykVhoLT/YHh2xE=;
        b=MxAap6yrlqQe+CS3DpDJfF5WuV4QamV9krsmqhN6cV++/4g87dcsgqDPv9l4+5jTSN
         fpREq+ql5ZTsrvXKij5+szUYFIjJ0KrLkBQo4LjQ1Xb8NggiUvcGJK175r4xihf79DWH
         T9KnIy/W0K7sT2bZN78BDTWH3LR1I9CbJ5kYRt9N0WwtKZTPt5K7HgBM2XmjXuODk0Fl
         eyZrEpQKsNQcqJg8O8ItsV46io0ofcKBAqE9mSXi9A/p5D9UQd6ntvzQtllz758dL0dv
         Np4e6EQf/FAiZDraFfnXffKia8k+jFmBUof/QJ6Bb3WX2KDSPFstWow9QJ3ylAscvjmg
         zAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679556716;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ekZUPnt2Vozh7f2sOzqBtvIcIMLGfykVhoLT/YHh2xE=;
        b=PEctQzMrPGl8xj31wKZb4+9qms6Xpzrzx/lZVm2hr3MzMq6cKNbgmlKp6lCLwJ8IM0
         fq5PzJcdCRqMjEKQPEcCy+JgMHAX0uRS4LRopk6u5a0T3Zn7K+DsNiZq9/ZL0NLFK/vw
         b8Zj3eg83lGiujReIbjJBOsukZjcrzabT7KXXVINKgbu2xNRT2B7mlkPNJsUCtoZwX0Y
         V3p6tdhG4mQw5CxAWOzToa41dGpjgN+JtLn97ySH57XV2rNqFG3ZyawhwZxg42FmTCDg
         Sfa2AM8ByS0J3iDc+jYDoTRv1zq/LkczsU8CCtVDyrljDMH8vzJBKPruLM3Z2bDOrud/
         GVUg==
X-Gm-Message-State: AO0yUKX1I4IRONBO4VAQ480858pbSM4mZtx+K9B+7BwShM018fWMkvzq
	6fNSD4JCzaAzqJOCqDLgAo/U0g==
X-Google-Smtp-Source: AK7set+iWZt444eNKE55ycB9BgkADqbdT5/QwpCrCYcQJ7NbBWuq6iqdS3q/l5rzTRalH/MtURCskw==
X-Received: by 2002:a17:906:5cd:b0:8af:3b78:315d with SMTP id t13-20020a17090605cd00b008af3b78315dmr10894973ejt.23.1679556716702;
        Thu, 23 Mar 2023 00:31:56 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a665:ed1e:3966:c991? ([2a02:810d:15c0:828:a665:ed1e:3966:c991])
        by smtp.gmail.com with ESMTPSA id gv27-20020a1709072bdb00b008b9b4ab6ad1sm8235164ejc.102.2023.03.23.00.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 00:31:56 -0700 (PDT)
Message-ID: <a767418b-1e2a-6d02-fc07-8caea8f877e2@linaro.org>
Date: Thu, 23 Mar 2023 08:31:55 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: mfd: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, patches@opensource.cirrus.com
References: <20230322173519.3971434-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230322173519.3971434-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/03/2023 18:35, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

