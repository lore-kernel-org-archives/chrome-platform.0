Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A277A290B
	for <chrome-platform@lists.linux.dev>; Thu,  5 Jan 2023 18:44:59 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id gh17so92190158ejb.6
        for <chrome-platform@lists.linux.dev>; Thu, 05 Jan 2023 10:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ojaUANg6489F6UhekwXZgoRInAu5mt099cKH9PNdGSE=;
        b=ZlI5Vuj2TBGXPpsGgWMlVWG4ukkh8Jncr3YY+gT6T8/0Ia8rxK390imIHfsK/Gd3qn
         +3rIcWuMxjcCVp0gYX6JnKb8OBnVxfnCaB6tG+wMoNWbZ6Ue3xfy7GBTHagFOSp9aHfH
         0m8bS3J1r9EghcBzNAV3DXtlfuVXZWUkP03Ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojaUANg6489F6UhekwXZgoRInAu5mt099cKH9PNdGSE=;
        b=v3lpHzPXyhVN+PdA0gSG/P2fZOu5KfzqeN94MrnTY4tunK5J+XIdUOYyFjmKDtHnOu
         TBMbrCL/3SQmqsW0cCtFp6VehcoZidprKpZbn7bbpaAF2w2ojelwpikVLWPAgH9A4cyK
         zbdzEefKwPWwK0vqnMNaSQe0yoAb+GbPIN+WVFqsCwkq1vW1b/mQcnnF3i+sU1PYwAoj
         J/Cz6zq3PMs1uCjmH3vFPQFyXRNqsWP2ek6duFeHVp2MFC/BJkVbQ4AoLqVqMNp3evyd
         Fbdlpry1V5KGSquvhup7qQzVYEnErNsZq6IWyKB7kmqcD098hgAYKICI2fiYY/8fj9CC
         cL/A==
X-Gm-Message-State: AFqh2kr7ihujp6n2/OBS2lDUB88LVnlKtZpprqs39dGw+xV+RbFlK6CA
	hzcP0jaqUaiWRSFDwZOO4nhYbr8SzwqAUIZViUyMHQ==
X-Google-Smtp-Source: AMrXdXuZaTwSwLvO6Evn4zHTCe1NYcoZ2XwUQT8vG4f12cSnl//oOaHYwI30X/CqN6x9x7eUZLgaMpZZ+5liuVOyY5s=
X-Received: by 2002:a17:907:2be3:b0:7c0:cd95:bbaf with SMTP id
 gv35-20020a1709072be300b007c0cd95bbafmr4687962ejc.460.1672944297682; Thu, 05
 Jan 2023 10:44:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230104060846.112216-1-pmalani@chromium.org>
In-Reply-To: <20230104060846.112216-1-pmalani@chromium.org>
From: Benson Leung <bleung@chromium.org>
Date: Thu, 5 Jan 2023 10:44:41 -0800
Message-ID: <CANLzEkuV3r6hQeB_e5qHm7eWLF2VftH-U9sbED30wWmu29UEyg@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform/chrome: cros_typec_switch: Use fwnode* prop check
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Prashant,

On Tue, Jan 3, 2023 at 10:09 PM Prashant Malani <pmalani@chromium.org> wrote:
>
> Using device_property_present() multiple times on an ACPI device
> leads to kernel panics on Chromebook systems. This happens when there
> is > 1 boolean property in an ACPI device which is created dynamically
> by the BIOS as part of SSDT[1] on Chromebook systems
>
> Since fwnode_* can handle simple device tree properties equally
> well, switch to using the fwnode_property_present() function
> version. This will avoid panics and make the usage consistent
> when we introduce a check for the 2nd property in a subsequent patch.
>
> [1] https://wiki.osdev.org/SSDT
>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

Thanks,
Benson

> ---
>  drivers/platform/chrome/cros_typec_switch.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
> index a26219e97c93..2536bda03bf3 100644
> --- a/drivers/platform/chrome/cros_typec_switch.c
> +++ b/drivers/platform/chrome/cros_typec_switch.c
> @@ -254,7 +254,7 @@ static int cros_typec_register_switches(struct cros_typec_switch_data *sdata)
>
>                 dev_dbg(dev, "Retimer switch registered for index %llu\n", index);
>
> -               if (!device_property_present(fwnode->dev, "mode-switch"))
> +               if (!fwnode_property_present(fwnode, "mode-switch"))
>                         continue;
>
>                 ret = cros_typec_register_mode_switch(port, fwnode);
> --
> 2.39.0.314.g84b9a713c41-goog
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
