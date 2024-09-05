Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A8310E9
	for <chrome-platform@lists.linux.dev>; Thu,  5 Sep 2024 03:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725508368; cv=none; b=aeDUnzM9ruIu0rW099SObSsGk9YwkoLkubZb5Y8n/BxbXnu5jdCYBcg9wBbOGoP6X7/SxiJARKqzIYHvNMYiCz/2ylQ8FrWxqUVlS6Uy7s2ZfHB/pUx14M7OhwS+bgPJ4mSUKZ05XHrwowi39dJ2aOKQsIT4rxj1sfHPNcUcEHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725508368; c=relaxed/simple;
	bh=su/8gj6ks5K85/I3PIYZHz4bzmuYkE7mRyHvpRMnZhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AdwqZjtAVUtReFys/pw3GmXuT1OcZErUkKnQnk8zI3rqy3moZH7h9yhSGaiZCTn34lNCk0/69jKOQnsI1dgpzZgmesnQwmYj8ywUEcR/H544VnEnLVrjivf4QeC2YDZqxx+310pjnm9taAxZ20cG5c+j9hGhbB87PqnV0t3szbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Sr6gLSnd; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Sr6gLSnd"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5343e75c642so243350e87.2
        for <chrome-platform@lists.linux.dev>; Wed, 04 Sep 2024 20:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725508364; x=1726113164; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QRIIgJ7S3hsBk6289/S+wOJS+zjzXBK17nuyOQXg1gQ=;
        b=Sr6gLSndX05HbkfR0auQpYx9WPw/783D47ch6QFSGJAxPn82zomiaN9Moqdw5Q4X+Y
         izimWIvR/tmKwdcHzHvbK1sdzsoNYcHMeIzA4hukS+3MXHiZKuigwL0ywyAhY0+wmUTX
         fZ96/9Wcux6G1Mh8aI9AEHifWieQSm+HJIOp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725508364; x=1726113164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QRIIgJ7S3hsBk6289/S+wOJS+zjzXBK17nuyOQXg1gQ=;
        b=hED+xmTE8cIUOhubIeEilEbDKzzoJHphe2EhXm+nZEvUQWqDjP/gpsxfVDIzaThakX
         blf1WHFW2jUvGJqHsyCbt12s3h6LtsuIO+oLG8MJW+PPjXiNdMI4nsuia49IaBA2n4f7
         fmkRhFEWbZE9OQXt1h4YEO1gV4xRF3iSK59jhjKVZH4yUv4Pgr7yL7FlQgHh7LhSziKq
         jfAqO2jL5whmjU8CuKJCTmFDsFsGhoBsQlPBR3TQgzMYUD1BI3WYcyKvZDZr5CTxxYaQ
         OP+qocOZOiEangXFykUOQNbwW1GoErhxEBb03J1M40BF/lgSuLBrQh73V9BApmQih/aY
         4DxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcZU4HzUhjkPm1Tu6GARw7qvm9trHj0Ka80H/AR9Myyl/iXV3k5woKciX6c6PwwGfd66CBEQTKkNn8E0ZSkLs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJ5xc5VL2N6LwQzV9LZQvi4mpvM93cOWeQKSK9N90s26VpbYxB
	3Qn72N7R15iCCvjad43TKP6sfA+xF2jIO9scTkSBbmv8Zn3vMOmwC9UyZvfWg+sVJS3UPV3myZL
	YgdYS5NERm9qNjiVWdEyF3sX0ErgEhMwz9gur
X-Google-Smtp-Source: AGHT+IFf4LunjDbLMZ4JbahUyowVfro0pxQijuaHaPzJX7btNK9HgFjL//PjfHIonl230ee/BtNVKcZVy4RESHnFt3A=
X-Received: by 2002:a05:6512:350e:b0:535:66ff:c681 with SMTP id
 2adb3069b0e04-53566ffc733mr2025998e87.48.1725508363601; Wed, 04 Sep 2024
 20:52:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <20240904090016.2841572-12-wenst@chromium.org>
 <Ztgxlmhnkn7NVC81@google.com>
In-Reply-To: <Ztgxlmhnkn7NVC81@google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 5 Sep 2024 11:52:32 +0800
Message-ID: <CAGXv+5GpKu-b4_dbRcuSG4NxQi_FKh9p7iMh6DfgavkLFdLLdQ@mail.gmail.com>
Subject: Re: [PATCH v6 11/12] platform/chrome: Introduce device tree hardware prober
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, chrome-platform@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 6:08=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> w=
rote:
>
> On Wed, Sep 04, 2024 at 05:00:13PM +0800, Chen-Yu Tsai wrote:
> > diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/=
platform/chrome/chromeos_of_hw_prober.c
> [...]
> > +static int chromeos_of_hw_prober_probe(struct platform_device *pdev)
> > +{
> > +     for (size_t i =3D 0; i < ARRAY_SIZE(hw_prober_platforms); i++) {
> > +             int ret;
> > +
> > +             if (!of_machine_is_compatible(hw_prober_platforms[i].comp=
atible))
> > +                     continue;
> > +
> > +             ret =3D hw_prober_platforms[i].prober(&pdev->dev, hw_prob=
er_platforms[i].data);
> > +             /* Ignore unrecoverable errors and keep going through oth=
er probers */
> > +             if (ret =3D=3D -EPROBE_DEFER)
> > +                     return ret;
>
> Is it harmless if some of the components get probed multiple times?  E.g.=
:
> comp1 probed -> comp2 probed -> comp3 returned -EPROBE_DEFER -> some time
> later, chromeos_of_hw_prober_probe() gets called again.

Yes it is harmless. Components already enabled will not get disabled
in the error path. And the prober that enabled that component will see
that a component was enabled, and skip doing the whole process again.

So something like:

    comp1 probed -> comp2 probed -> comp3 -EPROBE_DEFER ->
        comp1 skip -> comp2 skip -> comp3 probed


ChenYu
