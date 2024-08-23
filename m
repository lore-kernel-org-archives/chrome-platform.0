Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E4A53E15
	for <chrome-platform@lists.linux.dev>; Fri, 23 Aug 2024 06:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724396078; cv=none; b=LrPF6JWjSig6kZ1RBV2cRgUOXwKVBrI9akQmedySs8paORsXbRnZoD8jutfENufpH64F6klkoiifK8exdqbA/5jEq0Zq/Wp4a2LvLYs/CenrE0VPFcmYFV7K7x5Y55OW6u6MWctduGHEsHijIao4m3YSn3X6iEMzXUOMbqXVSeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724396078; c=relaxed/simple;
	bh=b7cBKZ3aiovvpcnd82a//jTwAitemyJStikYa58pHQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=daZi7A66+cYFsvPNCZKRWQKcNa923qSYG3vYfXT09hbpzGyopqL65y+BOCksEyYuuIL60dtGqCxqnrv/gotaalNSNk4qzooKR90Dgu/XChM9Wk+bVVemwEKXe/QFUzuKs+2h2hDzXCGSXjdj9dRPyng9/c5xMRr2T81oFbziWMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JastARd8; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JastARd8"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-534366c194fso927203e87.0
        for <chrome-platform@lists.linux.dev>; Thu, 22 Aug 2024 23:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724396075; x=1725000875; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYlhEmPtRTYor0AL9cAnJrQT3p974t5Lzi77Eaz87M4=;
        b=JastARd8xcQ/HpHDJkDQLfFrU0G1LVL7oYu5VgQyGmjr4TYOVroGwFN97J5BQST7jX
         Qqtkygz8QXPg4+bHI0/xaPjasvNqKBABKUwUfCkMEY7EsPsPzToK42dsyAiy8noKpXCe
         vdSMRQFX+NXN6XZ+Dmbs3L6e/VDP2niXdv4fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724396075; x=1725000875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYlhEmPtRTYor0AL9cAnJrQT3p974t5Lzi77Eaz87M4=;
        b=KdWqBm9PoNbKIWfLrC4fG/1m5cbgJ2lLSkqgEzaXJgI6Cq4cGQ1dtV4TTQdnV9AZtr
         VRCBtWHocgyuDxTHk7HDZe2y7t+Aw9rQrOcaP8e8oXw/9Armz2LuXnH4tm77VUtBq25k
         nN/NU23+9Wa651CPj2027RQWyt/nC0U+ZvS4in4WFcacDktdp9TizViB/MOS6qodBtjv
         9I02BcKsU49nAyN+qkkIeHfDQ9GAC+wvYy1u8VFtevalSWuokRjg+sk2MQv6ZuvetZv6
         kB8evYYFUZ5yuOyKT2W4f60EXoz28DSa+KMruHWuKNU/YoP14j+LztzES2ob7b/ks3ch
         Opyg==
X-Forwarded-Encrypted: i=1; AJvYcCWLABCXa9a3/XEXFeTcsxHqq9lUjQ7O/t92n5APsB4Q6pbGOUcRLT92Vvhmavog9jk870hSywtCQVeVmxWU95g=@lists.linux.dev
X-Gm-Message-State: AOJu0YwlZhjv2nM4o7OgBFQw63nV/DTqa6Z1SJIv89hsmAz5FOOZcwY4
	Rk0MAlmzGjUWNe0jjCwLjeMGHECB/iCe3JD6R4r2gZFR7QTEVd06KUpo19xR8ueaQBnC74Izw1A
	iznKBXY53cPLBE7OgJy6j/GHAtzZNoL0H0UC+
X-Google-Smtp-Source: AGHT+IGDC0WWTfFgI9QnQzvX49/NewGmGwj3Cz1KMtz32yMSQX3nF9dwL9fql5Pr3fEZyw3lnpJjTa3uuZm7Vkpw1m4=
X-Received: by 2002:a05:6512:3b82:b0:52f:154:661b with SMTP id
 2adb3069b0e04-534387681c5mr853124e87.11.1724396075319; Thu, 22 Aug 2024
 23:54:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240822092006.3134096-1-wenst@chromium.org> <20240822092006.3134096-4-wenst@chromium.org>
 <ZsdB1vsEe0atW88_@smile.fi.intel.com>
In-Reply-To: <ZsdB1vsEe0atW88_@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 23 Aug 2024 14:54:24 +0800
Message-ID: <CAGXv+5Ew1tQKmuKckovfHCgH-ja0qSmqJWOk2qowQC4k_1tvYQ@mail.gmail.com>
Subject: Re: [PATCH v5 03/10] regulator: Split up _regulator_get()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 9:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Aug 22, 2024 at 05:19:56PM +0800, Chen-Yu Tsai wrote:
> > _regulator_get() contains a lot of common code doing checks prior to th=
e
> > regulator lookup and housekeeping work after the lookup. Almost all the
> > code could be shared with a OF-specific variant of _regulator_get().
> >
> > Split out the common parts so that they can be reused. The OF-specific
> > version of _regulator_get() will be added in a subsequent patch.
> > No functional changes were made.
>
> > +/**
> > + * _regulator_get_common - Common code for regulator requests
> > + * @rdev: regulator device pointer as returned by *regulator_dev_looku=
p()
> > + *       Its reference count is expected to have been incremented.
> > + * @dev: device used for dev_printk messages
> > + * @id: Supply name or regulator ID
> > + * @get_type: enum regulator_get_type value corresponding to type of r=
equest
> > + *
> > + * Returns a struct regulator corresponding to @rdev,
> > + * or IS_ERR() condition containing errno.
> > + *
> > + * This function should be chained with *regulator_dev_lookup() functi=
ons.
>
> kernel-doc will warn here: No "Return" section.

Will fix.

ChenYu

> > + */
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
