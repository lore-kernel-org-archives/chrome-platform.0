Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A470D34572B
	for <chrome-platform@lists.linux.dev>; Fri, 19 Jun 2026 08:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781857250; cv=pass; b=No2ki2tMMeG1GLOFLHZmkILaznbqU+PgOtJW4vzc4aKx1QoG+tmTOvfMuZyuhlLv/6D+qH6osXUf7vRzOqkV+RQtExRU8iakBNGgumC/MOlBWNhks1bH/G/PzsMRKnN7yRJ6i85VpsWu5GZFpNn0Bo8IkpXEewAW062kVovcL9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781857250; c=relaxed/simple;
	bh=QiRZKCM1EqNiRsnzfvDpC39UOIdXQjIxqxCEPl5e4OU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qidNwuI74LWakptVBUuAMIVq+J5J3sHpW4+8k8dhzMCdEvCQaK3BCHH+t19SWAczxOKcA30rB0XIY54lmL8DCcmn+bTDRu9xqsodx1gWxjTBiwx6bdq/eTgCEO12aSR5I08SYwLLer5MBSpEViGCe/5M135lj/gYFoMTt1v0sEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T59s5yp0; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T59s5yp0"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84231305a80so1071647b3a.0
        for <chrome-platform@lists.linux.dev>; Fri, 19 Jun 2026 01:20:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781857249; cv=none;
        d=google.com; s=arc-20240605;
        b=Kw45fe2KTCy3MEjViJ3mapb1v5nWhIFS34mAPLO+AweF2UZ4nZ/02fY39d5MdE04nP
         Qp5bxRpnZpT55e6fTRkJcEP8oq3hARg1+sxB2x6u/DI24ofLxa0OYUtt2FQKp2nysr1/
         rnp+acmvt7bsvsWNrKT9KzoRIrUgjpLtS1kDiaf8Rsx0xJ/sARUEq66cs6bIp9m7LpiO
         KPfG/XDYuPyBSQYiQYneMlrfe9F7ljVOW+FL3M/k++BaUKJHgffAUKJoCd35Q6xgjMn/
         WyBy3Ja31duT1bJjo9wNzrKOdcsjk4rfUCNv6AcNF5fMttM5XQqO3vQKxn+lQ9ASERSp
         BtEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QiRZKCM1EqNiRsnzfvDpC39UOIdXQjIxqxCEPl5e4OU=;
        fh=8qSYFm7ENH2XeodoZWoBUDS/4OO7Waurm/vWGKEGUOk=;
        b=cB5x49onesl7jpAT8BGAKw2Q9HYnh/8akp+ic/d/5TIp3JUeDfJQfOswNrp8s7TT7i
         cIDppkcLKGc05Wi74sbhzEwHT6axgFiYOFjQ/RRKXLuf2L8EBeYffoQXSoq6mi9gTnJw
         w+oPjWpbmJ+b9ikdFzSWL05YZzaZkW+XdBlxB0haIjIlcxQnWY7KcNAKf3ZIbo405v2w
         Sdn+ZYyV1NCV8VuoHUUe3ThIWoxjKGJpELXfHu71ojujfNpz6SWFgpb82PfJs0tkA43x
         vsYO2rnJGFCljoQ1pk04ZBOM5L2xg2mBBiAbR7rJ6gIsw/45RQ5xS1RqFxhFhiYHgh5c
         KSNw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781857249; x=1782462049; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QiRZKCM1EqNiRsnzfvDpC39UOIdXQjIxqxCEPl5e4OU=;
        b=T59s5yp0dcVrKaQ8iSu8k8hxOuC9H5mzrmDWAXIlVD8OUxP0y8hs1DTcTneIvoGFGj
         PBrm+AQnoDEY7tt4PxVW0ZuFDTnOY1jocwN3px8SKQxxfaln8PUzoLg5GT3Zikp9FgCR
         fCDjl2FcwwtqzWkzBMdouLkprdkQQee75MTO2cDulftWeCvMl8/Kvs7kAmntMeDdACup
         l1oBT41CNtyBGgDb7rnswcopLJqT7BjbRQGbhx2NmLsbAyjKidFOyolOOnKKJN+asche
         1+HcVVyV0z3Roonjni2CYD40X+c1CHVUDDEH+H29143g30BVGTKpKmTycSW9aGyDZzLX
         OHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857249; x=1782462049;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiRZKCM1EqNiRsnzfvDpC39UOIdXQjIxqxCEPl5e4OU=;
        b=Gd5r4kCER1HmY8xS7VrcOhF5o2M+EW0l0K64ZgWg1AG8jPtZQCAhe9FVRG3QPv8i2C
         aL2SNwqqsZvRfo9waxDcndlrU0aDUY23c6Z++a2RS14Wbfz7WGngAWxM0xQ06nLiyJaO
         JFOaJHxmPU8rfKk65SBFUgt5iiKvNevtJuYA4zSbanf2mutS3Qe259QVYUGIa3Y/Xd+w
         ihy5EE5j6sNRzpV6QmEgEHCK1IUa5ltk4AqpVehRUD9bfxrmKPzTAvvv/XKejhdKgMeq
         1MtLg5tn6Vpv//YHQXHsPkIxoO3kz3bbnjmjsLCOAKi4QQzsI9fJAA46GtjEaZRxwikd
         JbqQ==
X-Forwarded-Encrypted: i=1; AFNElJ9bfxHOdxmpz8BOBRrRU/TUJ/1O26Y5cgO8M90or0IuY4OlWAzyH54pgqB8EsxPXAyQmWkcPfNUDRPpD7ERjYk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRuEJE/Q+z9vRIkXl4zrUHD7s58k1tbupuNo8gO+j5mxD9DHsE
	zF9/DrEU4VgcEhmF5R8rsC47/04LDfzCab/pi7p6Zwlj7jq8p8c6oUtLBPXHz+msyYwfI+WAE3f
	2jZAgEAcs133l96kExyK76SmBopT41SM=
X-Gm-Gg: AfdE7clgTxAt6y2JSF2g00AX2d3igwC1p9EEpFwV73GLET2AD2QwbrT2FhD57q4UXkD
	pnXEWZlpKBjmvXCaPHaPoqbG3gBCFVVkoKTfl23CFV3WM5zuMKH3StkgEaFje28+giWw8FIR9Iz
	+3KNCt8GPR4pYLRwB12TQP8A8sn1fPp++4f8SnFXriNukuHajMOcQcZnfAgiCXzriZmEOE5275W
	MvcfenQVsC0OVYPJwc2vz//7Dvi6q0JTljunBIitFSjSlmvFRJtxQfLja4UjOn7YPQNszELA5ZJ
	DQHpzR5katMU2IS8qslzpUNtHgH2TFRIwUbeAQ==
X-Received: by 2002:a05:6a00:3cc7:b0:842:6a97:52fb with SMTP id
 d2e1a72fcca58-845507cb50emr2639722b3a.18.1781857248942; Fri, 19 Jun 2026
 01:20:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260617103235.449609-16-phucduc.bui@gmail.com> <ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
 <20260617140209.3f89706c@pumpkin>
In-Reply-To: <20260617140209.3f89706c@pumpkin>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 19 Jun 2026 15:20:37 +0700
X-Gm-Features: AVVi8Ce6D0PT5nT0JZlv3l3sVJ8JLAPJbKAWX5-seLq2FMr-NiEk00n-taoSGeE
Message-ID: <CAABR9nG+6gOj4KnWmTyykgGN93xy6jKQh+-_f8Xxn=Jkv28vBA@mail.gmail.com>
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex locks
To: David Laight <david.laight.linux@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	povik+lin@cutebit.org, Support Opensource <support.opensource@diasemi.com>, 
	Nick Li <nick.li@foursemi.com>, Herve Codina <herve.codina@bootlin.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, 
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, patches@opensource.cirrus.com, 
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Charles, David,

Thanks for the review.

> >
> > I believe you have to use scoped_guard here, as there is a return
> > from the function above, if memory serves it attempts to release
> > the mutex on that path despite it being above the guard.
>
> Indeed.
> I believe clang will complain.
> That makes these mechanical conversions of existing code dangerous churn.
>
> While using guard() (etc) can make it easier to ensure the lock is released
> when functions have multiple error exits, I'm not convinced it makes the
> code any easier to read (other people may disagree).
>

I built the code with both GCC and Clang and didn't see any warnings.

My understanding was that the early return exits the function before
the guard is instantiated, so it should not affect the guard's cleanup
handling.

Could you explain what issue you are referring to? I may be missing
something.

Best regards,
Phuc
