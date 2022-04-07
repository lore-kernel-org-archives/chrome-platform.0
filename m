Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3642570
	for <chrome-platform@lists.linux.dev>; Thu,  7 Apr 2022 17:09:19 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id j8so5538971pll.11
        for <chrome-platform@lists.linux.dev>; Thu, 07 Apr 2022 10:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+Cg1pUySQC4X4kBYk+LJTlgqyGdH2p2daDW19hb2yNA=;
        b=WOsUq3SlF033ixeQW0PYz1silnSsmCb4wzQqxZHnZOCDj2RxPdRr+wEWvW2TRnvdYc
         +Tdf0RWYgStx77KCZOTyjia4y2D4SrbYXy0H5/rS1hfnTudlxD9WP+yMWGRnMAHhQz5H
         k+COor9aKkFhtNrr2zuCpGP/vejeRd0y4NuHJoz/ApsEwjmr5vY7gN62t/UtRBemCI/d
         RvVvuydMRJc6XoRkrBCTizHXSLDqv4Cg1lo5iJy+Z8vjRVZo/pPl/Wlx9kMiDGww9QL5
         +vbbank+1QmSmmTm2E6+j9UvoCJ0DN7/EYC0L3xEDS/BceQwTcUlN6PH9vKhYxvZgwA7
         gJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+Cg1pUySQC4X4kBYk+LJTlgqyGdH2p2daDW19hb2yNA=;
        b=6my709mKqIJWrpnn4vMAzsRgsyL3jGmHNCGDP+s56NBYEAoSpYZ+Vnq2HeMKG0GoTg
         QPxe0gbr21JYhKoB3xeZUbioHfvO/aovREJMUlayksbqmzaiM2ULwOLcJiBnN2OH26Xx
         VQLBUsGLJIp9uOnmwtuWuoi/TnIfAYbSeRpxIZ1eObptcov2CULMmHQW4K9tUROQmQTi
         dCtPxf+T9wNhlhJoS4rVcCopdw6OI8EyznwyI6f5cjyKNX/UlMMLp6Mf7A5RgWkWsVlt
         /3o/0Y8GhFIkLUPAto25kcqdoQpKnS4icTrdhjd6t8X+Vqy3F1uYVrM5kDLg/OwU6GZY
         M/gA==
X-Gm-Message-State: AOAM531uKS45rOijUxwDZSnhMoGdNPZ4yb6Pwyoi1jL2FReN5PCEjkZ2
	XFZpz0NMnaDO7WvIMOLdF4nBEw==
X-Google-Smtp-Source: ABdhPJzFbbZRjQ4KAGqhfkp0QX1gl/REeFotcLI2QoTCFdL4TuVkM/xDjQzjLLGesBR91Cxx39cPVg==
X-Received: by 2002:a17:90b:124c:b0:1bc:369b:7db5 with SMTP id gx12-20020a17090b124c00b001bc369b7db5mr16823881pjb.179.1649351358878;
        Thu, 07 Apr 2022 10:09:18 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:3a11:864:6d11:d714])
        by smtp.gmail.com with ESMTPSA id z5-20020a056a00240500b004e15d39f15fsm23672403pfh.83.2022.04.07.10.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 10:09:17 -0700 (PDT)
Date: Thu, 7 Apr 2022 10:09:10 -0700
From: Benson Leung <bleung@google.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Guenter Roeck <groeck@google.com>,
	Prashant Malani <pmalani@chromium.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	chrome-platform@lists.linux.dev, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Check for EC driver
Message-ID: <Yk8atphiUdlU0gPO@google.com>
References: <20220404041101.6276-1-akihiko.odaki@gmail.com>
 <Yk4DGZfpYbK8dofL@chromium.org>
 <CABXOdTcY3w56hc7kWsDLxKU-c6fCLYt_jigK13tKjjm9OHi2+w@mail.gmail.com>
 <033c1ec4-4bee-a689-140c-9694dfee435b@gmail.com>
 <CABXOdTet5ynSXf94qMimobJF4LLzHc89cVbwJ5NuAz8G6jmVdQ@mail.gmail.com>
 <0fdba110-8743-3b2d-cb30-3a89b7cfa592@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="viQeAp1xsC0BfER1"
Content-Disposition: inline
In-Reply-To: <0fdba110-8743-3b2d-cb30-3a89b7cfa592@gmail.com>


--viQeAp1xsC0BfER1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Akihiko,

On Fri, Apr 08, 2022 at 02:03:52AM +0900, Akihiko Odaki wrote:
> If I read the code correctly, the registration itself happens synchronous=
ly
> and platform_device_register_data() always returns a non-NULL value unless
> it returns -ENOMEM. The driver, however, can be asynchronously bound and
> dev_get_drvdata(&typec->ec->ec->dev) can return NULL as the consequence. =
It
> would have a call trace like the following when scheduling asynchronous
> driver binding:
> platform_device_register_data()
> platform_device_register_resndata()
> platform_device_register_full()
> -  This always creates and returns platform_device.
> platform_device_add()
> - This adds the created platform_device.
> device_add()
> bus_probe_device()
> device_initial_probe()
> __device_attach()
> - This schedules asynchronous probing.
>=20
> typec->ec->ec should be pointing to the correct platform_device as the
> patched driver works without Oops on my computer. It is not NULL at least.

Can you provide more information about your test computer in this case?

Is it a Chromebook running stock firmware (if so, please let us know which
model, and which firmware version it is running).
In the past, we've also gotten some reports from people running MrChromebox
custom firmware on older Chromebooks which have exposed other bugs in
this driver.

Let us know if that's the case here, and where we can get that firmware.

Thanks,
Benson

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--viQeAp1xsC0BfER1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCYk8atgAKCRBzbaomhzOw
wmvhAQC0z35R8BEqy4d5pAQ7va0d1etqr1514DiP+ue65mnFZQEAvqbl4NnrC8Hb
OmwQDepne2orty0TN9Oc7qQwZyc2vQY=
=Rr0T
-----END PGP SIGNATURE-----

--viQeAp1xsC0BfER1--
