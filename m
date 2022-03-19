Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FCA18D
	for <chrome-platform@lists.linux.dev>; Sat, 19 Mar 2022 01:22:15 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id m11-20020a17090a7f8b00b001beef6143a8so9794797pjl.4
        for <chrome-platform@lists.linux.dev>; Fri, 18 Mar 2022 18:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3z10AOteEx1l3qhsEcfSDRV+sBpD5Nt7UgyL1DLLBmU=;
        b=ZHGfgTOtoN7DM/VIkKp/QWyYI9gVP4rFHtey1iKU1pRtxy8yMz3V5kyCjwXH7us67z
         OjeMnE2mnaC+zaYuv6Tt8J+rf2E6OL4YwDqwgBF2LbyIt4li2cIZXMntTvBd4+ZTeip9
         a+KQb6zMyrQmjdSir+2XO2YZ3vFsdlkI/mBB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3z10AOteEx1l3qhsEcfSDRV+sBpD5Nt7UgyL1DLLBmU=;
        b=b7v9rLs9Y26KXyzBRtg3BNycVZt/nWQeqsFPBieoaApQnKo+/4opeBIlPe9fN68n0W
         rOed6S1Znj1E9D5nVKXhpTDkmMgXHZasXn59Lbr0wt25igY+fV78zWAQliz9nVvznoUx
         oifVH3C3D/cYrG+aIwnDt5YhvFSgsXSZAatw7NkIq4FTHV7/eeSTcQoSY/rcPdEy57u5
         L4zAltSJahYgyjD8qa19i1Z+dOivMT92Hp46F4ZFxf/A4FCD7ry7dAUISoy8aJ9LdC3E
         e54cy2nSRxPmizDmv64eFVx5fuzv9gpGq1gewqHYCaCrMBV6Gdkn673L9/HeBuY7dWJS
         aOXw==
X-Gm-Message-State: AOAM533cmm52pyU6MRDIc+y5IhW1a/gNFBTmgtbXeTjCw370VcGwqgqE
	kNC2A3gE7PDmyL+dof4T6J/+lw==
X-Google-Smtp-Source: ABdhPJyALygDL2SvehFfKJmpq8i+7nuAvOndJm7iIIP+BxFZZMpfmObVPfpU2NG9jkp2bwMdtX45RA==
X-Received: by 2002:a17:902:d890:b0:151:6b8b:db0a with SMTP id b16-20020a170902d89000b001516b8bdb0amr2244818plz.15.1647652935405;
        Fri, 18 Mar 2022 18:22:15 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:bd64:9503:150c:fb20])
        by smtp.gmail.com with ESMTPSA id q10-20020a056a00088a00b004f7ceff389esm11376908pfj.152.2022.03.18.18.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 18:22:14 -0700 (PDT)
Date: Fri, 18 Mar 2022 18:22:11 -0700
From: Brian Norris <briannorris@chromium.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, Daisuke Nojiri <dnojiri@chromium.org>,
	Rob Barnes <robbarnes@google.com>, Rajat Jain <rajatja@google.com>,
	Parth Malkan <parthmalkan@google.com>
Subject: Re: [PATCH v2] platform/chrome: Re-introduce cros_ec_cmd_xfer and
 use it for ioctls
Message-ID: <YjUwQ1kgjHF2AMBV@google.com>
References: <20220318165422.686848-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318165422.686848-1-linux@roeck-us.net>

On Fri, Mar 18, 2022 at 09:54:22AM -0700, Guenter Roeck wrote:
> Commit 413dda8f2c6f ("platform/chrome: cros_ec_chardev: Use
> cros_ec_cmd_xfer_status helper") inadvertendly changed the userspace ABI.
> Previously, cros_ec ioctls would only report errors if the EC communication
> failed, and otherwise return success and the result of the EC
> communication. An EC command execution failure was reported in the EC
> response field. The above mentioned commit changed this behavior, and the
> ioctl itself would fail. This breaks userspace commands trying to analyze
> the EC command execution error since the actual EC command response is no
> longer reported to userspace.
> 
> Fix the problem by re-introducing the cros_ec_cmd_xfer() helper, and use it
> to handle ioctl messages.
> 
> Fixes: 413dda8f2c6f ("platform/chrome: cros_ec_chardev: Use cros_ec_cmd_xfer_status helper")

Probably could use a Cc: <stable@vger.kernel.org> in here, since this is
a user-space ABI regression. But these days, there's effectively no
difference vs. just a Fixes tag, because someone's bot will usually pick
it up.

> Cc: Daisuke Nojiri <dnojiri@chromium.org>
> Cc: Rob Barnes <robbarnes@google.com>
> Cc: Rajat Jain <rajatja@google.com>
> Cc: Brian Norris <briannorris@chromium.org>
> Cc: Parth Malkan <parthmalkan@google.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Updated comments / return value description. No functional change.

Reviewed-by: Brian Norris <briannorris@chromium.org>
