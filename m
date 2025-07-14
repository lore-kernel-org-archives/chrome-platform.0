Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FB7242913
	for <chrome-platform@lists.linux.dev>; Mon, 14 Jul 2025 09:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752486088; cv=none; b=sXVKxk/bVp580wW9jtm3V7FA8192651mIoN1sZmKaAOCXVVm7+Fh5bSg6a8pO8d2T1vxT3aWmWuLEJ0WINt4JPj8ZS4V88ctVOLVqlmH5caflF7D0UsUF51ozbXYdUfEQEdHDkt0RTjaWgS9EUA5UTMTgSgtubgcWXlDEQDN1VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752486088; c=relaxed/simple;
	bh=n5Lu5XOTpaqQw3NG6XcbWaT2VD/8k0H91jd32Utli2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pav0kL+PX0w7Hpi9gsHlSiD8LdKfKSdZl1QtxHudBcxxyrDVZjfF40O4U0Qomt+d/iVBFR8cclw+w2VsM5bDUTPmqFoJY3NYS5yHPcgj+N1K0FFB7ol/i6/Jdv44mWS4GTo9MryLQAbK81QW7+YrLLOufdc7eYnzJWirRnnFkMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=patUxY5u; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="patUxY5u"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-531426c7139so1647779e0c.2
        for <chrome-platform@lists.linux.dev>; Mon, 14 Jul 2025 02:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752486085; x=1753090885; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SU1pXquz5m17ppHnM/H5OXudY9qX0uavP0UPxLh54JI=;
        b=patUxY5uMKx489IWee5kh4UgHvCKNCresZdF0WKf//OtJ0z25XUDut0hwfXRKGJzmq
         lcx5LsFkYy78Ff9L392t75m5BTtXGfgL7geuFwCwrdmM5n0G18xg3ao82PSdnBdPKm6c
         exhXeKKMa7z4hVtv+n5HUAgAQls7eqlW/OUt1mRczmfikV+13JBLMyax/W0IQpDsJBRj
         KVHUUtdD/Sjgk/qGNqPf58rEFbINllF+9cbFBVTeno9JtIPzmikzI27EwonmwCmcL0z8
         nx4LYsYtRl6CeF+GtflxyKfocnPGYjJeQPmcQDzHNqUdsMiAasQOyiu82NDcNh5Z36rS
         lbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752486085; x=1753090885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SU1pXquz5m17ppHnM/H5OXudY9qX0uavP0UPxLh54JI=;
        b=NIvcuoWv0JnmyoNLAr8YO8xAAUpwqcIXLZZX4DQ1l23UO3NsBN26ZlWYCvIU5HsWkf
         Bsw/ZAYpj5M4ayaT7pViyhTMr+zwmXrEENAp46x/KLlRuxVx9QelbxTzQY9nksu7RO0p
         zNDjVTq4oWP4KRPPPT3vwe712eSM8nXOVG6dWOZQIgEpoM+7rcT+4AVKWtbYJG2XBgw5
         mU2iNTle5yIcwGw4zUCCy6KLpNdgR1/PMzNC53LSeG5E7P2RQWVE6UQbXg/6unK4YtUd
         cIm3MYJc78qA2IRlgNriBznv47EsOhrX50LfrHFmda8Ll7Cal5IXH8mYiUWqZluQ5QbF
         Ui5g==
X-Forwarded-Encrypted: i=1; AJvYcCUBKxlHVTpQ84sY5qHhuIvjdsCYw2T2xRvW3Eec9vIdY/XRLOEB2ooBcrWVpdn8EBeZbWqq/reb9xqtUmpqVu0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNmlOpZQPMxbJzJBtksefIl70OCUuPipwnXoBm+HNso4OH6kLz
	+fChLqCPGjlvEiaEbfu5dAEH0NY7yCj2cy/ISFmb9P4QfDoRa2a2ls5HTxVibKIPcw3zLtcYQHA
	aSJF4AkQvgUyS+jONV3/TU28ccY2QkGtNdpiHzX/Q
X-Gm-Gg: ASbGncv8TFsndWrJkXrO+DK6UKjjOApJNaC621S63DJjZ1kbihAdOVr7OYdWjpSx5bW
	0bKz8208WuQSriCoNZuwj/cbq4cgOXuccWYZYh0Atfzv6bbmlHBoeYlQcyakegvkzn+7QT0Dmgz
	41lMDU2IihQDTlmgLF6xSLKLomAyf/81HRigVf3tQYjv9nMKQ7xVs/pPi6a8HnboLKoDfy9cozi
	yqzNVzsyI+Gh5awl5jCWVONwOr4ka85SKb3eA==
X-Google-Smtp-Source: AGHT+IFxSzlutg3Pr/kuJr9QcokjyqheRjaROrcSK0p7vB3ScvIabN1URNDypACOfW+Jtin3u0mNdSX16+UiCvEDj7g=
X-Received: by 2002:a05:6122:370c:b0:530:7a17:88cc with SMTP id
 71dfb90a1353d-535f47fc9f1mr6473291e0c.8.1752486084756; Mon, 14 Jul 2025
 02:41:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250711003502.857536-1-raduvele@google.com> <aHCO3ZqIFYJu2YTn@google.com>
In-Reply-To: <aHCO3ZqIFYJu2YTn@google.com>
From: Radu Vele <raduvele@google.com>
Date: Mon, 14 Jul 2025 11:41:14 +0200
X-Gm-Features: Ac12FXz08eJ_XcNTrForjQEtmhRzOPZ0DdFbUc_mzKvYEq6_AuyQEv2SskrS_Lc
Message-ID: <CACKy9TKdJ=2HBwxJ5AnMCm6xHA1fxtkv-Zqn=Xr4xt-7P0Pn+w@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 1/2] platform/chrome: cros_ec_typec: Add role
 swap ops
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Andrei Kuchynski <akuchynski@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 6:11=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Fri, Jul 11, 2025 at 12:35:01AM +0000, Radu Vele wrote:
> > Add the pr_set and dr_set typec_operations to registered typec ports.
> > This enables sysfs to control power and data role when the port is
> > capable of doing so.
> >
> > [...]
>
> Applied to
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux=
.git for-next
>
> [1/2] platform/chrome: cros_ec_typec: Add role swap ops
>       commit: ab229c2b72c35739e8ffb70af11190ff40f38701
>
> Thanks!

Thanks, please note that in case of the power role swap I started a discuss=
ion
with the EC team to verify the assumption we introduce here (the resp.role
populated by `cros_ec_cmd` should be equal to the target role if the operat=
ion
is successful). During testing I saw that the `resp.role` was not equal
to the target role but the role swap operation was successful (I
verified in sysfs
that the power role is the expected one).

In case they advise that our assumption is not correct we should remove the
assert resp.role =3D=3D target_role for the power role.
