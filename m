Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD134C9A
	for <chrome-platform@lists.linux.dev>; Fri, 15 Jul 2022 21:40:17 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id d16so8399838wrv.10
        for <chrome-platform@lists.linux.dev>; Fri, 15 Jul 2022 14:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=J6BSJtpNWZ2Z1cUANVaPa8k/01zDYr+V4xutkYf54NQ=;
        b=EiZ/Jmkz5DdkNRwJGtK9gVoZ3BcJ8ejMk3yeeSneUGJiCM2csICY8AdW61vGapRVcY
         UVEs2lvDUtUmSWhTy5Riy+DiODr1rNBvvUK4wbrRLT25XjOXefr0/051txgAy4PBorpi
         GKNcSgswr6pLYwYHFSVzvB34JMrg+jT1ikpzno4L0ZOP0gQXJvWnMhCAGwkPbk+zk4T6
         NHUHFy/WsEuLp1Gd3GTwIoolQEUdfvT1tqqUGbfp80W8fFmVfSTmouc1u2k89r7uyeR9
         nYK4zK2wqlmEsLRHEwqRtcub6mC9oo2ROYXHqnHla+d+LumXFIkgFPThdJfozfzXSQFb
         VGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=J6BSJtpNWZ2Z1cUANVaPa8k/01zDYr+V4xutkYf54NQ=;
        b=jkICjMkZZwbGUhIn7YlE50chH1hdC9DA1C5MWGt9RxyxbK0OqxXUICpPSFauBRLIpv
         IhDKUQ4f5rp7mFc8jsWvdMB7aqejYMUQzdLzFM4VZijFtkqegwFeGlU3ARlGoHIB/66L
         4l1dJxf9IA9XSa9Y+p2yqCSQ8NG3jMFoNCE87qJ8/0Of0+pHuLCmVCpMOd9apWk/uJo4
         QiQ2QmHL4Gm2YIrSsgCNF7Epxr8/aZnX8A6mnn3F2F9M2rMf+z4RCTHYAg7NANGiZa96
         ANqwrooLL4VsoFPVhC8wjjEXShpq+++AaTRcKx3y3hgPZzic9JCR+T9vFipfUYUtFFjE
         QpFw==
X-Gm-Message-State: AJIora/u3USfCzOKZt2hnq/Ehr6ZTiImfABRYoF+dy+MR1hhOUslBjmd
	JUhVCTTnHVYCrp3KsuPZ+JzBVA==
X-Google-Smtp-Source: AGRyM1vl55wMLC6v4FE7361A1EgLL5IjuxGDiU+pOGyn8ZoWrdHGmzM+ZMQkW7lv66vojAGIB7e/MQ==
X-Received: by 2002:a5d:4e04:0:b0:21d:6ec3:38a2 with SMTP id p4-20020a5d4e04000000b0021d6ec338a2mr14182586wrt.362.1657921215858;
        Fri, 15 Jul 2022 14:40:15 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:a223:f4b3:40c9:43fa? ([2a05:6e02:1041:c10:a223:f4b3:40c9:43fa])
        by smtp.googlemail.com with ESMTPSA id j27-20020a05600c1c1b00b0039c4ba160absm17678280wms.2.2022.07.15.14.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 14:40:15 -0700 (PDT)
Message-ID: <563e92de-68aa-7382-2564-c1ccc270c571@linaro.org>
Date: Fri, 15 Jul 2022 23:40:11 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 06/15] thermal: qcom: qcom-spmi-adc-tm5: convert to IIO
 fwnode API
Content-Language: en-US
To: =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>, openbmc@lists.ozlabs.org,
 linux-imx@nxp.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-iio@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-arm-msm@vger.kernel.org
Cc: Gwendal Grignou <gwendal@chromium.org>,
 Jonathan Cameron <jic23@kernel.org>, Saravanan Sekar <sravanhome@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Tali Perry <tali.perry1@gmail.com>,
 Thara Gopinath <thara.gopinath@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Benjamin Fair <benjaminfair@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Patrick Venture
 <venture@google.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Benson Leung <bleung@chromium.org>, Nancy Yuen <yuenn@google.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Zhang Rui <rui.zhang@intel.com>, Linus Walleij <linus.walleij@linaro.org>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Cai Huoqing <cai.huoqing@linux.dev>, Avi Fishman <avifishman70@gmail.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Guenter Roeck <groeck@chromium.org>, Paul Cercueil <paul@crapouillou.net>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Andy Gross
 <agross@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Haibo Chen <haibo.chen@nxp.com>, Jishnu Prakash <quic_jprakash@quicinc.com>
References: <20220715122903.332535-1-nuno.sa@analog.com>
 <20220715122903.332535-7-nuno.sa@analog.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220715122903.332535-7-nuno.sa@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/07/2022 14:28, Nuno Sá wrote:
> Make usage of the new firmware agnostic API
> 'devm_of_iio_channel_get_by_name()' to get the IIO channel.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

> ---
>   drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> index d9c9c975f931..0b8543c627f0 100644
> --- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> +++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> @@ -825,7 +825,8 @@ static int adc_tm5_get_dt_channel_data(struct adc_tm5_chip *adc_tm,
>   	}
>   	channel->adc_channel = args.args[0];
>   
> -	channel->iio = devm_of_iio_channel_get_by_name(adc_tm->dev, node, NULL);
> +	channel->iio = devm_fwnode_iio_channel_get_by_name(adc_tm->dev,
> +							   of_fwnode_handle(node), NULL);
>   	if (IS_ERR(channel->iio)) {
>   		ret = PTR_ERR(channel->iio);
>   		if (ret != -EPROBE_DEFER)


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
