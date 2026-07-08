Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F16940913A
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jul 2026 09:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783502293; cv=pass; b=FNWXExNxf1HZmUKMzWWhJA6wuerdZr4wkLzSYuFj7iu5cFwcD0WUU5BY3gwGNx6u9sdKoYzZzE57bnq7+fplhpQrnbn7tDfJu6eWZdGveazKwN6TBUs4N50oifTMxj3TyVNVU2eFluc8AuEw2GVoyi2ZyCQpIYUkJwnMepWrQGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783502293; c=relaxed/simple;
	bh=PuwDkPB4+DP3Frg5ZiBjH6BGS1KGyNIF8NXdWFT9eoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MUuLsP19Ws7aaRodvp3tUIJTXqcp1tPLYakDm6H8SfEnYy3kiAuJs6tdogJZRLsRArbDbrH1bcvvWKw74QE69wW4MUoQzIt+idZS/SzIxMljR0Oahr2w/ykCP+hwABMxf7XSKX4oWL/EPlRAaFFfzgo0UYV4WWozyCVtK171gI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdFpN+qX; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdFpN+qX"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38759bcd877so410939a91.2
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jul 2026 02:18:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783502291; cv=none;
        d=google.com; s=arc-20260327;
        b=GWQJlZhKUDwAbejItzj9r1gaPlOmQ6XefmmUOp657aoQkaE//4uN5YFYClCHCPWWKN
         KnflM1A6U31m4ke1sle6O1mEZFiJVYhaUBRMYl5hmPEQSa6kJWw7mRv4GOsicSFcPf9/
         4O/nKJ7HnVIiKEC9lJbyJYfEJ0iiTyPmARMU4BJUutZfVRcfuNcEcxmz2AULS6n+JM4/
         z3EgQB8T5dy+oRQBoMYiSc3Cd9E/MwG0p8SkL41iBjC88OogaNrvFYNR29O4XxmQfp3X
         J+ZZntZP+Z4OMx3eqGoC8kmLGsrgEYwTYzcwcYph1yKkyLGdyWLmQFkAqU9oEUp3toO5
         qyIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PuwDkPB4+DP3Frg5ZiBjH6BGS1KGyNIF8NXdWFT9eoo=;
        fh=+fYYG1NBb9hx1MDoZXSrkiT/vF0DopmFNfbelYifOcA=;
        b=MhOz0tsL9NS6cBqQgfNsT2YKF60guvltIuyHZJZ/t6nvm5Avg1OHaBBNGeGf4ySwAQ
         IeolKBTb6NHxoMCU2PpihpDCoD3ddn2Iy6GOPpb+2aSbOh5PBxzwDmHXbl+8ZIreqA4v
         2+X67bSViqlbP2csv7/RybW6cbJ8ayBNmMCdZ/GUffPONqtHmzjLD9h7Zu0s4Ih6LKJE
         ZoX7IHQc0uAD+GeTKufGq7XX6k/5Bv4ZE3GZ//gtxVyCAALHkj8tqvRmZd8VvozNi+x8
         EBvbMLd4R8YGFzxXkQXFLJvdaMDf+3mpAnNCuCI2aCttIkIk2ZEUSGFCq31yff3xPVqP
         oGTg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783502291; x=1784107091; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PuwDkPB4+DP3Frg5ZiBjH6BGS1KGyNIF8NXdWFT9eoo=;
        b=gdFpN+qXO4Lu5iNemxTLlPRKJ1Jp34IxjF7BbR2ZUoKzNl8gZT1vhCAO84ZZrvroUd
         5uY43rrena5w/g3fg9H36f9jYkqbKw5236Ik8pcm2l0U2dY1XHBHB9h6bKB9///jd9H+
         uQU/9Kgso9XlOHnYe6wdubJ1CWREgkA7S2mwmd9o6WQL/m1XrjV+JEAcHj+scZHiaZOV
         bTjSSuSWO0kw/IALF+CiGqhiOA1d+sP5Sjnn7j42T5i76J0QnxrpWW+5QlYDRu5XW6Cz
         fqnK34OJ7QzWj7xjAI0I86GLfbEBuu6ICv9OjpeBuY4D1VeoKseW08sxEM88KQoFteTy
         5bxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783502291; x=1784107091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PuwDkPB4+DP3Frg5ZiBjH6BGS1KGyNIF8NXdWFT9eoo=;
        b=QYAddPI3NTf8UURegtwk4OglZIGPdxQs1VV4FhRU8xjOM/dHu7ZMQaoOaZWKHh1XFv
         m5ij9+2K3OQHvQ3g5VBqrbsjqjXksz2vzguUo16ShRUu+YL4pY3ErHWpfz+xNUHN38g+
         QGOr/HoJjVE+9tR6ZA6cukK9mjkkPRRjQjC4igFuefYqSA11vaoqJUnpQj1EfIb3gV+X
         yNKP5L6EVy/FOlmP7b6encJPKqkVA08TG6uVEzySN63mxrDl91tm5VawlVClYJMDVBQ7
         wYIxPkukd9tOHb6g/nIym2t1oZAPwSoF2hMdmTZIkWizRR4mYYtlFX78VJUoX1njJ2lI
         RV0Q==
X-Forwarded-Encrypted: i=1; AHgh+RrftILB8Ocbarc5xoT5lvyWAT51glMitnbFoSApCFt3QakDDqZqiKU8Zs8tF2R4HQhujYoo81WwkNRl+jNphdo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBl6+z5ZGfshxm1ZdpBaYWT1yH7oZNzoo8NDwz/ZDXCTTrHkdZ
	ELeW4Qr3ufg8An/OOqWKg8iwNqvqSUGbP5D803nBqYlD6hCjcUfpMX7opF7jphHkQZGBurTk6w/
	KNTf8779/g9zgLRCCVcL7AALZGCf3SOw=
X-Gm-Gg: AfdE7clZwb4iVs5f7MweEAa+Y1+lPV5T9RNznaN2PLpFyiWhz3xBaBp5fF55h4D4sTn
	O7YPEaZRyz4FtudPsRjh+J6HCraHumvKOt0YMAzQDO5WKdj7UDDKGFUFF/nG6aX6NWKenUUqhp3
	r6KXvT4SLHsKklRW5/k6FGmMNkIIbkzQX3kISzu3mWL20TV9dIh6/zactWeKMOVb1Z7L86YfN//
	IUoKfsBuz59YEj8mlHZWiqFLOfOPROxByFFRHHIvzhQoIL5ocvJLvF6X8alMNSJdZPLo9cwyk3O
	cGMd9hvBJ1aZMykYnL6TR1KRE2vW038I+JSWFw==
X-Received: by 2002:a17:90b:35c4:b0:387:e0bb:5804 with SMTP id
 98e67ed59e1d1-3894278dc04mr1516861a91.43.1783502291528; Wed, 08 Jul 2026
 02:18:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260707051006.20058-1-phucduc.bui@gmail.com> <20260707051006.20058-25-phucduc.bui@gmail.com>
 <ak4PLbAQqYrTYk6r@opensource.cirrus.com>
In-Reply-To: <ak4PLbAQqYrTYk6r@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 8 Jul 2026 16:18:00 +0700
X-Gm-Features: AVVi8CeZIxoV1cGqNdJwk9FtpcwwUCuvjDdVhAa2LOP5pB8VlRjSPupFY0VCbos
Message-ID: <CAABR9nEz9Fa64u3zv+82YTNgToi38n8eQ0aT3NMRrpyBQMAqLw@mail.gmail.com>
Subject: Re: [PATCH v3 24/24] ASoC: codecs: cs2072x: Use guard() for mutex locks
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
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev, 
	Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Charles,

Thanks for catching that.

>
> Apologies for just spotting this but the subject line is wrong,
> it says cs2072x not cx2072.
>

Since this is only a typo in the subject line,
should I resend just this patch, or would you prefer that I resend the
whole series?

Best regards,
Phuc
