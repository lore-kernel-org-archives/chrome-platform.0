Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83626538D
	for <chrome-platform@lists.linux.dev>; Thu, 26 Jan 2023 21:01:58 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id m11so2728347pji.0
        for <chrome-platform@lists.linux.dev>; Thu, 26 Jan 2023 13:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=THZwEUQiK9W9hfTlR1IZ+YZoG1qCax7kt7F16wlrB40=;
        b=Ahmsw977aFNqHyqm4z/gvqU5DqUeygTsIIwOiMBTzj6FhS8MmnARtGIdDxKm99UuAI
         j2fGen8A6zintJuq6Vm3vUf8qtQP7ids8K2sfcPQaTfOfKB/5ZlPvLC/wAqNZZ2HVQWl
         u3QKfw69dENs801qrCSkoUMe2HsRiJgz5uQHtpwlsf9GatdC/B5lGpEtntjCmZVbGEtP
         6VHyPt4PfV1lHUqCfPWaUz1vwHBBpkJUEGTiupxCsQFv0zz2/narzT622eb5c+JejqwK
         ZsFFhZVFkwZfL8BKcmR/xl4ciMxkkNeVzh/P8pZI4MSpCEv8tJOM5qpyuduE4IiypOsj
         jrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THZwEUQiK9W9hfTlR1IZ+YZoG1qCax7kt7F16wlrB40=;
        b=x+5ajNMBuMx9jBfGjsHVKXeSKgats9Qjz5NTrWtQ5oMkt/9/qno7KTWNb9u/xg1hsn
         SKtj3i+3rXOaxttfsKm1fjP9p+vmJbVYF5U4HnOxSmzFG3xmP5JoU3WXLi6lw5EQsKZM
         LPzYQn/GaZITbEyb7drTDunMUZuViON/ac81xK8OpeD7595yePQC5NjkiDt9zakOV7+o
         tcmFu1qj+b6ZuT2O/BboyTc7vEMq1oWXnkKfWAbnTa4C85+wmK+sSqEEfqcsJPlYN2vg
         W3WjKo3Wx5sNIJ9ZTopkN7+UdvMyhlKJCYTZRlhU9j4czjlf0SsSuzD+9m5ai41GBtBc
         TSGg==
X-Gm-Message-State: AO0yUKWT29WmcGKuyh5XMDXLswxHIe2FzVkPoQSyRmWaxeUkh1aDkM+Q
	6ZdTKDeP7hXKGw4uN7ixBBD82pJF/JIEEflIUaI=
X-Google-Smtp-Source: AK7set/Mr8D/Oa6Sqze6Rgm3W0ZyHgBtXBXB/aso/XOnTiGV6HoBB5yRn2JnbCfb/j/GQd6vusPCjg==
X-Received: by 2002:a17:90a:690e:b0:22b:b82a:8b5f with SMTP id r14-20020a17090a690e00b0022bb82a8b5fmr1229643pjj.2.1674766917538;
        Thu, 26 Jan 2023 13:01:57 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:cb5e:1d39:8f45:c450])
        by smtp.gmail.com with ESMTPSA id v26-20020a637a1a000000b004a4f24fbce9sm1150978pgc.5.2023.01.26.13.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 13:01:56 -0800 (PST)
Date: Thu, 26 Jan 2023 13:01:51 -0800
From: Benson Leung <bleung@google.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	bleung@chromium.org, heikki.krogerus@linux.intel.com,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: Re: [PATCH 2/2] platform/chrome: cros_typec_vdm: Add Attention
 support
Message-ID: <Y9LqP72lQpu3Jwmc@google.com>
References: <20230126205620.3714994-1-pmalani@chromium.org>
 <20230126205620.3714994-2-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tkjP4j8OLUmOyt4t"
Content-Disposition: inline
In-Reply-To: <20230126205620.3714994-2-pmalani@chromium.org>


--tkjP4j8OLUmOyt4t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2023 at 08:55:46PM +0000, Prashant Malani wrote:
> Add support to retrieve VDM attention messages and forward them to the
> appropriate alt mode driver.
>=20
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/platform/chrome/cros_ec_typec.c  |  8 +++++
>  drivers/platform/chrome/cros_typec_vdm.c | 40 ++++++++++++++++++++++++
>  drivers/platform/chrome/cros_typec_vdm.h |  1 +
>  3 files changed, 49 insertions(+)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index 1abb471840d5..71f5d7d8e055 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -1015,6 +1015,14 @@ static void cros_typec_handle_status(struct cros_t=
ypec_data *typec, int port_num
>  		if (ret < 0)
>  			dev_warn(typec->dev, "Failed VDM Reply event clear, port: %d\n", port=
_num);
>  	}
> +
> +	if (resp.events & PD_STATUS_EVENT_VDM_ATTENTION) {
> +		cros_typec_handle_vdm_attention(typec, port_num);
> +		ret =3D cros_typec_send_clear_event(typec, port_num, PD_STATUS_EVENT_V=
DM_ATTENTION);
> +		if (ret < 0)
> +			dev_warn(typec->dev, "Failed VDM Attenetion event clear, port: %d\n",
> +				 port_num);
> +	}
>  }
> =20
>  static int cros_typec_port_update(struct cros_typec_data *typec, int por=
t_num)
> diff --git a/drivers/platform/chrome/cros_typec_vdm.c b/drivers/platform/=
chrome/cros_typec_vdm.c
> index 06f4a55999c5..20515ee0a20e 100644
> --- a/drivers/platform/chrome/cros_typec_vdm.c
> +++ b/drivers/platform/chrome/cros_typec_vdm.c
> @@ -13,6 +13,46 @@
>  #include "cros_ec_typec.h"
>  #include "cros_typec_vdm.h"
> =20
> +/*
> + * Retrieves pending VDM attention messages from the EC and forwards the=
m to the altmode driver
> + * based on SVID.
> + */
> +void cros_typec_handle_vdm_attention(struct cros_typec_data *typec, int =
port_num)
> +{
> +	struct ec_response_typec_vdm_response resp;
> +	struct ec_params_typec_vdm_response req =3D {
> +		.port =3D port_num,
> +	};
> +	struct typec_altmode *amode;
> +	u16 svid;
> +	u32 hdr;
> +	int ret;
> +
> +	do {
> +		ret =3D cros_ec_cmd(typec->ec, 0, EC_CMD_TYPEC_VDM_RESPONSE, &req,
> +				sizeof(req), &resp, sizeof(resp));
> +		if (ret < 0) {
> +			dev_warn(typec->dev, "Failed VDM response fetch, port: %d\n", port_nu=
m);
> +			return;
> +		}
> +
> +		hdr =3D resp.vdm_response[0];
> +		svid =3D PD_VDO_VID(hdr);
> +		dev_dbg(typec->dev, "Received VDM Attention header: %x, port: %d\n", h=
dr, port_num);
> +
> +		amode =3D typec_match_altmode(typec->ports[port_num]->port_altmode,
> +					    CROS_EC_ALTMODE_MAX, svid, PD_VDO_OPOS(hdr));
> +		if (!amode) {
> +			dev_err(typec->dev,
> +				"Received VDM for unregistered altmode (SVID:%x), port: %d\n",
> +				svid, port_num);
> +			return;
> +		}
> +
> +		typec_altmode_attention(amode, resp.vdm_attention[1]);
> +	} while (resp.vdm_attention_left);
> +}
> +
>  /*
>   * Retrieves a VDM response from the EC and forwards it to the altmode d=
river based on SVID.
>   */
> diff --git a/drivers/platform/chrome/cros_typec_vdm.h b/drivers/platform/=
chrome/cros_typec_vdm.h
> index 003587525554..95a6a75d32b6 100644
> --- a/drivers/platform/chrome/cros_typec_vdm.h
> +++ b/drivers/platform/chrome/cros_typec_vdm.h
> @@ -7,6 +7,7 @@
> =20
>  extern struct typec_altmode_ops port_amode_ops;
> =20
> +void cros_typec_handle_vdm_attention(struct cros_typec_data *typec, int =
port_num);
>  void cros_typec_handle_vdm_response(struct cros_typec_data *typec, int p=
ort_num);
> =20
>  #endif /*  __CROS_TYPEC_VDM__ */
> --=20
> 2.39.1.456.gfc5497dd1b-goog
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

--tkjP4j8OLUmOyt4t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCY9LqPwAKCRBzbaomhzOw
wsZ4AQDKIk7k/b3AVO7PL8o9ZD8KSnDq0XSlrruiR1oU4UiV8AD/SYVC/7nIUgn5
zRqN+PlpFmHO67C3cOpY55O8nRae/gY=
=p74d
-----END PGP SIGNATURE-----

--tkjP4j8OLUmOyt4t--
