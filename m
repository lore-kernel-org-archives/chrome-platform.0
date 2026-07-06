Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC243C584B
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jul 2026 09:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330126; cv=pass; b=UjffjgiEJo7lMxC+WvZMOEdBcJGGu+UOntssUeW4FVXrvg6TxCypPLm1AhMBugv7Q/GfluVGMBFh3SgkVnl6ZJsuVJeOepy+30cv9yoB9wcy+0IvxT40v6yKUl/9m7jzEaLIXC4vGbQJqHVTafn/7oCwxbej0OptiMFrMqMc49A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330126; c=relaxed/simple;
	bh=IQzc55iWD+GfH4NDdltIOwoKYgU+hvNlrIoMepag4/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sd/NLtcY+qqTTPXkdOigA52be5B3Rp9YhcAHtaEJEMNtPNQ4xEQLbPq8j2Ct22I13vk7c9a85Yso3jadaclXQMhIlElGVtDXV9PvWbmgRWIfuTbsuz+ofkj7AdZr3Wt8QYlnyPLzhmapGBRPcUDsP3mL9wd2kzAZZcqgEkXm05E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OeLaGSeJ; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OeLaGSeJ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc6dd436c6so11684485ad.2
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 02:28:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783330121; cv=none;
        d=google.com; s=arc-20260327;
        b=IbU3Dp+4bGA64peJf3usg5TxPTVFXhWF4xqALcUAM3SS0tf0oNOCLiqKFrvCvdpCMA
         UZRuZN4W9xCho38gLzlNogsYi++C3g01lOUoavfBkptIEeVSUt4dnpgq1lFOz2RbOWkW
         WqrsQ7HSL2+u32gjcJOTVEkTWypFkPDUFzMWUd3+o4Zi7CYfIt+bvq8sFNdAKBzd6vO2
         V5AMnq2QeKqbkXVlsWlqduQK8QIpAa+KXwF2glM3FImMZrhY7TLJba1Mbfxa9vDWCZdL
         l6opJmQRxDlSrrgcMKbRBJwZUAC0cpwHuyzkXFW4gl07Ie9l7abSNPUHWcDuoC5xLIJ+
         2Uug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IQzc55iWD+GfH4NDdltIOwoKYgU+hvNlrIoMepag4/k=;
        fh=iBDuP5XXPwLC9IjrboFiPRiGwiVZm2n+wnnR+UG1qr4=;
        b=GfeYfcBdy3i0E+AHNvXpjEhSoznv4u8Wk4LNavTJdhTlerV4QULdv/R0mxF0ZLo4Mg
         nBH+O9+Xs9OIoZFUXRNMLiJ5HsZh895ESoBK2BTRQ4gq10rsGp3dmFztih09/rAp7GZY
         6tnOkrXehcVLq1d9OpsE7/jJLMFQWbSHYM/CMu5tFrqd+HsmxtvBkuqyA0IHXlmaqWoE
         k5N9at9SYzHTpsQOWUFeZPk06QCexvmBeLToDnzUKSdFO8FUtX7JQVVoXZZlc7TMDJm9
         X06RnMsoHojM32dPHHy+DxJplNAe3lOiVtC7MSJm54eqOWPj1tqiRjgggNq5hMhNyyLQ
         nMLw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330121; x=1783934921; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IQzc55iWD+GfH4NDdltIOwoKYgU+hvNlrIoMepag4/k=;
        b=OeLaGSeJ6rrJ9imBoisvBqCO7DPrhUHlr3DE81+W585SfNlK6uVBAjeLjiwwcf1Gzf
         1ub/FQ8iHYuKofSX8Cz0BO3Y0YjPCctCfFaPicXI5XYJFivArR5uFMBKtbqjq5ukC7VS
         jZLxwDwJ2XNYFmBN1qsUtlyoIPNlGQ/vLgUZ0PXbE3nUXPNh/2Tx1mxCV5tye+ghOJfH
         7gjix4nxTpheIbQU4H6dLvTeFAcUnYSzT/ykPz7gfSoOZXwLwCLGMHu39prlM4in/s/b
         uxzXXdcxSjlNS17wkxgCmw5jZ8Nkv9mfNnze5uaCGRmbH0MZT045waHqnRXh0KLl+fVB
         E7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330121; x=1783934921;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQzc55iWD+GfH4NDdltIOwoKYgU+hvNlrIoMepag4/k=;
        b=Saahgl37OSqAELr6UQux9zfulgma8kMdClykraOCXtW+iIUWAS8pVVNTCvY1Pk4KJr
         CdOYjyTTYILCgHGUCOF66jZdoCdXDUC3KGyoUTsbcuuH/8ZxLExHOKRwfzGu6Cuw9R1J
         ns86e1b/9gmCjhJUSIh7A42tob77A1KJ/Z4vlQoDRj64EcnLoOkbqsQJRh8WHdkbQqxv
         WMY8RpNt7aJT50yDy2hG1rK4NZOMRJ1uXtYDcocfak/EBth+rc0sG7RidBqliIV4o0ye
         6YsFNdyvSUkr0Av3RRTSWSjAtKlmAMplxrikUUlwybZzaom7BGa8ktgfnLajKOSntJz2
         TJnw==
X-Forwarded-Encrypted: i=1; AHgh+RrJII7AXDWsqK6vwJZaR5RGurfHSUTX3a6ipLfHMZwrn8NG1Xirm0L33eLh8n5JZX5uK8F9SR0jU7hPG3QvSdM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFVOEIeZae35ry9K/7dXJjIOiWs9S3o7/MwZ1petGEjmTaEyZp
	NznKE3xRtjPX0frSCIfPVdHhcqRfcDskTY2d/7BRkyhGeG8eXyYMU+eKvHDjY569dgapH6OSEt5
	8yT169gF2SEaBKxklwLggjGvuUCQo5zs=
X-Gm-Gg: AfdE7cmlgxLvooq26Zomia9t+h+AwwxQJRoyZmct9Y5vbLAWru7ylTmxYJYkuEZLN70
	vWCiiXOwP8oUVgcn82gxmTPmEGuEjpk8pA1Iyf53YScq6WcsTi4qONBRgfJnUIyALPFfIyY1mq+
	ZbS3i8cxnzg9VSAkSwtKqnOb4WzfYjorzS3UWo7qbgeidtflv6SfKYsu2Ns47dpnVdG5DjOYrQ7
	sNMVUWIVqNq6AT0M/cSNExeD6SbUQ0yVRLhp7em53oenYgUvYgv50twH/PxrDyS3qgmhaUjlp4X
	/R/wu6EyY5WE8OlTXI1Fvv24OL8=
X-Received: by 2002:a17:903:19c5:b0:2ca:2079:91cc with SMTP id
 d9443c01a7336-2cb97e575e6mr99029625ad.5.1783330120552; Mon, 06 Jul 2026
 02:28:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626061329.23264-1-phucduc.bui@gmail.com> <20260626061329.23264-16-phucduc.bui@gmail.com>
 <aj5a7pgaDoN30Gs5@opensource.cirrus.com> <CAABR9nG9jDfK_wqS4Akfz5GL6HvZ-RkpPuYx4Q=vMn5jH_0foA@mail.gmail.com>
 <CAABR9nE1GAPaOF8jx1C925POe9AbgkPs-ZRSn9hiTEz-_mvwTA@mail.gmail.com> <aktttSJJchwnslLR@opensource.cirrus.com>
In-Reply-To: <aktttSJJchwnslLR@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 6 Jul 2026 16:28:29 +0700
X-Gm-Features: AVVi8CfzuDybHjqh88A3SxPfhvjmQM4SZYjfBEL0kh9FR0VnJRusuMBj2OSCXJ0
Message-ID: <CAABR9nFpYu8db-FvOB9KZ9XEygYW+Hq=DVLk_LkA8qrcxHyMBw@mail.gmail.com>
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

Hi Charles,

Thank you for your review.

>
> Yeah I guess that is probably the best way to go.
>

I've sent a v2 addressing the comments.
https://lore.kernel.org/all/20260703055355.244898-1-phucduc.bui@gmail.com/
Could you please take a look and review it as well?
If there are any remaining issues, I'll address them and send a v3.

Best regards,
Phuc
