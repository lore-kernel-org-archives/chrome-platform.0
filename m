Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C5F1C3C07
	for <chrome-platform@lists.linux.dev>; Tue, 28 Jan 2025 18:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738087972; cv=none; b=eaj6ZpSyMKAFYW9ss59pOqAi+bCdyldneFczYcbAQHkKFK35x598auuJkPizbLnZSlrUHQHsv4DTFGbllRpSoVdjnaCRfIyNk5OWcEVUQ1UJ3pgw/5PcNpMKB1T84V4iihnVwHCSlqJ7cb9O1u8Z9kHs0pGRT5IvNJgw0K0CbNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738087972; c=relaxed/simple;
	bh=bN8i9w50qdU6Oy9F52rByEBoXVOvlr4XdxWi78X7Thg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uakQderFnK56ve0NKHEApQ+FDHsYZxlNhdV+rjaUa/tlaHTuxQoPQYDBb07x+nTit6jttqjiAB7gIl7N1YF/slkJ90dJaZyKCrv8rPPVYvb0e25jiLlYyxIHbEv+OIp74HfRjDp2X4Yv4LZQZvl3ls9wlpFKz9vnOJMgnuBEuiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work; spf=pass smtp.mailfrom=frame.work; dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b=gRhRFun/; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frame.work
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frame.work
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frame.work header.i=@frame.work header.b="gRhRFun/"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2efd81c7ca4so8014494a91.2
        for <chrome-platform@lists.linux.dev>; Tue, 28 Jan 2025 10:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frame.work; s=google; t=1738087970; x=1738692770; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IEAas9sa+4GYgSXz4Kg0CH2liWuPWns0G/lnnjdh1Vs=;
        b=gRhRFun/ZaDu9m7RlPw6Q8tFrtFNYiplqUMTX+IzkJ2z2x0H43PK+J/Y5pr0ipf1pp
         FB5zBm7XwHUeDsxhMr4ErC3eZti3gBdEzxNCrrx4ie1xaf62KH/bc8rcGjlddDH+bIyk
         +b/lJiH0kOeK/2635owIH5DFM4XrTuPofjbabUaZIffMVSKNVV6zR3XihdbVxv7R4b0o
         RlYN9ghxKY9RFs5Bd4MeGAVPt2TDMnqjw+gq8MmJ+3rXAaey4864KM4Z0IYIMG3mZmZe
         w0bLFgq22T56yMu2zQOx7EfIobL6PTyZL+z9o/VWYdk9OYcFDoTbHvyl7Ve0AdpAXKlq
         Ri+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738087970; x=1738692770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IEAas9sa+4GYgSXz4Kg0CH2liWuPWns0G/lnnjdh1Vs=;
        b=OOoDfKPprFgQnfVnL7dudBSEVDbSDPVfp6mSRc7LbPz0dzPmKyYZ5b34JUN0om99Nc
         6HvPxgA+u99H1Lk2Hj0o1Oubnpm23KcPX/9ZN3zy2SUpseXmHDJwwIjC1ZnyC52qP2f/
         Ve7n6vRZJ0HqM6b8GqYTMLxsXuVC8tcyA89KMTV3+ePmrFRDiyBN+cu74ujEi9SsbBAW
         Sw6pimJWbP7wM0OmDhwuZlVpoKW4EtekmpNdS+qcd2QH6M/lsn+2FRpVSMhaRfITi/RI
         WlG3s2VLRAuFVQ06cQ6E4EkGZQpHAFSeZ0w7TUmK1utsGFtkHg31hDMBXSRcM3m3dCOo
         owug==
X-Gm-Message-State: AOJu0YxSh/xXVrgY0RaZKW7RjqQXwj0OKnGlu4/IHd+pMR3Wyy5g4LMO
	+s1YMs9hZrF545XK7pwXIuP78+QU18ZPDBzOmTtbN5SPlaujsKj8X8yqmYYcu4qEt3heZAwdqyC
	DtXF6sHIsLYNQipnaGWUuHm0Esg1wZtAETLodvA==
X-Gm-Gg: ASbGncseZmbwP5k+1ANtFmfKZ3wI9aEjwQqMhfsHCA6iTv2k48ZdlANasV84Bp2Fz/F
	PWQuoGrbKKXiL5lhmJufUzSXz3+NzLfTMR/20BxA6+VGpdumg/AOfI0kXK7ktoJvpfE/YEDtviw
	==
X-Google-Smtp-Source: AGHT+IEw+PLT3Nk4ODpIBcD9O3ICXiKnO3cYY4B9vzI2agJSsv6s0Qx/+UVs8E/cnJ0PlscAnlHqO7WNdMqQaIEVTEQ=
X-Received: by 2002:a05:6a00:3c83:b0:725:e4b9:a600 with SMTP id
 d2e1a72fcca58-72fd0c5f197mr137654b3a.16.1738087969875; Tue, 28 Jan 2025
 10:12:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250124023021.9418-1-dhs@frame.work> <Z5eyyUJgdlNRBmAl@tzungbi-laptop>
In-Reply-To: <Z5eyyUJgdlNRBmAl@tzungbi-laptop>
From: Daniel Schaefer <dhs@frame.work>
Date: Wed, 29 Jan 2025 02:12:39 +0800
X-Gm-Features: AWEUYZknNl98zOgc4G1n8ts0lCFmWSm59C4JR7VgsidA_mUhxBfESXshz5cr1KE
Message-ID: <CAAjcXz7m=SCegFbN-ubpMThZS_q53+Zn8pbT3-0E2s_WBEqPNQ@mail.gmail.com>
Subject: Re: [PATCH] chrome/cros_ec_lpc: Match on Framework ACPI device
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux@frame.work, 
	"Dustin L. Howett" <dustin@howett.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 12:22=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> On Fri, Jan 24, 2025 at 10:30:21AM +0800, Daniel Schaefer wrote:
> > This patch loads the cros_ec_lpc driver based on a Framework FRMWC006
> > ACPI device, which mirrors GOOG0004, but also applies npcx quirks for
> > Framework systems.
>
> s/This patch loads/Load/.  On a related note, "platform/chrome: cros_ec_l=
pc:"
> is the preferred prefix for the patch.

Thanks

> > Matching on ACPI will let us avoid having to change the SMBIOS match
> > rules again and again.
>
> Does it mean the following DMI match is not comprehensive enough and
> would need to change again and again?

Possibly, there have been 4 revisions to the Framework DMI matches.
We won't make breaking changes on purpose, but it might be necessary
in the future.
Additionally, pre-production systems don't have the correct DMI
strings and we'd like to have the kernel module load on those as well,
while testing them internally.
ACPI is much easier to patch than SMBIOS.

> > @@ -526,6 +532,8 @@ static int cros_ec_lpc_probe(struct platform_device=
 *pdev)
> >       ec_lpc->mmio_memory_base =3D EC_LPC_ADDR_MEMMAP;
> >
> >       driver_data =3D platform_get_drvdata(pdev);
> > +     if (!driver_data)
> > +             driver_data =3D platform_get_drvdata(&cros_ec_lpc_device)=
;
>
> NACK, it doesn't look like a good idea to me.  It uses `cros_ec_lpc_devic=
e`
> merely for passing the pointer of struct lpc_driver_data.  It should use
> acpi_device_get_match_data() instead.

Thanks, that looks easier and cleaner. I'll send out v2.
