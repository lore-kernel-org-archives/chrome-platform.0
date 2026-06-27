Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DB6255F28
	for <chrome-platform@lists.linux.dev>; Sat, 27 Jun 2026 09:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782553004; cv=pass; b=sKYdd7oMkoXvDJdcDdkCZWJD72lgJyXWXMwKmh/IlZab6MKKEafX5qj+tT6Zs+7DRFCuI6ahaMxNFg9iNszFjr+PnYBW0QY0U9+8L+QefXUHljd1wAUbqrKpgZKB9FasZnT0Hc0uLVz43Kze7YY6bP1kP6x26Jn69dO/aQT7MXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782553004; c=relaxed/simple;
	bh=mEey0mZ/YQUVVRfyx512hS1EOJH/O+P7h4hxapMTi3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VtdgwkDdsHiJqVcprg6mxdh3fdXn6RNXhqJ2DzJqrQL+DxBIBReL24bYt3cELmLcUGYiNlPHS0cGnE/nNCf/5zhd2bBfn0hD4KUL5ns3GR91tWZzZxKMn6WoBUX9pe9HkSa5OvoLWT6VZhiEY4afIg1Z5pc2+JY/3G7Yx1T8eGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ik8iioXr; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ik8iioXr"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-37deb2d3a82so1090410a91.1
        for <chrome-platform@lists.linux.dev>; Sat, 27 Jun 2026 02:36:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782553002; cv=none;
        d=google.com; s=arc-20260327;
        b=EGyL+R/6pK2bnvhEfYjjAKGrVwROppvF4Cw6C7fs1TYqcxaW+gTBeRRMXsKDlw3sun
         +evAHANenFbwFFMkOG1+9Msg6yDAnjgsNMAlHMo+c7casa1ZsF2CNO1cV9DrtcnQ3/Hp
         3hH59PKXri43eG9X11FR9afzZM8l8jB9FcrDh+hlYU7Anp8LtY3pCMfY7XwFf2nl6Qk3
         aU+EOnck1uVartlxO6uW039rvLiiGcLAt+Rn9StIvGSbyxfcaQqwg2wUPNqmt0q0RHZo
         oiinuUqBk10jju+Z0bFWs/FVRbsnKFd08C9OrRB/2FT1gmAN4sY9A5YVBUR//4JLOK+q
         CYFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F7KzJOcndkUz3Ry8eUCgjC+tt1RI1jNQwCqw+jy3H1c=;
        fh=le0uRNhBlSsm/ckCEhty9syiLUQDav2/U/VHsovv154=;
        b=ONVoDmmr/xJNgsQliGkC3GRiePT7DPFM20p4Vj3fPUStjXqUxb+5BqICjki7wboRIP
         0haH8TIvIPfoKnjIh/0buaPobNCY3utATvBIADIvpMPDWF6TzzVwUsNxCJ5Zd/lZOjoc
         0Quj8DJ8xGC6XCVwpfJk91J0DeUMyHiTIa/m7FQHZ+CbRwsldbBna41upxUPyfNcLyV8
         y6DaXgru87HA0ADalD5tDGExN+CJW6alrjNTyEprL0jvrI2OgxyYBv3o5oIAixtnvq3j
         GCAcWRTbpQ3NyfGtbNstN78qzEbDVVEfBaDFSpaTVjzABUa0rzU3h2pl6a1wPgAs248m
         p5tw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782553002; x=1783157802; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7KzJOcndkUz3Ry8eUCgjC+tt1RI1jNQwCqw+jy3H1c=;
        b=ik8iioXrDgCGlCExJS9+IBOE7uLuXFQd/hwgJgJiFfUl9JIFjNI6P4jUA/x6Vtkflo
         cPdHbT3oho3KPlKNNuYztJSiQSUv8A6tCLNV3zsZPtaWYNEkiRarzicgrrGteURlk2CV
         ry2UIzlR5yfITyHHKmLiINfJ3yC3ioMZol48m0oCaTsEplYSGvJwTx4tcQYwgJN1zeWv
         idGK31UpEwewNOH4DbNTt5exIjExIdgRXSu5pUtbF/rFOonfQQPN4qKRDQpwW2NWtZeA
         XV2gQXD+ZjZIGiy1tyvREs9F1j/v1GEYwBncYmb+ZvIelIIqBuHdYAIl7nnvHUg48wy/
         VRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782553002; x=1783157802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F7KzJOcndkUz3Ry8eUCgjC+tt1RI1jNQwCqw+jy3H1c=;
        b=o7R5aMO3QM6W198ZsMXJRl/vuWQ9op1rdT26gJpGK3b1xLfiFwIppzAGRBdBekLAsS
         v/fASvDrcn2Wrp+AFpteRFVsI1l4LmlgygTclpdqOpm7tohJq9Z4rgRqINbCuRhNEp9U
         kvFtwItsO8T0vNqvzPX3wgtoLvRkpkNyHKSrzsvQ5p6iUd26s7V2dNCkLIrpNVJp7D2K
         1zl4Uf16Jzwzko+ylpl0Ubwfav2Iw+3gPSTRpTqMYBkFap1ZopTyPGhHiTwzsKlB4hin
         8ZSXtOZ7SYL5zZCsOzd0em0TXqEBQMqA1nm4YQOZXRe/qaqY6oMcR9WrUeP2an6dONVt
         Y06Q==
X-Forwarded-Encrypted: i=1; AFNElJ95kZkt+jMC8B2R/sNHKZa/LUtRlFjfDtBVWYn6nWWYwOsSVWqT7umFAR/JrTL4XrA5n2jI2SGcTVIJBgsBfrs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwH74hQ+FEmycn3sdzGIVYK+Tq+BlcyzHYYb78xKPOg+WHg86z2
	Vh9DA/ga1hN3yPhX6LdHDbcOdxZzFiKXQWph/BO91EVpAYP+qoSGBa3p/bdWEE34e/AK7i/qscL
	Sj8HaHK71tkuVK+rJ8P++HilaE1zyVoM=
X-Gm-Gg: AfdE7clEmmk6N8PZcgawZhjmh9t1HeGzC97ONr0aAEx2DGkirRiD4QwpA0oqdMYic9A
	N8894qhltE1jThp+Ti4td+o3N9rj6b2ILS25IKuSfHO1qJYwSntIQu6egy0OdKukbB9ceMoE88+
	VRpBFxrRj7/Z2NhliySbBu/z9hwShEdpwLagAuLPeVmce33IDA8zkS81d6OY0ErQUYe1u5Ndflv
	xhzjEEAw9wga8Nqp3QiKXci4Z4WomDzkb787kE8rz0Wx92fswwahFO0Gysj2rmozyrx+7Owiu3z
	bhz3gU5+MB/qT83cUEnZ/zWw6oEWaUIs6rje7/3prVEATPEKgnhkI7xuAS8cZA==
X-Received: by 2002:a05:6a20:a113:b0:3bf:7ab7:98a4 with SMTP id
 adf61e73a8af0-3bf7ab7993dmr1131724637.27.1782553002174; Sat, 27 Jun 2026
 02:36:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626061329.23264-1-phucduc.bui@gmail.com> <20260626061329.23264-24-phucduc.bui@gmail.com>
 <aj5tUdjxlzkDIim1@opensource.cirrus.com>
In-Reply-To: <aj5tUdjxlzkDIim1@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 27 Jun 2026 16:36:30 +0700
X-Gm-Features: AVVi8CeL_jVD37I0a5oLVQTKzU6vWi6apDu8KwNvmQOkUF5YXGnGH1JqPRV7teA
Message-ID: <CAABR9nHdqPQE9U1jA0J8RwUpgpcnFXXvx+bTPEwAWBzLn6=ahQ@mail.gmail.com>
Subject: Re: [PATCH 23/24] ASoC: codecs: cs48l32: Use guard() for mutex locks
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
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 7:15=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> On Fri, Jun 26, 2026 at 01:13:28PM +0700, phucduc.bui@gmail.com wrote:
> > From: bui duc phuc <phucduc.bui@gmail.com>
> >
> > Clean up the code using guard() for mutex locks.
> > Merely code refactoring, and no behavior change.
> >
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
> > -             snd_soc_component_update_bits(component, base + CS48L32_A=
SP_CONTROL1,
> > -                                           CS48L32_ASP_RATE_MASK, targ=
et_asp_rate);
> > -
> > -             if (change_rate_domain) {
> > -                     cs48l32_spin_sysclk(cs48l32_codec);
> > -                     mutex_unlock(&cs48l32_codec->rate_lock);
> > +                     scoped_guard(mutex, &cs48l32_codec->rate_lock) {
> > +                             cs48l32_spin_sysclk(cs48l32_codec);
> > +                             snd_soc_component_update_bits(component,
> > +                                                           base + CS48=
L32_ASP_CONTROL1,
> > +                                                           CS48L32_ASP=
_RATE_MASK,
> > +                                                           target_asp_=
rate);
> > +                             cs48l32_spin_sysclk(cs48l32_codec);
> > +                     }
> > +             } else {
> > +                     snd_soc_component_update_bits(component, base + C=
S48L32_ASP_CONTROL1,
> > +                                                   CS48L32_ASP_RATE_MA=
SK, target_asp_rate);
>
> We can just drop this second write, update_bits won't do a
> write if the bits don't change and we know they won't from the
> read earlier. The original code was a bit odd, but might as well
> clean it up whilst we are shuffling this all around.
>

Hi Charles,

I understand.
I'll remove that else block in v2.

Best regards,
Phuc
