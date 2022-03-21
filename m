Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4143757D0
	for <chrome-platform@lists.linux.dev>; Mon, 21 Mar 2022 15:47:58 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id qx21so30625770ejb.13
        for <chrome-platform@lists.linux.dev>; Mon, 21 Mar 2022 08:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BjjQzcelBwwnS4d36yhGsVN+lSuVcK+I/7pFheIbDzM=;
        b=RW2YjITyGShYGpBczMuYiN3cC+O26Jw7DWg8s24IajgLCQ4UuMCnXZlIxaSMesk7XY
         hoTrUUjW3QcyVVBLJxFwbHzZk7QrST+2xMJXg53zR7z03BAvkE8isAL0dNjRsV4nmQhr
         Voyoq0SwRqeS+5CIyJiqbiYgmRYC26Jbx4XzzyhGOZV1E+KIPrJHQyyl1mbDMa9d/9TZ
         xssiyHBr6xzvIpKjRlnb7vdw5Na8EeLEx84StW5+4jDB4sH4wTfoIuZPaET+6OTPMOoe
         bg/mjOSHx1aCIATQWPwpt5fDzwNH6lwpmFBapozkzcIFUNGqZNWIUe0nT7edhiGxAT5i
         EvuQ==
X-Gm-Message-State: AOAM532DbvtN5qPt95WeSWIbCTae2VTNtg+CFO+fZORyoIVfjjqRTDH4
	Xha5ou6Dpv2EiXekv6OaiBk=
X-Google-Smtp-Source: ABdhPJzqCtE5fkFOXCFcxOIHdOKfzJMEG7hn6xXZViUU/Ej/rG/kJINxuxhg/ic7+tAuhF/oYAgKMg==
X-Received: by 2002:a17:907:7e96:b0:6da:f7ee:4a25 with SMTP id qb22-20020a1709077e9600b006daf7ee4a25mr20829508ejc.436.1647877676402;
        Mon, 21 Mar 2022 08:47:56 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.googlemail.com with ESMTPSA id g13-20020a50bf4d000000b00410d407da2esm8259784edk.13.2022.03.21.08.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Mar 2022 08:47:55 -0700 (PDT)
Message-ID: <09b4b714-4fb5-f2af-5a88-b48cbff35b7d@kernel.org>
Date: Mon, 21 Mar 2022 16:47:54 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/4] dt-bindings: update google,cros-ec-pwm documentation
Content-Language: en-US
To: Fabio Baltieri <fabiobaltieri@chromium.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 chrome-platform@lists.linux.dev, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220321143222.2523373-1-fabiobaltieri@chromium.org>
 <20220321143222.2523373-4-fabiobaltieri@chromium.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220321143222.2523373-4-fabiobaltieri@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/03/2022 15:32, Fabio Baltieri wrote:
> Update google,cros-ec-pwm node documentation to mention the
> google,use_pwm_type property.
> 
> Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> ---
>  .../devicetree/bindings/pwm/google,cros-ec-pwm.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
> index 4cfbffd8414a..2224e8e07029 100644
> --- a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
> @@ -19,6 +19,12 @@ description: |
>  properties:
>    compatible:
>      const: google,cros-ec-pwm
> +
> +  google,use_pwm_type:

Hyphens, not underscores.


Best regards,
Krzysztof
