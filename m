Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731F54C85
	for <chrome-platform@lists.linux.dev>; Tue, 13 Sep 2022 18:29:05 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id y3so29586325ejc.1
        for <chrome-platform@lists.linux.dev>; Tue, 13 Sep 2022 11:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=5mHZ5ROhl2xtNeHNSULnEJ0gJ4kTfFmkLYuGrarU5rA=;
        b=i3HOGXCvTpvPOHn1H8Lzjo7VBm1nTBxu4nFJrI6Ry6CZW7KR/BTxrtwzlYJpTnL5Tt
         C6SXwUVjrF1JCQj0rytXR4POr0Le1lZ7cZFHKtbjGcMbC8/bgI+xvJDzaJXOf4Bzkn44
         d7DDMdwE3l0gG+82A+XDawz0oYY6ndayYtlzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=5mHZ5ROhl2xtNeHNSULnEJ0gJ4kTfFmkLYuGrarU5rA=;
        b=Fd6iBPmqMTyVphfhfStRPcanKZ6m7ZWyx8IGf9eatmjSYnAfRfFOKRwkaNR9SxSaEF
         hqgld7mDv8p3sd1UnmiqI94KbDRkIGE0H6o7vUSCoJW2ZdW2Bzl1IpfI5BoQkoS1UZzC
         wGRSkMUw1m7tTkn/bm+hLupORSKlS4LJObjLcdt7r3lkvCqcx0x2U7E9h3d5LJ1l6DWq
         hy+phHBKRJ8LOIdAtdRFnxn9egrZivoNB05va99wg6vxdngP9Y3bEW5e6Ja2gac8xEh9
         ILXljzp4QWz3uDqj2/NQ7FOjFRd4qGEWsMaXoQkhNZx6C1DtkSTPn9RwbGvI6F3+S5w3
         vtLw==
X-Gm-Message-State: ACgBeo27d17IwbctcVu7+IrnFylbmiNn7WARjBAFpAGofflAfjzES4JA
	YJ7jvc/v3YBz660ZR4lbvkYY7v3J7RY0yq++3+0LgnHOG8YTJJXA
X-Google-Smtp-Source: AA6agR7n+op1y5u3TFdVTIQJkvJeuzLzHoCCgaKzSWbbkyYoWVT3NsxKtPq3sWIligkAmRpGbKU4iIX5dhoSko+uN1U=
X-Received: by 2002:a17:907:84a:b0:733:735:2b1a with SMTP id
 ww10-20020a170907084a00b0073307352b1amr22752861ejb.290.1663093743437; Tue, 13
 Sep 2022 11:29:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220913145549.2839948-1-jthies@google.com>
In-Reply-To: <20220913145549.2839948-1-jthies@google.com>
From: Benson Leung <bleung@chromium.org>
Date: Tue, 13 Sep 2022 11:28:51 -0700
Message-ID: <CANLzEksnE3tNLHd4N0B3msJpJ-MQCgRSTYqts8w1SOW8PRpwDg@mail.gmail.com>
Subject: Re: [PATCH v3] platform/chrome: cros_ec: Notify the PM of wake events
 during resume
To: Jameson Thies <jthies@google.com>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	pmalani@chromium.org, groeck@chromium.org, tzungbi@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jameson,

On Tue, Sep 13, 2022 at 7:55 AM Jameson Thies <jthies@google.com> wrote:
>
> cros_ec_handle_event in the cros_ec driver can notify the PM of wake
> events. When a device is suspended, cros_ec_handle_event will not check
> MKBP events. Instead, received MKBP events are checked during resume by
> cros_ec_report_events_during_suspend. But
> cros_ec_report_events_during_suspend cannot notify the PM if received
> events are wake events, causing wake events to not be reported if
> received while the device is suspended.
>
> Update cros_ec_report_events_during_suspend to notify the PM of wake
> events during resume by calling pm_wakeup_event.
>
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>
> Changes since v1:
> - Updated wording in commit message from "Log" to "Notify PM of".
>
> Changes since v2:
> - Removed Reviewed-by tag and provided more context for the update in
>   the commit message.
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


-- 
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org
