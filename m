Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AB76AA9
	for <chrome-platform@lists.linux.dev>; Tue, 16 Aug 2022 21:45:19 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-32194238c77so186213427b3.4
        for <chrome-platform@lists.linux.dev>; Tue, 16 Aug 2022 14:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=pSOrOVI25VgV/6R9W1wYpCotHFnCNKL0lI+znEZmad4=;
        b=aDEMqQlVNtBx4WNCOODhmJMNlGdxPFbMynhD9rQXWJIEXTF1UflpIbWlGGDOYQfmRa
         me4OeJEzi22O9nWvlt3Qvf/xnVEZnjBqRKg9MYRK8flxg6gt20bwRhmu1HC5rAv2hN6y
         biqmNlvuJFxFIKsJSSMYAYz+YH6ZR390SIDU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=pSOrOVI25VgV/6R9W1wYpCotHFnCNKL0lI+znEZmad4=;
        b=POXxIKLRnNubZppsNcdibXVJwc1657SHGm6vlUGEZc6EXBTolG2Z71iNbPhFeiKA+t
         9g5x+BM5x3/g2wQwbPTfXzwzGaWNjTbKuCzLnIsbqnTvbZN1QE9ISzLf78W0QWA6NIZ+
         y68FpwfK2Kp8olB5WRZ+LXQe7BTsdlYJ+WxyfiRk3Okyex9m6qutpwlochVBmIiLYNhQ
         p66TQsPJ0T4SWmojsa5EskakEn6bVcl19dNRJi5KlXOJXpEaXu6obSb6q4QPMC046d7R
         hJoyarDtI+zORpEhiYthCRwc4FRg5I+LMd7GOIVLqYKBqLcf/FxpRBE2bOLUEyoSydcI
         K7rQ==
X-Gm-Message-State: ACgBeo1yDPh1hF1VesJmTPjv0blAPT0TWaSXpDmKxXk+nzMRqB+jHD46
	nwQj5dg+Ykwl4dzAzXSdg68xPgLE1pAxEr2JqNtVIw==
X-Google-Smtp-Source: AA6agR49sGoqbPcnlL8zomIof6WHUAIpLbgSN3IgimaBLZHyxy8Xji/076KvwuOs454glGdPV7lJw/lP3uTdyfKOIH0=
X-Received: by 2002:a25:2d5d:0:b0:685:1c21:3ee8 with SMTP id
 s29-20020a252d5d000000b006851c213ee8mr13931951ybe.197.1660686318255; Tue, 16
 Aug 2022 14:45:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220815063555.1384505-1-pmalani@chromium.org>
 <20220815063555.1384505-4-pmalani@chromium.org> <YvsnBWZlH8ouSlLk@google.com>
In-Reply-To: <YvsnBWZlH8ouSlLk@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 16 Aug 2022 14:45:08 -0700
Message-ID: <CACeCKaeeKjk37=KUx0qx9tCw6F02sZ947YGS5mm08cKJHzo3Bw@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] platform/chrome: cros_typec_switch: Set EC retimer
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	bleung@chromium.org, Daisuke Nojiri <dnojiri@chromium.org>, 
	"Dustin L. Howett" <dustin@howett.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Guenter Roeck <groeck@chromium.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Tinghan Shen <tinghan.shen@mediatek.com>, Xiang wangx <wangxiang@cdjrlc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 15, 2022 at 10:11 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> On Mon, Aug 15, 2022 at 06:34:21AM +0000, Prashant Malani wrote:
> > +static int cros_typec_cmd_mux_set(struct cros_typec_switch_data *sdata, int port_num, u8 index,
> > +                               u8 state)
> > +{
> > +     struct typec_usb_mux_set params = {
> > +             .mux_index = index,
> > +             .mux_flags = state,
> > +     };
> > +
> > +     struct ec_params_typec_control req = {
> > +             .port = port_num,
> > +             .command = TYPEC_CONTROL_COMMAND_USB_MUX_SET,
> > +             .mux_params = params,
> > +     };
>
> Would it be better to avoid the memory copy by making `params` inline?
>
> E.g.:
> struct ec_params_typec_control req = {
>     ...
>     .mux_params = {
>         ...
>     },
>     ...

Done.

>
> > +/*
> > + * The Chrome EC treats both mode-switches and retimers as "muxes" for the purposes of the
>
> To be consistent to the series, I guess you would like to use ChromeOS
> instead of Chrome?
Fixed in v6.

>
