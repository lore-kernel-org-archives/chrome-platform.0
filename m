Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8D513D8AC
	for <chrome-platform@lists.linux.dev>; Thu, 31 Oct 2024 22:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730414944; cv=none; b=R4LgkL2hc88qdiXCiyuacp+xF0O1oPqKA717+ft98ARzoZmwSKcbqPu9vzEw1cbqt+wUdv8xpW35uWtlghdQHKyb5/9z8xx4cUScCYt8hecg5nxYsFaJN+PZKJ1H/R8IPFX2yYylawBVWHDTOGMXteGJfYRAkr7SsZDwIV3mmV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730414944; c=relaxed/simple;
	bh=YMlzBx+z9aaRa2t9CsTC7J8zOTayJPPNSKPZfiTQhdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mho5/oRmb9mmTUCGJPBnigUmRtjQUEhuF5T4wczX6o2/4vBJpwW1LJumb9n9fHebdZc05cjTCywrwx6SHIGouUMnTm8tYRHMupPFUtdGdv/SNnvIp4GAg2OmAtNzbgJdRUajGc+SnS49OVvDzbhYhZjjit+pELDAIe4gpULt9hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bZnzE0IY; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bZnzE0IY"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e291f1d659aso1306578276.3
        for <chrome-platform@lists.linux.dev>; Thu, 31 Oct 2024 15:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730414937; x=1731019737; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6qFeMz2fz5TUQHmgzOfA0YHFIKSZWtlwhdHVsEY4Ls=;
        b=bZnzE0IYnzq1kFKY/dgH7vaFqrMEQT9FTMDjxQnpocz0fdw22nBNMyiYatustSW1v1
         A4CIB3PogjgkMQe3zGI1zn2snGaYlHt6JJh3SsiCIfXkTXNJjAelwCNNx7qdDBQk28Ou
         uMwvKkEmyeU9HdsAPvXnM3dSijirB+y3MzQB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730414937; x=1731019737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6qFeMz2fz5TUQHmgzOfA0YHFIKSZWtlwhdHVsEY4Ls=;
        b=RMvRVi0bje6CRMMAOkB5ozj2LUV2jjKKb77UVtmHQp20+I+ZgjMrtLPtQzHXZsquNR
         0Yef79h0vZGMiE0oYueqwlW7YBFttj727aOwZT6FgXfAXixrPDJSgsh9mSj88DPN1/MX
         +JSh7d6iP4JP8GkHdjIskrG9QPh7qZ3bluCa6KRJo6DPMkYnxFGYXuxDjsoB4qzTAsPt
         0uaRGpG055d0ukWwn1fudh7v8kUMHpAu18V5OBs+EM0DFqJF/qnlN9VUFlc/6V+6lI0q
         npg/2pwZA7DxxhGzQ0rgmW2+Fnxqum+Ja17JcUOkC9UrLBF/bC3qCVBm4hFv6tuhpt2C
         IIxw==
X-Forwarded-Encrypted: i=1; AJvYcCWBKxAyybcrantBeR92SYeK8jH+GgxyYO158PwV9e7waVMOyvRLhNeGQDx98XLKZH9wBYlsTe64zZXbyWAQLt4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGLz5vH6EG+yIagysRUOUU519DPd8Vft7BEl5+04qOSo4gp/bu
	u56RGAFr/or16gvVl97PFNCInfQVJ1WG9q89jYe2cDT1AKN3KfYwDNhhqbp7S5JLToLw5mLlA/f
	izHSqfFWjBDwymE086RYNY5twjyazpWEqlXkk
X-Google-Smtp-Source: AGHT+IEeT+MuyLEbw9zpD7r5OibCxa+4DfQKki/EuwTyOa3LAohYFUTmEiVK47uXYyOB48zQ65odB1tWbGP1fgXoPyY=
X-Received: by 2002:a05:690c:883:b0:6e5:e714:3bdf with SMTP id
 00721157ae682-6ea64a9f501mr20113947b3.5.1730414937682; Thu, 31 Oct 2024
 15:48:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241030212854.998318-1-abhishekpandit@chromium.org>
 <20241030142833.v2.3.I439cffc7bf76d94f5850eb85980f1197c4f9154c@changeid> <ZyOVIKGlrlj7kc9-@kuha.fi.intel.com>
In-Reply-To: <ZyOVIKGlrlj7kc9-@kuha.fi.intel.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Thu, 31 Oct 2024 15:48:45 -0700
Message-ID: <CANFp7mX-DkyFqwoaq_4V1XEDBqK7bj6-nz2aJi7idM=Q2TT49w@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] usb: typec: Auto enter control for alternate modes
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: tzungbi@kernel.org, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, dmitry.baryshkov@linaro.org, 
	jthies@google.com, akuchynski@google.com, pmalani@chromium.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 7:33=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Wed, Oct 30, 2024 at 02:28:34PM -0700, Abhishek Pandit-Subedi wrote:
> > Add controls for whether an alternate mode is automatically entered whe=
n
> > a partner connects. The auto_enter control is only available on ports
> > and applies immediately after a partner connects. The default behavior
> > is to enable auto enter and drivers must explicitly disable it.
> >
> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > ---
> >
> > (no changes since v1)
> >
> >  Documentation/ABI/testing/sysfs-bus-typec |  9 +++++++
> >  drivers/usb/typec/altmodes/displayport.c  |  6 +++--
> >  drivers/usb/typec/altmodes/thunderbolt.c  |  3 ++-
> >  drivers/usb/typec/class.c                 | 31 +++++++++++++++++++++++
> >  include/linux/usb/typec.h                 |  2 ++
> >  include/linux/usb/typec_altmode.h         |  2 ++
> >  6 files changed, 50 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/ABI/testing/sysfs-bus-typec b/Documentation/=
ABI/testing/sysfs-bus-typec
> > index 205d9c91e2e1..f09d05727b82 100644
> > --- a/Documentation/ABI/testing/sysfs-bus-typec
> > +++ b/Documentation/ABI/testing/sysfs-bus-typec
> > @@ -12,6 +12,15 @@ Description:
> >
> >               Valid values are boolean.
> >
> > +What:                /sys/bus/typec/devices/.../auto_enter
> > +Date:                September 2024
> > +Contact:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > +Description:
> > +             Controls whether a mode will be automatically entered whe=
n a partner is
> > +             connected.
> > +
> > +             This field is only valid and displayed on a port. Valid v=
alues are boolean.
>
> So, why can't this be controlled with the "active" property of the
> port altmode instead? That's why it's there.
>
> Sorry if I missed something in v1 related to this question.

There was a bit of discussion around this in another patch in v1:
https://patchwork.kernel.org/project/chrome-platform/patch/20240925092505.8=
.Ic14738918e3d026fa2d85e95fb68f8e07a0828d0@changeid/
And this patch is probably a good place to continue that discussion.

With the way altmodes drivers currently work, they will auto-enter
when probed. So if you have a partner that supports both displayport
and thunderbolt, they will both attempt to auto-enter on probe. I
think I could use the `active` field instead so that the port altmode
blocks entry until userspace enables it -- this would avoid the need
to add one more sysfs ABI. I'll actually go ahead and do this for the
next patch series I send up.

However, the underlying problem I'm trying to solve still exists: how
do you choose a specific altmode to enter if there are multiple to
choose from? I tried to implement a method that first tries USB4 and
then Thunderbolt and then DP but I realized that the altmode drivers
don't necessarily bind immediately after a partner altmode is
registered so I can't just call `activate` (since no ops are attached
to the partner altmode yet). Do you have any thoughts about how to
handle multiple modes as well as how to handle fallback mode entry
(i.e. thunderbolt fails so you try DPAM next)?

>
> thanks,
>
> --
> heikki
