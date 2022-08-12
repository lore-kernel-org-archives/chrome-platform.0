Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C472115
	for <chrome-platform@lists.linux.dev>; Fri, 12 Aug 2022 16:56:05 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id d187so1258502iof.4
        for <chrome-platform@lists.linux.dev>; Fri, 12 Aug 2022 09:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=lA3f3otAT+iFQtPwg3K/WfF7yz98PPxitrFwV9W2g10=;
        b=CEj5PCvBcKe6xB3CYcLv6rwAJ13WKbAaZ4H87YpW32Tf7bbJyuA76wmdvxq15mCjFp
         3lGEPo2/fln5AH8UOaLhSx1BBrWTC6SDi8Zqxwga0paxOvPpnaRB7UcSc5Attmn73D0T
         N9+WcP0mbmSaujNhgloatfDScrJah3zQSI2a3EaDqkCsfpn9azOZyIrNiqrML8B0Vrqo
         FrRbEhCQon3A2V35dFpcPwRiUnOQZ92dv4H5pv6sqBFXgIKcqmUjP3y2g35fm8CH4Ied
         Yrnw47RxuZcCcoau4x8gEqArzDvLodvJMEgiSyJDy6RVYN/D0r6AQDb/k+W2yntLOYsP
         bAlQ==
X-Gm-Message-State: ACgBeo1/dNJRZgcInPsL7pXLGp5UJTPs4L3NWsCwdjQTPzNxdxXw/ffY
	bUfVbryX/XG+5cZX6W85cQ==
X-Google-Smtp-Source: AA6agR53ym77b2F1XAcoznh/2AR8P2rUYI8OEORisaCv7oueGq+oRS+W6sU+MQqeAu6IWP9MJSYfpw==
X-Received: by 2002:a05:6602:2d0d:b0:684:9906:9fd with SMTP id c13-20020a0566022d0d00b00684990609fdmr1918800iow.86.1660323364503;
        Fri, 12 Aug 2022 09:56:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id z16-20020a05663822b000b003427170b558sm87140jas.57.2022.08.12.09.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 09:56:03 -0700 (PDT)
Received: (nullmailer pid 317289 invoked by uid 1000);
	Fri, 12 Aug 2022 16:56:02 -0000
Date: Fri, 12 Aug 2022 10:56:02 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, chrome-platform@lists.linux.dev, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Prashant Malani <pmalani@chromium.org>
Subject: Re: [PATCH v2] dt-bindings: chrome: google,cros-ec-typec: restrict
 allowed properties
Message-ID: <20220812165602.GA317229-robh@kernel.org>
References: <20220811062245.4316-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220811062245.4316-1-krzysztof.kozlowski@linaro.org>

On Thu, 11 Aug 2022 09:22:45 +0300, Krzysztof Kozlowski wrote:
> Describe exactly what properties are allowed in Google Chrome OS EC Type
> C port, so the schema can properly validate the DTS.  Existing DTS
> defines always connectors with unit addresses, not a sole "connector"
> child.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Prashant Malani <pmalani@chromium.org>
> 
> ---
> 
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Changes since v1:
> 1. Correct subject prefix
> ---
>  .../bindings/chrome/google,cros-ec-typec.yaml     | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 

Applied, thanks!
