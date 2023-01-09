Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F78329A5
	for <chrome-platform@lists.linux.dev>; Mon,  9 Jan 2023 11:42:03 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DD49E6602D06;
	Mon,  9 Jan 2023 11:41:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673264515;
	bh=yrs+2HfuiXoGEzozSFsUfZATCSNY0mbpEQlx5omqmIA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NRVLDCFUTwoMzukUNCZ+6dGcaAldNGWH2+IdE5YD1rIJMaW41j4ZclxfjqdePGQmg
	 1uvLnBSJfMe9XRXh/q8qftgKsQPxe8bLloE0iWegGR1WuvsDbHJlY7nv1dYhOAc1PB
	 8NVt2s+ZD4xFcJN/u9z5AYkypYMZnluyoLTnXw9CyHdso5z6I4olWCkSZmOujm/tAD
	 SqbS92z0u5b1kgWHAXu2YHbT6pzRcnWi5yxDXWBiwVIdtVps1TFrbnCG6EteM9kdj0
	 yVWsBe7GKGccev55dYAqUATAPsrbZ9B+nSw2CCee14P/TTdWCX6C4hxuIFjMkLW8AV
	 CZ9LU92gH/Cww==
Message-ID: <2ce47b8f-b08e-222e-1c4c-e2b17c1cb5a6@collabora.com>
Date: Mon, 9 Jan 2023 12:41:51 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v9 8/9] drm/bridge: it6505: Fix Kconfig indentation
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
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
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, dri-devel@lists.freedesktop.org,
 Marek Vasut <marex@denx.de>, Stephen Boyd <swboyd@chromium.org>,
 Xin Ji <xji@analogixsemi.com>, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>, Allen Chen <allen.chen@ite.com.tw>,
 Javier Martinez Canillas <javierm@redhat.com>, Lyude Paul
 <lyude@redhat.com>, =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?=
 <nfraprado@collabora.com>, linux-kernel@vger.kernel.org
References: <20230109084101.265664-1-treapking@chromium.org>
 <20230109084101.265664-9-treapking@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230109084101.265664-9-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 09/01/23 09:41, Pin-yen Lin ha scritto:
> Replace the spaces with tab characters in the Kconfig file.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


