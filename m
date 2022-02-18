Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902C74C73
	for <chrome-platform@lists.linux.dev>; Fri, 18 Feb 2022 19:28:48 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id l73so8674782pge.11
        for <chrome-platform@lists.linux.dev>; Fri, 18 Feb 2022 11:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to;
        bh=BauREvK2ZlylIpubfsMx6iAZl0KAgFd3q7lv2ntvRDQ=;
        b=VMIzk/LG7mPxFaFr8DSd13nTV4dfv16/BTmW6GZGw1LfhlEtalV1cldqoaI2UkJK/C
         sdwC1ZXgl/5nlCvm7FNsOdTBeQqzOqENbDNklGExRHhvR7ul8bQO8pMNTRdi8dympfz2
         94T9c0yqPE0AVHV9bB5dfvuXE1U93uvJ47nufj2pew39IVDhhyc5Sf5OpRKXtztNxbsI
         u4fQBI8MrhMU/nYZbvtf/CTJWbLaHnCRbpOhjdvEVLiAk6pWrnUR2c4MgAZsm9vcI4WI
         PBQSL5sp9vxE5sCWfQohVBJF0yRH9sK4eMtPcX/IO3C1+O8C3g1l3g6OpokOVRTu+DUF
         m/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to;
        bh=BauREvK2ZlylIpubfsMx6iAZl0KAgFd3q7lv2ntvRDQ=;
        b=Y56sjUpiZ3FINedvZMDEEISvTwdHESTBhAA8iF3zRWQi9vVcCfvQ0WWKAmnrgb6FHw
         Pqtxrcd+jdKwnnr786UQKbTpw4up1KQ4iPrn1mtfNHb+0vCNpFEBqCm/1VGjQJV8VjYX
         Ape5+xS14e6Cj5ZxiJX8fIjeE0FZfgfBsKwbL3iL7Qer5xcA+DfRZT28yE99CXNzUi79
         eeFklZk1JxQVPQptNqDO+dP7T2HXUSlIW7WRx8p7awA4CdjmB0XM7TaBpsM1Wyt8QcWa
         QUo6cXr6uXHJCATTbqvV+7SBQcOf0dmZLbOajRcYUCl4apzEs1H2zS3rLL6A6q2ktSFv
         zPfA==
X-Gm-Message-State: AOAM531UIQA/SjCxEGcl87b6drqiMI378zjeWBSgqNZ/GgaLbqmmw5ND
	79wpUAVZ547LFcoNpF5n16Sgqse/ikJUAA==
X-Google-Smtp-Source: ABdhPJxE5/ZquTVyKTuteWwQVkx/HZPjtk+j5Q8j/aa7bQJARh8TW/keQI70dW3tHCcE7pCI5c8wLQ==
X-Received: by 2002:a62:ab09:0:b0:4e0:d967:318f with SMTP id p9-20020a62ab09000000b004e0d967318fmr9357165pff.86.1645212527681;
        Fri, 18 Feb 2022 11:28:47 -0800 (PST)
Received: from google.com ([2620:15c:202:201:f0e:4aa7:e49d:40ba])
        by smtp.gmail.com with ESMTPSA id q22-20020a17090a2e1600b001b9c387d0f5sm147029pjd.28.2022.02.18.11.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 11:28:46 -0800 (PST)
Date: Fri, 18 Feb 2022 11:28:40 -0800
From: Benson Leung <bleung@google.com>
To: groeck@chromium.org, Tzung-Bi Shih <tzungbi@google.com>
Cc: chrome-platform@lists.linux.dev, bleung@chromium.org,
	pmalani@chromium.org
Subject: Re: [RESEND PATCH v2] platform/chrome: cros_ec_debugfs: detach log
 reader wq from devm
Message-ID: <164521240287.1963972.16232509625422372.b4-ty@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aHEhdIU/mtCPNiHd"
Content-Disposition: inline
In-Reply-To: <20220209051130.386175-1-tzungbi@google.com>


--aHEhdIU/mtCPNiHd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tzung-Bi,

On Wed, 9 Feb 2022 13:11:30 +0800, Tzung-Bi Shih wrote:
> Debugfs console_log uses devm memory (e.g. debug_info in
> cros_ec_console_log_poll()).  However, lifecycles of device and debugfs
> are independent.  An use-after-free issue is observed if userland
> program operates the debugfs after the memory has been freed.
>=20
> The call trace:
>  do_raw_spin_lock
>  _raw_spin_lock_irqsave
>  remove_wait_queue
>  ep_unregister_pollwait
>  ep_remove
>  do_epoll_ctl
>=20
> [...]

Applied, thanks!

[1/1] platform/chrome: cros_ec_debugfs: detach log reader wq from devm
      commit: a9e896f70fbe2aa1df588e31f0a7d8b604e9deb7

Best regards,

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--aHEhdIU/mtCPNiHd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCYg/zaAAKCRBzbaomhzOw
ws0mAQCZpUirozVYcFwkHuJSW4OP6hF1rg04banmbb2wwCojpQEAx1SfSCvjrR3G
weRh6Gfy8VbFmyfoxOcxbCLBsdpAwws=
=DpfI
-----END PGP SIGNATURE-----

--aHEhdIU/mtCPNiHd--
