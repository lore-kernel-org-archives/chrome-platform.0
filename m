Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B35F57D0
	for <chrome-platform@lists.linux.dev>; Mon, 21 Mar 2022 15:46:52 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id r13so30705449ejd.5
        for <chrome-platform@lists.linux.dev>; Mon, 21 Mar 2022 08:46:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gZCh1iB4XHHU1h7mdXi3Ca3bYSPa4vUssLjec7XO48A=;
        b=I+ncvKFF+Rp5gqyfPZ6bPlAVe14ypBbrfalHoS/yPPiFBZTOdO56v+0GOtn/AMg61u
         pPh9myKOt/riqN0T3/rRJuY1nV3GnWksPl9Ekq0kfzeOWYouFPke5OE2It2JS/RLuUkr
         ZbsjJ0b/smQ9Sb5uy8ZZl6vcbhhVwnFYhdlEldx+etAbi1OV+i/d0iNapxRYBh7y18UZ
         gnT4eKTvrQJ1hOp7lQK9CugyEkS5GlqnWo3h0tZWtWV+CDw0uSL44Z0g6bzuKxGiZt1U
         8pYXuRaPR23IwXgAmh6xYauMnv8izGidmllkIjcow02tWWCqxYJbJKlG/0qNtQzoZDl8
         Dv5w==
X-Gm-Message-State: AOAM531efgWxi+UfsH13/Ug7yFA036fy+Jg1YSoXiyYqgt4Wv2Ra6u0V
	CAI73YewTy+Cm4XB9CxnM2I=
X-Google-Smtp-Source: ABdhPJzgzGN3zjVLHzh64VLoEtnosD8ElRHmrTzYKpnrQezbHsIkRV5Uk8Ejf0hdwVkYSVGZweSluA==
X-Received: by 2002:a17:907:724d:b0:6df:ff4c:8941 with SMTP id ds13-20020a170907724d00b006dfff4c8941mr6699161ejc.10.1647877610712;
        Mon, 21 Mar 2022 08:46:50 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.googlemail.com with ESMTPSA id hb6-20020a170907160600b006dff6a979fdsm2269933ejc.51.2022.03.21.08.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Mar 2022 08:46:50 -0700 (PDT)
Message-ID: <2942ea7a-3e23-7df1-daff-c266a82682fb@kernel.org>
Date: Mon, 21 Mar 2022 16:46:49 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/4] dt-bindings: add mfd/cros_ec definitions
Content-Language: en-US
To: Fabio Baltieri <fabiobaltieri@chromium.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 chrome-platform@lists.linux.dev, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220321143222.2523373-1-fabiobaltieri@chromium.org>
 <20220321143222.2523373-2-fabiobaltieri@chromium.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220321143222.2523373-2-fabiobaltieri@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/03/2022 15:32, Fabio Baltieri wrote:
> Add a dt-bindings include file for cros_ec devicetree definition, define
> a pair of special purpose PWM channels in it.
> 
> Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> ---
>  include/dt-bindings/mfd/cros_ec.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 include/dt-bindings/mfd/cros_ec.h
> 
> diff --git a/include/dt-bindings/mfd/cros_ec.h b/include/dt-bindings/mfd/cros_ec.h
> new file mode 100644
> index 000000000000..e02414eae622
> --- /dev/null
> +++ b/include/dt-bindings/mfd/cros_ec.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */

Same license as for bindings (GPL-2.0-only OR BSD-2-Clause), unless you
cannot (is it a derivative work?).


Best regards,
Krzysztof
