Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BC53BBA04
	for <chrome-platform@lists.linux.dev>; Mon,  8 Jun 2026 13:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780926976; cv=pass; b=u7oICuNLGBky7lLCK1zLMP3d6qCAh3IcVNi6VRYHBeJ7+A7Fpomc9jm979ZODxq4WlHVfTp5rvl8ZhvT1C36FnNBI/GpLMiUfq/nw6+wdV85MmZeGVDQxFq85NFitKiwbgcdxkPdhqpdGLMZbKFdFkHtwmFDZMNBWSz2Rr5eacU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780926976; c=relaxed/simple;
	bh=Psu3BTu34mXhLlUF0bMn/uz+8aszzVPE28qS4rjW8GM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aV0WM0D4pFJlOUPvuk7/KoXW6kNe4xqY2l1RM9adbVEnM6j20JAnRxtw65OIwo+7uznxn2eBuZ3YFIczrGyf63gQ6cesN5+CXFfARX0iew+2dkDRQsHWVNUgMRAzbtZlqo6x8qIt9hTpIXGANdeVfh+V41Ax5aiO2slnzgLul7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bD6YOXWB; arc=pass smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bD6YOXWB"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-91588056619so292073385a.2
        for <chrome-platform@lists.linux.dev>; Mon, 08 Jun 2026 06:56:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780926974; cv=none;
        d=google.com; s=arc-20240605;
        b=XIsnKyw+c+QZXJauVZdJkpadQKiMhfcFy5/gL4Ft29RYAGavnEK0PjuLrvBhsyr0vn
         OKcV4iYFtVcB+iJ4fb6sApZ13gAHUEHVhGG8uG+GEYaRzy5P5GKrhVITVUF4scwpXDUD
         Ie0mt0Fhbmke1QhVdpgzT0r7UPXjHBuMO/a3S1VV1Bucu+KWA1xcciVMAo3ld5ES0Iw+
         NzQUikhbs3KwH+8w5fs3pJbyD4/5IeJuPPR6hjBww6VlBUaihlw2UzpGXlQ2SD/mySr8
         u7PtBG9CjkTjftxH7/dfvo6JsY4ul1OXCb4PY2UwSBkVDByDwTsh0dcBlDBzdvSQYRyR
         wDkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LlBVz7NlXNVzRVv4kdi2TxkMS9uuD10rB+4xoM+AksE=;
        fh=dRcPE2023iCm6DrIkLrFc2EagVnByIA0WrQ3nVE5MWc=;
        b=ek/BPzsLDV4ux5OGgskSDfwpEVo5zyJ69fGmTCQLB1w/vsAIk7BspjssWpgeHN1HDt
         fEeJsZtIVUirOADviY6A+42QyuLHVMCj+fhqrKWb0EGvYm1ryaPntyRXX5YmhGz4gamC
         gLkWig8aLqiwa6lU6FgGF+cVSRpj2f6rbhPE/hLTlgb9PlKLc7myJ114Z+Z0DhSmHkk6
         Lt8jeMToqiDpndJebUh7RNlQ4pUxaE1QqxSvrBaWu0+i7VT0OAmeaGKs3Qczxv/emb+8
         N+hWs/g08QLspPNMlUKdhQkmMoBrC2IrJ0AS6/c4bgbSupoLILFKskt5Rx5P5CACDHc6
         aBUg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780926974; x=1781531774; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlBVz7NlXNVzRVv4kdi2TxkMS9uuD10rB+4xoM+AksE=;
        b=bD6YOXWBRnSP7LUB6EPx8/16PmHWujjFqryrTLbTbQcFdQ9N0UTtY2aCWWWq6qtpag
         vzvd0bw+tKq/L0GMhCJPQvnFp7jdSCI9acfSAnZ7ZaCo98+VEafQ8rZGF+UbCDaJDcfI
         V6zvewKZR9z5RLPLdP1EA6KiDHScl3/ywX/Eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926974; x=1781531774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LlBVz7NlXNVzRVv4kdi2TxkMS9uuD10rB+4xoM+AksE=;
        b=DvTBH2dpUoIEWe4mxW+V5Wk99b4s0ulkact3F0coQUpGJWxcuBahiidEcMi4nkh+J5
         G3HBfczsyjiXgIepL6Snoa0hMnsBFIY/zR6ciLGXOhYTZ2ZZ7+uQ0J0fCzb+2giqh1NY
         ngfEb2osBM3bUFgWkPTAS7GED2wwbwq9z9IftQrzmZe06A3CX2AJWFP1flVJfpWcjTaJ
         v3brgmFE9AcLmkNxFWAHrToCMkJi8aMj86YPesnaa8+M4qSviyG7Pe8VQka+UHdykuwD
         6SvP08QOX7qcjcG+ibYsE+aDngiJDVRTkpszcNEiTA9hVml7NFd2liZ0vcAY7AaaphxU
         aWLg==
X-Forwarded-Encrypted: i=1; AFNElJ8eeRc8a8McV+8QuWurVK7wQxJyxBvKc5jHlu6z49Ju77zlCRk2RcDGSfOMSQ0N7B0Mlp0tTk/NEIU0Rqs2weU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzjShVrRIYUrHGMGpF/vgCBBrdh2z3Olm4J4f1epXoVr4CBHwyz
	KnYn1kITF3NtqkHC4KjOZX2/c4SUgLeywj3UKep4HnkVkhURfuiUBVIR57egmbTezfRaVl1l0ih
	Jzp1x1B1HYWDCn53i4+2K+H2hTOADutL1R6+bELkM
X-Gm-Gg: Acq92OGeXgqziR/hQgw46PvXDZgfTK7vZWxmjNo/AdRtdAedrOnnlF+9qfGcEKrcLK0
	8AvpClb15kZ/1RClLFdmEx+zAAsCrAUN9qDm8qDYMHvKPFOFBhOuoP35O1sp07oFJ+WNhpEv9Mz
	GCNXLDQe9j0xK0kUKHcmDwYo+Uen0UGXkgODFxQRX0z9aSOnYCsQNbmLngScL4f5zh2YJ/kbBOS
	bjoeWBlG94/wmNR7J57s4YBrTs0yc3fWEXF77WOyAGxz2xH9GLAZGxGzooCATCyWYw3dxYKH59Z
	aeTkfmzyt6Oq8p17rMlorc7vBonQ+gOZj16G4oJsTebilL5B
X-Received: by 2002:a05:620a:4411:b0:915:6437:bbb7 with SMTP id
 af79cd13be357-915a9c57f9amr2544842985a.14.1780926974332; Mon, 08 Jun 2026
 06:56:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522154456.1448170-1-akuchynski@chromium.org> <20260604155747.GD4151951@google.com>
In-Reply-To: <20260604155747.GD4151951@google.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Mon, 8 Jun 2026 15:56:00 +0200
X-Gm-Features: AVVi8CfS6Rcw3mhhh2RkMXt5g-4MVvSbJF3CeawbgXLhhbFxPyI_88lSfxi2zl0
Message-ID: <CAMMMRMdb0aV=JOrHo0GG4B1XtwC_uG0R5K2=HapZJPVorgWqUg@mail.gmail.com>
Subject: Re: [PATCH] mfd: cros_ec: Read EC features during probe to catch
 transfer error
To: Lee Jones <lee@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Gwendal Grignou <gwendal@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 5:57=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Fri, 22 May 2026, Andrei Kuchynski wrote:
>
> > cros_ec_check_features() does not return an error if the underlying
> > EC_CMD_GET_FEATURES command fails. Consequently, when the Fingerprint
> > device fails to respond, the probe function ignores the failure and fal=
ls
> > back to installing it as 'cros_ec' device instead of 'cros_fp'.
> > This leads to a sysfs duplicate filename collision later when the real
> > 'cros_ec' device attempts to register:
> >
> >   cros-ec-spi spi5.0: EC failed to respond in time
> >   cros-ec-dev.19.auto: cannot get EC features: -110
> >   sysfs : cannot create duplicate filename '/class/chromeos/cros_ec'
> >         : sysfs_do_create_link_sd+0x94/0xdc
> >         : ec_device_probe+0x150/0x4f0
> >
> > Fix this by extracting the feature reading logic into a new helper func=
tion
> > cros_ec_read_features() and calling it during ec_device_probe().
> > If the transfer fails, abort the broken device initialization.
>
> You're doing 2 things here.  Move the function first, then add the new
> call into MFD in a subsequent patch.
>

I will split this into 2-patch series for v2:
 - Patch 1 introduces the helper function in platform/chrome.
 - Patch 2 consumes the helper in the MFD driver to resolve the bug.

> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  drivers/mfd/cros_ec_dev.c                   |  4 +++
> >  drivers/platform/chrome/cros_ec_proto.c     | 30 +++++++++++++++------
> >  include/linux/platform_data/cros_ec_proto.h |  2 ++
> >  3 files changed, 28 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> > index 39430dd44e30c..7810b1c871849 100644
> > --- a/drivers/mfd/cros_ec_dev.c
> > +++ b/drivers/mfd/cros_ec_dev.c
> > @@ -203,6 +203,10 @@ static int ec_device_probe(struct platform_device =
*pdev)
> >       ec->features.flags[1] =3D -1U; /* Not cached yet */
> >       device_initialize(&ec->class_dev);
> >
> > +     retval =3D cros_ec_read_features(ec);
> > +     if (retval < 0)
> > +             return retval;
>
> You just leaked ec->class_dev.
>
>         goto failed;  ?
>

You are completely right.
I will also change the initialization sequence so that the `class_dev`
fields (class, parent, and release callback) are fully assigned before
this to prevent the warning:

  Device '(null)' does not have a release() function, it is broken and
      must be fixed. See Documentation/core-api/kobject.rst.
  WARNING: CPU: 6 PID: 132 at drivers/base/core.c:2569
      device_release+0x9c/0xb0

Thanks,
Andrei
