Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D901F7C
	for <chrome-platform@lists.linux.dev>; Sat, 22 Oct 2022 00:29:02 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id i3-20020a17090a3d8300b00212cf2e2af9so3285225pjc.1
        for <chrome-platform@lists.linux.dev>; Fri, 21 Oct 2022 17:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vbin2EPqUmXPJ6xPLH+ERynu4O+L2S0zduYye9vK2V4=;
        b=JCKRRiNYR9C40uQh2CHaKj9sSleYIthTr605LiwWq+EFYDkEoqEevgZlMgh8vPNRk6
         PF4zbp2AL5KrkyZFbBnhuXdDoL10LLi0geZm8snrMXH6kR4BHW72WqhePZ6ozAzwREOv
         Ejp6bnGxylG+JW2FqGLXHiJN42NdFnbNaAOsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbin2EPqUmXPJ6xPLH+ERynu4O+L2S0zduYye9vK2V4=;
        b=sbHmM1Pte/+S3pkja7ageDaYC8th9A5gC5FSPRVRP8dkTmrbVG2/5d/elim+nOLIvD
         1f2OfkcAiXNdJpdYgz8tfwlNIx2sEQwiPepj3DGN9DSTY3/Cf3t7hp6E4uz60xZz2ZPE
         kaOLEqqXVldmPPIGP4BibRv1tRCaYyFkUKSmBjau64kI06dsQn5ESZ6ZLOBbo820op9B
         AEcXn4UfZUQ4xHgUCJZQkJ8QYdlg+VL63dBI3CLH0s6VrXANtQms+6g78mhWiZLRUC1B
         x3G2OvVNFK6KtamFbug000x2LoHql8DdBmZYfClAg2J7ggYUxB50SJnG1WWqcwVf8pCF
         J2ZA==
X-Gm-Message-State: ACrzQf2k1t8hI1BXnYmiwzvxmvmNl89TDbGqXk75WYNeDVvlTs3Id5jd
	PtGtkgDcuDOL6Se58Fr5SjPc4g==
X-Google-Smtp-Source: AMsMyM5ATXbUbYr3pLTSGOUKefFCpmfHiVhlEARSHoYpzgEfEEB2a8QsQTARugBvJm/il4ZnFYrWtw==
X-Received: by 2002:a17:90a:ad05:b0:212:c550:f0e9 with SMTP id r5-20020a17090aad0500b00212c550f0e9mr9614764pjq.246.1666398542367;
        Fri, 21 Oct 2022 17:29:02 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d6f0:dbbb:c195:162])
        by smtp.gmail.com with ESMTPSA id x16-20020a17090a165000b0020aaa678098sm2127398pje.49.2022.10.21.17.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 17:29:01 -0700 (PDT)
Date: Fri, 21 Oct 2022 17:28:59 -0700
From: Brian Norris <briannorris@chromium.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
	Julius Werner <jwerner@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>, stable@vger.kernel.org
Subject: Re: [PATCH] firmware: coreboot: Register bus in module init
Message-ID: <Y1M5Sw6Zs8PYzIIu@google.com>
References: <20221019180934.1.If29e167d8a4771b0bf4a39c89c6946ed764817b9@changeid>
 <af9c4bfd-d3fb-1c7a-fb38-0d8bbd507449@roeck-us.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af9c4bfd-d3fb-1c7a-fb38-0d8bbd507449@roeck-us.net>

On Wed, Oct 19, 2022 at 06:20:08PM -0700, Guenter Roeck wrote:
> On 10/19/22 18:10, Brian Norris wrote:
> > Currently, get_maintainers.pl tells me Greg should pick this up. But I
> > CC the chrome-platform list too, since it seems reasonable for Google
> > folks (probably ChromeOS folks are most active here?) to maintain
> > Google/Chrome drivers.
> > 
> > Let me know if y'all would like this official, and I'll push out a
> > MAINTAINERS patch.
> > 
> 
> I think that would be a good idea.

Done:

[PATCH] MAINTAINERS: Add drivers/firmware/google/ entry
https://lore.kernel.org/lkml/20221021172624.1.I119456791d197eb7d159f09e7479d8759008a954@changeid/

Brian
