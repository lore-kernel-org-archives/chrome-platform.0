Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7881F16DEB2
	for <chrome-platform@lists.linux.dev>; Thu,  2 May 2024 17:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714670052; cv=none; b=JXkys3hT5sG5GuStyOJLSEMY9N/sju+jGSec0XM/INWUPPztO7QIGTWV3YgZ5MAJEtU0Yp+AZymrfUe4C0/dRZI/K1rh+em+ku6VWfQFmlhzUt0KBXtYaeFfYJOVREZDRKAs/tp3XYDu5cJ3jp1EqW1WaD4Ogbc1u/MsDzZOkCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714670052; c=relaxed/simple;
	bh=M+EFFfN5AOWJVvoh+ROupDYdG6avtfex+EcAO2xFrkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O1IlIFB1sqrUq/PuLFS92fsqeeHtfQ7cqAfdMlDbtC77fUmDIgFAZkpq8h2gZHv8gSGhWwd8ng0SCYrbj/JaYLHH1x2RC7zVGziQ4ehQW/NmYx2JlcWdJYcucrWpE9jItqd7hA7X6hNQLCryIyRhgFmefHlCcEP+dS4bW2Ebc6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XI3IEG0W; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XI3IEG0W"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-518948e1ec8so231e87.0
        for <chrome-platform@lists.linux.dev>; Thu, 02 May 2024 10:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714670047; x=1715274847; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3YdyEpplbLwxUef53rOnBJ8qJ+pTIxJpLOeiSYJNf8=;
        b=XI3IEG0WGIZGY4AhA56iq9WPY1SZBN5bxcdRa+3ZV1C5gcYUmUOVu8jVuW9cMaC2sh
         eI4DY5NNKyKZ4191FteX/ZPnWfCRtG3LmZ+X2K7qDblaGH13pgUKKbf+D3y+Yl87ONR5
         JXucGdxbIdKEkkFXDLTDXOZ5+Rb9soDQST6xsDQeTnH+wtPa3jix0BWsGPGKS+Rw0JN7
         /ilfwM8gQGxhK2IOq+QBeVaqAl/FVfkNrxdpUcOpj272lbldGwjck1WnlcwozI5rd+Kl
         rCNxAwKj5i1v+tReUbeBIiwbYdPrYFhCBptixDZl2l1PUAA1buErE+nIqaVQHxz3Ysmg
         y+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714670047; x=1715274847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o3YdyEpplbLwxUef53rOnBJ8qJ+pTIxJpLOeiSYJNf8=;
        b=BT/XHEXDEA1CyJ3OW3Q5JUrhyTPboJ1SLjXPXDAagyFN2sixDFXo+6dRcujH7aOC9e
         h9RI1DrqySFbB5KbrWNfQn9f1Op0LG5mdQdcKkG4J0hdQwkseazBkPpqp1hLPpHaN6Cw
         1+WE8nvqB0uL+jjuxohqPkknPq56VDUbnWYSi7kXph1Zb2AAtos2OCHFspf+YnlnKdI1
         o6y4VNuLmfhNPmHf2p3AIhfGi5x+hRlRX+pNpd1oN1L+7hKebC+jtnTElkUDb2sVcf8L
         Ad4y2jpw50i+F/hGK6R8kKSqAijpO6TYx/Bn9GNT83b7KqpN2183kLnbzNPVtWvdsgqg
         clcQ==
X-Gm-Message-State: AOJu0YzQK2kirXQbIwk0QzklORNYLqcaibpAkEY5MjVWREWmZLyIhtiw
	lU0a0RIaYUWEEnqbXbUPMKX8hnCmmsKLTgt4bY+3eL8PQqIrF10Q0zwzagYuj5SpAWSn6dj40Zo
	xwLE02x6O1uBzUMWjVfnm8a28mzzRD5VlmGEO
X-Google-Smtp-Source: AGHT+IHdHm3YVQx+CGhvxsPJgiaJwWtEvTLAY5pP2ZV4N+dr4fnQ2l18I3EOfknJ+iBZv/4AU/jWDb2vOzII/fmUC6U=
X-Received: by 2002:a05:6512:3136:b0:51b:badf:a650 with SMTP id
 2adb3069b0e04-51f0b09c8b7mr137633e87.4.1714670047283; Thu, 02 May 2024
 10:14:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230921141935.3973069-1-robbarnes@google.com>
 <ZQ6k1K//086Ptqg0@google.com> <CA+Dqm30KGiSVnJ+z=ToT_i3xS6dN5+opCHbp-9tfd+ZqxdgJQA@mail.gmail.com>
 <ZRUmLWf6COwE8gtv@google.com>
In-Reply-To: <ZRUmLWf6COwE8gtv@google.com>
From: Rob Barnes <robbarnes@google.com>
Date: Thu, 2 May 2024 11:13:25 -0600
Message-ID: <CA+Dqm33YCze63MkYa43kXDuW=iFjgE9V3kTwLR9x0frnQjbd6Q@mail.gmail.com>
Subject: Re: [PATCH] drivers/cros_ec: Reduce log polling period to 2s
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev, gwendal@chromium.org, groeck@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for dropping this conversation. I'm pursuing a different
approach for setting the ec log period. See
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/=
5509884
for the draft. I will send the patch to this list after internal
review.

Also answering your questions below.

On Thu, Sep 28, 2023 at 1:07=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Tue, Sep 26, 2023 at 12:57:22PM -0600, Rob Barnes wrote:
> > On Sat, Sep 23, 2023 at 2:42=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.o=
rg> wrote:
> > >
> > > On Thu, Sep 21, 2023 at 02:19:35PM +0000, Rob Barnes wrote:
> > > > 2. Yields more recent logs prior to a crash, facilitating easier de=
bugging.
> > >
> > > The approach depends on multiple parties before a system reboot: EC r=
eports
> > > on panic, AP sends EC commands for reading the logs, userland program=
s
> > > (e.g. timberslide) write the logs to filesystem, and filesystem
> > > synchronization.  If anyone in the path didn't work in time, the logs
> > > disappear.
> >
> > This change is just affecting the continuous polling period of the
> > cros_ec driver.
> > Syncing the log immediately after a panic is a separate path and will o=
nly work
> > when EC supports system safe mode recovery, most don't.
>
> I guess I misunderstood.  Is the understanding "EC can't respond to furth=
er
> host commands from AP after EC crashed unless some more special supports
> (e.g. system safe mode)" correct?
>
> If yes, how about after EC reported a panic but before EC crashed?  Can E=
C
> respond to host commands during the period?

System safe mode allows the EC to temporarily recover from some types
of panics. The EC is able to respond to host commands in this
scenario.

>
>
> > The hope with shortening the period is that cros_ec.previous will conta=
in more
> > relevant logs after a crash, even when safe mode isn't enabled.
>
> What is current approach for getting EC crash dumps/logs from AP?  If the
> system didn't save them before system reset, are they available after nex=
t
>
> boot?

The EC does save a small panicinfo struct in uninitialized RAM that is
preserved across reset. This struct does not include logs, so any EC
logs that are not sync'd to the OS before reset are lost.
