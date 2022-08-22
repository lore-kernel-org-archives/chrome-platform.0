Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71164C6C
	for <chrome-platform@lists.linux.dev>; Mon, 22 Aug 2022 22:58:14 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id d18-20020a9d72d2000000b0063934f06268so1954282otk.0
        for <chrome-platform@lists.linux.dev>; Mon, 22 Aug 2022 15:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc;
        bh=ZQcp0BRRM98lOS/g0KHNAVFcxGrlDNSNcE9n5lyzj74=;
        b=AY3JnAa0u0PCO/OLlstQQme7k5X4CjbQb4LyJxjNuFarcLkWEhPvAXKaWwxdF/n/OH
         iOWPoBasc1WzdUznFH6n2/15y79SvpqRUs0C8WiWV0Y2mCrAlDiW/QDBO8aF/9+2SlKy
         2vJbVtOSadV9XPeuJo7UM/nLUp5U3v1XsXecE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
        bh=ZQcp0BRRM98lOS/g0KHNAVFcxGrlDNSNcE9n5lyzj74=;
        b=SEyEMGzZXbj5imDbXEutvokoLFiTs51Z7Ycen2wIsiqtGg/r7ocqNvXk2h565ZlRK+
         VWW1zSG/G+HfuOhA1s7YRCZTXsCAhSi3NtNBKNqJJRuKEgNroHqcslBitGdNlMCdva31
         Dc4RbYgVGG4AYPfKLYOpl4cwVW97205mU7akNQUFpDVwQp619mCLdfrsWihOCwUjfmnZ
         qHfGFrzrzNJt5thsB6kLIAz6JJVspdkzq/SCMttrhszpnDVnxcHDJ0mHqQU1CBaWYDuu
         eeMH8IfjekuY1sjuxInTQjvcacE5Zouw5M4s7HlY63ga5+3CgfKzLvCKXiXucltlahIs
         ARMw==
X-Gm-Message-State: ACgBeo1tJ5+Hi6SiBU+NSbhkjI7YXg3ki8Eh9/qcBIvuWoMCStBRGgk3
	k3Cr32VFZ7FuaZCa2+filh8UNWTymaFCq37XdiUS6g==
X-Google-Smtp-Source: AA6agR7P8++dkGVe69xdBJY4hZiKYOYJmykx57SIKThzQUVxO3vkQz9gif5F2unmCzp5cRjkm17S5wP/RnwarP3zDwY=
X-Received: by 2002:a9d:738c:0:b0:638:9962:8cb6 with SMTP id
 j12-20020a9d738c000000b0063899628cb6mr8354707otk.73.1661209093673; Mon, 22
 Aug 2022 15:58:13 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Aug 2022 17:58:13 -0500
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220822144026.v3.1.Idd188ff3f9caddebc17ac357a13005f93333c21f@changeid>
References: <20220822144026.v3.1.Idd188ff3f9caddebc17ac357a13005f93333c21f@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 22 Aug 2022 17:58:13 -0500
Message-ID: <CAE-0n53udqQiEjBnB9oO+fuBUbWEvE1NZXBCsBW7qPCTYzK3_A@mail.gmail.com>
Subject: Re: [PATCH v3] platform/chrome: cros_ec: Expose suspend_timeout_ms in debugfs
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Evan Green <evgreen@chromium.org>
Cc: Rajat Jain <rajatja@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Tinghan Shen <tinghan.shen@mediatek.com>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Evan Green (2022-08-22 14:40:40)
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
> Reviewed-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

One nit below

> diff --git a/Documentation/ABI/testing/debugfs-cros-ec b/Documentation/ABI/testing/debugfs-cros-ec
> index 1fe0add99a2a99..66fe915acd739b 100644
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

s/to the/of/

> +               a hardware-controlled sleep line, such as Intel's SLP_S0 line,
> +               in order to detect cases where a system failed to go into deep
