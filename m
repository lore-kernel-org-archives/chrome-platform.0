Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E414683
	for <chrome-platform@lists.linux.dev>; Thu, 18 Aug 2022 17:24:34 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-33365a01f29so59720647b3.2
        for <chrome-platform@lists.linux.dev>; Thu, 18 Aug 2022 10:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=WmBqeJ78050aXLKgOwLTPwBE6TsmJMEDRuI6qelXVno=;
        b=CBVHuUfuyWcCZNBWBq/+y/JHPvetpvzju+JjhM+v3zR68gaL+f+jaybMfNWIJo0ukv
         MteuvRIcYU28PD6BBoRIRYfAQscIw8740RBblr8y+jf7nKJA5OQ8kd6qCkXrLw0QbMk9
         q0hrBTX4MDTnVEVeCDrwR7JxRflSQdwzZzb9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=WmBqeJ78050aXLKgOwLTPwBE6TsmJMEDRuI6qelXVno=;
        b=jYFJWz9W2yua65oerAaOIxP33IAFPmQKE2sPNiKDGqhWzYUgLKA6QKkDcrqtdj9xoK
         rETJohm/M3wc4fZzwo4lS5MzXbY/VkzV+6XuPWeGpjCiNqHilBfVfrSx5pGkMfBqJ0lV
         FkAj2z7FkrOQSf11Fl9m/17y31d7WKWnFLt1F4Q29LbHyxdaQG4b6Iik6IGipPl9hn6D
         s60pi2XYZsa2SqrEMKirgIQep+X9ynKkNRXaFp0LyXNvZ3CXCD+mIwfpFAxi1lhEqjwi
         930r7lgTrlHP6JqE0k93no8l3yFW3094+YDQM/8B2LeIA/gQSUUbCAPmjFAjMgbuvCkQ
         DCRA==
X-Gm-Message-State: ACgBeo0NHjLCs6rvZsYqRov90eogGYBp3GZq/qaRP2yL8FPZx+GoZmIe
	yViLkFs7JgNsX8qsHOuFvrvclhmfd40GiIUcAVcZmQ==
X-Google-Smtp-Source: AA6agR5zeO11pwMCpjpTangMySpcd64Fk35oD7bSXulfN4WOV9pLCmRT0KLruTqnSsflSM25W8GDYbKDstNQ5osbyq0=
X-Received: by 2002:a25:4ce:0:b0:67c:3362:c396 with SMTP id
 197-20020a2504ce000000b0067c3362c396mr3963221ybe.336.1660843473754; Thu, 18
 Aug 2022 10:24:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220818082827.v2.1.Idd188ff3f9caddebc17ac357a13005f93333c21f@changeid>
In-Reply-To: <20220818082827.v2.1.Idd188ff3f9caddebc17ac357a13005f93333c21f@changeid>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 18 Aug 2022 10:24:23 -0700
Message-ID: <CACeCKafyHSTiyyjA=yjSXsTub4kKECfe9gp=y10LCYYx0nGKqg@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: cros_ec: Expose suspend_timeout_ms in debugfs
To: Evan Green <evgreen@chromium.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Rajat Jain <rajatja@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Lee Jones <lee.jones@linaro.org>, 
	Tinghan Shen <tinghan.shen@mediatek.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 18, 2022 at 8:29 AM Evan Green <evgreen@chromium.org> wrote:
>
> In modern Chromebooks, the embedded controller has a mechanism where
> it will watch a hardware-controlled line that toggles in suspend, and
> wake the system up if an expected sleep transition didn't occur. This
> can be very useful for detecting power management issues where the
> system appears to suspend, but doesn't actually reach its lowest
> expected power states.
>
> Sometimes it's useful in debug and test scenarios to be able to control
> the duration of that timeout, or even disable the EC timeout mechanism
> altogether. Add a debugfs control to set the timeout to values other
> than the EC-defined default, for more convenient debug and
> development iteration.
>
> Signed-off-by: Evan Green <evgreen@chromium.org>
(One minor nit aside) FWIW:
Reviewed-by: Prashant Malani <pmalani@chromium.org>

> ---
>
> Changes in v2:
>  - Update release version to 6.1 (Tzung-Bi)
>  - Reference EC_HOST_SLEEP_TIMEOUT_INFINITE (Tzung-Bi)
>  - Name the debugfs file suspend_timeout_ms (Prashant)
>
>  Documentation/ABI/testing/debugfs-cros-ec   | 22 +++++++++++++++++++++
>  drivers/platform/chrome/cros_ec.c           |  3 ++-
>  drivers/platform/chrome/cros_ec_debugfs.c   |  3 +++
>  include/linux/platform_data/cros_ec_proto.h |  1 +
>  4 files changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/testing/debugfs-cros-ec b/Documentation/ABI/testing/debugfs-cros-ec
> index 1fe0add99a2a99..9f79c641b2d09f 100644
> --- a/Documentation/ABI/testing/debugfs-cros-ec
> +++ b/Documentation/ABI/testing/debugfs-cros-ec
> @@ -54,3 +54,25 @@ Description:
>                 this feature.
>
>                 Output will be in the format: "0x%08x\n".
> +
> +What:          /sys/kernel/debug/<cros-ec-device>/suspend_timeout_ms
> +Date:          August 2022
> +KernelVersion: 6.1
> +Description:
> +               Some ECs have a feature where they will track transitions to the
> +               a hardware-controlled sleep line, such as Intel's SLP_S0 line,
> +               in order to detect cases where a system failed to go into deep
> +               sleep states. The suspend_timeout file controls the amount of
s/suspend_timeout/suspend_timeout_ms
