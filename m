Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A8A2591
	for <chrome-platform@lists.linux.dev>; Mon, 23 May 2022 15:11:55 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id m20so10698982wrb.13
        for <chrome-platform@lists.linux.dev>; Mon, 23 May 2022 08:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=7h/KQt7Gzc3HQkbNCwwgoLtjOZYGEyw/thG38+Y/9pc=;
        b=yD4Dk5reZabRrlBn67GpBQPnumgx2fGYw9o8ZEO5TCyXqPollokxS0ADfya/iNX4oA
         DYdpe3Gy0FlgOGMdMRQwDPh6XJXt90IbeQ2+Np20oK3MfGP4gVCaMiRcTRYyP/YcXEc+
         u1uV2Uzk6Lasp2C5wTRsSyDQhs7UNs1XCs5Y2Na7PVAivClyMsq9QHTHzrGTNSinQ/xx
         DVeqRC8DTPeCiGcREFR9xd6VhHIsMwIFxmkNxS+/dZSKUK2+WG4cndcJuqjz44yC7DVr
         j60q5lfpnSCDeLENH7hdGnszpCeHEY31GbegypiJZYyJSy+mdNFZ4XvDZr28F4BUWe4j
         yfag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7h/KQt7Gzc3HQkbNCwwgoLtjOZYGEyw/thG38+Y/9pc=;
        b=P/7xakaHGrXIJstHd1G8gxI2SfJ140zDC3AIcX3LEemc4cmExedGV6E9WsbLClFQxn
         V5wluVTLuGk7J/9h0Y/5ojA5A8pYEae0myWsrKy5j/9yu8h+Xy8aWuzoXXd6fFi4sf2K
         NwD4NENxvk6/egRtc+jwfUwiRoF9Ag/nuvU0gZ/jMkDAuqiGMzSAcCIfXMEIZnN/HltA
         ZIswspjsQjLWjVqgmreLFFoRrwyEXDKqoYPSFfvaUL3BMf4tHYBOI589+FE+sgoXmunP
         XULCpO4c/xibYmT+PQUzKqtZtHJ7t3tr+V30t6+Q6VfeYBgX+NpfkBv0bAMW+/AIOW3r
         bwQg==
X-Gm-Message-State: AOAM530UKGFRvrSmFVk60KjRkNwsUpvvG97P8eltVMb6Gy/PsRpn3C8y
	uLclPxBA8B1RHbp2yis8KYGBhQ==
X-Google-Smtp-Source: ABdhPJxVUeEdhefzEjlzSC8eYKT+NZnwnK0Pe8cKjJGa59wR4aefUSfAV1iaw6NG/VT/vOtL6bXSPg==
X-Received: by 2002:a05:6000:18aa:b0:20c:7ec0:b804 with SMTP id b10-20020a05600018aa00b0020c7ec0b804mr18431525wri.128.1653318713774;
        Mon, 23 May 2022 08:11:53 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id q11-20020adfaa4b000000b0020fc6590a12sm5607184wrd.41.2022.05.23.08.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 08:11:53 -0700 (PDT)
Date: Mon, 23 May 2022 16:11:51 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
	patches@lists.linux.dev, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	chrome-platform@lists.linux.dev,
	Guenter Roeck <groeck@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Craig Hesling <hesling@chromium.org>,
	Tom Hughes <tomhughes@chromium.org>,
	Alexandru M Stan <amstan@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>,
	Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: cros-ec: Fix a typo in description
Message-ID: <YoukN2uCpL3rmMsQ@google.com>
References: <20220512013921.164637-1-swboyd@chromium.org>
 <20220512013921.164637-2-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220512013921.164637-2-swboyd@chromium.org>

On Wed, 11 May 2022, Stephen Boyd wrote:

> A 's/pf/of/' on rpmsg-name description.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: <chrome-platform@lists.linux.dev>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Craig Hesling <hesling@chromium.org>
> Cc: Tom Hughes <tomhughes@chromium.org>
> Cc: Alexandru M Stan <amstan@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  Documentation/devicetree/bindings/mfd/google,cros-ec.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
