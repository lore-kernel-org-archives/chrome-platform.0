Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5DA1C0DFB
	for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 15:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711725202; cv=none; b=pzhyN1tk50m7659Uft15bWQRoTHJmH4imiajxFiKq1AtxtmtEOJYsW78k32Ru21RqPXk4qHhPogsyoCKKiRzJLHhBbufjyekxwUyZxk3pmOVtrThu/AbOb85E2R6GmxJAObMTL+bu1mZePUFHIOLwGhWg+qoX91v6RdaHIpqsM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711725202; c=relaxed/simple;
	bh=HZiOyoM4VReLCl+X3HGduolzIuLdTAfpmEDmlPASeuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WKngaJ65F33Me6O18QpmnUibzjbwbitoBZlb7kfcwLCUNTD0inftr4NR0rU/MD5QRjBY3tEwg+1aRbJSlArENOXsRtm6uNMs/r6yNqyEV74QNEe1RgKoZ4fNPHLHXsfajvmIrrYY4HCmMeCxfWEFDyav/drN1wvfIZqFEHg/rUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tjRDAWgJ; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tjRDAWgJ"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dcbef31a9dbso1445200276.1
        for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 08:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711725200; x=1712330000; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZiOyoM4VReLCl+X3HGduolzIuLdTAfpmEDmlPASeuI=;
        b=tjRDAWgJ0wAN6x53cv0NvAz03Ci9VRF/T9S21JUyW/5kcqEA8f6pIALxAblGExdV8N
         en8POM6pxaKZRHzMzlGmIODptfK7LjbYwjb0hgbfQjDrPRAMnL4L5HppzoCD3PQ0edYi
         vNEF3j55W7zBjtzxwgSg/t/5RIf51xYBxb6qj46870qN1UwJ+ATmcFQCHEQ4CR1HxX5X
         GQzUpk0IUOHhRPacunzvn5ib41J34BaC5ejFfhx9sVqfYXNaqsV80c+p1O0M3Gi0qLRd
         K9zTVR3GanrIXaQibnxUHRHcYImsKnVqqRidHPSr18GsCfG5TP95Cxc0V4f232v2yer/
         X+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711725200; x=1712330000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZiOyoM4VReLCl+X3HGduolzIuLdTAfpmEDmlPASeuI=;
        b=lhssR4TmazIe19MnPAuFQeq3wEApC6ooaXjDwtycLo/Do47PN9BnyqMz+4whnEIcVI
         vpEuX4sOHxMw7UplH1+5OoWrYoAMgWGHf2pLEEXT26pToDYgARGkmXsMnBXoP/3z/M/b
         41efeXjGQsxfZeBTdyG+iY8hlysBa+tjBy7Xc31KuyFgS6UJbyGWFM/HRFUklyYnc7/E
         Cmczy4U0S+OgLvdjppeYezbQSWzIQHk0nNWRCH6PJDEmf5xC7ssebT5O0M5nwd/+o+tp
         CC6c3fvq0HFym2EbUFGIKbsRNbgcWkGBwkEnUHeMaZsPc7OGWiR+C/TQayYGu9rP80f1
         I6Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUgt37zii/T74W1ysWGl13AQgubW67pRyj2pwNAAmQ/Ouh6zfseHOtHWf8p9CgyGu2/94wrgFL8EM0aLvUR5U8oav66boLCeatZaEMCAiPy
X-Gm-Message-State: AOJu0YxOBjLAQdRwCLgADsfLzrec+Qi6stKiw4xdu2PY7YUgp6u/TEWJ
	b+k5rhJ6S1weir60bD3xtzMCyIJcfGbChHlduj3cS3U8RfZHhTZM3mxVYPUSg6DexWxEh5Wik9x
	mrgDwUosS/EJAUM950IqjyGFEvGGWfNhWqKHGGw==
X-Google-Smtp-Source: AGHT+IHF+X6lAFwbbieIRJcKZCH7PclLjdVuA/2sH7ZxvnkV8S/IDSIfi8m2Dyjx59O7tKG7z0wumej4bOA5crbW44E=
X-Received: by 2002:a25:aae3:0:b0:dcc:97e4:bc61 with SMTP id
 t90-20020a25aae3000000b00dcc97e4bc61mr2648037ybi.57.1711725199846; Fri, 29
 Mar 2024 08:13:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240325-public-ucsi-h-v2-0-a6d716968bb1@chromium.org>
 <20240325-public-ucsi-h-v2-3-a6d716968bb1@chromium.org> <1b040be3-acd7-40dc-bc9b-24ea6d4b8377@linaro.org>
 <CAB2FV=614YLrsj6yPxRd1uVsF4n3EabLoXwL1Mtrk9Eg+5Mo9g@mail.gmail.com>
In-Reply-To: <CAB2FV=614YLrsj6yPxRd1uVsF4n3EabLoXwL1Mtrk9Eg+5Mo9g@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 17:13:08 +0200
Message-ID: <CAA8EJprn_95+ZnwmAHEQpQjQqZ5-Na1pj32TCY5BFMt7Uv7eWA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] platform/chrome: cros_ec_ucsi: Implement UCSI PDC driver
To: Pavan Holla <pholla@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 29 Mar 2024 at 17:09, Pavan Holla <pholla@chromium.org> wrote:
>
> Hi Dmitry,
>
> Thanks for the review.
>
> On Thu, Mar 28, 2024 at 8:32=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> > While it's fine to use platform/chrome for platform drivers, please
> > place drivers which have a subsystem into the subsystem dir. I think we
> > don't want to hunt UCSI implementations all over the codebase. Please
> > use drivers/usb/typec/ucsi/ location for your driver. This also removes
> > a need for a global header.
>
> I agree with your assessment that drivers/usb/typec/ucsi/ is a good
> location for the driver currently. However, the driver is still in
> early stages of development. We may have to account for PDC/ EC quirks
> (we have multiple vendors), add FW update functionality outside the
> UCSI spec, or add PDC logging functionality. While I'd like to write
> separate drivers for those, some of this functionality will need to
> acquire a lock over communication to the PDC. Even if I were to write
> separate drivers for new functionality related to the PDC, maybe it's
> better for all ChromeOS PDC related drivers to reside in the same
> location. I am not sure what form this driver will take in the near
> future, thus I would prefer to keep it in platform/chrome. Maybe
> cros_ec_ucsi isn't the best name here, cros_ec_pdc probably conveys
> the intention better.

In such a case please consider using auxilliary device bus or MFD
cells to describe pdc / ucsi relationship. See how this is handled for
pmic-glink / ucsi_glink.
The drivers/platform should really be limited to simple drivers, which
don't have a better place. Otherwise it becomes a nightmare to handle
driver changes (this applies not only to the UCSI but also to other
drivers which have their own subsystem tree).

--=20
With best wishes
Dmitry
