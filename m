Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E596EB8
	for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 00:27:34 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id t4-20020a17090a510400b001b8c4a6cd5dso653646pjh.5
        for <chrome-platform@lists.linux.dev>; Mon, 14 Feb 2022 16:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GYB1fI0D9nYciFwdD6JzesTCxp+5pmAN8brR7fAFLtk=;
        b=NYZx6FyeL1UAVX/3ox6vx7GmLRlAzYVafPuQkb3hPQUX8qfjFlu7Uq3Ok7jVvkKjST
         SLXaLFK+vJ6FmlcDLcnsd9tshLfQRMPcagZFda2MsTJr0GB4wLB06vkiBINn9neDwdy4
         XbYDRiAaBTLemkLGH2E5mQp6WoiuEen53D8/+g8tBcCXsCaADdLfkebat+zaCNZfT/kF
         j3zaFr06jgaod7L0TuFXLmQ/s7JWZ5195WaedVmVcE6Ym7+umEILwoyterY0hFNBzqL5
         Yv7BLYnzAFXlQpn4qOBxWaFfKCdieh3n3C0F9KIBJgU2Jqmg+pBuELewq5NnOvUJC/u+
         VyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GYB1fI0D9nYciFwdD6JzesTCxp+5pmAN8brR7fAFLtk=;
        b=qoWLRPg6AmTbMKn5ONGZtqlFpd2YA3L9vPVBTOsgly7MLBx9AReAkv78rbE7ixPeLv
         QCEYio1XVyiFq6Hl5Mv31FHYEO2U/k+lUampEZf8w02NcM4uVqHPfa+uWXnC20d8Qds3
         wbuvew+NrURP/1LtBvPg6OEN2y/mrQOOIzqz3UYed4ohjyTiqOAfvkzqtLzDVOK7eL8q
         4JJmWwlj22AJ9lx95QheRxUkKN/eLTfzadegwAr/sGtWZfje46QOZZYntTcl4bTHJ5bE
         FUPK1Ir/wRkIY5dB3C6xlH8qTn+JluaNowAcxpypE3/TnHBb60kol9Y2YIb/XePGDGy/
         hiiw==
X-Gm-Message-State: AOAM531Q4jMe3nTc8MkyVdCbwBvg7t5xL/0eLdeDqLSHv1mbNq+xOcrq
	1Gbc/Bd4d19qKB9z71ZdVi8zBg==
X-Google-Smtp-Source: ABdhPJwj0FJ3FoZR2POBi7bG76fKWAmmfSySxjxP0by9wYaGl3FyQMOX13/KDEhoL1DpjJMUTCunEw==
X-Received: by 2002:a17:90b:1c01:: with SMTP id oc1mr1380135pjb.161.1644884853084;
        Mon, 14 Feb 2022 16:27:33 -0800 (PST)
Received: from google.com ([2620:15c:202:201:f672:8368:e22c:5ae9])
        by smtp.gmail.com with ESMTPSA id a9sm611010pgb.56.2022.02.14.16.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 16:27:31 -0800 (PST)
Date: Mon, 14 Feb 2022 16:27:25 -0800
From: Benson Leung <bleung@google.com>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	"open list:CHROMEOS EC USB TYPE-C DRIVER" <chrome-platform@lists.linux.dev>
Subject: Re: [PATCH v2 3/4] platform/chrome: cros_ec_typec: Configure muxes
 at start of port update
Message-ID: <YgrzbQViMLRTC4XB@google.com>
References: <20220208184721.1697194-1-pmalani@chromium.org>
 <20220208184721.1697194-4-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mcHVd+HjoMipoP7y"
Content-Disposition: inline
In-Reply-To: <20220208184721.1697194-4-pmalani@chromium.org>


--mcHVd+HjoMipoP7y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Prashant,

On Tue, Feb 08, 2022 at 06:47:22PM +0000, Prashant Malani wrote:
> There are situations where the mux state reported by the Embedded
> Controller (EC), might lag the partner "connected" state. So, the mux
> state might still suggest that a partner is connected, while the PD
> "connected" state, being in Try.SNK (for example) suggests that the
> partner is disconnected.
>=20
> In such a scenario, we will end up sending a disconnect command to the
> mux driver, followed by a connect command, since the mux is configured
> later. Avoid this by configuring the mux before
> registering/disconnecting a partner.
>=20
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>=20
> Changes in v2:
> - Change return at end of port_update() to just return 0.
>=20
>  drivers/platform/chrome/cros_ec_typec.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index 3d34ece7f790..3019e29f200d 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -965,6 +965,11 @@ static int cros_typec_port_update(struct cros_typec_=
data *typec, int port_num)
>  	if (ret < 0)
>  		return ret;
> =20
> +	/* Update the switches if they exist, according to requested state */
> +	ret =3D cros_typec_configure_mux(typec, port_num, &resp);
> +	if (ret)
> +		dev_warn(typec->dev, "Configure muxes failed, err =3D %d\n", ret);
> +
>  	dev_dbg(typec->dev, "Enabled %d: 0x%hhx\n", port_num, resp.enabled);
>  	dev_dbg(typec->dev, "Role %d: 0x%hhx\n", port_num, resp.role);
>  	dev_dbg(typec->dev, "Polarity %d: 0x%hhx\n", port_num, resp.polarity);
> @@ -980,12 +985,7 @@ static int cros_typec_port_update(struct cros_typec_=
data *typec, int port_num)
>  	if (typec->typec_cmd_supported)
>  		cros_typec_handle_status(typec, port_num);
> =20
> -	/* Update the switches if they exist, according to requested state */
> -	ret =3D cros_typec_configure_mux(typec, port_num, &resp);
> -	if (ret)
> -		dev_warn(typec->dev, "Configure muxes failed, err =3D %d\n", ret);
> -
> -	return ret;
> +	return 0;
>  }
> =20
>  static int cros_typec_get_cmd_version(struct cros_typec_data *typec)
> --=20
> 2.35.0.263.gb82422642f-goog
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

--mcHVd+HjoMipoP7y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCYgrzbQAKCRBzbaomhzOw
wmsmAP4osevqyWmDrkfwKbxgKbYaAxsyYlmk2daeEsBiCz5oGQD/UjyH6XvZGqrE
1g76TY7mzdZcD9yPVEjWDF8a4xK8lwk=
=3lFf
-----END PGP SIGNATURE-----

--mcHVd+HjoMipoP7y--
