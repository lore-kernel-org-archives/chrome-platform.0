Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206E817C1
	for <chrome-platform@lists.linux.dev>; Mon,  3 Oct 2022 08:10:07 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id u26so6829989lfk.8
        for <chrome-platform@lists.linux.dev>; Mon, 03 Oct 2022 01:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date;
        bh=c0YyeUojy1jbeCZ2/7r3YgN/g1XESLH2vjvNlGUsJKw=;
        b=LdFHIt0zUAjh3H7rheITvmy7LWOUL0dCkwyGSmp/8iPWlwthEVrWAiaPryTwyiqzuw
         a3lokmpUSA4dhqav4vFyeLd/g7nqpBVD4O1yM+nrWq5r7cF5yr134JmBIFBEBsz30xWe
         vj55VTL/xGLLmEYBwqjnkMHCmA13LdF2kRkoPB9NqlSF7vspZu/bA4TOo/XyZx7VJTWB
         q4j4Xcxq0kOXVik+kViRKpX1OHJbpla01W0CBmlL40xAxTFY6Bei5Ju8G22WAv8GUubA
         tW5lmtBuSphFTse3r72m7QQ01RiizP9x1IzEPWE4V/fmFyW2XKybYNhTqdk+SgCx3ZfR
         G12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=c0YyeUojy1jbeCZ2/7r3YgN/g1XESLH2vjvNlGUsJKw=;
        b=GaadDhSp7pAJMCSDHUNwQ6K3N7xeEQCN31WAR7yJ85cDVsMbi4HIdoq1Qb7MiVw00o
         iOjCQrnoJsmGblYUrIErCF8xAECZwZ6Z8cXZcCw0lOpB3cS/92LQ8NuVHfxOxCOuKeaA
         +minlZkCvY+zLs7w3FwPTpNwyHofgXG+IYwdrIsAAB/1pqjzVvsj5Iop/luhspDhjvdP
         lpKvgmbSvw7F7ptdCGqak/w9oXnAfkQbMbu3b+RqjxQbxduxugjNjv6j9U4rVKM6lmr7
         BPYG5cYCqyAdYkexOJPHz07Su/rcOH9KR7OU1se8K9qiNZzfi56RAtZkCx+PkA6wyodt
         hhVA==
X-Gm-Message-State: ACrzQf1K6cOJArG1DMGeUr4YduzP9ABeUS16S0YkL0t4V78aHu7Eysio
	HUy9a8EhvPX1Lt7v00+Rd4Y=
X-Google-Smtp-Source: AMsMyM4w/Ky5VFLFmELVHCsaLO1XIDKk2TKBlWRSHy002zjVdSF8UTaBCYQvdkrze6qxyd9FfuRQfA==
X-Received: by 2002:a05:6512:66:b0:4a2:3c36:8c3d with SMTP id i6-20020a056512006600b004a23c368c3dmr1399015lfo.687.1664784605012;
        Mon, 03 Oct 2022 01:10:05 -0700 (PDT)
Received: from dc75zzyyyyyyyyyyyyyyt-3.rev.dnainternet.fi (dc75zzyyyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::1])
        by smtp.gmail.com with ESMTPSA id f5-20020a056512228500b0049c86ca95bfsm1358912lfu.52.2022.10.03.01.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 01:10:04 -0700 (PDT)
Date: Mon, 3 Oct 2022 11:09:51 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Eugen Hristev <eugen.hristev@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Alexandru Ardelean <alexandru.ardelean@analog.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Miaoqian Lin <linmq006@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Mihail Chindris <mihail.chindris@analog.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Douglas Anderson <dianders@chromium.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v3 00/10] iio: Fix unsafe buffer attributes
Message-ID: <cover.1664782676.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t/4fi5Jmm2ZTy01t"
Content-Disposition: inline


--t/4fi5Jmm2ZTy01t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

IIO The iio_triggered_buffer_setup_ext() has been changed to expect that
all attributes given in buffer_attrs array are device-attributes. This
expectation has not been forced by the API and not all existing users
were checked. Some drivers do register attributes created by
IIO_CONST_ATTR().

The added attribute "wrapping" does not copy the pointer to stored
string constant and when the sysfs file is read the kernel will access
to invalid address.

First 4 patches in the series aim to address both the drivers using
IIO_CONST_ATTR(). These patches should be backportable. Please note that
these patches have not been tested in the HW so testing/reviewing is
highly appreciated.

Following 4 (patches 5 ... 9) contain a minor simplification adding a
macro for omitting open-coding of dummy attribute show functions.

I am not super happy about the new macro IIO_STATIC_CONST_DEVICE_ATTR()
which unconditionally creates a static function and a static struct
iio_dev_attr. OTOH, I do believe static function + static struct
iio_dev_attr should be the right thing to do for majority of use cases.

The last patch in the series (patch 10) aims to change the function
signatures so that similar issues would be avoided in the future.

Here we also change the struct iio_buffer to have array of pointers to
iio_dev_attr in order to avoid yet another copying in side the
iio_triggered_buffer_setup_ext(). This change appeared to be somewhat
intrusive - and as I lack the hardware to do thorough testing I added
the request for testing tag here. Especially testing of adi-axi-adc
would be highly appreciated as it is using the
industrialio-buffer-dmaengine.

Changelog v3:
  - Split the series to allow easier backport and review. This also
    allows merging the smaller fixes with less of a risk for crashing
    and burning everything :)

Changelog v2:
  - fix also the cros_ec_sensors_core.c
  - fix also the industrialio-buffer-dmaengine.c
  - add RFT + this cover-letter.

--


Matti Vaittinen (10):
  iio: adxl367: Fix unsafe buffer attributes
  iio: adxl372: Fix unsafe buffer attributes
  iio: bmc150-accel-core: Fix unsafe buffer attributes
  iio: at91-sama5d2_adc: Fix unsafe buffer attributes
  iio: Add IIO_STATIC_CONST_DEVICE_ATTR
  iio: adxl367: Use IIO_STATIC_CONST_DEVICE_ATTR()
  iio: adxl372: Use IIO_STATIC_CONST_DEVICE_ATTR()
  iio: bmc150-accel-core: Use IIO_STATIC_CONST_DEVICE_ATTR()
  iio: at91-sama5d2_adc: Use IIO_STATIC_CONST_DEVICE_ATTR()
  iio: Don't silently expect attribute types

 drivers/iio/accel/adxl367.c                    | 16 ++++++++--------
 drivers/iio/accel/adxl372.c                    | 16 ++++++++--------
 drivers/iio/accel/bmc150-accel-core.c          | 18 +++++++++---------
 drivers/iio/adc/at91-sama5d2_adc.c             | 16 ++++++++--------
 .../iio/buffer/industrialio-buffer-dmaengine.c |  4 ++--
 .../iio/buffer/industrialio-triggered-buffer.c |  4 ++--
 drivers/iio/buffer/kfifo_buf.c                 |  2 +-
 .../cros_ec_sensors/cros_ec_sensors_core.c     |  6 +++---
 .../common/hid-sensors/hid-sensor-trigger.c    |  8 ++++----
 drivers/iio/industrialio-buffer.c              | 11 +++++++----
 include/linux/iio/buffer_impl.h                |  2 +-
 include/linux/iio/kfifo_buf.h                  |  3 ++-
 include/linux/iio/sysfs.h                      | 11 +++++++++++
 include/linux/iio/triggered_buffer.h           |  6 +++---
 14 files changed, 69 insertions(+), 54 deletions(-)


base-commit: f76349cf41451c5c42a99f18a9163377e4b364ff
--=20
2.37.3


--=20
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =3D]=20

--t/4fi5Jmm2ZTy01t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmM6mMIACgkQeFA3/03a
ocWpdAgAyy6b0J6xt2mjtw7DX1VuVjI6cvnBict6lYVhU9CAqbWuSqEhgKMHwS3d
u3Jt/eKGOozOBJMqhVkvV1cq4RtDqWyRzp2iuOFXw8Ud2oJCViiSuNTCdplodQvq
K8XrCSM0xdkSGaeA3HXmjZ/JpSYglA+jXABexWmwc/PdFmhH7V+y6DXQaC/bAoFa
tRcaS99EOnS0OpDkMqp/WjwR6Te2GimUfb0wDz29oWQZd3KENrtBxCyuxFu5TOJB
MzsR4J9b+IyJ7VTnfU0mLWjTYKx5bhl1SvONulJQnJfVHPVVPWuVwx9/yNlQ8KKS
VhLUslqRJwAxvqz47n9s2NRQMGB/IQ==
=ypCI
-----END PGP SIGNATURE-----

--t/4fi5Jmm2ZTy01t--
