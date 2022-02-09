Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDC22F25
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 09:35:33 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id r19so3271626pfh.6
        for <chrome-platform@lists.linux.dev>; Wed, 09 Feb 2022 01:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vve4mROAbniIMQKB3dLdlX5JO74NMTqZFQGGCwkc9rw=;
        b=mhmlE+t5ZCgX9KA8Vs5wKxFbWeSkzpWRxRwBKLx3ZnfoNDXmpo8UcwsJMYv6LN6DF1
         uqHQjHReZH3M0+y8iaAxDD1YpMdi7J5CXDeEDwOYjomavsqkD6zFKe+Mi6qC3EMw9oxQ
         igVgS/zXJjOAcw8nVPEKa+0erg0yS+SJk9qudPQxbuIZjyQDNpQIp4oDaYwEDqTnBU7D
         7cG7Gw80BvwnVh/8l3+vTnCW/8OOHbS2MfA8vQhfq+OFaxB1gY5vt48rUVGFcHC2Mewa
         XiqKFANbMMKX1Pzb4bXr66p3/X6pgBrhJG3+Nmt6koaHq2Hw9s4dXWqbviU3rWl0GFYU
         OGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vve4mROAbniIMQKB3dLdlX5JO74NMTqZFQGGCwkc9rw=;
        b=lwwbPshnCjC3h9iAYFkA01ePkB99XDriYZK97QQkYE2NGJgIj8Msi/0vrWdu7gUs7Y
         1PgoRCWoedScsChkrQo0nGIdSNr0tT8Uzw6YdlmQgT18aS9AcbFEzbnxQXCIYD3Qng2v
         YZgHcdt1Mc5JTYPfGS1hA8tF2vEB3UX+vYswjkwddgFrIIW3m57UVeWp0GBKc6g5+yEq
         l/kvNYqT8/NGeGqYHttJBdNfniUPJMiXOUJYfSyUSTytqXz49PavhDLk3QR6AHbgOuJK
         sm5RKCFKIEaIGJn0camdfCUPAGKjssNe/2Avw37LECE2CKRwWKcPHXeF7Af7ZTbbz4om
         xHYg==
X-Gm-Message-State: AOAM533WiF0XDItFh/NEFku/IfXCA0kQoCN0i0DeXktJ9xVQA+Vi3EMk
	l8uG52DkhISpV4tBsMA5ULbgmQ==
X-Google-Smtp-Source: ABdhPJwtAr32rwmgAtYBsE75Mjnm1ThhjKhSnM6uBMGQTsvQdkfXGILNKqByPncrHCkLwhk+BbP6Wg==
X-Received: by 2002:a05:6a00:2386:: with SMTP id f6mr1318599pfc.37.1644399332606;
        Wed, 09 Feb 2022 01:35:32 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:ee29:8b32:75bc:44ec])
        by smtp.gmail.com with ESMTPSA id x53sm5331614pfu.190.2022.02.09.01.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 01:35:32 -0800 (PST)
Date: Wed, 9 Feb 2022 17:35:29 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2 1/6] platform/chrome: cros_ec: fix error handling in
 cros_ec_register()
Message-ID: <YgOK4eCGzi/g61yU@google.com>
References: <20220209045035.380615-1-tzungbi@google.com>
 <20220209045035.380615-2-tzungbi@google.com>
 <CACeCKadDh0+nTXEy6xC98QLBciD78Oy4DH2749-BfAQ2fBpNXw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACeCKadDh0+nTXEy6xC98QLBciD78Oy4DH2749-BfAQ2fBpNXw@mail.gmail.com>

On Tue, Feb 08, 2022 at 09:38:55PM -0800, Prashant Malani wrote:
> On Tue, Feb 8, 2022 at 8:50 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
> >
> > Fix cros_ec_register() doesn't unregister platform devices if
> > blocking_notifier_chain_register() fails.
> 
> This isn't grammatically correct. Instead:
> Fix cros_ec_register() to unregister platform devices if blocking....

Thanks, will fix in next version.

> > Also use the single exit path to handle the platform device
> > unregistration.
> >
> > This fix depends on the fact that all the callers of cros_ec_register()
> > allocate zeroed memory.
> 
> Is that a fair assumption? What happens if a future driver calls
> cros_ec_register()
> without zeroed memory?

Suppose ec_dev->pd is garbage data, platform_device_unregister() will operate
on invalid memory address.

Let's use another guard condition in next version instead of relying on
zeroed memory.

> > ---
> What has changed since v2? Please add a change log of the versions here.

They are in the cover letter actually.  Will copy them to each patch.

> > @@ -291,6 +289,12 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
> >                 cros_ec_irq_thread(0, ec_dev);
> >
> >         return 0;
> > +exit:
> > +       if (!IS_ERR_OR_NULL(ec_dev->pd))
> > +               platform_device_unregister(ec_dev->pd);
> > +       if (!IS_ERR_OR_NULL(ec_dev->ec))
> > +               platform_device_unregister(ec_dev->ec);
> > +       return err;
> You don't need these "if" checks. They are already performed by
> platform_device_unregister(), or rather, the functions that it calls [1][2].

Ack, will remove the check in next version.
