Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBB51BE871
	for <chrome-platform@lists.linux.dev>; Wed, 16 Oct 2024 07:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729064380; cv=none; b=X1X9WJKA7yDKhBnbajk23+NEyN/IYiVocuQiqr8X/Z+eW8HHziSjpEpAqojDBSlNYVE3V2s86RBZiJAMoNTW60pe6+KpqYfpfPaROhJuaC6rHNstseMPiD5Rfwkt7y7ED2Mmy4VaRZFY+/j5mtATwViM6WQLz4BZxxjo8AnDqK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729064380; c=relaxed/simple;
	bh=NPoNwCAoKsusx7fJ/VmaMrRDN4bS6yShBbiSyUB5tqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BqJduNU0+AEn5VLKdhl+iSs4xJl26MW54aqtG9PqCVvCnxUQf7aQ6EF7AxhKBa3IRxGLA5sn5jVwXgKJdjqOFv6fsG5a7sy92Av7H7MsSMePaIXIvjSnTfqSXQWwylr5mMJU7Duu5toCNhKq74nXhOztbqa4h03uIOBDW42nkC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gzLJMbm3; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gzLJMbm3"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb498a92f6so36363721fa.1
        for <chrome-platform@lists.linux.dev>; Wed, 16 Oct 2024 00:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729064377; x=1729669177; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPoNwCAoKsusx7fJ/VmaMrRDN4bS6yShBbiSyUB5tqo=;
        b=gzLJMbm3BSWw0wAo3YYuUYacSZAzezc9MlytVOtuiqGaiVGp/Vs2GXPN6DznRy3SRj
         ksp5oiOM0cwj2acYxbgyDdZgSuc+PyBQvyb/9h/Aii48cxeqvhxLTQN3pnfDE7aPsxbC
         4XSFEdNSCa4tH30MNUOnQ/hCtZ+Onatcxk6ew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729064377; x=1729669177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPoNwCAoKsusx7fJ/VmaMrRDN4bS6yShBbiSyUB5tqo=;
        b=TNRM/0AemznocgdNaW6wlDPHPgw5DFjc6OLlM3WDrDkFmBSJiE2X+lwNjPFFNYrgpV
         GldRR5ranUCXp58tG04Ez2UmPG+0U4HhWanaZWabf6dG1IkrwkPPHFqRY9nxztVD2p7S
         vzaVCavMyGRAAnhvQIimsBxdqtGeJqpBH2ukfgT+2LxI8J0ZxmJEPVvIeXwEadaSRwA/
         Ap+KJcVK+Cth37RVX3oYVOFe6+mfwDkQJ3mYqW6M6bdpHk66mB7mkS0f4jn9eFqzJGU1
         0q+mey4QpKFoNHcVZPAcRWuXLpIe5odKXZ5U+aEucs7svU7URUs63acdqSXea2+8RJTH
         hPMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWorNsjF0Y8/g7UoJSN3GKBOq5ZI6yCxMV28jPpOlFxz6PtrugFnLpF6JJT3WsPqkX2jY5cIQsRVqhwLgz2Ytc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzpVGyPJq/xnJvQehdpShn5b4F5F9btiAuy94UtP5wzIgESL4LJ
	3MPRxsSLn7J/DxIo0S4/MW3axr66b8S89kQx10lK3jvho6QvQFzqdcIiGaSvxyO2wb1oZrXgHxk
	Huk7lWTzpVGNIrN1hSkiWsHFXj0W0VK8vbh/E
X-Google-Smtp-Source: AGHT+IFZ47ariW2Rra8wgmSaA6DC+PU8PnYnhILwMybMfHSnCE3ukSpG6GGGC1OiiQsMnz8LTDjTAbXe4DKeoahrz7s=
X-Received: by 2002:a05:6512:68f:b0:539:e317:b05f with SMTP id
 2adb3069b0e04-53a03f31724mr1842549e87.28.1729064377360; Wed, 16 Oct 2024
 00:39:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-6-wenst@chromium.org>
 <CAD=FV=Vs2bekyqBN_Lro_u32Dg9WM-bjDZr_tx-KyYH_toabVg@mail.gmail.com>
In-Reply-To: <CAD=FV=Vs2bekyqBN_Lro_u32Dg9WM-bjDZr_tx-KyYH_toabVg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 16 Oct 2024 15:39:24 +0800
Message-ID: <CAGXv+5G4OpGK77D7Jo6dtPj_R9=6Uy9GjuQ0O8su0Z--ejboRw@mail.gmail.com>
Subject: Re: [PATCH v8 5/8] i2c: of-prober: Add simple helpers for regulator support
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 2:00=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Oct 8, 2024 at 12:35=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > +/**
> > + * i2c_of_probe_simple_cleanup - Clean up and release resources for I2=
C OF prober simple helpers
> > + * @dev: Pointer to the &struct device of the caller, only used for de=
v_printk() messages
> > + * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
> > + *
> > + * * If a regulator supply was found, disable that regulator and relea=
se it.
>
> nit: was the double "*" starting the line above intentional?

Yes. That's kernel-doc syntax.

> Other than the nit, this looks good to me:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks!
