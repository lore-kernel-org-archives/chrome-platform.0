Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05674215787
	for <chrome-platform@lists.linux.dev>; Tue,  4 Feb 2025 15:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738681315; cv=none; b=TcTQXSqioaA8glpYNT52YRpnQgK8QcbT01tV9SKcjufMHTBW+JFXQCxXume6Uf+qhPcoqMuYO0hbhH2ra2cWOz7xBikW4uDUz+kwj4X+oWDYkQR59P7kaia7XcisxhtKaIxaOkYwxwzpHcKygYppIMgvNv3Z83LLPbiNEew2eKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738681315; c=relaxed/simple;
	bh=0OoJfLQUZ+XTundB1ZNYbvCieQOKhKGKZ1e8Hw09GoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aTp/O3OTtMvvyfWM3aSEo+lPun8P3DJ8BNTDdJ4MkG+FIBCWx0tykKGED7DzUyqtlsn/Rh1WYG7Ywyj9xx7tJqCKkJd6/YGqK32oZiHILejKrXMrKgYVsV0XyqnrghV4w62nm23e8SpNUN46YlsSZtuOc4Gqoa+KMTy8pxarAyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GUWumO4k; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GUWumO4k"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30036310158so42079391fa.0
        for <chrome-platform@lists.linux.dev>; Tue, 04 Feb 2025 07:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738681312; x=1739286112; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4PSD3oLODlnXqoWTIL47JnYdn8a6cMsKT6T4yi/eD8=;
        b=GUWumO4kXppVHaDC8azvHF+cMJAQPfBODjP0X1ytNMFvROozWYwAVTIoP0mmeJ5MKa
         y2Rca8FF7ptuzQSPXWrzwKdsWqhr2MtKE1XU65yGAFsaNUAyLhWlDjDy4qTxonwQUBDW
         xZeIlcyYLZ9rpagbnttEtScDn3wCUB+aOwq/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738681312; x=1739286112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4PSD3oLODlnXqoWTIL47JnYdn8a6cMsKT6T4yi/eD8=;
        b=Lbkq+eS/FT0C9iiS5WLYPvRAlIN3qqRFN4oNYpc+NR1MSykHVOP2qO4S2wDivQMqcm
         59gIs4Gk7mHhIqd1+25sjPe2nTNw7hFTZDjru0C4TbzZXOK1lld082zcLMK9G5DVjCG0
         vwnIbeIwrPiQ1OQ3PAk7BK7YFKlzYmPES1+VjDpZeQT+LfwN1yne+9EkV42Hoqy5D/Cd
         MCdDDdUycPHhNYljBC+g95bBHIxZ5O68rGuprWjekjmCpyFySEbyaJLcOBEa7B/z5DrJ
         /W2iFEfNQUSahZRDXp5lz7Kln7aEYkztcAlgsQLdqZ9e0CUDyI70LBqWgodld2PNUrHZ
         sXEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyYgSfpluwCA5P7Xvwo6ZZTCaHlzk8oRGDfgkbeJxAUrQgARX5y8MgzrWqHEs3W+5T2EZ1RMuG6abFT6ODfXU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzreV4NC55eLWcRtx1jm2cY99GU8vH9oHBxhmZs2aqGWYvh3Tow
	wxQZupDKnzcf8+tESo16hLOOiQ0UzWCDuxT+Hqs0oQAbsNUswQUN72wnqCRhGcvAfU7Re926vIO
	pyNnxQTaeDDjyrs0VR6hvWnvykEj5Y7x1zw0=
X-Gm-Gg: ASbGncsRQ4i6jJBGi81Di43p8KJGnhr6a7sin8mYtZMHELgAy4rqEtqYCFq5Fj6k2DN
	USem5IFEavxiXuebDy45E0tKQfFNXiQ4+2QcaQfpI4wvV1r5Oo6HM6c+dwljLVbyaoywXJm8vCO
	0JmEYOl7ARPpmFv3fSD8dVgB4f
X-Google-Smtp-Source: AGHT+IHjHBgVQ17FN+3St2143VkyLuEsuWgXLA0ghwY5o7EyMGBIBKalXtR/EPypS1KnRfRq6g1MvmB/0k1Ejg3EoJI=
X-Received: by 2002:a2e:bc17:0:b0:302:27ea:a56e with SMTP id
 38308e7fff4ca-30796973aa6mr97699261fa.32.1738681310515; Tue, 04 Feb 2025
 07:01:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250204024600.4138776-1-jthies@google.com> <20250204024600.4138776-2-jthies@google.com>
 <Z6IlnW5i93mHVcnj@google.com>
In-Reply-To: <Z6IlnW5i93mHVcnj@google.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Tue, 4 Feb 2025 16:01:38 +0100
X-Gm-Features: AWEUYZlP957uKUDHtnLM-aEc_ENDdqux_SaPXJ1ERkqTZ1ILl2J8rboYKtPLWP4
Message-ID: <CALwA+NZQNFUSaf=S2m39B-rfUwP5YCDB9NrKuJGW=7=U9d0ONw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] platform/chrome: add PD_EVENT_INIT bit definition
To: Jameson Thies <jthies@google.com>
Cc: tzungbi@kernel.org, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com, Benson Leung <bleung@google.com>, 
	gregkh@linuxfoundation.org, dmitry.baryshkov@linaro.org, 
	abhishekpandit@chromium.org, akuchynski@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 3:35=E2=80=AFPM Benson Leung <bleung@google.com> wro=
te:
>
> Hi Jameson,
>
> On Tue, Feb 04, 2025 at 02:45:58AM +0000, Jameson Thies wrote:
> > Update cros_ec_commands.h to include a definition for PD_EVENT_INIT.
> > On platforms supporting UCSI, this host event type is sent when the PPM
> > initializes.
> >
> > Signed-off-by: Jameson Thies <jthies@google.com>
>
> Reviewed-by: Benson Leung <bleung@chromium.org>
>

Reviewed-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>

> > ---
> >  include/linux/platform_data/cros_ec_commands.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/l=
inux/platform_data/cros_ec_commands.h
> > index ecf290a0c98f..1f4e4f2b89bb 100644
> > --- a/include/linux/platform_data/cros_ec_commands.h
> > +++ b/include/linux/platform_data/cros_ec_commands.h
> > @@ -5046,6 +5046,7 @@ struct ec_response_pd_status {
> >  #define PD_EVENT_DATA_SWAP         BIT(3)
> >  #define PD_EVENT_TYPEC             BIT(4)
> >  #define PD_EVENT_PPM               BIT(5)
> > +#define PD_EVENT_INIT              BIT(6)
> >
> >  struct ec_response_host_event_status {
> >       uint32_t status; /* PD MCU host event status */
> > --
> > 2.48.1.362.g079036d154-goog
> >
