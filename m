Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E4720F0
	for <chrome-platform@lists.linux.dev>; Tue, 11 Apr 2023 06:01:42 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1a273b3b466so15085ad.1
        for <chrome-platform@lists.linux.dev>; Mon, 10 Apr 2023 23:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1681192902; x=1683784902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f3fHOUjjVpRuchICYRn4mGmYxqOxWbJLXmRYc5HVef0=;
        b=EN1t9rc6Lel+1NR7rTv8mGKegu8qkV+E7Tj1NEf+wQu1mleVogQDXSvPTJb25ZTFLy
         6MOgeXg7mljr77lhjRJBYifytXURRm0l6MUaa+VJ7h0BbY3sFDKf2OiKBsnnXC2lthJZ
         8MdU4oc6LG0NHo43+IPNYcYgwOE27nHXHOoeQknbDF6X2lT9KuOCu78dav3+5UokWtwR
         +iGHObpIKg8+gSrEw2HHpq6h8H8mFqoZuDOAHCX7cOll9zIcHmu/+b+YT1GcogJHvFL+
         Pvx3tQ1HFSXf/ioWbxXAF99yQ/Ms4FNzbX5vCrwmGSgfzVmyaCX4ihSB+yZUa8upUxUr
         +5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681192902; x=1683784902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3fHOUjjVpRuchICYRn4mGmYxqOxWbJLXmRYc5HVef0=;
        b=MRV8z5pk7Y3kejwB3jsEiFVLScf8hr9G0Qa9gt//JZ6VYTk6FQE8sqH37RgnFjEZZt
         HEGYFtFlUHRLzTVasEiOFek1RVFAkFSRh6/6kb+vjhMYOZeA5PZbUvE01l0F/ZtZkJRA
         1Mr03K7RhwSukJkouu+iJ11VfnkSG3lMChEPl+pfoiHF9pQV7p3DnROzuvrF/DQryQUv
         oK4f1M7jNV0DVxc6Thu5wuR7rLJIKk/kSmGkfZwtZn5aGUuijOS3ZORQR25tAuVc/mQq
         93DyWb60OWfBR/bRdlcl7DbZTqLbzyuGhwHreCn2JDUioRvevSWdK24l7dPhcYOd70s4
         jzxQ==
X-Gm-Message-State: AAQBX9eT6xRkWwMYr38yp8HQi53im6Pc/96ul9gFsuxYnmVha4EDM2Sx
	HKVPvVsBVV0U/SrDp0KU9BPJVw==
X-Google-Smtp-Source: AKy350YAquOnjhYmTfdza3GIu7Tve6VB9MI28igjUxC429rV6bCr0w8x7yNfJYb4qm0Qh+7LEdNsow==
X-Received: by 2002:a17:902:eb45:b0:1a5:2716:3930 with SMTP id i5-20020a170902eb4500b001a527163930mr120342pli.7.1681192901812;
        Mon, 10 Apr 2023 23:01:41 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7145:f9a:166d:426f])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902a60400b001a1ed2fce9asm3716459plq.235.2023.04.10.23.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 23:01:40 -0700 (PDT)
Date: Mon, 10 Apr 2023 23:01:35 -0700
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev, robbarnes@google.com,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_debugfs: fix kernel-doc warning
Message-ID: <ZDT3v5CqcHR/2641@google.com>
References: <20230411053308.1572493-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="or+h/aDxP34cPxW1"
Content-Disposition: inline
In-Reply-To: <20230411053308.1572493-1-tzungbi@kernel.org>


--or+h/aDxP34cPxW1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tzung-Bi,

On Tue, Apr 11, 2023 at 01:33:08PM +0800, Tzung-Bi Shih wrote:
> Fix the following kernel-doc warning:
>=20
> $ ./scripts/kernel-doc -none drivers/platform/chrome/*
> [...]
> warning: This comment starts with '/**', but isn't a kernel-doc comment.
>=20
> Fixes: 14bb09b32f43 ("platform/chrome: cros_ec: Separate logic for gettin=
g panic info")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
> I should put it in my checklist in the future before pushing patches to
> for-next.
>=20
>  drivers/platform/chrome/cros_ec_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform=
/chrome/cros_ec_debugfs.c
> index 414ebfffcf83..c876120e0ebc 100644
> --- a/drivers/platform/chrome/cros_ec_debugfs.c
> +++ b/drivers/platform/chrome/cros_ec_debugfs.c
> @@ -400,7 +400,7 @@ static void cros_ec_cleanup_console_log(struct cros_e=
c_debugfs *debug_info)
>  	}
>  }
> =20
> -/**
> +/*
>   * Returns the size of the panicinfo data fetched from the EC
>   */
>  static int cros_ec_get_panicinfo(struct cros_ec_device *ec_dev, uint8_t =
*data,
> --=20
> 2.40.0.577.gac1e443424-goog
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

--or+h/aDxP34cPxW1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZDT3vwAKCRBzbaomhzOw
wkaVAP9GECNQc0KP8V8DtqY0HEF0G+bD4VLvbnLustwLXaa2hAD/ZrlZIxIEreEr
TdkWxs2VoIccLdMP90dfDklCXlFF2wA=
=fHhh
-----END PGP SIGNATURE-----

--or+h/aDxP34cPxW1--
