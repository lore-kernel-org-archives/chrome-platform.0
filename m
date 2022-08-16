Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52826AA9
	for <chrome-platform@lists.linux.dev>; Tue, 16 Aug 2022 21:45:35 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-3246910dac3so185746217b3.12
        for <chrome-platform@lists.linux.dev>; Tue, 16 Aug 2022 14:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=cD5rOQ4YArx1DGntEs82qTS6C7ZmDFTWDSo8kt2UBGU=;
        b=PmNG5jn90K7uUN6EOmc8Cjgsv36j/xPfdmZWQ827X/Xi9w/o6L9uCvgHnURPDJYV6y
         DeUVaHu8DOfec/IGep8/lnmcJUNB7IU/RowaG9LJWDA7HXAMPWehh/HzuH4sNvoWF+oc
         788pMQ9JdxR6BUosX0S588IPIVrvdkSxLSc5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=cD5rOQ4YArx1DGntEs82qTS6C7ZmDFTWDSo8kt2UBGU=;
        b=1N7XZW/zaIGhSojouGj2+k5zwrU7fp4gnpstdwuGkjTd0QNf8FsAYlJRcMXBhpjI1n
         OzCzrB+KYb17J3Sp2A3b8U+rYs2y8NkpFWf9qZgeQDj1xBsLL73y+aCimSQgXzEPBfzm
         Fj7YZPrY8s9PLGbbxvw3bb4oPFh6lcY6SjQJrS62Vlhz8JNfb+uVKjXIKkjPGD1Sk0jy
         towBFrOOqZMjxdPRZYF+2Y92ZhkRhSyNK43VF+qN1iiNdG0EIR09XkRFjQgXHRPy+lph
         lRG2NJ+JuBunEh9WnxHnWB5UsL8fmbVPUP6sNSosclqiYT49iim2xo74XKabZUp7/vlL
         D6cw==
X-Gm-Message-State: ACgBeo2GiBG8Muyf/fsxpnp13A5ltZkNe/xk9Cfoh5zuUjChYOgBUBE0
	AsUFbVRHX4UXsnvcAQWYIJ/NvQ/H9Zia6ybGn2OGOg==
X-Google-Smtp-Source: AA6agR6B+jEIHpD5t5DZH3quwJvxKWQ85YfNyChK128SiFlHpxaqCJYHLZdFD75IdFbZVQoovbPEi0L0Rcqx/nTZmAI=
X-Received: by 2002:a25:69c4:0:b0:68d:e2ba:b39d with SMTP id
 e187-20020a2569c4000000b0068de2bab39dmr4063922ybc.196.1660686334991; Tue, 16
 Aug 2022 14:45:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220815063555.1384505-1-pmalani@chromium.org>
 <20220815063555.1384505-5-pmalani@chromium.org> <YvsnE55zGVGxGpPv@google.com>
In-Reply-To: <YvsnE55zGVGxGpPv@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 16 Aug 2022 14:45:24 -0700
Message-ID: <CACeCKacHM7rOCziEXqRW7G24cgTi--vo76NrkCjwauxG4WbXDA@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] platform/chrome: cros_typec_switch: Add event check
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	bleung@chromium.org, Daisuke Nojiri <dnojiri@chromium.org>, 
	"Dustin L. Howett" <dustin@howett.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Guenter Roeck <groeck@chromium.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Lee Jones <lee.jones@linaro.org>, Xiang wangx <wangxiang@cdjrlc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 15, 2022 at 10:11 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> On Mon, Aug 15, 2022 at 06:34:24AM +0000, Prashant Malani wrote:
> > The Chrome EC updates Type-C status events when mux set requests from
>
> To be consistent to the series, I guess you would like to use ChromeOS
> instead of Chrome?

Fixed in v6.

>
> > +static int cros_typec_send_clear_event(struct cros_typec_switch_data *sdata, int port_num,
> > +                                    u32 events_mask)
> > +{
> [...]
> > +     return cros_ec_cmd(sdata->ec, 0, EC_CMD_TYPEC_CONTROL, &req,
> > +                        sizeof(req), NULL, 0);
>
> The line can join to the previous line without exceeding col-100.
Fixed in v6.
