Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F241F3624DB
	for <chrome-platform@lists.linux.dev>; Fri, 19 Jun 2026 09:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781860432; cv=none; b=Rf+0LYDmxYrBt+ZPAYN1D9foAjzXDEg3ZIguj7oFUWjSnXYLgZfxmum3BU1OxSkK/IM4vC0Qr/LEgCpim/5KqjZ8tpTaY7sJL3WwyZy975H28rJkQIZJ2wSwgQAu+avydBK8p1VKOuypt48+DCYHnvyN4i4VTyDd5sRpkm88eXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781860432; c=relaxed/simple;
	bh=lHzB6EZ41MiDTwBOkyeJrpZ0oY0kME/5CGkptBf/jlg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ns6+nksTn8R57HrKQPiCrjrJlmdrqMoIYQCqIqB7p/nNO7U0GHlRUtJzfzXKGgwItXb8GnleKF+95r5Rl/qFZErZc4fVpgoXKoQLXQYb9pPmufB4MnGlvqtqGBoUL8XtCREIq6t3qXjGF0stKIgz3slqcVsaP1Y9ndOkD3V0FIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYWxBFee; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYWxBFee"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4645995069bso1050220f8f.1
        for <chrome-platform@lists.linux.dev>; Fri, 19 Jun 2026 02:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781860429; x=1782465229; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsrGIaLO7MXNYwDCXl5rLdyTY6/tEE8Vl4Mj+GBAm/g=;
        b=LYWxBFee5C+IkNhjJv+lMKH2WipIc4uFNGOcUN4Aus7lUnN567lymmuEKpgFni+pB/
         zC5azEDfY0C5eytNXf7Tp5ktZ/x6MuQyb8w8iI5G4XD6DwrSU9wsfatoba1SWMlq4eM9
         WRvkXDwoG83xDoMUQI4tYV9rBTRaNppW6VCGqnwg8wa8TtRq7UCGHXR0cLrrYNeSc9+d
         7cRSVBmixMFhCiQ3mLntm51P2kEwE2fvpSWHPjNqjbbUCeZbghOOqzMbc3PYskO9NJAP
         1svUhXCcit4nrnGOHmxcMUHNoaP720/QXRwkVAD9ZPnmw+6bCoI0j326OETT7d5+zVq2
         NQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781860429; x=1782465229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IsrGIaLO7MXNYwDCXl5rLdyTY6/tEE8Vl4Mj+GBAm/g=;
        b=UE8qqBgo3nWqiLMdoxOva2J4bxlP6XezdNuGLwdW8Djc3D8CEOOcFxY7822b8QBIQZ
         J1vn1xvoCLAH9vMoiEtnSAbHVnhaW4QgQUM1HI6fGxF9J7TppN2K2xW//CRazWNX/cKY
         Y6KzGuGyxid25BPda9JAGol7NtYrx25oM9XqS3YOCLKik2dk4NXdKcf3lmI3aRNf02I5
         5ntLzfwhhbOLAntaEV8asrePNY4ml05eEFq9HmZhEEMo0ss1acF8jKNRVc+EmPwh6kPO
         4ZUfAcJj0PuU9ZC0yXI0e4h1WfiEHDg0R1k161eNmN0vwisdgNfhh+2WqZDwFqfT+X8Q
         9zhA==
X-Forwarded-Encrypted: i=1; AFNElJ+PruQAofmRjeCAOyUOHsNdr3Lb6pBMVbDGdKwrZr9J92cqPt9yH9S8/JiM0o5zuZb7GrluzfI0Wd///t5bfxE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyoPJkUuA0fduBwLvRtj+UMB6NU6i36DN9bHQAs6feqXCzII/YQ
	cRVnFSMPVs0riwdKdRTbzdnJj2boOFIT4m7S1qzx2Q4RWOt9kL8y3eA/
X-Gm-Gg: AfdE7cmxYEW8b8JxJXZN2fkBxqY7cRz8hrmc0dasBX5dyUVmdwWv7wbjRmOFPLLTRQZ
	ZzbcqUOFQqkTeZ3+m2wMSS+1/hUIKL9vOaRsg3Klu4ejQCULe8ldhMVNg85dMHSKjxc26fGpiwz
	5o12G4YmG9BaHV7AJiVRBCSKZgH+XAqjpMrSQB3jyBbM6fSUgGlpg1/7/fWJYlNh50pI7/WY+yT
	qs63GclhIzTmiWKwkSJLaZh5omAN6+I623kf63B+WdFiArgySzCFltySEOECgK4BWbFO4k9NNxP
	CQqpNWKJxRfvg/4cYkAtCSFHh/G684zLBQbY/SRKsIGLC73PDNFTDyA6CxZtUjWW0/JF2BaZx3Q
	PGSymDTSJ7ZJKHae9GuaHhodN3y2ZlwuxULJUO9NQvGncyD90LbZ+pZIQzequLYVbrjfztzWbgk
	STjhnenaGE5YUJ3lk+c2vRnry29wmx34dbaD9v76EEODK8+Szjsg==
X-Received: by 2002:a05:6000:41ea:b0:464:5df5:332a with SMTP id ffacd0b85a97d-465026e230fmr5178308f8f.34.1781860429313;
        Fri, 19 Jun 2026 02:13:49 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc428d9sm6387329f8f.27.2026.06.19.02.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 02:13:48 -0700 (PDT)
Date: Fri, 19 Jun 2026 10:13:46 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Mark Brown
 <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cheng-Yi Chiang
 <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck
 <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, David Rhodes
 <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
 povik+lin@cutebit.org, Support Opensource <support.opensource@diasemi.com>,
 Nick Li <nick.li@foursemi.com>, Herve Codina <herve.codina@bootlin.com>,
 Srinivas Kandagatla <srini@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Shenghao Ding
 <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
 <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Oder Chiou
 <oder_chiou@realtek.com>, Lars-Peter Clausen <lars@metafoo.de>,
 nuno.sa@analog.com, Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
 patches@opensource.cirrus.com, chrome-platform@lists.linux.dev,
 asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex
 locks
Message-ID: <20260619101346.2ec49087@pumpkin>
In-Reply-To: <CAABR9nG+6gOj4KnWmTyykgGN93xy6jKQh+-_f8Xxn=Jkv28vBA@mail.gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
	<20260617103235.449609-16-phucduc.bui@gmail.com>
	<ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
	<20260617140209.3f89706c@pumpkin>
	<CAABR9nG+6gOj4KnWmTyykgGN93xy6jKQh+-_f8Xxn=Jkv28vBA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 19 Jun 2026 15:20:37 +0700
Bui Duc Phuc <phucduc.bui@gmail.com> wrote:

> Hi Charles, David,
> 
> Thanks for the review.
> 
> > >
> > > I believe you have to use scoped_guard here, as there is a return
> > > from the function above, if memory serves it attempts to release
> > > the mutex on that path despite it being above the guard.  
> >
> > Indeed.
> > I believe clang will complain.
> > That makes these mechanical conversions of existing code dangerous churn.
> >
> > While using guard() (etc) can make it easier to ensure the lock is released
> > when functions have multiple error exits, I'm not convinced it makes the
> > code any easier to read (other people may disagree).
> >  
> 
> I built the code with both GCC and Clang and didn't see any warnings.
> 
> My understanding was that the early return exits the function before
> the guard is instantiated, so it should not affect the guard's cleanup
> handling.
> 
> Could you explain what issue you are referring to? I may be missing
> something.

When a variable is defined (and initialised) part way down a block the
compiler moves the definition to the top of the block but doesn't initialise
it at all, the first assignment happens where the code contains the
definition.

However the destructor is always called at the end of the block.
So if you return from a function before the definition the destructor
is called with an uninitialised argument.

This has always been a problem with C++.
It usually happens when you define a variable inside a switch statement.

	David

> 
> Best regards,
> Phuc

