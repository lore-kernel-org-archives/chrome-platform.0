Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7297A3812C8
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jul 2026 10:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783332547; cv=pass; b=ODJLwuodb4qJgl8G7WVAS0o8QTy2jR21pM2IrUd6e5WvH43Mzm0rz3IngZyZitq9KR4VQkY3Gicmp3Knd7jzKVi6xp7pASOTsqyix1ooRwooDoW3GsAr18bGT+tnkbXRnvebiAjPyi1tnWGLRZqT4thBlcoU+c9EiUZnHfiOxQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783332547; c=relaxed/simple;
	bh=IFML3rF9djtar7SwsjcOXZQUh4NL6BJakKNcU6x9ydY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f/rn7DXudDc/4r7flR8GWkqaeC5GZTyg7N9b4CUAiTDeDDkN2vtcpReDOV+aEM7ui9Ffbpn9SaK7SDavaBmas47WEUz7o0JZnUt2a3hDJZZJ2XkP2Et8uURy/6tTS07Qq8GTl9qt8o+I6cQY+RmOSLqTlNtGcE9LR9paScIbpjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VjacwOJk; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VjacwOJk"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-664d530fcfdso3762368d50.2
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 03:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783332545; cv=none;
        d=google.com; s=arc-20260327;
        b=XRbJmAmCm0OBQ6ysxe9zpo7n1Syq4LqCgIwpqr16++HpJ/j4fglgc3A7UqapThS/Jg
         e5PSZf00JHLT8oHc0sCMANVdMEqzRhLFrj1UkHv4P5sXjYmO3fi36JD+Kz+OD/o8UlMC
         oxXElxV0OpnYzbyVTI9AuwAxNSP5zcKdngXK4JQy1Zg0GUpm8K1uU86FQ6ysTz47Ru3O
         JSrnj6n6rOVkHH85YVWi1b6A4POh953QBK3SlT2WB6PP62pVQ5GaJ+arfXOZeun8sb7A
         tb4fmCHcg5/R3BTpPix+VtWy06nPgcVHW+TdPoiCaSd0MolmWg4ngnHpvNqmRSDATSIX
         FycQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1ZFMxJ4WY9L/AhejN1XNCOeUtwifJmbyAtlJAOc91pM=;
        fh=oOoeLRhRIbA0yCUJ58R+SXvIkH6aXzbbB4pOaKTZSbs=;
        b=CwUZTazl/hYCIJZKkDeDVQUjN9rKx+jVnFznr6P+A8S31P+ox65dzdOJLz2LYDk9Kp
         /1mrc1rpBeAHu7vyZ+OWUZPBxSIYkXkGPNzZnAFhYU8Vwh0L3UYYYWXXC6FM6wYJNBmv
         EbqGV2ikeKAfiTzMTpzGWAGSyCSpyEqqlO0kVHpdiP6zOEI1c/EjzGgYVUSrUgY2QqPL
         0bg9PmgS+gfElqI9EHw+srBV/PCjrZd2ZimSOXgIOVYaZgEC2r/8DBjmSRC8L/eEnBz1
         +E5dbpYDcQhGorlbup1ivTAGFlfKvDA2NOC1kkF4KvFVqnJRnTIFEPaF/dzVly0Kg437
         5ArQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783332545; x=1783937345; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZFMxJ4WY9L/AhejN1XNCOeUtwifJmbyAtlJAOc91pM=;
        b=VjacwOJkcZSdIKVJ1g154dBgWFOJ90T3Zt4eckakyCbN4WGI3jAtlG/4XOOhcFFVoP
         Nc+HmIyn4NDV+2vlN+NjEufHdjYyDcWSazqSagCGUVmmHGCEMa1OqmUgulD9U6JBav5k
         1+IZLNLmrRht5wf4HTgRJ5MBc2DrZlcPPogl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783332545; x=1783937345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1ZFMxJ4WY9L/AhejN1XNCOeUtwifJmbyAtlJAOc91pM=;
        b=cMVjvzznZWPwJeVxnqE8yqJpEHppcwOLj6+6CU8DdgUpLeqdbEMMZm/zfqJIV2FGEl
         rNwx2UUz8vux4s4/6hdNp5njZyDhw6TcKX16w7CRpgMtk8aLDsAyu5aYR9pVU+z+1eyV
         0B88BkuZ9PJKie5sjVAw9ge04jbEiyBW3dA+wZlFq+aEKNv+YqMBAJTKK6x9nXlMVhb/
         IMmBkWuZGLARf+6w7jaP963u3H4lPVP3Af2urk1h044pkA1UMVRSNvVVSk+qjFWTTbNK
         IISD9HdUVyALlU8F+uc6oyDCbtidq4NtLOjRsLtzyyyKAfa5fQ1SyePwio5QgkCOIIGQ
         l32g==
X-Forwarded-Encrypted: i=1; AHgh+RrK03NaiWVBcmfTc6Qxif9Bvp5VhbkXCmVUfo7Z0Eq7sp4KKYGQxTsOz1pQpcVeC1M3tUiMhz83mHA8ZoSir9o=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXCyoy0nPox1+ojefHmnOP0GIaDcd7CMm9g9wKHqNbcfvp0de+
	g/Phgx3qld7fTO0sgzfIy1vQNu/n/qM7ZRQL/RLGG3GKBKyYrUWcBJ4eD68YXt5Z0Nmx+YDmkTj
	fibjXdcqQqhOc6OlVHhxNVzCHY+wLY209uQGXtvGS
X-Gm-Gg: AfdE7cnIDIXaeYnFoGoJO+8PtEaxMtN84sgiTieXQBCR8TpgksV5FeZeZ+YyZaKmI5Q
	TWDeiqUnC+p43PTdChO/yeMkVrtLI6kRmVBo+9aSstRqLAgV5euLGAek7maX311R39QyeRmpJX/
	GYsPU9/NEJ8JIVqNqdPlUZU6+Q8OQVHxuy2ptAf4cZ3gsi7sYDNiIv7X0fjtQnCD0e37R+ePvRR
	XyvNqn83Op7IQVN5r6L9FJvchQzWqDkHLH0f51lXWfwD6Lu57iFnFaBX6k0hAzT60nGXRWsH3pU
	eHs5NEeuQY1WeiBsqd5arKV8FDg=
X-Received: by 2002:a05:690e:120c:b0:652:5567:b3ec with SMTP id
 956f58d0204a3-66652e2416cmr8660052d50.37.1783332545405; Mon, 06 Jul 2026
 03:09:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703115601.1323491-1-wenst@chromium.org> <20260703115601.1323491-2-wenst@chromium.org>
 <akmZOC_J2ZTl4zLX@google.com>
In-Reply-To: <akmZOC_J2ZTl4zLX@google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 6 Jul 2026 18:08:54 +0800
X-Gm-Features: AVVi8CdednA09-ELXrMS4uc6xSUtulA0xKkThvjfCvkhmpOamhA7IkBdQY8wb_E
Message-ID: <CAGXv+5H_SXO0DtN9wjrXyAvuzG+CkYh2-4eMg=biOSsFV=E1=Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] Input: elan_i2c - Wait for initialization after
 enabling regulator supply
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 5, 2026 at 7:44=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Chen-Yu,
>
> On Fri, Jul 03, 2026 at 07:55:54PM +0800, Chen-Yu Tsai wrote:
> > Elan trackpad controllers require some delay after enabling power to
> > the controller for the hardware and firmware to initialize:
> >
> >   - 2ms for hardware initialization
> >   - 100ms for firmware initialization
> >
> > Until then, the hardware will not respond to I2C transfers. This was
> > observed on the MT8173 Chromebooks after the regulator supply for the
> > trackpad was changed to "not always on".
> >
> > Add proper delays after regulator_enable() calls. To avoid impacting
> > the boot time of existing devices that have the power rails always on,
> > skip the delay if the regulator supply was already enabled. In this
> > case the regulator is either always on, was on by default at power up,
> > or was left on by some other driver, such as the I2C OF component
> > prober. Either way the controller has had ample time to initialize.
>
> Unfortunately we do not know that [it had ample time]. For this code be
> reliable we need to record the time at which given regulator was turned
> on and then execute/adjust the delay as needed. Until we have it we need
> to assume the regulator was enabled at the time of regulator_enable()
> call.
>
> I am not concerned with increased boot time too much given the driver is
> set up for asynchronous probing.

I'm a bit confused since you raised the issue for ACPI platforms that don't
go through the regulator API. Now you're saying it's not a big issue?

Either way I will add some new regulator consumer APIs to handle this.
This needs to be in the regulator core to prevent race conditions, such
as when one thread deems the delay is enough just when another disables
the regulator.


ChenYu
