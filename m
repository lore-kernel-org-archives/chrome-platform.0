Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E57183CB2
	for <chrome-platform@lists.linux.dev>; Mon, 16 Sep 2024 15:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726498816; cv=none; b=MTXaG0PKmDkejbLGiYUFbHgceZtZ3f6O2Zrt01CYlBwSg9V9p8eTbM3tZJUeWHe2uZlyWP9SBxRuWMSZt+gM0he/TZ0ehrzk7yPBlfllsPoKwf7Wtu6VADLBQMJrUvqpIvFMkEC9q9cLHJ4+izDl/EbG7736iS7CxYZfbEuEv7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726498816; c=relaxed/simple;
	bh=SgzFbupR3T7M22CfurP1rOrMMnpozNihbr506w67XZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t/tDPwO9lqAqpvhy0H3UFJB9NbzXFN25bmUDr4p28MkBpqbjoaO3GRXwRKx7UbBR9IheQ95PSm1xB5+Cs94cGPEyX6YLLxqvFirRmc+3Jy2GPqUhbn10lVfkR0+AVq19rE6mEzZZMaYnhJCEdB6SFB3U9rq5zr5aXSRakpGMNys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZRmxiSYA; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZRmxiSYA"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5365d3f9d34so3563606e87.3
        for <chrome-platform@lists.linux.dev>; Mon, 16 Sep 2024 08:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726498811; x=1727103611; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXbO+D2mVI+UBDU39q5KHUW0ColIXLF8fjiXY9cUqkk=;
        b=ZRmxiSYA2x0gXrfG7f4iRqzBnk1+NjQ5YFIrUZEX75EJghscXykNC2E5NQ85F7wL9R
         x1W4k2Xc2B3DRyfpJBzGT949OYq14YOFhcg7gz8LSchY8tz7YPy7rf/KAAGAiC6VxCG3
         fozrE5smyPuQPKNPezXuNoCf4KymjVHkOlLgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726498811; x=1727103611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXbO+D2mVI+UBDU39q5KHUW0ColIXLF8fjiXY9cUqkk=;
        b=fY03jbwabZkE+EgAlLfxF7K/MBjS7qtIwthhxwRrm+jzoDeQKPc4+fxgbmeWbvD/FM
         XXBtoHoCPwNTDxnL/1ZMWzlcfJTsAg5Bgmxsi7nQScgEHCN2ogJqNNGcgtpBXBJU864w
         C/451/6LsCS6z5rrn+0dS38dKTsBJZ9p6lkBPkxXOMawxGvAwzZwGHaOlMGQmqExS8lX
         3DpK0Ec5OAPycpHFqYwQCqtEkh+QSx7YCA2OEuOyoZoGXK23WAypegsNumcT42TAA1Fx
         RlFw+ZZoSp0FBFGX17+hbfkVisujGL9aluzn3RbwNCHPRiYsi8Qqf2mx/y+44mcxNqvu
         XO1w==
X-Forwarded-Encrypted: i=1; AJvYcCWKlMBksvTS4TQZLNFHfBYXF8YGrmnhcBrT+ZXR8dyh7hGBsHkvNcVoRhx/16FrcIYety4XHzgDLNRMeKEXzb0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyplQbwxRdh7eKpauLxo5/NCvLg/eFy6tdZ7xtPAsneujPXqGxN
	T7Zme0HT0NbGGYCN7SposDC0gcigh2zq6uV79fCq8XdkQwq8NPNl9T21ud901DZUohCbt7CnOIC
	aeAWRjFWfkc0IrdqlOLcyOGSLJ6560VgBfF0h
X-Google-Smtp-Source: AGHT+IExxtSOdUaIDWYWqE4hbqGtSDreuAB4hMGiJcyjVPhu0E40r8ul9HIo9VA3zWefCMXKc/icuLN8A8D0fAPnWL0=
X-Received: by 2002:a05:6512:10d0:b0:536:5515:e9b5 with SMTP id
 2adb3069b0e04-5367ff3230fmr5531071e87.52.1726498810983; Mon, 16 Sep 2024
 08:00:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-7-wenst@chromium.org>
 <ZuQTFTNTBLCziD05@smile.fi.intel.com> <CAGXv+5HgkCZ=vdHGgvCW1U-nid=cQrVaxC+V+H2Gknf2pnTbYA@mail.gmail.com>
 <ZugKHrzs5BWoDr1c@smile.fi.intel.com>
In-Reply-To: <ZugKHrzs5BWoDr1c@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 16 Sep 2024 16:59:59 +0200
Message-ID: <CAGXv+5E09LH5UKXh0wHrsqAp-ps8xaGfSZ37GWZ6sbyoaOczfQ@mail.gmail.com>
Subject: Re: [PATCH v7 06/10] i2c: Introduce OF component probe function
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

On Mon, Sep 16, 2024 at 12:36=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, Sep 15, 2024 at 12:44:13PM +0200, Chen-Yu Tsai wrote:
> > On Fri, Sep 13, 2024 at 12:25=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Wed, Sep 11, 2024 at 03:27:44PM +0800, Chen-Yu Tsai wrote:
>
> ...
>
> > > > +int i2c_of_probe_component(struct device *dev, const struct i2c_of=
_probe_cfg *cfg, void *ctx)
> > > > +{
> > > > +     const struct i2c_of_probe_ops *ops;
> > > > +     const char *type;
> > > > +     struct device_node *i2c_node;
> > > > +     struct i2c_adapter *i2c;
> > > > +     int ret;
> > > > +
> > > > +     if (!cfg)
> > > > +             return -EINVAL;
> > > > +
> > > > +     ops =3D cfg->ops ?: &i2c_of_probe_dummy_ops;
> > > > +     type =3D cfg->type;
> > > > +
> > > > +     i2c_node =3D i2c_of_probe_get_i2c_node(dev, type);
> > >
> > >
> > >         struct device_node *i2c_node __free(of_node_put) =3D
> > >                 i2c_...;
> >
> > cleanup.h says to not mix the two styles (scoped vs goto). I was trying
> > to follow that, though I realize now that with the scoped loops it
> > probably doesn't help.
> >
> > I'll revert back to having __free().
> >
> > > > +     if (IS_ERR(i2c_node))
> > > > +             return PTR_ERR(i2c_node);
> > > > +
> > > > +     for_each_child_of_node_with_prefix(i2c_node, node, type) {
> > > > +             if (!of_device_is_available(node))
> > > > +                     continue;
> > > > +
> > > > +             /*
> > > > +              * Device tree has component already enabled. Either =
the
> > > > +              * device tree isn't supported or we already probed o=
nce.
> > > > +              */
> > > > +             ret =3D 0;
> > >
> > > Shouldn't you drop reference count for "node"? (See also below)
> >
> > This for-each loop the "scoped". It just doesn't have the prefix anymor=
e.
> > I believe you asked if the prefix could be dropped and then Rob agreed.
>
> Hmm... I have looked into the implementation and I haven't found the evid=
ence
> that this is anyhow scoped. Can you point out what I have missed?

From patch 2:

+#define for_each_child_of_node_with_prefix(parent, child, prefix)      \
+       for (struct device_node *child __free(device_node) =3D            \

                                 ^^^^^^^^^^^^^^^^^^^^^^^^^ scoped here

+            of_get_next_child_with_prefix(parent, NULL, prefix);       \
+            child !=3D NULL;                                             \
+            child =3D of_get_next_child_with_prefix(parent, child, prefix)=
)
+

"node", or "child" in this snippet is scoped within the for loop.


ChenYu

> > > > +             goto out_put_i2c_node;
> > > > +     }
> > > > +
> > > > +     i2c =3D of_get_i2c_adapter_by_node(i2c_node);
> > > > +     if (!i2c) {
> > > > +             ret =3D dev_err_probe(dev, -EPROBE_DEFER, "Couldn't g=
et I2C adapter\n");
> > > > +             goto out_put_i2c_node;
> > > > +     }
> > > > +
> > > > +     /* Grab resources */
> > > > +     ret =3D 0;
> > > > +     if (ops->get_resources)
> > > > +             ret =3D ops->get_resources(dev, i2c_node, ctx);
> > > > +     if (ret)
> > > > +             goto out_put_i2c_adapter;
> > > > +
> > > > +     /* Enable resources */
> > > > +     if (ops->enable)
> > > > +             ret =3D ops->enable(dev, ctx);
> > > > +     if (ret)
> > > > +             goto out_release_resources;
> > > > +
> > > > +     ret =3D 0;
> > > > +     for_each_child_of_node_with_prefix(i2c_node, node, type) {
> > > > +             union i2c_smbus_data data;
> > > > +             u32 addr;
> > > > +
> > > > +             if (of_property_read_u32(node, "reg", &addr))
> > > > +                     continue;
> > > > +             if (i2c_smbus_xfer(i2c, addr, 0, I2C_SMBUS_READ, 0, I=
2C_SMBUS_BYTE, &data) < 0)
> > > > +                     continue;
> > > > +
> > > > +             /* Found a device that is responding */
> > > > +             if (ops->free_resources_early)
> > > > +                     ops->free_resources_early(ctx);
> > > > +             ret =3D i2c_of_probe_enable_node(dev, node);
> > >
> > > Hmm... Is "node" reference count left bumped up for a reason?
> >
> > Same as above.
>
> Same as above.
>
> > > > +             break;
> > > > +     }
> > > > +
> > > > +     if (ops->cleanup)
> > > > +             ops->cleanup(dev, ctx);
> > > > +out_release_resources:
> > > > +     if (ops->free_resources_late)
> > > > +             ops->free_resources_late(ctx);
> > > > +out_put_i2c_adapter:
> > > > +     i2c_put_adapter(i2c);
> > > > +out_put_i2c_node:
> > > > +     of_node_put(i2c_node);
> > > > +
> > > > +     return ret;
> > > > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
