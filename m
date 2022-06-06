Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618BE4C62
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 23:34:38 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id 61-20020a9d0bc3000000b0060b9bfcfe76so11825496oth.9
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jun 2022 16:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=rguJKwRR36lQl5uxZm7mHzCFYZdBsPv0ibNSdNomq/k=;
        b=dXUI/JUv2d8G38kg33SyEWXiYyw2PJJXVOxl1omnLH9Ja27JzXJUX6fxIVIJFIbJaG
         dzF/NOhUNrECly3GluZei2LvRqwnZwcw4HLnbdiWxJ6x+PjHN0h/ebSlOKVaTHKq3qwr
         0lkT9APpstb3GD1fHst78eocrp4yrVMiAz3A4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=rguJKwRR36lQl5uxZm7mHzCFYZdBsPv0ibNSdNomq/k=;
        b=AL+woyCmJ8Wi9YcNTfJgPEOBYBKut3kObifljc8m6m91pNQeVLR9720F8YQ5HCdWJ0
         /IviO8ekLEV/gCpWf51nm8iRAcA0lSwNmkRPUKeynRRdv3KwH0+METvm7KrbTu8C2Pdf
         xpK3C50ZUUMToB8j+vYsPZOa4bd+7TOSAn5qUCmhyT2WuopeeQRxgWMofo9pNwgQppZs
         iv8nRy3L7oTwY+RUgpi4QA970NXx/g6XzwL3H/YTSoyJMIjlowk0pIbx0F+60JjXgEXA
         pdmwBmx7ke2jXhzRiRy+YNie8nl5yK73JhJfuCrzdxY/qtaYjZS9MMAmutADbHsCuxl9
         Tyzw==
X-Gm-Message-State: AOAM533qk+y+SeXbdOI4rtELuXpmDSNwOVA6qii4zFJgL17ZqoP8RGic
	OSfWbIGkrR5ID5yqdUQVr2vDxN00Nx66CnPW8stj3Q==
X-Google-Smtp-Source: ABdhPJzLShdt3/ZtY8VDYrGeT2bzo7GXF1G0CHIwEpTjOmrao6i0lcn628upmloNW7vGMA5dYEStU0exWrOIQCT7qso=
X-Received: by 2002:a05:6830:113:b0:60b:eb0b:4054 with SMTP id
 i19-20020a056830011300b0060beb0b4054mr5867675otp.159.1654558477386; Mon, 06
 Jun 2022 16:34:37 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jun 2022 16:34:36 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220606201825.763788-4-pmalani@chromium.org>
References: <20220606201825.763788-1-pmalani@chromium.org> <20220606201825.763788-4-pmalani@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 6 Jun 2022 16:34:36 -0700
Message-ID: <CAE-0n52GScELw_Bb1HSLnktMLTiw3bjK6A6e4uCNLtqmEx+z_Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] platform/chrome: cros_ec_proto: Update size arg types
To: Prashant Malani <pmalani@chromium.org>, linux-kernel@vger.kernel.org
Cc: bleung@chromium.org, Guenter Roeck <groeck@chromium.org>, 
	Enric Balletbo i Serra <enric.balletbo@collabora.com>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Brian Norris <briannorris@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Quoting Prashant Malani (2022-06-06 13:18:05)
> cros_ec_cmd() takes 2 size arguments. Update them to be of the more
> appropriate type size_t.
>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
> index 816da4eef3e5..85e29300f63d 100644
> --- a/include/linux/platform_data/cros_ec_proto.h
> +++ b/include/linux/platform_data/cros_ec_proto.h
> @@ -232,7 +232,7 @@ bool cros_ec_check_features(struct cros_ec_dev *ec, int feature);
>  int cros_ec_get_sensor_count(struct cros_ec_dev *ec);
>
>  int cros_ec_cmd(struct cros_ec_device *ec_dev, unsigned int version, int command, void *outdata,
> -                   int outsize, void *indata, int insize);
> +                   size_t outsize, void *indata, size_t insize);

We should also mark 'outdata' as const in another patch because it's
being copied out and I assume unmodified by the callee. It's nice to
tell the caller that their data will be sent unmodified.
