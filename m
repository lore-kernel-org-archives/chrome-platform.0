Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE27C8C09
	for <chrome-platform@lists.linux.dev>; Mon,  9 Jan 2023 19:48:44 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id s3so4478102pfd.12
        for <chrome-platform@lists.linux.dev>; Mon, 09 Jan 2023 11:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pzj+1xM4gBKmgWnPCLV2+6y0WjkwPe6npIYkB1DxHGE=;
        b=jHxzLcuXGniSHCMnJJmdr3FS4WYhOzewoHlZPULfrFyFJcOpJ8MeKgf+fXNKV49sLy
         3jB/qVmvcF6KxjBhmYIhm/3CmS+BHpgTSHmbFWgZZxrcWL26zcWYAZOY1ajvHMoecF7D
         rXtm+UT1O9e7wsdQLRCj4F2BgM+OiyWvoR9867tCUVu1DeLsBA0lpUzLJ2td72vlA32m
         XiIcBO8UA1IxgNIWFxmeTn8os/gn5tcovh5Vc2dGaYC7Z0m079TM3cdX4je+l8npIlSb
         0Ih1ljBkuymSNRcndgf8s+JLt6BFyT7lNu/+5T/JBbdQNyYFuqDoTBFoFjNncJUttkHv
         m/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzj+1xM4gBKmgWnPCLV2+6y0WjkwPe6npIYkB1DxHGE=;
        b=j72Ml05cUfd/RLY3pJr/5K6MRnstpn3YZ/i1+CzxDihwgkbNcjcph/Quh/yFKynLpu
         wKqex2S4XyqWZR3SPshqUE64XNpzfMjfaJTHRSRKZDtqDLB+ULNeRlWRjoWYkHFZ682q
         MxuAXlp+xOXHUUeuScyHhzyUMRKsHJG+4fjpidiv2ycOK0Pvvyi5gdBhZBa6WbJj1tFc
         16OOtesJwZooQGAQy9Ji3mK1K8K77DUSE+Rubxb8914YUlMsALOowhvUaggLWGuwBLUh
         CjdlKMba0czV2y7SFYS7BuyeJL2jjRjPXi4rwkJDwFpoZ4+fYeHB37EnXS524HcSCLBd
         luIg==
X-Gm-Message-State: AFqh2kqeYgB2PBD/RgPBUElRaToaBwr3a6a4EoC2jD/GTd4JzTQzEcNx
	dqti734aBF0H9eZuxJhgPMYqSQ==
X-Google-Smtp-Source: AMrXdXuf/V0/heeUDLnjjNAh1odQb9OIIq6iEItItQEPxPPENen5H0YwzRe9ykmHJRUX2Quuc1HZGw==
X-Received: by 2002:a05:6a00:1948:b0:581:bfac:7a52 with SMTP id s8-20020a056a00194800b00581bfac7a52mr745639pfk.1.1673293723940;
        Mon, 09 Jan 2023 11:48:43 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:3529:30e5:d581:6e80])
        by smtp.gmail.com with ESMTPSA id z20-20020aa79494000000b00580c8a15d13sm6660068pfk.11.2023.01.09.11.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 11:48:42 -0800 (PST)
Date: Mon, 9 Jan 2023 11:48:36 -0800
From: Benson Leung <bleung@google.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	heikki.krogerus@linux.intel.com, Benson Leung <bleung@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Evan Green <evgreen@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>, Lee Jones <lee.jones@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: Re: [PATCH 07/10] platform/chrome: cros_ec_typec: Alter module name
 with hyphens
Message-ID: <Y7xvlBGYhbsME0Tf@google.com>
References: <20221228004648.793339-1-pmalani@chromium.org>
 <20221228004648.793339-8-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="odcVidNBJJMq8pOn"
Content-Disposition: inline
In-Reply-To: <20221228004648.793339-8-pmalani@chromium.org>


--odcVidNBJJMq8pOn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 28, 2022 at 12:45:10AM +0000, Prashant Malani wrote:
> Change the Type-C module name from cros_ec_typec to cros-ec-typec. This
> allows us to include more files in the same module (rather than relying
> on the file name cros_ec_typec to also be the module name).
>=20
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/Kconfig  | 2 +-
>  drivers/platform/chrome/Makefile | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kc=
onfig
> index c1ca247987d2..5e420c27662a 100644
> --- a/drivers/platform/chrome/Kconfig
> +++ b/drivers/platform/chrome/Kconfig
> @@ -226,7 +226,7 @@ config CROS_EC_TYPEC
>  	  information from the Chrome OS EC.
> =20
>  	  To compile this driver as a module, choose M here: the module will be
> -	  called cros_ec_typec.
> +	  called cros-ec-typec.
> =20
>  config CROS_HPS_I2C
>  	tristate "ChromeOS HPS device"
> diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/M=
akefile
> index f6068d077a40..fd29fa74ba33 100644
> --- a/drivers/platform/chrome/Makefile
> +++ b/drivers/platform/chrome/Makefile
> @@ -16,7 +16,8 @@ obj-$(CONFIG_CROS_TYPEC_SWITCH)		+=3D cros_typec_switch=
=2Eo
>  obj-$(CONFIG_CROS_EC_RPMSG)		+=3D cros_ec_rpmsg.o
>  obj-$(CONFIG_CROS_EC_SPI)		+=3D cros_ec_spi.o
>  cros_ec_lpcs-objs			:=3D cros_ec_lpc.o cros_ec_lpc_mec.o
> -obj-$(CONFIG_CROS_EC_TYPEC)		+=3D cros_ec_typec.o
> +cros-ec-typec-objs			:=3D cros_ec_typec.o
> +obj-$(CONFIG_CROS_EC_TYPEC)		+=3D cros-ec-typec.o
>  obj-$(CONFIG_CROS_EC_LPC)		+=3D cros_ec_lpcs.o
>  obj-$(CONFIG_CROS_EC_PROTO)		+=3D cros_ec_proto.o cros_ec_trace.o
>  obj-$(CONFIG_CROS_KBD_LED_BACKLIGHT)	+=3D cros_kbd_led_backlight.o
> --=20
> 2.39.0.314.g84b9a713c41-goog
>=20
>=20

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--odcVidNBJJMq8pOn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCY7xvlAAKCRBzbaomhzOw
wvr7AP45A4cnaoqwvDvwuPbNOBjcutlZ/oV7PC79QbKATqrvXAD+ObBjcJzVrNMZ
Bf/auCjKWyFSCWcPEmFbwGoY9/eV8QE=
=lv1f
-----END PGP SIGNATURE-----

--odcVidNBJJMq8pOn--
