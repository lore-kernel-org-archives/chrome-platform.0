Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD7F4A9F
	for <chrome-platform@lists.linux.dev>; Thu, 17 Mar 2022 21:46:29 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id l4-20020a17090a49c400b001c6840df4a3so2898416pjm.0
        for <chrome-platform@lists.linux.dev>; Thu, 17 Mar 2022 14:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4nG1tjL8NLMsT4cMgggdZFwaJZ01TiYbAaXgC6uFDB0=;
        b=LshajC2/xAr2200yH3KNZOFjlWNSOShPGCyj+JvOZlsPXiXdfNYvHCsJmCx9wYXKWU
         1xbGadWUjt6wR82iYphWGcVUpnqF1AHTmD7X/qcs8F1nJAxiFkVv5qZWhRJ/VAeOkzse
         KCZydwVP5PxIHu+aZMT4mWdVcqMwmDGY4efBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4nG1tjL8NLMsT4cMgggdZFwaJZ01TiYbAaXgC6uFDB0=;
        b=KcTC0lydtjW07YJW8AWdCeVOFuGpIpE973bEhzgDqDhrX4x/4CsTTiDicfTOouEiyg
         QVeloX4gcj2aBiNva82ofOufLC2BLlyDFRhORrxX1HNTtP9aoXGg0KAHuScyTvb08Fgc
         WPRiIcqyC07P/DWMczQslRanN9w0zcSQSY4bqHcMnipYcgKcWGYSnoOCjmZdmoVzbjN4
         6u3XLbfJ+ke4cTlyoBGwzYOMR+HxNt47StbdEjutv3dSDLtdMMCvcKVceJE/O17HP0jK
         VDWOK8BsnayLp5TVzAyNtdAIV8pQLlpPwrSjUw7BRQbv9YAHJuGKBguS5SUre3XRki/n
         W9KA==
X-Gm-Message-State: AOAM530yy5Y4geWv4KC0F9PJg6gfq2rNC5HGW+cNeM8eJwi1boAClkzg
	spR6bVSDCDGr5RRlhrhBWDfhJQ==
X-Google-Smtp-Source: ABdhPJz4qlnmPCz+FBLPosA30YBgzzO1nOPfvrAYzZv2zyeVEcZnwOe+NpoMwJLbpb6lrP1paknYYQ==
X-Received: by 2002:a17:902:c40e:b0:151:a83a:540c with SMTP id k14-20020a170902c40e00b00151a83a540cmr6960279plk.10.1647553589534;
        Thu, 17 Mar 2022 14:46:29 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:ae74:932d:af6a:6079])
        by smtp.gmail.com with UTF8SMTPSA id h22-20020a056a001a5600b004f7c17b291asm7718766pfv.87.2022.03.17.14.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 14:46:29 -0700 (PDT)
Date: Thu, 17 Mar 2022 14:46:27 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Guenter Roeck <groeck@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Craig Hesling <hesling@chromium.org>,
	Tom Hughes <tomhughes@chromium.org>,
	Alexandru M Stan <amstan@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: Re: [PATCH v2 3/3] platform/chrome: cros_ec_spi: Boot fingerprint
 processor during probe
Message-ID: <YjOsM1aRzpAiPErC@google.com>
References: <20220317005814.2496302-1-swboyd@chromium.org>
 <20220317005814.2496302-4-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220317005814.2496302-4-swboyd@chromium.org>

On Wed, Mar 16, 2022 at 05:58:14PM -0700, Stephen Boyd wrote:
> Add gpio control to this driver so that the fingerprint device can be
> booted if the BIOS isn't doing it already. This eases bringup of new
> hardware as we don't have to wait for the BIOS to be ready, supports
> kexec where the GPIOs may not be configured by the previous boot stage,
> and is all around good hygiene because we control GPIOs for this device
> from the device driver.
> 
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Craig Hesling <hesling@chromium.org>
> Cc: Tom Hughes <tomhughes@chromium.org>
> Cc: Alexandru M Stan <amstan@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
