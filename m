Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8AB1876
	for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 21:40:13 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id y129so120816ybe.7
        for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 13:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o1ur1GTp+I4Pn7SDSEx7MaVlA2Sos4YgN3WZC3sQ9gg=;
        b=k5eTW6P/yCKPTemkCQMsqixjAR93t70QYKfhUNbUrVu9H+ZPSPxWCAr4a7jK+9KdYX
         s8jBxS7WUPSTT1Fi01L3loQohcWUfVjjN//UztykFCNA3bcT/8N37nPQsFOjBKJFowYC
         hF1BzIQ80y0GoG0mrwgPf/Ir5jk1439hcLz5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o1ur1GTp+I4Pn7SDSEx7MaVlA2Sos4YgN3WZC3sQ9gg=;
        b=LCJs/XiTxoBqz5eJolwze+9qOeyej5SA+V8FVWUB946U5tr0g/dOUZFPCBPjZqYnXw
         sxJhgVOt6Ze9EJNxD0R5fx+/4ISiCIRDEbHvAqhc42f1GRl6WbuQE1QHZt7CTuj5sTPv
         cnWgxoea8wrOzXzuswgpU5nLOMqbdhoLqOFdQchO0fcfSdPjZM8IF7jqSU3lCl2/8Tzb
         9pYLPMWbrFL6s1K4oo4+CtAT3KajpUkzj4scFLETVC/8/yf9IU3qJYR9Qp8rfdO9Vrw1
         5scvtrI1NqS/QiNXMd6Zf5QpLmldIlksOzRbr65BP5+AQKzm65NX6m5WLn+yvuXo2imv
         QMxQ==
X-Gm-Message-State: AOAM532JrQT+qvN+MhX3P0xsOy622Lv4GQG8bwATafDsoSZto8cf2wim
	dKL9mQgtJevii17Sp3y9BkBNfeI50Pja9V92H1T/OQ==
X-Google-Smtp-Source: ABdhPJyIm9Fpo+rj4zS4q+YEKAZmszqzGlCqvgtn8zd3xvOlTq7iMZba1oN7phKr6EY9WBMIhlsEmDF1cN5Y4zFyqZw=
X-Received: by 2002:a25:cc83:: with SMTP id l125mr855300ybf.375.1644961212193;
 Tue, 15 Feb 2022 13:40:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220209095703.517608-1-tzungbi@google.com> <20220209095703.517608-6-tzungbi@google.com>
In-Reply-To: <20220209095703.517608-6-tzungbi@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 15 Feb 2022 13:40:01 -0800
Message-ID: <CACeCKacS5roroGu2eCP_eQLTGfvuxKvePtP_5fgWt8yzLrpOxg@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] platform/chrome: cros_ec: sort header inclusion alphabetically
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Feb 09 17:57, Tzung-Bi Shih wrote:
> Sort header inclusion alphabetically.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Reviewed-by: Prashant Malani <pmalani@chromium.org>


> ---
> No changes from v2.
>
> Changes from v1:
> (https://lore.kernel.org/lkml/20220125101527.1812887-1-tzungbi@google.com/T/#u)
> - Use imperative mood in commit message.
>
>  drivers/platform/chrome/cros_ec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
> index 618b8b4c42ef..2c4e81f3fef9 100644
> --- a/drivers/platform/chrome/cros_ec.c
> +++ b/drivers/platform/chrome/cros_ec.c
> @@ -9,12 +9,12 @@
>   * battery charging and regulator control, firmware update.
>   */
>
> -#include <linux/of_platform.h>
>  #include <linux/interrupt.h>
> -#include <linux/slab.h>
>  #include <linux/module.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> +#include <linux/slab.h>
>  #include <linux/suspend.h>
>
>  #include "cros_ec.h"
> --
> 2.35.0.263.gb82422642f-goog
>
