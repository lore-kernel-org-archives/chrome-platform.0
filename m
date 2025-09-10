Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D682D7395
	for <chrome-platform@lists.linux.dev>; Wed, 10 Sep 2025 19:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757532975; cv=none; b=muTIh5mx6XFmnMh/KhlwF5g1WEfro8JVhJREFq97dmR3uTOFCje9HDHN1DE/6KFczkl77Bb7yZbo04vb5QBZ2fZNTAlvaCvG61dplTKS/h66pccwgpY6LVlIYwFqSiJ8T8fibV3YbkfguN9TPjYC9INyH2edf8SbJZzsjOCn/xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757532975; c=relaxed/simple;
	bh=AV456wGx4AS1v+tWNKPuHFhSCTC9E7/Gz+sOHtQdrVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cL83eaJMJ4R9QYAvH868vbv9+9/gW11MMwVLw+C8vU4UIlNShRgL3rMwVqyMY5ayRZNdOmzToYmixeQHBXq3s9/8mEK0azdjBhxOF1vttD9OVfwDBs5gXYjfBnX63WdiKKpvyPgwBbPb7P1sE6Ze4kbTXBjQKa3lOBIIEuTr0V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SVUuC6ix; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SVUuC6ix"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-32d3e17d927so5144412a91.2
        for <chrome-platform@lists.linux.dev>; Wed, 10 Sep 2025 12:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757532973; x=1758137773; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQPkqSciunRqKLia3Mm+0rllHHUFhVihDlipeR5N4p8=;
        b=SVUuC6ix+f8ugOh3H9o7PFRiepzVRJE91p3ImvWSn9qD3K55Gw33XMwPia2lqernom
         dapcd8c6VXAPCHYxqrd7VXEsuhwxRSWanC7xQBJh8IXe7bDO4j/enMQPBZIhgCYGgHyM
         XOvT2m4KzmzIztV/jCom9k+B/HpEOT9vPv4Hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757532973; x=1758137773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQPkqSciunRqKLia3Mm+0rllHHUFhVihDlipeR5N4p8=;
        b=hnlBCsfdveiE+JtijfnTimL90budMmfnaxo0ykEg33bIgg/iVxUJUWvfu4CsiZOEmr
         bIVNkB8256a5L/MOZ2QD5OZCU44z4rFTaTKhRDyyRmnXNPGhqy97FNmaCi1RC8cNahsJ
         CZKD8OyPKvbgh1DKcb/2oH8mVvRry5slnfTCl3hEdwZk9N689ZPjGW4SJVChQp1WRS92
         6Rd9f6RCEz0ECiw1sDeiydYWOCJ04uOEudt7lmio+Kg1gB/RzBCr1BIYBPJMLz2TUivf
         6/ZIpmP/HiT0ceN/guQFwRE2kdr1OaESqUtJis9v/k8vM1J4tnzmRtIkFzxWe143IE5C
         8fiw==
X-Forwarded-Encrypted: i=1; AJvYcCV0e2L7FcPLeDI1mgFkarF4iYpdYpmmg/gecbmw1403Fk4yBMjifYPbjoWWLtguhKSonNFWLNugERfn276pXdw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwvqleC7mNYBgi5IGPwcj74W1Ovn7bOpE8KPlThjcAyKv8JaF1B
	cbzoVy8WfyzjI/OLdo41fHPcQ9lLPdEpQ3o1PLg+lAGzfr1nXieeRs+4zF411oGrmvJ928PFsiR
	aKwfIlvk6q1LTXXx/xNWIEHmrL28QIqXRiszlI5QJ
X-Gm-Gg: ASbGnctM9kPLgkDu9CrGZ8pc9MBV1lYhQwkc/gyy8YsyPo0GvqKsPJPRfrsMs2++kN4
	7rvJfPjniScEcktzDuKHgDnzf96idaYIWlm0XkyXOeZW2/5JA/gWCJuNriYd1/qDGI8LnUB1ndo
	soWUhGCsjfeiHW/dlzdZ0aIV7XL0wkpbIp5CEp21uZej+nUFlDVKTW3rgjgPQ5avc3yMXC46ihK
	4QseHcXhUQmyCcvQVHfP4fgMTcP+tGo524=
X-Google-Smtp-Source: AGHT+IFLlqBtDvao2RSq+mhvGeHwBwcVPZTa96veAgv1c4asfQuU7YhSG8xzoqQz1gsfHfDLzgkwBOAWmBsrpMX6k00=
X-Received: by 2002:a17:90b:350b:b0:32b:9d3c:13c4 with SMTP id
 98e67ed59e1d1-32d43f8ea76mr22921491a91.24.1757532972973; Wed, 10 Sep 2025
 12:36:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250905142206.4105351-1-akuchynski@chromium.org>
 <20250905142206.4105351-4-akuchynski@chromium.org> <aL_uZxBkBfC9Etrk@kuha.fi.intel.com>
 <CAMMMRMf_zDx43-Orf1zE31hE+QmPgkDMz2UTrYjyS=pjHUZvYA@mail.gmail.com>
In-Reply-To: <CAMMMRMf_zDx43-Orf1zE31hE+QmPgkDMz2UTrYjyS=pjHUZvYA@mail.gmail.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Wed, 10 Sep 2025 19:36:01 +0000
X-Gm-Features: Ac12FXxddXEMRnJtLrfvERjfHZezzuZuMnfwdZigQDg7YqiQEYPvS9eHewf1Njc
Message-ID: <CAMMMRMcX4k3Ry6ruQhA39hFze+fMttUajwaBP5TrbvP7Ryy9zg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] usb: typec: ucsi: Set no_mode_control flag
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 9:22=E2=80=AFAM Andrei Kuchynski <akuchynski@chromiu=
m.org> wrote:
>
> On Tue, Sep 9, 2025 at 11:08=E2=80=AFAM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > On Fri, Sep 05, 2025 at 02:22:04PM +0000, Andrei Kuchynski wrote:
> > > This flag indicates that the PPM allows the OPM to change the current=
ly
> > > negotiated alternate mode using the SET_NEW_CAM command.
> > >
> > > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > > ---
> > >  drivers/usb/typec/ucsi/ucsi.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/u=
csi.c
> > > index 0d6b0cf5a7cd..9f754344a841 100644
> > > --- a/drivers/usb/typec/ucsi/ucsi.c
> > > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > > @@ -1632,6 +1632,7 @@ static int ucsi_register_port(struct ucsi *ucsi=
, struct ucsi_connector *con)
> > >
> > >       cap->driver_data =3D con;
> > >       cap->ops =3D &ucsi_ops;
> > > +     cap->no_mode_control =3D !(con->ucsi->cap.features & UCSI_CAP_A=
LT_MODE_OVERRIDE);
> >
> > The flag is now used to expose the priority file, but you can't affect
> > the order in which the UCSI attempts to enter the modes, or can you?
> >
> > thanks,
> >
> > --
> > heikki
>
> Hello Heikki,
> Thank you for your review!
>
> You are right, this patch does not affect the order in which UCSI
> attempts to enter modes. Currently, UCSI implementation only has
> DisplayPort alternate mode support. We are preparing to submit patches
> for Thunderbolt.
>

Hi Heikki,

should I send this patch later with the Thunderbolt UCSI support
implementation?

Thanks,
Andrei
