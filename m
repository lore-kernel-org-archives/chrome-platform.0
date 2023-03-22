Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396652566
	for <chrome-platform@lists.linux.dev>; Wed, 22 Mar 2023 12:17:40 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1D32C66030E7;
	Wed, 22 Mar 2023 12:17:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679487452;
	bh=zyLaVAcmwFmLwUV0plJgDw5kBpsCsQESooHrLa/KQkw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RQgdIjoqCOaCT9TlL0M3x86X4voreu+jUiQ0KB1hqMS3iPwsHgaf33b9o9LFTqoD0
	 Bkkgxcs70ra5QYMLUukVO203726fW3BN/o4hsSfXfEPLba69KgJSUtkM0I/ewAQOR/
	 UuFDxXsGKeG4BixFD9CYVJ3OX/Ul1I7c7Dmsy+rGu8K+SJitrObogFTfjpDvTVoPWT
	 hHw2XUHRwBMLzLTU9XAMaFrVtUajlvCMmgi240nQwuHUdO4SrVZDJafXMJBxwE2gd9
	 CCkEBNnrtd1bZqFjXI2CSDcUMZPHra/aurzGmx+RQG4f8dhHc1HMAh8dErevjIvVID
	 lP53YXUQpADpg==
Message-ID: <18f4da2e-d80b-312b-17a4-824d980e0e82@collabora.com>
Date: Wed, 22 Mar 2023 13:17:29 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v14 06/10] drm/bridge: Remove redundant i2c_client in
 anx7625/it6505
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>
Cc: Xin Ji <xji@analogixsemi.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-acpi@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Lyude Paul <lyude@redhat.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Allen Chen <allen.chen@ite.com.tw>, dri-devel@lists.freedesktop.org,
 Marek Vasut <marex@denx.de>, Stephen Boyd <swboyd@chromium.org>,
 chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20230322104639.221402-1-treapking@chromium.org>
 <20230322104639.221402-7-treapking@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230322104639.221402-7-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 22/03/23 11:46, Pin-yen Lin ha scritto:
> These two drivers embed a i2c_client in their private driver data, but
> only strict device is actually needed. Replace the i2c_client reference
> with a struct device one.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


