Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC202F25
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 09:36:11 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id y7so1735087plp.2
        for <chrome-platform@lists.linux.dev>; Wed, 09 Feb 2022 01:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bzfBSXWXflDl9dYxH/IDCotSF8eE+l7B2xdx9E9WoD0=;
        b=U1JWA5mvRYQiO/4OZBj2l8o/o9gvPruOIV8IxJ4WbF9HFvn9ebV1OO4O2QE/3Jw08q
         XeFtjOSbJqGIyB4F04TKmHfQd6IHzjzHkijo2LAcNcOLRXZOiS43UcJqGh6R0KGTL1zw
         3N/+aUgHmMIBvSK2TJfRAzM/shL7Com424t7BtKlC5UF9kVpKOyCKnUESsm8fvNlLuaN
         eEkxSdCJwvKqjOVKcwZECf3iamCvGceDdehZQ77++3XknH1I61+xKh6m9nK7JfO9wi06
         hWY+NR3f9Y72wojsUqpMmko405hr8LARcSG+st7A29BjIWk+yCOPkIMzOsAdkVlPR/k3
         /xsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bzfBSXWXflDl9dYxH/IDCotSF8eE+l7B2xdx9E9WoD0=;
        b=i4hsT0bO8AeZNzAbVoMs6NWHiMMCCNIdpwk61hGEGsiHhDRCVnWRR8BYHYvRSDbznZ
         8ua0B6AXsT8DCt41oGYWKEoJUk6Izv+hGf7UFJQLKISksYQhzCIgJiG7pk5cVyVVthRh
         3Bd4IY9Sw1F69SXFnoJq1+rHOZQsIynEi0pepRb3kfJsDOvkyCksl5WaU0Tihouqmrc5
         tVnSK6JPIaF0sutkg/wczoKIOLq543upkmMj1iWsohmLIYFEQMbcrUYadwgAC8lwLsB4
         I5ItMjCr28l7W38wcltB75gRWPW0osD/cFBi/brGVfqbhIPm51Nos3DUvYCvp5E7zDjx
         uHYg==
X-Gm-Message-State: AOAM5323wYHYIU8V5OW3NCE/1FMo7rpFcYwLbt/tVdczxpnEnX1cSQXO
	I6IO8jFwxEV88+GnyfYj255S9n8cAb+fLw==
X-Google-Smtp-Source: ABdhPJzP76/LmY9aC3/lu/tII50oztJfjl6HQZ+Quhor5DBlOqpMonXmCDAZSbZXjJetLbrhVefaXw==
X-Received: by 2002:a17:903:289:: with SMTP id j9mr1268276plr.150.1644399370682;
        Wed, 09 Feb 2022 01:36:10 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:ee29:8b32:75bc:44ec])
        by smtp.gmail.com with ESMTPSA id il8sm5833536pjb.0.2022.02.09.01.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 01:36:10 -0800 (PST)
Date: Wed, 9 Feb 2022 17:36:07 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2 2/6] platform/chrome: cros_ec: remove unused variable
 `was_wake_device`
Message-ID: <YgOLBzePK+EEbUk8@google.com>
References: <20220209045035.380615-1-tzungbi@google.com>
 <20220209045035.380615-3-tzungbi@google.com>
 <CACeCKadu_wunV8YfC8vjK2tkewseNDadbYGATc+-FX0DfUNUZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACeCKadu_wunV8YfC8vjK2tkewseNDadbYGATc+-FX0DfUNUZQ@mail.gmail.com>

On Tue, Feb 08, 2022 at 09:58:41PM -0800, Prashant Malani wrote:
> On Tue, Feb 8, 2022 at 8:50 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
> >
> > `was_wake_device` is unused.  Remove it.
> nit: This commit message doesn't add anything to the patch (it is
> repeating the subject), so it
> should be fine to drop it.

Ack.

> > ---
> In the future, please add a change log for versions here. Quoting the
> patch submission guide [1]
> 
> "One good use for the additional comments after the --- marker
> is...Other comments relevant
> only to the moment or the maintainer, not suitable for the permanent
> changelog, should also
> go here. A good example of such comments might be patch changelogs
> which describe what
> has changed between the v1 and v2 version of the patch."
> 
> [1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#the-canonical-patch-format

They are in the cover letter.  Will copy them to each patch.
