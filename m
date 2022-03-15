Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F491FB8
	for <chrome-platform@lists.linux.dev>; Tue, 15 Mar 2022 10:50:13 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 22FA53F1A1
	for <chrome-platform@lists.linux.dev>; Tue, 15 Mar 2022 10:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1647340897;
	bh=Wyk/ImnvLwvM+s0wTIfN19tP2iNmEMOz+2KBCV7gGwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=rOMDoEJRyxhqkcJXgetJqNmJMYyfxsc57PA43uBiQB2EHtxlrEPDtjAPTw3OBOgO2
	 3fl3qBFyPxmp0tfbCQC7Xwryopq3hd8MWmipPHUcnTvy95KU5IgwDATj1p/86D4aZK
	 CKmva4Gxe73m/zkb83FfDLDHY0F1TAGI+wkDQwcWPv46N7QvkPFdngV36ZUqf5NKoI
	 OHXgLEtrm4DbfP9mybbeVPPwTcArQLF7oN70S28AutBmQCyixCP1LNK/3mZcVGlLnk
	 1Wk3vML79RUTegU+lP5MDgybht91udFSPtPQQqZGpG3iflqAArzTwCxqf3hD2AW4BZ
	 HpM0kaxmN4IzQ==
Received: by mail-ed1-f70.google.com with SMTP id cm27-20020a0564020c9b00b004137effc24bso10368315edb.10
        for <chrome-platform@lists.linux.dev>; Tue, 15 Mar 2022 03:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Wyk/ImnvLwvM+s0wTIfN19tP2iNmEMOz+2KBCV7gGwc=;
        b=rI115FPEL6FdvU4ro28QUcGKVJAcC/gBrtxj8eXtBJUMrxprxpPv/lyZF6GPmpQsZe
         38cc2WPtRjEG1KNLhMuyErY2K8gUUIEhJzxYTJGEWjExNT4RXS3hZ7gsv0CbDVwWBy6E
         lMK6fWAbb8pfy5g70S5/BTOBuk/ToCh5SB6wsjWDg1UtYjZgRPXujzlMefcRVyR3Sr2x
         /SDYole/C2rkjUKCVNxJpT/4SDpgDhD51OgEV4AXTuDuQY1kliJjr7eH0ytI3ivdfqrv
         S9qVA7Z6cHEMYe6nNYmc3PICFnhd7GUMRKNXLLS+KwflXIXToWdcvlPbWJLZPrxPDmf/
         yl+A==
X-Gm-Message-State: AOAM532vaEEihRphozChQrevvPhO5rLr0DqGHzM3rwv87c2t3Gco5CA+
	lv9X4hiaPyrtbfSKQUNaYcw5bm1QLGzCvgTHgKyneBbfipXXAuYeRDxc4d0bh+nfnSh1yoVS0PZ
	bpg1b7ZwWzkXjBZuFn9hrcan2kMGNK7EVT++ikCTUrxHEEw==
X-Received: by 2002:a17:907:7711:b0:6ce:e03c:e1e2 with SMTP id kw17-20020a170907771100b006cee03ce1e2mr22297907ejc.769.1647340896862;
        Tue, 15 Mar 2022 03:41:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiTwTMsZYo8Frmsd5mds2vIg8CSZa4i21V434ur6Hyi4kW6gCcdaJ79x7rckl9dOTeQHzA6A==
X-Received: by 2002:a17:907:7711:b0:6ce:e03c:e1e2 with SMTP id kw17-20020a170907771100b006cee03ce1e2mr22297888ejc.769.1647340896685;
        Tue, 15 Mar 2022 03:41:36 -0700 (PDT)
Received: from [192.168.0.155] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.googlemail.com with ESMTPSA id l9-20020a1709066b8900b006daa6015a0dsm7856522ejr.89.2022.03.15.03.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Mar 2022 03:41:35 -0700 (PDT)
Message-ID: <e7f9466e-03c9-7754-0dc6-a04823d1047a@canonical.com>
Date: Tue, 15 Mar 2022 11:41:35 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] dt-bindings: mfd: Add ChromeOS fingerprint binding
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Benson Leung <bleung@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Douglas Anderson
 <dianders@chromium.org>, Craig Hesling <hesling@chromium.org>,
 Tom Hughes <tomhughes@chromium.org>, Alexandru M Stan <amstan@chromium.org>,
 Lee Jones <lee.jones@linaro.org>
References: <20220314232214.4183078-1-swboyd@chromium.org>
 <20220314232214.4183078-2-swboyd@chromium.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220314232214.4183078-2-swboyd@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/03/2022 00:22, Stephen Boyd wrote:
> Add a binding to describe the fingerprint processor found on Chromeboks
> with a fingerprint sensor.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Craig Hesling <hesling@chromium.org>
> Cc: Tom Hughes <tomhughes@chromium.org>
> Cc: Alexandru M Stan <amstan@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../bindings/mfd/google,cros-ec-fp.yaml       | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/google,cros-ec-fp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec-fp.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec-fp.yaml
> new file mode 100644
> index 000000000000..05d2b2b9b713
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/google,cros-ec-fp.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/google,cros-ec-fp.yaml#

Why is this in the MFD directory? Is it really a Multi Function Device?
Description is rather opposite. You also did not CC MFD maintainer.

Best regards,
Krzysztof
