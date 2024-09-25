Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E9B145B0C
	for <chrome-platform@lists.linux.dev>; Wed, 25 Sep 2024 21:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727300161; cv=none; b=R01gOW0lcgwnzbVxykHRTgklXkxh3IxTifDcejmWksc1WJZzj3+O5vkyG/vW7e69QdpZloHzCCZo6f/04bHbHip8imTVNNEwjtNEk9ICZSczKydA2zP6AmaYXNS6aCN5VFZWzZLQGPDJpqEh9QDiEytzSDi0ociFcSOaC/TVVOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727300161; c=relaxed/simple;
	bh=w/U41aehYYnar9eXC2LNfUFdr0vims1gK3y46aaFPfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5BwzjKbZNgBDrTHeQ1n29NMRUaei2lqZAJLwIG6MtyRKcpcSOsGbUT5NDG7Zyd7UZDVNnb7Bmcuf4BgcmThN0Ox0h4SEirDXHgWCQveBXrxn6dxv35IdvlsRofZwzW4/mjEl6Jov24revhwIIdWIprdRx2KZfcjKznzsqR4Tug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DyFgmheM; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DyFgmheM"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6ddfdeed0c9so3285357b3.2
        for <chrome-platform@lists.linux.dev>; Wed, 25 Sep 2024 14:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727300159; x=1727904959; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJc7BnAHTydvAlhM4HvU3wD0ZiOQy5pouzF9fx22KGs=;
        b=DyFgmheMsTAPpqDVW09Uc11H2ocMJ+lKSxr87+zHLVHOrxn4u1DBm5ImSNbG3A+rTS
         OWUx+RA1GjJbkqAKtoCI+dC7bIvSD4it1uaMuzZ3kTkOmQiPuLxMzjj8bgNLbCkCv0/9
         6CMrgqJfz3m/sEVkVc1ECM/rMt7PvuMLlhk+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727300159; x=1727904959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJc7BnAHTydvAlhM4HvU3wD0ZiOQy5pouzF9fx22KGs=;
        b=VAnE/jLjZNxBPuLu4rEAwQEWKpXI0e+iOuOax0+LAfYNbxMoF97bgpAdb0/qjWbu7M
         obIIHvH93dpZT9WK34hSa3/AbPfhh5oc+6HowNA6J3FtBdcK5M/kbjyYDKUYXFqXOOiP
         6a+f0WVh+Mn+90wjwAkAc6IKFs6jLB5vDh4/fiVSvY4e0xKOpX7E18/28BYv0SjHOwx7
         lJsMc5FqMt+JdmtYRK1ah8dF4P3n4lQF/ByVGg/cJnaJhcpMyKmhOtP6lsLejXRpnoUF
         plmtxNH/nk7m8Cv8f9mzVleFNNwpZVTyCVL8q12UpqbI12BvfVUBUxHYzPvxGZK88zfK
         6ACw==
X-Forwarded-Encrypted: i=1; AJvYcCV/q6GNXJ3YPTXuJFVJkwxZ8Po8FAl6VaE5XzTKcebUNTvT07xmcfRRfysozu3DJ4CSqLwnSAun4JcP5tw+WeY=@lists.linux.dev
X-Gm-Message-State: AOJu0YybugecnAvprKUw4ue8cKC4gleGOpKTRzp6Y+wy7CgBZkFqCBJ/
	AP1bGcnzG5bcClGQqtZp9UIsVUu9cdo7iFM94sYR0MW882leYzob62lnwFsU/3AFg6ADHqcSyf+
	V9S1HiZ8/AZOuWf3W9KhWjfGZcGcBGL0IucxQ
X-Google-Smtp-Source: AGHT+IF7tBArJoHHU070qGz87COGywmcI/kS65A/iHw5CHlxa2ujH5d4trQNVpP2YnkhwuVcJEoP/bJTmwpZL/PBo3w=
X-Received: by 2002:a05:690c:95:b0:6d5:7b2f:60a0 with SMTP id
 00721157ae682-6e21da543admr43301537b3.34.1727300158817; Wed, 25 Sep 2024
 14:35:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925162513.435177-1-abhishekpandit@chromium.org>
 <20240925092505.7.Ic61ced3cdfb5d6776435356061f12307da719829@changeid>
 <gqceveqpbvmiv3mg5cs3k3qd4rr6fpb3xksvxvdhkugr52paoj@olks6bqjc436>
 <CANFp7mX0=9qHb8_UotKjDo8rGemA7L+NGp3J+qSzBg_9Pp2CTw@mail.gmail.com> <pl6xv55ohx3jprgc67umftjrwzlvass75d2pqzzdnktvt3njxh@gbujd5qf3tpz>
In-Reply-To: <pl6xv55ohx3jprgc67umftjrwzlvass75d2pqzzdnktvt3njxh@gbujd5qf3tpz>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Wed, 25 Sep 2024 14:35:47 -0700
Message-ID: <CANFp7mUexd=2u2ndjXsere8D0ek1hEqcttTvdf91M7R4PGJ_Jw@mail.gmail.com>
Subject: Re: [PATCH 7/8] platform/chrome: cros_ec_typec: Thunderbolt support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org, jthies@google.com, 
	pmalani@chromium.org, akuchynski@google.com, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 2:20=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, Sep 25, 2024 at 11:42:46AM GMT, Abhishek Pandit-Subedi wrote:
> > On Wed, Sep 25, 2024 at 10:13=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Wed, Sep 25, 2024 at 09:25:08AM GMT, Abhishek Pandit-Subedi wrote:
> > > > Add support for entering and exiting Thunderbolt alt-mode using AP
> > > > driven alt-mode.
> > > >
> > > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > > > ---
> > > >
> > > >  drivers/platform/chrome/Makefile              |   1 +
> > > >  drivers/platform/chrome/cros_ec_typec.c       |  29 +--
> > > >  drivers/platform/chrome/cros_typec_altmode.h  |  14 ++
> > > >  .../platform/chrome/cros_typec_thunderbolt.c  | 184 ++++++++++++++=
++++
> > > >  4 files changed, 216 insertions(+), 12 deletions(-)
> > > >  create mode 100644 drivers/platform/chrome/cros_typec_thunderbolt.=
c
> > >
> > > This patch looks like nearly exact 1:1 copy of the previous one. Plea=
se
> > > merge both altmode implementations in the same way as tcpm.c does.
> >
> > It's easier for tcpm.c to have a merged implementation because it
> > simply forwards VDMs to the internal state machine to handle without
> > doing anything with them. Our implementation is closer to
> > ucsi/displayport.c which needs to maintain an internal state machine
> > for DP and TBT VDMs and respond differently.
> >
> > I can merge the two but I'd like to understand intent (reduce code
> > duplication? reduce the number of files?). As it is, keeping the files
> > separate makes it easier to understand how each alt-mode operates in
> > my opinion.
>
> Separate common code and AltMode-specific code. This way we reduce a
> risk of errors fixed in only one of two drivers and at the same time the
> driver clearly separates common vs specific code paths (e.g. VDM
> handling is mode-specific, while the rest of the code is common).

Ack -- I'll provide a merged solution in the next version of this patch ser=
ies.

>
> >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry
