Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73AF7F
	for <chrome-platform@lists.linux.dev>; Wed,  4 Jan 2023 01:20:26 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id b88so39318866edf.6
        for <chrome-platform@lists.linux.dev>; Tue, 03 Jan 2023 17:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VtynKgHKK/QGiMahjs2wAyzlhZQp4DgmrYzcxItQDpM=;
        b=QeS7niR/OrwJ9uSxVne/IMbRPfZlNwm8fGqft3B216G0BGxcuGcVr9YERFjfc4qvwf
         zuY7SgBXvvCz9Hh+PYR/t2/eLotDpWZzRP+6XdLeHIXzW8TSYkAzGcvXveK9wF+Tl/6V
         tBIW3dF1XKC60dTmscSrGhu9o4Z37kQjs2nyn5cGCl6AuCO1mNFtq2MDhydzBmHzblZ+
         FPBllDmod5H2Lu3vyO+GXA55ZJowIJ1SuNAX7JjnjgeQldM9J2TH80nTRG6YuKtbiRcM
         DwvZx0aAUo91hlEPuOhot92wwkzGAzRf3qmK2uWVflYgi6/NGZ2XyYzFKYR+KeWlfnpt
         obtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VtynKgHKK/QGiMahjs2wAyzlhZQp4DgmrYzcxItQDpM=;
        b=iz0tiZNTWgQ253K/TP6EfC3A4DGYKLhVBVOYAUPRClZxdVNaJMt6KaaDX3iHUoz/h5
         wKAdvk6LQCM7/VxoH53d/CV0pl2AiIVyR354g9+vLTwb5eKqVWUOC5r+7k2iIPa95C9X
         oupkjLp7uEDvkx9MGn5pXUt6bzG/sN+D2H79p/MybzF40ovft14/CCiu6JAlwex8hFYT
         kNt9Q8iCqAUC9vf+KF3OGrC8NWEZ67IzUbaBtyuQ6iFu66AqWo7WAMxVZ653CBJzrGMF
         UmAbkGRMD2L3xG4+4K2YrbZ9WtIvvfCHJVFWg86FV21BeNduZiaAw6YCmWYBCT6t00VK
         4UAA==
X-Gm-Message-State: AFqh2kqTNuftQPoklTnUbmsPhrEHuPKwY3ycmLyjWoi93dm8Sdurhdoz
	O0gDnW7Rvha9kTW/rsA8Xip+WzD54AWGKJm2EsH/DA==
X-Google-Smtp-Source: AMrXdXt2a4i2MLKPACRV4r6g9f6Y2xxSpK4cgK3e7AzJptfR7gAZzLbKlfQVAZvxCOMcUjXFy1NtTOmbMr2RCLvEo4Q=
X-Received: by 2002:aa7:de9a:0:b0:48e:ef30:a81 with SMTP id
 j26-20020aa7de9a000000b0048eef300a81mr178064edv.135.1672795224681; Tue, 03
 Jan 2023 17:20:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221221185540.2265771-1-robbarnes@google.com>
 <CACeCKafZu=46NE--r9W-wtJWAhj8=s46yCBO4N4u5nt4COqYAQ@mail.gmail.com>
 <CA+Dqm30XF=wDVcdUabbHySp-fwf+zFNqXpdYDW3bDTOwRbkiZw@mail.gmail.com>
 <CACeCKafGg5=1MQQdCtXDm-3LE2VsixHPsUDngRwQXUvAwQ=u=Q@mail.gmail.com>
 <CA+Dqm33CAjWv=DFhp0+iee2-EugJzjWOYcyfieaULq2H9egheA@mail.gmail.com> <CACeCKad+cdVLi8Qq1R2j+jkRkyF6Mktu_64oq4Ewi0TWXSKJ-g@mail.gmail.com>
In-Reply-To: <CACeCKad+cdVLi8Qq1R2j+jkRkyF6Mktu_64oq4Ewi0TWXSKJ-g@mail.gmail.com>
From: Rob Barnes <robbarnes@google.com>
Date: Tue, 3 Jan 2023 18:19:48 -0700
Message-ID: <CA+Dqm33ZE77nqfNcDA91noZtrx_35G=usCXd5CiCi8HbtceZjg@mail.gmail.com>
Subject: Re: [PATCH] drivers/cros_ec: Handle CrOS EC panics
To: Prashant Malani <pmalani@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, dtor@chromium.org, 
	Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 3, 2023 at 4:28 PM Prashant Malani <pmalani@chromium.org> wrote=
:
>
> On Tue, Jan 3, 2023 at 3:15 PM Rob Barnes <robbarnes@google.com> wrote:
> >
> > On Wed, Dec 21, 2022 at 5:38 PM Prashant Malani <pmalani@chromium.org> =
wrote:
> > >
> > > On Wed, Dec 21, 2022 at 3:55 PM Rob Barnes <robbarnes@google.com> wro=
te:
> > > >
> > > > On Wed, Dec 21, 2022 at 12:23 PM Prashant Malani <pmalani@chromium.=
org> wrote:
> > > > >
> >
> > >
> > > It's just I find having a notifier for a single use case overkill(eve=
n
> > > 2 would be fine); one could get away with exposing a method
> > > in cros_typec_debugfs via a local .h file (it can compile to a stub i=
f
> > > cros_typec_debugfs is not compiled to the kernel);
> > > the LPC code can then just call that method instead of invoking a not=
ifier.
> >
> > My first implementation did make a direct call to cros_ec_debugfs.c,
> > but an internal reviewer recommended using an event notifier instead.
> > So I'm histent to go back to a direct call.
> >
> > There may be other sub drivers that want to handle EC panics. So I
> > think keeping this as a separate notifier makes sense given the
> > constraints.
>
> The issue with that reasoning vis-=C3=A0-vis your implementation is that
> the panic notifier is tied to cros_ec_debugfs. What if another
> (sub)-driver wants to use the
> panic notifier to do something, but that system doesn't have CONFIG_DEBUG=
FS
> enabled?

There isn't a dependency between cros_ec_debugfs.c and
`panic_notifier` inside `cros_ec_proto.h`. So (sub)-drivers can handle
EC panics when CONFIG_DEBUGFS is not enabled.

>
> Having a direct/explicit dependency avoids that issue; LPC depends on
> debugfs being compiled
> to have the log printed out (a stub is used when debugfs is not
> enabled), but nothing else
> relies on debugfs for a panic notifier.
>
> BR,
>
> -Prashant
