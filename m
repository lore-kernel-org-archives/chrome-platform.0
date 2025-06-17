Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55AE2DE1E1
	for <chrome-platform@lists.linux.dev>; Tue, 17 Jun 2025 12:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163899; cv=none; b=hRnSuZqyS14nOTR21PLb8/gIOkzhrD9infjbqpwKTR2qxcrrx3QH/Hitp6Qj/e7vfQtidxCkwyqGa6ciR9WKsk7sIhASyw2qcFNzEmPzfpVUaSvcr5xt3TbrAHf5WoH0/xZLoklub9xTAGL+5V+PElSyiZZCtpOLHuiAawzUmVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163899; c=relaxed/simple;
	bh=govOO8Sb0lfvYc8/pNG+JSTBvpGt8Xu8LaXV/aZgDiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QfupDrw39uM1Z6ELSVoFE3U+FpYUCVM6k9b/JqaqbiE9cprv/E1QuuEIiDSQU7xCLiy+C48jE0SMxt8NnVj7xp6Nm1tc0QXb7kq2Yz0ws0h4mrT7dszJFKrY9ep+ubmxsLb4Y+PikBs1+u9IOj5QV5WsoHEwVIzGJ7VmiU3fUnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m8fumMdh; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m8fumMdh"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7487d2b524eso2849790b3a.0
        for <chrome-platform@lists.linux.dev>; Tue, 17 Jun 2025 05:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750163896; x=1750768696; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MoyRF7Ucv2ZJei5c5Z3iiwvEOE6mahrV6OPr5N+nC6I=;
        b=m8fumMdhk7Y/byKK5AYFkOx7y+MDaaTS6+NBKzDyPJE/LkFted2EzQ5tDCcmXdEb6K
         35k96PHQRYuKs3bJndQup+w4FHATPa75E2HB667hnZHdO8as8Kgwy7R6j7JbavKit0g7
         hLcqVKbUL/WEHJv9V/oqzREMG72+nmnxWB470=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163896; x=1750768696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MoyRF7Ucv2ZJei5c5Z3iiwvEOE6mahrV6OPr5N+nC6I=;
        b=K1blfIuCtqKUxqBS5N8LQB4NR58sYUREq3JuiXlW3jJk2O+90Ra+JL3awjxx7mghcA
         Tpvv8cEPAp2zGNWJYWjNPAhh3DNpiIAR7AR74DchgDajWpmF4DesloFXVji8a4+9OVBz
         UGGFqYEJwP+oPJluZ4TIUW9NIqKJGRwrYMMeNbardyZsClTeYCDzC4IH6aL1wp+Gi+/E
         9CiwKjybdeJQ8UUL/1c5M1STVkGroBCjJsCa9toNgwGt3ys/m/hXyViFb/RFyrV9nLob
         t66pivrOArbRzObGh9gS2Nh6LGYDaS58+rmvezKuBso+YGApC47bDQ+WGWPAqV6S26Cj
         IrSg==
X-Forwarded-Encrypted: i=1; AJvYcCWGJfvRHmhKs9HtDM9wocq75DwMMIHtIIGlnGa6WMn8hkTMQE0EbeBS61QkCr1YqvEjn4OfdXuNQddpTMgLq+c=@lists.linux.dev
X-Gm-Message-State: AOJu0YwkreRx4lQuMgcVZ6wc+aMFfVjMHcaUHrEY0AlJQ/VsZvD8F9i8
	zjiExpGSa4ClKoRDlzrMkOGGrgdkk3on6dihYw5/dajNZmVvTgyIFUtTKbYSZr87OBNpt8c6jmM
	NxELOBuzw6KMYhLYUeSt1ACTAU/6kDOF//JQyclcF
X-Gm-Gg: ASbGncvpUUQByvBi3bWaY5614R5hfipuv3joHtWlL5BBP4wIQ6xBfLC8E6xSY7tfW8t
	vOf4DLzzZ1MXK9RhD4ZPjNqW8xNobq9SlvDR2JJIYxnYISPIdfwFHDQUJii2WmOopYUlWLgskCG
	v91uBUF+HbTeBxoKHpoiPILMBdx6ovLfuPzwngsN8PIuF/13tk66deTEtLMoTt+X8k4l0t
X-Google-Smtp-Source: AGHT+IGcwG7VCe2N0MX7DXoVynUbfy3BR2JdgAsClrObhggJXBjxy4eU/Z1empHJ7zy1mJYExj1FaQj/LqBg4z9XrUI=
X-Received: by 2002:a05:6a00:1255:b0:748:33f3:8da3 with SMTP id
 d2e1a72fcca58-7489d0335f6mr17213221b3a.19.1750163896212; Tue, 17 Jun 2025
 05:38:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250616133147.1835939-1-akuchynski@chromium.org>
 <20250616133147.1835939-5-akuchynski@chromium.org> <aFE6dnxet4_sm8b1@kuha.fi.intel.com>
In-Reply-To: <aFE6dnxet4_sm8b1@kuha.fi.intel.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Tue, 17 Jun 2025 14:38:04 +0200
X-Gm-Features: AX0GCFtqlvORHJFZLdz5McnL-6vzhJjXiWQ9EAC7tyWfPgFhCZapQvWuwd4Rmxk
Message-ID: <CAMMMRMdwUyxdMy42tA_ccYo77nf=6C+KgokDLHBLEYDa5aOHQw@mail.gmail.com>
Subject: Re: [PATCH 04/10] usb: typec: Expose alternate mode priorities via sysfs
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Guenter Roeck <groeck@chromium.org>, Pooja Katiyar <pooja.katiyar@intel.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, RD Babiera <rdbabiera@google.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 11:50=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Mon, Jun 16, 2025 at 01:31:41PM +0000, Andrei Kuchynski wrote:
> > This sysfs attribute specifies the preferred order for enabling
> > DisplayPort alt-mode, Thunderbolt alt-mode, and USB4 mode.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  Documentation/ABI/testing/sysfs-class-typec | 17 ++++
> >  drivers/usb/typec/Makefile                  |  2 +-
> >  drivers/usb/typec/class.c                   | 26 ++++++
> >  drivers/usb/typec/class.h                   |  2 +
> >  drivers/usb/typec/mode_selection.c          | 93 +++++++++++++++++++++
> >  drivers/usb/typec/mode_selection.h          |  5 ++
> >  include/linux/usb/typec_altmode.h           |  7 ++
> >  7 files changed, 151 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/usb/typec/mode_selection.c
> >  create mode 100644 drivers/usb/typec/mode_selection.h
> >
> > diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentatio=
n/ABI/testing/sysfs-class-typec
> > index 38e101c17a00..46eee82042ab 100644
> > --- a/Documentation/ABI/testing/sysfs-class-typec
> > +++ b/Documentation/ABI/testing/sysfs-class-typec
> > @@ -162,6 +162,23 @@ Description:     Lists the supported USB Modes. Th=
e default USB mode that is used
> >               - usb3 (USB 3.2)
> >               - usb4 (USB4)
> >
> > +What:                /sys/class/typec/<port>/altmode_priorities
> > +Date:                June 2025
> > +Contact:     Andrei Kuchynski <akuchynski@chromium.org>
> > +Description: Lists the alternate modes supported by the port and their
> > +             priorities. The priority setting determines the order in =
which
> > +             Displayport alt-mode, Thunderbolt alt-mode and USB4 mode =
will be
> > +             activated, indicating the preferred selection sequence. A=
 value of -1
> > +             disables automatic entry into a specific mode, while lowe=
r numbers
> > +             indicate higher priority. The default priorities can be m=
odified by
> > +             assigning new values. Modes without explicitly set values=
 default to -1,
> > +             effectively disabling them.
> > +
> > +             Example values:
> > +             - "USB4=3D0 TBT=3D1 DP=3D2"
> > +             - "USB4=3D-1 TBT=3D0"
> > +             - "DP=3D-1 USB4=3D-1 TBT=3D-1"
>
> No. If you want to disable entry to a mode by default, then you
> deactivate that mode, so -1 is not needed. USB4 is also not an alt
> mode, so this at the very least should be named differently.
>
> But I'm not sure this is the correct way to handle the modes in
> general. Can you please explain what exactly is the use case you are
> thinking?

Hi Heikki,

This implements the mode selection logic within the kernel, replacing
its userspace counterpart. Implementing this in the kernel offers
advantages, making the process both more robust and far easier to
manage.
This eliminates the need for user space to verify port, partner, or
cable capabilities, and to control the mode entry process. User space
doesn't even need to know if USB4 mode is supported by the port or
partner; unsupported modes are automatically skipped.
User space's role is now limited to high-level tasks like security,
with the kernel managing technical implementation. Mode selection and
activation can occur without user space intervention at all if no
special rules apply and the default policy (USB4 -> TBT -> DP) is
acceptable.

>
> If you just need to prevent for example USB4 entry by default, then
> you write usb3 (or usb2) to the usb_capability. The alt modes you can
> deactivate by default, no?
>
> I can appreciate the convenience that you get from a single file like
> that, but it does not really give much room to move if for example the
> user space needs to behave differently in case of failures to enter a
> specific mode compared to successful entries.
>

You are right, this patch series is proposed for its convenience. It
offers a more convenient method for users to enable or activate any
mode, without altering existing methods. Users can decide whether they
prioritize more control or an easier mode selection method.

Thanks,
Andrei
