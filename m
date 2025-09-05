Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0263132A81A
	for <chrome-platform@lists.linux.dev>; Fri,  5 Sep 2025 12:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757076075; cv=none; b=Diac51pAIUu321LV58OYbC4zprYnEPEGkEnjGFlBnWUO6+0xBPGFhB8Er4yNyPsTOCn33U4KlSfro2vhKQHID042K/FaPZiw4FCIa94W5a41YjoZqkSTTwwS3AifxoJIaqUbEXnOBiogMoeQiBL+as+l2ArhRwOQSekgOp3lfAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757076075; c=relaxed/simple;
	bh=oBXHKrWN/b8xEphfOBxvMXuoVFvsOyyVX+52kY7ZBjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VETTu5rbJr4wR9EBflf2RNhaRqGIRDfmNy+T+Db+iMjefhMmSE4mW2SK6i0yBM7WApfN0ZETlHC582sbjb5KgFWLw6SWAoaOTtaTLQtQDCWK+h8p6Ii+RGxt//8mJgN9o0V5yDVIeKP8L2zHHonFXwlOR0fRvYoLkkv6QZ9eUBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IpiTBhsL; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IpiTBhsL"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-32326e09f58so2326317a91.2
        for <chrome-platform@lists.linux.dev>; Fri, 05 Sep 2025 05:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757076073; x=1757680873; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDIiR34iXezMR7BHEFFCv6iSUlhvz1mav6TCgrGlsTQ=;
        b=IpiTBhsL4/lgeKJClAa8bhBhu6A13P0EhNz1fm/Q66oDIPpR4bQ0OB2jxc1lMkeyvs
         Vv0GTCyi3w8CfcSeFb8Dzipnuf/yB5SjISygCVdgZlBgKnhPw64RtPaLLJzf0vIUMzud
         IRwB8N4culBY7O5CH1dsLo+asLPCJxtMpv84k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757076073; x=1757680873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDIiR34iXezMR7BHEFFCv6iSUlhvz1mav6TCgrGlsTQ=;
        b=bC5TGwVZ3/BeTeRWL8BFTPZ08W2BAeXfbv1mGcKpRarMlmrJekzQ9xrPWLi3ZF/QYb
         igVp0DMI2UwYMEHTkkiZMssFzk5InmEYBYS3NrlDqiDSY3rRXRntxqMo/6uPYVGtSiWT
         T+ezDPRNc/Wda8OJ8VUKjirE8WAZrbSffzO2APc55ZxyJsbNdHcxhf7WtEhBRR837d4H
         auEY41LL61UhXG5Ik5sC4OZfWqH2krolpFXdsyE8iyOjqUmt/twN3sbQf6b7sSnxaRoO
         paWlZNZfHCzsBMBLIMK/gUAOqZeSJgj9hwCqTk4pBY6KtJCfHOmh1k5S1Y406/atD+xo
         WIqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmud5b11AnvmQFzAcOjULJ2Ni+gUUhzkdaugBsPkifLeM7DQRUT5S6Czu1qME8ao1rJnE0tOa9SiLYx379ItY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCvtBsNi3gR0Z94KlkRQQE6w1fZ9O9q4G6wRMUYKH+Yx3xL2Xl
	L4e9Sx3f7w3aTcmYzebrtabqTrHEd4QjKDk0zdFe56L55V3b6bJdRPY9OiMsIEJKyxQHlM5fAv3
	UlMOZP8fHkAQFxHiwcbGmuZIVJnSBss1fx0pNht9+
X-Gm-Gg: ASbGnctcy+UMX8L2VE2VI+xUcsVuIWgDUSsf9YPk/j/iy6V1Sohp1E3Q9VdY+u5QWPp
	tNCR9XGZERwJmFH/q9TIl8fhnA7WC3YhPmKfLXVqqZ8rgKmn4Rpl9LEz880O8mOnTGtU7b1UH8N
	y6wTKiIiC8RACRh7Z2H6nmNdsvyfIy44ejGgh7nsKUN95VtwAdHcJSyh8bGhO3yoN1Vfjw1N642
	P7ZrUBLH+ND3H4rC53n7bJ810FgwnhjWw==
X-Google-Smtp-Source: AGHT+IE1e9GdET1HkJdnTcqNZ6pmew3/GoNUVVNslDsopYdaiOZRiWcX4ix6U/VN/o6VHJOiC5A+QLarYg2TUdmWIjE=
X-Received: by 2002:a17:90b:3d48:b0:32b:70a7:16da with SMTP id
 98e67ed59e1d1-32b70a71b2fmr11961610a91.20.1757076073274; Fri, 05 Sep 2025
 05:41:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250825145750.58820-1-akuchynski@chromium.org> <aLrQKurGZkbCkjlw@kuha.fi.intel.com>
In-Reply-To: <aLrQKurGZkbCkjlw@kuha.fi.intel.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Fri, 5 Sep 2025 14:41:01 +0200
X-Gm-Features: Ac12FXyxvfhy8ARaoEcCu19f2V-MoHQ9ApY5WO6r6Z4u1iuoDkWCmEuJxuSbxjQ
Message-ID: <CAMMMRMcYiB8Sb5sjjdH_TcX8b2kGZFcM=r8L_txpZtyBGZt4Gg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] USB Type-C alternate mode priorities
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 1:57=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Andrei,
>
> On Mon, Aug 25, 2025 at 02:57:45PM +0000, Andrei Kuchynski wrote:
> > This patch series introduces a mechanism for setting USB Type-C alterna=
te
> > mode priorities. It allows the user to specify their preferred order fo=
r
> > mode selection, such as USB4, Thunderbolt, or DisplayPort.
> >
> > A new sysfs attribute named 'priority' is exposed to provide user-space
> > control over the mode selection process.
> >
> > This series was tested on a Android OS device running kernel 6.16.
> >
> > Changes in v2:
> > - The priority variable is now a member of the typec_altmode struct
> > - typec_altmode2port is used to obtain the typec_port struct pointer
> > - Default priorities are now set based on the order of registration
> > - The mode_control capability is enabled by default
> > - The mode_selection_state struct will be introduced in a separate seri=
es
> > - svid will be used instead of the typec_mode_type enum
> >
> > Andrei Kuchynski (5):
> >   usb: typec: Add alt_mode_override field to port property
> >   platform/chrome: cros_ec_typec: Set alt_mode_override flag
> >   usb: typec: ucsi: Set alt_mode_override flag
> >   usb: typec: Implement alternate mode priority handling
> >   usb: typec: Expose alternate mode priority via sysfs
>
> I'm sorry for keeping you waiting. I think these are okay - although,
> I had to put a few nitpicks :) but they are minor - but can you
> include a patch where you use the priority member in a driver (maybe
> cros_ec_typec.c)?
>
> thanks,
>
> --
> heikki

Thank you for your review and feedback! I appreciate you taking the time to
provide these notes.

The patch using the priority member is part of a subsequent series that I
have ready. I will send it shortly. This functionality is implemented in
mode_selection.c to determine the mode order, and we plan to use it for
both the cros_ec_typec and UCSI implementations.

I will send a new v3 patch set shortly with the minor changes you suggested=
.

Thanks!
Andrei
