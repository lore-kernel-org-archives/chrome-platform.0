Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04DC281370
	for <chrome-platform@lists.linux.dev>; Mon, 28 Apr 2025 17:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745862590; cv=none; b=IQt8v1Ov+8Z3CBeeYwD5qaPubZNQKZ5pKwH620J6CQxXMKs7WiZZfjqsrM75fhItnGl8u+9dhOuBf7/U1shQk4DL8tQBnLmLUoyWuHrL6PqDO8tQjz3gzokaQkrOcjba7LVUCxc5orMdRwgtZfIRuD84mpgGlIomKay1y+RZGHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745862590; c=relaxed/simple;
	bh=wZPqYWODFsYuiIl8N6gdjeJeN+6mXmrSPnEmhtzTRCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFFLfUDEl1lbxDYBWn4kOaX+dvtmKxO9zFV9DxgYgVXoq06nMyzu+UNEc5bZ4qQqM1Fhy7yuLoVZ1ijIlCyCdPruZKgEvCxgTHX2QS0Hdwc267BBKl4MF0TzrdLR4IbDkDaWxFdyTy366a4lgacibepVdD8UVNX6O+bit/2+fK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mLUb4/D1; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mLUb4/D1"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-227d6b530d8so55543195ad.3
        for <chrome-platform@lists.linux.dev>; Mon, 28 Apr 2025 10:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745862588; x=1746467388; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kSyHc84AnpHkvPh5lf7rVEarManM/+eKBGwMXNUKGRw=;
        b=mLUb4/D1cR8l51qpsd42S9wkO43QjXJXuhNBFRS1cS6cg9pb8tRg2XhWcKgEyC4HGT
         ZDk8OUUmkHmj7WQBYArm5nwmI49qqGRMJPvdOrkl5Et9LfkxMgyOApNvCzJ1IYVwgOEy
         qUdmHUzFKhVu9DDn2l7Zobh/38UlZ8nEEBeY8CKfDlIiq9SuRgTgadCj7/mqbpYjTkSC
         MB2XCnbG7YwElETvrJLDvE97VAAewPXa5D2yqExtZsTQSVD6weRlpJR70vkXsJhXLvRd
         ADJVYFA/FADJZ/ntHAaTnPVzQplG3b24NfH1YLgO2bvgjDAnapHzECJETyz1I62qrLyp
         Cr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745862588; x=1746467388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSyHc84AnpHkvPh5lf7rVEarManM/+eKBGwMXNUKGRw=;
        b=imkO4D8c7AsgVLnUwjvd4S2NepVM1/38djKRCFkGvL3AXtNNYxx/LmmzGj5bZUhhGz
         BresG2q2UvVIVzciT3EzziWGwpE/Rj+UAM4p3AoV6X3FGfeTBT1eTVXr9TXvV8TLgoN9
         HkG7DHSt+3zPEBtC8/AeM+VD+An9cLV5nxujzJnJQLpmsnGmHKx09sP40qZOHW1mPgli
         Y9y9KQ8CqhaXc/w0uwOvR3CVKEL83xjH8qucXKIjSh0AmX/kdxa6YkkuMJLSVZ5O1hZD
         fAzBe+9DKszh4hoBug2BwalKbGIdlNwqjg0sYeID2a+fBftGu65UUo5iHayE1iic4g9q
         CVBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP9zbBekfSE2P+SOJG075DNgYWgpW8NMLH6ojIKOJHlaNoN/Py/bPPl1VILWi3yftv/ntid3Ac4YFMv5sz61w=@lists.linux.dev
X-Gm-Message-State: AOJu0YxIVh3NXCDxwtqF3zIr4AJ+4mV+mOfCl9pPPGg0M0AvqsHAUbCj
	J7m4Eft/ElDig/qDHdWXrn4QtP3Dt7zk9cEC1yM0Pceh0MBXFm8HDBB/izGh7w==
X-Gm-Gg: ASbGncvMTbe6spP1JTZCFnuaduGjT1URcMrMBuKaDpQ8NbTH3EIpF8BIqPrDB0mPmZZ
	lMz4nJ3i1HiPQq+6e5aVbUOgBKVykXQkfqN/KBMCiVTGW0SxcKE1W8RVxlTZ+PNuo4/kvb28rZP
	TelglaJ+9yqwglx9oEhQDrrHQivZZy+rj6CaxH4zd/jY76NxCDSQ09vzdjfWKsuhVFFvdMUToeW
	EUbEv6vp6/yeEa9ArtVwwq93DPBnqTnZfiRMEWaawLdI4/l6gyzLudyh+dsLcgP5AXvrsabiBY8
	c1cF3KOvR+bY8gdIEusD9lWh81DNBEWVMdR9Pyr/DppO+/ptQA9hbbFoEdQ6mKzNVgdheoGbzw=
	=
X-Google-Smtp-Source: AGHT+IFB4ZJyQ88dUHU7N9YKwJhwPRMBp+llMDskZSUApRruyoBdw1o31YpMz40Wv7kngIiJmA7gXg==
X-Received: by 2002:a17:903:98d:b0:223:653e:eb09 with SMTP id d9443c01a7336-22de6e93a1cmr415405ad.7.1745862588006;
        Mon, 28 Apr 2025 10:49:48 -0700 (PDT)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76ce1sm86414745ad.40.2025.04.28.10.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:49:46 -0700 (PDT)
Date: Mon, 28 Apr 2025 17:49:42 +0000
From: Benson Leung <bleung@google.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, jthies@google.com,
	akuchynski@chromium.org, tzungbi@kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	sukoo@google.com
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Set Pin Assignment E in
 DP PORT VDO
Message-ID: <aA-_tpJp7Nh2pm3J@google.com>
References: <20250426024810.3876884-1-bleung@chromium.org>
 <CANFp7mWQPy2z1dWtHSw1uzMnUCcRJfaqJvGayyjmEvVjnM3KXQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qJ3DhvBIT9BsNZ/n"
Content-Disposition: inline
In-Reply-To: <CANFp7mWQPy2z1dWtHSw1uzMnUCcRJfaqJvGayyjmEvVjnM3KXQ@mail.gmail.com>


--qJ3DhvBIT9BsNZ/n
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Abhishek,

On Mon, Apr 28, 2025 at 09:24:08AM -0700, Abhishek Pandit-Subedi wrote:
> On Fri, Apr 25, 2025 at 7:48=E2=80=AFPM Benson Leung <bleung@chromium.org=
> wrote:
> >
> > Pin C and D are used on C-to-C cable applications including docks,
> > and for USB-C adapters that convert from DP over USB-C to other
> > video standards.
> >
> > Pin Assignment E is intended to be used with adapter from USB-C to DP
> > plugs or receptacles.
> >
> > All Chromebook USB-C DFPs support DisplayPort Alternate Mode as the DP
> > Source with support for all 3 pin assignments. Pin Assignment E is requ=
ired
> > in order to support if the user attaches a Pin E C-to-DP cable.
> >
> > Without this, the displayport.c alt mode driver will error out of
> > dp_altmode_probe with an -ENODEV, as it cannot find a compatible matchi=
ng
> > pin assignment between the DFP_D and UFP_D.
> >
> > Signed-off-by: Benson Leung <bleung@chromium.org>
> > ---
> >  drivers/platform/chrome/cros_ec_typec.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform=
/chrome/cros_ec_typec.c
> > index d2228720991f..7678e3d05fd3 100644
> > --- a/drivers/platform/chrome/cros_ec_typec.c
> > +++ b/drivers/platform/chrome/cros_ec_typec.c
> > @@ -22,8 +22,10 @@
> >
> >  #define DRV_NAME "cros-ec-typec"
> >
> > -#define DP_PORT_VDO    (DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_C) | =
BIT(DP_PIN_ASSIGN_D)) | \
> > -                               DP_CAP_DFP_D | DP_CAP_RECEPTACLE)
> > +#define DP_PORT_VDO    (DP_CAP_DFP_D | DP_CAP_RECEPTACLE | \
> > +                        DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_C) | \
> > +                                               BIT(DP_PIN_ASSIGN_D) | \
> > +                                               BIT(DP_PIN_ASSIGN_E)))
> >
> >  static void cros_typec_role_switch_quirk(struct fwnode_handle *fwnode)
> >  {
> > --
> > 2.49.0.850.g28803427d3-goog
> >
>=20
> Please add a Fixes: dbb3fc0ffa95788e00e50ffc6501eb0085d48231

Done, Thanks!

--qJ3DhvBIT9BsNZ/n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaA+/tgAKCRBzbaomhzOw
wqsfAP93but+Y7oDTucGSmBf08Sb+w3b4c7TcFB3NmXnSRqW3gEAsZwyhTexrI7j
W6kNrTSVbuh4F9QabifIzEf2krSK9Aw=
=R5cf
-----END PGP SIGNATURE-----

--qJ3DhvBIT9BsNZ/n--
