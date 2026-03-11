Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193F03E8674
	for <chrome-platform@lists.linux.dev>; Wed, 11 Mar 2026 18:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773253417; cv=pass; b=XqW2W9WUu/y8fmfB7oMEufMBV/vM/wzYCypswptz/iQrdBIMJjY/lsfocri8E1B8covGRHp9/0n9AarvjeVvRlVDmyiCXAeHWA4X+T4DL7hxfgVcb26arsnA1X12GH/U3XyxcQO9ebicaMY88AXkJPmdaRSa5TIQecazEmG9O7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773253417; c=relaxed/simple;
	bh=yY/pCb+CB+pq4XV/4sw57sbHCb95u3MWcH+1fET0K1Q=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fhvf/jYVv9YYCA/wjxOZq4hve+2SxjWvN1T/zJHIS0EnuK/QdcpgkKoGjotv87wyGA1GxWHz2PDrPZHiqNuSckIyyyjFt0pxMDYLhVdZyz5xD6CFDDeRPwgjxpoAoAh+5F/h0EhvPo1SzpC0fqDWnP6WiSrgC12ENWf3XuY9LTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=gW1HW5As; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="gW1HW5As"
ARC-Seal: i=1; a=rsa-sha256; t=1773253408; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZuCSgyn9RtJCiPM3WDMI4oHCpcnSnZmks7MgxKvV9KWh2iqwf8ex6yZFMnqbUyXGhIAGghJHDASk/BfugaPftAhT4FgCtdYlVzOvqbM5G9wC4T9pa+zgCkFHiXKvosLtTr877pJY4Uag11mx5ekd/NUV+JLfgrYaVilH26gF9/U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773253408; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Wl0Yd7xpqyZcnXgDUZsmTbSJsY/qtMyfwr0uenBmh1s=; 
	b=Jb65iTW8zTIG6DIUUhLrjYNcwmb2E6G1FNKf4IcTAV9w+RsMYsPAQqeCoAxo7xljv+wz7eCmIqJjXBzHaQlNsAwqBKWIEKO6BHxCDLI6/2gt4anh1amNf6K3cLUMzziCJTNQAISqTVCpVlCBPwQ3Fa42uGrA8u56bWvrlkO4pNg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773253408;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=Wl0Yd7xpqyZcnXgDUZsmTbSJsY/qtMyfwr0uenBmh1s=;
	b=gW1HW5AsUqj1WLp5gG1/jSQrUUjlSA4t/1/YMcT+0MZbSp0eYBpP5mfzeLpNrB0Y
	NJBsvUrcn3A+9oX6Pckld1zwaecnb9JGEaOsEKR9jokCF3mm33C3gpev5/kOpK0cMgK
	BUbsuoPNEFaZ/PGDgCmIn7Ba9PlFFiwbcLmzQYmhhSYRrNKcQ860ozZTex80ThNEqbI
	fR1dtANZe25oCxA1y8wXTR9W3Scft3u08J3ww5wSeeTpMuEOVdkl68q9H4LZt6tAgDq
	2zlU6WnFwcZtOdzQH1ma70QKSk+O6MyDFSeMbGnOgHRChPDCpQVSNNVoKg/eAPnOiBh
	TxOcOZyZhA==
Received: by mx.zohomail.com with SMTPS id 1773253406326114.68008993957744;
	Wed, 11 Mar 2026 11:23:26 -0700 (PDT)
Message-ID: <04b5729c514c01c47cd4261a3c608d48bdaf33e4.camel@rong.moe>
Subject: Re: [RFC PATCH 0/9] leds: Add support for hw initiated hw control
 trigger transition
From: Rong Zhang <i@rong.moe>
To: Andrew Lunn <andrew@lunn.ch>, Lee Jones <lee@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
	netdev@vger.kernel.org, Pavel Machek <pavel@kernel.org>, Thomas
 =?ISO-8859-1?Q?Wei=DFschuh?=	 <linux@weissschuh.net>, Benson Leung
 <bleung@chromium.org>, Guenter Roeck	 <groeck@chromium.org>, Marek
 =?ISO-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,  Mark Pearson
 <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede	 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Ike Panhc <ikepanhc@gmail.com>, Vishnu
 Sankar	 <vishnuocv@gmail.com>, vsankar@lenovo.com,
 linux-kernel@vger.kernel.org, 	linux-leds@vger.kernel.org,
 chrome-platform@lists.linux.dev, 	platform-driver-x86@vger.kernel.org
In-Reply-To: <f3e2e601-ec12-46b4-8986-c2d997e48572@lunn.ch>
References: <20260227190617.271388-1-i@rong.moe>
	 <20260310121024.GJ183676@google.com>
	 <f3e2e601-ec12-46b4-8986-c2d997e48572@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Mar 2026 02:18:03 +0800
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External

Hi Andrew,

On Tue, 2026-03-10 at 20:04 +0100, Andrew Lunn wrote:
> On Tue, Mar 10, 2026 at 12:10:24PM +0000, Lee Jones wrote:
> > I'd like for the netdev folks to take a look at this please.
>=20
> Before i get the rational of these patches....
>=20
> Have they been tested with CONFIG_PROVE_LOCKING enabled? My experience
> with networking is that it is very easy to get tied up in AB-BA
> deadlocks. You need the LED to be as dumb as possible, it is always
> logically 'below' the trigger. Having the LED calling up into the
> trigger generally gets you into trouble.

I will test it. Thanks for your reminder.

Thanks,
Rong

>=20
> 	Andrew
