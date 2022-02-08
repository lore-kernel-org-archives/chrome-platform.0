Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED9D2F27
	for <chrome-platform@lists.linux.dev>; Tue,  8 Feb 2022 19:22:33 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id i17so110198pfq.13
        for <chrome-platform@lists.linux.dev>; Tue, 08 Feb 2022 11:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UHiwMBQmec+N97KOodr45Eaci5XXOZ3CLvB0wqnkTBE=;
        b=gx78wvcP/xtx3ixA17CLVN/xPosDin1SvP8cuPUl9t7+Isj1i4xCuOrL8bNPqlRk6f
         UxzlnfsQsqVMqRs0ZFndxsx8oqHyVfeo/GaoganJhPIq5Yd7V3X3zMl+mWNMdH2vYDHt
         GH0LkO/uR0DcU2Cw3kJzvGQjqsxMlJDPzV+Ccwd1Qs6GzrRlvOqgRZbl7NNngQTQme7a
         Qsx4ZoEnYQ37GqttUEYiZzt0N4x+HOR64le3cDDWLc97YLOtc2RL+ujle3mCdA5eF8OD
         t2Q1u9vscurRBeR9F2yjvNiglcgizvTuwtEeoLXQcqC0N8SzrUSm/6JKh0hYZzfGeNg3
         inyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UHiwMBQmec+N97KOodr45Eaci5XXOZ3CLvB0wqnkTBE=;
        b=lrxj+vOZn6W9ogASKrMqyo1DM3bpz2FKKP+DVnptGTxAWb3974KrwsfdQ5tV36koM2
         6jm6F+sNH1p2HfzbgIluZCQHhc+pI4yTMF0VHmXiQt7PrI7seqGowmrMB3UipFwBGLkf
         MGjSbz4NxONeJml6p2VQe9PDIzHQ2TqRYP+GXirLKMWrq1r3OpcAIAwNVM2W3TSWgiJp
         G5F+JCCu72JKUmmCcNuGAMVXGC+hKVEddQdnnEhxZPdhA4ioOPQOfJ1em4LLFpBd954X
         BWcYYZkjhUpLUCMgylfRKQpOMV/+SjOSJ2j56g6HRZNcJ3KNU+JHTqTEsOPMVKgwaLkb
         b52A==
X-Gm-Message-State: AOAM530by+81JznBRueX4EtNp8+8thLvZe1fZtnzM/HGc/Jf0N7PvbzG
	Vbu194JEjN82+KCJbhEWO+4gnA==
X-Google-Smtp-Source: ABdhPJxFxBU745usl8AxFr3QNQAJI/ZY9KReUb3512zMvSEe5Py8g1mdXbC4+YNZT9bhRqbS97B0Xw==
X-Received: by 2002:a05:6a00:1150:: with SMTP id b16mr5846653pfm.57.1644348153059;
        Tue, 08 Feb 2022 11:22:33 -0800 (PST)
Received: from google.com ([2620:15c:202:201:8e00:959f:eb2f:89fc])
        by smtp.gmail.com with ESMTPSA id p4sm277853pgh.53.2022.02.08.11.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 11:22:31 -0800 (PST)
Date: Tue, 8 Feb 2022 11:22:26 -0800
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: broonie@kernel.org, cychiang@chromium.org, bleung@chromium.org,
	alsa-devel@alsa-project.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH] MAINTAINERS: update cros_ec_codec maintainers
Message-ID: <YgLC8trl9L30Ofwn@google.com>
References: <20220208031242.227563-1-tzungbi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EYCneR3bHevFCBY0"
Content-Disposition: inline
In-Reply-To: <20220208031242.227563-1-tzungbi@google.com>


--EYCneR3bHevFCBY0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tzung-Bi,

On Tue, Feb 08, 2022 at 11:12:42AM +0800, Tzung-Bi Shih wrote:
> Updates cros_ec_codec maintainers.
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>

Acked-By: Benson Leung <bleung@chromium.org>

> ---
>  .../devicetree/bindings/sound/google,cros-ec-codec.yaml          | 1 +
>  MAINTAINERS                                                      | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/google,cros-ec-codec=
=2Eyaml b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
> index 77adbebed824..c3e9f3485449 100644
> --- a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
> +++ b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
> @@ -8,6 +8,7 @@ title: Audio codec controlled by ChromeOS EC
> =20
>  maintainers:
>    - Cheng-Yi Chiang <cychiang@chromium.org>
> +  - Tzung-Bi Shih <tzungbi@google.com>
> =20
>  description: |
>    Google's ChromeOS EC codec is a digital mic codec provided by the
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 568152aa9973..a1f4fd15e770 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4573,6 +4573,7 @@ F:	drivers/platform/chrome/
> =20
>  CHROMEOS EC CODEC DRIVER
>  M:	Cheng-Yi Chiang <cychiang@chromium.org>
> +M:	Tzung-Bi Shih <tzungbi@google.com>
>  R:	Guenter Roeck <groeck@chromium.org>
>  L:	chrome-platform@lists.linux.dev
>  S:	Maintained
> --=20
> 2.35.0.263.gb82422642f-goog
>=20

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--EYCneR3bHevFCBY0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCYgLC8gAKCRBzbaomhzOw
wjivAQCm86EOuf8EiBIvum7dUEufsdutArt9C3zy92ghKFaZ9wEAplKUR8Y8Dc5y
Tb+P00hCjfI6CLzKw/3JiokxIu4sEww=
=XJ8Z
-----END PGP SIGNATURE-----

--EYCneR3bHevFCBY0--
