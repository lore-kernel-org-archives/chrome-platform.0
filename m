Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A14E15A0
	for <chrome-platform@lists.linux.dev>; Fri, 18 Mar 2022 20:49:22 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id d10so19188759eje.10
        for <chrome-platform@lists.linux.dev>; Fri, 18 Mar 2022 13:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+MSb82c7wemn5s39BmM23Oln72hevPicxsN1r5ivL6U=;
        b=CA1hCCYL0BQ05YK0J1CPDJmoLh2ESsCRnFcUnRyOfupdkOao9Ca/nbVo4HSzLXwCSI
         Vrqmw5nsHFAhl5WYnCZuOBc2nEZJef8k8cWy8urUgt3WrrA3POPVaETGqdFAxiq2WVwy
         Z6F8q64+iOK3GE3gc0n++Gw5aW3gmufktvl6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+MSb82c7wemn5s39BmM23Oln72hevPicxsN1r5ivL6U=;
        b=Kkt0LRKzc49v8iK1zwlVCfcDUHDJAb77n2T8NokjZkVS8THFcF92en9d8ZpaEk0ofW
         yeHZ/b0oV+sw+5h3X0bkVrdWwW9YAxPTOkCdcZP7INvq20xxuoNA8WWqtYAjftwrGFzy
         FFP3Otew6PT+hTe5Pjx+oTfix0+ifb9VnjwsYsV0BoQMtPzsojjjnn2JaKViMv+IxeeP
         AryJNll+2FedeHxcVC91RNnz3zXkqiPwlWX1cg0cNRQ7TRYK0xxO44OfRxrgyVcQq7Tn
         Yo4cSQ3D/yT0Js3ztVDvDAqOgb/PKkUXa6utGdZVx+Np/pk7PlZuL1+dso/BKV5xVWfR
         q4Yw==
X-Gm-Message-State: AOAM533qFDJrFSb07KhkRub4/6Nho2sfThDBf7wgBqryNddWnRmxuohx
	1aIEDIX6F3mRvPOmRNlpKJLE5+ZPHpxGNW7MRqQ=
X-Google-Smtp-Source: ABdhPJy7nWxZOeeHGb2/oGtdB9EajzDxe8IcaeHFwL+18vt861jS9suN+Oayh7YofIfgipWnHmHUPg==
X-Received: by 2002:a17:907:d8b:b0:6df:d4a4:9d07 with SMTP id go11-20020a1709070d8b00b006dfd4a49d07mr418052ejc.10.1647636560230;
        Fri, 18 Mar 2022 13:49:20 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id u19-20020a17090617d300b006cea86ca384sm4027502eje.40.2022.03.18.13.49.19
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 13:49:19 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id l1-20020a05600c4f0100b00389645443d2so5374231wmq.2
        for <chrome-platform@lists.linux.dev>; Fri, 18 Mar 2022 13:49:19 -0700 (PDT)
X-Received: by 2002:a05:600c:19d1:b0:389:7772:b21b with SMTP id
 u17-20020a05600c19d100b003897772b21bmr17513788wmq.118.1647636558601; Fri, 18
 Mar 2022 13:49:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220318015451.2869388-1-swboyd@chromium.org> <20220318015451.2869388-2-swboyd@chromium.org>
In-Reply-To: <20220318015451.2869388-2-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 18 Mar 2022 13:49:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WV+rssDpUdq0fVuVKf4b7DwTsFgodAX8wi-eLEoxTa3g@mail.gmail.com>
Message-ID: <CAD=FV=WV+rssDpUdq0fVuVKf4b7DwTsFgodAX8wi-eLEoxTa3g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: chrome: Add ChromeOS fingerprint binding
To: Stephen Boyd <swboyd@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, LKML <linux-kernel@vger.kernel.org>, 
	chrome-platform@lists.linux.dev, Rob Herring <robh+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	Craig Hesling <hesling@chromium.org>, Tom Hughes <tomhughes@chromium.org>, 
	Alexandru M Stan <amstan@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, Mar 17, 2022 at 6:54 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Add a binding to describe the fingerprint processor found on Chromebooks
> with a fingerprint sensor.

It might be worth mentioning that previously these fingerprint devices
were described using "google,cros-ec-spi" just to provide context?


> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Craig Hesling <hesling@chromium.org>
> Cc: Tom Hughes <tomhughes@chromium.org>
> Cc: Alexandru M Stan <amstan@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../bindings/chrome/google,cros-ec-fp.yaml    | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/

Reviewed-by: Douglas Anderson <dianders@chromium.org>
