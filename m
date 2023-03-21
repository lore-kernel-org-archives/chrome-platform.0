Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A361FB8
	for <chrome-platform@lists.linux.dev>; Tue, 21 Mar 2023 06:48:40 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id eh3so55664161edb.11
        for <chrome-platform@lists.linux.dev>; Mon, 20 Mar 2023 23:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679381319;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UFoe7s9Q5oVaduws1BX9RSp/Mxew6VmyW+6mh+7NIWw=;
        b=Nq14bAe/7qrYwW9E3lwH7ZXnBkDGRSza7nWGbI/11Q9h+J2wI9hEnnLkHMri+Bwsvg
         Icr81XSgnEdcDL73Ef8DtWnQkhZhco1d9KN1htcXJkBOJ3D7Z3B9T1yHH8C0AORiKwWe
         yUBEDaT6tnFr3lZq6HUUBPUq6TWUOvOUHerW43jH41RJkhH3c2fAm8qBpGpNicDe24gQ
         QYT2xkEsWId/ccw0XnimKvo06FaP7fyKVuomNG/qNCLOJVCiVcn40U0JgIADl8wxp2RB
         jBtqO59GSwENrPOL5PHYTbN7as45zOJgpsxg+6r+z4vDQ2jR9nuKiJmWMix3QZ7MOICD
         ivMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679381319;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UFoe7s9Q5oVaduws1BX9RSp/Mxew6VmyW+6mh+7NIWw=;
        b=57oHEBmDRQ3FKIajvEEEqwso8FeRgXq1scVVmOSkcYkJvirRBCEUytHQxr8TC7ACU6
         D1wFWyqz86Mr/3R+lfanGGWh0RacrDqBmL1fA4MJkyaacRgli7+6gjKLRXi7ZI52M/hG
         fNIoSfz7Ep53jCAAipDb70BO0t8wTdfuxmsqC7aHROYK/qgpWC+RAWlhsRH1bsNZRW+y
         cmmvnEHl57idvJoafZnE9QFD3NkJo2ZetEa5qexKMYp2hqNFK5MLDmZxGl4tYvqF9LOs
         gXkIux59dDzdiTVQQaN8QOmYlINDtontPwFgX5c4w2FGLkzI5oKFAZglX1NFU7ua0bZC
         r2Fw==
X-Gm-Message-State: AO0yUKWyn9wfVT6v3OOW01MB6JU7/x4/ZN2PRfwNYfF4sem1XrRrx+RP
	3KUFhKDESEnD4oA1jNvaQfMvWg==
X-Google-Smtp-Source: AK7set+arCBZj7aBwChVJp1qpaFp3zJGEwSWUXpgXXMCV1rRlFEmQ2IAEjYU/K7IDI/supfKITLtfA==
X-Received: by 2002:a17:907:2ccc:b0:933:499e:62a7 with SMTP id hg12-20020a1709072ccc00b00933499e62a7mr1761803ejc.49.1679381319141;
        Mon, 20 Mar 2023 23:48:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id a27-20020a170906245b00b008d173604d72sm5438573ejb.174.2023.03.20.23.48.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 23:48:38 -0700 (PDT)
Message-ID: <77848bab-e7a7-4df6-17d3-c15e3e206ae8@linaro.org>
Date: Tue, 21 Mar 2023 07:48:37 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: input: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230320234718.2930154-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320234718.2930154-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/03/2023 00:47, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

