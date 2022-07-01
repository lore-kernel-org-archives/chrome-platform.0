Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FF13C14
	for <chrome-platform@lists.linux.dev>; Fri,  1 Jul 2022 16:59:07 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id o9so3659272edt.12
        for <chrome-platform@lists.linux.dev>; Fri, 01 Jul 2022 09:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=51XJmeFGSCpeWpGVJIgYYkXCjZO/7dCyc5nbhZQFE9g=;
        b=btYkkxWkV3SrBUcr1GL9Wh70bDS4aKRkmhJ3E5KKhdhPNHMIPrkdfrqNny4F/v7sUv
         h8eTQihiOMQSCK5RJZiKdKZwucl3L7wHe4mnaXW2+RJJokS3tluWSZEmByI9q58LVq6X
         NvyaGbSo7ITsKWPB1d+r9c7i2J0wV/QzVxOP4Igs2R0IwtVfdRrN53peVlmXDHa+cYqF
         hXS7GwyLGNxoWCzJQvFUcjn826DTM+ygAR8IrZ+yN6R1Dgu9doR3+Jg0SZq29FXqxYOl
         iPNUrk79RYIKpS/yJIx3vFZBXdDnOCccHa8oEXeQJlA8feSrF5fbF5r4ytMpaJXEL2EZ
         +Ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=51XJmeFGSCpeWpGVJIgYYkXCjZO/7dCyc5nbhZQFE9g=;
        b=MGfgGcBqiGK2JS6uIamrHsWyxtSoHp59fqwl3cAZ7bsXQYNktpw7c08dsuN9oWtCd9
         oZkAqGDF+QIL8U9AgEOAHcHlmRmTMZ4ApLSwcXZyeqPw5UzV6hTBrcwMFP/zB9nmWQhl
         paw4wssLrjw9/KGLsoiYQ+VQYF29z3wsHsSCimQcX0aGNJf2yFNmRdoI6o5ZXYkuyRlK
         +07pQLmFOjHaBE3s/PmViAEmqzvdaS9nmMA5xq7hD/uZiUdqfjzjdE9aa2HYI2jtVgr8
         ivwoBQJvej95p+pwa6trojcVOgau77uhYgxq6GTFI5yvPHOcZUIvh6DAGKy353lyZ8qI
         RzgQ==
X-Gm-Message-State: AJIora+MMvYkc1OCDzrxKy922fWeMN+MrJWv71zgE/ImUhJYYijb5Pps
	suSO+9uvAWotusr5yeH/qzJPgsN9V7OMZ5gJkjP4ww==
X-Google-Smtp-Source: AGRyM1ukVHnZIKXXd90a1KBf/JucgBk0M9Kzg6bmVGukBHFFeBtewkkuSZM9kshCwi7pvSh2Nrhxy7xirSbm8yURxM0=
X-Received: by 2002:a05:6402:3511:b0:437:7eec:c44c with SMTP id
 b17-20020a056402351100b004377eecc44cmr20456910edd.11.1656694745877; Fri, 01
 Jul 2022 09:59:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220701095421.1.I78ded92e416b55de31975686d34b2058d4761c07@changeid>
In-Reply-To: <20220701095421.1.I78ded92e416b55de31975686d34b2058d4761c07@changeid>
From: Guenter Roeck <groeck@google.com>
Date: Fri, 1 Jul 2022 09:58:54 -0700
Message-ID: <CABXOdTc+2JhmBnxzhpDW4yfZK7-V3H2vx-7QKgH4JBJb84Mveg@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec: Send host event for prepare/complete
To: Tim Van Patten <timvp@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Rob Barnes <robbarnes@google.com>, 
	Raul Rangel <rrangel@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 1, 2022 at 8:54 AM Tim Van Patten <timvp@google.com> wrote:
>
> Update cros_ec_lpc_pm_ops to call cros_ec_lpc_suspend() during PM
> .prepare() and cros_ec_lpc_resume() during .complete. This allows the
> EC to log entry/exit of AP's suspend/resume more accurately.
>
> Signed-off-by: Tim Van Patten <timvp@google.com>
> ---
>
>  drivers/platform/chrome/cros_ec_lpc.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
> index 7677ab3c0ead9..783a0e56bf5f3 100644
> --- a/drivers/platform/chrome/cros_ec_lpc.c
> +++ b/drivers/platform/chrome/cros_ec_lpc.c
> @@ -534,19 +534,24 @@ static int cros_ec_lpc_suspend(struct device *dev)
>  {
>         struct cros_ec_device *ec_dev = dev_get_drvdata(dev);
>
> +       dev_info(dev, "Prepare EC suspend\n");

I don't see why that logging noise is necessary and/or adds value. If
every driver did that, the entire kernel log would be polluted by
similar messages.

> +
>         return cros_ec_suspend(ec_dev);
>  }
>
> -static int cros_ec_lpc_resume(struct device *dev)
> +static void cros_ec_lpc_resume(struct device *dev)
>  {
>         struct cros_ec_device *ec_dev = dev_get_drvdata(dev);
>
> -       return cros_ec_resume(ec_dev);
> +       cros_ec_resume(ec_dev);
> +
> +       dev_info(dev, "EC resume completed\n");

Same here.

Guenter

>  }
>  #endif
>
>  static const struct dev_pm_ops cros_ec_lpc_pm_ops = {
> -       SET_LATE_SYSTEM_SLEEP_PM_OPS(cros_ec_lpc_suspend, cros_ec_lpc_resume)
> +       .prepare = cros_ec_lpc_suspend,
> +       .complete = cros_ec_lpc_resume
>  };
>
>  static struct platform_driver cros_ec_lpc_driver = {
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>
