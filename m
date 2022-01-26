Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914543FCE
	for <chrome-platform@lists.linux.dev>; Wed, 26 Jan 2022 21:16:02 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id s2-20020a17090ad48200b001b501977b23so5509717pju.2
        for <chrome-platform@lists.linux.dev>; Wed, 26 Jan 2022 13:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=snb6ImlvFMlL8729xAl7c15SXdTuHJz97vqA4rZ0yEQ=;
        b=g/mbXuqQVnZG2O8fYQeUEUG65xC5RXRtPMc1ROs6+J5qJehKJMCbWJvjXCwhTL3YHh
         tHAAEWE3+R/VrJ4TK7Q/j+Ag+171IsgLbv7iOGhwdbRjMtXNv+lg1FUwxDmMkqXMZId6
         V9UkzQDSrP44gE7/QXEwBXQR7fhxDHKHbkezxbFh7rJSgkcQ3p34PL3KlMFMkFyUpsPz
         4s2KYAdWEeeucMFpub0BCMe8Qt+3Ney5HpUxW0PpgYCBb+m/D/TU2twozjWVi88v5RmN
         R4+Q6rZP2LcDHNPpD9nWK1RCqTQCEsQHQ4N99aKrZ05kIAHcvVuyksfyYjMwR1qSBqCc
         oxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=snb6ImlvFMlL8729xAl7c15SXdTuHJz97vqA4rZ0yEQ=;
        b=gNzLBztdHfxGjrW+JufeRNqjs8AgVUNMn9DZdZOsyyFf0XQpgaNE2K+htn1GnQz6iN
         NFlTiGrvWJRKbz1titPfY1TtGDy3j2fLv7soOsZaeRQ6bShgr0s8AMba5v+0yFrxA7fB
         odd5vkZ8hAyPSatziVY/Jl3NxZNg6HiSvng85zzUfDpxnDgnkF4NbktX3CXux/Hsx5TP
         mUJk4A9x72iAfMW1S9rI0LNJL3zQbFEjGPl1DHTBhhL25FLEF1YJTdGGFGZXBsZ0c5FQ
         1Hi23tSR2vK00H3ECF+p42rk6Ui1v+ur3jpBNkASv4knhgmDk8IRxt9AiDuVDtjbJc2m
         VNqA==
X-Gm-Message-State: AOAM531FfIO8ubpqD9bWCjU1UktEbAl0Uqt9xXYzwkbhPSorXAhHUZQx
	+2pR9vzVWtXD431NhKpi97IfNA==
X-Google-Smtp-Source: ABdhPJzk8ipOD/COOxTVfbCiV2gk+famEKm5ERNk49I4vYqumxFIm+oVULq1MtYJoGxZGMub0+NOWQ==
X-Received: by 2002:a17:90b:1c87:: with SMTP id oo7mr832132pjb.114.1643231761713;
        Wed, 26 Jan 2022 13:16:01 -0800 (PST)
Received: from google.com ([2620:15c:202:201:7499:b258:18ee:819f])
        by smtp.gmail.com with ESMTPSA id t14sm3864040pjd.6.2022.01.26.13.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 13:16:00 -0800 (PST)
Date: Wed, 26 Jan 2022 13:15:54 -0800
From: Benson Leung <bleung@google.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: chrome-platform@lists.linux.dev, bleung@chromium.org
Subject: Re: Test delivery and start the archive
Message-ID: <YfG6CoNvimCFfc8j@google.com>
References: <20220126201430.4mcvrxe5camd4s4m@meerkat.local>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nRnKd6mgpQcmVXGQ"
Content-Disposition: inline
In-Reply-To: <20220126201430.4mcvrxe5camd4s4m@meerkat.local>


--nRnKd6mgpQcmVXGQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

On Wed, Jan 26, 2022 at 03:14:30PM -0500, Konstantin Ryabitsev wrote:
> Hello:
>=20
> Initial message to test delivery and start the list archive.
>=20
> -K
Received! Thanks so much for setting this up!

Regards,
--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--nRnKd6mgpQcmVXGQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCYfG6CgAKCRBzbaomhzOw
wruwAP4g5BD92Bhuatu7NZNUejNc8fl/AtG+uCHHeuA6mhIAfgD/dXoISg72RMOH
LN7x0Wkf9zNioHunCKA+XpfFUE1UAA0=
=+6WI
-----END PGP SIGNATURE-----

--nRnKd6mgpQcmVXGQ--
