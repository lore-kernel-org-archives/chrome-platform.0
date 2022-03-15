Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7101D10E8
	for <chrome-platform@lists.linux.dev>; Tue, 15 Mar 2022 00:24:16 +0000 (UTC)
Received: by mail-vk1-f182.google.com with SMTP id j201so9262779vke.11
        for <chrome-platform@lists.linux.dev>; Mon, 14 Mar 2022 17:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9+FOSvDg+ZUh5vunVEqGtFAxwPurKxeLhtmDXEkBmug=;
        b=OkbxfUcCvuK0TIeWEhVllcozSpDI+atGFo1gj7JDGcq7W/bia8MXWEnCfQbkKBF6NL
         nTPUUorDchFrNA5oATz4P5IbFvCHKqp6D61Hfor5tDNi/RjsQf3FPVrfqERdCy6+2DHE
         Zwyi+cOw/B7l0+TvugAGX8IRU7395eDn22VUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9+FOSvDg+ZUh5vunVEqGtFAxwPurKxeLhtmDXEkBmug=;
        b=4Js6C95pwxTEn6zHZoWE8PgrMkSsc6zTv2lXqz+gU/XELEawSj8Lmifaeb7r78jNp0
         YUjOF28vmVdvaSalqAyY8sJVwAokx3WI5U2i5eb755p8zL/mWNv7e3NZTha615QTU7u7
         7LcMCT78HfVV0QaOYbZ00V86nLT1ArcckjSUhsUIFZtCrz0yNWNoBH7GlB9886z4eOFU
         ENkxiEl3mWjbnc+xNpnObSsYsLcaBZy4Cdkt1VsdsAKdsds+rNchSySlOqA2dE39wQlN
         hqnAN0L4OaDaNVIybhJvUvu1bpgYuVMbfVUgOWbdZ/IibCJrrFiCazza9yKfj7/dTfCv
         PKRA==
X-Gm-Message-State: AOAM532E3o66cUM1l0vAg6BMIL8uXs4oi7ilLwDdMsp9PDxTP6310lQB
	smZWNsKkmb8ufHxX1bM6EMVKLJMpwcWGKQ==
X-Google-Smtp-Source: ABdhPJzoUs/LWUUDa45veaQ8blJhvuXA2AtmBPNU4CJgzx+QCodDwzvTm1Ez4p7G4N7xP2234GVzDg==
X-Received: by 2002:a1f:b48f:0:b0:336:84a6:71cc with SMTP id d137-20020a1fb48f000000b0033684a671ccmr10256597vkf.15.1647303855087;
        Mon, 14 Mar 2022 17:24:15 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id s13-20020ab0764d000000b0034c29ef054fsm2680419uaq.8.2022.03.14.17.24.14
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 17:24:14 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a28so7329153uaf.7
        for <chrome-platform@lists.linux.dev>; Mon, 14 Mar 2022 17:24:14 -0700 (PDT)
X-Received: by 2002:ab0:67d7:0:b0:345:6bac:4f15 with SMTP id
 w23-20020ab067d7000000b003456bac4f15mr9498820uar.43.1647303854018; Mon, 14
 Mar 2022 17:24:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220314232214.4183078-1-swboyd@chromium.org> <20220314232214.4183078-2-swboyd@chromium.org>
In-Reply-To: <20220314232214.4183078-2-swboyd@chromium.org>
From: Alexandru M Stan <amstan@chromium.org>
Date: Mon, 14 Mar 2022 17:23:38 -0700
X-Gmail-Original-Message-ID: <CAHNYxRwFYBbgxUqz79jYXbDxSd-r+NdHWQPucEyuNK83U577xw@mail.gmail.com>
Message-ID: <CAHNYxRwFYBbgxUqz79jYXbDxSd-r+NdHWQPucEyuNK83U577xw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: Add ChromeOS fingerprint binding
To: Stephen Boyd <swboyd@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	chrome-platform@lists.linux.dev, Rob Herring <robh+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	Douglas Anderson <dianders@chromium.org>, Craig Hesling <hesling@chromium.org>, 
	Tom Hughes <tomhughes@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 14, 2022 at 4:22 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
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
> +  reset-gpios:
> +    maxItems: 1
> +    description: reset signal (active low).
> +
> +  boot0-gpios:
> +    maxItems: 1
> +    description: boot signal (low for normal boot; high for bootloader).
Maybe add "active high, same polarity as the fpmcu sees physically".

> +  vdd-supply:
> +    description: Power supply for the fingerprint controller.
> +
> +  google,cros-ec-spi-pre-delay:
> +    description:
> +      This property specifies the delay in usecs between the
> +      assertion of the CS and the first clock pulse.
> +    allOf:
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
> +        google,cros-ec-spi-msg-delay = <37>;
> +        google,cros-ec-spi-pre-delay = <5>;
> +        reset-gpios = <&gpio_controller 5 GPIO_ACTIVE_LOW>;
> +        boot0-gpios = <&gpio_controller 10 GPIO_ACTIVE_LOW>;
This should say GPIO_ACTIVE_HIGH, since there's no inverting going on
either with a real inverter, or the convention (of 'N' being in the
pin name).

It might be easier to reason about if there's no invesion going for this signal.

Consider it like an enum instead of a verb (unlike active_low
reset-gpios which can be considered: in reset if it's set):

enum boot0 {
        normal = 0,
        bootloader = 1,
};

> +        vdd-supply = <&pp3300_fp_mcu>;
> +      };
> +    };
> +...
> --
> https://chromeos.dev
>
--
Alexandru Stan (amstan)
