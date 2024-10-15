Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190838614E
	for <chrome-platform@lists.linux.dev>; Tue, 15 Oct 2024 17:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729015129; cv=none; b=fFbyyRBTxaeUIW2ohMU6mOtCLysRFYmbeUrOkevE70rhU1oI9Xy64n73wyVnG6Y0XXDR8q5WOUoLIFznpfoBEJVjN0wcHMYjmEkHwI2WX9tJGFW9Q9s/7Ei8Jj6qd7NJDCMPXSg6o53aDn1kOyKYnQ7Zp0UsFodHZ3GqWJI3FoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729015129; c=relaxed/simple;
	bh=14O5MDyat6CX8O123WRU/kCYMtgocuRDZbVVnnkI2Yk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=txRBhCeMI4HMpTrr0GY/FR2TMthYFB12QQkA19kBhRp9viPy+7awYkHr/0MdtmYPIGFHXG0AEo8oGwdoTt2CS19f93D7JLczjviZzPe9hX6TytPLvbMHPRgmXhmgA0QF2l3gs2tFOlurP2aXSqJKZ5TJVWnaXFJiL9YCEYRLZPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EIxm+vti; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EIxm+vti"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so3164168e87.0
        for <chrome-platform@lists.linux.dev>; Tue, 15 Oct 2024 10:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729015126; x=1729619926; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Yio/gvv50Y6PZv0Xv308n7irKGS6U7Q/Fl4Lj32yaA=;
        b=EIxm+vtinLeMtLczWrR288Ee3fCk2+Pt83i8NMZeW+ET2RSBBJoHOxQoP3eMtT2FFm
         nGGibmR9cyF42o9Mg7MA6cLD/Zw6UDtllZLnW+gu9cAgsnlbgU2Uu1Tn3AUXjzFj2xPP
         ReRbZQB1OebKYVT+0oQ9NblNLF8tWyF0BT7sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729015126; x=1729619926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Yio/gvv50Y6PZv0Xv308n7irKGS6U7Q/Fl4Lj32yaA=;
        b=hmXaF9zUqmdZXzFFJo7i0UQMXF0kkqug/LQPF9mOIK1/uhupMw6YmRrfhX4vFhwibk
         pIUjqM1Hie4+9XfMpVGjn9Usm63B3y+PnppO+Hv2d4UrY7HlEfgl2VPcVK73GWbpfq2f
         ceS12xpHnMTfm8LKy0BBDfKpJtYTbyLu2eSXZg1Vax+NYE1LIyigYAfDjI0+E8+x1W9D
         TxK1ooYgv4rG9oG1Bs7dQtRewrNBn1/7/YacDzk7XCh1lpoHt1Ado88e0Rzsh3Oh/IRz
         V5ALmLz+CG+YkkBnhNrLmz0iro6dnI3qKqUUcj9HKYN9AR9TAHp0BCwXAGvYiZGk88PX
         1pWw==
X-Forwarded-Encrypted: i=1; AJvYcCVJERUMGvhHSJIXf3gHM0og2xIA7aUta7UJaWvSsAzwa38U9z+uK5EqThDdsma3+RqMqO95ah7svIWDQ9EbubE=@lists.linux.dev
X-Gm-Message-State: AOJu0YznGszmtlNgvrtKoicNGmXprOOsMivNPcOe58vw52Rv/pEqqxjv
	03MJZ4UdkIetLaF5gs4xiyQuN7tLhUFDWL8c0eIZddOX9bhgkkHk27e3rIy7iabKDmNnMmTMd6c
	2ex7Z
X-Google-Smtp-Source: AGHT+IGOqeLOo1bpEO048hP+Yh2vZgevNalR7hgLNINO6Xl9fSrX35EyUAgcsc+25f2BPVM0uImusw==
X-Received: by 2002:a05:6512:402a:b0:539:f619:b458 with SMTP id 2adb3069b0e04-539f619b4cbmr4363334e87.22.1729015126124;
        Tue, 15 Oct 2024 10:58:46 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a0001247fsm224913e87.253.2024.10.15.10.58.45
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 10:58:45 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so3164143e87.0
        for <chrome-platform@lists.linux.dev>; Tue, 15 Oct 2024 10:58:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWgdK7fnfUggotcOJBQBLJDw2TIvbP88jA0brirabz9z+qxj5HJYWdQ+68KijexmBBczlwb6jlYowGDG2z1urs=@lists.linux.dev
X-Received: by 2002:a05:6512:2c95:b0:539:e94d:2d3d with SMTP id
 2adb3069b0e04-539e94d2ea1mr5104630e87.7.1729015125333; Tue, 15 Oct 2024
 10:58:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-5-wenst@chromium.org>
In-Reply-To: <20241008073430.3992087-5-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 15 Oct 2024 10:58:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WRSjk3U9Kau0wqkgv3KB=9jM6wCM9Gs-WxWai35sfxTg@mail.gmail.com>
Message-ID: <CAD=FV=WRSjk3U9Kau0wqkgv3KB=9jM6wCM9Gs-WxWai35sfxTg@mail.gmail.com>
Subject: Re: [PATCH v8 4/8] i2c: Introduce OF component probe function
To: Chen-Yu Tsai <wenst@chromium.org>
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

Hi,

On Tue, Oct 8, 2024 at 12:35=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> +int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe=
_cfg *cfg, void *ctx)
> +{
> +       const struct i2c_of_probe_ops *ops;
> +       const char *type;
> +       struct i2c_adapter *i2c;
> +       int ret;
> +
> +       ops =3D cfg->ops ?: &i2c_of_probe_dummy_ops;
> +       type =3D cfg->type;
> +
> +       struct device_node *i2c_node __free(device_node) =3D i2c_of_probe=
_get_i2c_node(dev, type);
> +       if (IS_ERR(i2c_node))
> +               return PTR_ERR(i2c_node);

I'm still getting comfortable with the __free() syntax so sorry if I'm
wrong, but I _think_ the above is buggy. I believe that the definition
of the free function for "device_node" is from:

DEFINE_FREE(device_node, struct device_node *, if (_T) of_node_put(_T))

...which means it'll call of_node_put() to free "i2c_node" when it
goes out of scope. of_node_put() handles NULL pointers but _not_ ERR
pointers. So I think that if you get an error back and then return via
the PTR_ERR(i2c_node) then it'll crash because it will try to free an
ERR pointer. Did I get that right? Presumably you need to instead do:

  return PTR_ERR(no_free_ptr(i2c_node));

...or change of_node_put() to be a noop for error pointers?


> +struct i2c_of_probe_ops {
> +       /**
> +        * @enable: Retrieve and enable resources so that the components =
respond to probes.
> +        *
> +        * Resources should be reverted to their initial state before ret=
urning if this fails.

nit: might be worth explicitly noting that returning -EPROBE_DEFER is
OK here because this both retrieves resources and enables.


> +        */
> +       int (*enable)(struct device *dev, struct device_node *bus_node, v=
oid *data);
> +
> +       /**
> +        * @cleanup_early: Release exclusive resources prior to enabling =
component.

nit: change the word "enabling" to "calling probe() on a detected"
since otherwise it could be confused with the "enable" function above.


-Doug
