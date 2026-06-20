Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A951B348C5A
	for <chrome-platform@lists.linux.dev>; Sat, 20 Jun 2026 14:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781965908; cv=pass; b=PP4C+tXb2MLnC9BUnP7lEgZV3UA+jKNgwObrej1D1NZaKeQfHlQiq9pXM1R9fKfPZZWqS60S/H0xT5w4TQ18KqJvqz/q+Hxn3t4Unfupftza3+f+Bx9D/NxCYzylqHL1fA4Tvqh9eZDXpC8mU525ElhtR/NbKMAOvvyzxffSNWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781965908; c=relaxed/simple;
	bh=wuw9iRRPLEm93Drmsp59C6lLObU7hu/HqKhoKxWsquk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qeNQMQ9Jgk63NqaymzUou74lInRzwkj88Fh9zYPEHDhwDuy0PtL1A4h2uxw8UR5OVUsVIB7jODqndZG11TjDiEj6yJXPHXLmA17hglOt0nbxui3ULe5bCy4QVu66d0adqjuj1iDdkWLte9/d0GIaGCU9BBhdLxUFVRTCNnV6q0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXmzaGPR; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXmzaGPR"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-37ce68a54f8so1798080a91.0
        for <chrome-platform@lists.linux.dev>; Sat, 20 Jun 2026 07:31:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781965907; cv=none;
        d=google.com; s=arc-20240605;
        b=AAViR1A3h18l30Adr9YHYMUMHGe/c57Qb4zHa3/DhVOjk+dWf03ipjieHW9wtSXfMe
         hdtfQPA3tA9gvAtwuohuKfQp0M9k9TJDZJfAgCsBzuqEzKXT4dWTHZSQaJrOcjV3VVyh
         O49qWnMXqfAadv1dJz/HfSgsgmWWK+Q/+9Wuy6D5bpFGiyJSm8FHRHtotC3I1MwRD/LL
         YMzHBKwMOAYV9LSmM8Oi3/Wnx3U/ak5JnFFci7+B0AurIulemha2Mg640LtMyciUMgPs
         /OlJ7uK6mx+rm1YiWFRBZZEO0vHx9z8aSMO6AI0o53fQaIkOUVVLziQ5s7qo+W3JvALU
         21QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yoAOMy3f2Itr67+DkmQlpGnqzcUNVVNmM/LFKYJbM+k=;
        fh=j8j2131hpbCVGTPxtHO8QOxFjt4I9mltdZsye7t6lYU=;
        b=Oxnhx/sUMgVXPQ/UGeGdY/+Hp+oAjBjcYha4vGXuAj/Qv/pyOQ3Te35wW02yJoTr7c
         4Iqj6P5xGz20znNCXGOiirAvVw9gPQRwA1e64Yw3ktmxXrijC9EMZsrqw3WMmRmn+2Wn
         N1fRB1ds0uQM/DqtrjIKADjEYFca7eoDDacvo9xxmNTxP5jigLCvnt1iUvwoE3p8oCUU
         RT7FEhHTqw6lRUvRcWLwh+fp5MrJ3xpXaFNAb2Eg/2eVlidI6STPl9QTObB2MeLAsXYM
         jJxQF1b1Vbw/0IoodwLYfR/fvQPkV/J/daECPVdeI1EdY1z/20DKNow/wSOau8Ff+aIe
         Vtbg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781965907; x=1782570707; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yoAOMy3f2Itr67+DkmQlpGnqzcUNVVNmM/LFKYJbM+k=;
        b=LXmzaGPRX6AX1zelsx6Bssh8iUjyqf+Fc8lrrA1nunNWM2Tpzda7JPYud2sZqu6ztM
         +2r2Rs+7XS/BafoSqDr4QtGpHkE1MAvApTRfVfwakjjVEfhtaK/OygCuCLpcZy+ah1jf
         7VVoTpKlGAUp6+yoqRuay01N7OU06t5/dGjdRm4WJGUzc2tfRvblvg0vI9JTcK8LOYOB
         6s/EV93uLsP3/9Qau1lSt3maXIMq5keWZJ4yqY2Q2urkk7CrB2DeI7iZq7qjmOwN6i2g
         Bzzd09rc+yqFzsmmINUQs266edlYsRJfYdf0xRA4rs+uo1p1vevpE4W4cs7macaEq8LR
         hHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781965907; x=1782570707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yoAOMy3f2Itr67+DkmQlpGnqzcUNVVNmM/LFKYJbM+k=;
        b=jBgXBz2Mm0+Lj9YiELl0hs0nv9w0B2JDOdX6JCLIUqRr0tAeY0i+jisVYS2GfUsEwA
         lTLMjHvk2fEhNighxUDtWTSTyvVjRFNBHquBuSoAK6hZrrPM/ffPXClcoC5ORlMklNI4
         eLgCCIgEZ9UxixgjZXo83nAId+LXZVyNIBH8AaWXyC67tD7ccruXFQHQ7Rp1LBnNO3wY
         3sLUt/uoMT4H/NA/YIs8iserLZXoS8KbBkDIem1AGcJkiVyb2ao7vbD8AnW8W+FlbC31
         LfFcpxKdyhllL0Dy9bI1R+iOvCTLOwQHw22vxQMUjpj+xmwzZm6VEqeJGlYejO9LVkFV
         2ayA==
X-Forwarded-Encrypted: i=1; AFNElJ/zCu899FuQkRfc/T5tq67obbREHMVXAaSJGddZgYGciue00buOFmdpSY4EHY/In6Zj9bZ9n/pyd26YUEN9/1M=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZuuFEWoAFv6DcsnNVFtx5ISlzrlyPaEMfdJqn5iRFDRG06zvq
	7GzTmybx0m4jvpd8tCge8vG8eSZaASL4YpLYNZkZDDeccdcr78s92ivYL+eOhZP4ftX3iWFsTXn
	OP8qa03HpfoYiTIsJ2yWzbyzNaQ8x+3I=
X-Gm-Gg: AfdE7cmu5FozBXoHJ1aRpQX8DpQrCBSKdpRIzLGBgfgnt0FOM7y/3Xc4elBLIfJIGor
	6UhFnV3Dbp8HQY8+v6CzTZ/iJv/dsKdGNDT476Y6gpfn6gcU5dEd3h36xU2LuH68CvRD9iPlKt6
	Zxjw9dU8rs/ttUD7URq1xXjR/CuLiBX8WsDDVHiJc+T8d8A3QrhNsmWVzKun3Gk6P7Lu8QSggcJ
	V+5dWCkp8a9qBzcLzaZb7z/1LCAdrY8npMIU0/sURb0ENO6gL7zIRCNxuwaZFY7sryZZ0wMrcJA
	wOQGlVkbGuMoVyJeiVydo3gCB2umDlCG5x4y52ZL94G/yEb4+lS/mbYCAbJkNQ==
X-Received: by 2002:a17:902:c40f:b0:2b2:4d36:7ba with SMTP id
 d9443c01a7336-2c7252a8057mr74037005ad.0.1781965906891; Sat, 20 Jun 2026
 07:31:46 -0700 (PDT)
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
 <CAABR9nGRCZ1zv0cyBGc3yuM8MeFNqBB1MkGUL7bTbtC_LcKKzA@mail.gmail.com> <871pe2kcif.wl-tiwai@suse.de>
In-Reply-To: <871pe2kcif.wl-tiwai@suse.de>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 20 Jun 2026 21:31:34 +0700
X-Gm-Features: AVVi8CdmzIZOlmsJ02kZGuh_kzjdhPUos4g5dG2tFnwGhCYx2Sp6G_przK0DiY8
Message-ID: <CAABR9nEdHwXpg8+6J5L9Af1PvybGt3KSfRy=LnMHXSQSHnd25w@mail.gmail.com>
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex locks
To: Takashi Iwai <tiwai@suse.de>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, 
	David Laight <david.laight.linux@gmail.com>, Mark Brown <broonie@kernel.org>, 
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
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2026 at 6:14=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Fri, 19 Jun 2026 12:57:57 +0200,
> Bui Duc Phuc wrote:
> >
> > Hi Charles, David,
> >
> >
> >
> > > > > > > I believe you have to use scoped_guard here, as there is a re=
turn
> > > > > > > from the function above, if memory serves it attempts to rele=
ase
> > > > > > > the mutex on that path despite it being above the guard.
> > > > > >
> > > > > > Indeed.
> > > > > > I believe clang will complain.
> > > > > > That makes these mechanical conversions of existing code danger=
ous churn.
> > > > > >
> > > > > > While using guard() (etc) can make it easier to ensure the lock=
 is released
> > > > > > when functions have multiple error exits, I'm not convinced it =
makes the
> > > > > > code any easier to read (other people may disagree).
> > > > >
> > > > > I built the code with both GCC and Clang and didn't see any warni=
ngs.
> > > > >
> > > > > My understanding was that the early return exits the function bef=
ore
> > > > > the guard is instantiated, so it should not affect the guard's cl=
eanup
> > > > > handling.
> > > >
> > > > When a variable is defined (and initialised) part way down a block =
the
> > > > compiler moves the definition to the top of the block but doesn't i=
nitialise
> > > > it at all, the first assignment happens where the code contains the
> > > > definition.
> > > >
> > > > However the destructor is always called at the end of the block.
> > > > So if you return from a function before the definition the destruct=
or
> > > > is called with an uninitialised argument.
> > >
> > > My understanding was exactly as your David, but it seems that isn't
> > > the whole story and indeed I had to fix a bug in our SDCA code
> > > that hit this.  However testing this out, results in some things I
> > > find very hard to explain.
> > >
> > > It seems as far as I have managed to test, the code below works
> > > fine as Phuc suggests. It does not appear to run the mutex_unlock
> > > on the error path.
> > >
> > > int function()
> > > {
> > >         if (error)
> > >                 return;
> > >
> > >         guard(mutex)(&mutex);
> > >
> > >         stuff();
> > >
> > >         return;
> > > }
> > >
> >
> > Thanks both for the clarification.
> >
> > > The situation I hit this in before that doesn't work was actually
> > > this:
> > >
> > > int function()
> > > {
> > >         if (error)
> > >                 goto error_label;
> > >
> > >         guard(mutex)(&mutex);
> > >
> > >         stuff();
> > >
> > > error_label;
> > >         return;
> > > }
> > >
> > > Which in this case it does run the mutex_unlock and NULL pointer.
> > > Will try to find sometime to look at the generated assembly, but
> > > this basically totally blows my mind. Very unclear as to if this
> > > is supposed to work this way or just does by pure luck.
> > >
> >
> > As stated in cleanup.h, mixing goto-based cleanup and scope-based
> > cleanup helpers in the same function is not expected, so I think
> > we should keep a consistent approach here.
>
> Right, and IIRC, clang would complain the mixed goto case at least
> with W=3D1.
>
>
> Takashi

Thank you all.

In fact, I have only been using GCC for building and testing. It was
only after David mentioned Clang that I decided to give it a try, and
this is actually the first time I have used it.

Also, thanks to Takashi-san for adding the W=3D1 build option. It helped
me catch and address warnings more easily.

I will send a v2 to address a few remaining goto cases that slipped through=
.
In addition, I will switch to using guards for PM runtime to reduce
indentation and improve code readability.

Best regards,
Phuc
