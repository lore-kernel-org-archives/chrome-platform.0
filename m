Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAC215A0
	for <chrome-platform@lists.linux.dev>; Fri, 18 Mar 2022 20:49:46 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id yy13so19262011ejb.2
        for <chrome-platform@lists.linux.dev>; Fri, 18 Mar 2022 13:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NU7ZEUVN8ql0G77/7yngvtcg81ZP18IxeW3MoR+mnfc=;
        b=gpHKTFIoWyAq7NJYgL2fOfmoLbteYLBivfRhZtIWyYRoeqPxZlUTFgVE/91YpoliOl
         XS+43IHaFHuR8HuVTku97Q+qeetO2lxfYsxuEC+NklwtlcX5mvMY59yMqLpXAkwhxnz/
         xWXCkzlbR7QWcm+aZoxF+OKNDmMkcloCojUIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NU7ZEUVN8ql0G77/7yngvtcg81ZP18IxeW3MoR+mnfc=;
        b=SjDpafsvHo9MYQL+s4DvywQsvC0/nUsdWNjSx8IeCBrf6umzkW/SuHeOCcFhHTbJne
         WbVY8yvYyW6JAQjl2+5s0HChneH1ZvdgiQulnALqi1wXwQ9Xh261xFmrp5CUkX4M5M5I
         MvQLd3CPhjq5qRLxfgv3BuczaAJ2J5uqwr8aLOnGmFEndAdKq+dx3VcObkGpWPM6DDZQ
         3zYmGkJNMgvMpBJJRyq2It/g3f5XZYGk2aO1k5OeCnQj5IfJRrerHmwEqC4i97IFMcJ6
         0W5/kVpMjjk++IGKocA7G3qwtzTkBmDYwNFTLTI/ZKxbDf/w65CFID5QYhKBcOgKkODL
         eNWg==
X-Gm-Message-State: AOAM530Nd/y8rv5fYI4a+3LvnjWkuHf5LajhLnRJBVINp3tA76mN2IUd
	m5nJwiHCL5CNlAHRq5xQFWqvIBZI2MMSREGAn7E=
X-Google-Smtp-Source: ABdhPJwjyr4GSzneneJz9VKBjhvqikyTNITHcoijv7YO+HcyfJwktwmVf4BqDIcSKfopjvIaK/MsXQ==
X-Received: by 2002:a17:906:478e:b0:6db:7c67:c7e0 with SMTP id cw14-20020a170906478e00b006db7c67c7e0mr10594785ejc.335.1647636584235;
        Fri, 18 Mar 2022 13:49:44 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id gb29-20020a170907961d00b006dbcd3c3999sm3988026ejc.149.2022.03.18.13.49.43
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 13:49:43 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id u10so13183156wra.9
        for <chrome-platform@lists.linux.dev>; Fri, 18 Mar 2022 13:49:43 -0700 (PDT)
X-Received: by 2002:a05:6000:1704:b0:203:d857:aa7a with SMTP id
 n4-20020a056000170400b00203d857aa7amr9445786wrc.513.1647636582819; Fri, 18
 Mar 2022 13:49:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220318015451.2869388-1-swboyd@chromium.org> <20220318015451.2869388-3-swboyd@chromium.org>
In-Reply-To: <20220318015451.2869388-3-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 18 Mar 2022 13:49:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WR9hkRF9BLCMNkH53bYz-sLZ_p=xWzh1EXST=dfkp-mA@mail.gmail.com>
Message-ID: <CAD=FV=WR9hkRF9BLCMNkH53bYz-sLZ_p=xWzh1EXST=dfkp-mA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] platform/chrome: cros_ec_spi: Match cros-ec-fp compatible
To: Stephen Boyd <swboyd@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, LKML <linux-kernel@vger.kernel.org>, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Craig Hesling <hesling@chromium.org>, Tom Hughes <tomhughes@chromium.org>, 
	Alexandru M Stan <amstan@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, Mar 17, 2022 at 6:54 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Add the fingerprint cros-ec compatible and spi_device_id so that we can probe
> fingerprint devices.
>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Craig Hesling <hesling@chromium.org>
> Cc: Tom Hughes <tomhughes@chromium.org>
> Cc: Alexandru M Stan <amstan@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/platform/chrome/cros_ec_spi.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
