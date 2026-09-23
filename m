Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBF453B321
	for <chrome-platform@lists.linux.dev>; Wed, 23 Sep 2026 15:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176472; cv=pass; b=ECVZrgOkP9ffEFi1rGnISX4ayFTewlFHbtcupEPvyZy39qPV0SNwZlnxiMVHXI1Sanl75UHkn+tC0vNLBjAQuN9YXN70X2kDUBFwEwURN/gnMXaRWzxRP6c+PawKQt6wVw4RyYVsVdPFmEE6SxStObBQAwa+5tzxFrh/QIu8BLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176472; c=relaxed/simple;
	bh=GWWz5uyS/VWndEpl4fzi11VijBLfDed1qPxmM2bna+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bzhs2pqTPbCnvUuYGDKzduZdm1c40waKEgGZqUS5Do1tTDXTKJNa220LyScV0I/UsvIM64yo5HqI814gBReWv4YJZP/gw+XrWPxGTN7VrwKaPt+KMZEPYNtFQ5Xnnh8FLTIFBQ6stw27QcS/aq9H0hFzo393BO87ou1LALUqRXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qRfDq2VK; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qRfDq2VK"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-895eaf31683so16206307b3.0
        for <chrome-platform@lists.linux.dev>; Wed, 23 Sep 2026 08:14:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790176470; cv=none;
        d=google.com; s=arc-20260327;
        b=BmIIqMJEmBYZBfL7bkA1JqZOE8T2ZPttQPUaeVo6F6UM/LzU42DC1AoRra9qCuFMx6
         cm7f+RRApqkZ+m5x65Txj8DzlaUAl+ZY9T4fNZjPB2G6BGsVV3G2E/tE59e72rlyal0E
         UNsCdLBEaTC0wlMojprsc6QRP3POXSBem49w/IAG0Ai4OctUefFDxUk7qkvoVkI8Vi95
         y6xHPrxfRZ3UpsNztekE3QK0+bh2VLg4i8iJi50yh/cqdaCCaEBqZt/lpvAqRSVkw3te
         w0eSBn7aw/ZVXMOqH4PX6FfxLrSqeOGMd7wS9TI73tBXKv5b0J70PAxKVFzE9TDJzOgO
         I76w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GWWz5uyS/VWndEpl4fzi11VijBLfDed1qPxmM2bna+k=;
        fh=yHqwwXao6q7iDeBpsEPl8+JAbncsnK5mUcUdlNlkYdI=;
        b=i6A7haqLlX6VBGB2v2+sj7DqK0s9EBe1oyPlPV2g93O9Wd7lkPUn1MZ5mc9bEJD7u5
         zwa21IGkuW/w1zXjuynqwWYLoyxs5vb2WBoYoYzmpSEJhdW3n4qwLEVOkgnzF5Nylsbg
         IE3mfSwjGBMJzBgKNXTjwvMGE943aM/8di2g6mfjVvCd8hRrXK0p30JpcDIg6XV66ZVW
         WMmXfJeFTk3taeLTTNo+pwuOR70ZWhnZdk8//jXBz9QBjcdMc3cC/30w39O0sPpjj22b
         /7TeGdzrmWUIkNzrZsGD3DQzLiBt26ef0TujHG9+/WVGU+lwZsiE5Qs5Ru1Y3ZCjdPiJ
         h8gw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790176470; x=1790781270; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GWWz5uyS/VWndEpl4fzi11VijBLfDed1qPxmM2bna+k=;
        b=qRfDq2VKKfSiPbHkwfospChjtoCPidEAngVz4wVNAwYT6RTvK++/cVptaMdi7M0czj
         GeEtB5uTBdqd/NA8CIzYxRm5RD6HMVeKbl0IzFRD5TQc28UugQcS1FHHF/JurOpNgoAm
         PDorZfa/a2ZlL7AQ2pP07+NXfY3kRYVV2nauEt+xLmB2jJus0pxp13Cg1+sO5qF/ptFf
         AEQa8LgapWiSRi8xxXBk/XbvCemfsWVbcQSzgc6GRBgSCjd1uWJGeewf/0Z4ZstluKYZ
         1ufmZ8WGh/8IbDS+JtpXsdN8+Wzouz3pIWZgJIwjCCnQcUmND9ycUnS+aU7Y8NVdDG3m
         FaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176470; x=1790781270;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GWWz5uyS/VWndEpl4fzi11VijBLfDed1qPxmM2bna+k=;
        b=AynxMcWTso6ww6xWj8w0LVl8b358K/Z2lEyiossAFwIGLc7LeSlYBJCk6iRP08q5Rc
         PdRmuSmZmSAgjhlMrqbXR77S/TRNf6xtUWEKgyvvEPP7OPUYKcK+0Fowli7Otvcz00UD
         iuBDre0qB3KM0/8cqJAE15oqm1wrAGspQ2H9y4+aDlsfMK6b+AZ079rDVWRFlg9JZwRC
         1PzEPkACxT2r9bKrKf+K7CTcilsaIxmN+TteNIsb8nSn2jJjzoGj8s/16kMv5KEhA0oq
         fHEuuDlOkpm+uhLSxR4kY7JP/nDXUbEckXcLPnqb5V2Da2jDTmTNnWDeoanYC0NtdRaT
         8+HA==
X-Forwarded-Encrypted: i=1; AKwUvBxrkoTKtBmqew9iRxoExquK54QNcsZ+3xkZCFwtYwONuIrx5Qu1PNyc6GcCFKP+jTjprvA78V1drTxDuSUMpSw=@lists.linux.dev
X-Gm-Message-State: AFuF++l2WmW2o7zBFt7SvqMLG/pca8oWDuAYA2rd8z9uDNisQVk588B6
	TVYCgX95zeExZoD3bBGm0dPsBQ7zROeK/Ztwe1mJwZkA57rjc/64byRIaHSoncklzwI3P70Uvn0
	0B2LP6pMgnTOP2H8PUgJmA63BTmoxOYE=
X-Gm-Gg: AYBFou0Qho0FTpPjVbDvPcf4P7cZi/uhwZdtvsM7YkaoSjygLjXOyLIo3q/fgohUiH4
	9yM8HWEVtRoFzZdU00hVd0gJuZSJ69lk2gV1TJfNUO2w989ghq5nYVy1WelAql1ciTt9MtwD9Dx
	pWR5EXiHsjjnFOKNiwd9HQV8fBmhzqZrmbUpj2FplH8C6gppj76VOQQPyYADUApYAuEIIuhyBVr
	8YudIGiDPgiOPVulIZLseW10OXlB6urgsEozpUhix/cXmD1jWjtYdkKwOjdghAvfWeSB1yrinXz
	wxKVFRp2vjFEEkyStY6Lc+7rSX3YBohLYnr+p2uTv00EKAIIRNFxVriH+QPnOkXq5A==
X-Received: by 2002:a05:690c:6b01:b0:873:5c6b:a310 with SMTP id
 00721157ae682-8a45c07ddd5mr16272367b3.62.1790176469619; Wed, 23 Sep 2026
 08:14:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260825120929.13168-1-matt.devillier@gmail.com>
 <20260828142318.1881516-1-matt.devillier@gmail.com> <apToX3Paxb5sdClO@google.com>
In-Reply-To: <apToX3Paxb5sdClO@google.com>
From: Matt DeVillier <matt.devillier@gmail.com>
Date: Wed, 23 Sep 2026 10:14:17 -0500
X-Gm-Features: AcwNN1VrVHs8b4nTCmQU43U2FA0ufWHGKGX8hbBzHr1ThxK4dCVkXAGr6yBQgjU
Message-ID: <CAFTm+6D7OKYCqfw3yXnRX4jfmbD4ZBcf2TRL-2Tr+6LWSxWP=g@mail.gmail.com>
Subject: Re: [PATCH v3] power: supply: cros_charge-control: adopt EC charge
 state on probe
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROMEOS EC SUBDRIVERS" <chrome-platform@lists.linux.dev>, 
	"open list:POWER SUPPLY CLASS/SUBSYSTEM and DRIVERS" <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi All,

Is anything else needed to move this patch forward?

Thanks,
Matt

On Sun, Aug 30, 2026 at 9:35=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Fri, Aug 28, 2026 at 09:23:15AM -0500, Matt DeVillier wrote:
> > The driver previously always forced AUTO with no charge limits at
> > probe, which discarded sustainer thresholds and modes set by firmware
> > or firmware setup before the kernel loaded.
> >
> > For command versions that support GET (v2+), read the EC state into
> > the driver cache instead. Valid sustainer limits are adopted as AUTO
> > with those thresholds: while the sustainer is active the EC may report
> > IDLE or DISCHARGE as a transient hold/discharge step, which must not
> > be exposed as inhibit-charge or force-discharge. Sustainer off
> > (-1/-1) still maps to Linux "no limit" (0/100); other invalid limit
> > pairs are remapped the same way with a warning and pushed back to
> > the EC so the cache stays in sync.
> >
> > If GET fails, fall back to the previous defaults and SET them on the
> > EC. Command version 1 still cannot report state and keeps forcing a
> > well-known configuration.
> >
> > Signed-off-by: Matt DeVillier <matt.devillier@gmail.com>
> > Acked-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
