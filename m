Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE78136EAA4
	for <chrome-platform@lists.linux.dev>; Fri, 19 Jun 2026 10:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781866690; cv=pass; b=d6nIXdVTlTKGPnFXkIgHRD/m04N+PldeRGTUiReGt6osMqg++8iSn1F6ghgQj8RYO7aOrZEK/tvw9KOTUIUikieNHtSy4h+WQYxJSRzIj64aa9EFJOwDCzQxZ6zGTzLgq1/4V8N1RCN9dqo8+AIObcQgMQp+YH4obMDTTexBsb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781866690; c=relaxed/simple;
	bh=hW1hHfit11KJ1/jbc3rz2OzpM401agNI/4AOURsyGfg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B0eVelx7ba0VuvZ2s8OGOvQAwVVvqbPiGtHg/6w3fmYH4+Q9BQFgrQPzI8y8/QocGZqT0btrNC5/am7qhfBLDfLPjIDPUlC2gEtAkBi+iKz6vPIVLhrSEVI1fk9KCWmSXFf4BLzBzNK8hwZhIPLitXBbwvulqOoWa6C5/n8KNE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CLnnOI7T; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CLnnOI7T"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-37cb36ca63bso1095488a91.0
        for <chrome-platform@lists.linux.dev>; Fri, 19 Jun 2026 03:58:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781866688; cv=none;
        d=google.com; s=arc-20240605;
        b=Q9W2nNVjhlN2qmyMZBekH2JAuYGqXuI9FJpNqJFXBgYt1oFnnBZq4TBqPq+vuWSNNs
         vRoSOtG/o46ELuxXqZxDi6j2+ZvTBrvLdbzI1uzqYCmKAfEPZrwxodD4knNIJstwMhvS
         fyGblRNAr36Ixij2UVWHWWlojUGSv4P+OZpVlGZ4Nz+2L2x4Rc+3cORd+k4LmoA1wjMx
         2izj0iUCI7ZG7qOP//5VUuNb09r1CSjHeTxC0nxIjxlyJSs/+hpkuMmt7wnK66nxh31l
         WymWZlx24CGsyDEAZ+HnLAn/jkmssgg/c/wS68quZeCaj1dMGyEjeECPYGlokRl24eYY
         /j4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UyoRbyY1ikZAKjLVrYosObC+OJksg/6It/AyYwr3648=;
        fh=NO68Cde/yPqbif+/bMTpLDM/r5jCFNAk3dNaSpC53SY=;
        b=TI9WtO5eGCbWrai8Tv1oXAP6aavTNvCVkXxa0xX7kGcX0R32p4fMGZNVqCxlV5Fv7y
         ZP4oBRoOUGHYOcRlb7wdCJtVr8CFgIuMsaRIPE/uoeoj4U/ez05zKSDiDiSKuwMUT+SK
         eI6G4BvREJq9dLqcYvX4c4yBMDXao4Wg4wGsYML33CFXgCBYIuqtxAjdBj6NE0deSg6H
         xsO3Y/XlJGOFnInP41kJJCoeIobctvgvLfo1dvtXM3femuBmIXrCAfnsIUWbugGUE4Cc
         hXGLk2UDyLyaHGECIw3iNgM3wdj9Y2ZlWZkV5AizxpbqQWHtzXBHFOfhcQO0O2NOsJlF
         +VPg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781866688; x=1782471488; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UyoRbyY1ikZAKjLVrYosObC+OJksg/6It/AyYwr3648=;
        b=CLnnOI7TrYCPWCyXyAsSjikfCmxG/F6zmi9BPDRzBOgpugrO5olf4JuVde4bQ4vqNv
         R/Gal+sIsYsIoR5tQTuBL75F3B+T0nFRhb5FRhLsCAgFa+vK45tL/RQ83IHCpoL9Iz6o
         2n4UhjhlMJEVGJek08qG4My43cu55iKQHC5+N0TUzfu2vRk+gpBAVEw979Oh4bZV9xSr
         nlrZjwtnTwCC2u4nvgcKc2jdCLBUYbe45cUsMPYNz46TrUr6iwiFploRLJJc1CzMBBZX
         XICURWt1qaCMaF6GdFaa4lrPL9YGAX+GqkA1O+qD/YqoUpTRKYSL4ngomwRXg9XIhX/o
         nHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781866688; x=1782471488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UyoRbyY1ikZAKjLVrYosObC+OJksg/6It/AyYwr3648=;
        b=G/U7UaV1vdKH6eFYYwtuCxLXr2BmS+8eSniJsAX+GenpWFM6gYAWSymS4I4kg4znfE
         gtH6/9S2CZffdcf/fJ9EROZv1OpbRAFtWUfBBOKH4X9EzQkt3E6i1QNHHJC7D8Yu/OOx
         vtiG6TFCrLESApJ6Z9srbo3A/6QBzeVHeAvLYvPTVpOxri+tVQ/7Uby9Dx8NgdpATHZj
         qPSE5bv2EduvhQRo6EPqBxHX79xXZmjNGA8Hi0Xu6QcT3KX6Iwl9qC6wjj+F0kHW3fen
         04Y6aEs4mXuRRCgsmvByZy++3E7g7vxHhNg/UpuDcTxYEgrHnvUMhj1FX+9BCSVJ2Egy
         ZfNQ==
X-Forwarded-Encrypted: i=1; AFNElJ/oprX/TjyAsWRrvCw140X3dSp8rr+L5VPqas372BI/McVLRHszzkfVJAjSST+dOjMYjS0zJvIqSDpXowgBRjQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzhSs7u+P7iuNdFBthXDdoosNKb/oVQBqNcUZBNQmGX6Cna+Lxr
	ni0Qkava/GlQBCp/e7Z6axRRlZPz/tT2hBG9bw2HrqxwsSkHOkzAsl85mU+zm8WtvYrlzral9gz
	LRFMedL01agpIiOWvJRKO1/yH/IscJOc=
X-Gm-Gg: AfdE7cmiU74AnkkirshKmj51MOQFMen744M99ZkYRsKlcm+rZwK3qwyNgAfFKu5odVx
	Uh4U2ybWiSeyE8zXaZT4bTKpm9UWwaonqtdiMM/e1jTsMsmLHH1TswFPucw1DS7rQd9O4spDAR0
	OIFxNMbfH+7YiwfN5Hwy5vOeNG/XfDiUIabAC4BMTYSUNEhN34wFzVSHMJVO5lB3m3aVIsUzbeB
	lXZzlDaTuArUqUB5gR0rT41xLrryFp+4s/qccv0I8qIgiIhHE9nbZueJe4zBHpR2tZTr8xB5OPU
	riBxsRZNesIJ5Qh1L24y0SaMlOw=
X-Received: by 2002:a17:90b:3847:b0:37c:7090:821b with SMTP id
 98e67ed59e1d1-37d15cb4614mr3550684a91.10.1781866688090; Fri, 19 Jun 2026
 03:58:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260617103235.449609-16-phucduc.bui@gmail.com> <ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
 <20260617140209.3f89706c@pumpkin> <CAABR9nG+6gOj4KnWmTyykgGN93xy6jKQh+-_f8Xxn=Jkv28vBA@mail.gmail.com>
 <20260619101346.2ec49087@pumpkin> <ajUcTfG3vSGz3n3d@opensource.cirrus.com>
In-Reply-To: <ajUcTfG3vSGz3n3d@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 19 Jun 2026 17:57:57 +0700
X-Gm-Features: AVVi8Cd_NlwUbIL4avZasgAe7DuOI7f8OOig9UU05BKU2wbfQ972D9fz9PREhwc
Message-ID: <CAABR9nGRCZ1zv0cyBGc3yuM8MeFNqBB1MkGUL7bTbtC_LcKKzA@mail.gmail.com>
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex locks
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: David Laight <david.laight.linux@gmail.com>, Mark Brown <broonie@kernel.org>, 
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



> > > > > I believe you have to use scoped_guard here, as there is a return
> > > > > from the function above, if memory serves it attempts to release
> > > > > the mutex on that path despite it being above the guard.
> > > >
> > > > Indeed.
> > > > I believe clang will complain.
> > > > That makes these mechanical conversions of existing code dangerous churn.
> > > >
> > > > While using guard() (etc) can make it easier to ensure the lock is released
> > > > when functions have multiple error exits, I'm not convinced it makes the
> > > > code any easier to read (other people may disagree).
> > >
> > > I built the code with both GCC and Clang and didn't see any warnings.
> > >
> > > My understanding was that the early return exits the function before
> > > the guard is instantiated, so it should not affect the guard's cleanup
> > > handling.
> >
> > When a variable is defined (and initialised) part way down a block the
> > compiler moves the definition to the top of the block but doesn't initialise
> > it at all, the first assignment happens where the code contains the
> > definition.
> >
> > However the destructor is always called at the end of the block.
> > So if you return from a function before the definition the destructor
> > is called with an uninitialised argument.
>
> My understanding was exactly as your David, but it seems that isn't
> the whole story and indeed I had to fix a bug in our SDCA code
> that hit this.  However testing this out, results in some things I
> find very hard to explain.
>
> It seems as far as I have managed to test, the code below works
> fine as Phuc suggests. It does not appear to run the mutex_unlock
> on the error path.
>
> int function()
> {
>         if (error)
>                 return;
>
>         guard(mutex)(&mutex);
>
>         stuff();
>
>         return;
> }
>

Thanks both for the clarification.

> The situation I hit this in before that doesn't work was actually
> this:
>
> int function()
> {
>         if (error)
>                 goto error_label;
>
>         guard(mutex)(&mutex);
>
>         stuff();
>
> error_label;
>         return;
> }
>
> Which in this case it does run the mutex_unlock and NULL pointer.
> Will try to find sometime to look at the generated assembly, but
> this basically totally blows my mind. Very unclear as to if this
> is supposed to work this way or just does by pure luck.
>

As stated in cleanup.h, mixing goto-based cleanup and scope-based
cleanup helpers in the same function is not expected, so I think
we should keep a consistent approach here.

Best regards,
Phuc
