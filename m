Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C26B2F2C
	for <chrome-platform@lists.linux.dev>; Tue,  8 Feb 2022 05:33:14 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id p22-20020a17090adf9600b001b8783b2647so1106238pjv.5
        for <chrome-platform@lists.linux.dev>; Mon, 07 Feb 2022 21:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VGd6HWV0yqMQeeGM8GVnBobXYQMdfcC12IoRPz2yYaw=;
        b=oP2byjRZAi5hESJPONGrGc2WSkRkCT6bDoBZ+TLZKcK6dM0DtVYhdV7QeWI4psiPfo
         CsBBTWCpSt93N7U+YkE+PUY3osuPKCxDapOXQvtRMtGQhWVpaGcz5/IKKm/j6E9On2po
         PpcTrDx7MvE3U8wF1USqzf0jhcUzGEdBvQA1aw/x31MvVpSPqKMmm7+VyaoNorJNdqgl
         bc0rCF+KWWlSKMduQ9gvYEDxs/XdHokDMUoHLOzV1W4cUnI2pcauGVpSbAATOgFG185D
         62zBwGOAO7dUK7Ib+AWN2SQHqc7sT263q29OTcB/B/n/pyC7qYDudqPkUnrErOzunf5s
         vTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VGd6HWV0yqMQeeGM8GVnBobXYQMdfcC12IoRPz2yYaw=;
        b=ddhqcLUGKfDc50WoXbq5X80O2iTtrTsnPafByquXfmvM5aRJO8PajvmAFrhlOEuDSr
         Qh+6kB8NKH+1oqkeMrGxYv91Yw+Ry9e8D6ecbb5HqQ1rYBCcn47FaawHoz7fz0WNISbl
         MvzFIE8JSH472S6R7NKmw/11j6cce5y0Vi3OOyKUXz2dVrbKpbDMkaF4GwOPhGvuEkYg
         AUFNgFmLp3dPODidC19veIW5KGhrUIzg4DuK4oWNrOwEILeUA3IsjTC3gEBlNWIRw4jj
         +LUa2uMBhzFx15n9Y3+PFAv52TCJct+a/nuOgrXmg6Kv7lJmwsffE04VPG6UiNlmGzA6
         7kTg==
X-Gm-Message-State: AOAM5310ATTviHKruhfEVwTG16qtcgYU0VeKp2LaoEaV/8kAgiRSGrF6
	LC5pHB76gh1fmclizwYbkgLSdg==
X-Google-Smtp-Source: ABdhPJx+ZX3FQoFvCoRWstQ5b1GqhHj7gcqWkX68TI0XRke0VrZStlxNEMKUGTCHUcqJNFkafXh8gg==
X-Received: by 2002:a17:90b:1c83:: with SMTP id oo3mr2642964pjb.6.1644298393853;
        Mon, 07 Feb 2022 21:33:13 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:4b6f:f14d:be50:86a])
        by smtp.gmail.com with ESMTPSA id m14sm14470811pfc.170.2022.02.07.21.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 21:33:13 -0800 (PST)
Date: Tue, 8 Feb 2022 13:33:11 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>,
	"open list:CHROMEOS EC USB TYPE-C DRIVER" <chrome-platform@lists.linux.dev>,
	Guenter Roeck <groeck@chromium.org>
Subject: Re: [PATCH 1/4] platform/chrome: cros_ec_typec: Move mux flag checks
Message-ID: <YgIAl8do1/b1Dru9@google.com>
References: <20220207214026.1526151-1-pmalani@chromium.org>
 <20220207214026.1526151-2-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207214026.1526151-2-pmalani@chromium.org>

On Mon, Feb 07, 2022 at 09:40:24PM +0000, Prashant Malani wrote:
> Move mux and role flag checks inside of cros_typec_configure_mux(),
> which is a more logical location for them.

nit: s/Move/Moves/.

> @@ -519,7 +519,14 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
>  	struct cros_typec_port *port = typec->ports[port_num];
>  	struct ec_params_usb_pd_mux_ack mux_ack;
>  	enum typec_orientation orientation;
> -	int ret;
> +	int ret = 0;

The change looks irrelevant to the patch.
