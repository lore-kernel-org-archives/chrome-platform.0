Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D4A3D79
	for <chrome-platform@lists.linux.dev>; Thu, 17 Mar 2022 09:34:35 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id p9so6437825wra.12
        for <chrome-platform@lists.linux.dev>; Thu, 17 Mar 2022 02:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sWJXxumggqkeiId/uryaGdIFQhUjPzM/H86XSQncuv4=;
        b=uqOsvXlQhlAYlm3nhTX2SArTmgbxwofs5NCpMBQC1330n+7CQRZ30oJqnBz1G+TkWg
         TfxxqdYI2b3UNvSVmTNncX4x29JV/5nTmsnjBwmuM9zoRlx1PefT5q+HfmzTTAfRhwY0
         WQKRNeB7sdl8zSPUNLL7kjwf7L3HS/HMr/pFbBq4or3utSSbd7gsYo6VAo72TAYBOyQ4
         ABcjDBFJeIQhZwk65Y9oaZlnednkBmwwhEiUdD1atQB5KmVoOAw2wPXHEsCQ39W/ZB1L
         ugcUv1afxkO41JvTTzeiKy1qHQymAy0eX+V6f2HX5+aqTYtwIyE5F6kVMqVkem3w3kVr
         VCtw==
X-Gm-Message-State: AOAM530FaW8s8QzfB0hFLpBopw8eOBDf+f0xLlwHJ3R1UabWDWki+FvK
	P7bM/kkJVizSmEQ8xjeyONE=
X-Google-Smtp-Source: ABdhPJxHOdLhJhlAVBYo1oJlNZ4aWgDo2Hdsjm7E0SRhNq6Y4fIHNktuOUpzgNYnKItKDquR0sUcWw==
X-Received: by 2002:adf:8003:0:b0:1f1:d81b:d752 with SMTP id 3-20020adf8003000000b001f1d81bd752mr3108143wrk.429.1647509673521;
        Thu, 17 Mar 2022 02:34:33 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.googlemail.com with ESMTPSA id u11-20020a056000038b00b00203e5c9aa09sm2723905wrf.27.2022.03.17.02.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 02:34:33 -0700 (PDT)
Message-ID: <3828e37f-f8e0-8473-537c-8e47cd5df8c6@kernel.org>
Date: Thu, 17 Mar 2022 10:34:31 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/3] dt-bindings: chrome: Add ChromeOS fingerprint
 binding
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Benson Leung <bleung@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Douglas Anderson
 <dianders@chromium.org>, Craig Hesling <hesling@chromium.org>,
 Tom Hughes <tomhughes@chromium.org>, Alexandru M Stan <amstan@chromium.org>,
 Tzung-Bi Shih <tzungbi@kernel.org>
References: <20220317005814.2496302-1-swboyd@chromium.org>
 <20220317005814.2496302-2-swboyd@chromium.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220317005814.2496302-2-swboyd@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/03/2022 01:58, Stephen Boyd wrote:
> Add a binding to describe the fingerprint processor found on Chromebooks
> with a fingerprint sensor.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Craig Hesling <hesling@chromium.org>
> Cc: Tom Hughes <tomhughes@chromium.org>
> Cc: Alexandru M Stan <amstan@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../bindings/chrome/google,cros-ec-fp.yaml    | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/chrome/google,cros-ec-fp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-fp.yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-fp.yaml
> new file mode 100644
> index 000000000000..ba4212e6b583
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-fp.yaml

Hm, so chrome starts to be its own subsystem? I see USB connector
bindings are already there, instead of usb directory.

Is there anything special about Chrome that it is equal to subsystem or
architecture? Once second file ends up there, this will encourage more
of such patterns.

> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/chrome/google,cros-ec-fp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ChromeOS Embedded Fingerprint Controller
> +
> +description:
> +  Google's ChromeOS embedded fingerprint controller is a device which
> +  implements fingerprint functionality such as unlocking a Chromebook
> +  without typing a password.
> +
> +maintainers:
> +  - Tom Hughes <tomhughes@chromium.org>
> +
> +properties:
> +  compatible:
> +    const: google,cros-ec-fp
> +
> +  reg:
> +    maxItems: 1
> +
> +  spi-max-frequency:
> +    maximum: 3000000
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios: true
> +  boot0-gpios:
> +    maxItems: 1
> +    description: Assert for bootloader mode.
> +
> +  vdd-supply: true
> +
> +  google,cros-ec-spi-pre-delay:

Use proper unit suffix, so "-us". No need for type then.


> +    description:
> +      This property specifies the delay in usecs between the
> +      assertion of the CS and the first clock pulse.
> +    allOf:

No need for allOf. Just put default/minimum directly.

> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - default: 0
> +      - minimum: 0
> +
> +  google,cros-ec-spi-msg-delay:
> +    description:
> +      This property specifies the delay in usecs between messages.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - default: 0
> +      - minimum: 0

Same here (proper suffix + allOf).



Best regards,
Krzysztof
