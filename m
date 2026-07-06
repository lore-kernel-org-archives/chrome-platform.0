Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E700A38B135
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jul 2026 10:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783334812; cv=pass; b=rsJWoa2Nrt0XlBwMoM/ufWxEAGsiIhm3lAmossJtzgaaa5D9rEo/jOUyodRykKREqRQoRnjarwnD/cseXJzKBmEYDiOqPCxxitE9dXKkM+vSfT14xPYOLVEzRwU0+vjGcvytMFPGe3dR/N2yqKc2N4NFQinQ71W6N6oMnR7uUZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783334812; c=relaxed/simple;
	bh=uUIk3kxclfHLCmTIwRsZlNP9+Z44aJAAqLrMNzUY0j0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PKHpZDw190xMhEFsiv2JB/ej3qyO23pTOg9e02vyv8/KCEUod46MlDrsRQ3dyd3oDNqJ9Kxl/6i9YDVkWYRo/o5URVuB04l/WSDqfmX9hfl6FIHWSH6fPuCPF39D+uSBpYZ9U8yHcPD+ne3IcDoNA+0RiMuzNymk973xumpUbrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvLxpsbn; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvLxpsbn"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3811e59df58so1656879a91.1
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 03:46:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783334810; cv=none;
        d=google.com; s=arc-20260327;
        b=QVEmwk5KDtFtjdNnnqUjngaaHUz22fEXRUZGjtuSzfphsS+GmtZwohBgHdul4ugbHS
         s/OlODReYnutzB7aTuNklGx1rD4nuI1epLPClXu9v9yXLoZet9Y3T2oD3G5JN8hWeXIy
         LL3KawVDoyhXhFbumJ1dwbEok+LRNG2XryYVzjn/EXSlt0FM+9+WIj4MhClckqv7Y4HW
         YlMM7/9CslNBuq1uuDQrAbLUaqSfwdRqxY5BJHnEQm9MpCqOI7KYqPN6QUf45TsZftJU
         oURxLg1Uzf2kRdLZltwrPAHVt7TCxhjosNXGxw7u1snK3ax9Blu3YOgbnx3DKbZy1z5E
         ipiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J86H9bXagD00jbr5qUyNUhzQedlVcUlifJq0za2JQfM=;
        fh=E6LeIqORgnnoqqHjJFTVd0jac7o4EZzSKkkwD36Bypg=;
        b=mnmeDDplOiv4OOhmRm7ecllhoyNepnktKtcUz7zXfmfPWcFjugTFzpD9mV+1zkIZXR
         aK37vWCaQaUyfnO8qRlVHLOGtgXbQQ5ge7Y/Woep2NnDlCr5e3NQL7GTKAvFr6FOnTLu
         I6bT2qqTK2vTD9vekGLQo9Bt58LpGukIRdtoIJbgVAYhM1kP9SXkyAbqNPDM2TP0FCCa
         aS8la84LL3QMJZbJkkptWGDmrs/+Hd8rwXmZbDHfHE2N9lolNzh0iW0ruWh1zfU5xNjO
         mr092xouvBLhGOG4sVzNeolqcHzVMuD0286ALBj6qY7z2RONDVlJAnm+sFtL0Ve17gz5
         jCLQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783334810; x=1783939610; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J86H9bXagD00jbr5qUyNUhzQedlVcUlifJq0za2JQfM=;
        b=DvLxpsbngYcCqMLuyjmivq2IroCG8nFiFp3EXM/7YtQxBP3Cont4USSqASehKO6NbM
         n17Y7Vd1WA/BbJVAfyLDIQdZ7KHYWnYl7u1rLjruYhwIwAPMoejqkTsBfEN1DsSlFmvb
         Z3Jg+nFDR6mU7mKQs2Yihzg7Vk++gxfUh0+c+O7aLHb6Ql31vXDhIGLAagr/uZwweUSU
         /apIvhrS9URwasVKSxVtBy2foPWhp7h0u6/5SFqU8QuhaaGElKT/Zw6B99/GF2o3BF6/
         nVlrY59Rnz4P77JK4yqCaCJC90x7MRpT/udYQAYiV1TBEq7O/XeDuklP76mNgv8aCzrE
         DNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783334810; x=1783939610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J86H9bXagD00jbr5qUyNUhzQedlVcUlifJq0za2JQfM=;
        b=ghhiIE8FWmmgzsf1sugldScHCS7aki4tOTbrkrDCcn24+pBsJy99QKdPTKLjx6011p
         gIPMT4JCikYUQMBqJCXD6AbvXOmKBtkRqtuW4W6N7MRIKwXaD3Y4p+Ra4l66T103P58y
         gfWopa90cMPiNf7t2VFM3pTCFl8eIG04pnVPs4y6tzrU/vQgsyQX6Dmzqla2onaqRYUl
         EoxQYWMNBrdaJnsWN3SvTlLgZiWjy/76kwGtrWoFP+Xd/MBjurtQVFVrwQHVtBtCcDW4
         ZiCpjhSfXmBwI0KK/O8UgwRIie3jlEDp8M1w4QzBepUkNv0Z+Bclg1Y4qWtjno5hfQyk
         eh4w==
X-Forwarded-Encrypted: i=1; AHgh+RrNd4PjiX6ZNF7qTvWUESg9IgNRtKrhBtIpGXs5mpu2ROPfYfoZzwxXcv2SZggNZ+IMkPBDQ8pwzMVzgrChcho=@lists.linux.dev
X-Gm-Message-State: AOJu0YyS0L9ZBO7ibxGw5rTbOs06Sh52vT5BcS10a6diBo7d2QYx9spg
	0wxuq/2gx6n+XS85Xj/bnspx7L3B3G8q0W6q+csSY6gmPcCt5Bj0BlwVOOZhhelEbFlx3NpbNca
	sraDcR5Fvd1HB+9VGri6I9rGq/MDNLVg=
X-Gm-Gg: AfdE7cmyVB44Zgc7OWBvp5xJ5kJUKf4DaRtlnwNDAyppdSYxEpPhokdDXZmwHt9oedu
	Yzor3rcyQx46ID68upK2kCoGVdtpz08LrfKEg3XXJmOYj7vTLax1pA7ME9hAJhUFn3wz3u4JPNo
	3viifQ3I893Gpv5JO7VGj5sqbrTT4bF35WKVjiiEJcaWqKA93GUoMckHlnjev3jvR+B5p5B2431
	akw8BpJlZKnZe60DNdZSzyT5V9UZpymQEW0e8NnJm8daMpZiyIy1beVeeaxTdD2K2YWtX+3GEPt
	bFQeuptsQS0wPiXr+mjRXPYVLOc=
X-Received: by 2002:a17:90b:5390:b0:37f:eb45:e058 with SMTP id
 98e67ed59e1d1-3829d70cc30mr9250564a91.19.1783334810241; Mon, 06 Jul 2026
 03:46:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
 <20260703055355.244898-14-phucduc.bui@gmail.com> <934f9346-f530-4107-aac3-1cdd2829779c@intel.com>
In-Reply-To: <934f9346-f530-4107-aac3-1cdd2829779c@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 6 Jul 2026 17:46:38 +0700
X-Gm-Features: AVVi8CfcqZEkSIP8omXIyORuxkBiX744iOmSXmoaBR0SsfvMSdawSePMoE-lAFE
Message-ID: <CAABR9nGSRH3DmehUxQVmfJ4Po8TOhfHXDnjjkzVJDZZ1w0_51w@mail.gmail.com>
Subject: Re: [PATCH v2 13/24] ASoC: codecs: cs35l56: Use guard() and PM
 runtime scope helpers
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

Hi Cezary, Richard,

Thanks to both of you for the reviews!

> > -     ret = IRQ_HANDLED;
> > +     return IRQ_HANDLED;
> >
> > -err:
> > -     pm_runtime_put(cs35l56_base->dev);
> > -err_unlock:
> > -     mutex_unlock(&cs35l56_base->irq_lock);
> > -
> > -     return ret;
> >   }
> Nitpick: this will leave a superfluous newline.

You're right. I'll remove the extra blank line.

> It looks like a bug that it checks rv but returns ret.

I'm not sure I fully understand what you meant by that comment. This
conversion preserves the existing behavior, so although checking rv
and returning ret may look a bit odd, I don't think it changes the
behavior or introduces a bug.

> The local ret variable can be deleted.
> Should change all the error returns to directly return IRQ_NONE.

As you suggested,
I'll remove the ret variable entirely and return IRQ_NONE /
IRQ_HANDLED directly.

Best regards,
Phuc
