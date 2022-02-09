Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B7D2C9C
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 03:32:23 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id x4so1089757plb.4
        for <chrome-platform@lists.linux.dev>; Tue, 08 Feb 2022 19:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rVLKnltV9lRSittC1euYQYIfAU8KczpP9bZo3Hkx0cs=;
        b=doNdBMkj4u3OFQ53O4YQOnkbQiVKdbnuz+0ds+U5lrSTl8aipq394zPVeaTRh3f6gu
         glCy62WV1d/OWuTMxARWElvpLNGntWMAtt9GjeQ5zntuXa7k58CFAZGE6QhIWhwWuXAc
         0jZpuNunGPcc4ucZN2LvDxVo+A5fudPmVry2EbTawH4RUu2FcBEVUT+LLSaejk1gSliM
         T+bmMr8gBjOu2XeXQyY0BQLElB4Cz19kfOsn9f4xYpjYgYyB5+L9df3z4oW/FCEc6Ej3
         fpFTNOhMHbXFaY6LW15AptBKohrKi30ZNbhX22cnwCfI2rowDuvugYREXCwOZgMu5WlA
         UjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rVLKnltV9lRSittC1euYQYIfAU8KczpP9bZo3Hkx0cs=;
        b=gm9EHJS55MuXfdOFc5vVdyzZmcCqld/h4pxyCPqzECeq3eXGc9DESyn82Pi2VZflK1
         In4N9gXEDIj+UY89B3qSfiQTb2FQWn38jodMJOHv6OeIcl3ih91ebZEpGlE5O8z1HPvu
         5R5Hr7DRNyB1Rg6oj+RLmSrNHDvLWZwc/L1CZ7PrMNo2+pK28JaR1mnw3Pi2jAL/6xvP
         8VI0dLAl5MxCOcgFgKc7Nsrc9XmlYZofuVxKcjHsFUgKxM1Zoy567JI8UtseKLFMaQ1M
         Mczwz8pe0+0cnbQvTITPdeZSvoGB3wiMalA0hBZs5nJoQ8nUJfCnqUebt9zne1+iAqQK
         E5NA==
X-Gm-Message-State: AOAM5304AsHPnymLxkpxRuCzJkSpxh4pgmke/IKXGSvk4K/jm9+ZEw9V
	IAx8Zuiu+9/vqFesb8CqRHTrOQ==
X-Google-Smtp-Source: ABdhPJyu136qEREMmE5rRWNipgRkEe9Ge2q6U3XP6K8OgIwHFIIVixc/qw93Thct7pyfwXWB1uN3JA==
X-Received: by 2002:a17:90a:ca93:: with SMTP id y19mr1251720pjt.108.1644377542380;
        Tue, 08 Feb 2022 19:32:22 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:4b6f:f14d:be50:86a])
        by smtp.gmail.com with ESMTPSA id p4sm822144pgh.53.2022.02.08.19.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 19:32:21 -0800 (PST)
Date: Wed, 9 Feb 2022 11:32:19 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>,
	"open list:CHROMEOS EC USB TYPE-C DRIVER" <chrome-platform@lists.linux.dev>,
	Guenter Roeck <groeck@chromium.org>
Subject: Re: [PATCH v2 2/4] platform/chrome: cros_ec_typec: Get mux state
 inside configure_mux
Message-ID: <YgM1w1yTd2XkOEAA@google.com>
References: <20220208184721.1697194-1-pmalani@chromium.org>
 <20220208184721.1697194-3-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208184721.1697194-3-pmalani@chromium.org>

On Tue, Feb 08, 2022 at 06:47:20PM +0000, Prashant Malani wrote:
> Move the function which gets current mux state inside the
> cros_typec_configure_mux() function. It is better to group those
> bits of functionality together, and it makes it easier to move around
> cros_typec_configure_mux() later.
> 
> While we are doing this, also inline the cros_typec_get_mux_info() inside
> of cros_typec_configure_mux().
> 
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
