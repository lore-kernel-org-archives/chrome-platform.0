Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D8628F3
	for <chrome-platform@lists.linux.dev>; Tue,  4 Apr 2023 17:07:56 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-17683b570b8so35319054fac.13
        for <chrome-platform@lists.linux.dev>; Tue, 04 Apr 2023 10:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680628075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6gkago0IX2qDsFTPoqyaI/Smb2BtWMPqkzjbhBxBBY=;
        b=5z6Mx1gEKKOEXvpTtiI8XWM9MC0+xBeb3aGj9q2URfijjRE3Fvm0k1btAxZVco6sFt
         CvQMWasLvhtFINBY1CBsCQzjJxrMeYybQQq13QNrasz06JvjrLoZ7ljKagPU4qHNvpWQ
         5AmQyMxO0IU9TCqwHDgB+lL3yjujI86TvveVLZKxroS06i7Wti1GjyoWy2y248F3ZkEi
         A4r6/kLYs3zDklvkX1+Qt6toBDtGPeVgf5n972i1/G+du5ZpVz7X87i7UDgrfayTc/gp
         c8wTXDdjKWWk+ZAKzPcC7+dZkvMiOK58Xjl+8YFBBqhVD0u9bGiEPQtsKLNyv31nj/98
         mfqg==
X-Gm-Message-State: AAQBX9e+Dp0ImMIsC9GWbGkKNC/X71VASBcn8pzZ6K7jZ9yeuQGWGjEU
	PJPydHxJkhltIA8iv6+SdQ==
X-Google-Smtp-Source: AKy350boa65dpRdsMFN94tJSdJniDAXV5Su1VkGjuBPDPH1ry4H904Fa2qgHRI+R97gDaNx5b+aQyQ==
X-Received: by 2002:a05:6870:d599:b0:17f:d229:bc54 with SMTP id u25-20020a056870d59900b0017fd229bc54mr58236oao.12.1680628075017;
        Tue, 04 Apr 2023 10:07:55 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id kw17-20020a056870ac1100b001802d3e181fsm4961509oab.14.2023.04.04.10.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 10:07:54 -0700 (PDT)
Received: (nullmailer pid 111440 invoked by uid 1000);
	Tue, 04 Apr 2023 17:07:53 -0000
Date: Tue, 4 Apr 2023 12:07:53 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Mattijs Korpershoek <mkorpershoek@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: input: Drop unneeded quotes
Message-ID: <20230404170753.GB49361-robh@kernel.org>
References: <20230320234718.2930154-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320234718.2930154-1-robh@kernel.org>

On Mon, Mar 20, 2023 at 06:47:18PM -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/input/adc-joystick.yaml     | 4 ++--
>  .../devicetree/bindings/input/google,cros-ec-keyb.yaml        | 2 +-
>  Documentation/devicetree/bindings/input/imx-keypad.yaml       | 2 +-
>  Documentation/devicetree/bindings/input/matrix-keymap.yaml    | 2 +-
>  .../devicetree/bindings/input/mediatek,mt6779-keypad.yaml     | 2 +-
>  .../devicetree/bindings/input/microchip,cap11xx.yaml          | 4 ++--
>  Documentation/devicetree/bindings/input/pwm-vibrator.yaml     | 4 ++--
>  Documentation/devicetree/bindings/input/regulator-haptic.yaml | 4 ++--
>  .../bindings/input/touchscreen/elan,elants_i2c.yaml           | 4 ++--
>  9 files changed, 14 insertions(+), 14 deletions(-)

Applied, thanks.

