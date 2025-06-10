Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AB91EBA09
	for <chrome-platform@lists.linux.dev>; Tue, 10 Jun 2025 17:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749574825; cv=none; b=cuG64merGQHOdISSEQ2JZnJ+K4u4o22fWwf/8cVS/RlLpmepm7yPCrbDHZTi7PSFfDRpDFqZuiPK34WPJkfLU6hM1YpqD2WIvl+nWBHVHcx+nT/fEsMHM/YhyYvFSXTcCl6ms0jYb35Q3MhI9NKg5x/j/s4HM5lSU5ImQ4rlzqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749574825; c=relaxed/simple;
	bh=9hsZLaU75BjpRptkuBvMUF48vhmBMkkHos8UoQfVNSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bqhyl3l4UR+UnTTrRAOu2LTFVFREHYGiIPOsQhdyFg1iUasllbwiZCXScrUd67irGAEOyUN++hGnxgSj6TZwTfGBy+T5YqZx2rOHAf7gBIUP9daFiaUbfj8lS1Iro1+xV8Zi0fFoNCfAcF9EiUDAjFgFSJq03JB1ePpGwdiiku0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VcfDqivr; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VcfDqivr"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7113ac6d4b3so5590197b3.3
        for <chrome-platform@lists.linux.dev>; Tue, 10 Jun 2025 10:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749574823; x=1750179623; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1CpWx/dhcYFHrMuRqfMn/uLf3NBOzEdKJ7PHmZdNdWs=;
        b=VcfDqivrYqLpvlkKGNlrlwT/5H9CkDpTFsIGvdJ27jnI4OvsaRHkxQlkd0uLPf2aw0
         iFKoJXndDMlcfqMVyvKFEPwwA4mm5KLAvqNEc98tqv6I2YnicB62NB6E8B8UE6OrdNDF
         ighayGIJfEiACfCjbrjziLYg5uFSJDYcG6/p0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749574823; x=1750179623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1CpWx/dhcYFHrMuRqfMn/uLf3NBOzEdKJ7PHmZdNdWs=;
        b=LuTpIQaJad0DhBbRQ3ULxbNtDAkuGoU4ZUxV5V0z6RAyzwk56D2LM9xsQY90ZYvCN/
         ja9E5/FYV+GbQs4RlMGBswy0GcwsTKKl1s8Rf8Hyrv8sl+rN+QFk4QpWu5GMCxwTwr/c
         UedRFs+gNMAhlMVgxOJ8mKSKHHY/FYa4uu4HEhibNdkaoPbC1YCI4n7FGg2P6K5q/EQK
         au3KtoAToKLZ2b66mcSSR5SMpsUEtQJ4Jk8UUuDsyVqaXsom2Fuhor99Jx/7XYp9lNo/
         i5dTItcfLheEtnjgCmPmOplgGj6WIEkWnKQ4RXr2clsyS/LjV2UIt7pV+FdERK1cCkP9
         chYA==
X-Forwarded-Encrypted: i=1; AJvYcCXpVP2JZklYTLq4U7pQ9Ih+CKO7pMWSPeYp0KVx68FwYwrkgnmX7BTy2xIHEpGtrQkIl81EW6aq94RjzL3g7Go=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4HRefEUlxyqeNhF1b2U/LZvOMYUi94mALxJOLh7QrGGhNFETZ
	OGrAAy3Hh1Z/GGzBdTIgq+CKlncgJVlZ4BIVS6XaDA0bQMYPsbflYnjq5lFXWY6exPyJUzEvrsc
	FWVdHzatfLxVBAepehAnliVKdyhfssjeLGkmqlq75
X-Gm-Gg: ASbGnctnKHrj1khaV90YHGH3hJNI3ta0syXea65d4XzdYJn5yKSbR3jP9Ae4pWWJhcn
	BuXpihf56B0QWpptOh7bkkXaSDJNj2b1bW5cx6lVT+gwzW/6FwohKRjmfM9oOe5JMkVJMbMduaO
	aEkyuslL9meNhogwldE67hQsvDVOA/HCPfTGm8uwvG+UYyWoD8xXCbOA==
X-Google-Smtp-Source: AGHT+IE00ce8xDusfDQD3NtC4YowjQLIoj1ZSjHEA05wiN/p3V0Le4pgsgSFjs0cflbETy+V51Wu5cNchYcgN7AsnTw=
X-Received: by 2002:a05:690c:4906:b0:70c:d322:872c with SMTP id
 00721157ae682-711409e4d32mr2975947b3.1.1749574821564; Tue, 10 Jun 2025
 10:00:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250610153748.1858519-1-tmichalec@google.com>
In-Reply-To: <20250610153748.1858519-1-tmichalec@google.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Tue, 10 Jun 2025 10:00:10 -0700
X-Gm-Features: AX0GCFuwttqkyiSf7Z-Y9KrGw93dCiqxmCXC4gASs51y4epRMY_H18lbkfSbcSA
Message-ID: <CANFp7mXZXSJLYTO+2rkn+W6ki_hnzBPJ6s8MwtFFeyPqLbzQ1g@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Defer probe on missing EC parent
To: Tomasz Michalec <tmichalec@google.com>
Cc: Benson Leung <bleung@chromium.org>, Jameson Thies <jthies@google.com>, 
	Andrei Kuchynski <akuchynski@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Konrad Adamczyk <konrada@google.com>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 8:39=E2=80=AFAM Tomasz Michalec <tmichalec@google.c=
om> wrote:
>
> If cros_typec_probe is called before EC device is registered,
> cros_typec_probe will fail. It may happen when cros-ec-typec.ko is
> loaded before EC bus layer module (e.g. cros_ec_lpcs.ko,
> cros_ec_spi.ko).
>
> Return -EPROBE_DEFER when cros_typec_probe doesn't get EC device, so
> the probe function can be called again after EC device is registered.
>
> Signed-off-by: Tomasz Michalec <tmichalec@google.com>
> ---
>  drivers/platform/chrome/cros_ec_typec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index 7678e3d05fd3..f437b594055c 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -1272,8 +1272,8 @@ static int cros_typec_probe(struct platform_device =
*pdev)
>
>         typec->ec =3D dev_get_drvdata(pdev->dev.parent);
>         if (!typec->ec) {
> -               dev_err(dev, "couldn't find parent EC device\n");
> -               return -ENODEV;
> +               dev_warn(dev, "couldn't find parent EC device\n");
> +               return -EPROBE_DEFER;
>         }
>
>         platform_set_drvdata(pdev, typec);
> --
> 2.50.0.rc0.604.gd4ff7b7c86-goog
>

Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
