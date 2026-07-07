Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD49366806
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jul 2026 03:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783396766; cv=pass; b=M8wrtCU+Vdf3q4LwSYf4Zf59Obeu+B9dB54lw6OGJtg+7Bqoqz9vrmiq/wf/Eq+pMbVTqPqm3FWdYtgV2pYy6nMU3sthRBYQYAMh5U6ymO5VjYvxTl1714bGWlfvxVnww9XhYHMEcBMwnCCVQSidiHmd3RAbqom4OHepOnckns0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783396766; c=relaxed/simple;
	bh=wW8FF8+t4BgI1+HOCLwaZSpb11rd33pHFXZP6vFe5NE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QSNKbJ2se0Z//AYFQnLanUxB47N9AFQ5xxigbSeRI/sHzMmE64pNl26d2EtU8eP5iwUWn52q8ea95CIRPUmqzpbqZ9yn3jLHrMAcpCSZf//L7+jo3wk1TYAWHeC6+nUUiUalfUyYMAf9U2TN3R7DH9ECvw3BFEY8YYgD9dr1eeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmgycP8X; arc=pass smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmgycP8X"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8475eca3a66so5404703b3a.2
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 20:59:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783396764; cv=none;
        d=google.com; s=arc-20260327;
        b=BedBFuarAc63JLfSp8Qc/FkQOaYowqkCpPDjTdJLL3ECEFmR3qrWW9VWNCctqWpXe4
         5dBZplzxoKb05paj7lPo2MxzYXfDf7mOn9C4u7fIvSU4ReEdOxcJJfZS7Ji7INd4znH4
         pqQ7G90neSWUzegikiaOnOUqUNrAbR/m7v2PKbmZg7fyG2uMLD4HyxlePxPXvBwIkMDH
         YGkbeYBs5dKO8RyTunW1xX1o+wVG84yERq/VLx8ZFFZmmXnjwyTcMmEraLuNUsLwr0+n
         vGKumMoHq3vXISz9KiizBNxzfPvtSk/+7WpDvYu6QaXPSw2tAbqMw7lpW1dGtV2FIc6o
         98ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wW8FF8+t4BgI1+HOCLwaZSpb11rd33pHFXZP6vFe5NE=;
        fh=V1yaSRmqKeAP5/tNc6iUo2OZs+qo5X4Qwm8fxG7yiSo=;
        b=a1RGTvsty25mcKKIYew9EAnaGLeFlnU+7nLYMWWbUTjzKQ/JSGps31B47tQaXhGDFR
         +EuGka7EtDdC/J8NqZMF1hhRqQAirNBQc6ghFlK8WJYmeUl/dE7/yUXXvcZaFyB+zvqf
         ICeGjLNlIgcYE2Q+nuSPeMwTRZeyen4OkJMlMKWeH6TU+AGzq6zIdL7cuMG51lXpYuoR
         pNy9ZJcVNUeVKnkzf/HQroGX/FnvC8/6biyq1QXpzy6uQGsN6DYOxPoohYwL692WpfxW
         xwAvrCmB7Xrm9L+PiNemAQDnqKKmeaE39/15CbDGr0yNJpTj0uN36+swMMIpyWRhsXvv
         E1Ng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783396764; x=1784001564; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wW8FF8+t4BgI1+HOCLwaZSpb11rd33pHFXZP6vFe5NE=;
        b=jmgycP8XfkjrqOaxFxfYdBHPRluf8gHmHblb8fHWHbyHRcXfWNeS+ehlkmHCqCeeCO
         4GH9Vygm9U82c8TnvoHFEV2DAJ2TaOyYoC1vVKueVAYPXQorQ7cvHuiKTWYId17H2sqS
         NffyFTN2BHgNt7AadadZVWKEAIT5NqNrIKgvGG9i3QCJ5RN1XrhRximkfYSfvL9F4Mxo
         DpHv8Eq5m668ZadcDDZzMiRUyGJynjcV4JHMqn7mPvkmmIGhUG5WX86Qcz7gp/LpqtlZ
         aW2NRyYCyvVG2O+fNSUt/By2Mz2vJcZ6QL6BTKIo1MYhdvsY7lO9g4b0oyDklZbIX0ua
         9feA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783396764; x=1784001564;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wW8FF8+t4BgI1+HOCLwaZSpb11rd33pHFXZP6vFe5NE=;
        b=accGDfaOj35zUNE9XdclNl6hvAN7VkYCacHM8xB2JumhLAl49yR7epPav1THBPeQbY
         vMAyNaECkWrN67k5LURB10HEzhMmlpa96hz26clqgqUJTj+vpNKDCeot83PWcKhRK/ay
         HfreNKjD9O39DA51H57VO8QxefcJDVHUuEQJy6yi5qm1x1Sp8Yq+MT6wM5I+hAeGDD+R
         nhMWJfMEuYXIy+WcJ2Alm3r2pBjGgIcehTUDi/2G5hZhNKFQyZ6ZZGT1Zvqc2nzwQtUW
         7MDMsidQWWujTwF4YY51I0REa9EBVp1M2ZZibXX4JXa461waecWBxy/1ZGsT7D8LTwCa
         FeDg==
X-Forwarded-Encrypted: i=1; AHgh+RpQ0tO9PwdP4QnhJm5mRNgv0Ar7G/AUpwpkbnMpHKgolSRy15KMbZLC4xVnUtVq8dnPBrAzfJCrAPKiQZScamo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz17U1AO/98l36NnmEwro49Zs7/DTN8j2bImm/Xl3uiUozL3NGn
	0ws933v3xvz5gAQpQGxeUGuMx+snPZ0YMV4feq5IZwD5Zw+IrUA3eZJEqe9/9zu16k4B0eqGN1m
	B+5u2gd9g34z3qJT49uhOU2hIgbx3e5Y=
X-Gm-Gg: AfdE7cl6zoK+VgyLna4azAge8JCdwq4sd8NpncmJ388qKWgbykBN8RjXKUAw0q+yiqm
	kjRlx9D3NFe0YVWUnzeLExuLZ71ph3oLV8HML3SFOBvfWNpit8hHWiZdQD03Y2U+aWD6UTzSUvy
	0+q9SQDLAwb7v4VEq1HYtn4nEGq/81c8iMjylMbgaN1t0DlbqWZRkQb6/nHxGdUT3o2HlCir11u
	2jnH5Ahka0Fr9iBW1AepbFY33ceXSHH+zTntpPz5rMeKFnMA99wj1+MonWHhfkej1O2VUcRhQC4
	tzhw+5ani5Qy1LEadBLgsVfkfITTnHthLiJEzg==
X-Received: by 2002:a05:6a00:9098:b0:848:2f77:e2da with SMTP id
 d2e1a72fcca58-8482f77f285mr926489b3a.67.1783396764389; Mon, 06 Jul 2026
 20:59:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
 <20260703055355.244898-16-phucduc.bui@gmail.com> <akurCIxgAE8DIaX1@opensource.cirrus.com>
In-Reply-To: <akurCIxgAE8DIaX1@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 7 Jul 2026 10:59:11 +0700
X-Gm-Features: AVVi8Cdr5GH5D3WCL3jF5XnsYudncDmTeKJyjdqU4Gu_BSkC_ifMDT-rWPN5IPQ
Message-ID: <CAABR9nFpFR5JpU4BK_mc37sVzi9qF67Pp9y7Zqu0-uj+e44iyg@mail.gmail.com>
Subject: Re: [PATCH v2 15/24] ASoC: codecs: cs42l43: Use guard() and PM
 runtime scope helpers
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

Thank you for your review!

>
> iret only really made sense with the goto, might as well drop
> the variable and return IRQ_NONE directly.

>
> Same in cs42l43_button_release().
>

I'll address your comments and send a v3.

Best regards,
Phuc
