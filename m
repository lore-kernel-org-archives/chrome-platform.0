Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C07C1F7552
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jan 2025 17:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736272699; cv=none; b=KnHBaomCnianktWoypU4M6IfLPsX+Tc0DH4vwJFa/5wHOtRq2/iSl5cyr8RfC194hiDdHPYKWeydJL/G+NmFysZxmNqa7B3Ilql1eIilIMmNALbo8/EcIXShXXz7otXneTZ24haFQyJeixwth1utbTk6uC6K5ta60+u/EbYiA84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736272699; c=relaxed/simple;
	bh=2WOtEdu5DQ2G70KOfF/+Ls29TnJEiUz/N4Rsy3m6PmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gO3nkO7BHz6cH8x9B+juwvrcowceqUFTHbeHvmaPiItrkS8qgUFIr+LYH+P4ww+zXXWOpku0bZM3gvcl9+2pdhynGzAO/o01FJv6/QFXQJAzgPkf/kAOR45kf+lI3V4M9ExJMpCukvF9LYFd44qGqy81QnW42f15L2uouG1IbCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Uq7lEjDV; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Uq7lEjDV"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-51c4bc9cb02so823631e0c.3
        for <chrome-platform@lists.linux.dev>; Tue, 07 Jan 2025 09:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736272696; x=1736877496; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KKf11wGF5fUJKFt19yWc29LoEip50mKQ2uYQxBJzKM=;
        b=Uq7lEjDV0aCY8mB0L6Qija7zBAoe9FyKDewFzjpuGpGjNzSV0v66x3nZCZOvH79gHz
         T4O0KU/FrBuQAI/YftviHUT3WFWz8HygU079dORTc+ZJlcC7p9H51SR/IFKrl4ux0QMb
         CDuAqDOlrCJHHM1+eHcNAEhAcH8C5UnwOsVKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736272696; x=1736877496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2KKf11wGF5fUJKFt19yWc29LoEip50mKQ2uYQxBJzKM=;
        b=NdSk9LRdELuaBSeojAgwUTdUqh2B4CI6TmEGvDKwjif3i7AFUAmKa876g1Sk2gbVAf
         UYJllaLn3BH4xrMgx7pqBvsslmoPhuG80nE2s9G/oG4c9kFA8ot7V+vAUjJk6aGCCDyE
         wzeEVkT7cczo5yiCV3AZUcERli4nJT6h8SbXC89PtYw/VrMznOVrg7PNHiUwX0STQSfD
         yMB2uu1zUTGy0/PQC9P/+2B2bamVnnVq4/jPsHJpoXcbKbP1EcssVm+Ti56iuEGK9k6y
         dVzrV646kGPeEoGHf0ooUa08YYF13RB53PMVNgHC4QdQqXQLAX4B0W4JDyKYTgTw3wp5
         hQnA==
X-Forwarded-Encrypted: i=1; AJvYcCUbmeGyeUZwc80VOjfN79lWXBd5+un5CwXEFmOg3wWZ1WAKAkJz46pdPajAN8DdzU22S+2oEFmAI2pH+8i8WzU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxnsfZ5JcIwITwKdUCtaqMeIcCwHiT+4umRLrAlcR+81wTUXGfn
	x6voIpbYvqOAjjo9EK5bIysjh6R0iFoga7d6rhbAcD3XBq1FM6HNIBt4hq9/SlQvcCJDrCkDFT5
	qHN4yl7beLp3a5Gn40P0kP0FllSFDcAVCKUG5
X-Gm-Gg: ASbGncsbskEpjdinUHQYCu442XVOECF0pzhDTVF9j+2kKzbX75eupkFQ78KZ3keucZx
	TxFbh7DXY5PDuY62YWS0F4+tmySvOp/m3WKGaQu5mCf1vDdoQucrAo8RMpqBO061w31t5tGI=
X-Google-Smtp-Source: AGHT+IG4jHTyFMJNj/WuaX4JQIm37G4KuHroS2oEyoKphjPOzctvZOZE1XcZTLbRNYHKwRLbRfTcTEYiFulJNwb8Evo=
X-Received: by 2002:a05:6122:209f:b0:518:a14e:7334 with SMTP id
 71dfb90a1353d-51c6c5378f8mr20395e0c.12.1736272696032; Tue, 07 Jan 2025
 09:58:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250106185232.1635556-1-gwendal@chromium.org>
 <20250106185232.1635556-3-gwendal@chromium.org> <Z3yiIGWEO4mOOMNP@google.com>
In-Reply-To: <Z3yiIGWEO4mOOMNP@google.com>
From: Gwendal Grignou <gwendal@chromium.org>
Date: Tue, 7 Jan 2025 09:58:04 -0800
X-Gm-Features: AbW1kvbUJiB4TH6IwUYmPv4IZ1ml2gmgx09DgsfIz4nBJ37TxWfg_CM52n4KIaw
Message-ID: <CAPUE2usrD4Jy-A+-+k8OtZ_Yo2KMzfYQj5X7iW-jaTmbaDTHww@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] platform/chrome: cros_ec_lpc: Add Support for
 direct EC register memory access
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, chrome-platform@lists.linux.dev, dustin@howett.net, 
	ben@jubnut.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2025 at 7:40=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> w=
rote:
>
> On Mon, Jan 06, 2025 at 10:52:32AM -0800, Gwendal Grignou wrote:
> > Add support to access EC memory region HOST command and ACPI memory
> > region directly.
> >
> > The memory region comes from the CRS ACPI resource descriptor.
> >
> > Able to communicate with the EC:
> > ```
> >  ectool version
> > ...
> > Build info:    brtk-0.0.0-df0ad93+ 2024-12-13 19:25:55 elmo@396-a1a
> > ```
>
> Asked in v1 too: why the build info for `ectool` is important?  Or is it
> just an example for communicating with EC?
Indeed, this is an example for communicating.
>
> > Coreboot must exposed the memory region:
> > ```
> > cat /proc/iomem | grep GOOG0004
> >     fe0b0000-fe0bffff : GOOG0004:00
> > ```
>
> Asked in v1 too: `grep GOOG0004 /proc/iomem` does the same thing and shou=
ld
> be more concise.  It's fine if you'd like to keep it.
Done.
>
> > Can observe the commands flowing between AP and EC.
>
> Could you provide some more context?  Couldn't we see the trace without t=
he
> patch?  I guess these (includes above) is just a test scenario.
That's correct, the original commit message had instructions to test,
but I removed them in v1.
I am rewording the commit message in v3 to be more descriptive.
>
> If I understand the whole series correctly, it tries to support some Real=
tek
> EC which needs to read the memory region info from ACPI instead of the
> well-known ones.  If so, the commit message should provide some more cont=
ext
> about the new way for probing.
>
> > @@ -498,29 +555,52 @@ static int cros_ec_lpc_probe(struct platform_devi=
ce *pdev)
> [...]
> > +     if (adev) {
> > +             /*
> > +              * Retrieve the resource information in the CRS register,=
 if available.
> > +              */
> > +             status =3D acpi_walk_resources(adev->handle, METHOD_NAME_=
_CRS,
> > +                                          cros_ec_lpc_resources, ec_lp=
c);
> > +             if (ACPI_FAILURE(status)) {
> > +                     dev_err(dev, "failed to get resources\n");
> > +                     return -ENODEV;
> > +             }
> > +             if (ec_lpc->mem32.address_length) {
> > +                     ec_lpc->base =3D devm_ioremap(dev,
> > +                                                 ec_lpc->mem32.address=
,
> > +                                                 ec_lpc->mem32.address=
_length);
> > +                     if (IS_ERR(ec_lpc->base))
> > +                             return -EINVAL;
>
> Just realized that ioremap*() doesn't return ERR but NULL.  It should use
> `!ec_lpc->base`.
Done in v3 (has been using devm_ioremap_resource() in earlier
implementation that do use PTR_ERR()...).
