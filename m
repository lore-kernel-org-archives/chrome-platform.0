Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A95128853A
	for <chrome-platform@lists.linux.dev>; Tue,  9 Sep 2025 09:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409791; cv=none; b=lk+vN++HrrHUKDCch0sR1Trvic8TGhVS8JU+dbUMM1Fe6dJTdf9kRHO9mKGhpV3NtZ+74oVyn9O1eNAi3t+qGjXjmuEDlNwSTlJbHw6PDd7Nj//3/i7pFa7/TQW4ITvuhdtag4DSKNn2+u6Nc4mq2WhhLLneb4OCfm+2/o8edXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409791; c=relaxed/simple;
	bh=IhwGmnTPROJ8UMJ/ZIJKXloDry6OSxr5zsCSo3X2V4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TUZ4FTqdVluFSR3rCZ+2iqTmLz7C8wI+78DXHMDLxxO7uk62iwfbGHsgEblHhRQvXLde1UX3atD7Pbd3cZbsRpFzOymeV0s10bN8toRYJmCFWWRkSJK435Lxg1XLZyrsOAQzh5Szqn5bEjMA/9JWexR89gXSpqFXDXkAKo44IYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Mj4oK7eh; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Mj4oK7eh"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-327ae052173so3518027a91.0
        for <chrome-platform@lists.linux.dev>; Tue, 09 Sep 2025 02:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757409790; x=1758014590; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0w3Ph4E5BTw4rV1tmXtmqkj8lq5Hk2RR7067ccGSdZI=;
        b=Mj4oK7ehS98KmupNKzeHd3fZ4XgWyZ2C650zuE3DswI0d9q5wD7/rA1XvMhOOOcBgv
         JiwojZJH+6YLtMn29TTzNZp/bvDIn+G46FcpB77NnAGmL5loDrWI9sln1AzoE0WXgijD
         xftxd6JmkO+MwShkVn1gG5H2EBBTJ9D9KzwCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409790; x=1758014590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0w3Ph4E5BTw4rV1tmXtmqkj8lq5Hk2RR7067ccGSdZI=;
        b=NpL7OBIx1udmDXZwLA7e6WUi4a8d83TB6TR41Ar3kxKdawx3tHbbg5hqQYhHIQxWCH
         1XJGbWmVqrNST4XS2TinzMzjQSN8YgWdqwDe7p4XzUBiBNdl9CYTEtB2RkTj2mi9MeHN
         NP4lqXdqUaxgKtLLewtVaTfBy8zDPXfSmLUYpfd0sge+jVWz4JB6DIFfMtbUf1qwg9B9
         aCq8pgv8AbkNsUW7kzZpQRf5kN8R6s1bQYDcQA7Ax2XrQ1UBuTGPxkWlIA5s9hBqiSyh
         YUAGhOPIh2UzBljH8kNBfuld/z2E4yjYSkgXur+omtHSVFz9qpLpc3SV6nmhqaM5LkbO
         HgrA==
X-Forwarded-Encrypted: i=1; AJvYcCUX02RHXiFNUgU5P/HgpUjxUwumq4BQSstRq+aISxS4Tw+NuQmhBqOc3z61h05AlI9wOXyYKRYFkb4a/At3PZA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzliUEVV4OWdWFsm7BzfVWe3vz/NLi2buikB+943ZQX7ZrW6q0V
	nJ/6wK/sFwmsadZ6DqlDdZgLwfVTCisY1RtZ9YK1/MggMg8AwUaA9N1Xwat8kMh37Y570+CHQ+T
	hV+wRfjVkb1/WQQlki+q3Z8pViW01osMhyprdfonQ
X-Gm-Gg: ASbGncvxdAPm4Ut79+n2IZphnEXfzCTpqIW1BDEXvf2UaECegRdTSz8oblLASf1JSBm
	14qGPWQiY1KiILi0qMS4ZD7uaeTfsLfDOuJip3bB8Izr+l02AvyI8yV5juGAJUXCgsIRoruSDKx
	Tsk+qEuyLFs9WTfQZkpWi7bB8GiH5A6fYbzd8JRQICkvXoNvJ3HqlwXOqLdpGBGGAA+roBxY80f
	ZShJngt0Fwrk4K0meV2DlH+7dVzZEYX/jVwWd3OLkYj
X-Google-Smtp-Source: AGHT+IFW+hLO5Yu6lqanuOKaST+yfom90ApVBsBONoL1QtFCXG1kgy1XSNSymbhKgjXDmLZVRuj1xAmF3kl3ji8pOsQ=
X-Received: by 2002:a17:90b:3952:b0:32b:b514:3935 with SMTP id
 98e67ed59e1d1-32d43f006f7mr15206818a91.16.1757409789756; Tue, 09 Sep 2025
 02:23:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250905142206.4105351-1-akuchynski@chromium.org>
 <20250905142206.4105351-4-akuchynski@chromium.org> <aL_uZxBkBfC9Etrk@kuha.fi.intel.com>
In-Reply-To: <aL_uZxBkBfC9Etrk@kuha.fi.intel.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Tue, 9 Sep 2025 11:22:57 +0200
X-Gm-Features: Ac12FXw4Dq1SaeVI2SOpFgqyAjRayu5Yet0cmirzQc2om1uhPkt-AFM8Ejmd-cE
Message-ID: <CAMMMRMf_zDx43-Orf1zE31hE+QmPgkDMz2UTrYjyS=pjHUZvYA@mail.gmail.com>
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

On Tue, Sep 9, 2025 at 11:08=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Fri, Sep 05, 2025 at 02:22:04PM +0000, Andrei Kuchynski wrote:
> > This flag indicates that the PPM allows the OPM to change the currently
> > negotiated alternate mode using the SET_NEW_CAM command.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  drivers/usb/typec/ucsi/ucsi.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucs=
i.c
> > index 0d6b0cf5a7cd..9f754344a841 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -1632,6 +1632,7 @@ static int ucsi_register_port(struct ucsi *ucsi, =
struct ucsi_connector *con)
> >
> >       cap->driver_data =3D con;
> >       cap->ops =3D &ucsi_ops;
> > +     cap->no_mode_control =3D !(con->ucsi->cap.features & UCSI_CAP_ALT=
_MODE_OVERRIDE);
>
> The flag is now used to expose the priority file, but you can't affect
> the order in which the UCSI attempts to enter the modes, or can you?
>
> thanks,
>
> --
> heikki

Hello Heikki,
Thank you for your review!

You are right, this patch does not affect the order in which UCSI
attempts to enter modes. Currently, UCSI implementation only has
DisplayPort alternate mode support. We are preparing to submit patches
for Thunderbolt.

Thanks,
Andrei
