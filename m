Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090EB153BED
	for <chrome-platform@lists.linux.dev>; Wed,  3 Apr 2024 18:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712170720; cv=none; b=uYVX3h1rWPs/Z5cPFrmaxiR3nls1xmMHD8q3WLEGO8SftZUi2Ge1cvXZ409UE9uop1ZFH8Q9Dcawe2HNvEvBuYUByB/b86Z6UjQgFbMOFQDEAaaOc8nzKNp+bi6KvE6vzzYo7y7TaIxbD1nfX+EzE53rkXs4xH8HHda8Z3o5w9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712170720; c=relaxed/simple;
	bh=z5kp0Ir1X7PQhsD6XqcQiHFGZUfx8+EambfTBz6amK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHoNyemz0JAZmddWnMOQuqGVAS22NIPzAyFth1qefvTAPKYFT64pNYipN8il3KObZcymgmQGILIqcR92paVMlWfB2Cv7E0IqsUm9q6ELwoAdSavbU0aKC0pjvvxi3ew7ddqgXutk7JIy3yqzs2+oK1VgutK0Qf6f1mtsCUWWxnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CVfhn3jO; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CVfhn3jO"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-51381021af1so343564e87.0
        for <chrome-platform@lists.linux.dev>; Wed, 03 Apr 2024 11:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712170715; x=1712775515; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jbCEmoAXQSoy+gmJ/h1Pv+grKRrCvijIfIFTJN6iWwU=;
        b=CVfhn3jOX2FOf3AJftWYiAZ0J1FOR14Z3N493DkL+OY7ahweKmgQVeM4yByBJFNhdt
         8kvaB5DPOIxT+iV7Ul59mmPWoOGbbAeque2YsxAWJxkzuMQcyEp8EOX7jsOXHyIGIslK
         pYD8jd4vGvWqtsuCEXA0+MHULnL+iz7nfQYNRkrFrO0LjCIMHuI4r5b2AQI0rmrpP1B5
         PY0FwW1o/3f6pkl7hbl5I5EXfLFYzd+0Ev1FJTKKMJ5FYrI41QaspI976TPa5n0OntH2
         v94EULisksrKgmBeJAPCXLSwAUFYIVK3Rkf1Wp/jQ+0eA7cXH3FPQYK83/SG9AtC6FRW
         0d7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712170715; x=1712775515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbCEmoAXQSoy+gmJ/h1Pv+grKRrCvijIfIFTJN6iWwU=;
        b=J3WaVT2Rv4styMnAFs6zHHPfqkN//s4TeYXAlN/BEyZ1LIRoOv4lUTZv50ZMhoHrc7
         FW0C9fXxsaLwid+QTWU5LwsK8u9yPpux+WAf3KmUbgnvphsmfIp94v8Vat7Onn85wa+Z
         jOU4kg/hjMOIrPZcMdyoUSbALt2aKSp/pYFfmwr+WhVH7SpdBArssHoNufR5hyqa0GGl
         fN19lrIycPOCPXUDtyhWFsOt12DxzosdmifJv1hxzkRAQs+LcgJtq2ncmlucJsMQZuEv
         tYJIGNh3SDob5PmX2hXf314/I/DAne+DqU3jj2xYR4z0TF9jQUH4xrXmZFkLFpvZStUx
         GuSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXP716E4DTSS1Y8tPMftDj5U0tJ0BsWtbQQUyl/pBicMCOmbji4ZSAjfV2L1bC6k5h8BVqdExYGF8CBINcPSzuzi/RoMbg9ilDN//cV5j1V
X-Gm-Message-State: AOJu0YwaaHQtDKDAUT+S7wRCXNdoi+a9tcbTcWmR8J+aZkLtCgaVDK7N
	NtIoVlpqOyLQfaafd4F6s9Bk58bxpujt3CQDIRw6N45pZLh/LugSlFzGoZLP7aQ=
X-Google-Smtp-Source: AGHT+IHV2FCr/d7LmQjGGvHQAdt0ufgpgfRSgUZ5tgSQCuSPN0lzz2FVBKBmeSSfpyaJsgUxMtLczg==
X-Received: by 2002:ac2:4c1a:0:b0:515:b0be:3a42 with SMTP id t26-20020ac24c1a000000b00515b0be3a42mr319997lfq.33.1712170715108;
        Wed, 03 Apr 2024 11:58:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
        by smtp.gmail.com with ESMTPSA id e6-20020ac24e06000000b00516a302f32asm1219653lfr.132.2024.04.03.11.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 11:58:34 -0700 (PDT)
Date: Wed, 3 Apr 2024 21:58:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Pavan Holla <pholla@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v3 2/2] usb: typec: ucsi: Implement ChromeOS UCSI driver
Message-ID: <3ezjocthsigo3t746slmgzffnmpxw7wwf3s535basiaf2qy6io@7ocxva6ndsbt>
References: <20240403-public-ucsi-h-v3-0-f848e18c8ed2@chromium.org>
 <20240403-public-ucsi-h-v3-2-f848e18c8ed2@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403-public-ucsi-h-v3-2-f848e18c8ed2@chromium.org>

On Wed, Apr 03, 2024 at 06:05:22PM +0000, Pavan Holla wrote:
> Implementation of a UCSI transport driver for ChromeOS.
> This driver will be loaded if the ChromeOS EC implements a PPM.
> 
> Signed-off-by: Pavan Holla <pholla@chromium.org>
> ---
>  drivers/usb/typec/ucsi/Kconfig        |  13 ++
>  drivers/usb/typec/ucsi/Makefile       |   1 +
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 245 ++++++++++++++++++++++++++++++++++
>  3 files changed, 259 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
> index bdcb1764cfae..4dceb14a66ee 100644
> --- a/drivers/usb/typec/ucsi/Kconfig
> +++ b/drivers/usb/typec/ucsi/Kconfig
> @@ -69,4 +69,17 @@ config UCSI_PMIC_GLINK
>  	  To compile the driver as a module, choose M here: the module will be
>  	  called ucsi_glink.
>  
> +config CROS_EC_UCSI
> +	tristate "UCSI Driver for ChromeOS EC"
> +	depends on MFD_CROS_EC_DEV
> +	depends on CROS_USBPD_NOTIFY
> +	depends on !EXTCON_TCSS_CROS_EC
> +	default MFD_CROS_EC_DEV
> +	help
> +	  This driver enables UCSI support for a ChromeOS EC. The EC is
> +	  expected to implement a PPM.
> +
> +	  To compile the driver as a module, choose M here: the module
> +	  will be called cros_ec_ucsi.
> +
>  endif
> diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
> index b4679f94696b..cb336eee055c 100644
> --- a/drivers/usb/typec/ucsi/Makefile
> +++ b/drivers/usb/typec/ucsi/Makefile
> @@ -21,3 +21,4 @@ obj-$(CONFIG_UCSI_ACPI)			+= ucsi_acpi.o
>  obj-$(CONFIG_UCSI_CCG)			+= ucsi_ccg.o
>  obj-$(CONFIG_UCSI_STM32G0)		+= ucsi_stm32g0.o
>  obj-$(CONFIG_UCSI_PMIC_GLINK)		+= ucsi_glink.o
> +obj-$(CONFIG_CROS_EC_UCSI)		+= cros_ec_ucsi.o
> diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> new file mode 100644
> index 000000000000..dd46b46d430f
> --- /dev/null
> +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> @@ -0,0 +1,245 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * UCSI driver for ChromeOS EC
> + *
> + * Copyright 2024 Google LLC.
> + */
> +
> +#include <linux/container_of.h>
> +#include <linux/dev_printk.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_usbpd_notify.h>
> +#include <linux/platform_data/cros_ec_proto.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/wait.h>
> +
> +#include "ucsi.h"
> +
> +#define DRV_NAME "cros-ec-ucsi"
> +
> +#define MAX_EC_DATA_SIZE 256
> +#define WRITE_TMO_MS 500
> +
> +struct cros_ucsi_data {
> +	struct device *dev;
> +	struct ucsi *ucsi;
> +
> +	struct cros_ec_device *ec;
> +	struct notifier_block nb;
> +	struct work_struct work;
> +
> +	struct completion complete;
> +	unsigned long flags;
> +};
> +
> +static int cros_ucsi_read(struct ucsi *ucsi, unsigned int offset, void *val,
> +			  size_t val_len)
> +{
> +	struct cros_ucsi_data *udata = ucsi_get_drvdata(ucsi);
> +	struct ec_params_ucsi_ppm_get req = {
> +		.offset = offset,
> +		.size = val_len,
> +	};
> +	int ret;
> +
> +	if (val_len > MAX_EC_DATA_SIZE) {
> +		dev_err(udata->dev, "Can't read %zu bytes. Too big.", val_len);
> +		return -EINVAL;
> +	}
> +
> +	ret = cros_ec_cmd(udata->ec, 0, EC_CMD_UCSI_PPM_GET,
> +			  &req, sizeof(req), val, val_len);
> +	if (ret < 0) {
> +		dev_warn(udata->dev, "Failed to send EC message UCSI_PPM_GET: error=%d", ret);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
> +static int cros_ucsi_async_write(struct ucsi *ucsi, unsigned int offset,
> +				 const void *val, size_t val_len)
> +{
> +	struct cros_ucsi_data *udata = ucsi_get_drvdata(ucsi);
> +	uint8_t ec_buffer[MAX_EC_DATA_SIZE + sizeof(struct ec_params_ucsi_ppm_set)];
> +	struct ec_params_ucsi_ppm_set *req = (struct ec_params_ucsi_ppm_set *)ec_buffer;
> +	int ret = 0;
> +
> +	if (val_len > MAX_EC_DATA_SIZE) {
> +		dev_err(udata->dev, "Can't write %zu bytes. Too big.", val_len);

I think it's better be written as

if (WARN_ON_ONCE(val_len > MAX_EC_DATA_SIZE))
	return -EINVAL;

Same applies to reading.

> +		return -EINVAL;
> +	}
> +
> +	memset(req, 0, sizeof(ec_buffer));
> +	req->offset = offset;
> +	memcpy(req->data, val, val_len);
> +	ret = cros_ec_cmd(udata->ec, 0, EC_CMD_UCSI_PPM_SET,
> +			  req, sizeof(struct ec_params_ucsi_ppm_set) + val_len, NULL, 0);
> +
> +	if (ret < 0) {
> +		dev_warn(udata->dev, "Failed to send EC message UCSI_PPM_SET: error=%d", ret);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
> +static int cros_ucsi_sync_write(struct ucsi *ucsi, unsigned int offset,
> +				const void *val, size_t val_len)
> +{
> +	struct cros_ucsi_data *udata = ucsi_get_drvdata(ucsi);
> +	bool ack = UCSI_COMMAND(*(u64 *)val) == UCSI_ACK_CC_CI;
> +	int ret;
> +
> +	if (ack)
> +		set_bit(ACK_PENDING, &udata->flags);
> +	else
> +		set_bit(COMMAND_PENDING, &udata->flags);
> +
> +	ret = cros_ucsi_async_write(ucsi, offset, val, val_len);
> +	if (ret)
> +		goto out;
> +
> +	if (!wait_for_completion_timeout(&udata->complete, WRITE_TMO_MS))
> +		ret = -ETIMEDOUT;
> +
> +out:
> +	if (ack)
> +		clear_bit(ACK_PENDING, &udata->flags);
> +	else
> +		clear_bit(COMMAND_PENDING, &udata->flags);
> +	return ret;
> +}
> +
> +struct ucsi_operations cros_ucsi_ops = {
> +	.read = cros_ucsi_read,
> +	.async_write = cros_ucsi_async_write,
> +	.sync_write = cros_ucsi_sync_write,
> +};
> +
> +static void cros_ucsi_work(struct work_struct *work)
> +{
> +	struct cros_ucsi_data *udata = container_of(work, struct cros_ucsi_data, work);
> +	u32 cci;
> +	int ret;
> +
> +	ret = cros_ucsi_read(udata->ucsi, UCSI_CCI, &cci, sizeof(cci));
> +	if (ret)
> +		return;
> +
> +	if (UCSI_CCI_CONNECTOR(cci))
> +		ucsi_connector_change(udata->ucsi, UCSI_CCI_CONNECTOR(cci));
> +
> +	if (cci & UCSI_CCI_ACK_COMPLETE && test_bit(ACK_PENDING, &udata->flags))
> +		complete(&udata->complete);
> +	if (cci & UCSI_CCI_COMMAND_COMPLETE &&
> +	    test_bit(COMMAND_PENDING, &udata->flags))
> +		complete(&udata->complete);
> +}
> +
> +static int cros_ucsi_event(struct notifier_block *nb,
> +			   unsigned long host_event, void *_notify)
> +{
> +	struct cros_ucsi_data *udata = container_of(nb, struct cros_ucsi_data, nb);
> +
> +	if (!(host_event & PD_EVENT_PPM))
> +		return NOTIFY_OK;
> +
> +	dev_dbg(udata->dev, "UCSI notification received");
> +	flush_work(&udata->work);
> +	schedule_work(&udata->work);
> +
> +	return NOTIFY_OK;
> +}
> +
> +static int cros_ucsi_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct cros_ec_dev *ec_data = dev_get_drvdata(dev->parent);
> +	struct cros_ucsi_data *udata;
> +	int ret;
> +
> +	udata = devm_kzalloc(dev, sizeof(*udata), GFP_KERNEL);
> +	if (!udata)
> +		return -ENOMEM;
> +
> +	udata->dev = dev;
> +
> +	udata->ec = ec_data->ec_dev;
> +	if (!udata->ec) {
> +		dev_err(dev, "couldn't find parent EC device\n");
> +		return -ENODEV;
> +	}
> +
> +	platform_set_drvdata(pdev, udata);
> +
> +	INIT_WORK(&udata->work, cros_ucsi_work);
> +	init_completion(&udata->complete);
> +
> +	udata->ucsi = ucsi_create(udata->dev, &cros_ucsi_ops);
> +	if (IS_ERR(udata->ucsi)) {
> +		dev_err(dev, "failed to allocate UCSI instance\n");
> +		return PTR_ERR(udata->ucsi);
> +	}
> +
> +	ucsi_set_drvdata(udata->ucsi, udata);
> +
> +	ret = ucsi_register(udata->ucsi);
> +	if (ret) {
> +		ucsi_destroy(udata->ucsi);
> +		return ret;
> +	}
> +
> +	udata->nb.notifier_call = cros_ucsi_event;
> +	return cros_usbpd_register_notify(&udata->nb);

I think you should register notifier before calling ucsi_register().
Otherwise you have a window when the UCSI can attempt to communitcate
with the hardware, but it will not get its notifications.

> +}
> +
> +static int cros_ucsi_remove(struct platform_device *dev)
> +{
> +	struct cros_ucsi_data *udata = platform_get_drvdata(dev);
> +
> +	ucsi_unregister(udata->ucsi);
> +	ucsi_destroy(udata->ucsi);
> +	return 0;
> +}
> +
> +static int __maybe_unused cros_ucsi_suspend(struct device *dev)
> +{
> +	struct cros_ucsi_data *udata = dev_get_drvdata(dev);
> +
> +	cancel_work_sync(&udata->work);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused cros_ucsi_resume(struct device *dev)
> +{
> +	struct cros_ucsi_data *udata = dev_get_drvdata(dev);
> +
> +	return ucsi_resume(udata->ucsi);
> +}
> +
> +static SIMPLE_DEV_PM_OPS(cros_ucsi_pm_ops, cros_ucsi_suspend,
> +			 cros_ucsi_resume);
> +
> +static const struct platform_device_id cros_ec_ucsi_id[] = {
> +	{ "cros-ec-ucsi"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_ec_ucsi_id);
> +
> +static struct platform_driver cros_ucsi_driver = {
> +	.driver = {
> +		.name = DRV_NAME,
> +		.pm = &cros_ucsi_pm_ops,
> +	},
> +	.id_table = cros_ec_ucsi_id,
> +	.probe = cros_ucsi_probe,
> +	.remove = cros_ucsi_remove,
> +};
> +
> +module_platform_driver(cros_ucsi_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("UCSI driver for ChromeOS EC");
> 
> -- 
> 2.44.0.478.gd926399ef9-goog
> 

-- 
With best wishes
Dmitry
