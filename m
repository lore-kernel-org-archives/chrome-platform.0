Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248962;
	b=kaWGW9uJMV04eFZNnPh/AVAYHCLQ5yxj9I+onTlfsWVs/n0yR//aLgCaQHsLGqdyWlMy
	 Hax0ojAMn+hJP5XgwWqdTmlWEBzm6J4ETo3CutaeUUHqeawlfyNivipDKhcfGxWTFkyBG
	 7+yZIAhFgCM6sGdtja/GqQTcql96z2pRxG2APGldqiIDMcRPwK9vaufp6mck0uHQKeEIS
	 Guq1voit14/KkbJDoYrTwLv5JC1yBsbbeJBAwm8ApWNiMIrInhz+zhpU7GHBj/bR+XQxm
	 CkGs5kfgsTXgpApqkgOnTDYgd4gVf+X96+AHdT/7WgtJVJ8AelHZpBTWT6MX26kwFig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248962;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xHCyj2jSkeRuM2kkMIc0lW2hAHSKhEvR+GoR0PMU0nU=;
	b=EnvQ8XtOUqU5llxDhRPGf4ngti9UUU1Cwz6t/hrGfY95ugR+HLuxZmaoeGUydKLtGyqa
	 zPqe+fIfdn5sG/KNFmLt9jQNfP5K0Jmh2dCBjzPcZHga/FP2YnTGmcAmqDgkyw92Ncp8F
	 nqYMoDf8iYYERClk05lolb5LqP378HG/90kEwUqnQYPaEWcRlvYUCgCPvYY8ZEkjUl05X
	 Q9W4xZgeWdLogmgQPCI/1JgFcGCPGKRAERob909HctLYUqfiYPSrD1qfdExtZtSpmaHHw
	 +2SbsNLHVE7aUdPa792uCOwrvgjIQmGzfDvJjG7xZGot+DC5zISZ/P2cbM9rXRj4kKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KDQ/dZ4j";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C806070EE2
	for <chrome-platform@lists.linux.dev>; Mon,  9 Nov 2026 18:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KDQ/dZ4j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E74111F008A5
	for <chrome-platform@lists.linux.dev>; Mon,  9 Nov 2026 18:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794248960;
	bh=xHCyj2jSkeRuM2kkMIc0lW2hAHSKhEvR+GoR0PMU0nU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KDQ/dZ4jCCyBYpwdIvEJGT/u4Csogf3SCMyX5XFxtC9G3RjO7mTauX3KClXvhKakh
	 hJmsCb26jbcc6M9jAes2h7a+5Ty9WKAEWzuIBLXh7OTrkJXv3N4s3OgGsAdZ++8ZL4
	 4fkzFxUhV/WG9NyKpKa+6Xke4XsaIIerJ/iMx2JyrrlmllAut/uS+cKGEsO1rWSLAg
	 ukPKHdbMImmqdbLnKRnagtGLUVSVsdCZYcqlHuKm+m6VtIl8Yq3GMBtptO9ApiGqzf
	 bNtysb1K0QKsY8mgEtSK9T3pltcFrHdRwil4iswwB6vLj3U1NbDNcGwNYeKu0t9tTm
	 aAGaUNjsYR0Fw==
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eabf7d5bbeso741881e0c.1
        for <chrome-platform@lists.linux.dev>; Mon, 09 Nov 2026 10:29:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH9YKk75COnoeVIFuS9SN4pmIrqTUwRauCmpI7QHQCmOWm0YNp9q5v4q4pbodSWsFRhqlUY+C9z1eFh5C39Rss=@lists.linux.dev
X-Gm-Message-State: APuU4Z++PbdV7g78CWGtcb2NUcUGQ2ybAE+NplH9XB7ud/59PCNVQj0k
	UzknKI3Uf3PXTCWoagKmkOwa3tIDLeCHG7Htv8tnTLAm+5+XatLtd+wWYX490qrOXMoO2fyXtGP
	cPEFpLo2Nf0PekUA7tetG/U1CRwoyQd0=
X-Received: by 2002:a05:6122:4d0d:b0:5ec:d5e1:ee47 with SMTP id
 71dfb90a1353d-5ece7233e70mr1789035e0c.5.1794248960224; Mon, 09 Nov 2026
 10:29:20 -0800 (PST)
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20260930222650.1883805-1-jordan@brough.org> <20260930222650.1883805-2-jordan@brough.org>
 <3cd06bed-83bd-425a-387b-f1d3b073cb47@linux.intel.com>
In-Reply-To: <3cd06bed-83bd-425a-387b-f1d3b073cb47@linux.intel.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 9 Nov 2026 19:29:05 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hxx-jZxgD+2aJXy2Y_LLz0_aeU4wgpx6+Bkq-YqvHmkw@mail.gmail.com>
X-Gm-Features: AclHuK_RUBk_HS-TRf-9SPVkJfBBsG7409hOdJvXCSLjtBD3J9gHu_L1S9k7nAo
Message-ID: <CAJZ5v0hxx-jZxgD+2aJXy2Y_LLz0_aeU4wgpx6+Bkq-YqvHmkw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] ACPI: battery: add acpi_ prefix to the battery
 hook API
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jordan Brough <jordan@brough.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, 
	Denis Benato <denis.benato@linux.dev>, Hans de Goede <hansg@kernel.org>, 
	Antheas Kapenekakis <lkml@antheas.dev>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Armin Wolf <W_Armin@gmx.de>, Jonathan Woithe <jwoithe@just42.net>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Ike Panhc <ikepanhc@gmail.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Matan Ziv-Av <matan@svgalib.org>, 
	Nikita Kravets <teackot@gmail.com>, =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>, 
	Joshua Grisham <josh@joshuagrisham.com>, Jeremy Soller <jeremy@system76.com>, 
	System76 Product Development <productdev@system76.com>, Azael Avalos <coproscefalo@gmail.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Sebastian Reichel <sre@kernel.org>, linux-acpi@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, chrome-platform@lists.linux.dev, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 11:18=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Wed, 30 Sep 2026, Jordan Brough wrote:
>
> > Rename battery_hook_register(), battery_hook_unregister() and
> > devm_battery_hook_register() to acpi_battery_hook_register(),
> > acpi_battery_hook_unregister() and devm_acpi_battery_hook_register(), s=
o
> > that the exported ACPI battery hook API has a consistent namespace, and
> > update all in-tree callers.
> >
> > No functional change.
> >
> > Signed-off-by: Jordan Brough <jordan@brough.org>
>
> Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
>
> With one known caveat! There's c72dd9994952 ("platform/x86: add Acer
> battery control driver") in the pdx86 tree so if Rafael takes this like h=
e
> proposed in his reply to patch 2, that needs to be handled during merge.

Well, I haven't applied it yet, so no worries.

It's in my 7.5 queue ATM.
