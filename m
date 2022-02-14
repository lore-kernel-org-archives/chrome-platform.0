Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CFB7A
	for <chrome-platform@lists.linux.dev>; Mon, 14 Feb 2022 15:22:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: kholk11)
	with ESMTPSA id B9F721F43C7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1644852118;
	bh=++yhPFmxmu7cGPsZh0XYgN78QVE2RIZcqQXV+giWu/g=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=b8ErAXCrUOAmvdnYHnh9/TxFOeLgasc/OLxHbRMM1zQ/zlxEzejaSK1qeTdyYD4Hl
	 VZlYXyxVjnI4DZ/Xh055bjRtWNKDpG1G93djseSI44c1eklumetK6NNzTm1iUC2Fr7
	 oYzqii2rNUiKLEcbUu7h6ECBL92PPGGWR+BbTTo2REQGJdEzOPgGtaHjRVSpg25Dsr
	 YqQ5hCOcAqY2fBfrt8YAhUJogmiZS8fges/P8ZXf/9Rqm1S41LYpxSokBnUKwMjtzv
	 FukrgWTubzRznrWKmqjJ+xQfIMZM6EMidHbKXoi9aSSFI+wZHKDTf2HRuMwjwsnNvv
	 V5za4SkH7koqA==
Message-ID: <5aacbf47-9ab5-d1d7-cdde-d338d531bc7b@collabora.com>
Date: Mon, 14 Feb 2022 16:21:54 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 2/4] arm64: dts: mt8183: align Google CROS EC PWM node
 name with dtschema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Douglas Anderson <dianders@chromium.org>,
 devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
 <20220214081916.162014-3-krzysztof.kozlowski@canonical.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220214081916.162014-3-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 14/02/22 09:19, Krzysztof Kozlowski ha scritto:
> dtschema expects PWM node name to be a generic "pwm".  This also matches
> Devicetree specification requirements about generic node names.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> index 8f7bf33f607d..2d7a193272ae 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> @@ -92,7 +92,7 @@ volume_up {
>   };
>   
>   &cros_ec {
> -	cros_ec_pwm: ec-pwm {
> +	cros_ec_pwm: pwm {
>   		compatible = "google,cros-ec-pwm";
>   		#pwm-cells = <1>;
>   		status = "disabled";

