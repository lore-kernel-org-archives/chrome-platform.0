Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663E23D8A
	for <chrome-platform@lists.linux.dev>; Mon, 24 Oct 2022 16:50:02 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id e4so5524825pfl.2
        for <chrome-platform@lists.linux.dev>; Mon, 24 Oct 2022 09:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g3A6vDPMv3F3KIpxPBADrLLMFIt3FEE5xjPiL8dT7O4=;
        b=Bu699l2oLZROaWe8FoHoulDWewC5gwGkuq/GyWC+/N5wxDrPQdCJMJ9WIC0jFqNo2X
         wT9n8LMg4gci8RLiseB1ZWLUgzHkU4KQnlkCkRpS/8NZ9q74d2ckAlbnP/HbvL+SSPjB
         lvtYvkm+FPo/ZuvgTik/6CCsKq4Yl2ov6nYB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3A6vDPMv3F3KIpxPBADrLLMFIt3FEE5xjPiL8dT7O4=;
        b=WrF/toPlKL2sV2O/jWhyPfZc1fvp3ahPB94g6NsF2ySgn0cDCUrgvbtBn7G4NMH9id
         Z8wC+Bsc0Q5+ru3DX8nIOktx5/wzc+lQvY7AM8+ldE2rqr5A8Y4Sa0XfY8eLVy9Ohzvz
         BjdkDJvXf94pSN2lGcJj52O/cBCY4slC6QqM1b9djnkGOWAefSEOLz3d3YdkBG81Tdqs
         UyW6yXjIBXIHXYXkj7Iy/F6FYoJ2TRoG1VboDIimfEuqGRhLyLhvJYwsLJ21GQ7P5igS
         lg/1twnyHMLwBZH76I3beZKWJj+1lyz1rr0mgktE5av3Pw8bbckOCVFFCGeu590o+QWO
         MozA==
X-Gm-Message-State: ACrzQf1aWK97E70r7Co6/Kwuy7GJrjhlTAvRwWMIyy5bTsFcY/+rwB4A
	c8R0MSYLwSn1VefuXgpRyjtKnA==
X-Google-Smtp-Source: AMsMyM5nwQqpR6wcZ8pki56eSHOedD5H4An5+8xEyfpAdEiZVMUwUKUF/cq3ebCgspChZ9xNzujZjw==
X-Received: by 2002:a63:1e5a:0:b0:43c:b966:e2d6 with SMTP id p26-20020a631e5a000000b0043cb966e2d6mr28489091pgm.569.1666630201831;
        Mon, 24 Oct 2022 09:50:01 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:9a0e:1111:32b6:fd69])
        by smtp.gmail.com with ESMTPSA id v8-20020a654608000000b0044046aec036sm17187768pgq.81.2022.10.24.09.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 09:50:01 -0700 (PDT)
Date: Mon, 24 Oct 2022 09:49:58 -0700
From: Brian Norris <briannorris@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julius Werner <jwerner@chromium.org>,
	chrome-platform@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] MAINTAINERS: Add drivers/firmware/google/ entry
Message-ID: <Y1bCNs76nTGWcS3l@google.com>
References: <20221021172624.1.I119456791d197eb7d159f09e7479d8759008a954@changeid>
 <Y1NlwY+RnKth++bW@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1NlwY+RnKth++bW@google.com>

On Sat, Oct 22, 2022 at 11:38:41AM +0800, Tzung-Bi Shih wrote:
> On Fri, Oct 21, 2022 at 05:26:47PM -0700, Brian Norris wrote:
> > Per this conversation:
> > https://lore.kernel.org/lkml/af9c4bfd-d3fb-1c7a-fb38-0d8bbd507449@roeck-us.net/
> > Re: [PATCH] firmware: coreboot: Register bus in module init
> > 
> > I guess if this is fine with folks, Tzung-Bi might queue this up?
> 
> Ack, I can queue both if this is fine with folks.

I'll assume that might happen eventually.

> > +GOOGLE FIRMWARE DRIVERS
> > +M:	Tzung-Bi Shih <tzungbi@google.com>
> 
> Please use <tzungbi@kernel.org>.  I prefer to use it for Linux community.

OK! I was just imitating your existing entry for CHROMEOS EC CODEC
DRIVER, which lists google.com email. So you might want to fix that one
if you want people mailing @kernel.org.

I'll assume you will fix that when applying. I can send a v2 if someone
else plans to commit it.

Brian
