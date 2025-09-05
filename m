Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192DC34A31B
	for <chrome-platform@lists.linux.dev>; Fri,  5 Sep 2025 11:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757073447; cv=none; b=SCqTEqmQKeYxKGosL2GSIJiFxcCIOGVDwg/8aGR2wmbXSUz3HX/OGe/9fh4Dn4l1xYDWj2sJUrjFwWhvPr6jfUC4iaLgaMyBVTJYjA+e4jsEK1vJ6s8cdTkIJxh3yyCEUBHk3OnlWXR99Ysy+Ww0a5qm1YkcGhBj/3QkSh0M2Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757073447; c=relaxed/simple;
	bh=BluZ0n/EBlrhIwiF/nNBirH31HIee/3BeX4W5N3bLk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LSsSF83DWtGZFILzvyKY3R5yLVHJ0Ttm0gEh9RvaT82MGmAs70SRw7YRoh/k+AL/iUD2cicfYNgEuQmhXZV8WAfCHgWcfK+nZlIYqlKNqycfYQqg2GadZ2/KXVOtCZfna9r3tlYg6Buqt1mHYWthfLtoJIUrN/7ms8kuhWJTVpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HEOI6IPm; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HEOI6IPm"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b4dc35711d9so1373481a12.0
        for <chrome-platform@lists.linux.dev>; Fri, 05 Sep 2025 04:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757073445; x=1757678245; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwRu3z/1tyWo2AWlw49rwHDq7UFt7Y05nNStcD8eOx0=;
        b=HEOI6IPm3bqLPlxdbj8yivIALXS8np7g9tPLztufoEWqbbWPQQmCx3QTKzsd+5rIGk
         mJL1WHznu0oBBgfrQwwk/AOpo7uW+qmMu5EX5xTsLDb0jOk6c/qm9mpdN1tI0Ited59K
         PuVggOUV+n6d8KmllaOtEFi04Ycs/lip/4boM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757073445; x=1757678245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwRu3z/1tyWo2AWlw49rwHDq7UFt7Y05nNStcD8eOx0=;
        b=e2lyYyceVlYSyoNmu5ngLcgLb6joZ9fJbcVIqchHOwh6U0+jVGYSn+4qfTcFpJMDhd
         zUaRfMPhoyQYOADkDacgoeeSy5keT1B3EkG/mYnPPRPFVDl9EgVBME2RturpWzFnEqoU
         mZgXoFn+NPvPmsBlp+cl7ejdmgnTenkJsYAEernYeCRBmqXzlEHYenVGtZMy2bxsYhhs
         xDzaDSJet28i/QuczsgUAO3/c6s9TvJV62WDKJ8o5+5sgBeDWVFiZnG5bEJuieKRWIDP
         DbAFGZzzWhOzjNFdWatWzzyb/sQkBUdoivJnlHP09Mp3URAgruL+r/PRw/fbIxHgJvAo
         Ok9A==
X-Forwarded-Encrypted: i=1; AJvYcCXOUvMbjdTaTI4XkA5L/H6dcBPY5ymdKbrMQvocF+jVPyroPfRV3Lph206LMb+U2G3lvfr0gRGfdEBOKxH5F0E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9sSOB982/N30UxRDeVDvdl78BwLM8JErPKydmzZUJ8QrUXT3c
	4M0PJPvLsgsf9whkmo5VYgOqVuwR9re+sulkT44E9GA10toyJhXU7LZpVzo1UzqcVFNXP7YzpkX
	2ZjPf8DkDCtRXdAXAiPUvv2WBjuhUgUM8IwTxAqHw
X-Gm-Gg: ASbGncvjLpGq/1iMkoq7myRVtGm48Kcg1xbwlIiZ79HBy5Hm1dg3nOoiNRX9jSE9uMk
	6zFM+xdokl1/1KZKSAUzip/ddy45Onk76ggPLNj84vGqykL4LFAXwmKrCTeru3oAM6hw9C4H4qL
	7eXNvQM1XGzNaFWdChO2EtDAApVlq7+0ilcMQAuOhHeTpKiqjSED4FOs9g7QbwEY74xiGtiTlM9
	2ROj254LgnfD+cWEdM3szsD7CwMKwwE+g==
X-Google-Smtp-Source: AGHT+IFSzOFurkAZqFfxwqHBU2GIUt8H3fpkz2wPZsZF2x3IJHiAn287LcomXMAQvQuyZgs8kf5c0zVpFXrvE8TpcWE=
X-Received: by 2002:a17:90b:33cc:b0:32b:958a:51da with SMTP id
 98e67ed59e1d1-32b958a55bfmr8103099a91.16.1757073445301; Fri, 05 Sep 2025
 04:57:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250825145750.58820-1-akuchynski@chromium.org>
 <20250825145750.58820-4-akuchynski@chromium.org> <aLq0a4fPzeWKzaxk@kuha.fi.intel.com>
In-Reply-To: <aLq0a4fPzeWKzaxk@kuha.fi.intel.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Fri, 5 Sep 2025 13:57:13 +0200
X-Gm-Features: Ac12FXyOmhtycsbCUf38YB5fZkBYaTh89EyZOhotIirneDMW79KBs6Uep0MbAXY
Message-ID: <CAMMMRMdU91u1dqhXyRPMrB2ybxMMUMgQNfpWZWMBqOTCJ+Cwmw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] usb: typec: ucsi: Set alt_mode_override flag
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 11:59=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Mon, Aug 25, 2025 at 02:57:48PM +0000, Andrei Kuchynski wrote:
> > This flag indicates that the PPM allows the OPM to change the currently
> > negotiated alternate mode using the SET_NEW_CAM command.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  drivers/usb/typec/ucsi/ucsi.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucs=
i.c
> > index 0d6b0cf5a7cd..85a6b7fc6d93 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -1632,6 +1632,8 @@ static int ucsi_register_port(struct ucsi *ucsi, =
struct ucsi_connector *con)
> >
> >       cap->driver_data =3D con;
> >       cap->ops =3D &ucsi_ops;
> > +     cap->no_mode_control =3D
> > +             !(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE);
>
> Fits to one.
>
> thanks,
>
> --
> heikki

I miscalculated it. One line

Thanks,
Andrei
