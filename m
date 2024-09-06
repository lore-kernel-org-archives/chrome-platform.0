Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918C61CCB2C
	for <chrome-platform@lists.linux.dev>; Fri,  6 Sep 2024 15:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725635477; cv=none; b=IuFOx+gAnUgB7TQeaGhhaL4pkzgFD80BtFdN8GqnVV64Tbdf3OHiVYDrUOqAPO2qlmzE5LHHqn3fXjRxIYr/HHT8CzqwFNx+JvnsMq8YsadEhjHFe3RDjtZT8b5gfkKEOWjjsuiMK9P9rxNlpW148WfwR38rScI+3lVpohk64OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725635477; c=relaxed/simple;
	bh=rf4UTRwtuX4PsvIkw4m23QYyCQdn7lNWAwtBCUtCyww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=by6H50v5pHuMvrq4OQX3zkma5AB1ZYHRat7qChjVeKcIRtDBY01Rc+8LeAlQoj4GG8pkYkbreDkCyvGFFRiHOuf1yd6Sqdveyi1kg/w2kHhiVG+YRBIvtHggXIQvmwEFwNX8DgLlkA2c8EXn9NmBWXtQQhP7/2Q0z7qaoq6kspI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LL6ATbHy; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LL6ATbHy"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53653682246so2494137e87.1
        for <chrome-platform@lists.linux.dev>; Fri, 06 Sep 2024 08:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725635473; x=1726240273; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tui8ro7/0J4XAAKxms9MBaVs88CJKZbuhtKePx9SuEI=;
        b=LL6ATbHyK1S9JwE7sn6EUs5hhGXnFweW6KtIPP3VtaY9fT7D5WfakEBrMr4BRpqhCs
         xmpGn0EHTCuC/hWqF/SYbYiyKaUUFkEw/kaq9Fg7+us9j6nJDw04Y/aBXxwR1wrVIDto
         +k4ybiyT9MzqMfiTrAsGDt7s3L72N/ZC0V1/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725635473; x=1726240273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tui8ro7/0J4XAAKxms9MBaVs88CJKZbuhtKePx9SuEI=;
        b=JV3fdB3vtAltqg7DwwVR1VdWCojx33BE5OqbfM1Zk5vlzciUF5v1o7djpjwqyiWm/r
         vzIg5fjQgCIHOO7fEzua/HmdCwb9v8Bn1GuFVgldGMrKR6lHNOaLF5EckXJLkyD4EC6+
         XE/1m3+AFoB8No/cMpX/rbGLfG3GeM3sR0gMec0PVCc5fNtnkQotqI5a0Nvn5YcIX10p
         ddfaoi0FokbsA0t6UORyN4MxomVH+l9kHTCiKsjCaPxvo57twOUdAQJQqAORyAp5eJPL
         t7HPSu1GH2ezytdDQ8LhYNFkodw12UpyOHOPwRNZYvzLs87NDC0DOeCR7i7nxiJQclzS
         OPyA==
X-Forwarded-Encrypted: i=1; AJvYcCX5ylX8fMx1ipAD3y2DdJOrNgYOeySXt5Fp5a+fT786KXwcKOv1GZl8FL6Dv7fWZZ+wB5ktQeub0ISmBCLYdXc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvFxadzkEwXEhFTg/+8hDj+IrDE8sjF12Qn1aWqqWm2Pr7sXoh
	HBwvk2DGgidk4YwQ9eDiaN6KKFyMU3uP6k9R6e1ZMAjP3si/vgP/umzLe6dwqtxgZd1H6MVch45
	7gyhynwqoQ9JrZoWJoYw0J/8/uPnt/ox+CYM=
X-Google-Smtp-Source: AGHT+IH4P9eM8i2IIHGd9L4brJirB7x2Q+j1nT07a975rHbXmAf4GceRUszC0hwV7Z2cieMb0UOlUX93hGD/hXWsKak=
X-Received: by 2002:a05:6512:3d86:b0:52e:74f5:d13 with SMTP id
 2adb3069b0e04-536587b3f46mr1927825e87.30.1725635472796; Fri, 06 Sep 2024
 08:11:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240903163033.3170815-1-ukaszb@chromium.org> <20240903163033.3170815-3-ukaszb@chromium.org>
 <ZtrA8y0266RTm5Z3@google.com> <CALwA+NbiW+Gt9fi6Y+_xJFUEQWZFp5cvB5kqw_LVd4Mcf03Xtw@mail.gmail.com>
 <2024090608-slick-shaft-1c8b@gregkh>
In-Reply-To: <2024090608-slick-shaft-1c8b@gregkh>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Fri, 6 Sep 2024 17:11:01 +0200
Message-ID: <CALwA+NapBsJH68S50N62etimstUg6QUrMqUJ2wDJWKyvxHF6SQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] platform/chrome: Update EC feature flags
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	Pavan Holla <pholla@chromium.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 4:07=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Sep 06, 2024 at 03:53:06PM +0200, =C5=81ukasz Bartosik wrote:
> > On Fri, Sep 6, 2024 at 10:44=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.o=
rg> wrote:
> > >
> > > On Tue, Sep 03, 2024 at 04:30:27PM +0000, =C5=81ukasz Bartosik wrote:
> > > > From: Pavan Holla <pholla@chromium.org>
> > > >
> > > > Define EC_FEATURE_UCSI_PPM to enable usage of the cros_ec_ucsi
> > > > driver. Also, add any feature flags that are implemented by the EC
> > > > but are missing in the kernel header.
> > > >
> > > > Signed-off-by: Pavan Holla <pholla@chromium.org>
> > >
> > > Same as previous patch, it needs your S-o-b tag at the end.  See [1].
> > >
> > > [1]: https://www.kernel.org/doc/html/latest/process/submitting-patche=
s.html#when-to-use-acked-by-cc-and-co-developed-by
> >
> > I have not added any modifications to this patch. I understand that my
> > S-o-b tag is not needed in such a case. Is that not correct ?
>
> If you are forwarding on patches from someone else, yes, you HAVE TO
> sign off on it as well saying that you are allowed to do the forwarding.
>

Thanks for the clarification Greg.
I will add S-o-b then.

Thanks,
Lukasz

> thanks,
>
> greg k-h
>
