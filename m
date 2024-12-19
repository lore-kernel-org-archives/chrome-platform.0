Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B363DDF58
	for <chrome-platform@lists.linux.dev>; Thu, 19 Dec 2024 01:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734571966; cv=none; b=bNoNRShd9h/gcVWd07fbHL8iUCMjZoeoh7jedkS9/vrZD7fe84zUTdg8z2YxvU9cwWwEE+0Sd3G+FtKjH8WmaeJV9ih3K6rX7oV41Zc11pPc8Jo1aoZrZ8Z93Wy805ZjFfmUdbFkZu3KKcJwUwpQaJU97I8/EkK0rP58jXa07ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734571966; c=relaxed/simple;
	bh=8blMIFWIaRAEoQhTNsLSwyGbfT66ERNtangswkpsRjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2G4+eB/yV1YnPD9UTlbaJbAF/wPYwPSCJgD0AcaIkUJPZ/ZenHnrqqwBmiFP4TvdZBHwSQ6XxAggf3dd0cEAP/fFsLMfNIlirMAZRlIG7nZyMl4QNxcTCzX8Sdlznhfu9jUagcsXaybWNCrbywCZuGOkEgQa5+GK3Yd7vW2PNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zb3QWDgS; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zb3QWDgS"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-728f1525565so355275b3a.1
        for <chrome-platform@lists.linux.dev>; Wed, 18 Dec 2024 17:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734571964; x=1735176764; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Vv5IuBsFycDvduWgc7NHFnRgiZfbZKV4iW9U1gRZ7o=;
        b=zb3QWDgSkeC0C1PuVRd55bbzUpWK43Y7fYppQjBTr2zNocpr1v9nFDWGVo4SkOBJi6
         EUMYsLv+VUP5LTHyWnePJhR2rh3vIX6zeS5Joe0qlsRWC1hQz6avuZPH60ILKZLlG1z0
         3PhxOHKQcJ7Rwjjspmj0MfOVu+n4wTi+9Rdx2i/VU230ggvzB+VXV9Q415fB3G73ElZ0
         1gCo7jUN0hdmWq+TG5NItqPzxQsdWBNzLPzhBK4gYTvr/weBr5PwDjKyYDbw8puxIpo4
         4yzhe2y3kajpCJo0/N6suLV4i1+TouA0mRKNK6k6S5N8tZFiCl8jRLFh/6Jb0Kdbuya0
         jhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734571964; x=1735176764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Vv5IuBsFycDvduWgc7NHFnRgiZfbZKV4iW9U1gRZ7o=;
        b=Fgc29nMcXBCLfadnXv3Th4FFJ4k9hIZ7U7+9G1qR1lKQZK4myR340mjtNXickQ03dA
         8qDeSibfxmYYuy1AF4q61JjglkfBfzVHsPfuEb8sk+FVN4Cw7do4OGx+bNpYWu3oZ2ra
         8T4V3msz+LAqhH45D90TZjsneo3g19k67TG3cEWmKAZfHRFboVo2sflDJdhmiKp21vMn
         1yt7rgrkPnOkTAnIaN4nhk72AbdchSdzw4yrVNwYEig8jXkjjGVnVNE3Odb6U4xq8Gfh
         d3fKGqgzjHZig+QarXm0Nt8Lkwrbckay0GgVA8B72kerK45sfmND1bpD4psQhFwRNMfm
         Ik5A==
X-Forwarded-Encrypted: i=1; AJvYcCVdWsAKl/O3siYMJlcRrNoGpmrFRJgpN1rTkzhZnZL+q+cZvLAWTwX1SOLe3QfPaVwAZMC2lBdErfcNqoZMqkM=@lists.linux.dev
X-Gm-Message-State: AOJu0YynwrDXSXOP4DlZ/iHT+UU0CK7n3nMJQGTlhjrcLfZXxssV7hjJ
	0hoW9UHzYhQSvIOb6Be6EbxodyTY8EGfKjgFEbuXzJIm0G8FAckruHyDOIAyjQ==
X-Gm-Gg: ASbGncsuBnE7CgdMut8omgfWiIB3+vHxaJ+zmU+mRhrlAN7iiVA1dwbG0IJT2ZwYI3A
	g0BIF3lM57UTkqQ8oIQ4E4sgPt3dDT9KLebdJtDNmN7fhQKBSczv1CF4vJdtBD5BBzDn3hLCala
	6/n+0Fxd8eG5cL0/F6v1BLHYYsRZ6MiFmPD+0pZd8GDwCAE5DpPpx8y/ynBZCeUpNrRXMhYrRir
	2Xh2Ys5A2/BQtK5IUtSidQMERMCRfbxq8Y0F0uQTjVzZAmteMGvWo7dFNKkLS7u4OC04MCC5JYJ
	+Rk++WnzAJNT1ED3
X-Google-Smtp-Source: AGHT+IEWdcFyqngpDRkgZRR2/yfs+zFaqpUf2HE7wFRE1geSZItzQFoY3i/znViH3/xvzTMsNpqvIA==
X-Received: by 2002:a05:6a00:240d:b0:72a:8bb6:2963 with SMTP id d2e1a72fcca58-72a8d23edf6mr7811128b3a.13.1734571963776;
        Wed, 18 Dec 2024 17:32:43 -0800 (PST)
Received: from google.com (30.176.125.34.bc.googleusercontent.com. [34.125.176.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad815835sm130651b3a.27.2024.12.18.17.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 17:32:42 -0800 (PST)
Date: Thu, 19 Dec 2024 01:32:38 +0000
From: Benson Leung <bleung@google.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org,
	linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev,
	akuchynski@google.com, sboyd@kernel.org, pmalani@chromium.org,
	badhri@google.com, rdbabiera@google.com,
	dmitry.baryshkov@linaro.org, jthies@google.com,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 8/8] platform/chrome: cros_ec_typec: Disable tbt on
 port
Message-ID: <Z2N3tt8O21-D6Ikq@google.com>
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
 <20241213153543.v5.8.Ic14738918e3d026fa2d85e95fb68f8e07a0828d0@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W8cAO6hx+FSI0lHc"
Content-Disposition: inline
In-Reply-To: <20241213153543.v5.8.Ic14738918e3d026fa2d85e95fb68f8e07a0828d0@changeid>


--W8cAO6hx+FSI0lHc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 03:35:49PM -0800, Abhishek Pandit-Subedi wrote:
> Altmodes with cros_ec are either automatically entered by the EC or
> entered by the AP if TBT or USB4 are supported on the system. Due to the
> security risk of PCIe tunneling, TBT modes should not be auto entered by
> the kernel at this time and will require user intervention.
>=20
> With this change, a userspace program will need to explicitly activate
> the thunderbolt mode on the port and partner in order to enter the mode
> and the thunderbolt driver will not automatically enter when a partner
> is connected.
>=20
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>=20
> (no changes since v3)
>=20
> Changes in v3:
> - Set port.inactive =3D true instead of auto-enter.
>=20
> Changes in v2:
> - Only disable auto-enter for Thunderbolt
> - Update commit message to clearly indicate the need for userspace
>   intervention to enter TBT mode
>=20
>  drivers/platform/chrome/cros_ec_typec.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index 1ac5798d887f..6ee182101bc9 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -311,6 +311,7 @@ static int cros_typec_register_port_altmodes(struct c=
ros_typec_data *typec,
>  		memset(&desc, 0, sizeof(desc));
>  		desc.svid =3D USB_TYPEC_TBT_SID;
>  		desc.mode =3D TBT_MODE;
> +		desc.inactive =3D true;
>  		amode =3D cros_typec_register_thunderbolt(port, &desc);
>  		if (IS_ERR(amode))
>  			return PTR_ERR(amode);
> --=20
> 2.47.1.613.gc27f4b7a9f-goog
>=20

--W8cAO6hx+FSI0lHc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZ2N3tgAKCRBzbaomhzOw
woI7AP4m7+qsKf6OdfCv5MTSwIwsD2yr+IwtWh+s50egADVb0AEAh+bZVfhhc7KK
CacGzufNf3FY6eEErPLaAfAFZ27aDAQ=
=/0op
-----END PGP SIGNATURE-----

--W8cAO6hx+FSI0lHc--
