Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3AB2C9D
	for <chrome-platform@lists.linux.dev>; Mon,  9 Jan 2023 11:42:04 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B9B0B6602D5A;
	Mon,  9 Jan 2023 11:41:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673264517;
	bh=E2MTjq/4OFb5vzNdgI2DcL1R3XAJqmPECtjVbjF+6gg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DOCqGRSZ2s6d3V9JO36FEkV0mf+J6BfkVSldAtTe5zMbr8rqXw3Zv5o1/v9Tadsdf
	 fJlxe6aTyjo7zYyzNrCHUIVQ00tpMLAn3BMbl/8OBPq5aLjueYZFUIPrYx10ksFtAN
	 HC/fEGA3PPE7Vg2kkwoXbJL840EtlQczT8U4IeJ2AHKdKg8Qxq3K9Yd7YV5+q9Yozt
	 Ekr3sQ7yxPAZbbHvpJmQBDrgQWv7Rh6JuVLvWw+XF61xHCs0bK94GJJnyiP4sUbqEu
	 ipgQWzemPi3lPd0M//FlA6F4n/G7mJTxoLC+zwYfkKRR+l1XmlekrgQBzroJEyyuR3
	 I/UE2jMeEEQcQ==
Message-ID: <dfb20227-a80b-4f80-ed6b-e02d05ae1271@collabora.com>
Date: Mon, 9 Jan 2023 12:41:53 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v9 4/9] dt-bindings: display: bridge: anx7625: Add
 mode-switch support
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
 <nfraprado@collabora.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230109084101.265664-1-treapking@chromium.org>
 <20230109084101.265664-5-treapking@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230109084101.265664-5-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 09/01/23 09:40, Pin-yen Lin ha scritto:
> Analogix 7625 can be used in systems to switch the DP traffic between
> two downstreams, which can be USB Type-C DisplayPort alternate mode
> lane or regular DisplayPort output ports.
> 
> Update the binding to accommodate this usage by introducing a
> data-lanes and a mode-switch property on endpoints.
> 
> Also include the link to the product brief in the bindings.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


