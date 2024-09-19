Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C423714A96
	for <chrome-platform@lists.linux.dev>; Thu, 19 Sep 2024 18:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726769032; cv=none; b=iqk4rGCh7NElC/kmUi246ozSilJOBeQykq7QBMVlFlxjCXqx6oJSxPsuxyCWp3unidAvymS/YtrtNfbThejEGC4ieBArm4rhVwMNd1BDsBEwLitr7Cf+/dOHzH7TRfB2Gghd7OlFefwnXGFZVeK3RPwSDDS+Lp8p+tseUIWkiOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726769032; c=relaxed/simple;
	bh=Q+WUh7HOz489PHwGkH+G04XUdi/ognfyKOKhgp2Paxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FN2WwZnrSMmXX+qcQCXRwnV0G7Sm5W7VFiqhyV2033JnfDFd48QDi7NOcaHmc4fjdKpk+c9PLSpIw6my8aA+oeFGL84HHQxCAW/67JPlm8Ej6witSway5qZZThs075g+P9g4osqVdGtFjee0fPueyop85NAGkMg9ziTbsBrcqjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AzpltY1x; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AzpltY1x"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5356aa9a0afso2014154e87.2
        for <chrome-platform@lists.linux.dev>; Thu, 19 Sep 2024 11:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726769029; x=1727373829; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+WUh7HOz489PHwGkH+G04XUdi/ognfyKOKhgp2Paxo=;
        b=AzpltY1xioWv1Z+Jz6ISKFCmu7hM6/uTYKE/AG688SCM2j9D/IXeK4yAxaXvQrnaec
         6rKjKeU8Pz3OQZJxJQxLAF/sngP1Yy752dlToSkmPTdML9Ofl3iKgcGHKoKB5we7FPtJ
         7PJyOtPxK08Yt0y586xuD5klYWJ6eStnOy1rM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726769029; x=1727373829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q+WUh7HOz489PHwGkH+G04XUdi/ognfyKOKhgp2Paxo=;
        b=ChB6ZHagr4lIxJ/qcSh9t/xBcP+mEni78yl1kIlxfGyLzUkndIvgpPECNk1Gn5GqM/
         AyRjMvHL40SdoC7tufIGVCN4QToJM9NGZ9hydq1CRsQXwEl2kdID0uwi/FqyH7JsBQ3F
         2HquzqyiDkTh3eYZPCDCv4boVZnH/JpnjFF+1tvG1/mDZGIlXcTHZgKVkuMTDirTtMx/
         7vaYgsUkEmRxkIRlxAjm3p7xJbU4Ug+Uqd0+Pedc21EdWfoGVeylQuw0fcbv3yLzWt8P
         7buuHI8yebcKB1mx2WTq1qxgrz6fbPOBKsqefIF1o/slf6+spIAWMqH5AY4WmGH2W835
         xjJA==
X-Forwarded-Encrypted: i=1; AJvYcCVT6pgD/vxcomm/Rr6U7JbxU/Ls3NgmFuEJ8JyEkKUChOcyTmgNvKtP/YzyvWenXFJHPmiZNZ66SX7gmqnWQwc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yze4Ls/j5QhzhfYGCo3X6hQ9LEBRk3pdoEZm2sbmSTpiY6xgJUs
	HvAYeV3CUhJDcppQqIdzQWKbfAfZ2/1S0XDzLfK9w5MEDz/cUaffskc/82oqMAUF5cCJTYfEBzt
	jVQNuziGccwHWyYMCyUYNjVvOOukj/1NROkU=
X-Google-Smtp-Source: AGHT+IEynQGkNP4WbeFQP6jpDWrH9yOKb6T8S/4juXfQlmxAEKATqQezRqfjbwE27+/f/DlyTlM6/xaGwqhTrbpg+a8=
X-Received: by 2002:a05:6512:3ca6:b0:530:ab68:25c5 with SMTP id
 2adb3069b0e04-536ac2d6aa1mr173978e87.2.1726769028765; Thu, 19 Sep 2024
 11:03:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240910101527.603452-1-ukaszb@chromium.org> <20240910101527.603452-7-ukaszb@chromium.org>
 <ZuGkMiE3sHOpo/Ci@kuha.fi.intel.com> <CALwA+Nb6zWe-WOgcu8-ni5OCx9XxerVhi76fZze2KP_kmFVonA@mail.gmail.com>
 <ZuvxAQmMsnIYZMTP@kuha.fi.intel.com>
In-Reply-To: <ZuvxAQmMsnIYZMTP@kuha.fi.intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Thu, 19 Sep 2024 20:03:37 +0200
Message-ID: <CALwA+NYmKm0sVT=NPfJU7Ena__P5ec451nhViXFhK9BYu87jxg@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] usb: typec: cros_ec_ucsi: Add netlink
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Pavan Holla <pholla@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2024 at 11:38=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Sun, Sep 15, 2024 at 12:08:45AM +0200, =C5=81ukasz Bartosik wrote:
> > On Wed, Sep 11, 2024 at 4:09=E2=80=AFPM Heikki Krogerus
> > <heikki.krogerus@linux.intel.com> wrote:
> > >
> > > Hi,
> > >
> > > On Tue, Sep 10, 2024 at 10:15:25AM +0000, =C5=81ukasz Bartosik wrote:
> > > > Add netlink to ChromeOS UCSI driver to allow forwarding
> > > > of UCSI messages to userspace for debugging and testing
> > > > purposes.
> > >
> > > Why does this need to be cros_ec specific?
> > >
> >
> > You're right. Netlink does not have to be cros_ec_ucsi specific.
> > Would you like to have netlink in typec_ucsi ?
>
> Does it need to be netlink? We would then have tracepoints, the
> custom debugfs interface, and this netlink interface.
>
> I think this information could be exposed via trancepoints (unless I'm
> missing something).
>

Hi Heikki,

I agree that there is a common area which is covered by both trace
events and netlink.
However netlink also has advantages which IMHO trace events lack. One
of our cases is that
from userspace it is easy to forward the UCSI messages to a Wireshark
with a plugin
which can decode it. Another case is to use UCSI forwarded messages
through netlink
for testing and validation of chromebooks.

How about leaving netlink specific to cros_ec_ucsi driver ? Would you
consent to that ?

Thanks,
Lukasz

> Br,

>
> --
> heikki
