Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB497C
	for <chrome-platform@lists.linux.dev>; Thu, 27 Jul 2023 00:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1690418796;
	bh=jTzKaKnQyg5/UELtTBdu7UhyW3Fq3u57UjUHkqw1cTA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IWQp1smQPEcZOX4J0brf1Z6bhDhJtqg36yqY3PFliOczwITlRq1IW+Kelpah/o5wF
	 TYf+dhZmA5wd+DIP9aqsMEOw1sYYRp6UF0PzK8qoX3vy2IupAI6OhwZ7NB9iLpgw+E
	 XIELs19bqj6BMxZFGhQDVUDJYGOrC8XPThLUCV9PpLikIe5MLD+szEtK+L/HoWNJcU
	 1DaVwF3KHArxjTZ0ZNS+phJb4HSniWsvBF8bCslbpAglk3+kz87CllwfAnS4o/yw8g
	 TACo9l6W4nh8YdPOYCNNQEuNbAgJMss0rneRzblIhzyil94KKEDqQOTGpPgvav+UN/
	 NtNu8RLcN4X6w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RBBsl5qT1z4wZx;
	Thu, 27 Jul 2023 10:46:35 +1000 (AEST)
Date: Thu, 27 Jul 2023 10:46:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Subject: Re: How to include a new branch in linux-next
Message-ID: <20230727104619.156dbc9d@canb.auug.org.au>
In-Reply-To: <ZMDG5GK1y2Pcb3hd@google.com>
References: <ZMC85NEDXdeUAR4n@google.com>
	<20230726164508.55d7c91a@canb.auug.org.au>
	<ZMDG5GK1y2Pcb3hd@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mteMo_tuAd8tpyjn1ghsiF9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mteMo_tuAd8tpyjn1ghsiF9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Tzung-Bi,

On Wed, 26 Jul 2023 15:10:28 +0800 Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> On Wed, Jul 26, 2023 at 04:45:08PM +1000, Stephen Rothwell wrote:
> > On Wed, 26 Jul 2023 14:27:48 +0800 Tzung-Bi Shih <tzungbi@kernel.org> w=
rote: =20
> > >
> > > We are adding a new branch "for-firmware-next"[1] for
> > > chrome-platform-firmware.
> > >=20
> > > I am wondering if linux-next has metadata repo so that I could send
> > > patches to include the newly created branch in linux-next.
> > >=20
> > > I failed to find the repo thus I thought it has some discovery mechan=
isms.
> > > However, just realized the latest next-20230726[2] doesn't include
> > > "for-firmware-next".
> > >=20
> > > [1]: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/=
linux.git/log/?h=3Dfor-firmware-next
> > > [2]: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.=
git/commit/?id=3D0ba5d07205771c50789fd9063950aa75e7f1183f =20
> >=20
> > To get a branch added to linux-next, you just send me an email with the
> > git URL for the branch, the email addresses of people (and/or mailing
> > lists) who should be notified if there are any issues with the branch
> > (like conficts, or build warnings etc) and an indication os what will
> > be in the branch and how it will get to Linus Torvalds during the merge
> > window. =20
>=20
> Preferred name of the record:
> chrome-platform-firmware
>=20
> GIT URL:
> git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git#f=
or-firmware-next
>=20
> Email addresses if any issues with the branch:
> <tzungbi@kernel.org>
>=20
> Mailing list:
> <chrome-platform@lists.linux.dev>
>=20
> What will be in the branch:
> Changes for drivers/firmware/google/ which is mostly used for Google Chro=
me platform.
>=20
> Regarding PRs to Linus:
> The same as chrome-platform[3] but it will use another name "chrome-platf=
orm-firmware".
>=20
> [3]: https://patchwork.kernel.org/project/chrome-platform/patch/ZJko2ipBS=
y8eM/+2@google.com/

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/mteMo_tuAd8tpyjn1ghsiF9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmTBvlsACgkQAVBC80lX
0GzPUQf8DFUJUVLY3L+GJx6FW7BM+p1CWRaoFaOaqEzujFABtXXsNLirhWgcgDgY
gfy8jhTmH26ADBYIABLGjb+VlTIYFHVvU+Twwvpr/cgWaVFEtNcnN4JGGBC2sr8n
oKn10FN15SIn3bRnnrfxVSWph8kqSddv2s3WIjoVRfizN5tlJ6r+s8LDqbGBFvfj
OrEe4fUAvF7ZE/ncKuxurhEuaDJlSTry0GZUKrk+SPtXBmsP2149iWiKLU7QOEgL
bThauW79FAD+0kdU8TtgznH22QH+j1zRpKuDxl2fwZsXMnpSEFPkAWu+GSK08HdD
4dBqbZwfHPtIvcUWROONwtBmqupaiA==
=d2xJ
-----END PGP SIGNATURE-----

--Sig_/mteMo_tuAd8tpyjn1ghsiF9--
