Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D832D3226
	for <chrome-platform@lists.linux.dev>; Wed,  6 Apr 2022 21:16:11 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id y6so3104555plg.2
        for <chrome-platform@lists.linux.dev>; Wed, 06 Apr 2022 14:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tJyA8Psl3YHMPqRVK9xE2ZJSKTmC/2/5ZzNk4f8mImo=;
        b=Bl0mLNt+vWjiKOe66L4+QBLhF2XVQ6jtKWOoPUdu1zRU48S2QnOdJF7cVgpslyEtoS
         0NBNzuSwCaREZJ9nt0h9xV0pRTIKhb3B5qQiOVvluwtnIv5yLUx8T3jRxFTX63SdEqKF
         LMpGbdoO5VSu0NDV3yun66sPc2uQ9scmBchZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tJyA8Psl3YHMPqRVK9xE2ZJSKTmC/2/5ZzNk4f8mImo=;
        b=RTlOLd5XHPbv4UsVZw1a+XNuLONQkIsy56lyASuhlN1qbGLYI+H4aYq43lWX9OghRQ
         NbPK7BQjHyaBZbtXbkNsSEkPmp69a1rTISKt/4k6/fPV/7QodMbyo75JJLus5RyCPWJE
         Qda6B//eSwRIn3lH0x2Xx8kwpXvQY/aV7X7Ly146KqWR0gwFVp4NYdVJKzyVpARQL7GL
         n0wqQQDj00kIITS+ewzVhlkBW7W77VtKHiw16C9M/LieK0Fb3QpclUfmyNBZ3rZtqdCY
         D7uP8mkCllQrY95zXxTLduhIps7UI69uZ47mE2ZtpzIerutwZz5EVEZ0n78GguALnebl
         jmHg==
X-Gm-Message-State: AOAM5324YbBkOKTkZE4leGin5hqWyt3q61x1NaDhLDrd1dd+H0rcTeKm
	pkHJGpQWe4XMnd6JlJFyWmpxEw==
X-Google-Smtp-Source: ABdhPJwdAJPWKqrvBsZQfH7MXUEMK0KiWte+EpNNHaFtUte3M51uejqFxyfwibKpFuzB6N4Gi4dT1w==
X-Received: by 2002:a17:902:b941:b0:14d:af72:3f23 with SMTP id h1-20020a170902b94100b0014daf723f23mr10677730pls.6.1649279771300;
        Wed, 06 Apr 2022 14:16:11 -0700 (PDT)
Received: from chromium.org (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id 207-20020a6217d8000000b004fdd5af8885sm19926585pfx.22.2022.04.06.14.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 14:16:10 -0700 (PDT)
Date: Wed, 6 Apr 2022 21:16:09 +0000
From: Prashant Malani <pmalani@chromium.org>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Check for EC driver
Message-ID: <Yk4DGZfpYbK8dofL@chromium.org>
References: <20220404041101.6276-1-akihiko.odaki@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220404041101.6276-1-akihiko.odaki@gmail.com>

Hi Akihiko,

Thanks for the patch.

On Apr 04 13:11, Akihiko Odaki wrote:
> The EC driver may not be initialized when cros_typec_probe is called,
> particulary when CONFIG_CROS_EC_CHARDEV=m.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  drivers/platform/chrome/cros_ec_typec.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index 4bd2752c0823..7cb2e35c4ded 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -1084,6 +1084,9 @@ static int cros_typec_probe(struct platform_device *pdev)
>  	}
>  
>  	ec_dev = dev_get_drvdata(&typec->ec->ec->dev);
> +	if (!ec_dev)
> +		return -EPROBE_DEFER;
> +

Just a quick check: are you still seeing this issue with 5.18-rc1, which
contains a null check for the parent EC device [1] ?

Thanks,

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/platform/chrome?id=ffebd90532728086007038986900426544e3df4e
