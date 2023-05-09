Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2937A17FEC
	for <chrome-platform@lists.linux.dev>; Tue,  9 May 2023 15:09:24 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-966400ee79aso581513866b.0
        for <chrome-platform@lists.linux.dev>; Tue, 09 May 2023 08:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683644962; x=1686236962;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6bpRKDonr4DEZQtbv/y5vpB5C6FTS7DxEwpmgWjKNxM=;
        b=P4CltB87AmAZUePMykq8Io05E+V0eaKKHObrJK80qABsIwn3KusN3ca7fvw5mnxMKS
         +MmTtsn3Q8I8ydBr9MDYjo0tmG3ssJpVKIRdtLFmoeafMs5ogjyKNchHWwf0nWZVwu9I
         STQjMfjO0cRmLqvIn/GbO4Eee1mM1xthT50EPgoD3ca9INfMfNv+EYxi+8MkT7GXknVB
         qAl/QsAB/5HcMSgmoLQSB9mFXewnKRidpqPKLqEOC0o9c8sPQx/Ix8bmabPG7ZT8Tc8o
         3RKd2eUNhXxmmg52kqYa8TbpVjXiI1kcmY/otDRqmCoUfTU+QZlhpqTT/Hv0SY3nJ9PX
         apiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683644962; x=1686236962;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6bpRKDonr4DEZQtbv/y5vpB5C6FTS7DxEwpmgWjKNxM=;
        b=ZCdJMMv8adAZyBfMGNaifwZVkWZY5tVECkzendaeYhAH/SsmHQ1vkh16rT9pTw0pZE
         fNkAH+sIcm1hQpZ2ULURDN2qGGvkHM+RdyVv4gCHrOrb+mRZIK+NAjw2Kkq1rfVGXoCt
         FxT9HzP0qvZGrW3qr3/aiz/qD4MHgMu6Y5EPYCXyjx/20IzkjH9EGGy/u2qNM4zX9pXI
         wsQppAoJ6g6BLzEhfiKeTugxRSgx6umX8DVZkXmgbzW6YwnkBo9Bd/ZB09Imxo1C2VG+
         3AmPazQQAxbW08mAScpfuwxgS0hoZ6QqM/dI5RCzj+Ppnw5yhMKZBTqlxjPU98Be8KIw
         JPYQ==
X-Gm-Message-State: AC+VfDyrGfup825t0g6WxGCJ19lSidUPlWkiUVDUOV33XLWsp90aqs+4
	Zsi3A2ual0h1C4lRY1m0oRk7Bg==
X-Google-Smtp-Source: ACHHUZ6bCpQ2QS8rv0XKLPfBEd9iVcVkxSTGu/qYma6OBTIGxH0m03mhCkbgP2k+8hlTu4av/nSh7g==
X-Received: by 2002:a17:907:25c2:b0:969:f3b4:89 with SMTP id ae2-20020a17090725c200b00969f3b40089mr2096356ejc.49.1683644962409;
        Tue, 09 May 2023 08:09:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d0d5:7818:2f46:5e76? ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id hu7-20020a170907a08700b00969fa8a3533sm659395ejc.165.2023.05.09.08.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 08:09:21 -0700 (PDT)
Message-ID: <894287ab-fee9-1e3b-dc14-cff44a752412@linaro.org>
Date: Tue, 9 May 2023 17:09:20 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 15/89] i2c: cros-ec-tunnel: Convert to platform remove
 callback returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Benson Leung <bleung@chromium.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Wolfram Sang <wsa@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, linux-i2c@vger.kernel.org,
 chrome-platform@lists.linux.dev, kernel@pengutronix.de
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-16-u.kleine-koenig@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230508205306.1474415-16-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/05/2023 22:51, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

