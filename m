Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C244A0136
	for <chrome-platform@lists.linux.dev>; Wed, 14 Oct 2026 07:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963782; cv=none; b=IeJYhDqjDcAI0ajtlQlrgu+UzauDrVqs0s/X3QO7qiyYW371cMjec1am2pq+a2HsuqRhsxFwZud+c7q9IvYW3dRW8jr3SFci4HC6nwByVSF22tl1EkZ5etKZkRoIE+nKtRd6XRQDneiZhcdSToZhe83+v/f0TK5tXzh9DzSy6/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963782; c=relaxed/simple;
	bh=/LAPMn+LWxuycSEybb1879FRpu0FakFGn+8dsX3zR5k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UzJQrcsL17UTSF7PBiV0mof4Pxp0kJH8L6jt3CdGLwmvyBplAvcd7YN8ykTYrgh/PehiEO01tGQEAabnqQz33Mth1DKaTkR+BjfyJkTmM3dVALsAXmEBGH7Yp1nr2mhL9OASIxbh1dBluCTrxyOyfcYbJHA0ziBk+y0sIFqiOvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hHFR4dh5; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hHFR4dh5"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc795ad1f5aso3667630a12.2
        for <chrome-platform@lists.linux.dev>; Wed, 14 Oct 2026 00:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791963773; x=1792568573; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5L1lZaRwvy+lv6sOFzSh9Dh3O0FNoVx6u5lQ84NrzXs=;
        b=hHFR4dh554MgQlyn0m9YIDIDfZ0XtThovbXmhopLiITX+3ewX64YBLYwv2kc7xSDKA
         Jya60rCGObks7yTPRO8JOy90acsmJrnvkJsnmiDmVLQxP/nVed+d5SoCO1SvRuqqjqJt
         T/faU1Z6R9W1cBiNQJZrTFf30igwXF7PUgfWPtVQEuIvF4KcQamOdgz2kpYpljQI5Oyx
         QSM0c2KvP0zNm0kqIMBD9D5YfYEqBU2r1SLXY0cFoWdD7SMGC+jJDwGafTahjM9pfYyT
         Vljcoon2NJpNE7lSHtZWUiFBllx4gN8drMPD7cWq4ez7Bp2nSgHfxn+QmzcIYegLVz0b
         Vhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963773; x=1792568573;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5L1lZaRwvy+lv6sOFzSh9Dh3O0FNoVx6u5lQ84NrzXs=;
        b=nWELgYARydTF01Rc3pyGQp+/D0kkZ6JVueRYuq1ehddzplF5OOryeMGEvc6V7mtekN
         XpPcke5SU+XUXhmIH7MpyfvZvlslxGuymb3pGJ1xoiTKVYlSY1pjGOYCRVRPIqMxb73P
         O9TyA3WJdAYVuEhIOwPHYnbNHbVvWNtC3Jfn43EzSmObc/K0FMaK2C6SkRaZ15Kzz90/
         vX/xHLYCEaYJmOq0vaEiecBqE/e7bawXGW2FL9cWg03/b4pePmSohw1MZUcU6b/e7Wim
         8a1OsMcvXQ69Y7jJmYpD+hl3c5b1Yqtn+nuwsI0LU0ncxcPQz0xZP2m7aEyD9/+Zhbe/
         Eh3A==
X-Forwarded-Encrypted: i=1; AKwUvBycatxDsYBC2+1FLEdLjtvfL7Zk48ow+sroxeSCzQv9NVi6K1ZPYnOTzt859JoYE/DLDfTpDEshP5Qrm+cNYzY=@lists.linux.dev
X-Gm-Message-State: AFq9FYLwMtvIAb2nrV4STqsEV5nuDhFPMvuc35inrrZqBg5efRTWhgQw
	MIB68jkCd3+Q5As4ztd2dD21EIcc9oJ5NAzVMr93oLC2hhb6Q3gve9SKFBMHsnMTfMSBbdSuBog
	aQY4PovqTsLlAYQ==
X-Received: from pgbcp10.prod.google.com ([2002:a05:6a02:400a:b0:ccd:a8e2:7ab5])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:c885:b0:3e0:d5c0:74b3 with SMTP id adf61e73a8af0-3e16bf265d3mr14483848637.65.1791963772206;
 Wed, 14 Oct 2026 00:42:52 -0700 (PDT)
Date: Wed, 14 Oct 2026 07:42:38 +0000
In-Reply-To: <as8l1oKtNsIwNHWr@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260723163838.1698125-1-sgsatyam@google.com> <amiBVdd1KvxbW5Ul@google.com>
 <20261013105713.1369546-1-sgsatyam@google.com> <as8l1oKtNsIwNHWr@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261014074243.2498612-1-sgsatyam@google.com>
Subject: Re: [PATCH v3] platform/chrome: cros_ec_sensorhub: Modify clock drift estimation
From: Satyam Gupta <sgsatyam@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Scott Collyer <scollyer@google.com>, Benson Leung <bleung@chromium.org>, 
	Gwendal Grignou <gwendal@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tzung-Bi,

On Wed, Oct 14, 2026 at 06:48:58AM +0000, Tzung-Bi Shih wrote:
> I'm not convinced.  I think they should still separate into 5 patches and
> form a series.
>=20
> > > On a related note, is [1] still relevant?  Should we disregard it?
> > >=20
> > > [1] https://lore.kernel.org/all/20260720110405.2127011-1-sgsatyam@goo=
gle.com
> >=20
> > Yes, [1] ("platform/chrome: cros_ec_sensorhub: Fix AP/EC TS wrap") is s=
till
> > relevant =E2=80=94 it addresses 32-bit EC timestamp rollover across dee=
p AP suspend.
>=20
> Please resend or include it in the same series.

Sounds good =E2=80=94 I have separated the changes into 5 patches, included
"platform/chrome: cros_ec_sensorhub: Fix AP/EC TS wrap" as patch 1/6, and
squashed the MAX_DRIFT_PPM =3D 5000LL update into patch 3/6 in the v5 serie=
s.

Best regards,
Satyam Gupta
