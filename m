Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69351EB2D
	for <chrome-platform@lists.linux.dev>; Mon,  1 Apr 2024 20:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712003573; cv=none; b=iq/dOxPic75Q0P9zXGF4Z0W0KTiZkIdPuPjZJ0DKrK9Va+Uf+t/JEoVDUbit/iSA7JKxjr2JcNqTa2p5+hyUiTVtFysRwh4o3Dm8I3FXZFHnuexWElomAhYZ7uia5oaK0SurIZnRRggQO5zXwLvYQWNx2+nRCmD16vzl6toRKHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712003573; c=relaxed/simple;
	bh=WlWF4sZthTybsqjHZ3Wo3dh3Wr4y3oJSrsc10FAPues=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NxO9bWG/2RRuF6yUU2/VmrTHtYmG9vUNhXv3pPZpDzd82s988KVZu6jQ39xdgfel/O53G+/Oia487HGOc/pBF3slFBub9/feqfhzZXJZ7Tca5D61Sz3YRwb2clZevwAH14JujRS7QQ1jkO1Bbuyep4PCSswc3sZYxkrnPw/gz9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AWxQzUyo; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AWxQzUyo"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-47603a066daso1166313137.2
        for <chrome-platform@lists.linux.dev>; Mon, 01 Apr 2024 13:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712003571; x=1712608371; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WlWF4sZthTybsqjHZ3Wo3dh3Wr4y3oJSrsc10FAPues=;
        b=AWxQzUyow6cvlVkVVgpmxUYah90DoYfmJRGdKVqibjwuORXzF/+I4TK6UAxDNvPjbp
         GnHFS9FAyisH4BC8yQ6V0pj1OYm7B1TL4o8ukUY8EeOZBe7lizwsFQ8tD0zQELF0KAfO
         U7KLSsWHMiyUQm6onfAGVYiq+YSA1hyrnedPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712003571; x=1712608371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WlWF4sZthTybsqjHZ3Wo3dh3Wr4y3oJSrsc10FAPues=;
        b=Nvp0eZuKeMo05C0OzT7ISD1e++pT4VJVb6vvErkh9clGp5pEUhzuZhRiQWG10WgM5D
         +hX0LIQt1LCQsSH8YKbK0sSPZh6/daJXkXrn4lXI4yrnjfzg12NOcmnSxDHnsXADPdeQ
         JwCx48JQocg+Q7BXlH+WSyEQ/5D9sv3HRTho4tGM74EwGKaxTupWNR2cXXn+lLlvDlLX
         p0fNQzBTz7BFsCrnMsN8kxy4I0XATkDmZ2DsOuNYiJYhIOZqlYvgBGoNk0Rd/Vs2xAHb
         hCGEvtP1imE6iJQ+vVaHBa+ODla+JHFSeoxL1CYQyBGtJMbGCdY2QQ+X8PGvac8uspw7
         3yFA==
X-Forwarded-Encrypted: i=1; AJvYcCVnpJFfV/rrY1meo5SNTiQYDqgVJJm3lJ/eSwDmoEpQnQCo3et85URMkCohpoiImTaTkAGRvUCEPLV++YnSymUgKz607633ufEmlqvlLRIA
X-Gm-Message-State: AOJu0Yynqtzd07nljbvWbdhQ0gYWdBcoG+ml8BK/xzmjaPWOUU707L76
	UTR1ucvUYIzzSb/dbV9CV/KmObPTRzg2f8mser3O3Y8C8l8pop/WoYS6IHOvBW3BiqtkJ6iOF/V
	VzeTd7GsG+ePvvpGVaPRYKzGuPeVL/9z1vf/U
X-Google-Smtp-Source: AGHT+IEBUFuHC1uovMRbuGkUNY7LgsBGowAQKo3d4i+4cDqZFxwCT/kL8PqtYC40kciKNJcNDSxwr9+UZ8+Pke79mBc=
X-Received: by 2002:a05:6102:3bc4:b0:478:2f66:f641 with SMTP id
 a4-20020a0561023bc400b004782f66f641mr7884700vsv.34.1712003570896; Mon, 01 Apr
 2024 13:32:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240325-public-ucsi-h-v2-0-a6d716968bb1@chromium.org>
 <20240325-public-ucsi-h-v2-3-a6d716968bb1@chromium.org> <1b040be3-acd7-40dc-bc9b-24ea6d4b8377@linaro.org>
 <CAB2FV=614YLrsj6yPxRd1uVsF4n3EabLoXwL1Mtrk9Eg+5Mo9g@mail.gmail.com> <CAA8EJprn_95+ZnwmAHEQpQjQqZ5-Na1pj32TCY5BFMt7Uv7eWA@mail.gmail.com>
In-Reply-To: <CAA8EJprn_95+ZnwmAHEQpQjQqZ5-Na1pj32TCY5BFMt7Uv7eWA@mail.gmail.com>
From: Pavan Holla <pholla@chromium.org>
Date: Mon, 1 Apr 2024 13:32:14 -0700
Message-ID: <CAB2FV=56z2dRYWNWf7Cbr+ubygO1TRgZzg-RqFzZeByx+tBehA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] platform/chrome: cros_ec_ucsi: Implement UCSI PDC driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 8:13=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 29 Mar 2024 at 17:09, Pavan Holla <pholla@chromium.org> wrote:
> >
> > Hi Dmitry,
> >
> > Thanks for the review.
> >
> > On Thu, Mar 28, 2024 at 8:32=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > > While it's fine to use platform/chrome for platform drivers, please
> > > place drivers which have a subsystem into the subsystem dir. I think =
we
> > > don't want to hunt UCSI implementations all over the codebase. Please
> > > use drivers/usb/typec/ucsi/ location for your driver. This also remov=
es
> > > a need for a global header.
> >
> > I agree with your assessment that drivers/usb/typec/ucsi/ is a good
> > location for the driver currently. However, the driver is still in
> > early stages of development. We may have to account for PDC/ EC quirks
> > (we have multiple vendors), add FW update functionality outside the
> > UCSI spec, or add PDC logging functionality. While I'd like to write
> > separate drivers for those, some of this functionality will need to
> > acquire a lock over communication to the PDC. Even if I were to write
> > separate drivers for new functionality related to the PDC, maybe it's
> > better for all ChromeOS PDC related drivers to reside in the same
> > location. I am not sure what form this driver will take in the near
> > future, thus I would prefer to keep it in platform/chrome. Maybe
> > cros_ec_ucsi isn't the best name here, cros_ec_pdc probably conveys
> > the intention better.
>
> In such a case please consider using auxilliary device bus or MFD
> cells to describe pdc / ucsi relationship. See how this is handled for
> pmic-glink / ucsi_glink.
> The drivers/platform should really be limited to simple drivers, which
> don't have a better place. Otherwise it becomes a nightmare to handle
> driver changes (this applies not only to the UCSI but also to other
> drivers which have their own subsystem tree).

Thanks for the pointers. I will move the driver to drivers/usb/typec/ucsi/
