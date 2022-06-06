Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79B228E6
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jun 2022 15:08:25 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id o10so19230077edi.1
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jun 2022 08:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ltHPrw2tHLSsWTo0k+1u7PmQZYz53U2tfsTdR1emhZ0=;
        b=PYEYK2LGgrS7dGWMjTgfH3vO0P5+3jFY6Mlx/DEzEnHnZ/iuQlEDObwfakoTUpcibu
         vd6qIuEO/VgUaJvfxY+N8/+tuE13SQ2vM7vUQFC1N3bcF/rqPNCH99NJMe6gMjqEBbmS
         U/Aps48dyjFzYs+skXBeTztDiogn7gM7CXeEhYKaaABaVYheqZ/k/KGYmtS9W4D4fUP4
         b+Eo2wVHQhpBOfd5cZaKED+Qgoht8BZ9pC44phjlnS5AYAa7MYtbHxmIJl4xccSJW/34
         y4Hr+e19KuGjJS0Act9mlY8CCkr7x5BzaZTLIHGIG4JlcLKvFLfFm1ZJqasHg/XJpraq
         fpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ltHPrw2tHLSsWTo0k+1u7PmQZYz53U2tfsTdR1emhZ0=;
        b=72N66z3I+q0BhI1XKEsibfoPNYCv90TsBLP3mtae3qrjqLswELELqxFPCJNW9fdiXM
         EThH63leoPCV9qQjs2514r61rI09Rvdbt+OChAPHhNWIFU8JREasoMWRB7r+Lg3bG3Ho
         hoSLHgRK0EteSlt6phQQWmatZmNC9x8CAsICRAGwsZ2C1ak4lx9tMD+ihMW5O+KOeGbX
         LCoD9X5N2dJwHpTkJZMcy87p8190memc8RiqK+CscN3Te7AYBydnSYGu7WidwhvSyGTb
         ua6aWCt3RyUBZlIns0s4DHGikKwbeL7t1ei/NVbGEIsor+ayi7GqayJtsyBQ2sRzwkN8
         URQw==
X-Gm-Message-State: AOAM532ycMfXw/nNq5F/OgK1IMvuMGkiaZKYPuazjQa4dMVa46G2PCfF
	5QZwoTOAV2aZh5Z5rsP4ZJMHQBJR0d/0nGfXd9B3cg==
X-Google-Smtp-Source: ABdhPJzf5OF/qpPmN7iuEmA7zH5tfCW6VdJVV9OhP5EaSKcTkm9P7d8+GPRtwRVd09FJhu/nPZhR9vJPqPpx0pJyBLo=
X-Received: by 2002:a05:6402:2687:b0:430:328f:e46b with SMTP id
 w7-20020a056402268700b00430328fe46bmr15075923edd.33.1654528103838; Mon, 06
 Jun 2022 08:08:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220606141051.285823-1-tzungbi@kernel.org> <20220606141051.285823-2-tzungbi@kernel.org>
In-Reply-To: <20220606141051.285823-2-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 6 Jun 2022 08:08:12 -0700
Message-ID: <CABXOdTdiBBf4Q+_Tv_BLSQtZ=1_2E2iHinnvpmeoUeRUU5W-jQ@mail.gmail.com>
Subject: Re: [PATCH 01/13] platform/chrome: cros_ec_commands: fix compile errors
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 6, 2022 at 7:12 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> Fix compile errors when including cros_ec_commands.h solely.
>
> 1.
> cros_ec_commands.h:587:9: error: unknown type name 'uint8_t'
>   587 |         uint8_t flags;
>       |         ^~~~~~~
>
> 2.
> cros_ec_commands.h:1105:43: error: implicit declaration of function 'BIT'
>  1105 |         EC_COMMS_STATUS_PROCESSING      = BIT(0),
>       |                                           ^~~
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  include/linux/platform_data/cros_ec_commands.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
> index 8cfa8cfca77e..a5b749a85707 100644
> --- a/include/linux/platform_data/cros_ec_commands.h
> +++ b/include/linux/platform_data/cros_ec_commands.h
> @@ -13,8 +13,8 @@
>  #ifndef __CROS_EC_COMMANDS_H
>  #define __CROS_EC_COMMANDS_H
>
> -
> -
> +#include <linux/bits.h>
> +#include <linux/types.h>
>
>  #define BUILD_ASSERT(_cond)
>
> --
> 2.36.1.255.ge46751e96f-goog
>
