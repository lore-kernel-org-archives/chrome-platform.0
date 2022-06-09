Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C777C
	for <chrome-platform@lists.linux.dev>; Thu,  9 Jun 2022 20:51:16 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id n11so3512746iod.4
        for <chrome-platform@lists.linux.dev>; Thu, 09 Jun 2022 13:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6UkS4SPS1bXVXetBXdzfxgOMHLZzAndl0YdUye+T98U=;
        b=eSlsl2zY7ZApnZxMETMpzAySBo3Vex9UKnd/ppTNOp0FNvyXn9SXJBKvxQh/Y7HTLA
         NU2ehN0HR/f77UBLTAunTpBpwM23reJUBs/YI0aMk+QO/JxN9M37bqH5NyOhzO2Ncnc4
         TPQt/H4vLiqNRQS/gNLTi4pjju/G7NZg4pZuEw84aNAvcCGKnBQ96sQpcAGVS3rMBVyW
         p0co8pSgk3PErIvvta4/PoJj2Q07+gShtdVT0F0BWSi2+GtWCdrsytd8dG2iNpxaAaxZ
         FF92MLXkoRN9tfmDJpRt9YJ0VEgwwXmS7CM1109zQLh3a1cLYHO3P8/8pzhcl2BBMhp5
         MyTw==
X-Gm-Message-State: AOAM531laCgCadqfx4ctOOBr2nDDBum15z1Yu8kB/UcESD7SJqKfbffJ
	QkfOQBgNmPLnf21ecKdv4w==
X-Google-Smtp-Source: ABdhPJwOVwZeLmYAjjuRwTF1mXzjxf7By9LYuIqGnacWdW2E6Un0R5tJzxy5bnVQ5rBRzs4VUQ+xzA==
X-Received: by 2002:a5e:c318:0:b0:669:975b:7d06 with SMTP id a24-20020a5ec318000000b00669975b7d06mr4223204iok.199.1654807875963;
        Thu, 09 Jun 2022 13:51:15 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id b17-20020a026f51000000b0032e71f31487sm9867485jae.31.2022.06.09.13.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 13:51:15 -0700 (PDT)
Received: (nullmailer pid 78588 invoked by uid 1000);
	Thu, 09 Jun 2022 20:51:13 -0000
Date: Thu, 9 Jun 2022 14:51:13 -0600
From: Rob Herring <robh@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Kees Cook <keescook@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Project_Global_Chrome_Upstream_Group@mediatek.com, Enric Balletbo i Serra <enric.balletbo@collabora.com>, weishunc@google.com, Sebastian Reichel <sebastian.reichel@collabora.com>, linux-kernel@vger.kernel.org, Daisuke Nojiri <dnojiri@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, chrome-platform@lists.linux.dev, linux-remoteproc@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Lee Jones <lee.jones@linaro.org>, Prashant Malani <pmalani@chromium.org>
Subject: Re: [PATCH v2 1/9] dt-binding: remoteproc: mediatek: Support
 dual-core SCP
Message-ID: <20220609205113.GA78534-robh@kernel.org>
References: <20220608083553.8697-1-tinghan.shen@mediatek.com>
 <20220608083553.8697-2-tinghan.shen@mediatek.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608083553.8697-2-tinghan.shen@mediatek.com>

On Wed, 08 Jun 2022 16:35:45 +0800, Tinghan Shen wrote:
> The MT8195 SCP co-processor is a dual-core RISC-V MCU.
> 
> Add a new property to reference the sibling core and to assign
> core id to SCP nodes. Also add a new compatile for the driver of
> SCP 2nd core.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../devicetree/bindings/remoteproc/mtk,scp.yaml     | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
