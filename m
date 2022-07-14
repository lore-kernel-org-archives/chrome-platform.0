Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F145182
	for <chrome-platform@lists.linux.dev>; Thu, 14 Jul 2022 18:34:46 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id 75so4701485ybf.4
        for <chrome-platform@lists.linux.dev>; Thu, 14 Jul 2022 11:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r2vNRfBJ3k/SniyJoasurozlpFDg+J65S7N92c82Jac=;
        b=VhN4BOIaEHeNfY6ol0AG0nEsCkiEG69L+edPbcaovC7tA4jbOtHNJTiojY3rKA0OIM
         tk9ZtM8/2Sn8V/z+EHrIQSyKBP6JBrzSAtzuNK6mwBsW+lyaSJLFEqq4neJR7DUnMvqE
         xHJGYOsD5mZ4SDv/sjWwxhOEOadcwjtXMTIw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r2vNRfBJ3k/SniyJoasurozlpFDg+J65S7N92c82Jac=;
        b=mB4NRPbvFx77LASnxT+b4Cv5ZWUU9hd916MqI5z5leLtWzoDpD6ZeLRchtkPONC4Q/
         tfZaVK9T/pqH2zAXVjdZn6RM9XNU+8oA0WmgPY0TTA9+tYpJq6x4X1Q2e7cRDm3+x59u
         IpeF2KLwsl5tnByClmB+7P/pqvqQiFPgCcHZmujMwz4dJXchc0+t9v7CrNiaTU2Oei9m
         VaRCXqj9fVs/lgO73792wPmOOBR2KEYIw931SM9kXNeeYIpOBLSr7xa8czxUHW9TrqTE
         CgwET8yhNaB7HQ/G8akYbc7ik9vA4GXPlJY/YwsA06FwSbBo6kBTwKk97iikC7zKOgls
         aRPQ==
X-Gm-Message-State: AJIora/jIzLhfilQX44JnfXD+DaY4qAVKaQI8QivNRVIS4cjXbPm121/
	gYqOakMWgLxWbOdKnkBlShxZqb6HiOJMZWNnB7b7Xw==
X-Google-Smtp-Source: AGRyM1vu1mJde4dzHKRV1qdbRPbiWhsA/mhClcjqlNc90eFXQrhPaUM4623lGVAPjXis1neIK3rBQ8d5VtkOTs8aZ1s=
X-Received: by 2002:a25:dc52:0:b0:66e:ef32:6316 with SMTP id
 y79-20020a25dc52000000b0066eef326316mr10542679ybe.197.1657823685134; Thu, 14
 Jul 2022 11:34:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220706205136.v2.1.Ic7a7c81f880ab31533652e0928aa6e687bb268b5@changeid>
In-Reply-To: <20220706205136.v2.1.Ic7a7c81f880ab31533652e0928aa6e687bb268b5@changeid>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 14 Jul 2022 11:34:34 -0700
Message-ID: <CACeCKadV=k5J1ZSG+p8M5iBnX5nXrn-XnK62Nq_op2kJ68+-9w@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: cros_ec: Send host event for prepare/complete
To: Tim Van Patten <timvp@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, rrangel@chromium.org, 
	robbarnes@google.com, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

HI Tim,

On Wed, Jul 6, 2022 at 7:51 PM Tim Van Patten <timvp@google.com> wrote:
>
> Update cros_ec_lpc_pm_ops to call cros_ec_lpc_suspend() during PM
> .prepare() and cros_ec_lpc_resume() during .complete. This allows the
> EC to log entry/exit of AP's suspend/resume more accurately.
>
> Signed-off-by: Tim Van Patten <timvp@google.com>
> ---
>
> Changes in v2:
> - Include cros_ec_resume() return value in dev_info() output.
> - Guard setting .prepare/.complete with #ifdef CONFIG_PM_SLEEP.
>
>  drivers/platform/chrome/cros_ec_lpc.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
> index 7677ab3c0ead9..ce49fbc4ed2e1 100644
> --- a/drivers/platform/chrome/cros_ec_lpc.c
> +++ b/drivers/platform/chrome/cros_ec_lpc.c
> @@ -534,19 +534,27 @@ static int cros_ec_lpc_suspend(struct device *dev)
>  {
>         struct cros_ec_device *ec_dev = dev_get_drvdata(dev);
>
> +       dev_info(dev, "Prepare EC suspend\n");

This patch is doing 2 things:
1. Changing the timing of cros_ec_lpc_suspend()/resume() invocation.
2. Adding print logs for these callbacks.

Whether 2.) is necessary is already being discussed, so I won't
comment on that, but it sounds
like this should be 2 different patches.

Also, please explain what is wrong with "Previously, those events were sent when
suspend/resume were already in progress." IOW, what issue is this
solving, besides
better ordering of EC logs.

BR,

-Prashant
