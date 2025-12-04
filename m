Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771DB2BFC60
	for <chrome-platform@lists.linux.dev>; Thu,  4 Dec 2025 17:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764869829; cv=none; b=ZvFjxkg1/E1UzRsH0UgMRzPH3UR7yHV2y4s0bIxBdM+lthNZzddEGlmYyVxHQDYfNgTSkeoWKiyk2GL2rzG/drAugWLa7rtb/rUk2MNmAgEJvQXlZUbBABb6jawJ9lIkNFwaZeVeLz7OUHDr6b4ERoNfAz/dOOWj2UcxShGUA5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764869829; c=relaxed/simple;
	bh=ZgzmBZqMJAawpCjkwWCCg/nGsPnAcX76cb7EUrDgojk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m2+02tmaxnqM95uHzjHZef38CbhsDS4Zz4rG5FB08qoAAq5nXDQYfrM9xKAypk7tvdMvJNb9ZXxsu7X0KkzDO+y+YqsTTVe+WUDbvzI92HwS8+o4uz2jJZGX4OWisnVQOfEg407Aa6dMmL43v3d43e0kTNpvjEjdU8DIbRkyl8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWW2zvdo; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWW2zvdo"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b72b495aa81so179405966b.2
        for <chrome-platform@lists.linux.dev>; Thu, 04 Dec 2025 09:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764869825; x=1765474625; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BQLbcjgKsilNfqOn6X43Rt+4x0ozo8KOBEnJ5KW640=;
        b=GWW2zvdo+tyiPVfyEL1RRZvgMj5IDpLcjlr/vy+B4J1gG5Fh2SvM9gNqTATryjmq3m
         oER8xsoms1MdR4zrgBBeYJFXhWmz70wA9srscgx2BAXna/aQje+pUt52dOFIXkMb9D4I
         hzw/FhMuO35Lf0uXQU1OymZLAX4U0U6V2Z0gleqo1dP8vP+tVjyTbBvzn+QQhayJQEhN
         BW0xFNaI3hJhPI2X8wNmC7XpeyGmSrfxBt+T/aG3f4mxy8ARzsVwXdoGO58c+kWIifxk
         v7svsRSXiswDijlqOiC51+HxYRl/hZs3ZR03/VHy8lDAAVMlwO+Pkse4HQ4t4tcGYavi
         Rpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764869825; x=1765474625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8BQLbcjgKsilNfqOn6X43Rt+4x0ozo8KOBEnJ5KW640=;
        b=T/0UiJPJMUudAT4IHGNpTvmGtz6rEELBP83/9JoxjjWlbWk7hkN4VlheHRF8GBu+bZ
         MicQhlFVqPUqQ7apH37y+BfwRpsDLnpKf5qdX8oqY/KInobYdQZ6BRcA7P3xES2LvEss
         0zvOft+gmACMan2pyM0rsJpvN0w9TWQ7Ck+Uxz/JeV/KSUxHxj8A4XsrqQpDA0cV9UUo
         GjEl5RgeD8AVfVLZfRrh+WIKh6FDTU66jtUB7iOQ+JSYDhxn5jk0ZQqdf+yRUc+nZKKf
         abBKe6MQfi38ZKRHfGdDJ1rTCyaR707ojVINvvbncxloDKpIYCnCM1K6bVX4JJfZmzSZ
         vniQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAlbjr9ChwbCeYCJc8DWBahoZI0RFXUFpZkqHAIjjBHw4/4YNL8nPUzd3utxzipzQHxdAol0AiD7cC3I2NApk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxeNn5DSkCKOMGe35RtBUNEwaVuxkNvz0hyCFAs3aRze2LU5WY4
	/T+Xhu2OzAFG8abYZP8eeppM/A2BkeLGqlnKTJNTL8L++IGn8Cw9eCzmQHQuTFMAfV0GWCwmxbx
	RGwSurcyOOOqCa2gqOsh7fbQJ1TJWW90=
X-Gm-Gg: ASbGncvjylBu2QcmdMW9+R9KlJCAv9EKz/ffL9hi31AVSTFDBOKMnwPsSSgBmBTuMP9
	HYirD7OjDhDTzZUkRYP6Y7SS8OcBX1MbsAT6ZGKS6xQSfo6AwyrT789D49SX5TjECjCetCREHwy
	JJT0GRXNNPdfo0B77F+puwgkv3BbI5SFRVU6/iWV2hU/MXKdTxMsjrl6keM+BdtZUH9huByZZOU
	Mxq7dJYmumK7CApD/QkTfIC5M5ja/jS0A/X0+4MPaKv/DIMd1TZ+k9M+zXhAhHoXHD28yl1yEyV
	lUf9hmqTZGBpHeR0UKWYv3Vdy2vbD5uFEOpAwOpHssRlhb+TuGPLQs+YF01D/+qsYMKbX/M=
X-Google-Smtp-Source: AGHT+IGu4EhWdWebokvC6nyH0CrAw8ML5oSy75K4E2Z1KiQLpuJqOa707YRdV0x+bmhibN66hz9hlhgo0v5tYtZsaFQ=
X-Received: by 2002:a17:907:5cc:b0:b6d:7f84:633 with SMTP id
 a640c23a62f3a-b79ec471625mr414930766b.20.1764869825237; Thu, 04 Dec 2025
 09:37:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com>
 <20251203-lock-impr-v1-3-b4a1fd639423@gmail.com> <3b80f8f3-c435-49f8-8c55-42568215bf0b@baylibre.com>
 <bf1c82f7-da25-47b6-846d-9f8427ee5790@baylibre.com> <DEPLQT84HBAO.2GAY5BHP05HNL@gmail.com>
In-Reply-To: <DEPLQT84HBAO.2GAY5BHP05HNL@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 4 Dec 2025 19:36:28 +0200
X-Gm-Features: AWmQ_bn8M8Heg2nz0ikwFrBiGyFDVL5TT406gr9AGLPt0PPLB8ojYWmxxwHQL8Y
Message-ID: <CAHp75VfpG4PAG6rC5aFYAPLgnOZZzfJcGP6bMzKPMkMjpuymoQ@mail.gmail.com>
Subject: Re: [PATCH RFC 3/6] iio: core: Add cleanup.h support for iio_device_claim_*()
To: Kurt Borja <kuurtb@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Antoniu Miclaus <antoniu.miclaus@analog.com>, Gwendal Grignou <gwendal@chromium.org>, 
	Shrikant Raskar <raskar.shree97@gmail.com>, Per-Daniel Olsson <perdaniel.olsson@axis.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 7:18=E2=80=AFPM Kurt Borja <kuurtb@gmail.com> wrote:
> On Wed Dec 3, 2025 at 5:34 PM -05, David Lechner wrote:
> > On 12/3/25 3:50 PM, David Lechner wrote:
> >> On 12/3/25 1:18 PM, Kurt Borja wrote:

...

> > When I made the comments about keeping "mode" in the name, I forgot
> > that DEFINE_GUARD_COND() only extends a DEFINE_GUARD(). So I understand
> > if we need to make names that fit a certain pattern rather than what
> > I suggested.
> >
> > Still would be nice to have:
> >
> > iio_device_claim_mode()
> > iio_device_claim_mode_direct()
> > iio_device_claim_mode_buffer()
> > iio_device_release_mode()
> >
> > Just really annoying to rename iio_device_{claim,release}_direct()
> > everywhere since we just did that. We could keep both names around
> > for a while though to avoid the churn.
>
> If we rename iio_device_claim_direct() (which is huge), maybe we can
> pick shorter names and more descriptive names while at it? I was
> thinking something like:
>
>         iio_mode_lock()
>         iio_mode_lock_direct()
>         iio_mode_lock_buffer()
>         iio_mode_unlock()

The device context is important, so at least iio_dev_mode_lock() (and so on=
).

> Shorter names will also keep lines short when using guards.


--=20
With Best Regards,
Andy Shevchenko
