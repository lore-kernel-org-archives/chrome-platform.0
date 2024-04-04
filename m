Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E8B127B69
	for <chrome-platform@lists.linux.dev>; Thu,  4 Apr 2024 13:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712236836; cv=none; b=OgEJkAgtwzsKg/UKclUm+b+9OYKrrwxY7X8K/UK4xdAn3oOA2IDPH4lpy4Ycv2XXwwUBJ5kUgd4xNTiQQ+apETle4O0mXI/4z9ED8ubx/aJ13bcCk03HAqYSOwiJyoXCziDIk4lclHFWg4wy/Z1WiblwuM0HMcpUsryOWMFLluM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712236836; c=relaxed/simple;
	bh=0joi11G0xDZ2oFlx1nqLnr2QN/Lqgq8PjUP0rm/6LuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NvE0Z4rnrYwWNJ2bsX+R9wkHityeQxHyLNxl09SsoAvor5i8Jkt5bF8ywQX1BN3phJ/V1+JnMxxAlSglsfULOBOTZDY1X0RYYBW21zluM0/DhXMziNTOX9MOQSZQ3lbogttZmzhmBrAPklxRlkG0b978+djsLi5r4S04IzzswVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XN00psNH; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XN00psNH"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-516bf5a145aso1192711e87.1
        for <chrome-platform@lists.linux.dev>; Thu, 04 Apr 2024 06:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712236832; x=1712841632; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BmxT2bmm8g0mJQONvjf7yYzlDODkFb/ewfnFEZYAOnw=;
        b=XN00psNH5SYXYvRZIWfUJaakTU1IvE6FlLPjtZW3b2L/4St44KFB5owJIVi2cdM/TI
         /5H6bLLbAj2uVNWjjVIprlx3OwKkmActOnOnsNyvo9dU3W/8yKRKuYpPUpegm9a5DI8Q
         jHaWyVEY/YPFPBnyrvWKnWYEBrYqIb7OqaBk0kdQGQLWfU9a4qHsGqrYtcTr+JTmjo0A
         4GfdqaRCuZPSrrqMoSKfZXZL1rXuLZ84Hgg+cI4wSt41KMDy8pO6pPrMYDuNzRRMI/NY
         bHJiMb27gz9t92SXYdpJD2SDSsxySd2B3PMjh7qFCKxZVLZ3U2uQxxzZITzKzz1BZR0q
         wfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712236832; x=1712841632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmxT2bmm8g0mJQONvjf7yYzlDODkFb/ewfnFEZYAOnw=;
        b=M9Ili4W6QBgi1IiSVlKiIIMdXWIBV/U4l7ALGd8mdWLc9u0f+SnFo4Z9eEqFzwpfM9
         KNN1nFhlJa9NB44Ii9kk05B4Bmbp+7h8bmQBcg6RM1ifIqFvMtp/fXcnrWYNKXD85Cas
         ZWcFLT6jSh5u1zOUBgbTibxgFGwskJVwGnTi0lLaNbeXRTmki11RZ9RpuALZWSzqMQ1B
         hcANH33dCJJ2zfb1Hb0IEkn7nhslcui/4Zm/pIYleux9AefRHPWBWWp797xUZ6C3xZ+t
         P3DbXGEymomS4k0nDVZj+aPVgvQaGrjFBqZGTml/8kqTpB2NgruIdd6KvR262bqSv0M7
         ZvrA==
X-Forwarded-Encrypted: i=1; AJvYcCVf0P4Q4o2YiYOO1W2mTK8sX0b2pI/qzTDY+KShCSTVPZlagg0yIc9FnzwIHy0bDYAlUG/2jcVNRgHygfR/0nDifwUaqFu0fDwiZBHqtAaM
X-Gm-Message-State: AOJu0YyAW9NhjOBke1VtUZS6D7Vd0d7nmbmD8bqls9jDVwWQmvP6xPVH
	rIxwZ+zkfYYBi0PXSkG4Tt3L4kYbSqmoPpJe9fJFPh5DCG5sakUA3KpZeDmW9as=
X-Google-Smtp-Source: AGHT+IFxotHqerLaFbC8q0QYoe5CGSs3NsouxaH0IHWzzx7Joqi/YVnfY+52cKFEhigEqGlEjAVhog==
X-Received: by 2002:a05:6512:488d:b0:515:d4bc:c64d with SMTP id eq13-20020a056512488d00b00515d4bcc64dmr1665084lfb.68.1712236832488;
        Thu, 04 Apr 2024 06:20:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
        by smtp.gmail.com with ESMTPSA id t22-20020a192d56000000b00516cbd3e982sm177550lft.178.2024.04.04.06.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 06:20:32 -0700 (PDT)
Date: Thu, 4 Apr 2024 16:20:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pavan Holla <pholla@chromium.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v3 2/2] usb: typec: ucsi: Implement ChromeOS UCSI driver
Message-ID: <oi3bwdyvyaezpmyxfdtsbiwwprxi2ufc3hlzoz23d5rxdkperl@cxpd7enatg7h>
References: <20240403-public-ucsi-h-v3-0-f848e18c8ed2@chromium.org>
 <20240403-public-ucsi-h-v3-2-f848e18c8ed2@chromium.org>
 <3ezjocthsigo3t746slmgzffnmpxw7wwf3s535basiaf2qy6io@7ocxva6ndsbt>
 <2024040449-average-foyer-defa@gregkh>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024040449-average-foyer-defa@gregkh>

On Thu, Apr 04, 2024 at 03:07:15PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Apr 03, 2024 at 09:58:33PM +0300, Dmitry Baryshkov wrote:
> > On Wed, Apr 03, 2024 at 06:05:22PM +0000, Pavan Holla wrote:
> > > Implementation of a UCSI transport driver for ChromeOS.
> > > This driver will be loaded if the ChromeOS EC implements a PPM.
> > > 
> > > Signed-off-by: Pavan Holla <pholla@chromium.org>
> > > ---
> > >  drivers/usb/typec/ucsi/Kconfig        |  13 ++
> > >  drivers/usb/typec/ucsi/Makefile       |   1 +
> > >  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 245 ++++++++++++++++++++++++++++++++++
> > >  3 files changed, 259 insertions(+)
> > > 
> > > diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
> > > index bdcb1764cfae..4dceb14a66ee 100644
> > > --- a/drivers/usb/typec/ucsi/Kconfig
> > > +++ b/drivers/usb/typec/ucsi/Kconfig
> > > @@ -69,4 +69,17 @@ config UCSI_PMIC_GLINK
> > >  	  To compile the driver as a module, choose M here: the module will be
> > >  	  called ucsi_glink.
> > >  
> > > +config CROS_EC_UCSI
> > > +	tristate "UCSI Driver for ChromeOS EC"
> > > +	depends on MFD_CROS_EC_DEV
> > > +	depends on CROS_USBPD_NOTIFY
> > > +	depends on !EXTCON_TCSS_CROS_EC
> > > +	default MFD_CROS_EC_DEV
> > > +	help
> > > +	  This driver enables UCSI support for a ChromeOS EC. The EC is
> > > +	  expected to implement a PPM.
> > > +
> > > +	  To compile the driver as a module, choose M here: the module
> > > +	  will be called cros_ec_ucsi.
> > > +
> > >  endif
> > > diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
> > > index b4679f94696b..cb336eee055c 100644
> > > --- a/drivers/usb/typec/ucsi/Makefile
> > > +++ b/drivers/usb/typec/ucsi/Makefile
> > > @@ -21,3 +21,4 @@ obj-$(CONFIG_UCSI_ACPI)			+= ucsi_acpi.o
> > >  obj-$(CONFIG_UCSI_CCG)			+= ucsi_ccg.o
> > >  obj-$(CONFIG_UCSI_STM32G0)		+= ucsi_stm32g0.o
> > >  obj-$(CONFIG_UCSI_PMIC_GLINK)		+= ucsi_glink.o
> > > +obj-$(CONFIG_CROS_EC_UCSI)		+= cros_ec_ucsi.o
> > > diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > > new file mode 100644
> > > index 000000000000..dd46b46d430f
> > > --- /dev/null
> > > +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> > > @@ -0,0 +1,245 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * UCSI driver for ChromeOS EC
> > > + *
> > > + * Copyright 2024 Google LLC.
> > > + */
> > > +
> > > +#include <linux/container_of.h>
> > > +#include <linux/dev_printk.h>
> > > +#include <linux/mod_devicetable.h>
> > > +#include <linux/module.h>
> > > +#include <linux/platform_data/cros_ec_commands.h>
> > > +#include <linux/platform_data/cros_usbpd_notify.h>
> > > +#include <linux/platform_data/cros_ec_proto.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/wait.h>
> > > +
> > > +#include "ucsi.h"
> > > +
> > > +#define DRV_NAME "cros-ec-ucsi"
> > > +
> > > +#define MAX_EC_DATA_SIZE 256
> > > +#define WRITE_TMO_MS 500
> > > +
> > > +struct cros_ucsi_data {
> > > +	struct device *dev;
> > > +	struct ucsi *ucsi;
> > > +
> > > +	struct cros_ec_device *ec;
> > > +	struct notifier_block nb;
> > > +	struct work_struct work;
> > > +
> > > +	struct completion complete;
> > > +	unsigned long flags;
> > > +};
> > > +
> > > +static int cros_ucsi_read(struct ucsi *ucsi, unsigned int offset, void *val,
> > > +			  size_t val_len)
> > > +{
> > > +	struct cros_ucsi_data *udata = ucsi_get_drvdata(ucsi);
> > > +	struct ec_params_ucsi_ppm_get req = {
> > > +		.offset = offset,
> > > +		.size = val_len,
> > > +	};
> > > +	int ret;
> > > +
> > > +	if (val_len > MAX_EC_DATA_SIZE) {
> > > +		dev_err(udata->dev, "Can't read %zu bytes. Too big.", val_len);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	ret = cros_ec_cmd(udata->ec, 0, EC_CMD_UCSI_PPM_GET,
> > > +			  &req, sizeof(req), val, val_len);
> > > +	if (ret < 0) {
> > > +		dev_warn(udata->dev, "Failed to send EC message UCSI_PPM_GET: error=%d", ret);
> > > +		return ret;
> > > +	}
> > > +	return 0;
> > > +}
> > > +
> > > +static int cros_ucsi_async_write(struct ucsi *ucsi, unsigned int offset,
> > > +				 const void *val, size_t val_len)
> > > +{
> > > +	struct cros_ucsi_data *udata = ucsi_get_drvdata(ucsi);
> > > +	uint8_t ec_buffer[MAX_EC_DATA_SIZE + sizeof(struct ec_params_ucsi_ppm_set)];
> > > +	struct ec_params_ucsi_ppm_set *req = (struct ec_params_ucsi_ppm_set *)ec_buffer;
> > > +	int ret = 0;
> > > +
> > > +	if (val_len > MAX_EC_DATA_SIZE) {
> > > +		dev_err(udata->dev, "Can't write %zu bytes. Too big.", val_len);
> > 
> > I think it's better be written as
> > 
> > if (WARN_ON_ONCE(val_len > MAX_EC_DATA_SIZE))
> > 	return -EINVAL;
> 
> So if you trigger this, you just rebooted all boxes that have
> panic-on-warn enabled (hint, the HUGE majority in quantity of Linux
> systems out there.)
> 
> So don't do that, just handle it like this.

Does that mean that we should not use WARN at all? What is the best
current practice for WARN usage?

I'm asking because for me this looks like a perfect usecase. If I were
at the positiion of the driver developer, I'd like to know the whole
path leading to the bad call, not just the fact that the function was
called with the buffer being too big.

> BUT, if this can be triggered by userspace, do NOT use dev_err() as that
> will just allow userspace to flood the kernel log.
> 
> Pavan, who calls this?  If userspace, this needs to be fixed.  If it's
> only a kernel driver, it's fine as-is.
> 
> thanks,
> 
> greg k-h

-- 
With best wishes
Dmitry
