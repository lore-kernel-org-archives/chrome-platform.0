Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A841C5F23
	for <chrome-platform@lists.linux.dev>; Tue, 16 Sep 2025 16:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758041282; cv=none; b=BZ9fpxgacyLjxXk3N8MJjX4IrNyjodK5tp5ABWL9+zBQek4ysYDF3nCguekXaTuQqFeJppvAltTqgiaiBkcwbo84TvejzGAbDsp98ERpWxdl7jaHnX1Wq1JyZGGMPly00OpEF73yN/N3YjQn3Xc10LdbjI0lFafrDYMkD7RKaAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758041282; c=relaxed/simple;
	bh=71RTH5dtO3mKhxi62YpmdZ3mPiuAXTAABtxH+Y5Q4WY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mwyKVlzqIazcGUKTKsBPIiSrkcSJIFUjg0fy8peVS0UBCOo+ne2JSUIF77SGOd+a5jI0cHWE+3v8oU6hEV+0Zt3QHA+TpD5eoxyHcyfqVO03VEuoz2MsT2ZDyMxKvjddFmTikR3fHHSfCVOUQxSBfU2nDoSMTZFaiocVJ3me+h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NPBjw3sY; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NPBjw3sY"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-71d6051afbfso42151027b3.2
        for <chrome-platform@lists.linux.dev>; Tue, 16 Sep 2025 09:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758041278; x=1758646078; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ETmZDpbYmqIU0hIW51Fx0lZCbZYUtcEVM1kLaNYVSU=;
        b=NPBjw3sY9FqRJL2v3lvve5kjzCk6NTeqAN0U6nS5A69vlGv672Nxv5eSpbJNk5bN1y
         2Szf2CSK7WPIPBYSs2A/tN6l8iFVaG5qEBuQmanQh/lNVPnFNhalisi9EXJQXtiTISW+
         xiAeADwdC54DB3qAvyaFEspY/O8otbDuMW0qM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758041278; x=1758646078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ETmZDpbYmqIU0hIW51Fx0lZCbZYUtcEVM1kLaNYVSU=;
        b=jwK4OYJ8Qs+blnj2T1M120MGw4b4SbuU366WvVE7zu4EnJBMkJ8+l7PmHdoYfr58Lj
         BTdPl26DOCD3h8yuKdCjW9RtqcRSwRTN71SOTPnyi58mQLB0LHPj2jWVGrRxAfbR/Z75
         lkB5rnjmLSEzF0mDPXBwvM4voH84n4Fkl8/y4gx1BFdnnTaek8gU7QC6JhzErwNR8zsQ
         IEGs0/ifOHOZir7c9HF/fzfsSIDgwFpfhPH/gTMY2YVuFUNY2kOQbE5Bhlz3bG300Y9v
         rLNkxNo1xnc2xt1Bkpg7aDxTxbZ8mMTxFb6SVOXvcAdHg0lNi3Y6qcqJ8avsoIDy8kZa
         QHNg==
X-Forwarded-Encrypted: i=1; AJvYcCWVzLWqIa86ejM+ew5KXLakkZayr8e1Ic6g3XcEh4q/aqY/MImQ7A7xueMUoEeeERjyRV/EgQAQxXV4+zSpjFc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyudsBGpOyAznTP6hpfBZFjgiyt9KnneGN++cF6fXsodUSeyWlJ
	Nh7X3qXaIns7W3omMtbaoI7rNqXbSq7OUkrHSZna+kgO93ArgV2fz0ABzTsrCutV0MLWtSGPXcS
	iQkEHdyLSR8e+3Av2Jdx+PwTt31Q4FC6BZXpwZzSe
X-Gm-Gg: ASbGncsVQUr8bGo6sMkjfeFJwKa/kF3g8y4JjpPHvXT8UuKutBGqBJ+BDCyl9b1vNsj
	eLWBw4pfjSCcsXJnYL2hdJHDpqtUXewiMeXjidL6puN5z1EYP5NMPiWm+Z4AK6QLPuv0fU/1cCA
	NCdIwjs8fgjNQzIkrO/RLg/eqFEwIBcDt7npg8cmEDc/Gn0Vy7AUqKVBR2c/exs3lwsJkkHuQiF
	PWpCCs=
X-Google-Smtp-Source: AGHT+IFZt1kfGdCyhiAecc8NbMlubsrrYf2Bl36ioKqJQz0ak2LxPjQCNPumVJf96dL1uLcuYz1CuE3rsG4iLt7nm2E=
X-Received: by 2002:a05:690c:314:b0:722:6c4d:a46c with SMTP id
 00721157ae682-730654cd3c3mr154591707b3.48.1758041278330; Tue, 16 Sep 2025
 09:47:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250909123028.2127449-1-akuchynski@chromium.org> <aMliLCWFKy5Esl0-@kuha.fi.intel.com>
In-Reply-To: <aMliLCWFKy5Esl0-@kuha.fi.intel.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Tue, 16 Sep 2025 09:47:44 -0700
X-Gm-Features: AS18NWAU9Wq6pK_RLACFVUfRmWbdIPmVUr2iNMaa6noro-Cml5cKdRX1otFdb8w
Message-ID: <CANFp7mXvpNXr=01nQR54d+Z+vSiiwiDLB+3B+1eR6Ks7b37gtg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/5] USB Type-C alternate mode selection
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andrei Kuchynski <akuchynski@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 6:12=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Tue, Sep 09, 2025 at 12:30:23PM +0000, Andrei Kuchynski wrote:
> > This patch series introduces a flexible mechanism for USB Type-C mode
> > selection, enabling into USB4 mode, Thunderbolt alternate mode, or
> > DisplayPort alternate mode.
> >
> > New sysfs `mode_selection` attribute is exposed to provide user control
> > over mode selection. It triggers an alternate mode negotiation.
> > The mode selection logic attempts to enter prioritized modes sequential=
ly.
> > A mode is considered successfully negotiated only when its alternate mo=
de
> > driver explicitly reports a positive status. Alternate mode drivers are
> > required to report their mode entry status (either successful or failed=
).
> > If the driver does not report its status within a defined timeout perio=
d,
> > the system automatically proceeds to attempt entry into the next prefer=
red
> > mode.
>
> I'm still struggling to understand what is the benefit from this - why
> would you want the user space to explicitly start the entry process
> like this? Instead why would you not just take full control over the
> alt modes in user space by enabling the them one by one in what ever
> order you want?

I think after the many patch iterations we went through upstreaming,
we may have lost the point a little bit wrt/ the mode selection task.
We talked about this on the very first iteration of this patchset
here: https://lore.kernel.org/linux-usb/CANFp7mVWo4GhiYqfLcD_wFV34WMkmXncMT=
OnmMfnKH4vm2X8Hg@mail.gmail.com/

The motivation behind it was to allow the kernel driver to own mode
selection entirely and not need user space intervention. The current
alt-mode drivers attempt to own the mode entry process and this fails
when you have two or more altmode drivers loaded (i.e. displayport,
thunderbolt). The original goal of the mode selection task was to move
the mode entry decision away from the alt-mode driver and to the port
driver instead.

What's missing in the current patch series to show this is probably
actually calling mode_selection once all partner modes are added :)
Andrei should be adding that to this patch series in the next patch
version.

Adding the mode_selection sysfs trigger is for another reason: to
re-run mode selection after priorities have been changed in userspace
and there is no partner hotplug. We specifically have some security
policies around PCI tunnels that result in the following need:
* When we enable pci tunneling, we PREFER tbt over dp and would like
to select the preferred mode. When we disable it, we PREFER dp over
TBT and would like to select the preferred mode.
* When users are logged out, we always prefer DP over TBT.
* When the system is locked, we prefer DP over TBT for new connections
(but existing connections can be left as TBT). When we unlock, we want
to enter the most preferred mode (TBT > DP).

While this is do-able with the alt-mode active sysfs field, we would
basically be re-creating the priority selection done in the kernel in
user space again. Hence why we want to expose the mode selection
trigger as done here.

>
> I don't believe you can make this approach scale much if and when in
> the future the use cases change. Right now I don't feel comfortable
> with this at all.
>
> thanks,
>
> > This series was tested on an Android OS device with kernel 6.16.
> > This series depends on the 'USB Type-C alternate mode priorities' serie=
s:
> > https://lore.kernel.org/all/20250905142206.4105351-1-akuchynski@chromiu=
m.org/
> >
> > Andrei Kuchynski (5):
> >   usb: typec: Implement mode selection
> >   usb: typec: Expose mode_selection attribute via sysfs
> >   usb: typec: Report altmode entry status via callback
> >   usb: typec: ucsi: displayport: Propagate DP altmode entry result
> >   platform/chrome: cros_ec_typec: Propagate altmode entry result
> >
> >  Documentation/ABI/testing/sysfs-class-typec  |  11 +
> >  drivers/platform/chrome/cros_ec_typec.c      |   9 +
> >  drivers/platform/chrome/cros_typec_altmode.c |  32 +-
> >  drivers/platform/chrome/cros_typec_altmode.h |   6 +
> >  drivers/usb/typec/altmodes/displayport.c     |  19 +-
> >  drivers/usb/typec/altmodes/thunderbolt.c     |  10 +
> >  drivers/usb/typec/class.c                    |  37 ++
> >  drivers/usb/typec/class.h                    |   4 +
> >  drivers/usb/typec/mode_selection.c           | 345 +++++++++++++++++++
> >  drivers/usb/typec/mode_selection.h           |  25 ++
> >  drivers/usb/typec/ucsi/displayport.c         |  10 +-
> >  include/linux/usb/typec_altmode.h            |  11 +
> >  include/linux/usb/typec_dp.h                 |   2 +
> >  include/linux/usb/typec_tbt.h                |   3 +
> >  14 files changed, 516 insertions(+), 8 deletions(-)
> >
> > --
> > 2.51.0.384.g4c02a37b29-goog
>
> --
> heikki
