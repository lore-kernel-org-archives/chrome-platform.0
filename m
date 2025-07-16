Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3272F0043
	for <chrome-platform@lists.linux.dev>; Wed, 16 Jul 2025 11:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752666007; cv=none; b=mu1FtVJtEKVJObwYwN14jypzqdT1bgU78XNhtVkgJ4FGyp+A4j0JBSGKV/gyPIYHuICA4/goLkW0iNSD3asRW+7oEhJoRqw8Y/wBrigz8lFEsoaE03EnHA2hJKN5CW4ek2Kg4Cj5dcGcMC8ObwD9MyqYkcMV0hxB38rXJVwm+DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752666007; c=relaxed/simple;
	bh=CH9JMm/EUP3n6sjw2ka/+bL8HgEp7EvOJleoVtviRmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XvShfU/KpXErjbFi0MLWB/fUBnliRPtvU8Hl3H46XZU2jAbm0ficPOTOszU9zUMobONnNbECvHZ+hAnXz6SZvSCuB84c5kg4XL5G0YOHF4cNdH4w7bKnZglfJInFLoFhuLcFh+F9KCBdtY8Si8kPqabrl5k4jAolVjfdq3o+G0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LHVz5lHj; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LHVz5lHj"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-528ce9731dbso2570420e0c.0
        for <chrome-platform@lists.linux.dev>; Wed, 16 Jul 2025 04:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752666004; x=1753270804; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PveaVmPwkhZLYXMIoWYWTWMjMxo+ogQMIDtsdfI/JrY=;
        b=LHVz5lHjdz7VmM0RDnN3QI1G0W28RfjBrRuZiDsJGw7uU4tQf0PtoiIDBPvx8wtAK0
         SR3EPdLp6i90t1TY/nOW6uEDBV4eDTTXLD7WxwZfDSufbXyRrvO92LzcTIaHbzfSFW4J
         4woY0ypfXTsmth6W9jMAjo2faAZBkd1vzqV6cBSMyKKUaOzlaN6pLuz1DC4LHEvAGW6l
         X3EYE0HxWhVsQZsuvKHhZjoGJbaj5Q37J0ws/4EiVkB1XcCYHSEXKHRZLaghmKvk1InD
         lk4C+4/fuwIAIrgpzPvsSYSOqxLB3olCRPltl7zjg5PPiUnr34UByMMAKFB1eml3com4
         VOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752666004; x=1753270804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PveaVmPwkhZLYXMIoWYWTWMjMxo+ogQMIDtsdfI/JrY=;
        b=n4wxuXN2cuj/i8PpPxyobN6Tray2RF4GAsEQZqPKHrk7CtFsUFgF+ScG5CY1ip/IU3
         Ed6yZKGJqtGzemzel5/6FJXzwEJKRtP3zbvBP2fCFE9JI2v2oZagvp6hGE2pJbuNdLaW
         zdKoGCRx768Ob4iIn+2ZNPlahCH4PPSZw9HVuSmsLSedBG1kgCZUabKFDPqvKkDPTvQ6
         6tsQ+VEnpyiFI9WAOaOTKlwkZtE/oZHK2eXB6jd6WOAG5eZ/Z7fyClVE9bpQpM3kO/Ls
         monT6MxdxQvIfc2rUX7XHSZ5Og58zJ/3aaJcOqWIO8eaVNFo70aQ/ehxIBL6eyQDMU9+
         DPSg==
X-Forwarded-Encrypted: i=1; AJvYcCVUfaUst/zMkVgIfpvPztUG3pdu2MRWSCm9odhL/xJHkH7gub99JmR1wrVEZAkQXDiFrE8JLg0JyLOFwYDB+5U=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdWY1DqMZDk74vQbKN4uNegKcFd/HJ9ef2H7XU2Ur6EPpAP27L
	QYK4HzA1ALEmX6C2CBSJekrGN60n12F8qMYy445VBe4bZtlD6dXSnIjYtuabmZIVF59FEoFTM+/
	TZbKuXqGCJEuNPajoJ3he8Y8XGw3MfPIeorqKWmEv
X-Gm-Gg: ASbGncsa3RS5Cns6/tmT68JoXdWlczPtGrQE6WJ2s/f+ZvqOGeh0ko387Kua6WcBFUe
	aR3tDAEJvNRCbx/xIoTHxavZmPvInzdpVhoPJLObjRQLGcO4wws0ZsCT6Tf3ZpE3wbTT+KgfVT0
	TCsfBWymJgVzpVGYDJVp+KGVcQ+TdkSoZ9RjUZ37arux3kyTOUClwatTNA5pI6drFbPGoDvAQDT
	itDaAAYVA9zeMMxgAdXGYdTCQ/urZqm2FM=
X-Google-Smtp-Source: AGHT+IGpIyGjdoXU8K/kqfT9EbCKuZ1P/UbxzuOZAFjAlSCrK9h8UYMlaZpSsyGq96eX7rkgH0LyBg6WuD8/+cT3P+Q=
X-Received: by 2002:a05:6122:1ac3:b0:530:7a17:88cc with SMTP id
 71dfb90a1353d-5373fcb8cc0mr947561e0c.8.1752666004344; Wed, 16 Jul 2025
 04:40:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250711003502.857536-1-raduvele@google.com> <20250711003502.857536-2-raduvele@google.com>
 <aHCPDXonAevxkMho@google.com> <CACKy9TJHtA5K2YqdNdnMuTvOsz4OCkRds4Hbj8aZdK5VXpMgWw@mail.gmail.com>
 <aHXwOtrFpn-yRFvs@google.com>
In-Reply-To: <aHXwOtrFpn-yRFvs@google.com>
From: Radu Vele <raduvele@google.com>
Date: Wed, 16 Jul 2025 13:39:53 +0200
X-Gm-Features: Ac12FXwQS2VC3HS4Kj1qfSCAFYjKoS7ei57V4_5PTFoR4dFZbvp7wS5_4ppSKBo
Message-ID: <CACKy9TJvkx0Bi69pO187dxs8EUt3foc0seNYjn=vK4WCuTHYxQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] platform/chrome: cros_ec_typec: Add lock per-port
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Andrei Kuchynski <akuchynski@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 8:07=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Mon, Jul 14, 2025 at 10:32:03AM +0200, Radu Vele wrote:
> > On Fri, Jul 11, 2025 at 6:12=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.o=
rg> wrote:
> > >
> > > On Fri, Jul 11, 2025 at 12:35:02AM +0000, Radu Vele wrote:
> > > > Add a lock associated to each port to protect port data against
> > > > concurrent access. Concurrency may result from sysfs commands
> > > > and ec events.
> > >
> > > I realized the critical sections are way too large.  What exactly dat=
a the
> > > lock tries to protect?  Is the race possibility introduced by any pre=
vious
> > > commits?  Please provide more context.
> >
> > With the implementation of the role swap operations from the previous
> > commit (and also enter usb mode from another recent commit) we
> > introduce the possibility of concurrent access to the cros_ec_typec por=
t
> > data from the userspace (e.g. trigger a power role swap from sysfs) vs
> > from EC events (e.g. partner triggered a role swap that we accept).
> > This is the main reason to propose a per-port lock. This way we ensure
> > we protect the state of each port in the cros_ec_typec driver.
>
> To make sure I understand, did you mean the lock tries to prevent from
> sending multiple commands to EC at a time?  If yes, does it still need
> if the underlying ec_dev is guranteed that [1]?

Not really, as I noticed that both the ec and Type-C connector class
use their own mutexes.

My intention with the mutexes is to avoid race conditions in the case
when a role swap is in progress but at the same time there is a
`cros_port_update` that modifies the state of the port. Another
example I have in mind is when the port is being unregistered and
a role swap is issued.

Please let me know what you think.

>
> [1] https://elixir.bootlin.com/linux/v6.15/source/drivers/platform/chrome=
/cros_ec_proto.c#L661
>
> By taking the following hunk the patch adds as an example:
>
> @@ -54,6 +56,7 @@  static int cros_typec_enter_usb_mode(struct typec_port=
 *tc_port, enum usb_mode m
>                 .mode_to_enter =3D CROS_EC_ALTMODE_USB4
>         };
>
> +       guard(mutex)(&port->lock);
>         return cros_ec_cmd(port->typec_data->ec, 0, EC_CMD_TYPEC_CONTROL,
>                           &req, sizeof(req), NULL, 0);
>
> It seems the lock doesn't protect any data but the command transfer.

Thanks for pointing that out, indeed I can remove the lock in this
function.
