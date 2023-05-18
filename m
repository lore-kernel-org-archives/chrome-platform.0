Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6367617AB6
	for <chrome-platform@lists.linux.dev>; Thu, 18 May 2023 16:47:35 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-3f38d2c36fdso11497581cf.2
        for <chrome-platform@lists.linux.dev>; Thu, 18 May 2023 09:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684428454; x=1687020454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EO246ZqiVBRxZDxMtJpAios9D2U+bi/JcOcYKYzfYJ8=;
        b=C0SkUL7LTPqYi++TtcB64tB2yY2rMEzGkd4D9JFvGhePfWVTDkxBuKx/m+Hi4c+sDI
         hthy6WeL3lc3ehF7bnAH2sXSAyXRLjoRbfpr0fYpkylrx6wNHoDwqSJVFZPj9RkEKkbh
         2/FmwnPZrd/lh5lbL8RpbmOjKrPaqlsOOUbPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684428454; x=1687020454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EO246ZqiVBRxZDxMtJpAios9D2U+bi/JcOcYKYzfYJ8=;
        b=VWFaDe8nEWm5abSZXxq7814mf+vl4vDvOqEfObF7s9v+lY0eIEYYRTHkoqcQABr3O8
         LXXMkXx+hP8oOcaBZyGKucnAMmVT6cMBz4D+y522le6K8Yf7cwL447Vi6XB7/hl3qxh8
         v1vpCJmsAoXFkoo7RS5ow4e0uT7l7cr1WVQMPdlKZJp6JFUdNkArAZeaQI7Wbd7Lzo48
         TKnCarert2A0o6CMfKoRuZqAgyDjySqPz8PZ4f3ncuB5HVHEpjY/PaOpYSNYYcKOiMvY
         ONWnvnh3UGPfq28TfzM2xFhr+6Kq9fwKs5FmH8DXO84HPaZyT4n0ob+LqFfHVMoGS+iY
         DCcA==
X-Gm-Message-State: AC+VfDypq89wwge4j1sz/bHoGkzkXLUr0tPJf1Hrii0pqlG/dKk1Go3R
	lS4Xzms5FxOKxS1ZSfNGN3gEBcJ3+wBn5+ZtWOU9qw==
X-Google-Smtp-Source: ACHHUZ5C8U/4R0hjO7Jl5obKdU8v3+0pW5C3Prfqf33Ma5bKHHByD+VEYyCANUA7CHqRjEdt9Y7ADQpAwi48muRxbW0=
X-Received: by 2002:a05:622a:189e:b0:3e6:2e9e:58f1 with SMTP id
 v30-20020a05622a189e00b003e62e9e58f1mr434517qtc.59.1684428454207; Thu, 18 May
 2023 09:47:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230515142552.1.I17cae37888be3a8683911991602f18e482e7a621@changeid>
 <ZGQ9Y+vqWhQLHAQh@google.com> <CAMaBtwHxaevxLY7zWNDU8zbyWx=puLkeeRAjFtovvrA5pjtJ4w@mail.gmail.com>
 <ZGWBhEMmo2lStTg9@google.com>
In-Reply-To: <ZGWBhEMmo2lStTg9@google.com>
From: Tim Van Patten <timvp@chromium.org>
Date: Thu, 18 May 2023 10:47:23 -0600
Message-ID: <CAMaBtwFtE=vjuhVy7rw9zCe9WV0dRyeBWj88JH2j3bkbh2BkXA@mail.gmail.com>
Subject: Re: [PATCH] [v9] platform/chrome: cros_ec_lpc: Move host command to prepare/complete
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, robbarnes@google.com, 
	lalithkraj@google.com, rrangel@chromium.org, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, Garrick Evans <garrick@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 17, 2023 at 7:38=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Wed, May 17, 2023 at 09:56:59AM -0600, Tim Van Patten wrote:
> > > I can understand the patch wants to notify EC earlier/later when the =
system
> > suspend/resume.  But what is the issue addressed?  What happens if the
> > measurement of suspend/resume duration is not that accurate?
> >
> > Please see the following:
> > - b/206860487
> > - https://docs.google.com/document/d/1AgaZmG70bAKhZb-ZMbZT-TyY49zPoKuDD=
bD61dDBSTQ/edit?disco=3DAAAAws1enlw&usp_dm=3Dfalse
>
> I have no permission to access the doc.

Since you work at Google, please request permission to access it, so
the owners can grant it.

> Please put the context in the commit
> message.

Done in the next patchset.

> It's usually helpful if you could put the corresponding EC FW
> changes.

Why are you assuming there is EC FW with this change? Any and all of
the EC changes related to this have (obviously) landed long ago.

> > The issue is that we need the EC aware of the AP being in the process
> > of suspend/resume from start to finish, so we can accurately
> > determine:
> > - How long the process took to better gauge we're meeting ChromeOS requ=
irements.
> > - When the AP failed to complete the process, so we can collect data
> > and perform error recovery.
>
> Is it a new feature?

No, it's not.

> How could the *error* recovery do?

I don't understand what this is asking.

> > > What about other interfaces (i2c, spi, uart)?  Do they also need to c=
hange
> > the callbacks?
> >
> > We aren't concerned about those devices, because they aren't being
> > used on the devices we're seeing issues with. If devices using those
> > ECs want this change, they can pick it up as well, but we don't have
> > any way to test changes on those devices (whatever they may be).
>
> This doesn't sound good.  As I would suppose you are adding some new EC F=
W
> features regarding to EC_CMD_HOST_SLEEP_EVENT, you should consider the
> existing systems too.

Again, why are you assuming there is new EC FW for this? This is only
changing when an already-existing host command is being sent. Nothing
is being added or removed.

> What happens if a system uses older kernel (without this patch) to
> communicate with new EC FW via LPC?

The message is being sent regardless of whether this patch lands or
not. This patch just changes when they are sent, so there is no risk
from that perspective.

> How about adding a new EC host command for your purpose so that it won't
> affect the existing systems?  I knew this was discussed in some older ser=
ies
> but I didn't follow the thread.
>

No. The necessary host command already exists and is being sent. There
is no additional command being sent with this change. It is only
changing when the command is being sent.
