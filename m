Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121863D8E
	for <chrome-platform@lists.linux.dev>; Tue, 24 May 2022 21:44:35 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id v15so3161500pgk.11
        for <chrome-platform@lists.linux.dev>; Tue, 24 May 2022 14:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tdwGjLIYtWqSmu4a56WsblDf3vmkiiXdBBRqZtk4IQA=;
        b=CuE1tQFSmFVJONeZAL2ThFeB1vwnSfXzq20k9Ovt4tQxLU7TJ23JFm4sQVvfgfOHpO
         Sa+5HkQjHK3IdvBheLqRfLW1kI03jDepbgOkcxI9o+lvYjSXo2zrKOUfAI3T+u4CxO+b
         i6o/oSBBJ0Jnzvgq8zHo2W6K+MEnlXla0lLQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tdwGjLIYtWqSmu4a56WsblDf3vmkiiXdBBRqZtk4IQA=;
        b=DbCN2fHkWm4RLgwt2W+OKxJLZJSQ6qeEyy0FExw3RIksXpl6m2niP6Z0ed9FtJXVnn
         gYgSx1MSasB55WszBjhUtV1JUzr0H2Fgphi72wlhstuJW8T70O0EnqbmCf/nIaRh0JqB
         2B34weLSF8WTyg8JlH2zmrjJO2siszXOtvt3lNDbaD7S1nMvSfi2m+eNP2/FtcMCwara
         OKURDsyE2E3YviFzd4Yf+mhGUNj3VMuqc8tJKRpCcKiAK10yZoFDHrEO829QUBkOpOmj
         kKBqT4kpn/9GCOqGUbGj//wR2FQ3ZT6k9EZMPrcfk8Cz+TgGFdVs0hsrBKQurybhpVMB
         DVbQ==
X-Gm-Message-State: AOAM533yg8hVmh5HnsVwABdz4sJ1U1l6Q1gAaF70d8D1nGIDYSHT2UG6
	+3kWYQLBHAW7tf+1gwbivqGTnA==
X-Google-Smtp-Source: ABdhPJyJSoSMADvSLYVlL/2kUNvKx6n1UYhKgAQ/pEqNXyseFU7Q4J/kE1GmzKPcau1xYFh10SCG7g==
X-Received: by 2002:a05:6a00:a8b:b0:4cd:6030:4df3 with SMTP id b11-20020a056a000a8b00b004cd60304df3mr30432733pfl.40.1653428675455;
        Tue, 24 May 2022 14:44:35 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:4d83:f549:9abd:427])
        by smtp.gmail.com with UTF8SMTPSA id e4-20020a170902e0c400b00161947ecc82sm387777pla.199.2022.05.24.14.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 May 2022 14:44:35 -0700 (PDT)
Date: Tue, 24 May 2022 14:44:33 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, robh+dt@kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/5] platform/chrome: cros_kbd_led_backlight: support
 EC PWM backend
Message-ID: <Yo1RwaTYUtWWfdDg@google.com>
References: <20220523090822.3035189-1-tzungbi@kernel.org>
 <20220523090822.3035189-6-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220523090822.3035189-6-tzungbi@kernel.org>

On Mon, May 23, 2022 at 05:08:22PM +0800, Tzung-Bi Shih wrote:
> EC PWM backend uses EC_CMD_PWM_SET_KEYBOARD_BACKLIGHT and
> EC_CMD_PWM_GET_KEYBOARD_BACKLIGHT for setting and getting the brightness
> respectively.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Tested-by: Matthias Kaehlcke <mka@chromium.org>
