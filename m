Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644822104
	for <chrome-platform@lists.linux.dev>; Wed,  2 Mar 2022 19:06:43 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0AECD3F616
	for <chrome-platform@lists.linux.dev>; Wed,  2 Mar 2022 19:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1646247995;
	bh=m6ojeTgtogrdSSitR1acR3iefkQ9OYzxbBDb1IxSxtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type;
	b=TokvPG/aQxZC6lzNXdv1U9WRwB+yYx8X+P5KutxNgHdQxwNpFnCki4ocsKYO4+KCS
	 KK6e9c8aqLY80E07XciNPseyWIkZTV8s518Z6nrsUn61InaOclPBbblDJ2Vc6VpRtd
	 T81hN1jgJrIDjllrF9tvxaAWtb3Y7oML1njk1eZCBcywcdtfyjG/SiBEOCfsyWOdE6
	 XMQ1xQbtRss/v1xjIb7Fk0hZhkT7U3q5PHeiGAGXZ2ixpUZYI5YHrjTzlA7jY/CDyc
	 MpM/xVS0PmhMIAqgG3bnm5yZbjB4qG3tHG3e00M5MUz4WLipD/QdgGEz6cYACk+8a4
	 yioR6XZA4b64Q==
Received: by mail-ed1-f71.google.com with SMTP id l24-20020a056402231800b00410f19a3103so1527704eda.5
        for <chrome-platform@lists.linux.dev>; Wed, 02 Mar 2022 11:06:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:cc:from:in-reply-to
         :content-transfer-encoding;
        bh=m6ojeTgtogrdSSitR1acR3iefkQ9OYzxbBDb1IxSxtI=;
        b=aiRUITGG4vsnT/TlGCSbWiUVlMvMk60Y+61uk6Hbfr+fR0W8FYZ4E5kBtkkussd44V
         vpfqlK2fFYgQzY4t/8AYjtRbP8Yv7dbGCbNfmqdkTV70bjVpmYxbrxaTxZD0U7XhnxzV
         ojdI41/Lqg0g1n8mBsJLUS5vzvuur35Nk13gHqv7yN8ld4WgdwwC6Stw+VImzoLFy7LO
         Y71kby9VgbWbBCW3IDWfrfUzyPcB65V2r0QgLHRuEn+DBoDSJSzSJJiWN/2iymz0FVLG
         2aku/1ped7+9eSH4hDLTZtSEqydF7jXiINufwyeM22cDmo+wK1TTupUY5tK5t4dfelCa
         S2Ew==
X-Gm-Message-State: AOAM532fcPnyYRGYX7O8CKL3oTyW3peqyiPZ4Gct17hgORRTSgiL9rbP
	NQV6wrrEZiz4+Xj/A8qp+vs6GoslWcq/XLeQS5HFD47ZOTpecjk6Uffv0jM2qgdRWG7SQh2YWAg
	MPaFQN6WCxvn+lEp2jU1npZstL5SN9STnLucJIsocAqvH6Q==
X-Received: by 2002:a17:906:6a0f:b0:6d7:1021:2bd2 with SMTP id qw15-20020a1709066a0f00b006d710212bd2mr6424421ejc.395.1646247992479;
        Wed, 02 Mar 2022 11:06:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxeQrZWG2Oxg6RE7q9wIPUX3Z/sjjW6CdMRyOa97Yz1CbhreGcjtKJUbps/xbBHdxqhb0/UQQ==
X-Received: by 2002:a17:906:6a0f:b0:6d7:1021:2bd2 with SMTP id qw15-20020a1709066a0f00b006d710212bd2mr6424403ejc.395.1646247992278;
        Wed, 02 Mar 2022 11:06:32 -0800 (PST)
Received: from [192.168.0.137] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id cy1-20020a0564021c8100b003e359e4f54asm8827529edb.43.2022.03.02.11.06.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Mar 2022 11:06:31 -0800 (PST)
Message-ID: <77fd3853-25b2-f9f7-6081-969ec54aa6a9@canonical.com>
Date: Wed, 2 Mar 2022 20:06:30 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/4] arm64: dts: mt8183: align Google CROS EC PWM node
 name with dtschema
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
 <20220214081916.162014-3-krzysztof.kozlowski@canonical.com>
Cc: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Douglas Anderson <dianders@chromium.org>,
 devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Guenter Roeck <groeck@chromium.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Benson Leung <bleung@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220214081916.162014-3-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/02/2022 09:19, Krzysztof Kozlowski wrote:
> dtschema expects PWM node name to be a generic "pwm".  This also matches
> Devicetree specification requirements about generic node names.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Hi Matthias,

Any comments on this patch?

Best regards,
Krzysztof
