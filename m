Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176F423C504
	for <chrome-platform@lists.linux.dev>; Wed,  9 Jul 2025 18:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752087273; cv=none; b=fDCSpdRRWjqmq7KyrfBtoMkIoBCxOQphvvAoNawGCVw/mmpGTA+h0cGj01Ype/j4680dbyWt6bbzZRg2IM6Z9y5w0/MMEqaxBIQW6Dj4bgG4iAxDcaBZ4UEz0bfmcnlWGLvsymXWbNp0sLNAn7LZWI4XfxYahOcwHKYxrAM562o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752087273; c=relaxed/simple;
	bh=/2Cph1WYBxYVx20KUr3H7Ll6bA1dcyTf8kFf2WKUSvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/137RJ1VOZyM5X0KjeOVN0D3r/bsWyJi4vGDifFGULCqv/rgY779w2W1xm1vpBPfm7OmYwluFxjt7USB44xlYNuIyMFN3Z04XeBfGqh/QTR+qIGAdZyCkU3MuydQT6tE3HlEHbJVuo8y4xZTxjQaDV0pzj4FbLSBikSryJkC/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T+oUJMAv; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T+oUJMAv"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so237040b3a.0
        for <chrome-platform@lists.linux.dev>; Wed, 09 Jul 2025 11:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752087271; x=1752692071; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rIMhi3jeGxa0s3nAJlQ56HwnBaYwf7ccfotGT5LQiSA=;
        b=T+oUJMAvneOEmg9IkOUU6XUFCMDCnj+go9uj0E22Ae4p4AprfPGP0L0nLUq4pwCogN
         IldOvwThPfSvA1x6U6RZAE7BeHE4Ao9Lo2B/InQ/6avzqNFokq73bjd1Fl3n0moX3Bcz
         wtElSr/sCGOI22vcbEfKJTBlH2GJSoziahU7Z4SFNenfi38/PEzVc2bmMONO6bEEAEPr
         JaXkRr6+Ciqnfh/XbipKTsGMWBmdx0H+VmJN6B2SuMzMs2sK9Vx1y8Qp0Zrqx9ZiA4CH
         szXQhKCUhbVv/rCEanAJCLPsLD/eO/vK4s9MFBhLbGIraE711RzbhMxPwm0BaIGP0BYh
         nv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752087271; x=1752692071;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rIMhi3jeGxa0s3nAJlQ56HwnBaYwf7ccfotGT5LQiSA=;
        b=HKXarQDd2XPrVPCnShlyEnOfKIddQgKaDdrgMyng8ajzrBah3nKwehI4O9nuswEQ8Z
         QZvQX3Akr22BpfAj61NTvZwZRZnVfc4OR2MvA1Grukk+a40P3RGxHP7e2klpVTC0RMHV
         TPDaHzWzPrmPj5X3tjq6DPNpblnMyu47EhBa7Tsisd6Fm0qQWCBfJXPwDINngw4xuKky
         MSrLjs7YmdyuNVEpxzG1Ex+oyviyqaWGJ7YcpJBX40pdE33xGIh33fQ6QfYUJ5adxUA5
         6pMzOdUE7PQhKt/vqq8Weqxv1lQJ65OpVZBI4CPqEZUj4f/rOLJPoDsiVB32bYZxmJB1
         A5fA==
X-Forwarded-Encrypted: i=1; AJvYcCUbxcizFzvwj9flURl8LyZXv2UJFI9PzaFmdgxEPsPF7Vdj8KK6WW7PbUuSbZ1jyX77odvn9Mh54G7BA0dm2cE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+OWRzWhiOcRz3FT+D/hNVwYKWijodBXgtYg9lX0NI+ZlTqo1I
	bLIDXVhifBt1uyNUOTlcKW66gSx+3dDbKN+A/Eics12Z3yEd6tyMCNcfj351xaC4Ow==
X-Gm-Gg: ASbGnctYh4Rocv24ppzhzsCPDbOxesazwja10dPVeL+mM13pIWlxQKKy8KY40Quqp2T
	rv/XXUlpVy3cSK5A9SBTwSSUig1MNUc7JOuUNnjFTrwtRedbr36Wmo6JkQips7xgvbE2v4lL1jj
	Yiwc7Y0S30SGIYqCKGQ+NrklU4FCTVIf/o16zlKYKJSNtlTKijT/dQjaVuEPLqWyYC+sdB+9D/d
	V/CBYzRwKQy+FQwiLNYM+3ct4Za02Te4hNqf4Xi7Av+QsSOcgWlqC9KNu/NhTWoA4+alyygRtcr
	g6fIr16CtJecmWbePHlKQshd0YzIn85wwDJnHacShfxDRns6mHYgG3Hzxxi+B1OddoXnZyYiFns
	jkC7BVktEZWDB2N91jS9tTYD2zhD+hy8AdsE=
X-Google-Smtp-Source: AGHT+IEsIujYYJQFxxPNbqyPqNVCpNc5ggBV2zGw34le7f+Ey5Jcbps5XsB6muy9L8TmdRt/c+Z1RA==
X-Received: by 2002:a05:6a00:b44:b0:748:3964:6177 with SMTP id d2e1a72fcca58-74ea667e366mr5512476b3a.19.1752087271142;
        Wed, 09 Jul 2025 11:54:31 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce429c46asm15759503b3a.129.2025.07.09.11.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 11:54:29 -0700 (PDT)
Date: Wed, 9 Jul 2025 18:54:25 +0000
From: Benson Leung <bleung@google.com>
To: Radu Vele <raduvele@google.com>
Cc: Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] platform/chrome: cros_ec_typec: Add lock per-port
Message-ID: <aG664X6LuA6eZXXm@google.com>
References: <20250709132232.2475172-1-raduvele@google.com>
 <20250709132232.2475172-2-raduvele@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250709132232.2475172-2-raduvele@google.com>

Hi Radu,


On Wed, Jul 09, 2025 at 01:22:32PM +0000, Radu Vele wrote:
> Add a lock associated to each port to protect port data against
> concurrent access. Concurrency may result from sysfs commands
> and ec events.
>=20
> Signed-off-by: Radu Vele <raduvele@google.com>
> ---
>  drivers/platform/chrome/cros_ec_typec.c | 38 +++++++++++++++++++------
>  drivers/platform/chrome/cros_ec_typec.h |  3 ++
>  2 files changed, 32 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index 289429ef959f..bbb9e02624b8 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -8,6 +8,7 @@
> =20
>  #include <linux/acpi.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/of.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_usbpd_notify.h>
> @@ -54,8 +55,11 @@ static int cros_typec_enter_usb_mode(struct typec_port=
 *tc_port, enum usb_mode m
>  		.mode_to_enter =3D CROS_EC_ALTMODE_USB4
>  	};
> =20
> -	return cros_ec_cmd(port->typec_data->ec, 0, EC_CMD_TYPEC_CONTROL,
> +	mutex_lock(&port->lock);
> +	int ret =3D cros_ec_cmd(port->typec_data->ec, 0, EC_CMD_TYPEC_CONTROL,
>  			  &req, sizeof(req), NULL, 0);

Please declare "int ret" at the top of the block, as per other examples of =
it
in this file.

You have it in the middle of a block right now.

> +	mutex_unlock(&port->lock);
> +	return ret;
>  }
> =20
>  static int cros_typec_perform_role_swap(struct typec_port *tc_port, int =
target_role, u8 swap_type)
> @@ -70,6 +74,8 @@ static int cros_typec_perform_role_swap(struct typec_po=
rt *tc_port, int target_r
>  	if (!data->pd_ctrl_ver)
>  		return -EOPNOTSUPP;
> =20
> +	mutex_lock(&port->lock);
> +
>  	/* First query the state */
>  	req.port =3D port->port_num;
>  	req.role =3D USB_PD_CTRL_ROLE_NO_CHANGE;
> @@ -79,7 +85,7 @@ static int cros_typec_perform_role_swap(struct typec_po=
rt *tc_port, int target_r
>  	ret =3D cros_ec_cmd(data->ec, data->pd_ctrl_ver, EC_CMD_USB_PD_CONTROL,
>  				&req, sizeof(req), &resp, sizeof(resp));
>  	if (ret < 0)
> -		return ret;
> +		goto unlock;
> =20
>  	switch (swap_type) {
>  	case USB_PD_CTRL_SWAP_DATA:
> @@ -92,18 +98,21 @@ static int cros_typec_perform_role_swap(struct typec_=
port *tc_port, int target_r
>  		break;
>  	default:
>  		dev_warn(data->dev, "Unsupported role swap type %d", swap_type);
> -		return -EOPNOTSUPP;
> +		ret =3D -EOPNOTSUPP;
> +		goto unlock;
>  	}
> =20
> -	if (role =3D=3D target_role)
> -		return 0;
> +	if (role =3D=3D target_role) {
> +		ret =3D 0;
> +		goto unlock;
> +	}
> =20
>  	req.swap =3D swap_type;
>  	ret =3D cros_ec_cmd(data->ec, data->pd_ctrl_ver, EC_CMD_USB_PD_CONTROL,
>  				&req, sizeof(req), &resp, sizeof(resp));
> =20
>  	if (ret < 0)
> -		return ret;
> +		goto unlock;
> =20
>  	switch (swap_type) {
>  	case USB_PD_CTRL_SWAP_DATA:
> @@ -117,8 +126,11 @@ static int cros_typec_perform_role_swap(struct typec=
_port *tc_port, int target_r
>  									TYPEC_SINK);
>  		break;
>  	}
> +	ret =3D 0;
> =20
> -	return 0;
> +unlock:
> +	mutex_unlock(&port->lock);
> +	return ret;
>  }
> =20
>  static int cros_typec_dr_swap(struct typec_port *port, enum typec_data_r=
ole role)
> @@ -370,6 +382,7 @@ static void cros_unregister_ports(struct cros_typec_d=
ata *typec)
>  		if (!typec->ports[i])
>  			continue;
> =20
> +		mutex_lock(&typec->ports[i]->lock);
>  		cros_typec_remove_partner(typec, i);
>  		cros_typec_remove_cable(typec, i);
> =20
> @@ -378,6 +391,8 @@ static void cros_unregister_ports(struct cros_typec_d=
ata *typec)
>  		typec_mux_put(typec->ports[i]->mux);
>  		cros_typec_unregister_port_altmodes(typec->ports[i]);
>  		typec_unregister_port(typec->ports[i]->port);
> +		mutex_unlock(&typec->ports[i]->lock);
> +		mutex_destroy(&typec->ports[i]->lock);
>  	}
>  }
> =20
> @@ -472,6 +487,7 @@ static int cros_typec_init_ports(struct cros_typec_da=
ta *typec)
>  			goto unregister_ports;
>  		}
> =20
> +		mutex_init(&cros_port->lock);
>  		cros_port->port_num =3D port_num;
>  		cros_port->typec_data =3D typec;
>  		typec->ports[port_num] =3D cros_port;
> @@ -1232,6 +1248,7 @@ static int cros_typec_port_update(struct cros_typec=
_data *typec, int port_num)
>  		return -EINVAL;
>  	}
> =20
> +	mutex_lock(&typec->ports[port_num]->lock);
>  	req.port =3D port_num;
>  	req.role =3D USB_PD_CTRL_ROLE_NO_CHANGE;
>  	req.mux =3D USB_PD_CTRL_MUX_NO_CHANGE;
> @@ -1241,7 +1258,7 @@ static int cros_typec_port_update(struct cros_typec=
_data *typec, int port_num)
>  			  EC_CMD_USB_PD_CONTROL, &req, sizeof(req),
>  			  &resp, sizeof(resp));
>  	if (ret < 0)
> -		return ret;
> +		goto unlock;
> =20
>  	/* Update the switches if they exist, according to requested state */
>  	ret =3D cros_typec_configure_mux(typec, port_num, &resp);
> @@ -1263,7 +1280,10 @@ static int cros_typec_port_update(struct cros_type=
c_data *typec, int port_num)
>  	if (typec->typec_cmd_supported)
>  		cros_typec_handle_status(typec, port_num);
> =20
> -	return 0;
> +	ret =3D 0;
> +unlock:
> +	mutex_unlock(&typec->ports[port_num]->lock);
> +	return ret;
>  }
> =20
>  static int cros_typec_get_cmd_version(struct cros_typec_data *typec)
> diff --git a/drivers/platform/chrome/cros_ec_typec.h b/drivers/platform/c=
hrome/cros_ec_typec.h
> index f9c31f04c102..d0a8a12ec91a 100644
> --- a/drivers/platform/chrome/cros_ec_typec.h
> +++ b/drivers/platform/chrome/cros_ec_typec.h
> @@ -82,6 +82,9 @@ struct cros_typec_port {
>  	struct usb_power_delivery_capabilities *partner_sink_caps;
> =20
>  	struct cros_typec_data *typec_data;
> +
> +	/* Mutex to protect port data against concurrent access */
> +	struct mutex lock;
>  };
> =20
>  #endif /*  __CROS_EC_TYPEC__ */
> --=20
> 2.50.0.727.gbf7dc18ff4-goog
>=20
