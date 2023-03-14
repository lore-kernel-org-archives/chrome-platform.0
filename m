Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFDB2565
	for <chrome-platform@lists.linux.dev>; Tue, 14 Mar 2023 06:47:44 +0000 (UTC)
Received: from hamburger.collabora.co.uk (hamburger.collabora.co.uk [IPv6:2a01:4f8:1c1c:f269::1])
	by madras.collabora.co.uk (Postfix) with ESMTP id 61EC46602173;
	Tue, 14 Mar 2023 06:47:36 +0000 (GMT)
From: "Guillaume Charles Tucker" <guillaume.tucker@collabora.com>
In-Reply-To: <ZA/lb8vd2EHHmaIm@google.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
Date: Tue, 14 Mar 2023 06:47:36 +0000
Cc: =?utf-8?q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>, bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev, denys.f@collabora.com
To: "Tzung-Bi Shih" <tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <2b2f-64101880-1-3a545780@267981473>
Subject: =?utf-8?q?Re=3A?= [PATCH 00/14] =?utf-8?q?cros-ec-tests=3A?= fix some 
 exceptions and clean-ups
User-Agent: SOGoMail 5.8.0
Content-Transfer-Encoding: quoted-printable

On Tuesday, March 14, 2023 04:09 CET, Tzung-Bi Shih <tzungbi@kernel.org=
> wrote:

> Hi Ricardo,
>=20
> On Mon, Mar 13, 2023 at 12:53:01PM +0100, Ricardo Ca=C3=B1uelo wrote:
> > On 13/3/23 10:44, Tzung-Bi Shih wrote:> The series changes cros-ec-=
tests[1].
> > >=20
> > > It applys some clean-ups and fixes obvious errors.
> > >=20
> > > [1]: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platf=
orm/cros-ec-tests.git/
> >=20
> > FWIW, there's also this fork [1], that's a bit ahead of [2] and
> > it's the one we're currently using for KernelCI [3], since Enric
> > is not maintaining the old one anymore.
>=20
> My original plan was refactoring and cleaning [2] first.  And then po=
rting [4]
> to the latest code base.
>=20
> [4]: https://github.com/kernelci/cros-ec-tests/commit/f6c0dbf63842d57=
51000c5527808aca38354db55
>=20
> > Benson, is the cros-ec repo at kernel.org still alive and
> > maintained? If so we'll sync it to [1] after this patch lands and
> > point KernelCI to it.
>=20
> I have no strong preference for where to host the repo.  It would be =
fine if
> we abandoned the cros-ec-tests repo at kernel.org.
>=20
> I guess it would be easier to start from [1] as [3] already pointed t=
o it.  If
> it makes sense, I would rebase the series and send to [1].
>=20
> > [1]: https://github.com/kernelci/cros-ec-tests
> > [2]: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platfor=
m/cros-ec-tests.git/
> > [3]: https://github.com/kernelci/kernelci-core/pull/1722

I believe it would be much better to have this on kernel.org as long as=
 we have a maintainer available.

Guillaume

