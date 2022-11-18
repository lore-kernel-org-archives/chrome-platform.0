Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B15520EE
	for <chrome-platform@lists.linux.dev>; Fri, 18 Nov 2022 05:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ECFAC433C1;
	Fri, 18 Nov 2022 05:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668750263;
	bh=8UNw72vtePNuy20elDajpRx7jkdEzL8qsaeAcoAR8ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fDq8eAj3Nll5jTlojaUiSRDcXaiN7HkW8LUDs34SL9AtYFtqvI9v9Y0Zo2kl1yxEH
	 L9BkmmbObqF6HlyNvtcB1Obz1///wLymPuEdqjA99tDqDj2TRXlbCvlFHRlwkMSD72
	 q1qlplhb4dWNFX6F3HMBROkcYdpQfAvNj+0vIf3qFJXWevy1RoVoDEru9oWC4vb+Dx
	 g8c/98vF+Gm83JNxF749L/INMVgWoDijb26uj7qT0YIPv8FwrpxhyVIjo6q3SBCcB5
	 NhSndHJ7nKDg3JBS2nlu/vHgIuk/Bf+JR8L1BSIUlMyhAoXLrisoFX0Ds8MpBNcq/q
	 OZitTh9v8iHAg==
Date: Fri, 18 Nov 2022 13:44:19 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Mark Hasemeyer <markhas@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Raul Rangel <rrangel@chromium.org>,
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v7 3/3] platform/chrome: cros_ec_uart: Add DT enumeration
 support
Message-ID: <Y3cbswXxTKWhMjKT@google.com>
References: <20221117114818.v7.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
 <20221117114818.v7.3.Ie23c217d69ff25d7354db942613f143bbc8ef891@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117114818.v7.3.Ie23c217d69ff25d7354db942613f143bbc8ef891@changeid>

On Thu, Nov 17, 2022 at 11:48:48AM -0700, Mark Hasemeyer wrote:
> @@ -392,6 +393,12 @@ static int __maybe_unused cros_ec_uart_resume(struct device *dev)
>  static SIMPLE_DEV_PM_OPS(cros_ec_uart_pm_ops, cros_ec_uart_suspend,
>  			 cros_ec_uart_resume);
>  
> +static const struct of_device_id cros_ec_uart_of_match[] = {
> +	{ .compatible = "google,cros-ec-uart" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, cros_ec_uart_of_match);

It would need a guard for checking CONFIG_OF.  Similar to what
`cros_ec_uart_acpi_id` does.

> @@ -405,6 +412,7 @@ static struct serdev_device_driver cros_ec_uart_driver = {
>  	.driver	= {
>  		.name	= "cros-ec-uart",
>  		.acpi_match_table = ACPI_PTR(cros_ec_uart_acpi_id),
> +		.of_match_table = cros_ec_uart_of_match,

It would need be wrapped by `of_match_ptr()`.  Similar to what
`ACPI_PTR()` does.
