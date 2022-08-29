Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825E65C80
	for <chrome-platform@lists.linux.dev>; Mon, 29 Aug 2022 17:40:25 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id z3-20020a17090abd8300b001fd803e34f1so6801412pjr.1
        for <chrome-platform@lists.linux.dev>; Mon, 29 Aug 2022 10:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=s6bYNpML21qzhk9c6rS49HOi5hkJ5sJySwf5mxEe49g=;
        b=rRgo00unpZZnp/iKatcDw2P9q6aBOTa3VIJ41hGdq2Ue/i2CtTN2avO+BGFzPm7ldJ
         Q4fcuykOqMRAXY15s1bCTM3iY+m2zAG0mUi09ztJOxDuEVlbao5Vu0ZROdDmba5HZX9z
         mHPC7Jp3kLqFIbD03qnGdPz08YXFSVzC23jN911UhzBB9JMn0vPw9BKRahCzStPcwpJL
         vAL6DWNqiIGoRocETe742dBQeMUzBWmIX9gHDnCjreZ718lu4bVA8ktqsjs9QMNp8WVb
         I3YkJ71m+b5yYqo/m3O5I9esu+OgU2Cw/ZIRjR2ssuxrgD3GVRjq6S7inlqGU5kDWqvQ
         gd4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=s6bYNpML21qzhk9c6rS49HOi5hkJ5sJySwf5mxEe49g=;
        b=uwGOvaf/8QgzcKrVv3+Fa8R+WXwXheTGRe/C28STgUaspYHAw17k79hNdHzB03B7uN
         X1Tg33ZGMG+gNFdVygD7PeG4IXHx2CxoOzVkmXJcilqPZVj9xEOWjG838u2gyVnshk2/
         nO3MpldDDRLfXmM4XysWbOS4T9NacvKl0+dga2/pxcePbnt6V0NYeJroQedR1ro77obi
         wKF6RXXy+9O6DcHIISe3oRh2vDlfK2awCV8lw4yLfZEoOuUSPGtZae95Ufv98LsBnSMj
         RLMbUcfy+fFLersz68AJvLFg3jCaVegvw7K//2/DMwpkeI9YPiOcQSl3XstduEuFp99X
         8UIQ==
X-Gm-Message-State: ACgBeo127OeKwIcdKE3Le4rhgr8ucPMW+fx37wZqZdTGJqbtfBlXWU64
	1HJmWuNZmvYX2w7ccvDJTnwYGA==
X-Google-Smtp-Source: AA6agR5A1l3owXOrDlGd71lrBje/h4zCkOyCf84EtysjEUjXD5K1Zz+Ho52D2qgBJcB1fk3TqmErmw==
X-Received: by 2002:a17:902:9b85:b0:16e:cc02:b9b2 with SMTP id y5-20020a1709029b8500b0016ecc02b9b2mr17622412plp.74.1661794824904;
        Mon, 29 Aug 2022 10:40:24 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id r2-20020aa79882000000b0053826ec2a68sm3224505pfl.191.2022.08.29.10.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 10:40:23 -0700 (PDT)
Date: Mon, 29 Aug 2022 11:40:21 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Prashant Malani <pmalani@chromium.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	weishunc@google.com
Subject: Re: [PATCH v2 2/9] remoteproc: mediatek: Support hanlding scp core 1
 wdt timeout
Message-ID: <20220829174021.GA2264818@p14s>
References: <20220608083553.8697-1-tinghan.shen@mediatek.com>
 <20220608083553.8697-3-tinghan.shen@mediatek.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608083553.8697-3-tinghan.shen@mediatek.com>

Hi Tinghan,

I have started reviewing this set and I expect comments to be spread out over a few
days.  I will tell you when I am done.

Please see below for comments...

On Wed, Jun 08, 2022 at 04:35:46PM +0800, Tinghan Shen wrote:
> MT8195 SCP is a dual-core processor. The SCP core 1 watchdog timeout
> interrupt uses the same interrupt line of SCP core 0 watchdog timeout
> interrupt.
> 
> Add support for handling SCP core 1 watchdog timeout interrupt in the
> SCP IRQ handler.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  drivers/remoteproc/mtk_common.h |  4 ++++
>  drivers/remoteproc/mtk_scp.c    | 27 ++++++++++++++++++++++++++-
>  2 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index ea6fa1100a00..73e8adf00de3 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -54,6 +54,10 @@
>  #define MT8192_CORE0_WDT_IRQ		0x10030
>  #define MT8192_CORE0_WDT_CFG		0x10034
>  
> +#define MT8195_SYS_STATUS		0x4004
> +#define MT8195_CORE0_WDT		BIT(16)
> +#define MT8195_CORE1_WDT		BIT(17)
> +
>  #define MT8195_L1TCM_SRAM_PDN_RESERVED_RSI_BITS		GENMASK(7, 4)
>  
>  #define SCP_FW_VER_LEN			32
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 47b2a40e1b4a..3510c6d0bbc8 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -212,6 +212,31 @@ static void mt8192_scp_irq_handler(struct mtk_scp *scp)
>  	}
>  }
>  
> +static void mt8195_scp_irq_handler(struct mtk_scp *scp)
> +{
> +	u32 scp_to_host;
> +
> +	scp_to_host = readl(scp->reg_base + MT8192_SCP2APMCU_IPC_SET);
> +
> +	if (scp_to_host & MT8192_SCP_IPC_INT_BIT) {
> +		scp_ipi_handler(scp);
> +
> +		/*
> +		 * SCP won't send another interrupt until we clear
> +		 * MT8192_SCP2APMCU_IPC.
> +		 */
> +		writel(MT8192_SCP_IPC_INT_BIT,
> +		       scp->reg_base + MT8192_SCP2APMCU_IPC_CLR);
> +	} else {
> +		if (readl(scp->reg_base + MT8195_SYS_STATUS) & MT8195_CORE1_WDT) {
> +			writel(1, scp->reg_base + MT8195_CORE1_WDT_IRQ);
> +		} else {
> +			writel(1, scp->reg_base + MT8192_CORE0_WDT_IRQ);
> +			scp_wdt_handler(scp, scp_to_host);

Why is scp_wdt_handler() not called when CORE1 signals a watchdog failure?  If
this is the intended behaviour there is no way for anyone but you to know that
it is the case.  

> +		}
> +	}
> +}
> +
>  static irqreturn_t scp_irq_handler(int irq, void *priv)
>  {
>  	struct mtk_scp *scp = priv;
> @@ -961,7 +986,7 @@ static const struct mtk_scp_of_data mt8192_of_data = {
>  static const struct mtk_scp_of_data mt8195_of_data = {
>  	.scp_clk_get = mt8195_scp_clk_get,
>  	.scp_before_load = mt8195_scp_before_load,
> -	.scp_irq_handler = mt8192_scp_irq_handler,
> +	.scp_irq_handler = mt8195_scp_irq_handler,
>  	.scp_reset_assert = mt8192_scp_reset_assert,
>  	.scp_reset_deassert = mt8192_scp_reset_deassert,
>  	.scp_stop = mt8195_scp_stop,
> -- 
> 2.18.0
> 
