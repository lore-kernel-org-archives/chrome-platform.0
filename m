Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371E63AB466
	for <chrome-platform@lists.linux.dev>; Wed, 22 Jul 2026 09:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784711179; cv=pass; b=O1WLVf6cyiVIaOoZ4b9U8F3eDzz6InfvtLNM6gUJDKjxkCBZD35WdWF2LtZ9D7oeqOzVUcF6TY8zNAuBSqIiWZlysjz/7Icb06sshP+BFONkAQoRg1xT8ekBLxf18omj23TkVlGcRfhvfyVgqL5IrgxtV1FRxysI64MYqJ0zJ6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784711179; c=relaxed/simple;
	bh=BLf9RFIv5pi/wJMaN0h+Ctg6fapOu6Q9G57hFPSuT04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nm83Yth++Qr4MZA8zK8GBGrFr8DOrVqvP8byHikJ2bVeLDPeTeWQf8yGNt3TkF5DaVajhEZYLZouppE/d1Q9h4A2qZDtpgcQRbkmS8TzU/ciP4e/GKdYrty7fG8hP+qNHhDGWoG55G7xrtRhQV553jWXBr3slb2f3NylsWoTzm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cLLNXdRO; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cLLNXdRO"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-664a09bc459so16109220d50.1
        for <chrome-platform@lists.linux.dev>; Wed, 22 Jul 2026 02:06:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784711177; cv=none;
        d=google.com; s=arc-20260327;
        b=KO0x3gV4nLPTUyvCuPEQms4pfXTFVUp1CpyRpg2kqkBZwvuujaNxDTbGOLFD5v80Hp
         t6qemh7GN8Wums1VZ7G1QVqOqNRC4smZOFd9Z8GKO33LfA2+2G/MWvd/qK1WaewsDxkw
         vFnJ1R+u0rhcZ1s4iP1m1A7Z1ISQXgMPdwINlV2I0ZctWb7xDZ7/4HzeGbzCEKgvGIm8
         uK8MuO1gXQVE3EhrlhyLa6F/xOkSA2QDz00p0ify3AG3StqYc0ujsjA9L5I7/w0eedOy
         vzwqnE+vhNBtKMyW8adyDtrjMOatnqStzq0JT70V3LJtuheUDBA802sXXi9uq2gYA9Ft
         cUtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fzc7jLJOwKFZM50nrRR9HIoeoA67mID89Z/e+R2bL4o=;
        fh=GBq8heY86NIwsB5yEcXjnq8gTbroWyMqT3NIbuRSKc8=;
        b=IE0QypLfGYo0kow7ddIOjy8/XSADzPcqWqe/15SN1xm+NN5xc9XewRx4gA55NJ7MKI
         fI+5yF7McQ63a5BX1Qc2sxcDqfnpVwBnYT7xHR9YMiPJbGU7emfeGi7E7QtUms3vUhI4
         /Iy3va/R5tI17V1E19oO4fB0DDF/A/xLm0HCRw5vkTiwG24FVKUC+vefRZYAx+rSoAAM
         E6gE38MWY818VSnZ0PWf11o4z4ZmToiaXFWpCkhl5VH6SdHJ0ICx640fyIrOeDVgCkFe
         UZxTt1cX8p+YsUExpaaMzdliis3+haJZ2Hvq4j1GBxpKa1KT9CnQer9SV7FOgSIIk00S
         iKbQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784711177; x=1785315977; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fzc7jLJOwKFZM50nrRR9HIoeoA67mID89Z/e+R2bL4o=;
        b=cLLNXdROz+Zn1jfAgdn4DnImgp3RcIxXyfVCANh2DSQbqYe8tvgTxjeLx0Fxnp9itu
         ANd8J4CkG4k06qQzrngt8sgANUgFS99pd3rrMGGGSshQCIv+q6D7eT29LnM40Gu7Mt5q
         LMl8Li98j1OUHjdssPHLe1sfwDu3pnLhrZW/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784711177; x=1785315977;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fzc7jLJOwKFZM50nrRR9HIoeoA67mID89Z/e+R2bL4o=;
        b=jt2vT55Bh8GubyLSasB1HlwMz8t1Ojw27D2C5AR4uaV7gNx1kqnJRWCIrl+TmRvuBe
         xd4OKqGl1O1R39C8TGu4HMqArPM6hexvCGI46zo8JG45niAAaDmZBvbjNfH6AKEWJuk+
         sicKVubPAvJAjJ843hp6Tyval0NN/QVvEIv5aFumxzcx3bisXr3IFfVgaY7dIG/F5zmr
         Fpya5gPE2jf1eFaRt7gUCQ9AcgJKLhZGj1LNdBEYVCjiq7mZOexe1y+U0Na6W81/hci5
         oR8N4ubefJcUaqn0cuHjlGmYWXWDh4ec4/fc4/xEVGjUEYW1qyRXFJRoLbygQ78ZQUep
         qwtA==
X-Forwarded-Encrypted: i=1; AHgh+Rqm9orPppy5yl9cH2DDlVfhTnZvErKRlatpB0L2adlMexVZziq7Ab+v0YGCWunOrWPw7jYREU53XJl1b7QJeHQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwssmhKz7RHMZXCcXr480TvNVe0m/cHfB0K/0PbBWOZy4kYesLp
	KIBG4IrXi9m2NOXrHj8EwuPcLSOW2M6+uSOwoaf1bYokyF/KRCwHlLDL5h0YtLxA1yhP5l7CeU/
	RNevGhKQwTx9obmh3pIuSfyf6Y6mRPjWlzfxXsuSM
X-Gm-Gg: AR+sD11Ey37Ib9VdP+XDMBZShoc/oyWSSHjmr5lSJ4V07FktJe3TINF4IKA4DNIeboz
	FmBk2wuxglH2s9rS1cwApjhHXARDcFkDXF6j3XohePy3baJKBlfk3c5Bkvzdr/tcJv4CGYudZq8
	w0YKwbsCt0hrAD4c6tQifSqhOiPSgo7sAUL+u+6Zw2Q6Db70Vaso380l4pVYm7I0N2ICKXsNyby
	NGc0Y/P0HKoCkY0hKNoBeHh2Iymgd1t8YlJvQ4WIuiEDza9Ccx6gxfhL43g/IJpyBCMtRiIoXGn
	Ix81IuGat69C+sCK
X-Received: by 2002:a05:690c:6c8d:b0:81e:6d03:40cf with SMTP id
 00721157ae682-81ef26ae40bmr73897997b3.54.1784711177267; Wed, 22 Jul 2026
 02:06:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721075226.2347933-1-wenst@chromium.org> <20260721075226.2347933-2-wenst@chromium.org>
 <al9BwHbG5IX0mIem@ashevche-desk.local>
In-Reply-To: <al9BwHbG5IX0mIem@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Jul 2026 17:06:06 +0800
X-Gm-Features: AUfX_mw54F9BihKerjVbrM-HX0v6EAfSTuk3G7vvEfoFi_SJki_3pQoN0j1OPTM
Message-ID: <CAGXv+5HXtSovddkws58oUfUcucC3GKqTt-GgvXs27ALFjyFRrw@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] regulator: core: Add "enable and wait" functions
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

On Tue, Jul 21, 2026 at 5:54=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Jul 21, 2026 at 03:52:15PM +0800, Chen-Yu Tsai wrote:
> > In device power sequencing and initialization use cases, it is common
> > for the driver to enable the regulator and then wait for a certain
> > period of time to pass before continuing.
> >
> > In cases where the regulator supply is always on, or has been turned on
> > or left on by another consumer, the driver could shorten the delay or
> > skip it altogether, provided that enough time has already passed since
> > the regulator was _actually_ turned on.
> >
> > Tracking this requires support from the regulator core. Introduce a
> > "last turned on" timestamp field to the regulator device, and "enable
> > and wait" functions to the single and bulk regulator consumer APIs.
> > The existing "enable without wait" functions are then converted to
> > macros that expand to the new functions.
> >
> > One case in particular is not optimized yet: a regulator left on either
> > by hardware reset default or by the bootloader, but does not have the
> > "regulator-boot-on" property set. As the enable timestamp only gets
> > updated when enabled by a consumer or by the core, the first enablement
> > always needs to wait.
>
> ...
>
> > -/* locks held by regulator_enable() */
> > -static int _regulator_enable(struct regulator *regulator)
> > +/* locks held by regulator_enable_and_wait() */
> > +static int _regulator_enable_and_wait(struct regulator *regulator, uns=
igned int wait_us)
>
> Hmm...
> This comment a bit confusing, perhaps adding some lockdep annotations hel=
p?
>
> ...

It's already there, just outside the diff context, the first line after
the variable declarations:

        lockdep_assert_held_once(&rdev->mutex.base);

> > +     if (wait_us) {
> > +             ktime_t end =3D ktime_add_us(rdev->last_on, wait_us);
> > +             s64 remaining =3D ktime_us_delta(end, ktime_get_boottime(=
));
> > +
> > +             if (remaining > 0)
> > +                     fsleep(remaining);
>
> This style is discouraged as it makes maintenance harder. Better
>
>                 s64 remaining;
>
>                 remaining =3D ktime_us_delta(end, ktime_get_boottime());
>                 if (remaining > 0)
>                         fsleep(remaining);

Ack. FYI this will be rewritten based on concerns from Sashiko. The
wait will be pushed over to regulator_enable(), i.e. outside the scope
of the lock.

> > +     }
>
> ...
>
> >       /* private: Internal use */
> >       int ret;
> > +     unsigned int wait_us;
>
> If you want to make it more private (the above is only for kernel-doc) ad=
d
> __private annotation that will affect how sparse will check this.

Nice. Will add that.

> ...
>
> > -int __must_check regulator_enable(struct regulator *regulator);
> > +int __must_check regulator_enable_and_wait(struct regulator *regulator=
, unsigned int ms);
>
> ms or us? Please, double check all units.

Yeah this should be us.


Thanks
ChenYu
