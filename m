Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3357EBE
	for <chrome-platform@lists.linux.dev>; Tue, 17 Oct 2023 15:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RbmK+PxO"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3af5fcb5e37so3816219b6e.0
        for <chrome-platform@lists.linux.dev>; Tue, 17 Oct 2023 08:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697557866; x=1698162666; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=il3/t88Bvcf0KfSpDio1h3Qoo8mc/TjRbLwACXlksC8=;
        b=RbmK+PxOgh5byQiMlgl6d+TOhCgg0k4kD3gESK3viV+udJC34yGSVpSpD9QWmL4asx
         jrilxpsrqy+7ubJ6vNFR5lk9HLog8FGFlP2pabP841DwgEY71T5fqkpJdvuI13BfKiMP
         KFF18vPY2O+VkuqBHJWLake0HYkLcw6TPY4a0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697557866; x=1698162666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=il3/t88Bvcf0KfSpDio1h3Qoo8mc/TjRbLwACXlksC8=;
        b=sWYOyS1RnkQFvHFD9kaajLzChUkjnuvn98+nXu07kJr3umKnsIrvW2B8//lhc6Zm90
         LwxIS6IC31i1UWj2Ys9eU44QwY+6OUrUG87YoNQp+fojnkgW+stmvM6sGOOzMKgt6S9M
         phqMpVPnlTzULzSi8kL96i50ms/mV1f5tFsmsymIIzaMTPK76ak/8IHt0Qbsrw+CIrd3
         R1bNRoX7gb5IcdPmIbSpiFHwkoZowiJALpEjsp0XxYDvmwc22PAtMrSzQIe57DG/mK6y
         e/+ki2RnGFAe72q7ApWF3ozZi64Tup5YbOgPaOKKeEcGMe1V1WZxp5ovLX/+G5BCLGzm
         uDPw==
X-Gm-Message-State: AOJu0YzhCkkJBcJnEbCrfILsVoLQql+hfUXl2eORtWuPhk5EWgtbhop0
	NvlFnwjMLvwB+vqo5SCbZ0jriD8m/MYJwi+IMDEmRg==
X-Google-Smtp-Source: AGHT+IExn1liKqWXpiUBNO4YDOjyrhSuJlod5rWVKACRZm2hk+OkA9O5pUS4J69jHcYDeOhk73ytmbiIepY4uRu+xc8=
X-Received: by 2002:aca:90e:0:b0:3af:585:400b with SMTP id 14-20020aca090e000000b003af0585400bmr2463244oij.58.1697557865869;
 Tue, 17 Oct 2023 08:51:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231010120319.1.Ifbec35991a2b629b57452d2d9f96d840d152a16f@changeid>
In-Reply-To: <20231010120319.1.Ifbec35991a2b629b57452d2d9f96d840d152a16f@changeid>
From: Lalithkumar Rajendran <lalithkraj@chromium.org>
Date: Tue, 17 Oct 2023 10:50:54 -0500
Message-ID: <CACwGwOEbQZCQNK6=2dOS-i54Xme34biV5j2hacDW1AKYt9gRiw@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: Separate host command and
 irq disable
To: LKML <linux-kernel@vger.kernel.org>
Cc: Benson Leung <bleung@chromium.org>, 
	Enric Balletbo i Serra <enric.balletbo@collabora.com>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding chrome-platform to CC.


On Tue, Oct 10, 2023 at 12:03=E2=80=AFPM Lalith Rajendran
<lalithkraj@chromium.org> wrote:
>
> Both cros host command and irq disable were moved to suspend
> prepare stage from late suspend recently. This is causing EC
> to report MKBP event timeouts during suspend stress testing.
> When the MKBP event timeouts happen during suspend, subsequent
> wakeup of AP by EC using MKBP doesn't happen properly. Although
> there are other issues to debug here, this change move the irq
> disabling part back to late suspend stage which is a general
> suggestion from the suspend kernel documentaiton to do irq
> disable as late as possible.
>
> Signed-off-by: Lalith Rajendran <lalithkraj@chromium.org>
> ---
>
>  drivers/platform/chrome/cros_ec.c     | 90 ++++++++++++++++++++++++---
>  drivers/platform/chrome/cros_ec.h     |  4 ++
>  drivers/platform/chrome/cros_ec_lpc.c | 21 +++++--
>  3 files changed, 101 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/=
cros_ec.c
> index 2b49155a9b35..6f520c13c0f3 100644
> --- a/drivers/platform/chrome/cros_ec.c
> +++ b/drivers/platform/chrome/cros_ec.c
> @@ -317,16 +317,17 @@ EXPORT_SYMBOL(cros_ec_unregister);
>
>  #ifdef CONFIG_PM_SLEEP
>  /**
> - * cros_ec_suspend() - Handle a suspend operation for the ChromeOS EC de=
vice.
> + * cros_ec_suspend_prepare() - Handle a suspend prepare operation for th=
e ChromeOS EC device.
>   * @ec_dev: Device to suspend.
>   *
> - * This can be called by drivers to handle a suspend event.
> + * This can be called by drivers to handle a suspend prepare stage of su=
spend.
> + * Drivers should either call cros_ec_supsend or call
> + * cros_ec_suspend_prepare and cros_ec_suspend_late.
>   *
>   * Return: 0 on success or negative error code.
>   */
> -int cros_ec_suspend(struct cros_ec_device *ec_dev)
> +int cros_ec_suspend_prepare(struct cros_ec_device *ec_dev)
>  {
> -       struct device *dev =3D ec_dev->dev;
>         int ret;
>         u8 sleep_event;
>
> @@ -338,7 +339,23 @@ int cros_ec_suspend(struct cros_ec_device *ec_dev)
>         if (ret < 0)
>                 dev_dbg(ec_dev->dev, "Error %d sending suspend event to e=
c",
>                         ret);
> +       return 0;
> +}
> +EXPORT_SYMBOL(cros_ec_suspend_prepare);
>
> +/**
> + * cros_ec_suspend_late() - Handle a suspend late operation for the Chro=
meOS EC device.
> + * @ec_dev: Device to suspend.
> + *
> + * This can be called by drivers to handle a suspend late stage of suspe=
nd.
> + * Drivers should either call cros_ec_supsend or call
> + * cros_ec_suspend_prepare and cros_ec_suspend_late.
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int cros_ec_suspend_late(struct cros_ec_device *ec_dev)
> +{
> +       struct device *dev =3D ec_dev->dev;
>         if (device_may_wakeup(dev))
>                 ec_dev->wake_enabled =3D !enable_irq_wake(ec_dev->irq);
>
> @@ -348,6 +365,24 @@ int cros_ec_suspend(struct cros_ec_device *ec_dev)
>
>         return 0;
>  }
> +EXPORT_SYMBOL(cros_ec_suspend_late);
> +
> +/**
> + * cros_ec_suspend() - Handle a suspend operation for the ChromeOS EC de=
vice.
> + * @ec_dev: Device to suspend.
> + *
> + * This can be called by drivers to handle a suspend event.
> + * Drivers should either call cros_ec_supsend or call
> + * cros_ec_suspend_prepare and cros_ec_suspend_late.
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int cros_ec_suspend(struct cros_ec_device *ec_dev)
> +{
> +       cros_ec_suspend_prepare(ec_dev);
> +       cros_ec_suspend_late(ec_dev);
> +       return 0;
> +}
>  EXPORT_SYMBOL(cros_ec_suspend);
>
>  static void cros_ec_report_events_during_suspend(struct cros_ec_device *=
ec_dev)
> @@ -365,21 +400,20 @@ static void cros_ec_report_events_during_suspend(st=
ruct cros_ec_device *ec_dev)
>  }
>
>  /**
> - * cros_ec_resume() - Handle a resume operation for the ChromeOS EC devi=
ce.
> + * cros_ec_resume() - Handle a resume complete operation for the ChromeO=
S EC device.
>   * @ec_dev: Device to resume.
>   *
> - * This can be called by drivers to handle a resume event.
> + * This can be called by drivers to handle a resume complete stage of re=
sume.
> + * Drivers should either call cros_ec_resume or call
> + * cros_ec_resume_early and cros_ec_resume_complete.
>   *
>   * Return: 0 on success or negative error code.
>   */
> -int cros_ec_resume(struct cros_ec_device *ec_dev)
> +int cros_ec_resume_complete(struct cros_ec_device *ec_dev)
>  {
>         int ret;
>         u8 sleep_event;
>
> -       ec_dev->suspended =3D false;
> -       enable_irq(ec_dev->irq);
> -
>         sleep_event =3D (!IS_ENABLED(CONFIG_ACPI) || pm_suspend_via_firmw=
are()) ?
>                       HOST_SLEEP_EVENT_S3_RESUME :
>                       HOST_SLEEP_EVENT_S0IX_RESUME;
> @@ -388,6 +422,24 @@ int cros_ec_resume(struct cros_ec_device *ec_dev)
>         if (ret < 0)
>                 dev_dbg(ec_dev->dev, "Error %d sending resume event to ec=
",
>                         ret);
> +       return 0;
> +}
> +EXPORT_SYMBOL(cros_ec_resume_complete);
> +
> +/**
> + * cros_ec_resume_early() - Handle a resume early operation for the Chro=
meOS EC device.
> + * @ec_dev: Device to resume.
> + *
> + * This can be called by drivers to handle a resume early stage of resum=
e.
> + * Drivers should either call cros_ec_resume or call
> + * cros_ec_resume_early and cros_ec_resume_complete.
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int cros_ec_resume_early(struct cros_ec_device *ec_dev)
> +{
> +       ec_dev->suspended =3D false;
> +       enable_irq(ec_dev->irq);
>
>         if (ec_dev->wake_enabled) {
>                 disable_irq_wake(ec_dev->irq);
> @@ -402,6 +454,24 @@ int cros_ec_resume(struct cros_ec_device *ec_dev)
>
>         return 0;
>  }
> +EXPORT_SYMBOL(cros_ec_resume_early);
> +
> +/**
> + * cros_ec_resume() - Handle a resume operation for the ChromeOS EC devi=
ce.
> + * @ec_dev: Device to resume.
> + *
> + * This can be called by drivers to handle a resume event.
> + * Drivers should either call cros_ec_resume or call
> + * cros_ec_resume_early and cros_ec_resume_complete.
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int cros_ec_resume(struct cros_ec_device *ec_dev)
> +{
> +       cros_ec_resume_early(ec_dev);
> +       cros_ec_resume_complete(ec_dev);
> +       return 0;
> +}
>  EXPORT_SYMBOL(cros_ec_resume);
>
>  #endif
> diff --git a/drivers/platform/chrome/cros_ec.h b/drivers/platform/chrome/=
cros_ec.h
> index bbca0096868a..41defaa5e766 100644
> --- a/drivers/platform/chrome/cros_ec.h
> +++ b/drivers/platform/chrome/cros_ec.h
> @@ -14,7 +14,11 @@ int cros_ec_register(struct cros_ec_device *ec_dev);
>  void cros_ec_unregister(struct cros_ec_device *ec_dev);
>
>  int cros_ec_suspend(struct cros_ec_device *ec_dev);
> +int cros_ec_suspend_late(struct cros_ec_device *ec_dev);
> +int cros_ec_suspend_prepare(struct cros_ec_device *ec_dev);
>  int cros_ec_resume(struct cros_ec_device *ec_dev);
> +int cros_ec_resume_early(struct cros_ec_device *ec_dev);
> +int cros_ec_resume_complete(struct cros_ec_device *ec_dev);
>
>  irqreturn_t cros_ec_irq_thread(int irq, void *data);
>
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chr=
ome/cros_ec_lpc.c
> index 8982cf23e514..afb9f7dbb2ba 100644
> --- a/drivers/platform/chrome/cros_ec_lpc.c
> +++ b/drivers/platform/chrome/cros_ec_lpc.c
> @@ -537,22 +537,35 @@ MODULE_DEVICE_TABLE(dmi, cros_ec_lpc_dmi_table);
>  static int cros_ec_lpc_prepare(struct device *dev)
>  {
>         struct cros_ec_device *ec_dev =3D dev_get_drvdata(dev);
> -
> -       return cros_ec_suspend(ec_dev);
> +       return cros_ec_suspend_prepare(ec_dev);
>  }
>
>  static void cros_ec_lpc_complete(struct device *dev)
>  {
>         struct cros_ec_device *ec_dev =3D dev_get_drvdata(dev);
> -       cros_ec_resume(ec_dev);
> +       cros_ec_resume_complete(ec_dev);
> +}
> +static int cros_ec_lpc_suspend_late(struct device *dev)
> +{
> +       struct cros_ec_device *ec_dev =3D dev_get_drvdata(dev);
> +
> +       return cros_ec_suspend_late(ec_dev);
> +}
> +
> +static int cros_ec_lpc_resume_early(struct device *dev)
> +{
> +       struct cros_ec_device *ec_dev =3D dev_get_drvdata(dev);
> +
> +       return cros_ec_resume_early(ec_dev);
>  }
>  #endif
>
>  static const struct dev_pm_ops cros_ec_lpc_pm_ops =3D {
>  #ifdef CONFIG_PM_SLEEP
>         .prepare =3D cros_ec_lpc_prepare,
> -       .complete =3D cros_ec_lpc_complete
> +       .complete =3D cros_ec_lpc_complete,
>  #endif
> +       SET_LATE_SYSTEM_SLEEP_PM_OPS(cros_ec_lpc_suspend_late, cros_ec_lp=
c_resume_early)
>  };
>
>  static struct platform_driver cros_ec_lpc_driver =3D {
> --
> 2.42.0.609.gbb76f46606-goog
>
