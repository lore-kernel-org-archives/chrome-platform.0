Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB7F3905F0
	for <chrome-platform@lists.linux.dev>; Sat, 27 Jun 2026 09:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782553845; cv=pass; b=D3LJXy3cIVrUub1mpsK/KiqimQrH0rTZhtB1zwmFTOVT40TVHDCBvj94hjV78RLFXyGa5CXMzYZCSg1HXWZkPENo1qpwCwhL5tHfi0a35eo5zSksA6/A5jxz5VKu7dPZiYGPceYc9xMXLTCl9nynyB3HiPIfmDbcU8mFJVGAwXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782553845; c=relaxed/simple;
	bh=hME/qbAWxNKH+RRiKD6tgYF/Qxg68RqOdtZkGoM7bbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nMhVAa5Xv9PwElLZKW6IcbvhgQPj89Moq5KvjqWLixKpMkiJtq8OKZmEqKcn6Ln8Uiq7/lecPS5Tng9RJZ3aD2Yy34mftBkoqSy+j3M2f9JovlWMaghZokvB/IQslRX1t8ghJn7QfShqBrd4wuFJMdrTu+jZLM9MXIurIMC7C2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDO1JG5B; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDO1JG5B"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9505d2cbc2so458892a12.1
        for <chrome-platform@lists.linux.dev>; Sat, 27 Jun 2026 02:50:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782553844; cv=none;
        d=google.com; s=arc-20260327;
        b=LGaoR80EJo6O3eBH57N+QLh/FPsFQChAprLF3nEhmDBIKnehChxXGAQjwuoRKp8miZ
         kVTH8USCqmHG6mQDcxfGuIXtdmdU7Fi1kk/J+2N70hZ7mUE/aa4X1iVJlqqimFAMH2OY
         4uGfgYFShJq6mXl21WVNiP5pIwrbsIbzljrz62qpUS1HgAELKTeIXiu7VnnGvtTyYXLb
         OP7uTFlUfZHUA4K0reLvOzOjLkv2tiZ9QYQ3hwbLRZX/CYYbDidIwjZ32X1RgliY4i+5
         PuJHrQgiCZzS/lyhlQ+KlzCl+MHYSJ8QKeJkLCdkItT3q3E0pqRev6VHE9SCT0capBJ2
         L2hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gT0GxwXTPeiXfy1e692gDaxTDVIJ9Mn/wPIQ0mt3tv8=;
        fh=3I2PKhoJ9VKXuqJXcNEmaTot+LbdH0h8OkP6jFx7MAc=;
        b=Ru1IkfHwcKp3kZLWHBgreVS4qrOHxJrJ5PfBo4/CF/zzTXnmwCxrjd7mvPJCM+wUK4
         0fCUaVGBe1OnrpyelaWYzV+5Js9zXovfJf74Tc2GDuGhf7mVq0edB5SucIZ/dTnhxJgS
         vce1aTIJgAgbTdKWP3akFiJJv9yAD5ILG/ivQvQMbJprc0m4sFW6bqfOwxDbozlE2ouP
         nxybGHjz9+HSzO+lTyzFzqyjglBvT2nIdpX9eNGRvsDfYHZPsjhvYDD0gwDiXy+xk6gU
         z/PGLNQD/QXmyQdlBRdd3pO8++MetKExUvq0mtnWTje0pUXj+mJmmADSXRG4HqaD7sUZ
         ZvPg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782553844; x=1783158644; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gT0GxwXTPeiXfy1e692gDaxTDVIJ9Mn/wPIQ0mt3tv8=;
        b=XDO1JG5BfXDrOtTvDPLnItTYxX5dFv8IWyCzKtWaOap8KQxwbmEcXthD3B/o81mDFJ
         Oenx7ZEFjU/UIxn0oz0vafTLuLfVeJVlr5dxfwk67dodg8+tp+EuMQw1QrfiLYFdzZE5
         0yDExYrO/FLg/qq1NTzljgOg1i49Xetxd3yCAZ4rWRQX7QwntSKHjLrapH+y6HzVMrQi
         mDp4BGULlqaZSERobN/qOz3NmELynidebxyfZQAy2tOaaySPtouIdErvm9mOIILMyWcE
         CSy9CZUQk74canNkdIYwLlOBuPIh5NJiL1gx/aIvakQ4QH4usrtSNSlHUBAaKrDmXRxF
         H6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782553844; x=1783158644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gT0GxwXTPeiXfy1e692gDaxTDVIJ9Mn/wPIQ0mt3tv8=;
        b=jO/Y1DV3qUCWxjB1MYqA4INYetMVteF2mlkydW52r4bmqfE8Ov2uAgRAo+V02NX1lN
         fZy51GAv4/VbemWBsueJNLxlvQWGYb/8T/DTcND4DfQj6DGMumvaWO4q2dOYg4gzRA31
         NhWm6jDOQykcFXUeputLyw4obBfPtcZSvcDGBliV8I3jwUMOhu9yqd7YKyG6iWeohg5G
         NCtqp5htgz4SqaeAj3kypUqS1IzG1ZCefVGTpgpiyzwXP6wIgG8CV2X2LEhBqlpkWsc0
         albYP39YC01M98L+Yt3SUtFI9InLXEUN+zFhyx3IlcEACsvArEq19NdwOOKd6wj1bAva
         M6bw==
X-Forwarded-Encrypted: i=1; AHgh+Ro8Mrxod7eCYYja0m/gZ1nPO/YeE9UV2yqO78aPQakb+kS7rZyJ49DiGGd/LjrcF+endVy/IU/EuZ8JqLhtNBw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+XUrTnn5+nxtOsQ5dlolV75DSp8LBWH/x/6O92F3Mnjj+4dtL
	I4aI2Ym2AV7H0+oveksxw3iCLetVldxCoeZZZ0sl61iDiE0VRv0Y2lffY1mhCNRySKMP/rGVyYR
	M3C6Dvxb6x+r5g2LLU7izIe15LsSDv+U=
X-Gm-Gg: AfdE7cmqUgQ7Ul1v8Nfl5MFRcuMJi+JPWE769bukzzBux/IiuRFt4R5ciordJKXh6rv
	+t66qM8c/J/4qy+dFrG6nsbdGeQc5hP3ZOG7QJuleh+NERqTsFJaGCoxyJQcA17AuCfIw/ud6wC
	MfMzaKtH8YBLUdJqvse/Nh4kIuw5fT9r6ViOxBXArD0CVEk080ff3jjV/jbj999Rgpvj2LpUyyS
	91CVJs9MVTScMXocbSidbFtTjZwyfvLcaziwqKVvFrS5wNMJrnDIDmmRwuCRiv4d8nGAVB6+9Px
	8sAbllYTmfKRfYfRm8q0byNLmh3MctmigW8EDVB75glRHWXoHIPfdv2Ly7bBMg==
X-Received: by 2002:a05:6a00:94d5:b0:845:ddc9:2717 with SMTP id
 d2e1a72fcca58-845ddc97bd7mr1049159b3a.4.1782553843902; Sat, 27 Jun 2026
 02:50:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626061329.23264-1-phucduc.bui@gmail.com> <20260626061329.23264-16-phucduc.bui@gmail.com>
 <aj5a7pgaDoN30Gs5@opensource.cirrus.com> <CAABR9nG9jDfK_wqS4Akfz5GL6HvZ-RkpPuYx4Q=vMn5jH_0foA@mail.gmail.com>
In-Reply-To: <CAABR9nG9jDfK_wqS4Akfz5GL6HvZ-RkpPuYx4Q=vMn5jH_0foA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 27 Jun 2026 16:50:31 +0700
X-Gm-Features: AVVi8Cd_wdrnWNlCE3sFhO5Ei165WoKyvN2rXVN0sU7ML0KMoWVobNpNmXuVrxo
Message-ID: <CAABR9nE1GAPaOF8jx1C925POe9AbgkPs-ZRSn9hiTEz-_mvwTA@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 7:57=E2=80=AFPM Bui Duc Phuc <phucduc.bui@gmail.com=
> wrote:
>
> > > ---
> > > -     if (!jack)
> > > -             goto done;
> > > +     if (!jack) {
> > > +             regmap_update_bits(cs42l43->regmap, CS42L43_HS_BIAS_SEN=
SE_AND_CLAMP_AUTOCONTROL,
> > > +                                CS42L43_JACKDET_MODE_MASK |
> > > +                                CS42L43_S0_AUTO_ADCMUTE_DISABLE_MASK=
 |
> > > +                                CS42L43_HSBIAS_SENSE_TRIP_MASK, auto=
control);
> > > +             regmap_update_bits(cs42l43->regmap, CS42L43_PDNCNTL,
> > > +                                CS42L43_RING_SENSE_EN_MASK, pdncntl)=
;
> > > +             dev_dbg(priv->dev, "Successfully configured accessory d=
etect\n");
> > > +
> > > +             return 0;
> >
> > I really don't like this duplicating of code blocks, it takes us
> > to a situation we always need to remember to update both blocks
> > in sync which feels like it makes reviewing future patches very
> > error prone.
> >
>
> Hi Charles,
>
> I understand your concern about duplicating the code.
>
> My reasoning is that duplicating this block once lets us eliminate 12
> `goto` labels,
> which I think makes the overall flow easier to follow. To me, that's a
> reasonable trade-off.
>
> If you have a cleaner approach that avoids both the duplicated block
> and the 12 `goto` labels,
> I'd be happy to adopt it.
>
> Best regards,
> Phuc

Hi Charles,

I'll factor the duplicated code into a helper and use it from both
paths in v2, for example:

static void cs42l43_apply_accdet_config(struct cs42l43_codec *priv,
                    unsigned int autocontrol, unsigned int pdncntl)
{
    struct cs42l43 *cs42l43 =3D priv->core;

    regmap_update_bits(cs42l43->regmap,
CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
               CS42L43_JACKDET_MODE_MASK |
CS42L43_S0_AUTO_ADCMUTE_DISABLE_MASK |
               CS42L43_HSBIAS_SENSE_TRIP_MASK, autocontrol);
    regmap_update_bits(cs42l43->regmap, CS42L43_PDNCNTL,
               CS42L43_RING_SENSE_EN_MASK, pdncntl);

    dev_dbg(priv->dev, "Successfully configured accessory detect\n");
}

Then both paths can simply call cs42l43_apply_accdet_config(),
avoiding the duplicated code.
Does that address your concern?

Best regards,
Phuc
