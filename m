Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F68482C1
	for <chrome-platform@lists.linux.dev>; Wed,  3 Jul 2024 07:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719990265; cv=none; b=S2SeiyZefnKb41Dx6/zISYg37H8gnX0rWKTREX7fpe0qGoPL2Wf572nWbGpifBFVoUH2Rtuwj3UngYeq5wjYzSWzrE2dWok7NYev2loGFo05ZitdQpZ6D75MP8CCXo+CUA6K/kbRe3MFhEPny2UKxUmofaci5pqcoc8b2C77lXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719990265; c=relaxed/simple;
	bh=VaQH8FnAeZDc8Csmsnv9JLeK47HkCPT9RMwfnkOGtnM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=klaotPK/i0ThvUTS332mmdHoF8D0poJXmdCIXTk5E3kVWWlMGleLZhzQ8y/UDbgH48A1jVF4qNdiDpov34rsX15aOoXg59nP4jm6OeWGteChTyK7xh5MTK5gx1x/9MZn84kmtxLkt7XcPhldcEuaWFAOYyVu76xsQiWxDzm2GcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4duQblm; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4duQblm"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42579b60af1so28878345e9.2
        for <chrome-platform@lists.linux.dev>; Wed, 03 Jul 2024 00:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719990263; x=1720595063; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VaQH8FnAeZDc8Csmsnv9JLeK47HkCPT9RMwfnkOGtnM=;
        b=B4duQblmMCCkwQeePbitSQUXXnJj3RxwdZT7X0mUK2IpmwtSH4mJynJrm+UBsEdAMz
         9hY9UiQxmvA/vsz0wIEB4DlAOwWugIgqsZXigHnH4dk4YCvWKTOCU6z9jnfEdzgs6mtb
         eh4xqm3mp8fmMG6xPFfVb8cf4laJzw9YCS25Fps5ur4lIsggKt8qbSM1LdkqMxxG1A8/
         M0LOOiXVRT8WG6zNk3Tby093ueoSoWLS0O88aeP7pnJo9dr17TNcFIu9PLIL3iUQWZOp
         0gxKS8CoprrW5c7kyqGhdaLw8mG5hIbS8gaSoNRCXjz+jcuXy2u38p05Pb+ks4+gZGjD
         lxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719990263; x=1720595063;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VaQH8FnAeZDc8Csmsnv9JLeK47HkCPT9RMwfnkOGtnM=;
        b=FpTuFcCIUIr3mOecq7T+Z14L5AiKj+ssc3G5Ska5cXE5kmsR2x4U2NeqqwMT//cUsJ
         OgxTi7HfySGgTCJ1RPuyXNK/PmhhK8WWUhOK0IgsWL/ZcFl5IDuhHHP/AbB4p8yQy0vy
         3q1zRp9J+bujSIcDAZXtiqHWUQF/VPlQ2Lb6Mx1HxFO4323/XK60EoZn4XOkfFBudpPL
         kMtUmEGgNOs4dilHdidQPek1rLGw+z0jhXqQ2NjUWgWTi1R4OcBV0UYqYbqeNNXE4vux
         SlaPHg3yGS8F8E26fmGWJsDyOIsgwqg7HyDn4QpFKbw6/SUnLvCApXgSljd+AYjSkhSZ
         VdpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPQv7H2eaMINpmV3buN8lhkf5s5h5AgdAXpg/o8UUBvQmyKOgI9cgGcsgUNznd4fjCaUyL5kdrVDBco+V44M4lHUdiOOzwC5UaAg+bEiip
X-Gm-Message-State: AOJu0YxKAmv/3DDKZiTKEeFeE8Vpav/fkEtpuMwQkZqP0eCFfSzv/qnc
	6eskTJnJ8Tmtr4U4UMOQlLB1rhjEFyz9w+UFsmxkRzt0lWW+do4A
X-Google-Smtp-Source: AGHT+IF1/X4CW1biRaLUYQHCJICLl9pL8jg7bhq/psGQ54W0jjdfLvD12ERfTNls96cW+bjZA37eHA==
X-Received: by 2002:a5d:4576:0:b0:367:84ae:ddac with SMTP id ffacd0b85a97d-36784aedff1mr2314026f8f.17.1719990262321;
        Wed, 03 Jul 2024 00:04:22 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef1c:c500:ee59:d953:f148:40ba? (p200300f6ef1cc500ee59d953f14840ba.dip0.t-ipconnect.de. [2003:f6:ef1c:c500:ee59:d953:f148:40ba])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0cd6b4sm14991759f8f.17.2024.07.03.00.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 00:04:22 -0700 (PDT)
Message-ID: <115b0657ff02ea10c9d0687a637759ed4164ffaa.camel@gmail.com>
Subject: Re: [PATCH 08/20] iio: accel: cros_ec_accel_legacy: make use of
 iio_get_masklength()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Alexandru Ardelean <aardelean@baylibre.com>, nuno.sa@analog.com
Cc: linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Cosmin Tanislav
 <cosmin.tanislav@analog.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Benson Leung <bleung@chromium.org>, Guenter
 Roeck <groeck@chromium.org>, Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Claudiu Beznea <claudiu.beznea@tuxon.dev>
Date: Wed, 03 Jul 2024 09:08:14 +0200
In-Reply-To: <CA+GgBR-uazN8==3FHWo6Vb_Y3YEoMMnOLqJnfXtAsrS7Pc6B1g@mail.gmail.com>
References: 
	<20240702-dev-iio-masklength-private-v1-0-98193bf536a6@analog.com>
	 <20240702-dev-iio-masklength-private-v1-8-98193bf536a6@analog.com>
	 <CA+GgBR-uazN8==3FHWo6Vb_Y3YEoMMnOLqJnfXtAsrS7Pc6B1g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2024-07-03 at 09:37 +0300, Alexandru Ardelean wrote:
> On Tue, Jul 2, 2024 at 7:02=E2=80=AFPM Nuno Sa via B4 Relay
> <devnull+nuno.sa.analog.com@kernel.org> wrote:
> >=20
> > From: Nuno Sa <nuno.sa@analog.com>
> >=20
> > Ue iio_get_masklength() to access '.masklength' so it can be annotated
> > as __private when there are no more direct users of it.
> >=20
>=20
> I would have suggested maybe a "iio_for_each_active_channel()" here
> instead, but after looking into the driver a bit more, it looks like
> it's part of a broader rework.
>=20

Yeah, we have a scan_mask that I don't think it's guaranteed to be indio_de=
v-
>active_scan_mask. Also don't think (at this point) we need another
iio_for_each_active_channel() helper which takes mask as most of usecases u=
se
indio_dev->active_scan_mask

- Nuno S=C3=A1
>=20
