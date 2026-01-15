Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C22E27F72C
	for <chrome-platform@lists.linux.dev>; Thu, 15 Jan 2026 20:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768510735; cv=pass; b=FDjwkwSipab7WoG1a0dmBJGrZjKBM60+lqq1SYVVttwxb7iq7jW1H3KYsUIgPfk4cddmeqbACvwC5hRgiyR304GANCtYWAvQbmq540YjkphEw8bJDFfBKFxJM8zxX1UjQ6QgZ/2ahkhs4rLJmzcnZq4r90vmZXWZEDmA6wSNDl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768510735; c=relaxed/simple;
	bh=aN6gj1asa/7P0fGIQeK2r+Ar66tOkO2hHBCp/S5hpjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NSD2ojZRoyyFpQHCARU2SGOICTuowWtW3lfbauITT3mORhZAC/RDO8EbGneqtj3DQZIp8MzobU7rOWo3PIUSdoYw3KK1zEXV7mDKUqDv6ZtYISqVehpGbULYiSm6TMbpTBT2Odw1kuxt5IfNeFKbyb2CSJH03Hdxy2go/peLQ6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mDeP85aB; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mDeP85aB"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50299648ae9so20171cf.1
        for <chrome-platform@lists.linux.dev>; Thu, 15 Jan 2026 12:58:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768510733; cv=none;
        d=google.com; s=arc-20240605;
        b=axi7sFQi+JCH+BagdHDNMzvkkbhjgAC8HoTDwne2mRbkhHGP3QtQGG03ujGeH3MpZG
         h/hBcUwDwQ6/SgyrOFqx8xLdLBMgk+t7ElnORpRcwSWYH9HHU3ItAiga9PSWkySH8/tc
         K0b7k1FMbEuh4lWtpUDs3t5hxeTZaSgNYmIvnRyeeuAhaDhPJYQxZflN58mJ121SGMD/
         TV5gQshXnvffSAW4CtsCFxDrFPrltJw7jbr5G9VAE1kzu3LwX+6tOzK3Hcn1GUGgwCgS
         H2j1DefnqhIC4bSWdtNWdbpbLB63A+zNOdZn7NDeter75Gx1CvjcoUDllK61OYfir0aB
         bJ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aN6gj1asa/7P0fGIQeK2r+Ar66tOkO2hHBCp/S5hpjU=;
        fh=keXLqvjQjAdepMUZDLEFinPMRF+fipRqRHUVCNDinjg=;
        b=XjamAsj1X7XHMhBKTd48i/GZM64t/wpaQUMnlGH8LSFeUTbotoTxPd5GONCbP3b9Kw
         wV7wHq8naR25gHS7tBKbXwx6mr+bFwQ8s0KX9d227HdWDVpfEXfcswruVqZcjlnhgPM2
         gwdRpb8nmMB9dkHFUAzXxWt5nM+hKcfAP8EKHYu7EJhsToCY5GUdc9ehxfdsl2VUr/F9
         4yFijKUmLJRG0WlOqMs+8G22WQeQrLsT0dM3VcYrcj5lBofcdrOScjcrW7mu+qB6SsQV
         pBVQ3HKYD8740RLLjpZ1E7oLw9xBePDRbVFe6Fhvenj+W9jknRfi6drxjPGEoAo8LQtk
         607Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768510733; x=1769115533; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aN6gj1asa/7P0fGIQeK2r+Ar66tOkO2hHBCp/S5hpjU=;
        b=mDeP85aB3RlOD7/I6TknQxNsrcWY/5wy7/rHhALHP9qYmhgtZqG6q89JL/BTxnPqsI
         PyAMfrs8gYLcmFdzF6IGz7aorcRHjolay1ZVZcyzVGctFvnPskPilCzbnmJxwRpnSK4a
         vCnu6UmB0Z9OBHpK9TvB6KOhKduvEmaU9nVgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768510733; x=1769115533;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aN6gj1asa/7P0fGIQeK2r+Ar66tOkO2hHBCp/S5hpjU=;
        b=QMqBouJ5oDFuglBUsg/RA9M6dCKVY7verNf1WBcG7ryKU+c+EvwpkKf4Kl+7CEuwG8
         U+EX/XAkMY5jG201xdf4ZsuyHxxdULSjj2BCm9wGTJR7lglg56XO4sBMP9Jrkz392YG6
         f+YGBSPQquoxOb6Cf5f8D5mgulGDcxwfnT+3de4V6+/RxL5rxVsl3ye+A3aRwXn+bdr6
         0nX2fbzTSPOKZL4U6cv1f8fbaxLXYO5bK0XxPO9hMggHSm2SE815iMGw2WUlZEq+Ifrp
         V+3x3mMYXvJ3rqy1vGkp6aP6ppQMjHEtFiLkxJ/9Heg7JJNMGMRZiXTzchtZcPnIIrlb
         3Bfw==
X-Forwarded-Encrypted: i=1; AJvYcCUWyp0G2qbNOn4vMCejibrxfV1hgFj33Sq9/LDoFY72IIfENAOHXO0qIN0g28iOuhs85Wsf0Au2wXLhL3h+RtQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwClzBhE2ImpLJaJNv4NpRirhrIbtfcZW6ffsKX9EX2LzsX9YDS
	pNF83Z2+IhVJ74kKZfhpJb84DL42S9Mvotc29lRtIxFa859boMBwvQYEMhS0pSxzSlgdcR5bXmu
	VWJLGrmsy/KpS9CfWISawNKudvH4QRyjRt4U1kvLi
X-Gm-Gg: AY/fxX6/QRKf1YT1zYD0YCNYarVe91mBBW30V45XGlB0b6ibqVpj5X08TbR4UaubKF7
	+h7eHGtgvPFEZtjpqo0fmfKEsPZKRAyj+vt1TiKoBhO5q4NKDJC8nSAqljvPj6QMknYJtdNHvRX
	HV0OFY47CiAgEYHhzxykvK1J2GYtIuO1PJm6Ay13Pg3KjEr10Rf9cZ/d9VcGcTRDR4/6G8T+7aC
	ZhKA2ogJXLlclxjng86TcurgOiyT/WYoCXQwF45PjeEHlhXr9q2HuBtq9ACMcB4wlqBYBppdl44
	L5S5grEchM35csOkZwKGNyUUvA==
X-Received: by 2002:ac8:7e8d:0:b0:4ff:cb25:998b with SMTP id
 d75a77b69052e-502a23874c7mr2282841cf.12.1768510732990; Thu, 15 Jan 2026
 12:58:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260115082128.12460-1-tzimmermann@suse.de>
In-Reply-To: <20260115082128.12460-1-tzimmermann@suse.de>
From: Julius Werner <jwerner@chromium.org>
Date: Thu, 15 Jan 2026 12:58:40 -0800
X-Gm-Features: AZwV_QgAvNKXMipZU3vFetTFrWbMaSg3BOdWiKKlVxjbyY9-74HfW16m0dIEsTE
Message-ID: <CAODwPW8g5sn6nJkZbj-rc_7PkgT9qVcQeLg=ARba5w5MQEHDcA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] drm, coreboot: Add DRM coreboot driver
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org, 
	javierm@redhat.com, samuel@sholland.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
	chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Whole series looks good to me in general, so you can call it

Acked-by: Julius Werner <jwerner@chromium.org>

But I'm only really familiar with coreboot and don't have the
expertise for all these DRM interfaces, so I hope someone else can do
a detailed review.
