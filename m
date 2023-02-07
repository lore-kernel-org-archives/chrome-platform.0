Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF52566B
	for <chrome-platform@lists.linux.dev>; Tue,  7 Feb 2023 16:16:14 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id a24so16814656vsl.2
        for <chrome-platform@lists.linux.dev>; Tue, 07 Feb 2023 08:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ECI+PzCj+E54+WpHWzgMmg74ln8b0Tr68JRWC1+n9Sc=;
        b=Z/ylueHNUjN0c3ItPm/Efhz3UI9FvbJA+ZUKR1ljVfSwG1SdBn8GUzRooA2+bqzRxR
         2Do2i4/SxXrs3kO+3Ze385oOxvhIwS5Wur7TACNlSkQxef/WQjFxDfmsNf9TVe94YPom
         +MYOfaDyCA1SQWTQk8PELkWSTRvCSzOhX6gIrGT/Cf3gQQHs2W+FLaeJjB/ZDwQ2qHIr
         cBWdYMacY93jyftnAkPIADK2aMxnDUZO7KEfMJiNGEWdRcs1t2oUPad+blfHtJ3j7ENx
         wLv+vIOdF83MEEOJ0zwtXLlOt8ITSutINfUuQRW8t5ByiArXhzH6ZS9fQAIxByVz2nl4
         Ti5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ECI+PzCj+E54+WpHWzgMmg74ln8b0Tr68JRWC1+n9Sc=;
        b=Ss/79UpMZvfyQ1XLxejuYNTBHdze9uflZ84KmU0+8ifN436/ZTxOyEPU9gKUdKTkek
         rNHnM7LV4fZoLY2mb9H7VKCZueOclRZGFFsmjMpWry2Xw3Y3ImECAaB36LnoRR+XveRX
         1VtMUwCFS/MupImdHsVVxmx2g9HYYd/oqOGMRrKjPXjOLvc+LVLflPa7czZfDzuqoYxb
         R0wQbUEVwXUzET5rUmn3B1SdOvIgOl51eJteUYVrgu9PEpNzRwVBl/EDTKqapvHIUaXK
         LyUWZ7QIPKu9C6H2Kh8y/k3JMsUE6Zx7KrYAajFK/uFRZ8fTwChNbQJ0gtGpjPuH4P/G
         eYuQ==
X-Gm-Message-State: AO0yUKVFrhsGb3Kfxb+yIRsWme7LX3Zqc8ISHEZ3U682xTxzO64PTYBR
	/AoFPzR1pL4kCm/qllYVqoVOAW+juUhr0oixpEI+4g==
X-Google-Smtp-Source: AK7set9bAX5I5Ps+szZERO0BYb7ipUxT01xY2LVEv7SjrSspE1s9Id4U/RpR/vT2uE+hL55jZuATpYmAQJK5c8AqcuU=
X-Received: by 2002:a67:d98a:0:b0:3ea:3ea0:8956 with SMTP id
 u10-20020a67d98a000000b003ea3ea08956mr757219vsj.5.1675786573226; Tue, 07 Feb
 2023 08:16:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230207081130.1.I657776750156793721efa247ce6293445137bc8a@changeid>
In-Reply-To: <20230207081130.1.I657776750156793721efa247ce6293445137bc8a@changeid>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 7 Feb 2023 08:16:01 -0800
Message-ID: <CABXOdTfDk4JXCk-3OS77S7o0kn-4O276aLeWWrQJaiSMnOUcOg@mail.gmail.com>
Subject: Re: [PATCH] firmware: coreboot: Remove GOOGLE_COREBOOT_TABLE_ACPI/OF
 Kconfig entries
To: Douglas Anderson <dianders@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Julius Werner <jwerner@chromium.org>, David Gow <davidgow@google.com>, 
	Jack Rosenthal <jrosenth@chromium.org>, chrome-platform@lists.linux.dev, 
	Stephen Boyd <swboyd@chromium.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 7, 2023 at 8:12 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> Ever since commit a28aad66da8b ("firmware: coreboot: Collapse platform
> drivers into bus core") the Kconfig entries GOOGLE_COREBOOT_TABLE_OF
> and GOOGLE_COREBOOT_TABLE_ACPI have been dead. They have no "help"
> text and thus aren't user choosable. They also aren't "select"ed by
> anything. They also control the compilation of no code.
>
> Let's remove them.
>
> Fixes: a28aad66da8b ("firmware: coreboot: Collapse platform drivers into bus core")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>
>  drivers/firmware/google/Kconfig | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/firmware/google/Kconfig b/drivers/firmware/google/Kconfig
> index 9f190eab43ed..1bc7cbf2f65d 100644
> --- a/drivers/firmware/google/Kconfig
> +++ b/drivers/firmware/google/Kconfig
> @@ -44,14 +44,6 @@ config GOOGLE_COREBOOT_TABLE
>           device tree node /firmware/coreboot.
>           If unsure say N.
>
> -config GOOGLE_COREBOOT_TABLE_ACPI
> -       tristate
> -       select GOOGLE_COREBOOT_TABLE
> -
> -config GOOGLE_COREBOOT_TABLE_OF
> -       tristate
> -       select GOOGLE_COREBOOT_TABLE
> -
>  config GOOGLE_MEMCONSOLE
>         tristate
>         depends on GOOGLE_MEMCONSOLE_X86_LEGACY || GOOGLE_MEMCONSOLE_COREBOOT
> --
> 2.39.1.519.gcb327c4b5f-goog
>
