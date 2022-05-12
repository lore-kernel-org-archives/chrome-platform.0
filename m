Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2C83FF1
	for <chrome-platform@lists.linux.dev>; Thu, 12 May 2022 23:52:00 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id n10so13179780ejk.5
        for <chrome-platform@lists.linux.dev>; Thu, 12 May 2022 16:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V8uYgTXib/6BjhyAwPvyH9p+W39RRdBBH4HTP3NeUrE=;
        b=NkK5kPK5fIrUVGWgs+G9GyiaTiTnt5AJgzEKT+dmRktub3KA9K295ltiHCVtsmJ/t/
         x4Z76G4eFJ4PCnRDRHT4mBC/tPRg7JhJc5QIiBfjq8rb6o3pR4E8xPOCHPfXsVBXObaP
         IJjabM2xCsvBa3UCWB37Mr/RUrFPgxrNSwGFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V8uYgTXib/6BjhyAwPvyH9p+W39RRdBBH4HTP3NeUrE=;
        b=dBFFLIGEAvab7qfJliK95T0maUlZfZzonv2uby1owBttpaptW6U2woiB0jzScQ5ROc
         gqXVCRFUbZly6n0l5VJ77YIRTP7XTPOBA1veJxdQBZGZgM5zYo+wquBbH8bsRg2iEFKe
         nEf4Esd7Ph1QR+M7eEUNrvMM1Ey0k7NKo9csEvBKpK0fkJxvp+DMSjEZG71wSQQLbVFe
         BqH+OR3DflVHC2Sb82025Dm/z9WR67Mq7Ai1QTT8MexeK/kBjR8DR6V2qy2WW3i1Qb7w
         r7iIvZ3fVpzTkv7U0lJfJCpNxjZtveGl7NJyArUal5QiEb1m6vKUkogxE3cojHrAOEOC
         OqQw==
X-Gm-Message-State: AOAM531ERFYM0rnZSeWlV86TfvpduNltrE3wihKFK1E+iAErvz09b+Vk
	p5OoK6wgtKAhMfki9ui6f+Kb6T3907oDx2tSoKQ=
X-Google-Smtp-Source: ABdhPJz/FA6Py7fWyqVqVSNutAC+8TRjx9zYXoIQAC3vVUsZ7tDQPULkpA9++mikmwN87NLhOuz66A==
X-Received: by 2002:a17:906:4cd8:b0:6db:372:c4ba with SMTP id q24-20020a1709064cd800b006db0372c4bamr1989906ejt.57.1652399518308;
        Thu, 12 May 2022 16:51:58 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id yl16-20020a17090693f000b006f4c82c2b12sm227835ejb.19.2022.05.12.16.51.57
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 16:51:58 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id 1-20020a05600c248100b00393fbf11a05so6029726wms.3
        for <chrome-platform@lists.linux.dev>; Thu, 12 May 2022 16:51:57 -0700 (PDT)
X-Received: by 2002:a05:600c:3d8c:b0:394:6097:9994 with SMTP id
 bi12-20020a05600c3d8c00b0039460979994mr12323884wmb.29.1652399103788; Thu, 12
 May 2022 16:45:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220512013921.164637-1-swboyd@chromium.org> <20220512013921.164637-4-swboyd@chromium.org>
In-Reply-To: <20220512013921.164637-4-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 May 2022 16:44:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W4k8-Ab+diBic5rbannRr1ZKB=cdHNEOC3Emr0nyzQjQ@mail.gmail.com>
Message-ID: <CAD=FV=W4k8-Ab+diBic5rbannRr1ZKB=cdHNEOC3Emr0nyzQjQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] dt-bindings: cros-ec: Add ChromeOS fingerprint binding
To: Stephen Boyd <swboyd@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	patches@lists.linux.dev, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, chrome-platform@lists.linux.dev, 
	Guenter Roeck <groeck@chromium.org>, Craig Hesling <hesling@chromium.org>, 
	Tom Hughes <tomhughes@chromium.org>, Alexandru M Stan <amstan@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, May 11, 2022 at 6:39 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> @@ -176,6 +189,37 @@ allOf:
>          - reg
>          - interrupts
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: google,cros-ec-fp
> +    then:
> +      properties:
> +        '#address-cells': false
> +        '#size-cells': false
> +        typec: false
> +        ec-pwm: false
> +        keyboard-controller: false
> +        proximity: false
> +        codecs: false
> +        cbas: false
> +
> +      patternProperties:
> +        "^i2c-tunnel[0-9]*$": false
> +        "^regulator@[0-9]+$": false
> +        "^extcon[0-9]*$": false
> +
> +      required:
> +        - reset-gpios
> +        - boot0-gpios
> +        - vdd-supply
> +    else:
> +      properties:
> +        reset-gpios: false
> +        boot0-gpios: false
> +        vdd-supply: false

Wow, that's a huge pain to have to specify it this way, but I don't
know of any other way to make things happy and still have the
"google,cros-ec-spi" fallback that we decided on having in previous
versions.


>  additionalProperties: false
>
>  examples:
> @@ -231,4 +275,22 @@ examples:
>              compatible = "google,cros-ec-rpmsg";
>          };
>      };
> +
> +  - |

nit: all the other examples have a little "# For <blah>" comment
before them. It's not really necessary, but do we want one here to
match?

In any case, it seems OK to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
