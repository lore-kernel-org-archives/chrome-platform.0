Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BFA1B69
	for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 04:13:19 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id l9so1077478plg.0
        for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 20:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GFotQkjpDdLQ2+OX2KoycdqwBU8WQ7JfOoVNWcFC4QU=;
        b=AN3eTuY6MNomJEXrJikLjIol6wtPInp7p4J7ODu/w3ZcCNfoAMBxAjAUTXZu2j1lf/
         J7hEvABDee6ocGZ368eI2ZdalxFdvmjI19XKv6wIdB3GwYt1Iu9UmFLB4oy7jSzdwngw
         8ppggXsfWpi+ezEuMtypPMKo4vQwA7jL9Cy8AXqWO+xpmzeWxzmSq9UdROarTeYLkX6y
         BsaVsI2CKgXSyly/OvWOn57iembi4YMTP7c4A/HudMq4Ayj9ZLgbdUJmtmtH1MRxWg5o
         H6+ECFjZLI0B9toUYuP4FycjXCsS08C5j8qN07TLUNcvhSFk22TPH4jDe+D5fVzChcfI
         7NWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GFotQkjpDdLQ2+OX2KoycdqwBU8WQ7JfOoVNWcFC4QU=;
        b=Ub4Daid4hmFK+q3On6qQh3MK+oMTH2EdAQ70qEfEwR1t7kljjbll5K0w/lfveT2kwA
         VvJCTK5VTGPS80dxltESa0CL/rsu6/y2etHr/iagYYDbCS9z7wSJe3wLDmxRDDbaHw+W
         MmldeXV5mTVrauqPkuXGObnelZJzt+UuZVXlg3kzzswmDr8uR2iy//9tIyVk+IFnjdn2
         Rw+6LwfqVk0w5zxfmiY44zxTW8Az0R4fWKSR+ysA35WN+DFpZyMi9omxRo/fnw5H8iwP
         cQ/YCfDRNAWtj8LXfJH+yWtQ+Dbs6B5s204ZXYsW1EwgH1llAQI/bxviv8SZvAn2K6Cr
         nXtQ==
X-Gm-Message-State: AOAM5325zsy3rt0pL7ARUo95zorVY2nU9nCrufWWkNczhGBT4MnL5R5o
	SGg0l1b06zyD9rJ42CtMHbSW6A==
X-Google-Smtp-Source: ABdhPJyIGR2gOBXGPEMDoiKmJEpauI8kUao9ym67eWvbAlro4CiKkSlWzTYib+7LRIUB9qtIW7IS4g==
X-Received: by 2002:a17:902:8b86:b0:14f:cad:38f6 with SMTP id ay6-20020a1709028b8600b0014f0cad38f6mr612875plb.3.1644984798843;
        Tue, 15 Feb 2022 20:13:18 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:8ce7:5b2:9787:1a0b])
        by smtp.gmail.com with ESMTPSA id ck20sm17118654pjb.27.2022.02.15.20.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 20:13:18 -0800 (PST)
Date: Wed, 16 Feb 2022 12:13:16 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2 3/6] platform/chrome: cros_ec: determine
 `wake_enabled` in cros_ec_suspend()
Message-ID: <Ygx53F0bziAWceqJ@google.com>
References: <20220209045035.380615-1-tzungbi@google.com>
 <20220209045035.380615-4-tzungbi@google.com>
 <CACeCKad4hs3WMt_fVQHdwOGF3xW8boKKOKsF8xR4o8q8-0jxnA@mail.gmail.com>
 <YgOLLmLKQWNyjvr1@google.com>
 <CACeCKadSTq22aN1mwpT2re5dcA0J+GW7R8=gg4no5MB6j9m+Bw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACeCKadSTq22aN1mwpT2re5dcA0J+GW7R8=gg4no5MB6j9m+Bw@mail.gmail.com>

On Tue, Feb 15, 2022 at 05:07:43PM -0800, Prashant Malani wrote:
> On Wed, Feb 9, 2022 at 1:36 AM Tzung-Bi Shih <tzungbi@google.com> wrote:
> >
> > On Tue, Feb 08, 2022 at 10:05:58PM -0800, Prashant Malani wrote:
> > > On Tue, Feb 8, 2022 at 8:50 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
> > > >
> > > > `wake_enabled` indicates cros_ec_resume() needs to call
> > > > disable_irq_wake() to undo enable_irq_wake() in cros_ec_suspend().
> > > >
> > > > Determine `wake_enabled` in cros_ec_suspend() instead of
> > > > reset-after-used in cros_ec_resume().
> > > It sounds like we can accomplish the same thing as this patch by either:
> > > - Initializing ec_dev->wake_enabled = false during cros_ec_register()
> >
> > This doesn't sound like a good idea.  Value of device_may_wakeup(dev) changes
> > during runtime.  It should check in cros_ec_suspend() instead of in
> > cros_ec_register().
> 
> Hmm, I'm pretty sure it shouldn't change for Cros EC. In any case, I'm
> not suggesting
> moving the check away from cros_ec_suspend(), just the initialization
> of the flag.

Got it.  I misunderstood.  Let's go this direction.  Will fix in the next
version.
