Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AEE23A7
	for <chrome-platform@lists.linux.dev>; Sat,  1 Oct 2022 07:44:10 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id bu25so9996363lfb.3
        for <chrome-platform@lists.linux.dev>; Sat, 01 Oct 2022 00:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=HugR/NLJXFQfozYZ66e+YMwVjhph0I2XzzQk2oljY3o=;
        b=K6XnEKHhkISLsNnZ+PqmRwXwEmcNFDlHFiGA32RcsPN4yXexBh2371BaDigsOMFxLd
         dFCJhUMeJAdxOIOVI3jQghfhUIedvxuYMFmXQ8T/912KnMtyCmhCueNpYGiGwsR8lmXX
         Dex7gYU68FzQlAc9yU05Dv/syh0K6+m9AxLZcjsQBnSiq5Xj9PTA+jFqEtRyRBBZN0Ji
         1CfWA8YEmCxiZ1LnaX3VEkb9LeedEp4ydqBj7dlBmqerdlbL1VfM+nAlQEIbC4OP1ZT+
         yxELqRVbO3Z4w3hcmSG4La44+oHgAbHVGl5aYtJL0NnGHOJaqey3P0Y5ydhDc1I4oxj6
         3Q3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=HugR/NLJXFQfozYZ66e+YMwVjhph0I2XzzQk2oljY3o=;
        b=8J46i0WYhyMSdXsVlIHJsIyVotDAXtzHF6UWl02WnzoQfoW5WAlB/GdrDQtvWYGteP
         ofkIqt6j///23bFRX4jIdRyg8p+ksbmH+0VIgr1vm+/rY7Sih4lxKQmQ07tHHwjsKGep
         HORYjnsR7hSRstiVeCFBEMwAbN9Kawah3cw76H0JKX9tIR4dB4/6GnYzBDT1umbwW/zf
         tMvSb5Ixxq9LO4taDg+ZNWBXqeF5GLvtDo2vng8bTeWctl0em5gZVMu/hREqq7/bsT0R
         SpU8I44vuoF3BHhqjhPVLbK7nbWW5BUpPLNKI0TZ5uO4jskUNSfja/QuYdu5VvDF2ZbM
         516A==
X-Gm-Message-State: ACrzQf2kK4/4HfTJ/f47eu8fq8sGVWpQzBBYr8FHf5WF7LGjGl87c1pP
	uXtwUIUlmRDmT5kb2wVn6NE=
X-Google-Smtp-Source: AMsMyM4ByumW4JDxNyG8DNIURZfGCkHffICG/1xi8XrU8oXss1j1HhVqLqIYRmLyvTOVMP0tUbbdZA==
X-Received: by 2002:a05:6512:31c8:b0:49c:db9d:bb97 with SMTP id j8-20020a05651231c800b0049cdb9dbb97mr4300336lfe.12.1664610248572;
        Sat, 01 Oct 2022 00:44:08 -0700 (PDT)
Received: from dc75zzyyyyyyyyyyyyyyt-3.rev.dnainternet.fi (dc75zzyyyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::1])
        by smtp.gmail.com with ESMTPSA id h19-20020a056512221300b00498f67cbfa9sm671086lfu.22.2022.10.01.00.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Oct 2022 00:44:07 -0700 (PDT)
Date: Sat, 1 Oct 2022 10:44:01 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Eugen Hristev <eugen.hristev@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Alexandru Ardelean <alexandru.ardelean@analog.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Mihail Chindris <mihail.chindris@analog.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Douglas Anderson <dianders@chromium.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev
Subject: [RFT PATCH v2 1/2] iio: Add IIO_STATIC_CONST_DEVICE_ATTR
Message-ID: <ad6753e27cfefe9ecb5db2c089d1fcee427ab7c9.1664610071.git.mazziesaccount@gmail.com>
References: <cover.1664610071.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xd5zRoFn41p0ColK"
Content-Disposition: inline
In-Reply-To: <cover.1664610071.git.mazziesaccount@gmail.com>


--xd5zRoFn41p0ColK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add IIO_STATIC_CONST_DEVICE_ATTR macro for creating an read-only
iio_dev_attr which returns constant value. This macro is intended to be
used when replacing the IIO_CONST_ATTR - attributes for triggered
buffers because the triggered buffer attributes must be of type
iio_dev_attr.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
 include/linux/iio/sysfs.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/iio/sysfs.h b/include/linux/iio/sysfs.h
index e51fba66de4b..de5bb125815c 100644
--- a/include/linux/iio/sysfs.h
+++ b/include/linux/iio/sysfs.h
@@ -97,6 +97,17 @@ struct iio_const_attr {
 	=3D { .string =3D _string,						\
 	    .dev_attr =3D __ATTR(_name, S_IRUGO, iio_read_const_attr, NULL)}
=20
+#define IIO_STATIC_CONST_DEVICE_ATTR(_name, _string)				\
+	static ssize_t iio_const_dev_attr_show_##_name(			\
+					struct device *dev,		\
+					struct device_attribute *attr,	\
+					char *buf)			\
+	{								\
+		return sysfs_emit(buf, "%s\n", _string);		\
+	}								\
+	static IIO_DEVICE_ATTR(_name, 0444,				\
+			       iio_const_dev_attr_show_##_name, NULL, 0)
+
 /* Generic attributes of onetype or another */
=20
 /**
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

--xd5zRoFn41p0ColK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmM378EACgkQeFA3/03a
ocXKeAf9HN002m865SDcUlmLtg0aCs/YoUrIHeUs903yq/3AedvqFTck32PpJzs5
l5Lg7yVnTVBJchAdezzNQghJuAcWqQZsoO1qT9HF+dTumrTM46zJ/vs87li1wWIP
hPMyaxcuCUyaKPTXEPYawiAihAChYcurB7bm1VLwjtoI9f9kSAYMvNIerfXi11v/
/T1kipzgSUv79MaojvGw5iYNbkcrMhi9+rZXegQl+YiicZ7dEtjHhI6o1SifTzmT
oV5x77T3dFww7/P25HfYhWyvfCPTTPuiRmzS6sHpH0H4PbFPhel9ULa2xHtr/NCy
qfQUs3ugjSq+s3gwzpehS6cAtte2GA==
=DkLa
-----END PGP SIGNATURE-----

--xd5zRoFn41p0ColK--
