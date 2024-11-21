Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B851DAC89
	for <chrome-platform@lists.linux.dev>; Thu, 21 Nov 2024 23:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732230363; cv=none; b=SOkyYpUhKhvzeMmhp51vaexuUp4DlYB3MUjHZLSuGkTNcWr2Pe5R2m37/DTGWowpC5gwZRTmhJg9DMSZuOLx99DKpfvhlLCiJiG6mC8kfUQam6AV6f+u5im8Znmn8/zcKt0qOl8aRgXkg1rCX/F7O6EZIloFWaHJj6mH9Vx9XdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732230363; c=relaxed/simple;
	bh=7vVsWJAlaxSvMOvtdje6yXGcypqw9no47hXoQMLek34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfVxbBoKwfgJWYV3UNiCbAFXrpaH5+2O1EeInj+hmH58T/yPL9j+CV3TwcLvwmXBrjiQYYz7fd8lOaxxc0NBUnYYBH0FHSNaRLVKs/VV9aNrvpFj+bbZJNR8UCJEyw/1nV9UXIE1QOG0Ss7jzJY1PvrGADDVV5TSZPCrSH6aiiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JRBPfjWo; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JRBPfjWo"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53a007743e7so1626731e87.1
        for <chrome-platform@lists.linux.dev>; Thu, 21 Nov 2024 15:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732230359; x=1732835159; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=skGr7TzxYrDaJmlRy1zO1szKe6aQTSkC3fXLyAmXUUw=;
        b=JRBPfjWoZ3SqPaF8JvytYGPSBI21ZiKE6G+TPb/9vmwO0KywCDeFZSkT2VbaU+CVDR
         sY8ErErCz43G6qV+9+gOt4ZczN4+5gjzRMVLJ0OIi/OR5PZ+OjrEFBx3heqj+rOeWRxc
         pngizNPUv+BpuAQEuQVGhHrDTdkW0x4W49LzCLR2VJ1hFfhPTSTQ/11Rl8QB3fEvzuqk
         oz0l7heaL4esNb4WWuTxNAY3txU+10V8u/40q/8RPoG9WoIdTVLexCIPtl0CN5os3bFV
         Ve9zqVVDjTU3XgTtVPiidrvbJ9a6sf/hcIwxgCWC34QXgT3YF75mHkUM1QViVgQ9z4Xs
         xCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732230359; x=1732835159;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=skGr7TzxYrDaJmlRy1zO1szKe6aQTSkC3fXLyAmXUUw=;
        b=rhBt3vZJBRMn2nHdt/EzX9uEei8QYHByPa9oknMQCAU7COpvYw9T/mxFxCo90VVfyw
         lLr1I+w7wTMF1mlqhopofPIafSyKd7mtQaHKGnZmWFRn7DGhiELSvVXh50iAHCjmZUCK
         vj+YXn3kzBi7pPzmnOaoed4PTprgovgm2YuCvyIhGpdEwxpCwnFi61gJ9nC1Nq3fi8Ub
         hzJJPVyLGS4af6EwEKq5ZXF1jdYk50ADNiaiCZaZj18AlxoGdi8geyJgUOrUygJynh60
         lu+yx0h0o9dLh9gKRiu4b8U5ccTuP2ISwmf5MDVf3SyRm+s6wcvRxfdfvqFJBHns9ePq
         tM1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUEcgO2EF+LYCn9qYE1f8GUdfsDwP9PT351Kv1GmwiHZbcvL/LjIH/OtJINHlyXTL+9zfkeBJEPKcYRSv2xyvQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyqOQkm5uMdEsiIqxpVGP0Z5rl2PpbRbwOQfKZhTcq8phsDw9bS
	npZYHLh3Vm0WF5t+hvM02lz7CNmXJPHVQu+d4jsCkFPXAbqH87l/VGZAN1ph0qk=
X-Gm-Gg: ASbGncup2lC+FIMwHb+o2tp3CkoiEQWliFU06SzI7CoxVSRq0o3ePAnKCoGzVv4cWro
	rFVviAljHnHSKhd+QXA/4DXiXf+xB/zL3iaKPVs8siSYcsnoyLPNwY+ClMPkyp0YjNeCzn8lRVZ
	bQzMR0t+oVYmEXrjif9nLvLQBeABRepu5Fh29ox/JM6fbCeNFUb/vbU/eWB6FXN94QUAnIbq/H5
	QRC6Ebe0q0wDSO5unUj+PhUjtgd6SDZn5FIqPVTv6wTJryp2SmSGmwH4FQKWA7wkJo1NeOoqDBo
	5PX/7cwf3YIdl3ocGTJhdSt5TZfnvw==
X-Google-Smtp-Source: AGHT+IFsFiPswuTvKRAMZXTwEOWckEDYLeJUZ4aXoe/XaGXinnkHcCPuSeYBh8t3kFTwrpf2UNrmrA==
X-Received: by 2002:a05:6512:b81:b0:539:ddf1:ac6f with SMTP id 2adb3069b0e04-53dd39a4c7dmr232459e87.46.1732230359158;
        Thu, 21 Nov 2024 15:05:59 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd4253c64sm11188e87.107.2024.11.21.15.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 15:05:58 -0800 (PST)
Date: Fri, 22 Nov 2024 01:05:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v7 2/3] usb: typec: ucsi: Implement ChromeOS UCSI driver
Message-ID: <wyz6rxgimqsas4giychio227mpivoqfihyvxmpqfh2it4vfqlq@3o4urzbow2c2>
References: <20241115155234.1587589-1-ukaszb@chromium.org>
 <20241115155234.1587589-3-ukaszb@chromium.org>
 <jatq645z65hthaud4up6h6mxbggqpm73djtd6t3fxxkwccsifu@bb7bn24b7dak>
 <CALwA+NZ16WigkZuTwsRzDNC96OOR=+ZA-_UxtMq=fTWJ23a_Ag@mail.gmail.com>
 <CAA8EJprRQuXtGwiDeOiS56Nq=RW3p82-LTWGt8RervqGwP-=Vw@mail.gmail.com>
 <CALwA+NbUCstuayfm3ag-mBBRus1y-RM53auVFfffE_1OcW2zzA@mail.gmail.com>
 <CAA8EJppJ6FKDRvZg0WHk7+uygFTUDKqBnx0swQ=A_E7WiUQUdA@mail.gmail.com>
 <CALwA+Nbdah1SML92GPtsYmVKmPzTLTGSu1kuphp+PDGuERT27A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALwA+Nbdah1SML92GPtsYmVKmPzTLTGSu1kuphp+PDGuERT27A@mail.gmail.com>

On Mon, Nov 18, 2024 at 12:18:17PM +0100, Łukasz Bartosik wrote:
> On Mon, Nov 18, 2024 at 12:08 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Mon, 18 Nov 2024 at 12:38, Łukasz Bartosik <ukaszb@chromium.org> wrote:
> > >
> > > On Mon, Nov 18, 2024 at 11:21 AM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > On Mon, 18 Nov 2024 at 12:10, Łukasz Bartosik <ukaszb@chromium.org> wrote:
> > > > >
> > > > > On Fri, Nov 15, 2024 at 6:00 PM Dmitry Baryshkov
> > > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > > >
> > > > > > On Fri, Nov 15, 2024 at 03:52:33PM +0000, Łukasz Bartosik wrote:
> > > > > > > From: Pavan Holla <pholla@chromium.org>
> > > > > > >
> > > > > > > Implementation of a UCSI transport driver for ChromeOS.
> > > > > > > This driver will be loaded if the ChromeOS EC implements a PPM.
> > > > > > >
> > > > > > > Signed-off-by: Pavan Holla <pholla@chromium.org>
> > > > > > > Co-developed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > > > > > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > > > > > > Co-developed-by: Łukasz Bartosik <ukaszb@chromium.org>
> > > > > > > Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
> > > > > > > ---
> > > > > > >  MAINTAINERS                           |   7 +
> > > > > > >  drivers/usb/typec/ucsi/Kconfig        |  13 ++
> > > > > > >  drivers/usb/typec/ucsi/Makefile       |   1 +
> > > > > > >  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 248 ++++++++++++++++++++++++++
> > > > > > >  4 files changed, 269 insertions(+)
> > > > > > >  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > > > > >
> > > > > > > +static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
> > > > > > > +{
> > > > > > > +     return ucsi_sync_control_common(ucsi, cmd);
> > > > > > > +}
> > > > > > > +
> > > > > > > +struct ucsi_operations cros_ucsi_ops = {
> > > > > > > +     .read_version = cros_ucsi_read_version,
> > > > > > > +     .read_cci = cros_ucsi_read_cci,
> > > > > > > +     .read_message_in = cros_ucsi_read_message_in,
> > > > > > > +     .async_control = cros_ucsi_async_control,
> > > > > > > +     .sync_control = cros_ucsi_sync_control,
> > > > > >
> > > > > > .sync_control = ucsi_sync_control_common,
> > > > > >
> > > > >
> > > > > I will change.
> > > > >
> > > > > > > +};
> > > > > > > +
> > > > > >
> > > > > > [...]
> > > > > >
> > > > > > > +
> > > > > > > +static int __maybe_unused cros_ucsi_suspend(struct device *dev)
> > > > > > > +{
> > > > > > > +     struct cros_ucsi_data *udata = dev_get_drvdata(dev);
> > > > > > > +
> > > > > > > +     cancel_work_sync(&udata->work);
> > > > > > > +
> > > > > > > +     return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static void __maybe_unused cros_ucsi_complete(struct device *dev)
> > > > > > > +{
> > > > > > > +     struct cros_ucsi_data *udata = dev_get_drvdata(dev);
> > > > > > > +
> > > > > > > +     ucsi_resume(udata->ucsi);
> > > > > > > +}
> > > > > > > +
> > > > > > > +static const struct dev_pm_ops cros_ucsi_pm_ops = {
> > > > > > > +#ifdef CONFIG_PM_SLEEP
> > > > > > > +     .suspend = cros_ucsi_suspend,
> > > > > > > +     .complete = cros_ucsi_complete,
> > > > > > > +#endif
> > > > > >
> > > > > > SET_SYSTEM_SLEEP_PM_OPS ? Or even better, DEFINE_SIMPLE_DEV_PM_OPS() ?
> > > > > >
> > > > > > What is the reason for using complete() instead of resume()?
> > > > > >
> > > > >
> > > > > Due to change in
> > > > > https://lore.kernel.org/linux-usb/20240910101527.603452-1-ukaszb@chromium.org/T/#m25bc17cc0a8d30439830415018c7f44f342900d1
> > > > > we moved from using macro SIMPLE_DEV_PM_OPS and resume() to complete().
> > > > > Per Heikki's suggestion I also squashed this change into "usb: typec:
> > > > > ucsi: Implement ChromeOS UCSI driver".
> > > >
> > > > Neither original patch, nor this one document, why this is necessary
> > > >
> > >
> > > The https://lore.kernel.org/linux-usb/20240910101527.603452-1-ukaszb@chromium.org/T/#m25bc17cc0a8d30439830415018c7f44f342900d1
> > > commit messages says:
> > > "On platforms using cros_ec_lpc, resume is split into .resume_early
> > > and .complete.
> > > To avoid missing EC events, use .complete to schedule work when resuming."
> > >
> > > I will add this as a comment on top of cros_ucsi_pm_ops struct.
> > > Do you find it sufficient ?
> >
> > IMHO, no
> >
> 
> Ok. If you please tell me what is not clear or missing in this
> explanation in your opinion
> then I will update it.

For me it is a question of imbalance. The .complete() should be paired
with .prepare(), .suspend() with .resume(), etc. Also by using just
.suspend and .complete you are missing all other suspend/resume cases
which are covered by SET_SYSTEM_SLEEP_PM_OPS() or
SET_LATE_SYSTEM_SLEEP_PM_OPS().

So, back to your question. I'm reviewing the UCSI part. I don't know
anything about the cros_ec_lpc.c or any other CrOS EC drivers. You are
doing some non-standard thing in your driver. As such you should provide
a sensible explanation for it. If I understand correctly, it might be
something in line with "UCSI is used with the systems using
cros_ec_lpc.c. On such systems ... is not available until the
.complete() callback of the cros_ec_lpc is executed. For this reason,
delay ucsi_resume() until the .complete() stage."

> 
> Thanks,
> Lukasz
> 
> > >
> > > Thanks,
> > > Lukasz
> > >
> > > > >
> > > > > Thank you,
> > > > > Lukasz
> > > > >
> > > > > > > +};
> > > > > > > +
> > > > > > > +static const struct platform_device_id cros_ucsi_id[] = {
> > > > > > > +     { KBUILD_MODNAME, 0 },
> > > > > > > +     {}
> > > > > > > +};
> > > > > > > +MODULE_DEVICE_TABLE(platform, cros_ucsi_id);
> > > > > > > +
> > > > > > > +static struct platform_driver cros_ucsi_driver = {
> > > > > > > +     .driver = {
> > > > > > > +             .name = KBUILD_MODNAME,
> > > > > > > +             .pm = &cros_ucsi_pm_ops,
> > > > > > > +     },
> > > > > > > +     .id_table = cros_ucsi_id,
> > > > > > > +     .probe = cros_ucsi_probe,
> > > > > > > +     .remove = cros_ucsi_remove,
> > > > > > > +};
> > > > > > > +
> > > > > > > +module_platform_driver(cros_ucsi_driver);
> > > > > > > +
> > > > > > > +MODULE_LICENSE("GPL");
> > > > > > > +MODULE_DESCRIPTION("UCSI driver for ChromeOS EC");
> > > > > > > --
> > > > > > > 2.47.0.338.g60cca15819-goog
> > > > > > >
> > > > > >
> > > > > > --
> > > > > > With best wishes
> > > > > > Dmitry
> > > >
> > > >
> > > >
> > > > --
> > > > With best wishes
> > > > Dmitry
> >
> >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
