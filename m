Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59287A
	for <chrome-platform@lists.linux.dev>; Wed, 23 Feb 2022 00:05:25 +0000 (UTC)
Received: from [185.156.123.69] (helo=phil.sntech)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1nMeYp-0006wl-RD; Wed, 23 Feb 2022 00:27:11 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-mediatek@lists.infradead.org,
	Douglas Anderson <dianders@chromium.org>,
	Lee Jones <lee.jones@linaro.org>,
	linux-pwm@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-rockchip@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Guenter Roeck <groeck@chromium.org>,
	linux-kernel@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: (subset) [PATCH 0/4] mfd/pwm: dt-bindings: google, cros-ec: include generic pwm schema
Date: Wed, 23 Feb 2022 00:27:08 +0100
Message-Id: <164557235424.1264579.14486504733557463529.b4-ty@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 14 Feb 2022 09:19:12 +0100, Krzysztof Kozlowski wrote:
> DTS patches are independent. Not tested, but I really hope no downstream kernel
> depends on pwm node naming... If it does, please change it to compatible. :)
> 
> Best regards,
> Krzysztof
> 
> Krzysztof Kozlowski (4):
>   dt-bindings: pwm: google,cros-ec: include generic pwm schema
>   arm64: dts: mt8183: align Google CROS EC PWM node name with dtschema
>   arm64: dts: qcom: align Google CROS EC PWM node name with dtschema
>   arm64: dts: rk3399: align Google CROS EC PWM node name with dtschema
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: rk3399: align Google CROS EC PWM node name with dtschema
      commit: 474a84be692d893f45a54b405dcbc137cbf77949

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
