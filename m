Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AB83246ED
	for <chrome-platform@lists.linux.dev>; Wed, 15 Apr 2026 21:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776289656; cv=pass; b=s3SwjeM2vL/XG4uDnOcROhj2G1VkJJ6ktmnCowE18y7e0ixuQHJ5V8Nu0jNUQ34CThQFrN1v9DuNcZNEvW6B7YHPWNgFXv9qQPnvxql2Di0INLZeNT84Ge1DmmV/d8g/rohRVSNNeJK052h4a0KQ9E1ETb2wxMqMgBILuGDyqMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776289656; c=relaxed/simple;
	bh=cqfM3p3dtURbZdqvd+c8DRkDzgdh1jmbfZ+39j58QNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JUj3QKOzer796yzIan3Uq6ObxgseGbKzHZV1n47gD9Se3oKySRCWskkEesz+PEnA2/S+vrz32j/DeKAyoc6MmLSSJWg7nbQAd505UZz6Z4GUNyU//yIXE4B61b1wEdlWnOJbGlAL9R5suf7w9hruZdYVs9zvJfYdxpxRPNx7QIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net; spf=none smtp.mailfrom=lixom.net; dkim=pass (2048-bit key) header.d=lixom-net.20251104.gappssmtp.com header.i=@lixom-net.20251104.gappssmtp.com header.b=PD/cmZ/J; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=lixom.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20251104.gappssmtp.com header.i=@lixom-net.20251104.gappssmtp.com header.b="PD/cmZ/J"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-50b3488fb31so320701cf.1
        for <chrome-platform@lists.linux.dev>; Wed, 15 Apr 2026 14:47:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776289653; cv=none;
        d=google.com; s=arc-20240605;
        b=hrAxfmw6zrkoG1hrNLdSF5yAEOOkwelp5YhR0BFOqsgZZ+LbQO18k3IjodVRvHFIsh
         zNhOJS0VGVjfhC6I8yiP7I8AknhP2KMv4pGQViDzqCoW5JzDjNpFCr467uAWRHJuRNCJ
         I9WWXNUAuOUVvyNByc3lR1YlOVcj07bTOL8a4xDUUQrMZCKx18IBj7bJ5Oa0w1ElPdi4
         VrnzrIlHDutDTz4Nac1EkKnYHHcGFSHzjcTVEHiDlL7mDip/awGXdUyL0Tt5Sh+9pqu5
         uZ1nSzzkrZICYGNkeOuEXvMfS1A3WYxmybrKVN4iYBucNOuC1ny1Egj8k6NG4A/0KBOt
         HnuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u3U48THEC4nMTtCBDzNK0NRPPsHr3hu/KLPlfI3gXgo=;
        fh=IJVn5ng3e/fpT+3gDk2ycyGep6ruyfre8S12GRs3SpM=;
        b=jPhGQOMO8sadaSKze/aTv94LyHyZ/vfzjv+QnWzE4vUzv9zHfyWAt/b9ju7PBYu755
         PB4XQfSIYnEXeWekwVNV7jBG4pRFMDRg+zx0uriDf/xStww6g1laO3Fh7et2Ug07F+FQ
         Je8udjWf3+SOJ9s202nzJxKnlftydECSJdOb4FbZuzsRj+ScAcQa/HFr+waHMqtOBcmo
         5y9qYaV9aO2bvqFPbKaqsuNJItXd7/Fh4S0cMYRSG4fApgi3B78JXP1/26Y4e/tlekv5
         08fcFwsQ1vFRlt3KiXHPrzDE0VSqV4cgPq/6P4LafWcJQmSieXyexe3osg/XuohvsGV2
         hUNg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20251104.gappssmtp.com; s=20251104; t=1776289653; x=1776894453; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3U48THEC4nMTtCBDzNK0NRPPsHr3hu/KLPlfI3gXgo=;
        b=PD/cmZ/Jds9p0UUpWRxVpEdMejzx4npMqOLCPBWaF7EYIu4h2ChmfzhI9JhbPGPl+e
         IruuTeQcpDmLgNfE+Nvq9gk4jh+V5+4J2rFyXxx6zs2xG4wSw6iYwrbwGWezaYbM22Sq
         qCDP4Y5peCkH8Z48iivbUUkPQQaxyxWfQEUEd2ZclRVoDYmWVYa82kwzRSugk8UV74yW
         tC3d+HgZGZUDF19OZ1h0cDyeD+IjszbclnqktOaQPnSC4hkcqGkR41dbDU81q2bzmvMF
         ctUSibGW1us6AQusuwCcrcoSfuLpqiKffqQWTm/4dZTLmnVeXnzrXPTWgvmzNGtqFsfA
         WknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776289653; x=1776894453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u3U48THEC4nMTtCBDzNK0NRPPsHr3hu/KLPlfI3gXgo=;
        b=Jt7mTX67troFSXyKb5P1PD7F3B+dzDeHfqGQMh7fbIfCkmpXv2Rck6aMqpdaK4RSkQ
         p3lYsZAJF3542dxMqDPiMc3rMh+EYK6exdPvZiCDcC67/Cu3BgoMqB+BYqNuXgjqV16Y
         v0jooAyk6ViH/V6TXr6N9Pdo03chLpeTTIRYOJIZv0dr04Dif+SJRUWtq/XoyJmRwrje
         CZuj95RJbu/fX/Ezpjv8GnmogqGf7F8oWH6Liy5sKfFMFUpNbtkFLYg1wxh5weQItTHL
         kEIRFqq6UfCFbT79PniakeBzsWBA8cFQQNXvfetMV2h1AdR6f9zyDjcgVwmb+7PQ+5X7
         aq5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+cbEleu5noXAO6zxsb/vkTlaW6+okihT17pfSqiqu3fB7tVTD3gjZPdf46m9iU2/XlS4WObLvdRNqvOp/I6ds=@lists.linux.dev
X-Gm-Message-State: AOJu0YytFghqxIVhljkjr2MvyEfSNfkvP1rgC1Cqq2IxHV+NyKBlsM5J
	UPTLGEY34AoJ6vY+JDRUKAL5/X7zydqlNXBEYvpWFXz95+xoe0JBRnG3DhkOWmuKHleuyKecNth
	DQWxtBXVguhDpxYsn6zml20Pgbea7KSjifyd0TyBPJQ==
X-Gm-Gg: AeBDies4pPPnL9a/SFnCO5GpIbjiDFKl+ayZLhRhOorsQcI0BgduL/lNgLBsbemAJ2L
	8SbmDfmcoM8O/AVPmQ4vj48WtBFpw64th5L/oFlRebeUemfpnQmFfUUUaCbZP/Ri+MUrwPDDExe
	QftUb3qLpHSVrwUbvy4LhyX+NlEiFTJK3Ja5tIXrXtMFcD/wvFhDwUCFSVHdAGv7r0H1Th5KycP
	1dqzWsnpulwTIQWhjWPmR10uchEoTQpHgiM/sjFVv/kjlet13j2gFAkHDNqs2TPvdMpn/5RpLi2
	0Hwu9xo=
X-Received: by 2002:a05:622a:5c13:b0:50d:7eb4:4c5d with SMTP id
 d75a77b69052e-50e24b5639emr20852491cf.21.1776289653609; Wed, 15 Apr 2026
 14:47:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415175038.3633384-1-lgs201920130244@gmail.com>
In-Reply-To: <20260415175038.3633384-1-lgs201920130244@gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Wed, 15 Apr 2026 14:47:21 -0700
X-Gm-Features: AQROBzDIYTuyQ86-JK9iO8k9ZnW3TX9j6sPqHLmUbcGJ5w8ppMKCOhRl4NRHgrY
Message-ID: <CAOesGMghHi5bEcec9L6d1YUec0Cn5uEs8MrjdoT-zHSr-FJ8pQ@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: fix reference leak on failed device registration
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 10:50=E2=80=AFAM Guangshuo Li <lgs201920130244@gmai=
l.com> wrote:
>
> When platform_device_register() fails in chromeos_pstore_init(), the
> embedded struct device in chromeos_ramoops has already been initialized
> by device_initialize(), but the failure path returns the error without
> dropping the device reference for the current platform device:
>
>   chromeos_pstore_init()
>     -> platform_device_register(&chromeos_ramoops)
>        -> device_initialize(&chromeos_ramoops.dev)
>        -> setup_pdev_dma_masks(&chromeos_ramoops)
>        -> platform_device_add(&chromeos_ramoops)
>
> This leads to a reference leak when platform_device_register() fails.
> Fix this by calling platform_device_put() before returning the error.
>
> The issue was identified by a static analysis tool I developed and
> confirmed by manual review.
>
> Fixes: 9742e127cd0dd ("platform/chrome: Add pstore platform_device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

This looks like slop to me. It doesn't even compile (there's no local
'ret' variable in the function already).

This is also a no-value fix, the chromeos_ramoops structure is static
data and not dynamically allocated. Please don't burden maintainers
with these kinds of "fixes".


-Olof
