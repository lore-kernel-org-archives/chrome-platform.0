Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872808;
	b=1ETLgkc4iXvYK0DSijQJtmYZJHtkN4KqsbBh/ZJxb6Ua4BDzfzvB3tEuztsuZm8x3CEF
	 RlxDWApG6lF7zHeeQNkD519DQ0xriFKPF+cbYV7mpTTxAqCT40bAOvojD1E9aEgawS4Cp
	 tZBK3UAUPfnlutOoDQ29Vg1kBgfozF3UzM9b0tJtWSz2HKKVuMgMiQdmZeiNqAN7w1dYb
	 cCZ/7RHQ3YLr9D0afp7ha8eUj/vet5dAQVVWuXNeOHDUuOUnlg0pMMoFdEL7/zXApU/Wl
	 0t12GPYGk/r0XJBHmCuoJ1p9iYnwYOKIVD9XCsW0Y8yy0Gq1JiTcnYH5fV9n7Q/Lx9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872808;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=370JADXfW9i0EWeJs1wgZBZqKsihj4K7fewf2qq0vn4=;
	b=Vk8OefHXIRCNm/BzaanbRE4Nim5UdnmOxNQ6+RcU2IPd3IQGU3CTtzbZwq7aan85gFDh
	 VolfTX+FlyaBBp4ZesGFT6m7wOy+zaNmvPtCxEZS8VOGVuj46fZ9vR4uHyyBvzlKFzgnJ
	 4oDmj4Vx674eCqwakPqPBXYKHmccXnQmECSyC90/RCTZqPxkfJWbwseEO0Lt5DC3uL6m+
	 TyWI5dN4DppGOZEwE+98EPzj94vtG7zc8F6wH4r6awadqdpOTYGyhXB9qEz3FVAxukhvH
	 uk5HO5Hwr23V+KIjciR5k+ajkc7jgCjuLMcc7H4/5ip/0exTLEN57ADKrh2gK6tj53Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RUUkonw4;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60761606A33E
	for <chrome-platform@lists.linux.dev>; Thu,  5 Nov 2026 10:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60761606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RUUkonw4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793872807; x=1825408807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7+Ug2Y9DgI9SCO4BXtWTniKjKlY+RxuQM71CwBaxMws=;
  b=RUUkonw4Vpd3QV6HVdYgfHs544n62CsxQf8JGMGUT3zgObVx8Hb80JVH
   mKNfEhiIUXHXlWBXZnx2pjMgRSb1JH6AQfVhm8wVYzMWubQztXoAYdffy
   sXeBYOKmaG/rABi6ddG5koaMzFFr60xIKNbwb/+Ke7c5k57DssS3zSR2a
   C4FXYHI81EbDJztVGBI9lMjNHdnMThYrKUQh3YwX0WrhZ3zeH8L7s+KI2
   EOkk4slLCougD9bPJfjdty9BogJVD7Rh8h7OhDe+e9Kht4PUjRtRjk6nZ
   EXulMPy9aCKfWcpkfMXQX5CgR0xL2B/McuLFE1fDuWhLUEGcBdnkf2TYt
   Q==;
X-CSE-ConnectionGUID: VmOLgLS7TyiTFc93xSz+WA==
X-CSE-MsgGUID: Trli0XhCQguSvWW/QofefQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2747326"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2747326"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 02:00:06 -0800
X-CSE-ConnectionGUID: +1AEHJ8uS9GaR+4rSJOonw==
X-CSE-MsgGUID: z22zOkOUTlmfgKu1wErqGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7377686"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 02:00:03 -0800
Date: Thu, 5 Nov 2026 12:00:00 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Satyam Gupta <sgsatyam@google.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Gwendal Grignou <gwendal@chromium.org>, linux-iio@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: cros_ec: Use platform sensor_num to unregister FIFO
 callback
Message-ID: <auxToA8qgIa7vR7k@ashevche-desk.local>
References: <20261105073107.172121-1-sgsatyam@google.com>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105073107.172121-1-sgsatyam@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 05, 2026 at 07:31:07AM +0000, Satyam Gupta wrote:
> cros_ec_sensors_core_register() registers the FIFO callback for the
> sensor number found in the platform data. The matching cleanup action,
> cros_ec_sensors_core_clean(), reads the number back from
> st->param.info.sensor_num instead.
> 
> st->param is the EC host command buffer. Drivers fill it in under
> cmd_lock before each command, while the cleanup action reads it without
> that lock. It is also set only for physical sensors. If the field holds
> another value when the device is unbound, the cleanup clears the wrong
> slot and leaves the callback in place, still pointing to the iio_dev
> that is about to be freed.
> 
> Use the platform data in the cleanup action too, so it always
> unregisters the slot that cros_ec_sensors_core_register() registered.

Sounds like a Fixes tag is good to have.

> Signed-off-by: Satyam Gupta <sgsatyam@google.com>
> ---
> Tested on an Android desktop device (6.18, Intel) with two
> accelerometers and a lid angle sensor: each sensor was unbound and
> bound 20 times while a reader kept EC commands in flight, then FIFO
> samples were streamed. Also tested on a ChromeOS device (6.6) with an
> RGB light sensor, together with downstream changes to that driver.
> 
>  drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c | 8 ++++----
> @@ -216,11 +216,11 @@ static void cros_ec_sensors_core_clean(void *arg)
>  	struct platform_device *pdev = (struct platform_device *)arg;
>  	struct cros_ec_sensorhub *sensor_hub =
>  		dev_get_drvdata(pdev->dev.parent);
> -	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
> -	struct cros_ec_sensors_core_state *st = iio_priv(indio_dev);
> -	u8 sensor_num = st->param.info.sensor_num;
> +	struct cros_ec_sensor_platform *sensor_platform =
> +		dev_get_platdata(&pdev->dev);

With context I see it would be better written in the following form:

	struct platform_device *pdev = (struct platform_device *)arg;
	struct device *dev = &pdev->dev;
	struct cros_ec_sensorhub *sensor_hub = dev_get_drvdata(dev->parent);
	struct cros_ec_sensor_platform *pdata = dev_get_platdata(dev);

> -	cros_ec_sensorhub_unregister_push_data(sensor_hub, sensor_num);
> +	cros_ec_sensorhub_unregister_push_data(sensor_hub,
> +					       sensor_pdata->sensor_num);

	cros_ec_sensorhub_unregister_push_data(sensor_hub, pdata->sensor_num);

>  }

-- 
With Best Regards,
Andy Shevchenko


