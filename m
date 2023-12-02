Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751B3623
	for <chrome-platform@lists.linux.dev>; Sat,  2 Dec 2023 00:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Oc2YguTr"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-54c7a10f376so366264a12.2
        for <chrome-platform@lists.linux.dev>; Fri, 01 Dec 2023 16:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701478585; x=1702083385; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=on0eUmIVBGIZNw/lnf6eJdI5XZ4MfrBWX3aiU7eK2L8=;
        b=Oc2YguTrFYKM+f9LwtBbA0ZEIBlDsyxtiejpOCEIAT3SOE0nM3idVgr9mitLYvsTkz
         tyVJPt/y7XpDY9kk+Y1NLMGqfA1TQ3sc7HOO8/FoxfbygZCNzp2SAI1PqCBZEcdrxse/
         HV736uFJ3Ow8z2sTQzUxJ6ch2dnXL8Nyoiaok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701478585; x=1702083385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=on0eUmIVBGIZNw/lnf6eJdI5XZ4MfrBWX3aiU7eK2L8=;
        b=Jrrc4HeurfbPK76JESBlgx7P8KGaH/XTJJDr/NNIDyE9IdGS/BPhflt+WB7aYd3i8/
         iCx2eynCge25Uy4Xa46PWaOcuW8MdrN1O1/zOcPUI+J+tuWk7c8lTwo5TVEH5UAHomLV
         BoRcMpJuujZrcfUXhy3aqeeHvLpUGxnsqeiun3Or1/G6lS0urSWMQO+XESbwu7LVjhno
         0/eXvFzTKxVdEqICNdA/hnlmuEIl2NJ4ypKnjYrHDJfMh+6XNZaHXsd6lHG6/0dHrH9A
         2I2xd4YXbTUgg9q6DsN+irGEFsKpQ58oJcznQYyJ287BXgt6vVKypMLKz87DB6y3Ew+g
         00Vg==
X-Gm-Message-State: AOJu0YzbDX1/cf/6s5b01RCH1S6PeomzIPsNBq4ht51a9GCEsHokL+al
	My3JQ66th/KY1FOxjHALCxmNgsrwGEAdaCgialw2aiiy
X-Google-Smtp-Source: AGHT+IESznomb/4HT1RLEGuMy8TI+syvPDeungsX6BsitWBiM/+2mRk0hrOhwM65NHLanvuyNg1Y8Q==
X-Received: by 2002:a50:cc95:0:b0:54c:7994:ac02 with SMTP id q21-20020a50cc95000000b0054c7994ac02mr236195edi.33.1701478585624;
        Fri, 01 Dec 2023 16:56:25 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id dm4-20020a05640222c400b0054c60f02999sm936639edb.10.2023.12.01.16.56.24
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 16:56:25 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40b422a274dso28055e9.0
        for <chrome-platform@lists.linux.dev>; Fri, 01 Dec 2023 16:56:24 -0800 (PST)
X-Received: by 2002:a1c:6a0c:0:b0:408:3727:92c5 with SMTP id
 f12-20020a1c6a0c000000b00408372792c5mr311701wmc.2.1701478584358; Fri, 01 Dec
 2023 16:56:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-2-wenst@chromium.org>
In-Reply-To: <20231128084236.157152-2-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 Dec 2023 16:56:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V_v11eZ6+3gUwOvdWGNM9owG7zCK5EiezTY7RJ3eaEMw@mail.gmail.com>
Message-ID: <CAD=FV=V_v11eZ6+3gUwOvdWGNM9owG7zCK5EiezTY7RJ3eaEMw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/5] of: dynamic: Add of_changeset_update_prop_string
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>, 
	linus.walleij@linaro.org, broonie@kernel.org, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech, 
	keescook@chromium.org, rafael@kernel.org, tglx@linutronix.de, 
	Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 28, 2023 at 12:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> @@ -1039,3 +1039,50 @@ int of_changeset_add_prop_u32_array(struct of_chan=
geset *ocs,
>         return ret;
>  }
>  EXPORT_SYMBOL_GPL(of_changeset_add_prop_u32_array);
> +
> +static int of_changeset_update_prop_helper(struct of_changeset *ocs,
> +                                          struct device_node *np,
> +                                          const struct property *pp)
> +{
> +       struct property *new_pp;
> +       int ret;
> +
> +       new_pp =3D __of_prop_dup(pp, GFP_KERNEL);
> +       if (!new_pp)
> +               return -ENOMEM;
> +
> +       ret =3D of_changeset_update_property(ocs, np, new_pp);
> +       if (ret) {
> +               kfree(new_pp->name);
> +               kfree(new_pp->value);
> +               kfree(new_pp);

Given that this is the 3rd copy of the freeing logic, does it make
sense to make __of_prop_free() that's documented to free what was
returned by __of_prop_dupe()?
