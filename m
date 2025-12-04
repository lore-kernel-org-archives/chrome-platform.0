Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B51C23ABAA
	for <chrome-platform@lists.linux.dev>; Thu,  4 Dec 2025 14:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764858163; cv=none; b=Etn4riibzWPsNSqtWpTLwFNuQ1jWB0GvSETwxWuoBWHVxCizipvF+2yMI+MfhNrwbPeRgjMImFFMDoYSO2UuE4Nz0l2o8I9k3YYJNkFiOKrV2or0Od/7tyUEJsfUYATvbmUY/UtEhovQFZJIBuvIuCV/mhIjVNpbaEW3+uXSrTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764858163; c=relaxed/simple;
	bh=FNBg/aXlkpeZs8DBArvFxRgWWANEdgPP75jkUWYJflw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ACahmS3lTc2A692n7q4Q7TtVqbiETpL6JbXKSM5dKz0uC0A0j+gXbzDVqLl14xiZZJqUWBDNaaBTNXoMYDfaLSmygtJeY6urQMfxRpPJ8e07Y5Re/atIiisfi9W1dm8ToSkIKiOeTl59/Ydc4S2171GhUY7mMNaut/oqkRsDKys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICe8527U; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICe8527U"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47774d3536dso10077085e9.0
        for <chrome-platform@lists.linux.dev>; Thu, 04 Dec 2025 06:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764858159; x=1765462959; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lNDG6GuMsZDqikeQhQzdv2px+61VwRvh7/YTpl3X4ic=;
        b=ICe8527UwbE018jC8lgSpqQHfaVP/NkHo3VEQhBOXV5kvQOgJF2AudLIK48Mz/2sHl
         1ggGC/zP0efRMy/mX/+OgzVnF985mfjSyQC3GAYCz/qFyfYNgKrrturEAOye8MsmbJHj
         zQuR+SaCPf8uW5ugoVZG/X4EpI7y4L0i43cgg5Q9ln+uowJGCHBBvrguOj0MO55AXOH1
         ws+cZvQv7CQ5vxvH1mDDw+8kW45BWjuNcXUYYfrvTwEi1D5xf12loVwUXfF297jg5jK9
         XgNmrbrBA/fmRGF5aYVr9+CHT7vCEmxKUikqXkqoz+gJDNqkuJAesriihiqNJwI8xcUP
         9s6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764858159; x=1765462959;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lNDG6GuMsZDqikeQhQzdv2px+61VwRvh7/YTpl3X4ic=;
        b=aB2FkJO7IjNwEF9XfvmfN2egoEWBPX7igI7lfBaHKrxqBJd7gyW79iV6Q7QpqcYn08
         XyXWbwnweq+K6fWOVNeT3OlaY1mO4HguqhWjIMFLZlq+j26Q9rJk+dEw1Z3t3FAodr84
         tM0/gXDACOMbTO9aPjomhHc64KdEvFFafte+EVUCTQTUESsO0pu5yR0uA5fpkrAhiTG4
         QyExNS9s9jzX+9+ycxrNhE2M3scNKseHyyyBMrHN6BSX3qsrgoeBWM3IhR/eGwMBOU1y
         gh3x7xZB0NixWITz4J8FZ6l5kYeEo+Af5Sv0yvTosetoMcapYbc1FBrgaqQ1skIFI0r4
         UvKg==
X-Forwarded-Encrypted: i=1; AJvYcCX1ygwzJfOHucKlOrTkaRMhSgD/8Bn3FhJREyVURlDs2it0r7R+SqfN5Fra8b+8hMLBwkmj0PI8Lh+tfkOKj4Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YynQEzhm56WwaZoEdjMq/e/AtpWbsLXe4ICKBS9piN7Esn01oP0
	RsQxCZDF954EttXZWsUu2UkIgQFfL4F8Znthc6buD1LvJoZMR9352f6P
X-Gm-Gg: ASbGncuvbn3TdiQpooSvWrjF+q9sLjku9XxuWAfyuxcOfQHl2FNgAev7HUnXOfx7mR5
	+5LDksjL1uP8GlY8Q+4na2sY6NiSp6NmsJrgUFwuifqwMPWv0cE0G3DTRwlt3JSwnoPJ7eg23VT
	WbYDqsOrMmq0kQSTY7QQPkCNvFGopszS1CPkVgA0cZqI4tyykMZi9gj0yWI+vACdlX9U9+lK3IL
	MZinKW5vrFLMP1dKyovGzdKKnj0Jqvj6Xz2gk3oABnOMmfaYl3A9+v1smnzEIhmhtld9Hu7Zz7V
	vion/7OyQEeSzOIuf7dcVnwWLpyLGU94LOxAq/sr9cq5XUsvCww/j/meXOBWv/SIAq5nwFfVC3T
	IXuj2/gS+ByWOscbWLM3sUg24IptxhQ3Ktz9jUyfrCXphPY7zXPR1HTchdObi+enhxU8eXwM5MW
	i3+TmbFLe7KOQvf2jYt9w=
X-Google-Smtp-Source: AGHT+IE8ryaq+bro+W0C+oPynjAr8yRyWAwkzp4GpExnDcsobnvZZMTRh3TBX5P0XKrrpanLsjAClA==
X-Received: by 2002:a05:600c:1f90:b0:477:9e0c:f59 with SMTP id 5b1f17b1804b1-4792eb12478mr38164195e9.2.1764858159131;
        Thu, 04 Dec 2025 06:22:39 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310c802bsm32350095e9.6.2025.12.04.06.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 06:22:38 -0800 (PST)
Message-ID: <9562673ef83dd73b6092b5a7d2042b380a55700c.camel@gmail.com>
Subject: Re: [PATCH RFC 1/6] iio: core: Match iio_device_claim_*() return
 semantics
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Kurt Borja <kuurtb@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>,  Lars-Peter Clausen	 <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,  Jonathan Cameron	
 <jic23@kernel.org>, Benson Leung <bleung@chromium.org>, Antoniu Miclaus	
 <antoniu.miclaus@analog.com>, Gwendal Grignou <gwendal@chromium.org>, 
 Shrikant Raskar <raskar.shree97@gmail.com>, Per-Daniel Olsson
 <perdaniel.olsson@axis.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?=
	 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Guenter Roeck
	 <groeck@chromium.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Date: Thu, 04 Dec 2025 14:23:19 +0000
In-Reply-To: <20251203-lock-impr-v1-1-b4a1fd639423@gmail.com>
References: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com>
	 <20251203-lock-impr-v1-1-b4a1fd639423@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2025-12-03 at 14:18 -0500, Kurt Borja wrote:
> In order to improve API consistency with conditional locks, use
> true/false return semantics in iio_device_claim_buffer_mode().
>=20
> This also matches iio_device_claim_direct() return semantics.
>=20
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---

Even if the rest gets a NACK, I think at least this patch makes sense. In f=
act I
would even extend it so that we have the same inline API with proper annota=
tions:

https://elixir.bootlin.com/linux/v6.18/source/include/linux/iio/iio.h#L679

So it really has the same semantics as iio_device_claim_direct()

- Nuno S=C3=A1

> =C2=A0drivers/iio/adc/ade9000.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 2 +-
> =C2=A0drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c | 5 +----
> =C2=A0drivers/iio/health/max30100.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/iio/health/max30102.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/iio/industrialio-core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 8 ++++----
> =C2=A0drivers/iio/light/opt4060.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0include/linux/iio/iio.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 2 +-
> =C2=A07 files changed, 10 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/iio/adc/ade9000.c b/drivers/iio/adc/ade9000.c
> index 2de8a718d62a..b345c4d1ef24 100644
> --- a/drivers/iio/adc/ade9000.c
> +++ b/drivers/iio/adc/ade9000.c
> @@ -964,7 +964,7 @@ static irqreturn_t ade9000_dready_thread(int irq, voi=
d *data)
> =C2=A0	struct iio_dev *indio_dev =3D data;
> =C2=A0
> =C2=A0	/* Handle data ready interrupt from C4/EVENT/DREADY pin */
> -	if (!iio_device_claim_buffer_mode(indio_dev)) {
> +	if (iio_device_claim_buffer_mode(indio_dev)) {
> =C2=A0		ade9000_iio_push_buffer(indio_dev);
> =C2=A0		iio_device_release_buffer_mode(indio_dev);
> =C2=A0	}
> diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> index 9ac80e4b7d75..8ed4b2e410c8 100644
> --- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> +++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> @@ -188,11 +188,8 @@ int cros_ec_sensors_push_data(struct iio_dev *indio_=
dev,
> =C2=A0	/*
> =C2=A0	 * Ignore samples if the buffer is not set: it is needed if the OD=
R is
> =C2=A0	 * set but the buffer is not enabled yet.
> -	 *
> -	 * Note: iio_device_claim_buffer_mode() returns -EBUSY if the buffer
> -	 * is not enabled.
> =C2=A0	 */
> -	if (iio_device_claim_buffer_mode(indio_dev) < 0)
> +	if (!iio_device_claim_buffer_mode(indio_dev))
> =C2=A0		return 0;
> =C2=A0
> =C2=A0	out =3D (s16 *)st->samples;
> diff --git a/drivers/iio/health/max30100.c b/drivers/iio/health/max30100.=
c
> index 3d441013893c..3f3680c4b42f 100644
> --- a/drivers/iio/health/max30100.c
> +++ b/drivers/iio/health/max30100.c
> @@ -417,7 +417,7 @@ static int max30100_read_raw(struct iio_dev *indio_de=
v,
> =C2=A0		 * Temperature reading can only be acquired while engine
> =C2=A0		 * is running
> =C2=A0		 */
> -		if (iio_device_claim_buffer_mode(indio_dev)) {
> +		if (!iio_device_claim_buffer_mode(indio_dev)) {
> =C2=A0			/*
> =C2=A0			 * Replacing -EBUSY or other error code
> =C2=A0			 * returned by iio_device_claim_buffer_mode()
> diff --git a/drivers/iio/health/max30102.c b/drivers/iio/health/max30102.=
c
> index a48c0881a4c7..288c2f37a4a2 100644
> --- a/drivers/iio/health/max30102.c
> +++ b/drivers/iio/health/max30102.c
> @@ -476,7 +476,7 @@ static int max30102_read_raw(struct iio_dev *indio_de=
v,
> =C2=A0		 * shutdown; leave shutdown briefly when buffer not running
> =C2=A0		 */
> =C2=A0any_mode_retry:
> -		if (iio_device_claim_buffer_mode(indio_dev)) {
> +		if (!iio_device_claim_buffer_mode(indio_dev)) {
> =C2=A0			/*
> =C2=A0			 * This one is a *bit* hacky. If we cannot claim buffer
> =C2=A0			 * mode, then try direct mode so that we make sure
> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-c=
ore.c
> index f69deefcfb6f..a10590ac4e17 100644
> --- a/drivers/iio/industrialio-core.c
> +++ b/drivers/iio/industrialio-core.c
> @@ -2224,19 +2224,19 @@ EXPORT_SYMBOL_GPL(__iio_device_release_direct);
> =C2=A0 *
> =C2=A0 * Use with iio_device_release_buffer_mode().
> =C2=A0 *
> - * Returns: 0 on success, -EBUSY on failure.
> + * Returns: true on success, false on failure.
> =C2=A0 */
> -int iio_device_claim_buffer_mode(struct iio_dev *indio_dev)
> +bool iio_device_claim_buffer_mode(struct iio_dev *indio_dev)
> =C2=A0{
> =C2=A0	struct iio_dev_opaque *iio_dev_opaque =3D to_iio_dev_opaque(indio_=
dev);
> =C2=A0
> =C2=A0	mutex_lock(&iio_dev_opaque->mlock);
> =C2=A0
> =C2=A0	if (iio_buffer_enabled(indio_dev))
> -		return 0;
> +		return true;
> =C2=A0
> =C2=A0	mutex_unlock(&iio_dev_opaque->mlock);
> -	return -EBUSY;
> +	return false;
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(iio_device_claim_buffer_mode);
> =C2=A0
> diff --git a/drivers/iio/light/opt4060.c b/drivers/iio/light/opt4060.c
> index 981c704e7df5..8cb3fa38077e 100644
> --- a/drivers/iio/light/opt4060.c
> +++ b/drivers/iio/light/opt4060.c
> @@ -304,7 +304,7 @@ static int opt4060_set_driver_state(struct iio_dev *i=
ndio_dev,
> =C2=A0	struct opt4060_chip *chip =3D iio_priv(indio_dev);
> =C2=A0	int ret =3D 0;
> =C2=A0any_mode_retry:
> -	if (iio_device_claim_buffer_mode(indio_dev)) {
> +	if (!iio_device_claim_buffer_mode(indio_dev)) {
> =C2=A0		/*
> =C2=A0		 * This one is a *bit* hacky. If we cannot claim buffer mode,
> =C2=A0		 * then try direct mode so that we make sure things cannot
> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> index 872ebdf0dd77..bf7b7337ff1b 100644
> --- a/include/linux/iio/iio.h
> +++ b/include/linux/iio/iio.h
> @@ -687,7 +687,7 @@ static inline void iio_device_release_direct(struct i=
io_dev *indio_dev)
> =C2=A0	__release(indio_dev);
> =C2=A0}
> =C2=A0
> -int iio_device_claim_buffer_mode(struct iio_dev *indio_dev);
> +bool iio_device_claim_buffer_mode(struct iio_dev *indio_dev);
> =C2=A0void iio_device_release_buffer_mode(struct iio_dev *indio_dev);
> =C2=A0
> =C2=A0extern const struct bus_type iio_bus_type;
