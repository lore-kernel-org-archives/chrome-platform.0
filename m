Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5189CDA92
	for <chrome-platform@lists.linux.dev>; Fri, 10 Mar 2023 18:50:40 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pahp2-0008TP-84; Fri, 10 Mar 2023 19:50:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pahp0-003EbR-M2; Fri, 10 Mar 2023 19:50:30 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pahoz-003rf2-BX; Fri, 10 Mar 2023 19:50:29 +0100
Date: Fri, 10 Mar 2023 19:50:28 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
	Munehisa Kamata <kamatam@amazon.com>,
	Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>, linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@pengutronix.de,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH 2/4] pwm: cros-ec: Explicitly set .polarity in
 .get_state()
Message-ID: <20230310185028.z2rewz3467fvs5a3@pengutronix.de>
References: <20230228135508.1798428-1-u.kleine-koenig@pengutronix.de>
 <20230228135508.1798428-3-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g2zqdfjbor4id76k"
Content-Disposition: inline
In-Reply-To: <20230228135508.1798428-3-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: chrome-platform@lists.linux.dev


--g2zqdfjbor4id76k
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2023 at 02:55:06PM +0100, Uwe Kleine-K=F6nig wrote:
> The driver only supports normal polarity. Complete the implementation of
> .get_state() by setting .polarity accordingly.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

I think we should apply this patch as a fix to prevent similar failures
as reported for the meson driver. To justify that:

Fixes: 1f0d3bb02785 ("pwm: Add ChromeOS EC PWM driver")

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--g2zqdfjbor4id76k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQLe/AACgkQwfwUeK3K
7AkkUAf9Em3mJsgoxTz/iBgebzx6c8aTWGyQgK+GvgV6dNlY+O5UNPRHbIyBzGZe
bmUqERDjuAkds3gShpEsb6W+pB+Zbl2a2qj94aoCCugX2GO6jxmdISnIsIMcUQuh
nZxzx+CtNZKc1meGqSgOnScjeDArFR88cvRueEHSJHhATyl62Fc+hM3MLYxq8/U6
Q1kTi1d8ZDIt7bnNb0mCUuuQ8/l+LNzeCZW2wlzoBnBF9z8KDS8ogWqBxTe6YEqS
rRUiUXKDnXDep2lfIf9Qd+53BNos38YqsafdDFRbpWBeiXf9vZxjfUoq6uh+VomH
XiJins19aj3WBhfJzWrQyUaaXH8Y8Q==
=VYcZ
-----END PGP SIGNATURE-----

--g2zqdfjbor4id76k--
