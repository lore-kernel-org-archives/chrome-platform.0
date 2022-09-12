Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27A4538D
	for <chrome-platform@lists.linux.dev>; Mon, 12 Sep 2022 21:37:50 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id y17so18168332ejo.6
        for <chrome-platform@lists.linux.dev>; Mon, 12 Sep 2022 14:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=R2eR+zL2wRHc9ncPta4J1bGSX7YZcFCg5pJmVeSKDAk=;
        b=ivNz0GcRtBBjVtRYxqIYlWxIhUEO5TPXYkDNBcBLYvYAsNY8+wDCappA395P46Z+e8
         Z/XcYiHevUhxjLnBOw8pALKfjz6k9HyW6mvFaLcBny17l2C3qyuhfkiFW8SgWSSO+tmp
         XvKXwXHiXRTwXg+DYGsjydVnS5MRkFYi4HNAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=R2eR+zL2wRHc9ncPta4J1bGSX7YZcFCg5pJmVeSKDAk=;
        b=PdA8jEAlYBmnfZCuYP5HzgPbHTjJewdhFLuVXv4CFlOW+56GnVpSvWpDwjGVMpqI8F
         E2M1tFzl2SquIc6KC48AXma5h1XHIttf1jNh3rjGDWhwjotT7PM4fwHmhpk0Uo7FuR58
         CLKPIpZ88C+h5HHuH4GuRNehjR4JE2A1zKncROYxZCt66/EqhexfRwtNjdL7KtQqbXBN
         1WwhzjKIvnMx3DaQLnDSJReZHqiSs1w8Jz761qU1Bcn7Ub4QtKr6amp9hfvVa48vga6W
         o2dkKM4G3j2Th1ncptgbuMEBAWfkm2tt/Slj4FeWsuyVwEjZcj5HVDKE/GD+4bm9vtyf
         Zk9A==
X-Gm-Message-State: ACgBeo1wMFFf9iF0WozAhPRkdjK7j34o6Sg14fiSMGuUAnkZJwwPLAE+
	8KNDW5qQKnp+9xZWRVVcGYGtagIyDe3DwCY+Kyp3YgS5QkFwag==
X-Google-Smtp-Source: AA6agR7Jc96Ysk1hj97djcQcVnDrOPolRaN4o1Oti0xbAQg3oyFEQLmM6+USIjmjrEPxMn+KJ4TkyHRStISn+BHHdrw=
X-Received: by 2002:a17:907:3e12:b0:741:66c4:5658 with SMTP id
 hp18-20020a1709073e1200b0074166c45658mr19754280ejc.486.1663018668683; Mon, 12
 Sep 2022 14:37:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220912213334.2703872-1-jthies@google.com>
In-Reply-To: <20220912213334.2703872-1-jthies@google.com>
From: Benson Leung <bleung@chromium.org>
Date: Mon, 12 Sep 2022 14:37:36 -0700
Message-ID: <CANLzEksE+YVjPGG6Or0_7pE5D9o+DmmDTZ1KZap2QGKSexiJNA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec: Log wake events during resume
To: Jameson Thies <jthies@google.com>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	pmalani@chromium.org, groeck@chromium.org, tzungbi@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jameson,

On Mon, Sep 12, 2022 at 2:34 PM Jameson Thies <jthies@google.com> wrote:
>
> Update cros_ec_report_events_during_suspend to log wake events during
> resume by calling pm_wakeup_event.
>

Minor nit, isn't it more accurate to say that this change "signals" or
"notifies" a wakeup event rather than just log? Log indicates some
print to a logging service, which may happen, but as a side effect of
the actual pm_wakeup_event call, which does something real on its own.

Thanks,
Benson

> Signed-off-by: Jameson Thies <jthies@google.com>
> Reviewed-by: Prashant Malani <pmalani@chromium.org>
> ---
>  drivers/platform/chrome/cros_ec.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
> index 8aace50d446d..110df0fd4b00 100644
> --- a/drivers/platform/chrome/cros_ec.c
> +++ b/drivers/platform/chrome/cros_ec.c
> @@ -349,10 +349,16 @@ EXPORT_SYMBOL(cros_ec_suspend);
>
>  static void cros_ec_report_events_during_suspend(struct cros_ec_device *ec_dev)
>  {
> +       bool wake_event;
> +
>         while (ec_dev->mkbp_event_supported &&
> -              cros_ec_get_next_event(ec_dev, NULL, NULL) > 0)
> +              cros_ec_get_next_event(ec_dev, &wake_event, NULL) > 0) {
>                 blocking_notifier_call_chain(&ec_dev->event_notifier,
>                                              1, ec_dev);
> +
> +               if (wake_event && device_may_wakeup(ec_dev->dev))
> +                       pm_wakeup_event(ec_dev->dev, 0);
> +       }
>  }
>
>  /**
> --
> 2.37.2.789.g6183377224-goog
>
>


-- 
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org
