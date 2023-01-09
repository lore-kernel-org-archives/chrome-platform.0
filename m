Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75548C09
	for <chrome-platform@lists.linux.dev>; Mon,  9 Jan 2023 19:45:52 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id s67so6632000pgs.3
        for <chrome-platform@lists.linux.dev>; Mon, 09 Jan 2023 11:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=btvsUbB53Fx2/CaDCMvOO7/DXUDwDM/Zif+ZIWmMPhk=;
        b=ZdTUj/qEswZKNnh0B+GEasVjdRySBRZQ6uwTOnKXhdV7wNVgB/Hb532AUTLmg5k/IO
         d9FXX0t1+HjQHPpqqLaVy9g3hLBTnvNssEMxbOQJUBm67NoC8/ZK9R4Uxsjr8bhXW7eA
         PPxyA48AulXMSLwmAAtSABDueHxq0O5R35kd6d3ID649BTBqBhMfXj+679TsdbeKs+FL
         615wnOHyWxpAtA8Qht3zlR1P5UJPPItTNc4V6KBA5VdZWl7E2ppL4xt1ClyZLtW/xxgK
         WoB9LdnEWQG0l1nflfklXz/UQkspd3YMpAJA2sx+S6Y+Mkd2wrea+wJygIsJ0avGfCIK
         Mr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btvsUbB53Fx2/CaDCMvOO7/DXUDwDM/Zif+ZIWmMPhk=;
        b=jku5joqBYr5OIpNYuiFmSsWRwPXWKM9777RJLH6xeEjmfDtK2+/OCDXzf5itpN+3VR
         M3v5qdDELz2IXx8xI27nx3J/v11lmVVG8TdFCWvthCy8OLythQTyeYRK/5njAGQzElaf
         MRnHEoF9N9ZHVardNNml1CKjSfKu/4GKsS3BvVBwe+Q1w8AQqm5myDPE7/vQOVMB/8DK
         7oo49w5cG1yQdrbzX87dYJJypTzEcuyF1+wbJhuCXHDdEQQ90SC/dP1Nb6opl5nMI04s
         O0iObIvpfxm7apJBAPUlJBlqGqJV5YIxoAy6PFDUV/Hv70CC0nbpFRf8Xo98Ptmgp9AK
         libQ==
X-Gm-Message-State: AFqh2kq8ms4OHelLz1/VB4b4apf6TTHbae9JW/tfMJChrZl/vr6YWqYN
	wtK3YL8rZ1sqQsJnmdQhYP/HOQ==
X-Google-Smtp-Source: AMrXdXuBCw74dvZhfFbNwXx0UuAAwkVu8pA0Fu9D1NHHsnTXwYR5gBfMZbkCJe/u9xVfHI0RaUP8bQ==
X-Received: by 2002:aa7:973c:0:b0:574:8995:c0d0 with SMTP id k28-20020aa7973c000000b005748995c0d0mr747032pfg.1.1673293552015;
        Mon, 09 Jan 2023 11:45:52 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:3529:30e5:d581:6e80])
        by smtp.gmail.com with ESMTPSA id v126-20020a622f84000000b005775c52dbc4sm6357795pfv.167.2023.01.09.11.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 11:45:50 -0800 (PST)
Date: Mon, 9 Jan 2023 11:45:44 -0800
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
	Lee Jones <lee.jones@linaro.org>, Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: Re: [PATCH 05/10] platform/chrome: cros_ec_typec: Update port DP VDO
Message-ID: <Y7xu6OlfrurOHDkw@google.com>
References: <20221228004648.793339-1-pmalani@chromium.org>
 <20221228004648.793339-6-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="05WXZqm7LieS+vmi"
Content-Disposition: inline
In-Reply-To: <20221228004648.793339-6-pmalani@chromium.org>


--05WXZqm7LieS+vmi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 28, 2022 at 12:45:08AM +0000, Prashant Malani wrote:
> The port advertising DP support is a Type-C receptacle. Fix the port's
> DisplayPort VDO to reflect this.
>=20
> Fixes: 1903adae0464 ("platform/chrome: cros_ec_typec: Add bit offset for =
DP VDO")
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_typec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index 05dc5a63af53..665fa76e2416 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -27,7 +27,7 @@
>  #define DRV_NAME "cros-ec-typec"
> =20
>  #define DP_PORT_VDO	(DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_C) | BIT(D=
P_PIN_ASSIGN_D)) | \
> -				DP_CAP_DFP_D)
> +				DP_CAP_DFP_D | DP_CAP_RECEPTACLE)
> =20
>  /* Supported alt modes. */
>  enum {
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

--05WXZqm7LieS+vmi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCY7xu6AAKCRBzbaomhzOw
whrmAQDM/48X/TaF0wFGfPfGcFm1P1Lcmz0XRaJ22AKTY9cZ8gEAvfdFzUay7awv
nKN6iYyBvlZWE35rg5Bxjk6dQT2diQU=
=7BPi
-----END PGP SIGNATURE-----

--05WXZqm7LieS+vmi--
