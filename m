Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52A517CB
	for <chrome-platform@lists.linux.dev>; Wed, 12 Oct 2022 08:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7648AC433D6;
	Wed, 12 Oct 2022 08:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665564414;
	bh=/R9Ob8Fp4MMjibVbMARPNpJ7fx/ulbhyejkYZzXC63A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=adiESWYQHkIjM4ea8YcYZVZ8FBCZBEyuASPbIc0+/Cb8xzRdz0rwAH4wTTrYa6LRW
	 5/IhLnOOM9M96R4AL20j2GZ5PQEXH/LiKxfDFTuvbw1vPWAhkHfPFu0e0sFaBDR6aw
	 KHFQG3O4Guf7U6OL7rrcZIFOONRdphnZEizTsj4ak+88UqypuiGuYSw70oKPGWsGiL
	 Ysr+zTOGczlcI6NzosHtPbDl9lGyfgqlct/4X5uoEoPwCKBiVWGVHH8nQYijzs38We
	 Is8MbVdZjUpxtbHauIs2F2Ha+F4rxOYnH25NZKj1q0ssIxoMf7QfmayTMTPjSDdXzW
	 gXt8CYR/WZFhg==
Date: Wed, 12 Oct 2022 16:46:51 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Dan Callaghan <dcallagh@chromium.org>
Cc: chrome-platform@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
	Sami =?iso-8859-1?Q?Ky=F6stil=E4?= <skyostil@chromium.org>,
	Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH v5 1/1] platform/chrome: add a driver for HPS
Message-ID: <Y0Z++9QUAOOUAQrj@google.com>
References: <20221012040918.272582-1-dcallagh@chromium.org>
 <20221012040918.272582-2-dcallagh@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221012040918.272582-2-dcallagh@chromium.org>

On Wed, Oct 12, 2022 at 03:09:18PM +1100, Dan Callaghan wrote:
> ---

It doesn't need a cover letter if the series only has 1 patch in general.
Instead, it could put additional information (and changelogs) after "---".

> diff --git a/drivers/platform/chrome/cros_hps_i2c.c b/drivers/platform/chrome/cros_hps_i2c.c
[...]
> +static int hps_i2c_probe(struct i2c_client *client)
> +{
> +	struct hps_drvdata *hps;
> +	int ret;
> +
> +	hps = devm_kzalloc(&client->dev, sizeof(*hps), GFP_KERNEL);
> +	if (!hps)
> +		return -ENOMEM;
> +
> +	memset(&hps->misc_device, 0, sizeof(hps->misc_device));

The memset can be dropped.  `hps` is z-allocated.

> +	hps->misc_device.parent = &client->dev;
> +	hps->misc_device.minor = MISC_DYNAMIC_MINOR;
> +	hps->misc_device.name = "cros-hps";
> +	hps->misc_device.fops = &hps_fops;
> +
> +	i2c_set_clientdata(client, hps);
> +	hps->client = client;

To be neat, I would prefer to insert a blank line here.

> +	hps->enable_gpio = devm_gpiod_get(&client->dev, "enable", GPIOD_OUT_HIGH);
> +	if (IS_ERR(hps->enable_gpio)) {
> +		ret = PTR_ERR(hps->enable_gpio);
> +		dev_err(&client->dev, "failed to get enable gpio: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = misc_register(&hps->misc_device);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to initialize misc device: %d\n", ret);
> +		return ret;
> +	}
> +
> +	hps_set_power(hps, false);

IIUC, the GPIO will raise to HIGH in the first place, and then fall
to LOW until here.  Is it an expected behavior?  How about gpiod_get()
with GPIOD_OUT_LOW?

> +static int hps_i2c_remove(struct i2c_client *client)
> +{
> +	struct hps_drvdata *hps = i2c_get_clientdata(client);
> +
> +	pm_runtime_disable(&client->dev);
> +	misc_deregister(&hps->misc_device);
> +	hps_set_power(hps, true);

Why does it need to raise the GPIO again when removing the device?
