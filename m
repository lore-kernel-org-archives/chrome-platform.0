Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAC630DD13
	for <chrome-platform@lists.linux.dev>; Tue, 16 Dec 2025 14:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765897073; cv=none; b=uCaHTqjtxw4N8RsEc1H4ikiGMUR5rGnwfNY6FVFEFGjU2OIvbx8r71v2e4KF9xO9gl0WObgUlXzhwvcBDgPSIK5iJWO7a043mWiQ7ZeALMfeq8qED3kMSzvhpbJ+Dzfry1LfdGUC6i4+E26aLzS6sx/2MxbMVFK/1rB31PUQoQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765897073; c=relaxed/simple;
	bh=2wMthbHVjjP+gIScZhyEdoOnajehfZ/046O1h3WJBQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GV6OsF/bCNyy+RBco/mKcOUppTZfwJVMX43caSfb6k4SeGjiXo0cB+ktZzEUhBbEm9B8xHM9z8uUjzZHXBMohtObQ+/baZfd9F6XhxAvdhxaQ/HeCHah2E4cR0toLCT0cXX5sXiM6xEsVxqbZ6Nu+HdBVtWbqbQbKK0vGiukVi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YwcXY9EG; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YwcXY9EG"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a137692691so11772265ad.0
        for <chrome-platform@lists.linux.dev>; Tue, 16 Dec 2025 06:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765897071; x=1766501871; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJMwXlx2Rjl+EioxGE3frGq2agjzpjGGNIFFQoMj4s8=;
        b=YwcXY9EGz09Kw8sJV5TyjTj/Kmp5vB/f/0JEbDDHVtqRdiPtmxcO2uoJaIwt63u5IF
         v41vdjbF53ve9jsQnZlCwyljn5ksZQF3owJk523YQNGQoVCxFipHzcxajH+Rt3dFUchh
         8vCKm+gTLugR+tZidMk0zpXEQdkRe6jwH6DYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765897071; x=1766501871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UJMwXlx2Rjl+EioxGE3frGq2agjzpjGGNIFFQoMj4s8=;
        b=UmJqjDpugO25u7lZf0K250+56rJtldbPeob7gnQorNVQF3qiFvBT9xEkxfsvRto6oB
         wI5TGqqY82Om70sX/XMScKE4xd/tHtMK9Bhy9eMIsEqLfW+95GokFo88s1fX0TvrP0o2
         YJXtwjdxZUelZME6wmAa4q0Fk2LWSFAAj4J8NzE09Lj8PW581ksJuuM6DlsAdKN0i9On
         apIIU7bnDvV8RZ+5KiZ9nS/s6DAN4Ncjt6tWFouOwSiq5AmtwC0l/6/0+jy1xSeiEayv
         5eXSWbhFtZPOR0+Ml2gOJJlUISqiT2KNBDhap/DSng9Hg9XW1gTB80tU2GawA3NU6Ox7
         a2nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVt2gaz8bNaOmnD/0jb+i1Kj7jBsIEIiSZ1KIMflkDyDUCypPy4Rik25Oe8HlBbRv5ZvMOJzcPhLfrduR06sN8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzlC9ZmBioAbIpyTMPkO/Fa1ru6BEhesRiBHaUESDUadrnK4di
	1kUCV/FEgIuhBow/L7nFSqPki/af5BDCPR2KJBhIW8BLuauESOADLs8K3qF8PsRaqAX2tnuc8op
	3C+vVI/olg/UZIl38BoZQ/nrDI2dww5n83CkK6u8P
X-Gm-Gg: AY/fxX7BufylhbqKC/f1r5Pys+RAC/baiDowr3c9LlZNhhfj6SRO8XAAguDfk1bRDkL
	wVwiYJ4CelBKb4TrQXv5q4wVPpyY+1HbWruJSLO1YnISCNSKwS6oowa8DCrzwSd6gd2k8FZHpW1
	z6HdhtcfPMB2eoSrIOt7Zq0VuCvCUAq3dvnmmu9UjOBk0iaV3w/OXpGe5kuf58UVIpoAPpSNB6P
	3glXH5YjsQVWvcDpSN2U49PVtY4Tz6qDbY9nvVzKJvbx67zq2ig7nypHyAewwrcq0iSgO4EWG+j
	r32Ph0JQ0FLAkMiPYFgCqGGped2Gv7o=
X-Google-Smtp-Source: AGHT+IFq/YJLo2S94WSmkV3peCfI5q+2HJAgkoWlsWR59YkyvNZbaVFa1+jxfVtOJWIj3uj/WxaOViW9ql8LtSIDXIs=
X-Received: by 2002:a17:902:f686:b0:2a0:b3d5:5c3b with SMTP id
 d9443c01a7336-2a0b3d55dbcmr110163575ad.29.1765897071499; Tue, 16 Dec 2025
 06:57:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251201122604.1268071-1-akuchynski@chromium.org>
 <aTrJwA7Y4fWiTMzB@kuha> <aTrTvA8Srak1mNGS@kuha>
In-Reply-To: <aTrTvA8Srak1mNGS@kuha>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Tue, 16 Dec 2025 15:57:40 +0100
X-Gm-Features: AQt7F2qeZ_WfsLUra7491GkxZMYka8CwuiO4xGxfSOYVSZ4rrkAarfhEbx97JRI
Message-ID: <CAMMMRMdwX8wKJz6OEvosVXFH2npr+7pd0pdq3eY9r-Pbr3tjMw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/8] USB Type-C alternate mode selection
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Abel Vesa <abel.vesa@linaro.org>, Pooja Katiyar <pooja.katiyar@intel.com>, 
	Pavan Holla <pholla@chromium.org>, Madhu M <madhu.m@intel.com>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 3:23=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Thu, Dec 11, 2025 at 03:40:24PM +0200, Heikki Krogerus kirjoitti:
> > Without going into the code review yet, I'm okay with this in general,
> > except with the artificial SID for the USB4. I still don't understand
> > why do you guys think we should use that instead of an USB4 specific
> > device type?
> >
> > I think somebody said earlier that the user space can't see the device
> > type of the alt modes? If that's really the case, then I think there
> > is some bigger issue here. Are you really sure that if you check the
> > device type of an alternate mode for example with udevadm, it does not
> > say DEVTYPE=3Dtypec_alternate_mode ?
> >
> >         % udevadm info -q property --property=3DDEVTYPE /sys/bus/typec/=
devices/port0-partner.0
> >         DEVTYPE=3Dtypec_alternate_mode
>
> Or just use grep :)
>
>         % grep DEVTYPE /sys/bus/typec/devices/port0-partner.0/uevent
>         DEVTYPE=3Dtypec_alternate_mode
>
> So, if that really does not work, then there is a bug somewhere that
> we obviously need to fix.
>
> Please note that the port altmodes are now also part of the bus.
>
> Br,
>
> --
> heikki

Thank you for the review, Heikki.

The USB4 SID is utilized for distinguishing between USB4 and alternate
modes internally and is not exposed to user-space. This represents internal
implementation detail, for example the boolean variable `is_alternate`
could serve the same purpose as the SID.
This patch series introduces no new sysfs entries; the only new attribute,
`priority`, was introduced in the mode priority series, available at
https://lore.kernel.org/all/20251124124639.1101335-1-akuchynski@chromium.or=
g/

It is possible to use already existing `usb_capabily` and `usb_mode`
attributes to manage USB4 mode, allowing verification of USB4 support on
both the port and the partner. The activation of USB4 is accomplished
through the implementation of the `enter_usb_mode` typec operation.

I would like your opinion on whether using a USB4 device type would be a
better approach.

Please note that patches 6 and 7 are not part of the mode selection series.
They are not yet complete and are provided only to demonstrate how the
entire feature should work.

I confirm there is no issue with the DEVTYPE. Thank you.

Thanks,
Andrei
