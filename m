Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BE73EA64
	for <chrome-platform@lists.linux.dev>; Tue,  9 Apr 2024 02:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712630895; cv=none; b=V1CcoC4EE7bedN0CU4PyDlGVgfzQ+iITHajw6dTaAdaZju2F4ZzmkTQoYHXFiclE+3IM0N3nkV/m7sevzMBQzBaVOxgb9MjDyXkEdCwUqJgvyzUWmc9WPgy1ap2OBb24dNbLYw1xkb5llMWsPMCtohxzrP4mCcAnDBVdQag2u+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712630895; c=relaxed/simple;
	bh=W4VPnTaME3YXfp3NpzQHHD041XAWthswcv7tncBwfu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PGQae9E0IUdRFg7sLd1FAcWb6tYirYkLqKjPz9A9QzgSL1syRYVTZG/eC/XGiGBAOjIFJNo6apESrkXz1p+rKZzB4B092Nwa68Kd6s+sEch3Fh2iE2JxC+5HLumU+DMzeF0J5kmTDr0ilWLKAmBYhB8DzPg6R1O/XCchQVYrzes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GuvCcELj; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GuvCcELj"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4dabbd69c71so1064711e0c.1
        for <chrome-platform@lists.linux.dev>; Mon, 08 Apr 2024 19:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712630892; x=1713235692; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dBIuA8MJb7TXY6gP2nJKpF5Bnu0yGdIwXcvJf/sg8k=;
        b=GuvCcELjpo266swzwIEgwHmK2o6l7X8iLdwOXUwc+zZPLwFX+wIV5W2Ojurkmwujcd
         Do4aqjUCZqzUXdeJHBY0h10RUYSaZFGTtqbuo9L+YVRVvFTh2fZBDZEDNP7KFa19CRMD
         ud09v/a7CB7yzBOnPek5gpZUbsJuzf1ecPt8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712630892; x=1713235692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1dBIuA8MJb7TXY6gP2nJKpF5Bnu0yGdIwXcvJf/sg8k=;
        b=tXWiQunFWAqHnQWvIt6T7ao8kKm91iTyU0lUZvvF8dBQMD4ByO8WFc2tO5fWoiA1TS
         1i2ppnaGjrgPFgmyRXxUoC75sbMMerCnsnd0CHYA5xq4lzjMW8loaly9ltaJI7EjzJoH
         Osjg5RgxrBx9GXLPTf78p+JWXQhey69kJkWEo92QhIZX6INGybLwEnjMUXAHHLOpq2bO
         6Gk3Zs29U+RFUygRs5EBuy+L72bg9q4k7PIesk/mPcWfX34gyUSC/G2TSmw92D/osLFX
         rveH5txxcME9QdbUBrTg8S7QpXyL7TPY067i2bsc4AtcQyv7HltU0dpLIWsWDlqY7vht
         UYCw==
X-Forwarded-Encrypted: i=1; AJvYcCVRAiYPOurMgEQ5GDcvZWy1gUWgtVM8IYQU0F2HurUnueooOOBfjfwuS2beU8r27sI0rR35b1JeEGAifALuPJWL7qtn4QqlPbY2UJhVKBfE
X-Gm-Message-State: AOJu0YyfsvwA2H/yRZu3n1ho4zcVX5Oo0iVUYdknf6U5ezPb7OHiuCJP
	vARYU60WFKMSo4SJ2kHxJZImFGbHYRZorDfkjCuKbba/cCtXnRJW6GtjCEzWYLu3/D89EW7cB5w
	l2buqIgFV7UJ9wW5wr554JGIbs/jUdQNl3zcK
X-Google-Smtp-Source: AGHT+IFIXf0vpiEQ1qCQSCaNGZ8MV+ukl2NhARckU0H0zff/FgyaI+tYw3clXwkn/jgzLFQ8h12wgcpIe0KLPUaDmtg=
X-Received: by 2002:ac5:cdd1:0:b0:4ca:4a07:9006 with SMTP id
 u17-20020ac5cdd1000000b004ca4a079006mr6531323vkn.0.1712630891756; Mon, 08 Apr
 2024 19:48:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240403-public-ucsi-h-v3-0-f848e18c8ed2@chromium.org>
 <20240403-public-ucsi-h-v3-2-f848e18c8ed2@chromium.org> <ZhOnKWcNllls6gdA@google.com>
In-Reply-To: <ZhOnKWcNllls6gdA@google.com>
From: Pavan Holla <pholla@chromium.org>
Date: Mon, 8 Apr 2024 19:47:35 -0700
Message-ID: <CAB2FV=4_TYP=uBHjJLDwKOdnyfdurX5k5LqqtOPpX4er1fKiZg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've uploaded v4. PTAL.

On Mon, Apr 8, 2024 at 1:13=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> w=
rote:
>
> How this driver get probed?  From drivers/mfd/cros_ec_dev.c?  If so, ther=
e is
> no "cros-ec-ucsi" in the MFD driver yet.

Yes, this should get probed from drivers/mfd/cros_ec_dev.c. However, the
corresponding change in the EC is still under review. I was planning to sen=
d
it out once the EC change lands. Please let me know if you think that this
review should wait until then.

>
> > diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/=
ucsi/cros_ec_ucsi.c
> > [...]
> > +static int cros_ucsi_async_write(struct ucsi *ucsi, unsigned int offse=
t,
> > +                              const void *val, size_t val_len)
> > +{
> > +     struct cros_ucsi_data *udata =3D ucsi_get_drvdata(ucsi);
> > +     uint8_t ec_buffer[MAX_EC_DATA_SIZE + sizeof(struct ec_params_ucsi=
_ppm_set)];
> > +     struct ec_params_ucsi_ppm_set *req =3D (struct ec_params_ucsi_ppm=
_set *)ec_buffer;
> > +     int ret =3D 0;
>
> The initialization is redundant.  `ret` will be overridden soon.

Removed.

>
> > +     if (val_len > MAX_EC_DATA_SIZE) {
> > +             dev_err(udata->dev, "Can't write %zu bytes. Too big.", va=
l_len);
> > +             return -EINVAL;
> > +     }
> > +
> > +     memset(req, 0, sizeof(ec_buffer));
>
> The `memset` is redundant.

Removed.

>
> > +     req->offset =3D offset;
> > +     memcpy(req->data, val, val_len);
> > +     ret =3D cros_ec_cmd(udata->ec, 0, EC_CMD_UCSI_PPM_SET,
> > +                       req, sizeof(struct ec_params_ucsi_ppm_set) + va=
l_len, NULL, 0);
>
> `sizeof(*req)`.

Done.

>
> > +static int cros_ucsi_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > [...]
> > +     udata->ucsi =3D ucsi_create(udata->dev, &cros_ucsi_ops);
>
> `dev`.
>
> > [...]
> > +static const struct platform_device_id cros_ec_ucsi_id[] =3D {
>
> To be consistent with other symbols, consider either:
> - s/cros_ec_/cros_/ for the symbol.
> or
> - s/cros_ucsi_/cros_ec_ucsi_/g for echoing the file name.

Replaced cros_ec_ucsi_id with cros_ucsi_id.

> > +     { "cros-ec-ucsi"},
>
> The driver has declared DRV_NAME, use it.  `{ DRV_NAME, 0 },`.
>

Used DRV_NAME.

> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(platform, cros_ec_ucsi_id);
>
> Ditto.

Replaced cros_ec_ucsi_id with cros_ucsi_id.

> > +static struct platform_driver cros_ucsi_driver =3D {
> > +     .driver =3D {
> > +             .name =3D DRV_NAME,
> > +             .pm =3D &cros_ucsi_pm_ops,
> > +     },
> > +     .id_table =3D cros_ec_ucsi_id,
>
> Ditto.

Replaced cros_ec_ucsi_id with cros_ucsi_id.

Thanks,
Pavan
