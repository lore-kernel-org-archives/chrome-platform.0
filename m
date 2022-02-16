Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E447023A3
	for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 07:33:47 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id r64-20020a17090a43c600b001b8854e682eso1672314pjg.0
        for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 23:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=G88w+nTsUvCRwuMgd+C7h42dpJhgAK/n7PEK0WPBb9o=;
        b=LwmEAcFwBJkyI6kG+xSONwEWLZQ1N6PK3oNu7ILx1XdjcqH7D3SyKYonatpb9SyAtA
         eeSk5n3xtPX498PJSFDEnOt4AMAcey20E0U9wu/BAYcXAwrTIwX2YzE37+euIrbZxxBC
         RByBrXhnXdeH5NK10xs3Oy2hm8ZYrEIhJtSsQn4oEpmKiAzy4jJT7GYH5o3G6i9nTDN1
         kQTaUb8tSj1B+krfAbkQdHv09l1O/gLtReHSUuG5qwxCT0qvvad+uashwpqXYs5ZN3A1
         rpne2FjqaajtgWxXw/NLWiaUgS0kK0KMpBCrL8A8fzGaeXc/xe4n4GUerYyIIBQBbMG1
         hlvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=G88w+nTsUvCRwuMgd+C7h42dpJhgAK/n7PEK0WPBb9o=;
        b=peUS6QcIX+7f54lZumBBv5kn3pz0VFeHOBWMGKKky75jCLYBj7KAvHaVDxs3FbUwAB
         okSjzwXHa/Oh2gK7krOF0bMvr1mK76gxQG/0yGQ3o5cWs3Uh/wHRBW3J7JYJOuzxoq1S
         HXFwn2xwayddQ12EzE1+AAWzue6VMcZN9CbC2hOf2sicYJnsEPWpHpGmNcaZSPJFpA7j
         +/akCDW3zVDF5eoaGH6a31HfoFZzz3j1Y9KJhOvzbXNnqY9JXxVwPDqdkDFZLPFfj+m/
         8UCErP/RxSwmhqWdMWfsX5EIz2QSl2c3HUa/REwY9/Rc20ATEhlRKZc3tIQBSMeMbU/x
         ziMg==
X-Gm-Message-State: AOAM5312Pu+kNQj+IiQdefzk90JYu2bhjoYeCUBdi1xw7K+dr9UUfpF5
	sGsSMn8a1N2YtkdXX0XXHP175w==
X-Google-Smtp-Source: ABdhPJwB6Cs9Lhk4qONOezwN+43kPHmJYOZJNVYA/rnW7MUA1+lgbaWW/jXnkYplQ9cinTnWg8G1jw==
X-Received: by 2002:a17:90b:1b0b:b0:1b9:bfa8:89a5 with SMTP id nu11-20020a17090b1b0b00b001b9bfa889a5mr284615pjb.211.1644996827180;
        Tue, 15 Feb 2022 23:33:47 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:8ce7:5b2:9787:1a0b])
        by smtp.gmail.com with ESMTPSA id k18sm16957736pfi.10.2022.02.15.23.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 23:33:46 -0800 (PST)
Date: Wed, 16 Feb 2022 15:33:44 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2 3/6] platform/chrome: cros_ec: determine
 `wake_enabled` in cros_ec_suspend()
Message-ID: <Ygyo2A2/isridxhv@google.com>
References: <20220209045035.380615-1-tzungbi@google.com>
 <20220209045035.380615-4-tzungbi@google.com>
 <CACeCKad4hs3WMt_fVQHdwOGF3xW8boKKOKsF8xR4o8q8-0jxnA@mail.gmail.com>
 <YgOLLmLKQWNyjvr1@google.com>
 <CACeCKadSTq22aN1mwpT2re5dcA0J+GW7R8=gg4no5MB6j9m+Bw@mail.gmail.com>
 <Ygx53F0bziAWceqJ@google.com>
 <CACeCKaduGaq-s-XO7FZ1Hin6Nr15_v_6-KUmbO-F+MWDu-gWMg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACeCKaduGaq-s-XO7FZ1Hin6Nr15_v_6-KUmbO-F+MWDu-gWMg@mail.gmail.com>

On Tue, Feb 15, 2022 at 09:55:13PM -0800, Prashant Malani wrote:
> On Tue, Feb 15, 2022 at 8:13 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
> >
> > On Tue, Feb 15, 2022 at 05:07:43PM -0800, Prashant Malani wrote:
> > > On Wed, Feb 9, 2022 at 1:36 AM Tzung-Bi Shih <tzungbi@google.com> wrote:
> > > >
> > > > On Tue, Feb 08, 2022 at 10:05:58PM -0800, Prashant Malani wrote:
> > > > > On Tue, Feb 8, 2022 at 8:50 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
> > > > > >
> > > > > > `wake_enabled` indicates cros_ec_resume() needs to call
> > > > > > disable_irq_wake() to undo enable_irq_wake() in cros_ec_suspend().
> > > > > >
> > > > > > Determine `wake_enabled` in cros_ec_suspend() instead of
> > > > > > reset-after-used in cros_ec_resume().
> > > > > It sounds like we can accomplish the same thing as this patch by either:
> > > > > - Initializing ec_dev->wake_enabled = false during cros_ec_register()
> > > >
> > > > This doesn't sound like a good idea.  Value of device_may_wakeup(dev) changes
> > > > during runtime.  It should check in cros_ec_suspend() instead of in
> > > > cros_ec_register().
> Actually, circling back to this (apologies), can you provide an
> example of this changing during runtime?
> I'm not aware of one, but I could be omitting some use cases that you
> might be familiar with.

If someone `echo disabled > /sys/devices/.../spi0/spi0.0/power/wakeup`, the
value of device_may_wakeup(dev) would change.
