Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F742580D7
	for <chrome-platform@lists.linux.dev>; Thu, 14 Aug 2025 08:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755160141; cv=none; b=AACnx4eoRdWI0aTuOu+Y6PIWCfwnxdX/IFXIiGn4Ej5HICBUyCtSoqLM1zmq8KFKUHStmE+tNgLS85YrKgU1zgvTmpkYbz+d0BHkKfl/yiPongVbXMr2aQkYVSvRe2Gx8rh+x+ZjxMx/oS1Lhcizch0HuEkwfszc3JakczY/ucw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755160141; c=relaxed/simple;
	bh=DXoZWllPvSAlTn6cKguWUx5XsVI696Dlfnu+ADK3Vug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=as67Eta+32ILf1QsB0ZYET/uXWVGJZ4WtfDVx8UlRO8Y4eqGsmSRfzF+maITwr9EeQ+/KKmLZVCplNHIdYfsINorl4/SPc8dmhOSv0ILNwBQ3W5I3uHfS0lTYd0TbjhgzRfRWLiI7kstCAnuL6lEMRXtv4J3xOTqsUEysZBDTQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LxVpbjXs; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LxVpbjXs"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-435de72c2cfso496652b6e.1
        for <chrome-platform@lists.linux.dev>; Thu, 14 Aug 2025 01:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755160138; x=1755764938; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXoZWllPvSAlTn6cKguWUx5XsVI696Dlfnu+ADK3Vug=;
        b=LxVpbjXswdXOrk2PblO//N6KxYnvsNcIp1kR3Ibpet2tM12IwlTZAnn3r+Tz6ObNle
         AOnt167ARtR33c9/QxF+Z+HOzhryAmIThTZhrC3ie2GVJWDU958Zby9ESK5cH1nrxZnc
         1Zov70wZIUXtVVA9SWfHoj+16IKMI8MD4MGC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755160138; x=1755764938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXoZWllPvSAlTn6cKguWUx5XsVI696Dlfnu+ADK3Vug=;
        b=LZAKiWbe1neLm6ZeAzXMs/vpKEU/9ETM0D1kATVShO9cFfOIb3/ef04mqUhuPuINqz
         vAxtxUp2fofE0+6e+cxsNf6d183L4k8syOL9Ux9XH0/ClziXRYcxi5m/TEobHXr20gAJ
         sCd0dMehVYlAkzMfHPB+z/NVDaj3+TjwlZK7p7Rph5wNDozoABvClLpNL2I+PvyBy8Ka
         GpbWGpIiQfW7ACZeHzqLjtiTZV+y1Fwu+u0U3NuM5Jc1AIWy2e6Vgl0N9ZuhgIvrmENE
         wDubUPEgBQ+yLw4v4MzGDWP7lTV8dCWm2absQcdEYTGe5yY0yDI19ApQuH24t9viaqcw
         jSZA==
X-Forwarded-Encrypted: i=1; AJvYcCVOG21kkbDo5Yh7ZvihEj3uFKORF+iD9TEreCYQ/CNAROInZhZpPOqnGUSKeUez+crkbvFilgAeE3RhyB5mtZg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+KK++aQBSGUaQXRzaxgN5cr4Rz3FO0cOkty0y4bn56a5c8eIw
	53ZNPn+1uqALjZQ0JVTAMZ29VYJlvkAjH4YlFprAso74VVPeB5wANG8k4vAymstBzViRRErIkrC
	YY7U3pYZldk5bF0YTOh3DoZVwqOkq474gnZleKFDBFJobOji5MEHbwA==
X-Gm-Gg: ASbGnctaXE9fLAPL94wkafP4lChaFazp9juU3ieauvPRlbEWX/ahLz2hVaVmxgUqLnr
	2LyuQ3R5kRrfbmRxsZm9M4p2A7wtYvuvG9KeGfV7gBuI/DArLanjCbIiYVQQKXMZ/MfOMMsHwpN
	og7m914fOnK1HUmSJjBICzQqyRnS9APE2qQqx4L9r3ViXbzZJa7eB/LwOyylmk5olcGsVCnnf4P
	XCrAG4M5xJbuY5gFwTLM3SrEkvaCQWi1g==
X-Google-Smtp-Source: AGHT+IFzeNU7id7rlH8AtFJTm1cePeOA784ZDto12yMUCjCqT2q+uwgR13V7z+m3dpw+DNaYtWcHDCtnfdbNOZZRXJk=
X-Received: by 2002:a17:90b:35d0:b0:321:27d5:eaf1 with SMTP id
 98e67ed59e1d1-32327b48f77mr3326450a91.25.1755159739419; Thu, 14 Aug 2025
 01:22:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250804090340.3062182-1-akuchynski@chromium.org>
 <20250804090340.3062182-5-akuchynski@chromium.org> <aJn9ZSy3w4zW4Xvq@kuha.fi.intel.com>
 <CANFp7mVUFZyF8z0dN-Mo7ntPOXh06ZD0RH5GyvJJymOXrhSD1g@mail.gmail.com>
 <aJsoS3EXgoLP-f-E@kuha.fi.intel.com> <CANFp7mW92PgjSWyJq7Bz6ZLJ8ZgnsCRw2kAYAjKX3yymKW9hBA@mail.gmail.com>
In-Reply-To: <CANFp7mW92PgjSWyJq7Bz6ZLJ8ZgnsCRw2kAYAjKX3yymKW9hBA@mail.gmail.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Thu, 14 Aug 2025 10:22:07 +0200
X-Gm-Features: Ac12FXz1UN0w6EPEh01uDLgnpov_q6H22DAPFIMRA5Ihvr9O148EKDmKL8f4WE8
Message-ID: <CAMMMRMfo4n_xZPZG++OXoXJTeHuzzSBL0Bossn7+DMZMoRbqjQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] usb: typec: Expose mode priorities via sysfs
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Benson Leung <bleung@chromium.org>, Jameson Thies <jthies@google.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 10:34=E2=80=AFPM Abhishek Pandit-Subedi
<abhishekpandit@chromium.org> wrote:
>
>
> We interpreted this a bit differently (as just rename it):
> https://patchwork.kernel.org/project/linux-usb/patch/20250616133147.18359=
39-5-akuchynski@chromium.org/#26431992
>
> Thanks for the clarification here. In that case, we'll get rid of
> `usb_priorities` and `usb_results` and just add a new alternate mode
> for USB4. The vendor ids list on usb.org
> (https://www.usb.org/sites/default/files/vendor_ids072325_1.pdf) shows
> 0xff00 for USB4 so that's what we'll use. So the attributes should be:
> .active (similar to other modes), .mode =3D 1 (unused really), .svid =3D
> 0xff00, .vdo =3D <usb eudo> (if supported).
>
> >
> > > As such, our current API recommendation looks like the following:
> > >
> > > * On each port, we lay out priorities for all supported alternate mod=
es + USB4.
> >
> > This first part I understand.
> >
> > > * We expose a file to trigger the mode selection task. Reading from i=
t
> > > gives you the current status of mode selection (single value).
> > > * Detailed results from mode entry are pushed to the mode sysfs group
> > > (via entry_results). Converting these to UEVENT is fine but a more
> > > persistent value in debugfs would be useful for debugging.
> >
> > This second part I would really like to handle separately, after we
> > have a solution for the first part.
>
> Ack. We'll reduce the series so it's easier to review for mode_priorities=
 first.
>

Hi Heikki, Abhishek,

Thank you for your review. I have addressed the feedback and plan to
resubmit the series.

Here are the changes I will make:
- The `typec_mode_selection_init` function and the `name` member
from the mode_selection_state struct will be removed.
- Patch 4 will be split into API and ABI parts.
- The entire series will be divided into `mode priority` (patches 1-4)
and then `mode selection`.
- The mode selection logic will be standardized to function
identically for all modes, including USB4.

Thanks again for your guidance.

Andrei
