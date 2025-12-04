Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422CC33509C
	for <chrome-platform@lists.linux.dev>; Thu,  4 Dec 2025 14:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764859294; cv=none; b=fQPu561lpeQpwPWhjodAL9ISF4su7+mmTMYLrmNjAiFhVhUPkKk06+WHkyQKaVhprQDCB2jFsOYTRpQ92vMLA7n3PsXrR2vpF6zJQaxg44i3oIakdmuEk+MNF5DIGitcxA6see3yfnh6g+0R1Xk5Gr7bItQFapXOF6L8rncyqdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764859294; c=relaxed/simple;
	bh=uAbMxMyvm57aMdOKZPBzu7Mfg9sM22DttjO/XotaqdI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OLsOhmGqOgCMkg5YBokuEAr7AwcAHhGTq2v0/0CwhszjmdR9UDewg4cs3ml0NCRCbAMgntHt94qSXwE+lRro1ZuRSgTmpTbFp2XKuj5mOHfcjuwI1IE0qhYWbKw6i8dbexpPTXm1sXwGc45e/VWgCGaeIPPPX5E/NZGuavoY2+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2NZILK1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2NZILK1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477a219db05so7419885e9.2
        for <chrome-platform@lists.linux.dev>; Thu, 04 Dec 2025 06:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764859290; x=1765464090; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SYgaHNAH7r57kAaWKROJc+fUVWL2egFyf5e3gACu0+M=;
        b=H2NZILK14ENSB57n6Rvb60xB9qmZeYRFArPAcRpXIHRg92iv8eMFk/I/rr7ds69HYk
         GGP0XTp+BuCEr51ibc3dU3+3XkRFJDOTnYrQG+2vrIrwH/UM5qE8uWkX4gC4wW75pDVD
         /sa72gJbRKvDBhXJXV9STbq1Iz6Jw96D3RrcK2Mz3ZWMC1J1iy0c6AzlFflTlSZhZv2y
         tBBQU83g7zIPBgJvlKVuqUOn6c5b5j2BHNHJsdFARsbOnhrPF9ikMLsAkDR3frIYUl/3
         wTpb0r3FfN/y4gCIW9sstD8TVQCsFbETgJSTNMytylGbHyieK7/PY5YnV1fswU/njDev
         6JyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764859290; x=1765464090;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SYgaHNAH7r57kAaWKROJc+fUVWL2egFyf5e3gACu0+M=;
        b=r/IbUrGozEIF7xxrqpyR5XIMKh7qFGVkG/ayDBGEsfycSKmd+8idGlzp0tGMSYV9vI
         zkrx1KGHIGaFBk9DwkdDKIhoTWqwMTGcjCp1vmdCtDZSh76S+FRnI4K73hBTDbVWTR/C
         81DsqFD8pY/dp7WeKCj/cECfNmPfJEDUDl5cVsqV1QFtw39e2+aLc4V9XFIy8C26+oCU
         juc4aO1gNm+W+BRhNbEk1mAmFsxTB93tFWYEnp2jqCRQgftMhtfuRf1+c6PTtNGgByLI
         M5qt/kogWcpzyf/GdZfpe6ibfO/HN2lOVaiZQgBGjilZyNcMmDG4aTTo0n2ujK45RUNo
         FWNA==
X-Forwarded-Encrypted: i=1; AJvYcCVzGa/jxLnOYN3U7TrywQjTE6oeG4IrNUYX9QN749RR1ryNHavcC1rftcL4LwAzw1QsXgHdey2T3NGSuNwI8kA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJAdixjKYN8O713iTKM7NSv6PnW++jkGfQB0wq6zkoAsVMvNp2
	AhUdqWbuJDFekfi0q1QID4Sg0Od9JgVlqI/hbNrmhfdkb6XcakT7V+mS
X-Gm-Gg: ASbGncvxImqddhxqShQBjIpShjM7Ms07J48TLtTe/l5nCByp22N8m4pLsVK2OjlVviy
	xFEF5vv03eoSw7TB0pWdjY64t2p9VsxRmYk1npode7+S4GM9IVYmYSAPCAG7LM+k9UQ26R4FjZ5
	mMy3cbm/f3lwn6hEBjlHcAaZHFdrTMVhHqVAXpJPJTlxh8OwPuFsCzdBij/7cI74ss/jRRmw4aH
	XQspLZR7aTDPatA8VGV9lwfm2ugzkVi+mHOsBjcH3HLuiJ80OJFJudA9I5Q1H5wyzOm6unsuFp9
	6rW9ML/Gp4Y2fH0CBczIbnLhEi0unQSQMIr5DgoB/0mkwjRxiN2o1w/1zyY7tcAC1YPyorEflid
	BHKNnZfUjAGrwLpmIR+MQu9fwWZyDsyB5C59anwHyMI5Vwx4tGlr6IVRBqI+mpUvGd6KpfAM+Cp
	hALTzsNY0uRIJiRMOgf/w=
X-Google-Smtp-Source: AGHT+IGwPzcCScstkaW1JYgs6ST+2pHxRJAu6rrwNjx2W/K3deKlfF0F62zXGHhuoPdhomhltshf9Q==
X-Received: by 2002:a05:600c:4f54:b0:475:de14:db1e with SMTP id 5b1f17b1804b1-4792af34a2emr67754295e9.24.1764859290271;
        Thu, 04 Dec 2025 06:41:30 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b14ad9dsm41299175e9.12.2025.12.04.06.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 06:41:30 -0800 (PST)
Message-ID: <17ac2fa9033104c3bf9260fbecc1c9a5b42fcbba.camel@gmail.com>
Subject: Re: [PATCH RFC 6/6] iio: light: opt4060: Use cleanup.h for IIO locks
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
Date: Thu, 04 Dec 2025 14:42:10 +0000
In-Reply-To: <20251203-lock-impr-v1-6-b4a1fd639423@gmail.com>
References: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com>
	 <20251203-lock-impr-v1-6-b4a1fd639423@gmail.com>
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
> Simplify and drop "hacky" busy-waiting code in
> opt4060_set_driver_state() by using guard().
>=20
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
> =C2=A0drivers/iio/light/opt4060.c | 52 +++++++++++++++-------------------=
-----------
> =C2=A01 file changed, 17 insertions(+), 35 deletions(-)
>=20
> diff --git a/drivers/iio/light/opt4060.c b/drivers/iio/light/opt4060.c
> index 500899d7bd62..903963606143 100644
> --- a/drivers/iio/light/opt4060.c
> +++ b/drivers/iio/light/opt4060.c
> @@ -22,6 +22,7 @@
> =C2=A0#include <linux/iio/trigger.h>
> =C2=A0#include <linux/iio/trigger_consumer.h>
> =C2=A0#include <linux/iio/triggered_buffer.h>
> +#include <linux/cleanup.h>
> =C2=A0
> =C2=A0/* OPT4060 register set */
> =C2=A0#define OPT4060_RED_MSB				0x00
> @@ -302,41 +303,22 @@ static int opt4060_set_driver_state(struct iio_dev =
*indio_dev,
> =C2=A0				=C2=A0=C2=A0=C2=A0 bool continuous_irq)
> =C2=A0{
> =C2=A0	struct opt4060_chip *chip =3D iio_priv(indio_dev);
> -	int ret =3D 0;
> -any_mode_retry:
> -	if (!iio_device_claim_buffer(indio_dev)) {
> -		/*
> -		 * This one is a *bit* hacky. If we cannot claim buffer mode,
> -		 * then try direct mode so that we make sure things cannot
> -		 * concurrently change. And we just keep trying until we get one
> -		 * of the modes...
> -		 */
> -		if (!iio_device_claim_direct(indio_dev))
> -			goto any_mode_retry;
> -		/*
> -		 * This path means that we managed to claim direct mode. In
> -		 * this case the buffer isn't enabled and it's okay to leave
> -		 * continuous mode for sampling and/or irq.
> -		 */
> -		ret =3D opt4060_set_state_common(chip, continuous_sampling,
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continuous_irq);
> -		iio_device_release_direct(indio_dev);
> -		return ret;
> -	} else {
> -		/*
> -		 * This path means that we managed to claim buffer mode. In
> -		 * this case the buffer is enabled and irq and sampling must go
> -		 * to or remain continuous, but only if the trigger is from this
> -		 * device.
> -		 */
> -		if (!iio_trigger_validate_own_device(indio_dev->trig, indio_dev))
> -			ret =3D opt4060_set_state_common(chip, true, true);
> -		else
> -			ret =3D opt4060_set_state_common(chip, continuous_sampling,
> -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continuous_irq);
> -		iio_device_release_buffer(indio_dev);
> -	}
> -	return ret;
> +
> +	guard(iio_device_claim)(indio_dev);
> +
> +	/*
> +	 * If we manage to claim buffer mode and we are using our own trigger,
> +	 * IRQ and sampling must go to or remain continuous.
> +	 */
> +	if (iio_buffer_enabled(indio_dev) && iio_trigger_using_own(indio_dev))
> +		return opt4060_set_state_common(chip, true, true);
> +

I think that if we are open coding lock(mlock) plus iio_buffer_enabled, the=
n
iio_device_claim kind of loses it's real meaning. To me

guard(iio_device_claim)(indio_dev);

it's basically iio_dev_lock

- Nuno S=C3=A1

> +	/*
> +	 * This path means that we managed to claim direct mode. In this case
> +	 * the buffer isn't enabled and it's okay to leave continuous mode for
> +	 * sampling and/or irq.
> +	 */
> +	return opt4060_set_state_common(chip, continuous_sampling, continuous_i=
rq);
> =C2=A0}
> =C2=A0
> =C2=A0/*
