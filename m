Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1239421171D
	for <chrome-platform@lists.linux.dev>; Wed, 19 Mar 2025 04:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742358224; cv=none; b=p5J8e3oWqsUql/jFkBkdMRizOvn2K0zt0RN6aOR+0faocfYBSmMsaoJZTCw6z91uF53NCg01Y/fS0en8J1OsW6AnsuAj6VIBIbs5xBSgCn12fiiGtBBGx1gqziY+aAaCbAFA129r+V97+PV3vSpdIpl/iPj6mXxEqn135J2pA6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742358224; c=relaxed/simple;
	bh=ZHdCrIsEL5OVf2w/YxYL8NAe1VQ5Y52O/K8Ihuhxl1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f2XluhEP69PlyUrUf/UfWnLllL0EEu8ttzrTE01scuZFeofueG+yhcaam6uddxSoboPcIGg/g3fAgy7Oi5N/ImKcVbXS0rSGhpBvJolxP87UunJyzNXaD6im4nhrUVPROUVq3r5KLs3s5oddbKlLxXT6E9bNGp3gwwApf5gCNQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C7t0IQvX; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C7t0IQvX"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54954fa61c8so6422755e87.1
        for <chrome-platform@lists.linux.dev>; Tue, 18 Mar 2025 21:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742358219; x=1742963019; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZnm8PUwSbbaRIS2I4Y7DkEdXZ5o/1IW7fPXlQxrNvg=;
        b=C7t0IQvXyfOfUV/i0MKCDdiT1cNVgGGx3I0v6OtupnMQJpx7iCi3UVX+2k+nqhT5DO
         iWLfIkpNIcj2TRdwye1e9JNZxQSC06ExcBUTIjhcEQFmLYpvjfjjzJOvFMyJf/MyuZnv
         7E+K20eUxYrUbtyp1UyyyLzCMvgDqzUTbobb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742358219; x=1742963019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZnm8PUwSbbaRIS2I4Y7DkEdXZ5o/1IW7fPXlQxrNvg=;
        b=cm4FeNMAzmfMaJMX2FU01Wa8mTM219NO8tPpRhARCEDAY+DrzfnChd8HgBmFNnbffj
         PGWzUgmk88aiDRy7mY8TMdQnwKhBw5wnJQEbkjmraBLoKPiFiVYf4VIaUlzEMFJpIeH7
         6TkWBVjcRcMFaJKa2pRBgk2cdRSSDwknpk291JER2TFnTYyuw67Ltgj0o3E/ZdpGCBh1
         mqQgnuPFMTE+RD6yWJQDVzuUAdcfjGKE6iI8ZlLgtepEWA//EWnIG7/AyEcGzgkgLNUa
         sAlSGSLqNlti7FqeGTdEuwGV9A1MW/o8KePLswJvth66l40hnpiwiyvLLi9V0DdkusI/
         Bovw==
X-Forwarded-Encrypted: i=1; AJvYcCVsY2YTJDuKAtBYxNAGUatEdirC0WPJZ+sZ5c5klgvA1T8N5O9WAwpaqOFzzntfDEL6I6cn42SA4qLT0WmZPOA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQWOt72hCpv6f17k7LkEnKM2fFtb2zCKWb5+Jm4CrphM+3nEVL
	kr2DeXXpefSeiaTbZDWJG/Cs23NqNYta7TDYQC0mEBlXf2XjITLMfBn+9v553RgBOzi+tbDoojy
	M/Q5rUFNzSxuvQ0euPkgHPuorb8qtGMRv+8VC
X-Gm-Gg: ASbGncvlngS7CloQVdWrm++AsNwhWWxyW7Oka1kcD2h5bax9dQu3ukvs1JaPFi9F6NY
	3M3XsAePmM2BGeASCmZ+DvcPJLVMv5i1QXJaN59SNNfMHuwM3uax0xAeGTdfoZUJi6+hBVn0Sji
	zkPgrx6+gDXxT1i9mCXQCEQLavHQmc4v4ZH0CiBTwFPasBaZVhluqFrw==
X-Google-Smtp-Source: AGHT+IFHjBg03r/3RVZ9aaB5Mk4M+GMF/ZItUsDYbR7cSHqYL8Hm2MnfjLcQTNBGrm46WGoX9JDBGpNCtwc078vB7uE=
X-Received: by 2002:a05:6512:2507:b0:549:3b4f:4b39 with SMTP id
 2adb3069b0e04-54acb195bd5mr361603e87.10.1742358219093; Tue, 18 Mar 2025
 21:23:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250318102259.189289-1-laura.nao@collabora.com> <20250318102259.189289-2-laura.nao@collabora.com>
In-Reply-To: <20250318102259.189289-2-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 19 Mar 2025 12:23:27 +0800
X-Gm-Features: AQ5f1Jos7SspTJtPnVw7V5hzjUHHfb4ilgg6YTkdTM2SmwYmpJB2tPacgIw_Nsk
Message-ID: <CAGXv+5HZBS-L=BSPcy+QJAwJE--wB1AvG-xnxu+sf1FttYtV=g@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform/chrome: Add support for Google Spherion in
 HW prober
To: Laura Nao <laura.nao@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	bleung@chromium.org, tzungbi@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev, 
	nfraprado@collabora.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 6:28=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Add a new compatible entry for "google,spherion" to the hardware prober
> platform list, using the same I2C component prober and trackpad data as
> "google,hana".
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/platform/chrome/chromeos_of_hw_prober.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/pl=
atform/chrome/chromeos_of_hw_prober.c
> index c6992f5cdc76..019578bc7ad0 100644
> --- a/drivers/platform/chrome/chromeos_of_hw_prober.c
> +++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
> @@ -84,6 +84,10 @@ static const struct hw_prober_entry hw_prober_platform=
s[] =3D {
>                 .compatible =3D "google,hana",
>                 .prober =3D chromeos_i2c_component_prober,
>                 .data =3D &chromeos_i2c_probe_hana_trackpad,
> +       }, {
> +               .compatible =3D "google,spherion",
> +               .prober =3D chromeos_i2c_component_prober,
> +               .data =3D &chromeos_i2c_probe_hana_trackpad,
>         },
>  };
>
> --
> 2.39.5
>
>
