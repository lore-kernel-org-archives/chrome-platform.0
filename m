Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDF63E1713
	for <chrome-platform@lists.linux.dev>; Wed, 22 Jul 2026 03:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784691237; cv=pass; b=u72WsQUb1GphOGBJSpacU/A5xzYYCBtp7lOEkkn5/EpmgaHPjw4orJen5S9tBmP1XKdPJ+k1F61gDtbLHbp8VTEOQ6IO2dNcaQkKz11e2bVLl0UQ9l6ce2ytTIHrj979WiLn0zY5JHLIg8yVnbGMxzrgy0P+WA2wbOjyFDUsIxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784691237; c=relaxed/simple;
	bh=TmfjsaY5vDGWro2W6B9BTuFvkBc8bjylIqjuthGf42o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P1vc5/IyfkLTHM+iBVHnh5EoXhpgHjRkBxS6Vva/omEpHB9u+Cz95ikAveiygcM/QUZLey2Agrmc0CCmcJQ5+jSMJC2F/M+DimHyioaqC1P2wWopneTtEnq30T77+WUzFEoqtNw8KCb4dvqPvSfS8depVK9bMli0RyjFz9gDXPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fGulPsLJ; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fGulPsLJ"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-80cebd41372so111756317b3.3
        for <chrome-platform@lists.linux.dev>; Tue, 21 Jul 2026 20:33:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784691233; cv=none;
        d=google.com; s=arc-20260327;
        b=AURQnqb/NAKem37eHEexM+1iRfwzicp2ZdsgcLdfaKKWQ6o4woYAirbwcTzW6U6ey2
         Eh5Dl+SFdyV4IJsr9ca2PrmOcXtGJGcuSqC09p3PqXmd1gtRcIx0rbxgD7K+o2BFVvRw
         EWU84BBJWE3nwpTmv7EL7krte0kch+koiwLjeSVn/RCRL3WiPO1zHUol/phqmWSuWD2c
         DJQ+vkyMbjtRUhUL9P86EAIEMwuj1dPWcl6Pt4gTKADFZ6mA/J9rHJCHSBeHuWBzMi6F
         0LmNRwg7GEzRnEkwHAXeGPWQzDBIa5D+AUg9O1J0Vjair23DLAEzD+VWiDkKDWIvt8va
         Otgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9KcR04mJabpHychs/QIME5IF7elu7nLc7+YdcFBgs0g=;
        fh=Z3XfsSndIFIrZvsIlr5NszzdfT5S/gsMJQdMeUOzxMI=;
        b=FY8Aj7dsMH+Ll6n6ltoxqDkaHFoXg/iYHJ9ms2kO535qMxORvkr+K+ctyceQnD2NFs
         2DntACxt0/erj+S22Nucc2xd/w/dl3AJFV+GhyywY5dB1tqLZpi6NSlz6Gjgoi51Wb/a
         01YzTBsl0w/E0DRFTO1/nK2/urrrhmjrT/YmUsk8uu0rBZ876DfcxlQrZXjwl2anNnn6
         j69TTTInMWLeYQco4C3Y6c+9zEcOdfSjatZ0974kJmQUgfWTDZDA6dVgTx2X8wgmliUa
         Tt4XAlxly16/zJ9CXosd9I0kwwtp57KBpst2uxbBdPEBwrNbdAueeEjQxqBVaLbqE1S9
         TJBw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784691233; x=1785296033; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9KcR04mJabpHychs/QIME5IF7elu7nLc7+YdcFBgs0g=;
        b=fGulPsLJ7uQ4BmLwnni0aDTMh6Wwd+T/dlXDvFeduSwmEtWkqa1G8msdzc9DerZPj6
         SddcTB6pBoWtoiCK8z18Wk1A41SPipMhW5+Cz8KWc+FOXAfNCL5hMshKN+XgPO7RaDRo
         /3OdR+xYVE+RtYUhQ3Hg3jFIZ5IA8g/3h94Ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784691233; x=1785296033;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9KcR04mJabpHychs/QIME5IF7elu7nLc7+YdcFBgs0g=;
        b=YPrSg+iOCOWzFSBXvhw9t78NXHZw8LOyscfpLP1Jl62jYN3UT0RQXTteUwT0CCC6GP
         WgdzlFd6TwCzeq2b60LZZ3BHhb7A+y26YzQMMrrZRAA/Dpgc8jtXvNGp6UlG+R3BnOD1
         m2OjHF4RcJpLJtsM2uvdv+DYiMQcfObjItSc5UXIbUTb+GdtBGlJe7LMAJ8EaR6GeQGp
         TM9SfQWg7Jout7Tpwrqo/jF31IZ6ojkjZoLsXxxi2LLAA3/ilNDU7pBIyoTJTA654Izz
         wjS7TeFgWqxS2CJwoX1+2+PCyWGUUGr5cIDfLFM6aDUb/mc2UsvmIUe995qZP+q85nrO
         Yh9Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrb/IQ1p3tPb9Yy7uy8mjoPWKmWCFRrvv674rAXO44usGgZqw5XP+Z6lKdnHEZrav1CMnnwRrEvi/TX01F0AwU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxpk6bkMHpeZrp4q6MVAOmXJlMchkypr9b7kwdki1Fyd3fBoajn
	iB+KF9qyYFWFZX/Jrrypwm2RqUpJu1J0nzasPHKtuG1fBrF5IkATOkeQrPKHDqdX4XPMo4cerub
	MkSNKjXEeOO2MGp+hWXHlMlEfY8wGzKlgkykoL0kB
X-Gm-Gg: AR+sD119q4oEXju1jJs+ZSlWTS/ScbGcNSJE1fQlUMnf1GdF1KV7MUpib10OqmWznJv
	QrR5le9L0X8OFo9KwZ1bEb7YamIcHdhWj2TK4sRJ56f+HARk/Vuaz14TxzPUtc9ngUSI3siyRIS
	+nyV7a4p3ZH7W3ZYkmhY9aXsBnkvryypoIcgz+hgIiDnO4X6yxn17dIuSz6hblT1b553qw4YJys
	oMtBl84CPBcNIbYi0XOjR7INGpCff7mnW++SyADcNKIq073qrqC0KOgw9cda/mDh7V7rzFEiABV
	DpKtFY/S1NKt6AQ=
X-Received: by 2002:a05:690c:6e82:b0:80d:f376:5ba9 with SMTP id
 00721157ae682-81ef252e359mr66727137b3.24.1784691233300; Tue, 21 Jul 2026
 20:33:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721075226.2347933-1-wenst@chromium.org> <20260721075226.2347933-8-wenst@chromium.org>
 <al9JivV0SZCiOgK8@ashevche-desk.local>
In-Reply-To: <al9JivV0SZCiOgK8@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Jul 2026 11:33:41 +0800
X-Gm-Features: AUfX_mxYNc8IPOzIIfv3TBCyd0Fs8lnIBTuyeRs9t7NJj3-mYtf52pIbJvj-z9A
Message-ID: <CAGXv+5Es0RZiAdUj-Y3FEFHU4Km6XBOL-Gk2DbTLrF-OcD54cw@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] platform/chrome: of_hw_prober: Add delay for hana trackpads
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 6:27=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Jul 21, 2026 at 03:52:21PM +0800, Chen-Yu Tsai wrote:
> > Up until now, the MT8173 elm/hana device tree has set the dedicated
> > regulator supplying the trackpad as always-on, simply because the Elan
> > driver was missing proper delays. As a result the delay for the
> > Synaptics trackpad was also omitted, as it was not strictly required
> > under such a model and delayed the availability of the trackpad to the
> > user.
> >
> > The Elan driver recently gained proper delays after power-up, with
> > adaptive skipping of the delay if the regulator was originally
> > on. The I2C HID driver and I2C OF component prober library gained
> > similar adaptive delay skipping. The device tree will be fixed to have
> > the regulator not be always on, and proper post-power-on delay time
> > added to the I2C HID device.
> >
> > Also add the post-power-on delay to the ChromeOS OF component prober,
> > so that if the regulator is off at the time of probing, the prober know=
s
> > to wait for the hardware to initialize.
>
> ...
>
> > +++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
>
> >               /*
> >                * ELAN trackpad needs 2 ms for H/W init and 100 ms for F=
/W init.
> >                * Synaptics trackpad needs 100 ms.
> > -              * However, the regulator is set to "always-on", presumab=
ly to
> > -              * avoid this delay. The ELAN driver is also missing dela=
ys.
> >                */
> > -             .post_power_on_delay_ms =3D 0,
> > +             .post_power_on_delay_ms =3D 110,
>
> This and the other delay in the previous patches are all HW-related. What=
 if
> another touchpad gets connected? I mean that the delays for the certain H=
W
> should not affect other possible devices connected to the platform.

This is a complete laptop, not a development board. You can't just randomly
swap out the trackpad. The model AFAIK is no longer in production, and we
have already added all possible configurations to the device tree. And
there's no extra connector or pin header to attach additional peripherals.
If someone hacks their own device to swap out a trackpad, then handling
the additional bring-up should fall on them.

If you are referring to the delay for the other trackpad option, that is
100 ms, and is described in the device tree. See patch 8 of this series.

Any other device with different delay requirements should have its own
entry, not reuse this one. The information in the entry is tightly
coupled to the device tree anyway. I already corrected the other device
that incorrectly reused this entry [1]. We have some additional offenders
downstream, but nothing that can't be corrected in the same manner.


ChenYu

[1] https://lore.kernel.org/all/20260625060859.1020483-1-wenst@chromium.org=
/
