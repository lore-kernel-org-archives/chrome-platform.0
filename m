Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8417C1B54A
	for <chrome-platform@lists.linux.dev>; Fri, 11 Nov 2022 23:24:20 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id m18so2462965vka.10
        for <chrome-platform@lists.linux.dev>; Fri, 11 Nov 2022 15:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R0k27JYvEYUqXaeQVspvGGVqqBujev8+Mi45jTmwqQc=;
        b=GCMp/0g+b5vkP0vDg7ceN3zhH6JtqTUMLeoWbaBxaYO98xQy+4H2pxyHo/4MDyr/0x
         7LL8PzxceBHRVCRNFNHs5/+EMxLnfpeMIhgMcuIKkmG+xD32hywFFGykCSfG+iKGZZHk
         QR3v0KJF0IRiV/q6onxm1eJVRSa9Bbeb6NUx/1KCUPI5xRtxXB8TtTPQDatHyCiTuw45
         4BMNG8UMUtZHRSfh9g2OHq2mWleCQemkhb006o47iSAkF/TNncv+DbQKqgx7/CMu/YAQ
         n27sKdSilsXbNPQ/scXEssocN8a43rw9YrNMxodXXmiIseQEjvsEBVElAnkaAsT1GZl2
         NVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0k27JYvEYUqXaeQVspvGGVqqBujev8+Mi45jTmwqQc=;
        b=LT17ddJbtmn/aisZ4/om/NAVuIhYtORxBHOKXzrhPyvDKtNXSC5kE4bKB/rIQGLVyD
         gEnqRtgYadn8K8aQzAg5hHj3kxnqzYHluBImPs+5x5dsmg+cRAwXU0sZzZb4q7kd7RjF
         dQlcZLL55i40MNufk6GCyG4OuIiZcB3dy1Gh2QR9pDpyMk74zl92IJzh+S4glClesZDt
         ildUouN5kdSYg0UAh5vczqMI/kbLWd06+gIJypuQZ7Heq0lHkUCwwOuwIbw1eGCMrur2
         7DS3+A39HsSJn6x9TOXKHPNTHQwB9lS9pNEVBOyQr5M1ZOnuPNBFB4cfnUu3lu0H6T7T
         Ps9g==
X-Gm-Message-State: ANoB5pkW8wHPo5eJWrCOXTSn2Z8HCNtz+FRa4ZkdQS6SkdaBcZphcAZA
	zn5mVZqTYFh/Z9HODlNL/7eQR58lmiD+aXd2B1Ie9g==
X-Google-Smtp-Source: AA0mqf5CeRO/IBYvQ29CZknzZgbQkb4E7DDpv97ncsDk/AqWygzWceJF/cMuZet2yCgaDQsrt1Z8pIY0bc7DXmSTGFU=
X-Received: by 2002:a05:6122:12b2:b0:3b5:e89c:9351 with SMTP id
 j18-20020a05612212b200b003b5e89c9351mr2313158vkp.25.1668209059275; Fri, 11
 Nov 2022 15:24:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221111231302.3458191-1-briannorris@chromium.org>
In-Reply-To: <20221111231302.3458191-1-briannorris@chromium.org>
From: Guenter Roeck <groeck@google.com>
Date: Fri, 11 Nov 2022 15:24:08 -0800
Message-ID: <CABXOdTfFbKRvyzcqFbYKX2Lagdm54=GEMEErBa9f-ODPwfMYHw@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: Force synchronous probe
To: Brian Norris <briannorris@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Stephen Boyd <swboyd@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 11, 2022 at 3:13 PM Brian Norris <briannorris@chromium.org> wrote:
>
> This reverts commit bd88b965ae8c ("platform/chrome: cros_ec_lpc: Mark
> PROBE_PREFER_ASYNCHRONOUS"), and then some.
>
> It has been reported that there are issues with 'cros-ec-keyb' devices
> that are children of this. As noted in the initial patch for its ACPI
> support (commit ba0f32141bc5 ("Input: cros_ec_keyb - handle x86
> detachable/convertible Chromebooks")), it's possible to probe an ACPI
> child device before its parent is probed -- hence the need for
> EPROBE_DEFER. Unfortunately, poking your parent's dev_get_drvdata()
> isn't safe with asynchronous probe, as there's no locking, and the
> ordering is all wrong anyway (drvdata is set before the device is
> *really* ready).
>
> Because this parent/child relationship has known issues, let's go the
> other direction and force synchronous probe, until we resolve the
> issues.
>
> Possible solutions involve adding device links, so we ensure the child
> doesn't probe before the parent is done; or perhaps some other larger
> refactoring (auxiliary bus?). But that might take a little more effort
> and review, as there are many other potential sub-devices of
> cros_ec_lpc that could need patching.
>
> Note that we don't have the same problem for non-ACPI cros-ec hosts,
> like cros-ec-spi (commit 015e4b05c377 ("platform/chrome: cros_ec_spi:
> Set PROBE_PREFER_ASYNCHRONOUS")), because its sub-devices aren't created
> until cros_ec_register(), or they don't exist at all (e.g., FPMCU uses).
>
> Fixes: bd88b965ae8c ("platform/chrome: cros_ec_lpc: Mark PROBE_PREFER_ASYNCHRONOUS")
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Trying again, this time in plain text mode. Sorry for the noise.

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>
>  drivers/platform/chrome/cros_ec_lpc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
> index 2e4dba724ada..7fc8f82280ac 100644
> --- a/drivers/platform/chrome/cros_ec_lpc.c
> +++ b/drivers/platform/chrome/cros_ec_lpc.c
> @@ -557,7 +557,12 @@ static struct platform_driver cros_ec_lpc_driver = {
>                 .name = DRV_NAME,
>                 .acpi_match_table = cros_ec_lpc_acpi_device_ids,
>                 .pm = &cros_ec_lpc_pm_ops,
> -               .probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +               /*
> +                * ACPI child devices may probe before us, and they racily
> +                * check our drvdata pointer. Force synchronous probe until
> +                * those races are resolved.
> +                */
> +               .probe_type = PROBE_FORCE_SYNCHRONOUS,
>         },
>         .probe = cros_ec_lpc_probe,
>         .remove = cros_ec_lpc_remove,
> --
> 2.38.1.431.g37b22c650d-goog
>
