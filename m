Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711662F28
	for <chrome-platform@lists.linux.dev>; Mon, 15 Aug 2022 20:53:41 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id 10so3322080iou.2
        for <chrome-platform@lists.linux.dev>; Mon, 15 Aug 2022 13:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=uc9DV/Vm8k3ggZyBJiM4DPc4itKMLkWtsIueLCMUQls=;
        b=bIzLQ1mCS/G20XnsaN4dTFCvt9i+9+LgfE1kqI80Xn2j8xy9S68G+j7zgUI9n+e9V0
         iF7lz37EqbKz/yHauroPHA4IE9esnp+eSGtXZPje2+P/Nh67Xs6Jt3JA+kJ0paGNnVvF
         d0uwcC2SiIxnEiE2t3Pf+nzvl8Av3XrytT21Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=uc9DV/Vm8k3ggZyBJiM4DPc4itKMLkWtsIueLCMUQls=;
        b=RBVbhO4Z60SX9YYQ44Bv5RMA8hFHVJlQ0K7xNrZNqYaUIZqdOtC5mdBlp+6W+Mw5pp
         CbqVSKjiOE4zTIKaHef+73F/CI2X+xERk6wccpYwchy8X/YVOuDBB2tu6xAos/ew3uFp
         OVXbDPIzwMZ+iOzACTU19su4DEEf4Ck/4FzZHrULNcAnKnMkugyhWjDETWPPhm88yXNQ
         fHmPmnKVXAGLdaqnMlhpxQrsZ1EtZpy5BDyXif3CfswcCtnRtscgP92jtGWYSNjePqfJ
         VnKR6bZDvzBVxQxZy2oRaTgFdSmZGgZhCWMW92qpkfPaoO/YHZeElBg8tz/rchULsob7
         sz7w==
X-Gm-Message-State: ACgBeo3nm/M4O6+jayd8l2jXwanqYzR5+Tk9+L/j6MsaK/hgOMizoG7H
	xPCxyDyd393X/UDe2JCYSmh4dcJOx2NV2x7P
X-Google-Smtp-Source: AA6agR7ifnwUc81UjL6LH46tcLGYwLeVFtSQbHh/vtVpAp80K3Z9Mi4n+8FSzJE+HKr4UpM61ae/PQ==
X-Received: by 2002:a05:6638:16d3:b0:346:a4c6:fcc6 with SMTP id g19-20020a05663816d300b00346a4c6fcc6mr612791jat.147.1660596820565;
        Mon, 15 Aug 2022 13:53:40 -0700 (PDT)
Received: from chromium.org ([100.107.108.157])
        by smtp.gmail.com with ESMTPSA id d70-20020a0285cc000000b003415b95c097sm3804296jai.42.2022.08.15.13.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 13:53:40 -0700 (PDT)
Date: Mon, 15 Aug 2022 14:53:07 -0600
From: Jack Rosenthal <jrosenth@chromium.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Julius Werner <jwerner@chromium.org>
Subject: Re: [PATCH v8] firmware: google: Implement cbmem in sysfs driver
Message-ID: <YvqyM3n48Q/0i9XZ@chromium.org>
References: <20220806204857.3276448-1-jrosenth@chromium.org>
 <CAE-0n53gc=1vwZbhGUaF2EyXotMPjqoQixUMJDidcs7vLmNORQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n53gc=1vwZbhGUaF2EyXotMPjqoQixUMJDidcs7vLmNORQ@mail.gmail.com>

Thanks for the detailed review!

On 2022-08-09 at 20:49 -0500, Stephen Boyd wrote:
> /sys/firmware/coreboot/cbmem?

Fixed in v9.

> > +#include <linux/ctype.h>
> 
> What is used from this header?

Not used, fixed in v9.

> Are all entries supposed to be writeable? Are there entries that are
> read-only?

The idea here was that we could use crossystem to update the cbmem entry
when it makes changes, however, I do see this as an odd usage of the
ABI, and in v9, I removed writing entirely and all entries are now
read-only.

If tools like crossystem need to maintain changes to this buffer, they
should either maintain that copy themselves in /run or something, or
daemonize and keep it in their process' memory.

> > +       return cbmem_entry_setup(entry);
> 
> Is there a reason this isn't inlined here?

cbmem_entry_setup was already a little long, so I just did this for
reading clarity.  If you think it would be clearer just inlined here, I
can change it (let me know).

> Need to set .owner = THIS_MODULE unless you use
> module_coreboot_driver().

Done.

> > +       if (!coreboot_kobj)
> 
> cbmem_kobj?

Done.
