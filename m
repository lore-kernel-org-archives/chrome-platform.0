Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C533C26
	for <chrome-platform@lists.linux.dev>; Tue, 13 Sep 2022 17:16:41 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-12b542cb1d3so24181382fac.13
        for <chrome-platform@lists.linux.dev>; Tue, 13 Sep 2022 10:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Ocxjo35udI1PCsICedaTIJJcwxQkPE4mGIgm+5z0B4w=;
        b=L4STRuLquN7OF6csoCKryCpsHF+MSPT7hmt1txFq+InyL3o95Ywbg85vdW+RTSamWM
         n7x1kYjK1Op6F0QRalLsLu4qnduc6ycrWfKJ+60UTYkSvf4WmAWy8b5nv48vnQkDhf28
         ZVpqFIv3PlnHjRHk17dEaL/NWf6G6oUxFpkkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Ocxjo35udI1PCsICedaTIJJcwxQkPE4mGIgm+5z0B4w=;
        b=BlK3rWR+8UhtT/Y6zxaSevk7sNhKnCJ2+Sb1xNmQWBhaGkrxU/rBAhgty5eNfpOTCZ
         DLf7oXD/QzAtEQeP8BdYO9eFNBd3oaJCjwo09BMObTWFCWBYCmLcoik860vxVlnRHoM3
         Sdj9ABHkDZjIXfoD8JFlDHvQjRusLvuUWMLCKUSzo3U02EKw7nA/uAtyJDcoC12Wyt/T
         lN3i3WFWOYwX3U6xSCSUwOT+OIR9Pgr3vl+bW+lbIOuv1gkk+rrUVXaFLR9Mm0d0pi5Q
         tvAxI24DbD8MZlIGtgR+k1HcwTPtSiPv32eGFqMryjJP9xfAFKMtk5xlm6gLCuJ2RB0c
         HKTg==
X-Gm-Message-State: ACgBeo0/VMjfediTnHm/G5Xg0ojcytxUeaDvD38hnRBrQXc1rvz7R98T
	MBcfI04/Ro4t7cAGyckFpeNbNgv73b/bV06GrGdSHA==
X-Google-Smtp-Source: AA6agR77mKkDP8FTqTEYSb6srnrUgzoDsFso5T+v7aX7QStSNpPwXjJg8fgug8gIBkXUryKmIszsiJh9NwLV8w96mmw=
X-Received: by 2002:a05:6870:1719:b0:126:4acd:fc16 with SMTP id
 h25-20020a056870171900b001264acdfc16mr156352oae.295.1663089400556; Tue, 13
 Sep 2022 10:16:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220912224745.2716345-1-jthies@google.com> <Yx/1neGOF+0jsqvz@google.com>
In-Reply-To: <Yx/1neGOF+0jsqvz@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 13 Sep 2022 10:16:28 -0700
Message-ID: <CACeCKaey3XHBT7u6t9k65CYXTgZ1pUaRGDear+S8L7XjukYjXg@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: cros_ec: Notify the PM of wake events
 during resume
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jameson Thies <jthies@google.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, bleung@chromium.org, groeck@chromium.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 12, 2022 at 8:14 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> On Mon, Sep 12, 2022 at 10:47:45PM +0000, Jameson Thies wrote:
> > Update cros_ec_report_events_during_suspend to notify the PM of wake
> > events during resume by calling pm_wakeup_event.
>
> Could you add some more details about "why"?
>
> > Signed-off-by: Jameson Thies <jthies@google.com>
> > Reviewed-by: Prashant Malani <pmalani@chromium.org>
>
> I didn't see where the R-b tag comes from which has been attached since
> v1.

I asked Jameson to do so, after having reviewed the patch off list.

> You shouldn't attach the tag even if the patch may have been
> reviewed somewhere but not in the mailing list.

That is not a requirement (at least, it is not stated anywhere in
kernel documentation).
There are plenty of examples of patches being uploaded after being
reviewed. Here
is just 1 recent example [1] but I'm sure you can find plenty more.

[1] https://lore.kernel.org/linux-usb/20220913055316.23050-2-shruthi.sanil@intel.com/
