Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79253FDF
	for <chrome-platform@lists.linux.dev>; Wed, 15 Jun 2022 22:28:33 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id l4so11585057pgh.13
        for <chrome-platform@lists.linux.dev>; Wed, 15 Jun 2022 15:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=8/weqrWLdTCxYp+xRg9dVyfKZZLo+VyTWNnyjrQ9VzQ=;
        b=DNfSC2OQC20pNMiFXxu7jTPTLrLEPeQrh+SAy/0Q1mA77E3PnvWxQmtQP8/jvU5Py2
         Gi/3Tx0sxP6kVTRl38ygQTvgij8+U23PmlJFqmCUJJHrq9Hz1dib1PFqsPxebZU+YYOv
         3AaV84lbm1RzqTxtGuBNS93KelCn0Kd3xlXw43QrL+6P3tcwCaKstH6FYrmP5IY/jVVw
         KaXxmqm1qExb+ivFCF8ewVJsGJXEeQ+SDcZcqfABuGojOZGy0kEBFUDtp7fucIWSLdQj
         2LIIgjzAPAgH2vgoygfHlk1Zb3CHnOd2jY97tjT9wfqj+mCfX1Gh/qM/TfhH3Q+bcn+K
         2lmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8/weqrWLdTCxYp+xRg9dVyfKZZLo+VyTWNnyjrQ9VzQ=;
        b=LP1Bq/wVnEuGFy1Mk69ODHEiDTLtuulSeNbECOmSCPSSJk49VDXJc3RmRqqIrPheMO
         5owe+9F5NiECXH7mocTuUaoJeC0MJTrmLQv4H2Y70nWFD0jBSWX+SG0hoUqcEWvWz5kI
         DxdAjcsCHM6QhXyViBNzu8lIu5K8jMyQKk0k0X9CppNGvNLd8jjj7ZvdufoTz2TQ7Y1l
         o4/+bkBWhXRJ7ptIRpwvLbZO244ghyBrCZxVYtmcm3iMmWBxwuJX6NIF+h3MU9DkGiix
         QmehEHJaA291Ti6bIN1n90dix6urpBFG/db9jPzS4i3IqNIpFlJdJ3agURCWXKlbVZEr
         7zVw==
X-Gm-Message-State: AJIora/DR9sctlekhsiTBoTXQZ8ga3tWbl4HNsD8u7245wSIs/CBJD0m
	Wo3v3fHPTu/Z2cTRRtDGEpT69oC/s2NNmwKG
X-Google-Smtp-Source: AGRyM1sOMaKdIw9hmLLTrY/C7UCLm3+pdaat8cUZjTXdT1K47ax0eQQnPwBc9fefe8un8iuDBsUjhg==
X-Received: by 2002:a05:6a00:4504:b0:51b:f04e:a130 with SMTP id cw4-20020a056a00450400b0051bf04ea130mr1806302pfb.52.1655332113127;
        Wed, 15 Jun 2022 15:28:33 -0700 (PDT)
Received: from google.com ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id g18-20020a170902d1d200b0016782c55790sm117330plb.232.2022.06.15.15.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 15:28:32 -0700 (PDT)
Date: Wed, 15 Jun 2022 23:28:29 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	"Dustin L. Howett" <dustin@howett.net>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Prashant Malani <pmalani@chromium.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	weishunc@google.com
Subject: Re: [PATCH v1 15/15] mfd: cros_ec: Add SCP core 1 as a new CrOS EC
 MCU
Message-ID: <YqpdDeD5DA5byI0B@google.com>
References: <20220601112201.15510-1-tinghan.shen@mediatek.com>
 <20220601112201.15510-16-tinghan.shen@mediatek.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220601112201.15510-16-tinghan.shen@mediatek.com>

On Wed, 01 Jun 2022, Tinghan Shen wrote:

> MT8195 System Companion Processors(SCP) is a dual-core RISC-V MCU.
> Add a new cros feature id to represent the SCP 2nd core.
> 
> The 1st core is referred to as 'core 0', and the 2nd core is referred
> to as 'core 1'.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  drivers/mfd/cros_ec_dev.c                      | 5 +++++
>  include/linux/platform_data/cros_ec_commands.h | 2 ++
>  include/linux/platform_data/cros_ec_proto.h    | 1 +
>  3 files changed, 8 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
