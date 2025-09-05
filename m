Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0413634AB0F
	for <chrome-platform@lists.linux.dev>; Fri,  5 Sep 2025 12:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757074975; cv=none; b=USGimlTl84Z/i3NGWB9RTkhm9nxnqEOX78G0WKNlwacHLjTEUcsZwb1aM3r1oCu7reGL6JXkYOt/3hbYJfIFxzLCwuTFH4JEU+TBlGaEIz2JelE9dCRFOQ8QTXkg9oR4U9/lnXEzX6qbkxAlp4rJgl97GfBwGE+pAxgV/1n1Ws8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757074975; c=relaxed/simple;
	bh=f88gDGGRbMwX7i/jLItg/xSlOYP4VRiz0z3DVlv7lp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DTLNxVT4XtSJGiO+F+GmYoOhbD2eLlxd2GnZakejw5DTb8rw1rCgGdD7CEo+EmzOC+EQoWC3RbwRVt++EtobGdX+j454kUm+P3Cn3h6261EbljCd5LiMO5l4+5ZsmKaS4wPOD8aBunRs5/Rx38BIunFoYCNav8GD1RAGV4HxNdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=O9qNfaTg; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O9qNfaTg"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-32bae4bcd63so817378a91.2
        for <chrome-platform@lists.linux.dev>; Fri, 05 Sep 2025 05:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757074973; x=1757679773; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6lxWl4V7y/wDq+LroI79aYAazd8UwfuBLrDZ9Wkh6o=;
        b=O9qNfaTgjmw/c3lJlCxt+c0WZ20lbYByEGdEajAAg1C9tFGvjdneVYX/yxXnS3SBpp
         foPh4vqR1ZK+KkRZwdSq9mYZj8flEj5JNG+/6iDlUsySjKG7vRNHlIdvDPGnpxUpmNIj
         zS/arfQXoZwY0SW437ZZcm93iWNbbXflHdgqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757074973; x=1757679773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6lxWl4V7y/wDq+LroI79aYAazd8UwfuBLrDZ9Wkh6o=;
        b=TSRJST0Eoa0r/7fDPuAEWP8cyJewT/deZOow6o+e1hanLIn13y6DeCkXvALo9YL2HQ
         0bljqU4T2EGHF0PSgjRoef1Wgth70WOdMz/AlTg/qTaKUXx0gctYDRN3bQmaDKmYoHww
         i8NAYlKorZLgwYMagErZaq+wXaGCnwdBWLBRcmi7grZMELdNPXT79i/bVUGeNsltsk0w
         aki7NyL8K0cvYMf7S029drtp4MI+tx1+tPQBEiKKz2pd2fOYzQhKrc1/1xmmuCdBONNw
         5jWNd5bl+lS4JH520AGVgLummNLUo5CtOnYMjTAfmbAtFReuFI9R5jBrZWJ5Kdgc9vvb
         CzwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/WOf6n7/KgXtVqDkcYGpZ+4t5eP1lw+9oLkIF6s+n39OMjVjzASsGeUbEwrnLq/1fRFdD+5sTfqyjNLMyjSI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFDJCwDnqSNfhOiqHuwow10A+NnumiyEg2VHihiIfk1r6Be1PR
	UTh/HXXuF4UCtM/PVOM23M/ElDYdnmcdNePUjzyvuSR6OrqDbMdGJgz5IQnMP5+BYH3BoqL6lYH
	ND2i7zlYr29MRcRC5qPcl5s30gAL+0PFUZlHbLOY0
X-Gm-Gg: ASbGncsMpG9bNfbF/96sSIiJ1jvg3TRQI146eMMbEdrxAfK2CdKgVoUaEjtBphRmSy4
	3cCiD4n5lzplqVD9zTm2FaLx6h8JnllMnOwQX8dJQOMkw1/FGMfGDJq0H/0kwzU2co4AXQN7EDO
	IlzicYua1JNSPEwb+tOZvwDJfdokquSoc/ovrojzdvfN/sUUhcyGDW6EGgo1h8oWKuBe4S3Xfm6
	LXp8ODdWIk+FnT4dUykS1fasMn2sbaqmWx6VPMu8oP6
X-Google-Smtp-Source: AGHT+IGUt0+NPYxAOfpcTKsdIZgMD/2aTOnjQauBXAsedoGoDooyWb+qeKpbfOZSEHR/boIOsnXxSpzklV+PIcXMqPQ=
X-Received: by 2002:a17:90b:3f8f:b0:32b:be39:7804 with SMTP id
 98e67ed59e1d1-32bbe3978aemr3553401a91.8.1757074973067; Fri, 05 Sep 2025
 05:22:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250825145750.58820-1-akuchynski@chromium.org>
 <20250825145750.58820-6-akuchynski@chromium.org> <aLq8tUogl67VptRC@kuha.fi.intel.com>
In-Reply-To: <aLq8tUogl67VptRC@kuha.fi.intel.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Fri, 5 Sep 2025 14:22:39 +0200
X-Gm-Features: Ac12FXyeappBWW9ObA85nA1cNYhj4olXtKb4gTth6JkKRBs9zpklMmd4xbjPsrc
Message-ID: <CAMMMRMf1g+EwYfRmygCYiJGJd_XEeHrt-jrQaqKk1_SPyoRhXg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] usb: typec: Expose alternate mode priority via sysfs
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 12:34=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Mon, Aug 25, 2025 at 02:57:50PM +0000, Andrei Kuchynski wrote:
> > This patch introduces a priority sysfs attribute to the USB Type-C
> > alternate mode port interface. This new attribute allows user-space to
> > configure the numeric priority of alternate modes managing their prefer=
red
> > order of operation.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  Documentation/ABI/testing/sysfs-class-typec | 11 +++++++
> >  drivers/usb/typec/class.c                   | 32 ++++++++++++++++++++-
>
> Maybe patch 4/5 could be squashed into this patch, and I'm wondering
> would it make sense to just keep the typec_mode_set_priority() in this
> file (drivers/usb/typec/class.c).
>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>
> --
> heikki

You're right, mode_selection.c is quite empty now. However, in the next
series, it will be the only user of the priority variable. So I'd prefer to
keep it there, if you don=E2=80=99t mind.
I think putting it in class.c would create a mess.

Thank you for the review!

Andrei
