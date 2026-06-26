Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB083EBF01
	for <chrome-platform@lists.linux.dev>; Fri, 26 Jun 2026 12:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478649; cv=pass; b=NYePbR61MmaIEJV10fg1S2nCrkyX+7uwyTi92G6zu60qBPgyDduZJliAoIX1D3MzZxbmhfladnJHoKEiwGQTftXLce5HmA+EbpXsPbgA1oYM96/x/y7QkYCIJ0wQjyQSzCF+rDg1IstCGBC5XIcQTPRcW5L3wogHF2m6oBMfeQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478649; c=relaxed/simple;
	bh=8sC/X8kFjJJJ17yx82agnNOpLpbjIzUNwznUcxru8No=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lWIQ/EPO83O9JvfSTACuWtdMGR3hu7rUTvZ4MDWWlIeStoz2bjvqD1bsnI2Eac+k60HqWZ/J0tbq8Rp3acQfg9bmbAy8x3Mwjf2ose2roepQllu9aQD3o8L7+LigU3ien86CVwqCDvrmZ+D25zKtfF8S3dfHF6fKlLydqMzDHck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J0UX1j3m; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J0UX1j3m"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c88b8fe9059so321113a12.3
        for <chrome-platform@lists.linux.dev>; Fri, 26 Jun 2026 05:57:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782478647; cv=none;
        d=google.com; s=arc-20260327;
        b=cbDedjm4bOfUg4a35tNL1ilAOeMpsx8FUY2pm1kuKd6LJbh5rQjlPhIOzNJVXGXSL6
         0V7qVPq+J56ky+RKtn9PZmjmjYjESUIdnKI4JpIITxb/koAmmW8plic3AzXuf341760y
         +/RzjqqZu5DSZcwbnwH1R1PwoLezUEGLbx+uCsJ/GtTEFFskAbghtDSVYxQfED5shMxv
         ThTQuWO6w/DbtYi0RywwtNHZQE/2RMPnv5wrVaLGCASY2E+4SjMPKfH9VPDl2CLyq7Bn
         TmyVTl2dH9+29dCzk7O5r/Urbw0Lewgyxcj/6/0DrpwC4wckOvcmEqB/epXkxsSnrcPh
         897w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tZgJt3XD/Oh5GCeIKGuzpoEzx154Xmg96jamGMCE9ck=;
        fh=XEtAyev4y/ViftnqlXbhFqzvvexjULreiWTQVD7plLE=;
        b=bxXTpGoX1dddpFgVoHLtPw1AOMNC3/2Ok7BwM3viy4M+nacNvg8ay3/tzq+1r6Aj9j
         vbrLRql0doTR/ruQTQj6Zbl5GfcaLbvKzQRw0m2ZyqQfQ8HllXMYyAJDjYiE/szgwqFM
         4vLtWk1ynubxzc0T0ldBFj+/idUgax4AjBnLPHgb2awwf0DJ4hRJ1nOdTJGCyU+78HXH
         9dI++TK8haMM5GrKOTE748zNh5uIx8WdOcBMUWSJAnnntE3aTisx/wvul5JieG4bT/Lx
         bcUD69Ew97qPn5ihQsrBryEfOyDADRZIiMBu+KFi1DxSG5Op5dee7EqlIbblrgrZUzHW
         dlKg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782478647; x=1783083447; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tZgJt3XD/Oh5GCeIKGuzpoEzx154Xmg96jamGMCE9ck=;
        b=J0UX1j3mjQh+GVl+il1cdabPSMVBV4AxORGcYjdaVh8LsVfsj3DVMElPq+ZmIDBy4g
         61ODzY35ShmZKJZEDeCobENh8tVmBXigNa+T0xctDyPhDjzyCoV8ID01xNBzygKebZaz
         VtryoBQGiCuaO0acomh6djIaCdBI2WMqEJZ0EYmnjFrkzcunBhAQXg3iJtfjFf1JJJfV
         DN9ySVPMpGPozvjWYFnPx9S9hCBszK1KRm1doKxIHhdUirPP0STTgBj5qBySBkBripSI
         YQ2AvojrM05GUxaEfJl5idilSNe8ZwDDbwAKx0FG7HXY9cbnOrNpzG00mlSsI8rA8Dhe
         DJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782478647; x=1783083447;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZgJt3XD/Oh5GCeIKGuzpoEzx154Xmg96jamGMCE9ck=;
        b=UKBv9mZbory0e0bf+e2RiZmuyhbY5jelSUop0ayTpedIw14j2IHFPqn/pkUgZ/JG6A
         p0hnos7iHkzTebNFvbdxZgTUZ2h5dwlagcDurz+MflU9j7UtE30inf59xyfZ/MeWL/XN
         2fSWvWrXAZ+CXXBnoRsPNAcEFyZ2ro3u+J9x4WRULv31iB1375H5KwyDA1o9IwxQ56TN
         JxDOFhdb7xcrSMf4pHAoUyCdEkFA658UzpfWyetQKWKtnprxr9ETfyy2fDBObqYNFTLy
         8C2gHgUTwX8REqEJHvQi45roFju77IUN5JBoXx9AH5g/36HiLJHfaYqzvcKPijJlosuf
         eTfg==
X-Forwarded-Encrypted: i=1; AFNElJ9tJeirQx7jWJ15xvVLu0J6LxLiXaLRG/VmaQGeCOd1ifLUYLdGsAS/jYQJ7exJQ66/WveIZSvCTIAom+DFkws=@lists.linux.dev
X-Gm-Message-State: AOJu0YxuPTKvt9O3rCh7K/XGxayh/FcT6eDdar1JwF17BcARPcjJ5NQS
	Zc5yoGMXe8NGOp9QrvJFYDIiGhGrA4Dz8xZlKV76KuPGgucFuNwmmjcAzT27B4Zv+Yt6IogxVMf
	w6vx4mSHlftEqzSIRt5MZb15fORtpKWY=
X-Gm-Gg: AfdE7cnbwJEgfoasMWSzdwHtSI+VnXtycv0vqw4YmeHmSsioK2BboTiDgqmKIKQdk4U
	jRxNMY+GRFtRQVV8rV/bw3UyezNJPIQk7I6XRjwACh18oVhxIpD0pTbtS0z5lwnWK/FAGwUkt6s
	6hLwNxaIhQ/LVHQutm0diaUaxNXjW6tcE5wHCsCLj9UpMqUcgC8oAcfzKcCfr4fJd9302029iDs
	zF6dAzjI/4p0mXhqEXL5mLkZuimFiXhdfUAhcoYj0NYZTeyN0GQKoFJk21px12W0YQT/Pxj6MJS
	1OQ8vK50OJ55v0j1SKrjpeOUWSNAIG2MpnDgOkj1saAAP9SfaEVUdZ6wSkxx
X-Received: by 2002:a05:6a00:390b:b0:845:6252:f69b with SMTP id
 d2e1a72fcca58-845b3b09722mr8163064b3a.46.1782478647492; Fri, 26 Jun 2026
 05:57:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626061329.23264-1-phucduc.bui@gmail.com> <20260626061329.23264-16-phucduc.bui@gmail.com>
 <aj5a7pgaDoN30Gs5@opensource.cirrus.com>
In-Reply-To: <aj5a7pgaDoN30Gs5@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 26 Jun 2026 19:57:15 +0700
X-Gm-Features: AVVi8Cf6eb5dnLbYsqjVNTri5x3c-YQFHB_0iF60ES0iQWHt02WjGfax8ERd-Y8
Message-ID: <CAABR9nG9jDfK_wqS4Akfz5GL6HvZ-RkpPuYx4Q=vMn5jH_0foA@mail.gmail.com>
Subject: Re: [PATCH 15/24] ASoC: codecs: cs42l43: Use guard() and PM runtime
 scope helpers
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com, chrome-platform@lists.linux.dev, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> > ---
> > -     if (!jack)
> > -             goto done;
> > +     if (!jack) {
> > +             regmap_update_bits(cs42l43->regmap, CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
> > +                                CS42L43_JACKDET_MODE_MASK |
> > +                                CS42L43_S0_AUTO_ADCMUTE_DISABLE_MASK |
> > +                                CS42L43_HSBIAS_SENSE_TRIP_MASK, autocontrol);
> > +             regmap_update_bits(cs42l43->regmap, CS42L43_PDNCNTL,
> > +                                CS42L43_RING_SENSE_EN_MASK, pdncntl);
> > +             dev_dbg(priv->dev, "Successfully configured accessory detect\n");
> > +
> > +             return 0;
>
> I really don't like this duplicating of code blocks, it takes us
> to a situation we always need to remember to update both blocks
> in sync which feels like it makes reviewing future patches very
> error prone.
>

Hi Charles,

I understand your concern about duplicating the code.

My reasoning is that duplicating this block once lets us eliminate 12
`goto` labels,
which I think makes the overall flow easier to follow. To me, that's a
reasonable trade-off.

If you have a cleaner approach that avoids both the duplicated block
and the 12 `goto` labels,
I'd be happy to adopt it.

Best regards,
Phuc
