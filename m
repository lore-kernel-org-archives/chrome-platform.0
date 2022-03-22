Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E597A
	for <chrome-platform@lists.linux.dev>; Tue, 22 Mar 2022 01:32:43 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id b188so18119881oia.13
        for <chrome-platform@lists.linux.dev>; Mon, 21 Mar 2022 18:32:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H9pYjXD74yJgRzh7QlanadwSjljKEdkZYPjwglF/fI8=;
        b=1MIecF0oBAxAIL8phuWW8mFEWEQdnb9BNd0AQfy9/Umbfa362O90qs6yYEZYcNS03r
         SiTdaMIboaACdTHRvDwiWsElFZItAzTbXwmXSc6L37f/2TDAorXbmZG/GUuPNU9a7Prx
         O+uncfccJRgqXgpoi7OMxlTF/X9ZYeRqUkaomOKIe9Aog6oSJVHZklVKhesC8+bxoCKT
         Z41vb8Sl3QBGB4vG2r4+CmQJIP1nqbMasJuV1hnSfixrhw6hMWKi3eew0Lrhda9c4VF4
         XxsgQa/6hJMWFehrMse7OevnzkR0WPtBUlAZleVjsUvL8uiQGQa9/vi1RL55txY9acNJ
         JkLA==
X-Gm-Message-State: AOAM530L4wTfwJOA8Lr/q186Tv102Ra9s8n0S383uiM9vZHk/x/dssBw
	Zd2SZXUJXqnBP0Q4vlDtTw==
X-Google-Smtp-Source: ABdhPJzmvRCe53/YOGzXdHoJihtboRpJXSIwrracAfHLjj8c7Z2nEObal3TmOqYYfC+C1o7sIY3r5w==
X-Received: by 2002:a05:6808:20a7:b0:2da:5fcb:29b2 with SMTP id s39-20020a05680820a700b002da5fcb29b2mr1003263oiw.82.1647912762406;
        Mon, 21 Mar 2022 18:32:42 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z1-20020a056870514100b000da196da21csm6811854oak.26.2022.03.21.18.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 18:32:41 -0700 (PDT)
Received: (nullmailer pid 915913 invoked by uid 1000);
	Tue, 22 Mar 2022 01:32:40 -0000
Date: Mon, 21 Mar 2022 20:32:40 -0500
From: Rob Herring <robh@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, Douglas Anderson <dianders@chromium.org>, Craig Hesling <hesling@chromium.org>, Tom Hughes <tomhughes@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: chrome: Add ChromeOS fingerprint
 binding
Message-ID: <YjknOFMere5DG5He@robh.at.kernel.org>
References: <20220321191100.1993-1-swboyd@chromium.org>
 <20220321191100.1993-2-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220321191100.1993-2-swboyd@chromium.org>

On Mon, Mar 21, 2022 at 12:10:57PM -0700, Stephen Boyd wrote:
> Add a binding to describe the fingerprint processor found on Chromebooks
> with a fingerprint sensor. Previously we've been describing this with
> the google,cros-ec-spi binding but it lacks gpio and regulator control
> used during firmware flashing.

Then 'google,cros-ec-spi' should be a fallback?

> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Cc: Craig Hesling <hesling@chromium.org>
> Cc: Tom Hughes <tomhughes@chromium.org>
> Cc: Alexandru M Stan <amstan@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../bindings/chrome/google,cros-ec-fp.yaml    | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/chrome/google,cros-ec-fp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-fp.yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-fp.yaml
> new file mode 100644
> index 000000000000..b7fbaaa94d65
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-fp.yaml
> @@ -0,0 +1,66 @@
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

maxItems: 1

> +  boot0-gpios:
> +    maxItems: 1
> +    description: Assert for bootloader mode.
> +
> +  vdd-supply: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - reset-gpios
> +  - boot0-gpios
> +  - vdd-supply
> +  - spi-max-frequency
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    spi {
> +      #address-cells = <0x1>;
> +      #size-cells = <0x0>;
> +      ec@0 {
> +        compatible = "google,cros-ec-fp";
> +        reg = <0>;
> +        interrupt-parent = <&gpio_controller>;
> +        interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
> +        spi-max-frequency = <3000000>;
> +        reset-gpios = <&gpio_controller 5 GPIO_ACTIVE_LOW>;
> +        boot0-gpios = <&gpio_controller 10 GPIO_ACTIVE_HIGH>;
> +        vdd-supply = <&pp3300_fp_mcu>;
> +      };
> +    };
> +...
> -- 
> https://chromeos.dev
> 
> 
