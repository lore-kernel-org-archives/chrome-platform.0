Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18424322C6D
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jul 2026 02:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783391366; cv=pass; b=SEmwzBnQcDJ/Z++PUonRNsT2fdulF1AtnXzkbdVF3FiORKf9OUCWyDb/qhjkKfGZmkHIg3GSB4Rnay0V8XcxhFxLoi5h3bDImR/ICPuaqFH3r3/HcluwzXS0+ll2iFJuVlrs7G4yAYieSX3uuFlKS6rfs80lqg3s6mumv9hFP+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783391366; c=relaxed/simple;
	bh=3dNBHgNVh2HFT7sUMNibXO7U8TMSoA4bKWJ6b0uoTv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XFGf3h9VAhqYzK1+YsYkcguwSsPXTp+2OmrsbZIRqffxJMhKNNmW4+uC0q+7Wl46JDBoxscj4xyovpT81LhZJIOrJVIdcHz0Sm0+kGz4dhLRy3Kxe+cw4qLqDcHNWRinkGFoDAsvsbtEnImge8b/zk+ALvv5sBwE/Rue3C0Gx5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUeYpHP6; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUeYpHP6"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc73e322dbso21612915ad.1
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 19:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783391361; cv=none;
        d=google.com; s=arc-20260327;
        b=AQ7N3AswyxZg2zSfrg8K1Mm9zcrmV8eEWQfT+6W02Kd+A6hJLU1/3KUrW7gmNYWf57
         V0J852QEFY0BKcubBpf1WrbS8spv2o1WEIBuBo2f52yO6mpvf0xNJe5lqtMMb9ESNImL
         sUW0HYr9lLaDGo7muKwnA1Ss6MQvrkTvObAVTbD1wzHQ5/NH8S7FivGyGRs9gmS2JISR
         Ncx/8+j/8jMA+18/O7K4I8EuNtbB2gvljdqhfW1uCXFEnxMwuernLCMXZOzYp0a9QgUm
         8wgWbiLB0wjmjnSIhnCXO2JywjhzfGkS/5ZUhqMEaRwHZuenkaxUBi7sDi5tXxkhkwWm
         Y5sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3dNBHgNVh2HFT7sUMNibXO7U8TMSoA4bKWJ6b0uoTv8=;
        fh=WI15r3F2RGQ1P8Qt70JkBDg8TjkcNyJCRjGK5/T/miQ=;
        b=oNKGG93QAnzs1GRoeMBzNoH/zSJugDsnBEUb6BzwYzeOKjZ2ieDNzaG4+X7VR9YNLz
         sZ/KTBaQ3URLeazHtTGX1/M1y8IHpMH7AM+Cmeo9rhUL9rx2wktkfvPiWBjxXqkjMzb8
         7nxF61aYqIzZAx4ytnVzUZzqXyh1y17x5vZJEoZeNcFxsoxNS9mZQknpXBdv2e+yNWNj
         TEUIu7PSymy5YN55LYSCgqYUU5hjNdstwzzpRvZ1OGWE3ALT11GrbhH7ZXH4J5i3BkB8
         xyNgdstAMgMxnhu6q14B5g/FWyTSDdcQ2lqh2NIgzzCGIIUxw9CxuwAI+PWHl4QBPohV
         bkBw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783391361; x=1783996161; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3dNBHgNVh2HFT7sUMNibXO7U8TMSoA4bKWJ6b0uoTv8=;
        b=LUeYpHP6OGD4VVQYviRinu1deL6cXgFphEyBvdEPFK11PGY1QKrMPIO7AXB6RsFPbC
         JsnVWIXnuMHFVhnjmwu/QXKdU6wdHxVgXqQtP8uZQFYnpj6ugh18LUv0JMr5ypfcOIXO
         kG+RHSfF0aW9tgoFxvhaGFAnZSNyhQfFYXnwWWjkF31xcqhRmkqKN2a8DwcFoJiiUghh
         1SVfxQxAPQb2UTL8/eMvXTVyhNMb8FqOkXFRI9vwh//KPtzkcKLAN1k2lEchAgN3aLgs
         qlq0SlWuVA2RVy/vbCzeN0Gj2dmBgx74QdmDp7PTudPV5ymLsnQtCykM2erqGXNLrIzb
         Nb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783391361; x=1783996161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dNBHgNVh2HFT7sUMNibXO7U8TMSoA4bKWJ6b0uoTv8=;
        b=ejwO+qRE7dTL38W6BQywvsB5liP1IR5CIbpVeQBTC7MclcTyFJho0wzRzLZd83khBP
         P74qbPWY1tYUBbe/iWaH6x7o5hpcDkpMa+nWD8QzbLMHiknTqc72RYS0y5LdaXE0W8dE
         JINHm6wm9H02jI0EwMNz4iy0m+aIOl1oBqR2Y7Lae57O1Fls3orl0nR3uN9rJSWEnRJS
         52pFMdLXQJYljE+yk3EsQxBA7czjHz1dIH4Xx8sIgY1QZdettd7HcfYX4A759KadwagM
         5y1dNYk3FbESEPEVAgB7mKRzE7bggd1skZ2cD6Q9wAfC0es0DqbyCdS7tDwNMDAZnyVF
         Cw7g==
X-Forwarded-Encrypted: i=1; AHgh+RphvB5eDsplLRJnKjvfOb//HHUKavOjvzrGXt9Zu6ewJHTjUIy71BNyeNrUE3Jwz84YGgYUNYgxk1AC1VkzFi0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKObc2sm7r1PrK7PT7+XO+GKJ9j2BWaEtWVQfrlXgAnm6JLyuE
	otMsYJ4t4VLe6gtAxmo7z5KKb8jDzskfo6f95KhziUgEfFC3yPzeGBfXohoKa5Kvv4uY+Obcrh1
	EKK9fAW9HqkFoH30PvKTUsw9S5F1q+nI=
X-Gm-Gg: AfdE7cm8hfqf6Ui4oh0y9xEms3sB2wZx13SxbriKQKbBcnSoI9T+e/1fYtWiN7rU3T5
	GcBHBzhKnNV4DPdwqEywYGwM3shGMbeH3GGEB/ww/kbomd2i7E/LkEaTDTqU7/IE+0r9YNQPMxF
	6+oBCSTBtWuuLwTIMl9c9hi05WsXr6xRJqt3P/wdvotge2/nwbOCEhKJJXncAtMmHQvEy0ufgSc
	YsM7ORb7orqi7xySbh5u0CAbMQRelMn4qXKeb8gBo5VGAJ0jSt7tbf9NB8xDIrwB9USKNxYVUFv
	TVk0NeC9vDefa0f5TQL1+MfDf18=
X-Received: by 2002:a17:903:234d:b0:2c9:e86e:a9f3 with SMTP id
 d9443c01a7336-2ccbe3fc503mr35838785ad.10.1783391361490; Mon, 06 Jul 2026
 19:29:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
 <20260703055355.244898-4-phucduc.bui@gmail.com> <akumgOIMYes2CXS3@opensource.cirrus.com>
In-Reply-To: <akumgOIMYes2CXS3@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 7 Jul 2026 09:29:10 +0700
X-Gm-Features: AVVi8CfGeOLkdRsN-huCp4z6pOuTIEw2V-qPsop-BpnMow1W_rEArqC8_fPlfDM
Message-ID: <CAABR9nGwZHMrMer2e0zL78DQ7Kt=O2CWcQUKmht6ZEkUQej3Eg@mail.gmail.com>
Subject: Re: [PATCH v2 03/24] ASoC: codecs: arizona-jack: Use guard() cleanup helpers
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
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
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Charles,

Thank you for your review !

> Minor nit, this leaves a double blank line here.
>
> Otherwise looks good to me:
>
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

I will fix that minor issue and add your Reviewed-by tag in v3.

Best regards,
Phuc
