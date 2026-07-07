Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDC6374A08
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jul 2026 04:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783399252; cv=pass; b=KVYm9RNJ9QB9Jh6ZUZQOrTl0wD05XV9zMYuo87Eo88gbGg9/O3ZQwB3DCP7c44BukcJ3Mj5lANILD37epEqWUjNWVzgACsYcHbmWjPL9iywAwAyY8bH9WnmUPEtT/NRQsEQlC6yWwONcbIdjt1O8TqL2G2oaqiZ4sIg5Nw3tP9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783399252; c=relaxed/simple;
	bh=pOlCq3UH6N22anVd0FdFVZcCqdVlilTCIIH1x5vVKWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LMkTZRTjPH5FU7BfwTcRsapKSimuGUQnROR9aupPNMCJjdUb0lbVNR2ptVQCi9P8ywxnlURUDOmIOn3A1yHYN5aKL5jiDKdDokb+qznu5BqyJvNpJPTgZZHqcgIMJFGu6feCTdEEfXEnVbPbyXtky50lwDUyVsF/5XbgD59MdpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qq3ds+Uv; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qq3ds+Uv"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cca0c5799eso16203005ad.0
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 21:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783399251; cv=none;
        d=google.com; s=arc-20260327;
        b=bLkvKVOsLZz/6np6S7aWdXdefSYunb9LPDygroCMVvIsUcWw8T0DWGwYCfZORBt5Po
         EQB7cCzYFmbQZpm2qzfOEX/ZWiF+BZ7PnATDAHH/lVXYxBrBgfqMcoDDuhDsTkjuNAHF
         OwYn71MgZ2F+YOXs6pIswlD6ePvLnfbI1wjUFMT+x5T2lRlR0gFW+t+RvY27PhWIcg22
         +/D3BmFJfBVmTSOGFTg2cscTGGiHawPUjeZT4lBw/PIfxAxbfaAlnRaQRUdWQV76wxl5
         0MhPwG8IUqThJfWrme/JvNhC2pQ3NCRwddezZJH7rbDD0AQyTQa7bFDf1m+CjdOVdKTQ
         hJMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pOlCq3UH6N22anVd0FdFVZcCqdVlilTCIIH1x5vVKWg=;
        fh=PsBVE8WM0klCG5xPJ3mYM1XL18RPEOiRdKfAVXRvOpk=;
        b=PrNco6YukredATuOBSRwTsOjfi73A8F/X1OeJHRFgVYeBvNKoU9HyyMRb09O5MSRK1
         C9kynfD7Q6j84PJv0gsVsY/qTMEtiSuZfkaMkh8kPUCb7el9UCedUCURBHY2OwDvUx2Z
         aBzNVK2mwemgf5JORvl0s2aTU90KBDjR/UkFYC6yjrsaQ3YDe1IcaavG4RHMqb/CnFcQ
         rmuCEBh8cElwHaG5Vty/b/y0EBg76WY0AjRlnvLcf9VBLJa0NwobzriqShU8gobbmcmC
         blVYiq0H4t2RrRmiPRfouZe8l5+wApzpfT0SEeSHwf+p8BcipwBus/mG+NNtsmW1ImdL
         n4cw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783399251; x=1784004051; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pOlCq3UH6N22anVd0FdFVZcCqdVlilTCIIH1x5vVKWg=;
        b=qq3ds+UvxzPJFGAztBadtmZ6D1RG9jpQScTxWB82HWiQBm5YSnwvxIaSX9SyqzSHuZ
         jrgjJ14mErCYYKUJtJuB6+xsPOfFFj7hDPDlmgYqfUPK5G9ch6LhjnagR1FVY10iV1NG
         i6Yk/o6/Fi92hVZiTTszFkQzOfXmj86IoCCIxGoW1ahQS6T9IukfQZys27kePquvXg32
         hXCkMHCY4c9xyDg5+ClmbDGtS1NkSe3zcNvXgEKZX0dXQxN+Oa+Zw0WDc1LBwm/bbTI9
         xY+y3bjcGZ1bJmkzoBVjih3hUugTvMVwSd2ZogolSLujztRr5AbTJ30X/sadfiXc9kVa
         VFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783399251; x=1784004051;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pOlCq3UH6N22anVd0FdFVZcCqdVlilTCIIH1x5vVKWg=;
        b=kS019i07OAwL957NiG3dluoSjFw8+fSC+sRHj3FeKz/+5D1ewREdlNzC4h9mTfMl3y
         yKHDl7IU9hItJY5jboN6P0aqNYtjLthqtcGk/pJHKwx/rduC7BSn0+ZlCuuZjLqhT6G5
         Ia97ObTFkFIriTqMC77G7tSfpFNur8oTokIOEGmY3bqIg2qE7q9xr+BLUYnlZMIWeQl+
         rFhl/GxlsXXmM7Cr4d/DSNZ+nnkueHX5I4fcXcS4rsOWXCdrFIoAgGap8Cq5aFwxmLMu
         3vUxTfyAfi1GvBr0KQqIz1h3rgzNc0xkNqVhg236g45S5ZR33dY5gv/di+E6lm6p+l4d
         eWYQ==
X-Forwarded-Encrypted: i=1; AHgh+RosDN0H8nMNOeKTmdkdgPR6zlO34vul+b7vkxcEnDtYCKg2Ju6kXIdrFwL8/UVqC+wB2VGVCwvOMdWvMjGztcE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNmWgukz8uCUnhyot48IeQa667jGSCtzFaWj8Cx+ucJ1Sl6xbq
	RO6OaqQfZAwYzX5XbzTCFdD+LWaXExjsYoB2k4UliWmLMSExCXKKnD4PnaHUOGYbnJSGfOnewgr
	b1IG4XstWsRDdMu9LgsODKH+cM0SarHo=
X-Gm-Gg: AfdE7cldmsz1bFYSLuJUHAm3/+K5z/UL11XunfhjNKukRe4U+sIL3iuzkZo8pOjOjqu
	6JT0Drm+ncdSQHs0Q6v+0Wy478z0BhXbc5j+XLPLEu6mJBFNYL3Zmg84pCPDnyOOemS1NI1FVYA
	zBVcioVOMtmC5MUQ65QIjyjX63FZcrXYlcyyM2ENtCfLhCkc9ho0LXsMBbxyZ0xs+O/G5lSufde
	DeGezFFUsNmsYQ97o9655XjWbT82iTnpfuVK5S4zXEfGB12EnLnYjPylAhRy4bj5KmDqFH3awJT
	HvEwTIDePylw2Gtuux82x16tMNI=
X-Received: by 2002:a17:903:120f:b0:2c8:1f57:d2f7 with SMTP id
 d9443c01a7336-2ccbf0569edmr35053655ad.24.1783399250287; Mon, 06 Jul 2026
 21:40:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703055355.244898-1-phucduc.bui@gmail.com> <71b1c1a0-fcef-4102-8ab6-146a2c372adb@intel.com>
In-Reply-To: <71b1c1a0-fcef-4102-8ab6-146a2c372adb@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 7 Jul 2026 11:40:38 +0700
X-Gm-Features: AVVi8CcQCZizGEeAayJz9voLwANrNZWRykbsEcNpz8Fp4dCchth8iHayuEhTJkI
Message-ID: <CAABR9nE=KGshxBg2mEF9gsXzv0WStXf2MPLeye-kTg+_SL7+jQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/24] ASoC: codecs: Use guard() for mutex & spin lock
 - part 1
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org, 
	u.kleine-koenig@baylibre.com, kuninori.morimoto.gx@renesas.com, 
	christian.ehrhardt@codasip.com, Linus Walleij <linusw@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Chris Morgan <macromorgan@hotmail.com>, 
	Dan Carpenter <error27@gmail.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Rosen Penev <rosenp@gmail.com>, Weidong Wang <wangweidong.a@awinic.com>, 
	Teguh Sobirin <teguh@sobir.in>, Val Packett <val@packett.cool>, Luca Weiss <luca.weiss@fairphone.com>, 
	wangdicheng <wangdicheng@kylinos.cn>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev, 
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

Thanks for your review and for the Reviewed-by tag.

> However, I'm not the one who will run the functional tests for these and
> from review-perspective, the patchset overall looks OK:
>
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

I'll add it to the next revision.

Best regards,
Phuc
