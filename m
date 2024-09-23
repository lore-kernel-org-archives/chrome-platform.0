Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE9C1991D5
	for <chrome-platform@lists.linux.dev>; Mon, 23 Sep 2024 14:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727102545; cv=none; b=YB/8io0KU01KGcvallp2y8o9JJ3oGzfTZddnP/B3gMYOgqCUqIUPsCKj+Rfk1L97FA2JYjfn3boThN+tuTZfxcWU9LqiAtP39pLHgsVpRWBjgNyQsMb8/tapVxZPHHc/5tXjAMn1VlpX2PZDYbaLsDjKdePQO5QqIFQNsDbYvzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727102545; c=relaxed/simple;
	bh=vU8ioi5N7K5XbEkcwYbIT4dyO2PigjG7Ya9snrOWYUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qRX0HKmVE7807M0SsFH4qdQxw8kga1oxIjxmYhhXUvl3L1SrnEUCi062R03iW+7/1xxrYrxTW+yFexJkIes3kC182hGfzhMBkjQ0o0Oekpauu6vmjfTMNUTD5XPIv3M3w74hwzRbALaXxa4Rj0alleEnVQO4+JZktNb5/cvTVjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nKyjJt/8; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nKyjJt/8"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5365392cfafso4538001e87.0
        for <chrome-platform@lists.linux.dev>; Mon, 23 Sep 2024 07:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727102542; x=1727707342; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vU8ioi5N7K5XbEkcwYbIT4dyO2PigjG7Ya9snrOWYUY=;
        b=nKyjJt/86J9hAhWQLERlfDBVB3NKmvuqcUzv851Pe7l/uUtg65IQNvBk9hgvSVJiK1
         XR/vVF5S1Q/vullVCrFfoZrfJYvvJbJLQ1nAYnLQsIx/uxzcmW4J/UjknfEoJ1cMdAVa
         l3J0A8bw5wxwqg4fwNOjqUzAeKq7V9a1IHUiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727102542; x=1727707342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vU8ioi5N7K5XbEkcwYbIT4dyO2PigjG7Ya9snrOWYUY=;
        b=EZgxUD32RSskG/ELZyhiGlbeJJRVLYl/4RC1XDO5M9wImgNMOtFnLQoWF2E3NM5xC1
         8+ghMou7XjtnIchnIh1CwrMXbAXn6ocM5fMwXdmqjEMuD8zY2W7W1aZOpIxDVHUay1Pj
         XJ1KnSzOORRbMs6kqVJaaX2B19H0zQc81ACFt6NNy4UXa6OSc4FrXp0POBgmjZvEQ0dG
         SZ6eHSUSeAFemlcxAERB98q7fj9RDwlMHSF8D1FS8P/USbJg9hlpj82Wd97Euo6wBxwl
         F2QLBQFqYxkYDtm+DWK5x4claynlKqdYLEmiwiPE7lqXHZQEdNeT+mIXFMx4EwVgV5Sf
         qO/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWn8bGCNUD2TztItLqVVYV9BhIz+96lwnE/7tYUUk6PQm2YsRht+5v02o6SSZkyn1GgwaZNwGK7nbo1nNk7qZc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFLmnRQWnwNZg9cCz8BpeCZbei7zZZaNoh7O8semS9gTpKMgFZ
	2le8RT69CDX3Q7SPr5G4zwLsk7jLuil0QrGCjC/Shrw7b52b2FeJgW0gVTCf+KYsFYD4fnH1ttt
	VFo1Y0n0UQC90Dsf+pfWaco3jyCon/sFMYf4=
X-Google-Smtp-Source: AGHT+IEyzRp+m5fX0Jn/4p0AtI5S98zIO8YX46Tb3tM2f55jAtIo+osTIQ0rtGntwdrcI8jdgzFRH/Fq5s75pk0IuUU=
X-Received: by 2002:a05:6512:12ca:b0:535:3cdc:8755 with SMTP id
 2adb3069b0e04-536ac2e5b93mr6116785e87.20.1727102541860; Mon, 23 Sep 2024
 07:42:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240910101527.603452-1-ukaszb@chromium.org> <20240910101527.603452-7-ukaszb@chromium.org>
 <ZuGkMiE3sHOpo/Ci@kuha.fi.intel.com> <CALwA+Nb6zWe-WOgcu8-ni5OCx9XxerVhi76fZze2KP_kmFVonA@mail.gmail.com>
 <ZuvxAQmMsnIYZMTP@kuha.fi.intel.com> <CALwA+NYmKm0sVT=NPfJU7Ena__P5ec451nhViXFhK9BYu87jxg@mail.gmail.com>
 <rpdbzy5ldlsq2ahvuyrzx6tprgtgxpftd4xbos7cd3wwnhapvu@2hstbs5qg65h>
In-Reply-To: <rpdbzy5ldlsq2ahvuyrzx6tprgtgxpftd4xbos7cd3wwnhapvu@2hstbs5qg65h>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Mon, 23 Sep 2024 16:42:10 +0200
Message-ID: <CALwA+NZoA4myUcYNMb6d-sN=YAp8njWDBW9RwgXiPTyTPtv=4g@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] usb: typec: cros_ec_ucsi: Add netlink
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Pavan Holla <pholla@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2024 at 10:00=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, Sep 19, 2024 at 08:03:37PM GMT, =C5=81ukasz Bartosik wrote:
> > On Thu, Sep 19, 2024 at 11:38=E2=80=AFAM Heikki Krogerus
> > <heikki.krogerus@linux.intel.com> wrote:
> > >
> > > On Sun, Sep 15, 2024 at 12:08:45AM +0200, =C5=81ukasz Bartosik wrote:
> > > > On Wed, Sep 11, 2024 at 4:09=E2=80=AFPM Heikki Krogerus
> > > > <heikki.krogerus@linux.intel.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Tue, Sep 10, 2024 at 10:15:25AM +0000, =C5=81ukasz Bartosik wr=
ote:
> > > > > > Add netlink to ChromeOS UCSI driver to allow forwarding
> > > > > > of UCSI messages to userspace for debugging and testing
> > > > > > purposes.
> > > > >
> > > > > Why does this need to be cros_ec specific?
> > > > >
> > > >
> > > > You're right. Netlink does not have to be cros_ec_ucsi specific.
> > > > Would you like to have netlink in typec_ucsi ?
> > >
> > > Does it need to be netlink? We would then have tracepoints, the
> > > custom debugfs interface, and this netlink interface.
> > >
> > > I think this information could be exposed via trancepoints (unless I'=
m
> > > missing something).
> > >
> >
> > Hi Heikki,
> >
> > I agree that there is a common area which is covered by both trace
> > events and netlink.
> > However netlink also has advantages which IMHO trace events lack. One
> > of our cases is that
> > from userspace it is easy to forward the UCSI messages to a Wireshark
> > with a plugin
> > which can decode it. Another case is to use UCSI forwarded messages
> > through netlink
> > for testing and validation of chromebooks.
> >
> > How about leaving netlink specific to cros_ec_ucsi driver ? Would you
> > consent to that ?
>
> I think having it specific to cros_ec_ucsi is the worst option out of
> three. It should either be generified to work with all UCSI drivers or
> go away and be replaced by tracepoints (against, generic to all UCSI
> drivers) or some other mechanism (e.g. TCPM has rolling log of
> messages).
>

I will come up with a proposal to make netlink generic to all UCSI
drivers.

Thanks,
Lukasz

> --
> With best wishes
> Dmitry
