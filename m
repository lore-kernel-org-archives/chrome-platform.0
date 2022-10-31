Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EBD17F4
	for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 16:36:51 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id 4so11263048pli.0
        for <chrome-platform@lists.linux.dev>; Mon, 31 Oct 2022 09:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ktu8OH92DZspQ/EalzrzH2xRK2hDUy12EpR7qlAoKb0=;
        b=cJOxA2b0uPiBCezL07Ov82tEB4jHsTf3Ta5PEIqG7TnX4XNfxyySy0wk6i+wDyySZj
         i2+/m2JEoZUui7IU/AN9q1CbDBYhtHU1Ep/oFUbIYkB1PITOZjwszPoHhCTTLN/xE6Lr
         FtMUFI5OTIUTPNNQ/FUTjCvTa88nV+YH7D03w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktu8OH92DZspQ/EalzrzH2xRK2hDUy12EpR7qlAoKb0=;
        b=bCLPZZSPUsMXqH+aY6JcUFw32pxTGDAIL7J5l62GOty1w4XXSwsPeqgEUUd+jP4m1j
         EGamKasxR4zAt3K3eXtzFtpIPHt2fDa60wy4EQo9PAyfXBvcDbJv1j3jWDThQup0OnOO
         OLN2k3+d8cdhCGHuDtpfxuw5kytg4SjEtDQ9h2VS1l3p1UmcB/pUhK2bkAMuw0LeldHq
         hvsVV/BPkkTO7fB+NEBJDE5BulFuLuOewxJf0DZsE1psoNCJGwQ5qc8IJVsSxc2d9OIZ
         Mm2q7bhBq1VER8n5HKOGIRBnPfd3RM+fr0f0t2OlUYysQ5k7O+VYmasxp/U8YwKLzwDQ
         awQA==
X-Gm-Message-State: ACrzQf2AkALDDiempbNIkz/sMePUNt7Qfb+VSRB+tQYAiBQFyZB+4mZk
	88JFe5/2Kz7g9PxyaxpGxBOVhg==
X-Google-Smtp-Source: AMsMyM6TSgLhlriqWZHeTadke/nSbx3vqmxUQeI1Dl0qdWWkCayFHXAce3dvg+tYvHkGMJ3J6ekueg==
X-Received: by 2002:a17:903:234c:b0:187:28b2:85f6 with SMTP id c12-20020a170903234c00b0018728b285f6mr3796395plh.106.1667234210737;
        Mon, 31 Oct 2022 09:36:50 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:cf9d:6561:637d:2194])
        by smtp.gmail.com with ESMTPSA id m3-20020a17090a3f8300b0020a7d076bfesm4443584pjc.2.2022.10.31.09.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 09:36:50 -0700 (PDT)
Date: Mon, 31 Oct 2022 09:36:47 -0700
From: Brian Norris <briannorris@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Benson Leung <bleung@chromium.org>, linux-rtc@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: cros-ec: Limit RTC alarm range if needed
Message-ID: <Y1/5nyplwrxSLg+M@google.com>
References: <20221029005400.2712577-1-linux@roeck-us.net>
 <Y19AdIntJZGnBh/y@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y19AdIntJZGnBh/y@google.com>

On Mon, Oct 31, 2022 at 11:26:44AM +0800, Tzung-Bi Shih wrote:
> On Fri, Oct 28, 2022 at 05:54:00PM -0700, Guenter Roeck wrote:
> > Drop error messages in cros_ec_rtc_get() and cros_ec_rtc_set() since the
> > calling code also logs an error and to avoid spurious error messages if
> > setting the alarm ultimately succeeds.
> 
> It only retries for cros_ec_rtc_set().  cros_ec_rtc_get() doesn't emit
> spurious error messages.

All of cros_ec_rtc_get()'s callers were also logging the same message.
So it was redundant. I think the general strategy here was to log the
error(s) in callers (last point before we "exit" the driver), to have
the best chance at context-relevant error messages, or ignoring them
where proper.

It's already a bit dubious to log kernel messages at all in response to
normal sysfs operations. We probably want them in some cases, when
things are particularly unexpected, but it shouldn't be a regular
occurrence, and we certainly don't need *two* log lines for each error.

Technically, if one wants to be super-nitpicky about one purpose per
patch, then maybe a patch to trim the logging, and a patch to fix the
alarm range issues...
...but I think that would be a little silly, and perhaps even harmful.
They are related concerns that should be patched (and probably
backported) together.

Brian
