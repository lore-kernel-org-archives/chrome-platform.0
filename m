Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C80C33E9
	for <chrome-platform@lists.linux.dev>; Sun, 26 Mar 2023 14:53:05 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRju-0001tr-Ns; Sun, 26 Mar 2023 16:52:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRjt-006rme-Sa; Sun, 26 Mar 2023 16:52:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRjt-0088e2-2c; Sun, 26 Mar 2023 16:52:57 +0200
Date: Sun, 26 Mar 2023 16:52:57 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	Rory Liu <hellojacky0226@hotmail.com>,
	Scott Chao <scott_chao@wistron.corp-partner.google.com>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev,
	kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH 001/117] media: cros-ec-cec: Don't exit early in
 .remove() callback
Message-ID: <20230326145257.eiqw33b5obqcuons@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-3-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gx56hpsnezyjwbgf"
Content-Disposition: inline
In-Reply-To: <20230326143224.572654-3-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: chrome-platform@lists.linux.dev


--gx56hpsnezyjwbgf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sun, Mar 26, 2023 at 04:30:27PM +0200, Uwe Kleine-K=F6nig wrote:
> Exiting early in remove without releasing all acquired resources yields
> leaks. Note that e.g. memory allocated with devm_zalloc() is freed after
> .remove() returns, even if the return code was negative.
>=20
> While blocking_notifier_chain_unregister() won't fail and so the
> change is somewhat cosmetic, platform driver's .remove callbacks are
> about to be converted to return void. To prepare that, keep the error
> message but don't return early.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

I fatfingered sending out this series and this patch is a duplicate,
please ignore this patch, 002/117 with the otherwise same subject is the
right one. (They only differ in the number, this patch is advertised as
002 in the cover letter.)

Sorry,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--gx56hpsnezyjwbgf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQgXEgACgkQj4D7WH0S
/k4d/QgAj4TUnspVapAZVC3BvKs2XbE1ia8feuxMnvcMc6GFUXhmZKlCQTKRmk5h
cn/YDYbcXuluK+6XBUrJG1eGDkkHKjrs03uJxl56ELDq/ObyKgeuvesG8dOk+h+m
3e4XUqqFsGbBnzCf9HV517ClF3VQRKqQ73WWFozIFAi3Ranz5VuoIHQmtbCuC9fY
x2pBaNoPnZOsHVVaah1Xil4fB+x8o+osmtFOZth5prz3y/xZDfbJDbAdTYGv4wMy
4ga794t8nIoRcOkHL8Sboqi0a7qMNrIDlaPhUW0mPx/vLgbQ3gCOr78fDrpwu2ua
jFh+0Vd/tU8TD5M18NFgD3+oFg9ouA==
=PMca
-----END PGP SIGNATURE-----

--gx56hpsnezyjwbgf--
