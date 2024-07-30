Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2CCD2E5
	for <chrome-platform@lists.linux.dev>; Tue, 30 Jul 2024 08:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722326731; cv=none; b=s+tpBFUSXNtL7cLw7KOH6PQrA9g+F0eVEpag/hvwPJcUsa1uawKMNs419JcL4pWeRlEj2dAl8+aUztb8qdqxUcqKhbv6eeaa81IXItIj/A9yYCFm0R/+k0FQLfIiWzOcYMi0JEA9KduK+IcPv+kD/JlBV6uQd9nv/yADSWfP8pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722326731; c=relaxed/simple;
	bh=1kgJNlcr544NRiqfnkainU7wonGN3sn2IGXLuZEd/cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IMDrKy4JTcm2ZdZZgf8q2uHfpfBHrcsbcO2YvRgsYt2EzqGgRY/2wP29a0h8PCdxdTlC+5AwwnQGUXnMCCHp5tibCSnj6ohDNSdefC+RvoQ0eDrvinLe02bFjZ0EGZQJoF51jRI+Rb6Vepb3fvuLDVN6pfQLMjk8lbdJUOnAOEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4eSVpVmV; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4eSVpVmV"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5a28b61b880so6950a12.1
        for <chrome-platform@lists.linux.dev>; Tue, 30 Jul 2024 01:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722326728; x=1722931528; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bL66OPAEodYZLaAx2rvp3BoLNoLRh7gj8/rCrIUPhtw=;
        b=4eSVpVmVwMOsy95BVt/ZMg0F/l0uTG3OcYmS2keqIbP9DjAV5tNizzii+UnUq8oKE9
         p2ShbmLFhvsOO6IpZ4TJQ9ap2mZmj3b+QqKy1R/hEfJMnUhYZsBUib7x99YUeB/393i7
         nDxV1FiH/65+p/ZZi0+tUQfR/59RdPDIM09NTqPBYOTLNT/3ezE6AN0EuBnYYLcvebhV
         bNIj+dh/05i8Ot7zDEXA/im9MRl0ZEIIDvEFryF5sLdowBfSD9GSj8efk5KpFz9aWTbj
         xhKYkuyivjT/ufjCPq00HC+fewz6V0k5RyDT8cSGctMNneaudc89YzfMC5LFAybAADo8
         t8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722326728; x=1722931528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bL66OPAEodYZLaAx2rvp3BoLNoLRh7gj8/rCrIUPhtw=;
        b=c3wedoZFiNGZebnLstpWDnm4/NvaOjkeO6vxDE0epqE+HzVHekIwrtpzXZnOeecn82
         gTFGi34aNDNhRYod1hX54FPbMmSCtOdoa1/6AghQrXjaUztzNSxGpsAuRmYy9cYO+F5o
         rsqaBJ2rrZzMy4VzFFvtxQexS9sP0b4RkrdPzMNeZJ5PT/t/J/RR37+J+e8Sf3rPKdUn
         RZFgsgGR4/5CFGbyJ93o+V4TwDXbK+rG5QpzYaLyA6Dq7WRVpG3FF0GIcFiBtf8vY5ST
         SEtIoD+oPt+ttD+SVu8xE/CG8pvqRLFJGmwWv5Hmjez3AF5H0oGYF8Za6e5F8upooK6I
         OfZA==
X-Forwarded-Encrypted: i=1; AJvYcCU0oh1HmBSv6onbqJiWdm7r9GNRumm1qk4WRWnEEAT9Ky68iCQNxHsVQN31w0pEV6Cf3hUY1usEe4eOIb5SEozZBySXMSk1a6MKh2gmBAIx
X-Gm-Message-State: AOJu0Yw1psdUv74eJ+R61WtVffh26mCofodxL6X9AHwN8vbYLr30BS5T
	5Ct0J+vkRh0FSB6ekxS9Udatdzx+OAyAbDUHmHM7vwLd8PXKgdg5T6anpkpvDzsXr2gpmEqjaaV
	7eQeJdDT52Q3Ddc5oxqKJc4YWjOX5dPxJd3riiKJ6/Ev4cnOi2A==
X-Google-Smtp-Source: AGHT+IGop8VSaJ6PSWINp5QsqfO5ghSjMV8XwkY1oD8ULCtzsln+29ty0YUQe56COfn/EIp7v7smumri/6tOHvcfrM8=
X-Received: by 2002:a05:6402:27c9:b0:5ac:4ce3:8f6a with SMTP id
 4fb4d7f45d1cf-5b461375635mr91380a12.6.1722326727971; Tue, 30 Jul 2024
 01:05:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240725175714.1769080-1-patrykd@google.com> <ZqcQ3rjY6Wu4lU6t@google.com>
 <CAMxeMi3864MhJvaH16mw5hHKzYnoRWpZWnxJJuWm9bSKiTojWQ@mail.gmail.com> <ZqiCV_EXnJONOdyV@google.com>
In-Reply-To: <ZqiCV_EXnJONOdyV@google.com>
From: Patryk Duda <patrykd@google.com>
Date: Tue, 30 Jul 2024 10:05:16 +0200
Message-ID: <CAMxeMi3VFN91FpGb3dgobz9aXt+Ok8rEqGkidwrGxNNk43O=6g@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_proto: Lock device when updating
 MKBP version
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 8:04=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Mon, Jul 29, 2024 at 01:57:09PM +0200, Patryk Duda wrote:
> > On Mon, Jul 29, 2024 at 5:47=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.o=
rg> wrote:
> > >
> > > On Thu, Jul 25, 2024 at 05:57:13PM +0000, Patryk Duda wrote:
> > > > The cros_ec_get_host_command_version_mask() function requires that =
the
> > > > caller must have ec_dev->lock mutex before calling it. This require=
ment
> > > > was not met and as a result it was possible that two commands were =
sent
> > > > to the device at the same time.
> > >
> > > To clarify:
> > > - What would happen if multiple cros_ec_get_host_command_version_mask=
() calls
> > >   at the same time?
> > In the best case, MCU will receive both commands glued together and
> > will ignore them.
> > It will result in a timeout in the kernel. In the worst case, request
> > and/or response buffers will be
> > corrupted.
> >
> > > - What are the callees?  I'm trying to understand the source of paral=
lelism.
> > This is a race between interrupt handling and ioctl call from userspace
> >
> > Handling interrupt path
> > cros_ec_irq_thread()
> > cros_ec_handle_event()
> > cros_ec_get_next_event() - Queries host command version without taking
> > ec_dev->lock mutex first
> > cros_ec_get_host_command_version_mask()
> > cros_ec_send_command()
> > cros_ec_xfer_command()
> > cros_ec_uart_pkt_xfer()
> >
> > Command from userspace
> > cros_ec_chardev_ioctl()
> > cros_ec_chardev_ioctl_xcmd()
> > cros_ec_cmd_xfer() - Locks ec_dev->lock mutex before sending command
> > cros_ec_send_command()
> > cros_ec_xfer_command()
> > cros_ec_uart_pkt_xfer()
> >
> > >
> > > Also, the patch also needs an unlock at [1].
> > >
> > > [1]: https://elixir.bootlin.com/linux/v6.10/source/drivers/platform/c=
hrome/cros_ec_proto.c#L819
> >
> > Yeah. I'll fix it in v2
>
> I'm wondering if it's simpler to just lock and unlock around calling
> cros_ec_get_host_command_version_mask().  What do you think?
>
Initially, I thought it would be good to keep ec_dev->mkbp_event_supported
update under the mutex (similar to cros_ec_query_all() which is called with
locked mutex), but mkbp_event_supported is also used without locked mutex.

I don't see any obvious risks with updating the MKBP version outside mutex.
Do you want me to change it?

> > > > The problem was observed while using UART backend which doesn't use=
 any
> > > > additional locks, unlike SPI backend which locks the controller unt=
il
> > > > response is received.
> > >
> > > Is it a general issue if multiple commands send to EC at a time?  If =
yes, it
> > > should serialize that in the UART transportation.
> >
> > Host Commands only support one command at a time. It's enforced by 'loc=
k' mutex
> > from cros_ec_device structure. We just need to use it properly.
>
> I see.  Please use the fixes tag if you'd have chance to send next versio=
n:
> Fixes: f74c7557ed0d ("platform/chrome: cros_ec_proto: Update version on G=
ET_NEXT_EVENT failure")
