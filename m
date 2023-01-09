Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDC38C09
	for <chrome-platform@lists.linux.dev>; Mon,  9 Jan 2023 19:38:35 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id z4-20020a17090a170400b00226d331390cso10842695pjd.5
        for <chrome-platform@lists.linux.dev>; Mon, 09 Jan 2023 11:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zqcorDaesNPZpzpHYqsyJjDWld3f4vWy8ymddi6+5Ck=;
        b=jmV1jNzCKoWqckeDEQ1H+b8qDQvzqbwC24lwo82MQMDsobTqG1j24JP0Z1Osj7dVCF
         AmVdIR7ci4zB/s9W8PPONSD68WZn8LEQQ2cTC11XGYb2LO5ySDoqCVFXIpmfZF54DqSD
         gOLfU/HEke3StZagS0RrTrJWu9G1KYbItHPXoj+Mo+XsfC9W8X+rstvoIYvP/CdV/ifq
         vMTJFm7AT/BmAjR8wYwAcefOTugp6QXiLOGV0MDS2vCLj+403EyCDUk/3CXaGYY+xv29
         gJslPtm5Fi7psZLkWDceAGCtRVEUvcJiVxiQ4OaFkiBqU86u7AqJcpAOQ1nTgFG/JGJf
         zroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqcorDaesNPZpzpHYqsyJjDWld3f4vWy8ymddi6+5Ck=;
        b=xjCxuEf6UjcL/V29cSQUQSbqXLHUriuEC4S37/pQldcNDxYnezdezjdix52g6y2kZ9
         1sdM67D3KNp/863G788mxJE3a2DEaWfL67XS9j9SSeh40w6mZRe48zHC+XREhJPvxFIa
         DgDTrZiiHzgjeveP/MwqtV2lwcxQ92HH71nZGbD9j39CVv7s/f4fPazYPwwGWu2b/vb3
         O1lhcoIaxAz+Rv9B+1vOZxqHiOJwPUNLStZxP9oBbcGD+vKj40Bdy2KFo8ch/qrn0tGo
         VQHljkUvEBpNqIr8b6k2VvGCHx46ghTlRuhLEvg0lHBhaxZFljR3ldQ7GsbWwrMVFfSS
         jBDw==
X-Gm-Message-State: AFqh2krNfRRD+U0j07Ula5Z3SLAjXwRp/RBZU5Q3uDAlVMOVzYeeRBd8
	K+VVhIJFU2xLSLRcJJuFBJ23rw==
X-Google-Smtp-Source: AMrXdXsYAfvSdlSjVukM++u1bX3tI9f+GUP90GjibWKTDrjNpbsJjyadzAwfK9KIVL76i3Vr1SeFHA==
X-Received: by 2002:a17:902:b946:b0:192:6bff:734 with SMTP id h6-20020a170902b94600b001926bff0734mr670859pls.2.1673293114869;
        Mon, 09 Jan 2023 11:38:34 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:3529:30e5:d581:6e80])
        by smtp.gmail.com with ESMTPSA id d17-20020a170902ced100b00168dadc7354sm6530260plg.78.2023.01.09.11.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 11:38:33 -0800 (PST)
Date: Mon, 9 Jan 2023 11:38:27 -0800
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
Subject: Re: [PATCH 01/10] Revert "mfd: cros_ec: Add SCP Core-1 as a new CrOS
 EC MCU"
Message-ID: <Y7xtM8SKaz/di1mX@google.com>
References: <20221228004648.793339-1-pmalani@chromium.org>
 <20221228004648.793339-2-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pdpsTrxAiTvMU7u3"
Content-Disposition: inline
In-Reply-To: <20221228004648.793339-2-pmalani@chromium.org>


--pdpsTrxAiTvMU7u3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 28, 2022 at 12:45:04AM +0000, Prashant Malani wrote:
> This reverts commit 66ee379d743c69c726b61d078119a34d5be96a35.
>=20
> The feature flag introduced by Commit 66ee379d743c ("mfd: cros_ec: Add
> SCP Core-1 as a new CrOS EC MCU") was not first added in the source EC
> code base[1]. This can lead to the possible misinterpration of an EC's
> supported feature set, as well as causes issues with all future feature
> flag updates.
>=20
> [1] https://source.chromium.org/chromium/chromiumos/platform/ec/+/main:in=
clude/ec_commands.h
>=20
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>=20
> While this patch modifies drivers/mfd, it would be preferable to submit
> it through the chrome-platform tree, since that eliminates cross-tree
> dependencies for the series of which this patch is a part.
>=20
>=20
>  drivers/mfd/cros_ec_dev.c                      | 5 -----
>  include/linux/platform_data/cros_ec_commands.h | 2 --
>  include/linux/platform_data/cros_ec_proto.h    | 1 -
>  3 files changed, 8 deletions(-)
>=20
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index 344ad03bdc42..02d4271dfe06 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -64,11 +64,6 @@ static const struct cros_feature_to_name cros_mcu_devi=
ces[] =3D {
>  		.name	=3D CROS_EC_DEV_SCP_NAME,
>  		.desc	=3D "System Control Processor",
>  	},
> -	{
> -		.id	=3D EC_FEATURE_SCP_C1,
> -		.name	=3D CROS_EC_DEV_SCP_C1_NAME,
> -		.desc	=3D "System Control Processor 2nd Core",
> -	},
>  	{
>  		.id	=3D EC_FEATURE_TOUCHPAD,
>  		.name	=3D CROS_EC_DEV_TP_NAME,
> diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/lin=
ux/platform_data/cros_ec_commands.h
> index 5744a2d746aa..7c94bf5c8f05 100644
> --- a/include/linux/platform_data/cros_ec_commands.h
> +++ b/include/linux/platform_data/cros_ec_commands.h
> @@ -1300,8 +1300,6 @@ enum ec_feature_code {
>  	 * mux.
>  	 */
>  	EC_FEATURE_TYPEC_MUX_REQUIRE_AP_ACK =3D 43,
> -	/* The MCU is a System Companion Processor (SCP) 2nd Core. */
> -	EC_FEATURE_SCP_C1 =3D 45,
>  };
> =20
>  #define EC_FEATURE_MASK_0(event_code) BIT(event_code % 32)
> diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/=
platform_data/cros_ec_proto.h
> index e43107e0bee1..a1f5b6d6db3a 100644
> --- a/include/linux/platform_data/cros_ec_proto.h
> +++ b/include/linux/platform_data/cros_ec_proto.h
> @@ -19,7 +19,6 @@
>  #define CROS_EC_DEV_ISH_NAME	"cros_ish"
>  #define CROS_EC_DEV_PD_NAME	"cros_pd"
>  #define CROS_EC_DEV_SCP_NAME	"cros_scp"
> -#define CROS_EC_DEV_SCP_C1_NAME	"cros_scp_c1"
>  #define CROS_EC_DEV_TP_NAME	"cros_tp"
> =20
>  #define CROS_EC_DEV_EC_INDEX 0
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

--pdpsTrxAiTvMU7u3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCY7xtMwAKCRBzbaomhzOw
wkixAQDtaWf7A/7oLyeHoq9KF2j9ocTf7B4YH0t8MKaWMjovwgEA3AJKyA/l9T1V
3kaZihZ0OTn1RFyXnvaW+MN5n4M/3g8=
=A+fw
-----END PGP SIGNATURE-----

--pdpsTrxAiTvMU7u3--
