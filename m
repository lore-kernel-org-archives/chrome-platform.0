Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3742C80
	for <chrome-platform@lists.linux.dev>; Thu, 27 Jan 2022 16:45:05 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id h20-20020a17090adb9400b001b518bf99ffso8067510pjv.1
        for <chrome-platform@lists.linux.dev>; Thu, 27 Jan 2022 08:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to;
        bh=WiG8e4rFhf3TAlPr7MXRtjgD0oBCA9X+CmBmQI1Z8BM=;
        b=tcEHUtmXrDWlHm/yOPUWB6afp5YSifkZAJgM5UKd5Rdb7+ZSPfQjkD1UjsQAYkmnIE
         R98PAnasU0HP7DZkcc7LcoNOyAYVrHdARTqqMvy9zdnYnId42F1NgZCWdPCJJaZhpy4V
         Zp+TcIsKQVgT6qH4C0Ki8VfXgkx8+rUbfbqJG7VflEIRZ0svGs1lAnYDUlh6Xnipbmwm
         /0OMmUVlXnZksA0KRtPIMgSLu/A/1QHWGzXxc7Krk4aIxQrfkx/5WjP9DlWuo6swJbId
         PuJ0Pm4whgoT4LNR9DqZqzvD0DHmPIoEOJ4fSPx78kXhgIqMia3yLR/xtjRBhAXrowIE
         xmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to;
        bh=WiG8e4rFhf3TAlPr7MXRtjgD0oBCA9X+CmBmQI1Z8BM=;
        b=sIjjwSzcEI6n2piUW+aE5MAwx8+LvfK6WvknNmDrLpAAuN8EXzLqSCG0BxnvwR+H0l
         WOn5m2n2Q5c3wjtAXg2DNLEkppyaTjBlbziyq34ronWiJlfzAQUHRoIbrAuJpp3WqvSt
         sdSIRiIEl6p0d35/3zlw5W6hvIdUI9sQ7hrxs7x75N+rrimkz2KmQ/n/1zwJZ/E1zJPl
         FdkMGpre1BU9kwZtUkjKPCw0yUvXPrXSip2Z9eSpts2he0jIao9pVpQ3HsAaoH18wdtG
         smiHyNMcE0HUfp/ETbt2aNdmr+sJJDIzKl6l/JtOcsMgjRT34uFMbEJM/+qWAnwIm84q
         zy4Q==
X-Gm-Message-State: AOAM530414CBIV0bqtJJpNTq8mVZaFRjG7pjW3LieqSp+DElfB9qjKMu
	Upz3AAmL6q/dl60xfuADlojXpw==
X-Google-Smtp-Source: ABdhPJwnt99Hy7hFh3oGiEC1FitCeWH1wk49aL6d8IF8AcSgbFZnUmnNqnIhVhbrTa/m8kAPTHcT7A==
X-Received: by 2002:a17:90a:9908:: with SMTP id b8mr14638416pjp.125.1643301904503;
        Thu, 27 Jan 2022 08:45:04 -0800 (PST)
Received: from google.com ([2620:15c:202:201:7713:237d:48f3:f690])
        by smtp.gmail.com with ESMTPSA id mn2sm3178870pjb.38.2022.01.27.08.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 08:45:03 -0800 (PST)
Date: Thu, 27 Jan 2022 08:44:57 -0800
From: Benson Leung <bleung@google.com>
To: Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev
Cc: bleung@google.com, pmalani@chromium.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: platform-chrome: Add new
 chrome-platform@lists.linux.dev list
Message-ID: <164330181439.2996990.7235316022532021501.b4-ty@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E1Fh8DIqhPrTlsFd"
Content-Disposition: inline
In-Reply-To: <20220126222233.2852280-1-bleung@chromium.org>


--E1Fh8DIqhPrTlsFd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 26 Jan 2022 14:22:33 -0800, Benson Leung wrote:
>=20


Applied to for-next.

[1/1] MAINTAINERS: platform-chrome: Add new chrome-platform@lists.linux.dev=
 list
      commit: 664de6a26b7f17eebca896c3e18201b15d5c7b19


--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--E1Fh8DIqhPrTlsFd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCYfLMCQAKCRBzbaomhzOw
wmhTAQCIRyO9gXLKbcChHnl054jF5HaMDq61VMVJilowCGIEPAEA6HbrVq6aKYel
2kCSQn/+iWgT5f2Gy1ZjYlNE2xk1DwU=
=pIDh
-----END PGP SIGNATURE-----

--E1Fh8DIqhPrTlsFd--
