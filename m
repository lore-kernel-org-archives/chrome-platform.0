Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5164A2B
	for <chrome-platform@lists.linux.dev>; Wed, 31 Aug 2022 18:01:07 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-11eab59db71so22048572fac.11
        for <chrome-platform@lists.linux.dev>; Wed, 31 Aug 2022 11:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=T6Du1Lo5xImAO249U1dETl4IIbiFdjm8Fx7yNl0ICjY=;
        b=MbYKgq9YQ6Cmkjnxo/SEbnM4RZKXJbf89tkfIphzPRlEB3rBPLNslG/zc7Fa5N37Fc
         lhVNZA4SRNJ06uCP16o+JMRPLBbB7LZLhUmAhdDCGlpymbSMzCwQst5srlXLX+H8VtkA
         XUAFrNIQJJI0kOzoWw7DNXGkMWcZoWg9//pcSu8QypDj4UjYgibbK79Z1QjY7pjyvltg
         qxcihlzG1LpIR9Gb3RuZ69YrMRSOUl1bmFd7L9fhg8jqKoigPuvkaAZ1hWbqemGqF+VR
         hXqzIImXiW+0FabsOWFDktXerKkrjF17lUaPV1+xNvHCDpkytsZXVVlzzaRlQ8JfF3zN
         k+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=T6Du1Lo5xImAO249U1dETl4IIbiFdjm8Fx7yNl0ICjY=;
        b=2/cp4hm+LeB+ZbgKy7jX6xLXu9deoXsFdZRCuRsveVL1alAdxIdAg+VjIGngJPa1Mh
         xOUbaHCdr479ZqjYJA/i743tdrQNwUCjE+vesN5817RRG13dhuRkzn67GTS5i3Ps+WoF
         vzuCmrNfgHMvLtYFpf2sQYtywqHiSsDUKp33HhNgSl+K+dwL7YTZlyVq4QDtdKGE6m+5
         9lde5NnEuC3EtNOKve77e3mYrVK3mIk+NDlC8IURt4PUgBBUSj5oc/Dmy8D+BBEiuPhE
         /n/hVFCeREEjhzU8ISuygSaTbyi3T6mL0DLbta8c4tvDrnwnDJ+kqkL62pEuVLoW7ru9
         JCnQ==
X-Gm-Message-State: ACgBeo2M1WrEMk+dc6pawJTNWkakuLC8tl7mc1De2cYAdJWBihalUuOr
	21J39PAZ3apjIxL/u6/iyUKN+OgGysYRHEhx6okeHA==
X-Google-Smtp-Source: AA6agR4nuWTt+l/HHXALlIvuHu0a36M8RihXtAB0CgHufnQWYfzsfDJoK3Av9fP0SMKZV1RXp2U8YrypIgn6ZCwEbcY=
X-Received: by 2002:a05:6808:1641:b0:345:4f32:b30a with SMTP id
 az1-20020a056808164100b003454f32b30amr1800917oib.189.1661968866436; Wed, 31
 Aug 2022 11:01:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220823095915.v7.1.I55189adfdb8d025fc991a0fa820ec09078619b15@changeid>
In-Reply-To: <20220823095915.v7.1.I55189adfdb8d025fc991a0fa820ec09078619b15@changeid>
From: Tim Van Patten <timvp@google.com>
Date: Wed, 31 Aug 2022 12:00:55 -0600
Message-ID: <CANkg5ezTvzSFLkRWbhMDUqezQXW6996DYVohWMUa+cYwSB+YBw@mail.gmail.com>
Subject: Re: [PATCH v7] platform/chrome: cros_ec_lpc: Move host command to prepare/complete
To: rrangel@chromium.org, robbarnes@google.com
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Tzung-Bi Shih <tzungbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

Friendly ping on this patch.


On Tue, Aug 23, 2022 at 9:59 AM Tim Van Patten <timvp@google.com> wrote:
>
> Update cros_ec_lpc_pm_ops to call cros_ec_lpc_prepare() during PM
> .prepare() and cros_ec_lpc_complete() during .complete(). This moves the
> host command that the AP sends and allows the EC to log entry/exit of
> AP's suspend/resume more accurately.
>
> Signed-off-by: Tim Van Patten <timvp@google.com>
> ---
>
> Changes in v7:
> - Rename "host event" to "host command" in title/description.
>
> Changes in v6:
> - Fully restore fixes from v3.
>
> Changes in v5:
> - Restore fixes from v3.
>
> Changes in v4:
> - Update title and description.
>
> Changes in v3:
> - Update cros_ec_lpc_suspend() to cros_ec_lpc_prepare()
> - Update cros_ec_lpc_resume() to cros_ec_lpc_complete()
>
> Changes in v2:
> - Include cros_ec_resume() return value in dev_info() output.
> - Guard setting .prepare/.complete with #ifdef CONFIG_PM_SLEEP.
>
>  drivers/platform/chrome/cros_ec_lpc.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
> index 7677ab3c0ead..4158bdeee197 100644
> --- a/drivers/platform/chrome/cros_ec_lpc.c
> +++ b/drivers/platform/chrome/cros_ec_lpc.c
> @@ -530,23 +530,31 @@ static const struct dmi_system_id cros_ec_lpc_dmi_table[] __initconst = {
>  MODULE_DEVICE_TABLE(dmi, cros_ec_lpc_dmi_table);
>
>  #ifdef CONFIG_PM_SLEEP
> -static int cros_ec_lpc_suspend(struct device *dev)
> +static int cros_ec_lpc_prepare(struct device *dev)
>  {
>         struct cros_ec_device *ec_dev = dev_get_drvdata(dev);
>
> +       dev_info(dev, "Prepare EC suspend\n");
> +
>         return cros_ec_suspend(ec_dev);
>  }
>
> -static int cros_ec_lpc_resume(struct device *dev)
> +static void cros_ec_lpc_complete(struct device *dev)
>  {
>         struct cros_ec_device *ec_dev = dev_get_drvdata(dev);
> +       int ret;
> +
> +       ret = cros_ec_resume(ec_dev);
>
> -       return cros_ec_resume(ec_dev);
> +       dev_info(dev, "EC resume completed: ret = %d\n", ret);
>  }
>  #endif
>
>  static const struct dev_pm_ops cros_ec_lpc_pm_ops = {
> -       SET_LATE_SYSTEM_SLEEP_PM_OPS(cros_ec_lpc_suspend, cros_ec_lpc_resume)
> +#ifdef CONFIG_PM_SLEEP
> +       .prepare = cros_ec_lpc_prepare,
> +       .complete = cros_ec_lpc_complete
> +#endif
>  };
>
>  static struct platform_driver cros_ec_lpc_driver = {
> --
> 2.37.2.609.g9ff673ca1a-goog
>


-- 

Tim Van Patten | ChromeOS | timvp@google.com | (720) 432-0997
