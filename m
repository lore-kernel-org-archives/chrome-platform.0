Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D742F25
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 09:36:50 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id h7-20020a17090a648700b001b927560c2bso499281pjj.1
        for <chrome-platform@lists.linux.dev>; Wed, 09 Feb 2022 01:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FydEz2jQZhjbxYOrXrG04q5jMrs+DkECe/t7ivDNavE=;
        b=lmviVH5o8vmyJzJwNssaf+2zcaQoLuENem11aWDYqIyJBCa+cxlMyUSpDQfVcQhYzH
         6wRW9JiXAUHzitFRMWr2nFhv4gzlv71r5PeoX6/dwBUhR2NkJ3cnIxp1RzLXKRdWxa0x
         3xYvoeJtDbDkIYGJFG0GguJRnsmWCVe3oH+VGolX2D9Oalvq2yF4zvwZpOI/0/4tFjwS
         Nzc8mVHG0zFWOBvx3g+/Ye4tabtoxmdGS8h2YMX8hYKJdb314DV80AR1W2fVtg9/CCaL
         wwl3BfrPKI7w72c9cK9UKD9IcR3kP83aTUMFOvQb/SW+0y+TbnvDfM9q0Ozq58EUCvaE
         r5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FydEz2jQZhjbxYOrXrG04q5jMrs+DkECe/t7ivDNavE=;
        b=C84qy8l+s1rVWn7dfR3xenSXNUkAZAe6ZqAg4rFjkyKlQb/uLYsu+yO6gkb3ZBEMAb
         1opnyy9vfCOg1EBwmRXx+f51rGXTJfocH8TjazCLunKED4GFk2r6qT+msmiBXK+DPNiT
         6IW0iE8LFBP87nnAqYHgeXHEdUox3vLo15lipXnlgwkKOnfigKTBRdcEDMlnqMU8Kp5P
         r9W3COIABm8NI06WI5WHaHPF3slMrYndGm59CpNvWgelponZwSNIENiHm4dHdGYt9z+H
         WOxn4rEiSTPfjhlPcrrilZvB6SrZ06o2xafAdoKKfaazsZ8kU0gYscK4tX7VReaD10fc
         sBnQ==
X-Gm-Message-State: AOAM5305KC5daPTaLKOCdnDiOiBhnYYaQLehGjyT4fWf3Y4ZpCvhdNeE
	Z3fpMoqH7Ux1dy5mALn8Au6KjQ==
X-Google-Smtp-Source: ABdhPJyYpbEIK/sH7aDTw3TgLL58YB9Bu/Ubz0QBdNdVWwdo/mjF4ydhGpwBRfxMJ7rInMptGDcKbw==
X-Received: by 2002:a17:902:760e:: with SMTP id k14mr1351846pll.11.1644399409377;
        Wed, 09 Feb 2022 01:36:49 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:ee29:8b32:75bc:44ec])
        by smtp.gmail.com with ESMTPSA id k14sm7254978pgt.73.2022.02.09.01.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 01:36:49 -0800 (PST)
Date: Wed, 9 Feb 2022 17:36:46 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2 3/6] platform/chrome: cros_ec: determine
 `wake_enabled` in cros_ec_suspend()
Message-ID: <YgOLLmLKQWNyjvr1@google.com>
References: <20220209045035.380615-1-tzungbi@google.com>
 <20220209045035.380615-4-tzungbi@google.com>
 <CACeCKad4hs3WMt_fVQHdwOGF3xW8boKKOKsF8xR4o8q8-0jxnA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACeCKad4hs3WMt_fVQHdwOGF3xW8boKKOKsF8xR4o8q8-0jxnA@mail.gmail.com>

On Tue, Feb 08, 2022 at 10:05:58PM -0800, Prashant Malani wrote:
> On Tue, Feb 8, 2022 at 8:50 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
> >
> > `wake_enabled` indicates cros_ec_resume() needs to call
> > disable_irq_wake() to undo enable_irq_wake() in cros_ec_suspend().
> >
> > Determine `wake_enabled` in cros_ec_suspend() instead of
> > reset-after-used in cros_ec_resume().
> It sounds like we can accomplish the same thing as this patch by either:
> - Initializing ec_dev->wake_enabled = false during cros_ec_register()

This doesn't sound like a good idea.  Value of device_may_wakeup(dev) changes
during runtime.  It should check in cros_ec_suspend() instead of in
cros_ec_register().

> or
> - Setting ec_dev->wake_enabled = false just before the
> device_may_wakeup(dev) check.

Did you mean:

ec_dev->wake_enabled = false;
if (device_may_wakeup(dev))
        ec_dev->wake_enabled = !enable_irq_wake(ec_dev->irq);

If so, this way is suboptimal to me.  ec_dev->wake_enabled can be written
once; however, it is written twice if device_may_wakeup(dev) is true.
