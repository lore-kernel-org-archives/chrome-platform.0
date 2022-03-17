Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FF04A9F
	for <chrome-platform@lists.linux.dev>; Thu, 17 Mar 2022 21:38:12 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id mp6-20020a17090b190600b001c6841b8a52so2875651pjb.5
        for <chrome-platform@lists.linux.dev>; Thu, 17 Mar 2022 14:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H5Zl2wvjuNiEzuSSqdGrzxbkB3GH5fcY+2dx8gf46go=;
        b=Is1dIn0DcwGOiCwH8KeruJ4YI8HqZqa38teQzdulxxt4LugHmlCXjB7hvJOeDZ09kE
         /cOOaNbarrWMiOvw65RGJw73j039FMwTRTE50uVJInitUlc9fLWtjd8OBaUiVNVyUEHl
         we13Bkx/54Xp58JLUSWRxm7o+M5ZerX7GS93g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H5Zl2wvjuNiEzuSSqdGrzxbkB3GH5fcY+2dx8gf46go=;
        b=ZH2COmVnRh5spt1zXP/sqzHdXGfQRUWnrmalYcIiRA8G1a5MJr8AFBJJi+eJwVZ/Sm
         bsvDsSrgvcW56LtCAPBjy45hVI8sULDB9qBq4A8ozJqvZiO6K+TeAoTmvsiMSZJPgIX4
         IffCzo+H58paoMDMVLDnxOGiML7+ia7fUXolA63aZDVwAZMkZj41BPXCM2MUR+AnM/uE
         530EEnpASu5EwF9qz+zd4OTI4egvbKdcMhluusTH2ps0JKZr0ILYOu5m+AZ28kJU8C21
         DlVHvtxBu01lvSNT1BAr31rtl3TeEqbVVoLy91erImqSV/c1JbbkRH6WqZbGh5LbTveT
         peWQ==
X-Gm-Message-State: AOAM531u4MjkuId/AbNPDAzse6xNe8icb0TXzC/8e+QC14H88P+JZ8W4
	fY7Z/oeb33A7ny2Rv/T0rHrLfg==
X-Google-Smtp-Source: ABdhPJzZ9qkiY0MC4Jy8sau2X2PMYa1pwEQeGCHH4/MpiQvCJbifVh0pZvC83C7QtH265TxOdijQJQ==
X-Received: by 2002:a17:902:e94f:b0:14f:1636:c8a8 with SMTP id b15-20020a170902e94f00b0014f1636c8a8mr6805693pll.130.1647553091691;
        Thu, 17 Mar 2022 14:38:11 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:ae74:932d:af6a:6079])
        by smtp.gmail.com with UTF8SMTPSA id v23-20020a17090a521700b001bbfc181c93sm10193179pjh.19.2022.03.17.14.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 14:38:11 -0700 (PDT)
Date: Thu, 17 Mar 2022 14:38:09 -0700
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
Subject: Re: [PATCH v2 2/3] platform/chrome: cros_ec_spi: Match cros-ec-fp
 compatible
Message-ID: <YjOqQacDISz5eZgM@google.com>
References: <20220317005814.2496302-1-swboyd@chromium.org>
 <20220317005814.2496302-3-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220317005814.2496302-3-swboyd@chromium.org>

On Wed, Mar 16, 2022 at 05:58:13PM -0700, Stephen Boyd wrote:
> Add the fingerprint cros-ec compatible and spi_device_id so that we can probe
> fingerprint devices.
> 
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Craig Hesling <hesling@chromium.org>
> Cc: Tom Hughes <tomhughes@chromium.org>
> Cc: Alexandru M Stan <amstan@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
