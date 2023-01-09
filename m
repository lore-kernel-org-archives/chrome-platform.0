Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC798C09
	for <chrome-platform@lists.linux.dev>; Mon,  9 Jan 2023 19:42:16 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id bj3so6652102pjb.0
        for <chrome-platform@lists.linux.dev>; Mon, 09 Jan 2023 11:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ydmzchxyNR+IqB33c0jWFlmVpBQ7+XVQgnYYMSL8I6g=;
        b=jJpQzHlTSQsFi3n9cFfzVW1NWhX8e/c/p0uH6A3AOU7JnJmK3r4pNZZOp5JlymTU+t
         zaANHLXB2rmILVpmAhvASLkFD6lG9tbgZUrj+zWui1JpisYdQPaYdpevHtXqR/QRbaZY
         KroO310n78o9aeKhYcIuJsXPyFlsJN7fevtxrC0XfFKIdaKOlvjj6tqYPRTWxboWlyki
         5X+az/nXmpddA6BbV3sN8sqAPA5oGd3njpycrXCbAcy4l8VDZbhD2NN+SQcMS1nPFmMd
         mYlp/9723BeNtFpHdDo2wKq+djxxfzclG5StDBEfaoBJYkYtgeuHMCRg8wpFYgm1jfAe
         r+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydmzchxyNR+IqB33c0jWFlmVpBQ7+XVQgnYYMSL8I6g=;
        b=v7hFHnwRucBzkkOgqFH1dC5FnwcEu5ne/oFayyCXSMr7y+j0/VtSDX2srE5H/23RSB
         Q0mFQ46lrLsBL0oNNKoWWcmJbbQu19O4VVxGJL1mc7Sk3aJltsK5hBnQe3pa1D2ef9o4
         wH+yvQkB/7m/zbcDGfLFks7XsTS7Gqe71Ip9INACJRwpVFLeezMB6pM9xYz67tWGZ+RS
         W2Le9u7OLosRlTUSX2VKD+5iD1bLnGLg1k/vGhQMytxAUG5GJy3BJkw4Scx9xBh5EihU
         uHT5KV1RjcgPFVVyvKQVIvQ08pbZAS718GLFFAw/gbB4295y4VC/H2aZmOe2x+sdtFMH
         MzfQ==
X-Gm-Message-State: AFqh2kptNJ6dw1UXwZKma62ghjxqVQ6z0/Zokl/asaSjCAy1orSytLjD
	3iEf/F+bP7YKB7AajGeO9Mc0b1fryHCXlJoo
X-Google-Smtp-Source: AMrXdXuAYx5/bXE9mxYxFY1+P8b3f3U7d1zPlfl9lusfmfAMG0NCDq+Ap03P0QfGw+CnF3IV3rY+0A==
X-Received: by 2002:a17:902:9346:b0:192:8a1e:9bc7 with SMTP id g6-20020a170902934600b001928a1e9bc7mr678043plp.0.1673293335845;
        Mon, 09 Jan 2023 11:42:15 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:3529:30e5:d581:6e80])
        by smtp.gmail.com with ESMTPSA id o17-20020a170902d4d100b00189d4c666c8sm6506350plg.153.2023.01.09.11.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 11:42:14 -0800 (PST)
Date: Mon, 9 Jan 2023 11:42:08 -0800
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
	Stephen Boyd <swboyd@chromium.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: Re: [PATCH 03/10] platform/chrome: cros_ec_typec: Stash port driver
 info
Message-ID: <Y7xuEDPwbMQ29mDE@google.com>
References: <20221228004648.793339-1-pmalani@chromium.org>
 <20221228004648.793339-4-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NN1+a3FMy7XRMBpl"
Content-Disposition: inline
In-Reply-To: <20221228004648.793339-4-pmalani@chromium.org>


--NN1+a3FMy7XRMBpl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 28, 2022 at 12:45:06AM +0000, Prashant Malani wrote:
> Stash port number and a pointer to the driver-specific struct in the
> local typec port struct.
>=20
> These can be useful to the port driver to figure out how to communicate
> with the Chrome EC when an altmode-driver related callback is invoked
> from the Type-C class code.
>=20
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_typec.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index 001b0de95a46..bc8dc8bd90b3 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -45,6 +45,7 @@ struct cros_typec_altmode_node {
>  /* Per port data. */
>  struct cros_typec_port {
>  	struct typec_port *port;
> +	int port_num;
>  	/* Initial capabilities for the port. */
>  	struct typec_capability caps;
>  	struct typec_partner *partner;
> @@ -78,6 +79,8 @@ struct cros_typec_port {
>  	struct usb_power_delivery *partner_pd;
>  	struct usb_power_delivery_capabilities *partner_src_caps;
>  	struct usb_power_delivery_capabilities *partner_sink_caps;
> +
> +	struct cros_typec_data *typec_data;
>  };
> =20
>  /* Platform-specific data for the Chrome OS EC Type C controller. */
> @@ -408,6 +411,8 @@ static int cros_typec_init_ports(struct cros_typec_da=
ta *typec)
>  			goto unregister_ports;
>  		}
> =20
> +		cros_port->port_num =3D port_num;
> +		cros_port->typec_data =3D typec;
>  		typec->ports[port_num] =3D cros_port;
>  		cap =3D &cros_port->caps;
> =20
> --=20
> 2.39.0.314.g84b9a713c41-goog
>=20

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--NN1+a3FMy7XRMBpl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCY7xuEAAKCRBzbaomhzOw
wj+iAQDtMZ3B1KQCAs2iQXnCSW345geepG6lz0sfCgM1KnGP5AEAq6NhnPEoJHYG
duYb+Hur+DFRDISsE4dXY7k4gg0V/wQ=
=OrDg
-----END PGP SIGNATURE-----

--NN1+a3FMy7XRMBpl--
