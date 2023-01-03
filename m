Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA45AD27
	for <chrome-platform@lists.linux.dev>; Tue,  3 Jan 2023 23:28:00 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-476e643d1d5so340781487b3.1
        for <chrome-platform@lists.linux.dev>; Tue, 03 Jan 2023 15:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8l9QQnnx7pQWx8WivUZKbIX8ABABPh7UytyXM59oII=;
        b=HOfuuQJqksmRSu3EpPqLC6xDLLLVQdTihgvOvbvivCKtODqrx4jD6THiCNjc/3wMPx
         fyucRLzMc/O5q5bIBn0jBP5HFD9NarzHovHdfw3x5jT5bIeXsK24cKRv/rhKH9So+Hw+
         gjCkk2/mgVhXlZEJ5A7nEZD+MzDSOZZ1OIHAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L8l9QQnnx7pQWx8WivUZKbIX8ABABPh7UytyXM59oII=;
        b=Go80WS2aDofxueECJGZDmGb9QCh/9eWQAGp+HX6hJfVo+xjls7CW2gvq6CjdkogJ/o
         1KHEQxKBK2skIpULFgrFzN5poMjcDwo1LurcBCM+C3u6F/4t5WTFn+dajdGoLnT+rgQ+
         2+Iuvs3DSUBc4TWxO8NLseEmfIGCDgHOZUEketuzLmrGIduZ/imfZjTJ+Ryb7oqCGfav
         EDNZKfoHl61p5vB6e/2b4uDNCvPZ/qpSvKsL1oRKe1G23abrv/oBVGemy6VVXoyai2KC
         eK7xSBsyAK6llVcG5Kiu/+df9kqWf1a8LI01FoiP1Ffs5LPOs2SVabIPlBZ1Hk7CsxY4
         pCqQ==
X-Gm-Message-State: AFqh2kq95153mSKQ2go5sMI9spM8iQqkKpaiB5qbGfM9Q/lE+MM47Q6t
	G+Z0InCLfDBi1ZP73qOE3ueks8hDRkfkQeBxTKzPHw==
X-Google-Smtp-Source: AMrXdXs7CO9UoGvmqSlN1Oc57sVUqBz0Y+Bqcr+xyEbJFqNg8gHRYBydcqrnb/KlfGZI8R1k5DBypNWgu+R+wAjv/AQ=
X-Received: by 2002:a81:c30e:0:b0:4b2:72:d8ee with SMTP id r14-20020a81c30e000000b004b20072d8eemr412253ywk.272.1672788479482;
 Tue, 03 Jan 2023 15:27:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221221185540.2265771-1-robbarnes@google.com>
 <CACeCKafZu=46NE--r9W-wtJWAhj8=s46yCBO4N4u5nt4COqYAQ@mail.gmail.com>
 <CA+Dqm30XF=wDVcdUabbHySp-fwf+zFNqXpdYDW3bDTOwRbkiZw@mail.gmail.com>
 <CACeCKafGg5=1MQQdCtXDm-3LE2VsixHPsUDngRwQXUvAwQ=u=Q@mail.gmail.com> <CA+Dqm33CAjWv=DFhp0+iee2-EugJzjWOYcyfieaULq2H9egheA@mail.gmail.com>
In-Reply-To: <CA+Dqm33CAjWv=DFhp0+iee2-EugJzjWOYcyfieaULq2H9egheA@mail.gmail.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 3 Jan 2023 15:27:48 -0800
Message-ID: <CACeCKad+cdVLi8Qq1R2j+jkRkyF6Mktu_64oq4Ewi0TWXSKJ-g@mail.gmail.com>
Subject: Re: [PATCH] drivers/cros_ec: Handle CrOS EC panics
To: Rob Barnes <robbarnes@google.com>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, dtor@chromium.org, 
	Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 3, 2023 at 3:15 PM Rob Barnes <robbarnes@google.com> wrote:
>
> On Wed, Dec 21, 2022 at 5:38 PM Prashant Malani <pmalani@chromium.org> wr=
ote:
> >
> > On Wed, Dec 21, 2022 at 3:55 PM Rob Barnes <robbarnes@google.com> wrote=
:
> > >
> > > On Wed, Dec 21, 2022 at 12:23 PM Prashant Malani <pmalani@chromium.or=
g> wrote:
> > > >
>
> >
> > It's just I find having a notifier for a single use case overkill(even
> > 2 would be fine); one could get away with exposing a method
> > in cros_typec_debugfs via a local .h file (it can compile to a stub if
> > cros_typec_debugfs is not compiled to the kernel);
> > the LPC code can then just call that method instead of invoking a notif=
ier.
>
> My first implementation did make a direct call to cros_ec_debugfs.c,
> but an internal reviewer recommended using an event notifier instead.
> So I'm histent to go back to a direct call.
>
> There may be other sub drivers that want to handle EC panics. So I
> think keeping this as a separate notifier makes sense given the
> constraints.

The issue with that reasoning vis-=C3=A0-vis your implementation is that
the panic notifier is tied to cros_ec_debugfs. What if another
(sub)-driver wants to use the
panic notifier to do something, but that system doesn't have CONFIG_DEBUGFS
enabled?

Having a direct/explicit dependency avoids that issue; LPC depends on
debugfs being compiled
to have the log printed out (a stub is used when debugfs is not
enabled), but nothing else
relies on debugfs for a panic notifier.

BR,

-Prashant
