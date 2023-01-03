Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C492AD21
	for <chrome-platform@lists.linux.dev>; Tue,  3 Jan 2023 23:17:49 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id c17so46088102edj.13
        for <chrome-platform@lists.linux.dev>; Tue, 03 Jan 2023 15:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vStwvEQbiV2mr3vijNxPNHdTfgr7lAC4u1xrCI60Bdg=;
        b=pYGDtZ+bzV6zHFUH03ggCcxRxWz+e8R2bchovA3ppHCn2hu4kKocUs214DkdOBJxpE
         uHjwMOWiU6D7Qh2WDKMnPlIhRaESr+UPPZsA6MdVP3d0e4gQbZhK6SVYSMP8rfNOK569
         JoR3BKnETOOfUlgSliSFlkQ094/pxsYvAALFYJPpvWMSkY/mcMoeK0RMyICJ44iqID2i
         1BP3Pkk+R4wWngH+hSccdZnPOpOccHyi0FDflldqDhQURDYeKdO5CcQMF1Bb/6O6b9Qy
         uF+Q3Kn7G3joix8W+vvXQGFcZr/ogOi7BdIi5ecdukHo9+rjAv9r4LUb4cRNTBIQRHro
         AFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vStwvEQbiV2mr3vijNxPNHdTfgr7lAC4u1xrCI60Bdg=;
        b=7bbhHceFidCeA2VyRNkDb8dT/ZVFxtgMVqlsFZQGFKbqdckKOBzYQr1YGckhzh3svf
         Bd495RGejKbyabUiTcPLTWxU51dblYhJ3fdAFg7nzvTdcgbvdVEhg7rJ/GcA412stvXT
         wsRDZFO0KkXJmoa16KuJQjQyueqlIUbyjU8pS/vEAjVlwH30wAmoAt9EzekwhTdCWt2h
         UYSF9GtbYPW3oxcanXkcbbnlt02dp6gLBj4PbgOUij79L4fAxvqJbBVoRL3FG+b1k//0
         nV39QCRbLS4WYJBk546W8hS/V+EPkWk/betSR3pRHQEE5dUl4x5qVcm7faE2AEQ3eqge
         eOfQ==
X-Gm-Message-State: AFqh2kraTJT7Wzm8XOdQPXwoapHO/O4ZlG+Kcw/G+g1OO0LDQpo17dCt
	b7kpRSbbLdsS3sNQiCK6kQL269IHcLp0PYlKE/hb0A==
X-Google-Smtp-Source: AMrXdXveAvhBJ+keiXUSQwku3iOSC/1kGETKCiraL9urwR9Vst2IUYroaZH5WwQ+u2ntQihmVK0Iz3+XlZ5pdYSsc8U=
X-Received: by 2002:a05:6402:5413:b0:47f:94c1:6fa2 with SMTP id
 ev19-20020a056402541300b0047f94c16fa2mr4975818edb.180.1672787867302; Tue, 03
 Jan 2023 15:17:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACeCKafGg5=1MQQdCtXDm-3LE2VsixHPsUDngRwQXUvAwQ=u=Q@mail.gmail.com>
 <20230103225204.346088-1-robbarnes@google.com> <20230103225204.346088-2-robbarnes@google.com>
 <CA+ASDXMVDMO4BXuHYDzZwF5OyULCdgxhcLm52Xv43TKKmEHrPQ@mail.gmail.com>
In-Reply-To: <CA+ASDXMVDMO4BXuHYDzZwF5OyULCdgxhcLm52Xv43TKKmEHrPQ@mail.gmail.com>
From: Rob Barnes <robbarnes@google.com>
Date: Tue, 3 Jan 2023 16:17:11 -0700
Message-ID: <CA+Dqm33MpMtsvuftv7+RdDpZVsjJpUSxB-YW=M-jPGO9znqt9Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] platform/chrome: cros_ec: Poll EC log on EC panic
To: Brian Norris <briannorris@chromium.org>
Cc: groeck@chromium.org, pmalani@chromium.org, chrome-platform@lists.linux.dev, 
	dtor@chromium.org
Content-Type: text/plain; charset="UTF-8"

Yep, looks like I made a couple mistakes here. I also sent it as a
reply instead of a new thread. Will send a v3. Thank you.

On Tue, Jan 3, 2023 at 4:15 PM Brian Norris <briannorris@chromium.org> wrote:
>
> On Tue, Jan 3, 2023 at 2:52 PM Rob Barnes <robbarnes@google.com> wrote:
> > Change-Id: I622a5e99b8be922f5c1a8004a863cf94a63ac813
>
> Gerrit Change-Ids don't belong in upstream commit messages. You could
> either use `patman` (from the U-Boot project) to send your patches (in
> which case, the Change-Id can be helpful to patman in constructing
> useful Message-Ids, and patman will strip it in the final mail), or
> else run checkpatch properly, which would complain (unless you're
> using something like `--ignore=GERRIT_CHANGE_ID` on the CLI or in
> ~/.checkpatch.conf).
>
> Presumably the apply-er can fix this, or else if you have a v3+, might
> as well fix it yourself.
>
> Brian
