Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED87558BA
	for <chrome-platform@lists.linux.dev>; Wed, 14 Aug 2024 04:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723609623; cv=none; b=MB5v0+kdZTyuhN0HYXAx6vb23lZzgQSf1vTIW5VS7lYjVS3cNCegMFlMN7znshE7lgunERGq53gAQBGWttWvxTWptPloRaQ1/EtLrZGsEQNSccIrsjxN6QVww5NCBY6fhJS5w1LUeHH/ACloolqIXr+j+gJDbtirbIHZOmjF90M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723609623; c=relaxed/simple;
	bh=/OjkMvtUQsuACR66qNVjtKUOKRCwnBBFDXqQ+hO5LGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=awkY01A1EQmR1fpjLQ1CfiT77/vfr5AruV7GrSyrv4HoADvUJpF8dlCFfHyNynnsZNTRTIF24SqxkLYu2CD05WbzdQ3XezCP1FGkWhLHb4dgJN6BK0m0ALYIcgufFSgu7eicrybz29ZrIsYHEv4i5VKkKc/UPhwve1bGl6FlJ2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KmwjV0Aa; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KmwjV0Aa"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52efd855adbso7753024e87.2
        for <chrome-platform@lists.linux.dev>; Tue, 13 Aug 2024 21:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723609619; x=1724214419; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2sGTnWhAAxCBideXOSfildCbbJbkxzd9wlf9Y8JEp8=;
        b=KmwjV0Aa3aVBF/aAmmFaJz4787BOtu3kXyrj1nMlDV3K6Lz7VjDNWg8a4SWmDnZ1zI
         4FLpWQv4lVGgg4b8WlgGGL8bqZqOAuEW+ZTnfXOpnf9xaXGwKkMDjPt5FP+m5pehs02w
         /lGaqpBZleGrU0k3M1LgH43aFZBBFwDay3vDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723609619; x=1724214419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2sGTnWhAAxCBideXOSfildCbbJbkxzd9wlf9Y8JEp8=;
        b=SJtrKOCjN+a7fsl8J6p77oKAnuxnommHJL/PQf9IGOeRpDAWfYKbWPQnno07b1z5F6
         VqOn5N9RBpcushGadmcwwVJHDY+R53ZHABTzJjYjFE1FhpdGwIE2GXxCAPqtfMl2r4TA
         JJGim8j3WCFP2SK3xpWKHOpewQWT2OzQkRJ+SMowK9u6Y4SrWBuur0vm/7G+9SwJZxHs
         mZYX111Jq9SGAETJltR2b8p81B+Rxss2g8LRZVrOZSjrPYCh7xw17zhTgmuUNn9XPogh
         MBTwOKes1sCkCon8CqstU1EqnBxcP6xn37Sdnqqf1K7lcQJIJYyc8aOkc9oANotMizok
         oLug==
X-Forwarded-Encrypted: i=1; AJvYcCU5gMhKxd5gm68UINCnWyznFXCj3S7TxAcLS7sDmdnapvYb3koCdFVqY+3/88KIt07BB2l5l89fY4Aytt2w4O7UL+O7f2HgJ0PB1xI62ooY
X-Gm-Message-State: AOJu0Ywfg+BD2G1BIJDxxgNL6wLq0HKbAlAir+2aNX1wJp0LJbHAVRy4
	/Vv6b8WkbIEXKBEYIhDrJqNnSpkMewpQiY7K0MnYWprVQjaPbjZIwUr+B62tt+jlVQGxbkpbJKI
	wL0aZ7E19Lj2BrioIOANnJFMrnWf1N5ZKiTYN
X-Google-Smtp-Source: AGHT+IGq5JnrkQvBmtbDIMCjqiKcKn4UUIGlSmcL8VKx33PYxUW8uxuiq5DIDlEU7bjWcTHbhZFieWS9pBfHwDH245w=
X-Received: by 2002:a05:6512:350f:b0:532:f1db:d0bc with SMTP id
 2adb3069b0e04-532f1dbd293mr332752e87.20.1723609619020; Tue, 13 Aug 2024
 21:26:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240808095931.2649657-1-wenst@chromium.org> <20240808095931.2649657-2-wenst@chromium.org>
 <Zrs_YijPxKBFQF0_@smile.fi.intel.com> <20240813191835.GA1598838-robh@kernel.org>
In-Reply-To: <20240813191835.GA1598838-robh@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 14 Aug 2024 12:26:47 +0800
Message-ID: <CAGXv+5ER7DDdE-778JJZu9WTQejy0W0dYM7WZhXj2MzrUWrC6g@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] of: dynamic: Add of_changeset_update_prop_string
To: Rob Herring <robh@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Saravana Kannan <saravanak@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 3:18=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Aug 13, 2024 at 02:11:30PM +0300, Andy Shevchenko wrote:
> > On Thu, Aug 08, 2024 at 05:59:24PM +0800, Chen-Yu Tsai wrote:
> > > Add a helper function to add string property updates to an OF changes=
et.
> > > This is similar to of_changeset_add_prop_string(), but instead of add=
ing
> > > the property (and failing if it exists), it will update the property.
> > >
> > > This shall be used later in the DT hardware prober.
> >
> > ...
> >
> > > +int of_changeset_update_prop_string(struct of_changeset *ocs,
> > > +                               struct device_node *np,
> > > +                               const char *prop_name, const char *st=
r)
> > > +{
> > > +   struct property prop;
> > > +
> > > +   prop.name =3D (char *)prop_name;
> > > +   prop.length =3D strlen(str) + 1;
> > > +   prop.value =3D (void *)str;
> >
> > Is it the existing style in the file? Otherwise I often see style like =
this

Yeah. This was mostly copy pasted.

> >
> >       struct property prop =3D {
> >               .name =3D (char *)prop_name;
> >               .length =3D strlen(str) + 1;
> >               .value =3D (void *)str;
> >       };
> >
> > in the kernel (IRQ domain, platform core, ...).
>
> Okay with me to use this style regardless of existing style.

Ack. I'll update it to the more modern style.

ChenYu
