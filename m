Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B41053E3A
	for <chrome-platform@lists.linux.dev>; Tue, 30 Jul 2024 10:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722336935; cv=none; b=V7GQ8FNZbmhO8znLtiiwvgnnm77UmeDXdFGSPPr+tOB4ZjeRi7GyV4t1AdP2jEgXWIclGfFv6dJh9ZA2MENGYXSheOwn4lYC7muDDFyP8YA38afirUFnrE7bQaGTWLoLy2lruxphRxVj5iCy502XXHVgbuSYp2GUsJJptXXVWGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722336935; c=relaxed/simple;
	bh=v0tgyls8FUGT1sQokYSCsuUAU+aj8WL3aZ1cfqKSBQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gX27n/miyB1ONxgux7cer6JYee3R+S08ScKrVXmXRZ+b9jx5NuSEGSgxTFwP/mExAZAk1KLFI3wdz9Na9KAxp2XDBiAIdtuU2XFxuQW2WjeVbc7DhajQ5Y1/ip6oFEBXw1ktEmCFMjp3Pf6QZAOSrSPp2aWx/em+qg2HFtK5LQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FNlsSqRa; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FNlsSqRa"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5a1b073d7cdso12806a12.0
        for <chrome-platform@lists.linux.dev>; Tue, 30 Jul 2024 03:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722336932; x=1722941732; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xr+voav8MzKq7kTcrDPxGaN0prieHV85Xow3mdChfiA=;
        b=FNlsSqRaunekNFVybdlSoRl4kvRvn4jD/GNqaE1YPtff1XF13Ab+uU6uke+bVPSaCw
         bGQ+L68PwN5JZ2S8xdY5hTuKtXHu5JokvFoKlRxqEIOZaP8sJ4w2T+79BPFGM/890G88
         uKXHJsfjEZ3XQJs/B0i5pIjDjam3nkY63rZ1CUzmEcUdw8jYwulfw9FVzgK4c1iZ4PRA
         T9V1GZjg3fIrR0q+eKCc0fkcp6aZtFrYIV2ZDJ44cmie87O1Ibxg7hsQ/sxRk/2dbjRK
         /iIO4LeL7m5vzlaTx4z/J6rpAWTO2Bqdts//xcfIX6QFUlblpM8Gh9o6LMykhfjsa6ts
         vqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722336932; x=1722941732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xr+voav8MzKq7kTcrDPxGaN0prieHV85Xow3mdChfiA=;
        b=dn2RRnF2TYgfZi9qLVGeMUleqYeI2jWxiuRN10AwCdnbsiIYcUtpYCXdpnKzxx/epc
         132mf3zlJCGCzqBbiHznIQOZ1lRdGJih6tB6EJcMQKoF2IJ9j6rGH8oQso1CkQw1wHGP
         8vD4L8ZMizx2GlY4mm8HAquc9EGTmwuoT5pftxLHEH61FVz1BvQAsWFTvrfuHGUei9sp
         HKba73t9Na6LOVnjOZcmFa7LkruD7Mf1/5iBMfGoUz0rCUMMA+SZh9EwuJwsOXI7W5e7
         9NOBVHmGOtUTY4AvkehVA/M69ANvv0EEhT1HiiVLxiSZ3NX4dCpPi7L7h3tLlCPnHd3/
         qUOA==
X-Forwarded-Encrypted: i=1; AJvYcCVBu3bRFiGVU2Nm1vbmZju133are6qRQATQMbYwNs6ItJabaQjIvjvlANxePCnV4yHs67REbCoQr85om2eluJvJQvUUAiX8yfvdL3Ux47gX
X-Gm-Message-State: AOJu0YyX7TVx6WtFiULUF1PY9KXN6v7ZNcgtfK0Us6DurczZEx0jIcTc
	QYPAiZXo7TKvwGvHwdQOg5dPeHytaOFFS41XIOTi8b2oSwaebrhjRUUuLgf9bvlHDXESkM1vZi3
	xZ2+Qz6QchCdpLMpW6zeKzlPpSqPs3+4clZZi
X-Google-Smtp-Source: AGHT+IFwYxS7auFszuugbSbIB4CcRIE3idrY672qfSQWgDOy/uYcOQpSYqTSP+brkdQ5/14tFQ9yTa1KNQ31s5+dWZY=
X-Received: by 2002:a05:6402:2347:b0:57d:32ff:73ef with SMTP id
 4fb4d7f45d1cf-5b461564c15mr118681a12.6.1722336931423; Tue, 30 Jul 2024
 03:55:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240725175714.1769080-1-patrykd@google.com> <ZqcQ3rjY6Wu4lU6t@google.com>
 <CAMxeMi3864MhJvaH16mw5hHKzYnoRWpZWnxJJuWm9bSKiTojWQ@mail.gmail.com>
 <ZqiCV_EXnJONOdyV@google.com> <CAMxeMi3VFN91FpGb3dgobz9aXt+Ok8rEqGkidwrGxNNk43O=6g@mail.gmail.com>
 <Zqi8_JeZJU0rGfEE@google.com>
In-Reply-To: <Zqi8_JeZJU0rGfEE@google.com>
From: Patryk Duda <patrykd@google.com>
Date: Tue, 30 Jul 2024 12:55:19 +0200
Message-ID: <CAMxeMi3AQJwpEkHaE9U+=dRjbaTfX+TRe1w8myEgSR3Z8GfnuQ@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_proto: Lock device when updating
 MKBP version
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 12:14=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> On Tue, Jul 30, 2024 at 10:05:16AM +0200, Patryk Duda wrote:
> > On Tue, Jul 30, 2024 at 8:04=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.o=
rg> wrote:
> > > On Mon, Jul 29, 2024 at 01:57:09PM +0200, Patryk Duda wrote:
> > > > On Mon, Jul 29, 2024 at 5:47=E2=80=AFAM Tzung-Bi Shih <tzungbi@kern=
el.org> wrote:
> > > > > Also, the patch also needs an unlock at [1].
> > > > >
> > > > > [1]: https://elixir.bootlin.com/linux/v6.10/source/drivers/platfo=
rm/chrome/cros_ec_proto.c#L819
> > > >
> > > > Yeah. I'll fix it in v2
> > >
> > > I'm wondering if it's simpler to just lock and unlock around calling
> > > cros_ec_get_host_command_version_mask().  What do you think?
> > >
> > Initially, I thought it would be good to keep ec_dev->mkbp_event_suppor=
ted
> > update under the mutex (similar to cros_ec_query_all() which is called =
with
> > locked mutex), but mkbp_event_supported is also used without locked mut=
ex.
> >
> > I don't see any obvious risks with updating the MKBP version outside mu=
tex.
> > Do you want me to change it?
>
> Yes.
Fixed in v3: https://lore.kernel.org/lkml/20240730104425.607083-1-patrykd@g=
oogle.com
