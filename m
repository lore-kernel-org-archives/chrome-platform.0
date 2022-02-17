Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E14938F4
	for <chrome-platform@lists.linux.dev>; Thu, 17 Feb 2022 02:22:00 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id p23so3742129pgj.2
        for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 18:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=l2wDoQKYuNxljocz4UAEvWSyuBrgmqvYiOg3RhZ22sY=;
        b=SU/DICxPj/U3ZSlhmSelDtgozNYgEtWejBOTojQQ7I3RSnCuaa0dLkMd/sb/Hhu5if
         XaDrZReyDf4qPeW2q2hTxFRCvrMSWKMbJy7I3XrXKwWlnmVIpK+oqNZNA7FR0w/P0C38
         r7GdHdhLYXdE0NhwfNrgnFm+n2jBqJEWB9EIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l2wDoQKYuNxljocz4UAEvWSyuBrgmqvYiOg3RhZ22sY=;
        b=WmlUBBX3CR2mh7ARXT1zCEg7Qlc8D9qOAhRBhlQyDkelbUuWbJSM4ORrEX+58cpVdp
         2NZJRcxr0R5WoGE5/E9kkUMkFD8dpdVQ9vCE0Bfzq6CEJzbJgJLIE+OeOARrBXi/Pprm
         jn7h+Ha5vcm9QuXHh573CbSNpLonMD/ZyCMI5gaHLSoI1VuxdzIa2gTCoHCtKPAPGPoC
         PhHLYuFaAoOaxeCS3Mm3TKTY3AohjuorxaQPC5vbXQRXq1PyOmT+Yphj9KT/ovjcG5y1
         7JO9vG4lZ5pRvsukqXXoWQNalMDrNWsUBknCmkN0gLoOz7YLHhSz1QVvDR+DeY8wl2Lq
         5/0g==
X-Gm-Message-State: AOAM531exE7165EJe483mK6RgRZFgF0XJ2wBrj0WfndNtlTDWpHosm7L
	o3gEjVxg2qLuXbJAt2F+lLx6iNeo7HklNw==
X-Google-Smtp-Source: ABdhPJyq97MyXix4mwZYBk16SX0okICsB1fPbw+C3Th6ZyTMCMGMxgzmoXJ5l5B2Qja16/wzhhdCrw==
X-Received: by 2002:aa7:9112:0:b0:4e1:3b6:683 with SMTP id 18-20020aa79112000000b004e103b60683mr962375pfh.63.1645064519953;
        Wed, 16 Feb 2022 18:21:59 -0800 (PST)
Received: from chromium.org (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id l13sm6409461pgs.16.2022.02.16.18.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 18:21:59 -0800 (PST)
Date: Thu, 17 Feb 2022 02:21:58 +0000
From: Prashant Malani <pmalani@chromium.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] platform/chrome: cros_ec: determine
 `wake_enabled` in cros_ec_suspend()
Message-ID: <Yg2xRup53gP39SBs@chromium.org>
References: <20220216080306.3864163-1-tzungbi@google.com>
 <20220216080306.3864163-4-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220216080306.3864163-4-tzungbi@google.com>

On Feb 16 16:03, Tzung-Bi Shih wrote:
> `wake_enabled` indicates cros_ec_resume() needs to call
> disable_irq_wake() to undo enable_irq_wake() in cros_ec_suspend().
> 
> Determine `wake_enabled` in cros_ec_suspend() instead of
> reset-after-used in cros_ec_resume().
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>

I don't see what is the issue with reset-after-use here, as long as the
variable is initialized correctly. This patch strikes me as larger than
it really needs to me. Anyway, FWIW:

Reviewed-by: Prashant Malani <pmalani@chromiu.org>

> ---
> Changes from v4:
> (https://patchwork.kernel.org/project/chrome-platform/patch/20220216043639.3839185-4-tzungbi@google.com/)
> - Undo changes from v3; rollback to v2.
> 
> Changes from v3:
> (https://patchwork.kernel.org/project/chrome-platform/patch/20220209095703.517608-4-tzungbi@google.com/)
> - Change the patch title.
> - Simplify by initializing wake_enabled in cros_ec_register().
> 
> No changes from v2.
> 
> Changes from v1:
> (https://lore.kernel.org/lkml/20220125101527.1812887-1-tzungbi@google.com/T/#u)
> - Use imperative mood in commit message.
> 
>  drivers/platform/chrome/cros_ec.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
> index 25cd8df6e7b0..a013fbceeb03 100644
> --- a/drivers/platform/chrome/cros_ec.c
> +++ b/drivers/platform/chrome/cros_ec.c
> @@ -342,6 +342,8 @@ int cros_ec_suspend(struct cros_ec_device *ec_dev)
>  
>  	if (device_may_wakeup(dev))
>  		ec_dev->wake_enabled = !enable_irq_wake(ec_dev->irq);
> +	else
> +		ec_dev->wake_enabled = false;
>  
>  	disable_irq(ec_dev->irq);
>  	ec_dev->suspended = true;
> @@ -383,10 +385,9 @@ int cros_ec_resume(struct cros_ec_device *ec_dev)
>  		dev_dbg(ec_dev->dev, "Error %d sending resume event to ec",
>  			ret);
>  
> -	if (ec_dev->wake_enabled) {
> +	if (ec_dev->wake_enabled)
>  		disable_irq_wake(ec_dev->irq);
> -		ec_dev->wake_enabled = 0;
> -	}
> +
>  	/*
>  	 * Let the mfd devices know about events that occur during
>  	 * suspend. This way the clients know what to do with them.
> -- 
> 2.35.1.265.g69c8d7142f-goog
> 
