Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6223209
	for <chrome-platform@lists.linux.dev>; Tue,  3 May 2022 15:09:22 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id y3so33977633ejo.12
        for <chrome-platform@lists.linux.dev>; Tue, 03 May 2022 08:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7tccEYmP1Up3dLXDN+1M0rIsKvh0911h46EMldmvN7I=;
        b=b9ShGJ5SZTplKe0QbTIy+x0O2zCSuwbYR2O/20m2BPYhSQDrLmIGDywLO0FRQQrwcH
         Ly89HKMYQuR7uMZPvGFDet7K7qr1mGKyVs/NixIsXhg6ywD3joeB7yiiDXuwPkVn61HR
         yH5tjEQ+qoNKZohYEhk8radCiM3/+7F2b2k8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7tccEYmP1Up3dLXDN+1M0rIsKvh0911h46EMldmvN7I=;
        b=aXX72KXyXoLiDRi/F6ru+2MVPN7wfEtcxrLcIeAeb4KuUebMSyjcI8PiAqT7IopCSg
         NH0oDLBwDIsVho2vlf7APDgB5EPBOjC4KAUEJMsT0jr+zHzHHthNy9OdsH3Bysbr/BKz
         SgcZDcJpacHwpNfExHbkG0c6VxThWHvUbMT6xw/5UQWcBPjQOsQskSHX9xNTUXTmUoEz
         6dQ58fyMfml+e3jh5nWS7HGsHZN7l7mrSa4PuLzAqjYMttw3cViELQTZjbSBStvZN4ot
         yYC24MkP+vgn/jK/a6/uGzq3vxxchH9RnUzcmCKFhKRs51Ckqfx3DpJfGXvo7Jj1HHak
         E4ag==
X-Gm-Message-State: AOAM533bUKq1bhgK+Qnr0fDOy8fYdpbhW9NED/ko//k8OEBFHlr10vcf
	rNJRA8YS1xp4EDgHjDIovt/+hh50XiFqqxfj
X-Google-Smtp-Source: ABdhPJyh1s64D8UJWwlY7zBJex6xzjlzeEsjKH0SwjRdRDbBIxDYUqQHpMpXzcYm16YaKb7gxf37OQ==
X-Received: by 2002:a17:907:3f9b:b0:6f4:4407:a421 with SMTP id hr27-20020a1709073f9b00b006f44407a421mr9964048ejc.557.1651590560021;
        Tue, 03 May 2022 08:09:20 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id l16-20020a056402125000b0041d527833b9sm8031984edw.3.2022.05.03.08.09.17
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 08:09:17 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id o12-20020a1c4d0c000000b00393fbe2973dso1564500wmh.2
        for <chrome-platform@lists.linux.dev>; Tue, 03 May 2022 08:09:17 -0700 (PDT)
X-Received: by 2002:a7b:c4c8:0:b0:394:26c5:b79e with SMTP id
 g8-20020a7bc4c8000000b0039426c5b79emr3744035wmk.15.1651590556954; Tue, 03 May
 2022 08:09:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220503042242.3597561-1-swboyd@chromium.org> <20220503042242.3597561-2-swboyd@chromium.org>
In-Reply-To: <20220503042242.3597561-2-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 3 May 2022 08:09:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V8kfRYidvQRmx_XmGm8X3XHR_GxTkKvxkqUHdqJ5CMNg@mail.gmail.com>
Message-ID: <CAD=FV=V8kfRYidvQRmx_XmGm8X3XHR_GxTkKvxkqUHdqJ5CMNg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: google,cros-ec-keyb: Introduce
 switches only compatible
To: Stephen Boyd <swboyd@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	patches@lists.linux.dev, chrome-platform@lists.linux.dev, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	"Joseph S. Barrera III" <joebar@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, May 2, 2022 at 9:22 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> @@ -113,3 +135,56 @@ examples:
>              /* UP      LEFT    */
>              0x070b0067 0x070c0069>;
>      };
> +
> +  - |
> +    keyboard-controller {
> +        compatible = "google,cros-ec-keyb-switches", "google,cros-ec-keyb";
> +        /* Matrix keymap properties are allowed but ignored */

nit: s/allowed/required/

This now looks reasonable and well explained to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
