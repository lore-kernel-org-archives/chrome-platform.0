Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6397B
	for <chrome-platform@lists.linux.dev>; Sat, 29 Oct 2022 01:50:58 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id m2so6066733pjr.3
        for <chrome-platform@lists.linux.dev>; Fri, 28 Oct 2022 18:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h3PXA8WoOqJtml0iT1uGTlbTfROvdqqMfllOBdYkx2Q=;
        b=awzLlZFLVHNDXNPpXryI3mhfCeEtMv9n9YbmejLI6z5ubPPBOoUyQjDs4m59Db1BCx
         V2T3OEUC9/Da8SmDIj1XzAOTLlL0BGTuEGFqEpR/RYMplpUZYo+vg5GuxbjCXdkGYT8m
         1UQDY8BmvQpBexYvVRZpsIB6ICCdGHebIt7FE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3PXA8WoOqJtml0iT1uGTlbTfROvdqqMfllOBdYkx2Q=;
        b=mbFIYYuf4SDcuInjF0v67JeVcoANWwhwOPV21MZd2K+eouKCxbkdc4ssgCTrYmRVcj
         YurETFPf1L2OoH2dXs7qRXaF0n7/UXpn6wVExNPl79lRsuGNmpqRghDi6qpQ1907v1Kl
         eOLQwNV0As0drAX0xrrrEGO+R+zmSRBBQg/TFTwJSJI33BkjRr72zBJHDFY8rZKBE0Mh
         2jaR8xMHDn4bLR75hZ+rmplPKVBVi5wF6jfcxQDLF5AdmUycmOLRtAQsdk4jzsDcOTTO
         N5HeFiXLoXrNbB0STwN9ZXPZlVEKai4KbYQYfrMiIRBqcRF9bQASrAFhlZRkx0AVdO1J
         xTGQ==
X-Gm-Message-State: ACrzQf0Hz72xE4qWi+oP9jz+dDqibwiAb4cf3MjsecJ4qp29YVXGYN+7
	6MRNS5h17pRSbCekFZZSgf2QGA==
X-Google-Smtp-Source: AMsMyM74IKJH+Zx3Kp0oOuv3LYOmcgGJw9CYoCx/iN7nC5ZnsoprbaFozTj05a80SX2TN7KTgTEMFA==
X-Received: by 2002:a17:903:2645:b0:185:480a:85d2 with SMTP id je5-20020a170903264500b00185480a85d2mr2049552plb.144.1667008257609;
        Fri, 28 Oct 2022 18:50:57 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:65f9:c180:249c:190f])
        by smtp.gmail.com with ESMTPSA id q8-20020a17090a304800b00212daa68b7csm84981pjl.44.2022.10.28.18.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 18:50:57 -0700 (PDT)
Date: Fri, 28 Oct 2022 18:50:54 -0700
From: Brian Norris <briannorris@chromium.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Benson Leung <bleung@chromium.org>, linux-rtc@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: cros-ec: Limit RTC alarm range if needed
Message-ID: <Y1yG/lhDYH2I82Bi@google.com>
References: <20221029005400.2712577-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221029005400.2712577-1-linux@roeck-us.net>

On Fri, Oct 28, 2022 at 05:54:00PM -0700, Guenter Roeck wrote:
> RTC chips on some older Chromebooks can only handle alarms less than 24
> hours in the future. Attempts to set an alarm beyond that range fails.
> The most severe impact of this limitation is that suspend requests fail
> if alarmtimer_suspend() tries to set an alarm for more than 24 hours
> in the future.
> 
> Try to set the real-time alarm to just below 24 hours if setting it to
> a larger value fails to work around the problem. While not perfect, it
> is better than just failing the call. A similar workaround is already
> implemented in the rtc-tps6586x driver.
> 
> Drop error messages in cros_ec_rtc_get() and cros_ec_rtc_set() since the
> calling code also logs an error and to avoid spurious error messages if
> setting the alarm ultimately succeeds.
> 
> Cc: Brian Norris <briannorris@chromium.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Brian Norris <briannorris@chromium.org>
Tested-by: Brian Norris <briannorris@chromium.org>
