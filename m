Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A083D5F40
	for <chrome-platform@lists.linux.dev>; Thu, 22 Jan 2026 22:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769120467; cv=none; b=s64W58Agx7Uu1HMkJgLJpYAkVfzFrJlzSMHURdpLPzDX7W6w19k1fu5ulabwhveWQxcEISeASecQYsdBHZVfsL4b1+w80ftYvmM5pSCGqq2fixY5hQsKsF4K89KNyalPxXGOWFxBUMjSDR3Z0HviuAzyt9sKkOC9yE3BYhx4PhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769120467; c=relaxed/simple;
	bh=QIVhtn2J0BUDxrY4uRHm2HVbU05wclPQpDf5Vk3Gr8Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=NvCKkD7uwR8dQWazHM2vrhCuINUDewKHM6TTqHdHsndvHL4FdHvnRn43nfoCXp4qAPvK/bVdNhsR3VzNTCx8uHGXgX0gviAfyZ+/kF5PyXHp1HcEJUrObgkVihEZ1Sm6yDMnmFBFZ28yZQ5WrqQ5X5MFTQ+JbsZcE3PKEZHzqaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aTq4aNQN; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTq4aNQN"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5636bf70eb6so410682e0c.3
        for <chrome-platform@lists.linux.dev>; Thu, 22 Jan 2026 14:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769120458; x=1769725258; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlTioEKk9FUswlrdV4H75LqD84cfQHLITNlV8YyKgDA=;
        b=aTq4aNQN2wRnyrpSO+Cu3oqRgMA616TTXoZC8Ewm+rVqhTbTqXAM4OFkGTeaG1nDLy
         CQkOljjOy7imMk3w8tm3NFuGU804mcrOPDX+uC5W7ajAmcFW1FSsHOUkCB/ShPlEXgVn
         eJOt5+A1ZXUl74HHcBufwc9MdhZWY+JC2G6hMPdc4wCYNxlDZC4fFyq6L5Qe6nwdEvc3
         U/tkH03VZAUUP+T12CgZAfKeqxsPWlk+szfOqaH9yvQykTER/NAP7WKHBaCAicdelSZI
         YpZN3hVxs4GTxoHIBMt3luDQG4XbQBcM0x8weKj6DulTOERJitI0nVmmsZAgy58mdYHJ
         AfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769120458; x=1769725258;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SlTioEKk9FUswlrdV4H75LqD84cfQHLITNlV8YyKgDA=;
        b=Huh4pSdOGzB0D4/QG9Y06sFVp+jm2OWmSnBz2oUQ32IUnaonas2bzqa4ojWfVVSpvb
         vfIZlL5ECgHoPFNr2+fi1V6POUxTPZ3vS98OwL6RISk3Dq26d6K5wAeFEWI+8yY2XcTk
         Aw7dfJG2KO5iUJyfwIigKkYb/bPauFw14HMANpuTU2PnS1Kk8cOYCtfNQrdfx7WLVTxO
         QwBu2Z9spJ1YHO7umoWWH+JpYF04RKBZ25VDZ6/RO4XzAdvXQxrfrcNgNw0Ov1hTYKkz
         G5Fd+ph5UX/iJ1bA0oGwk8dElu+wKleti9807hp8eR94T9yluBu5E4Dl8l2JgyFDLzPF
         mXGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbS2j6IwUQbSLmKUDJfw92YQnpBTltrUR4uUbpnteTuMaO9wkCFPxu0r0Wuoxjq67wYqnJ1cGAvwTedHqqboo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxqnAQEJPpKxrrhrNgNlJKBxCP1u29dy6xzgvluLFxrK7ox50ke
	muZ9PXw5ecWnwn3XRlUcjBN3g7ZyNU18I3/AOhJ1/K25vEMTwFalv5nF
X-Gm-Gg: AZuq6aKvmwjTsSu05jf0rp1EUFyOVPhrFYorKehy2nm4zH4yEomtJUEaquydOkcXV4u
	FDk91Fiy9Yd5fE/qvnRjxwtT1vPrKme3bgXD/BAjVT5KKzI1e/0Qbeaw7j8TP78fM93KdEP9VX1
	RTwpEpnhZqSQidOIXV73FH8SoBrntwKUUFx/awfToALH//BMmRQdkyfaaV1U1sG06Rotgguyg9Q
	2FQIOuBpxneWoVErdBrLvTNMfFRvsDN2qk5iRZkJch3Ej2NF9caSkkIsxsFISmZQT7hijzhA0pU
	NHWRA6eqaTD8t89T5bncDpkVN8MsiZ29tm7FcZeW9FFOiGThbyzuQbm7iDGnPNR1whsPwCjPJQH
	RlE5GbY+qsGYS0hcIUFlHGMYsUltkbLiY2rNF0FuJtmbyLdCI7WR3yO8UG5h0pHtjRUJ7M9tsND
	FdoQCan1M=
X-Received: by 2002:a05:6122:614e:b0:559:6663:8b1a with SMTP id 71dfb90a1353d-5663ea668b5mr328984e0c.4.1769120458447;
        Thu, 22 Jan 2026 14:20:58 -0800 (PST)
Received: from localhost ([2800:bf0:4580:3149:c903:2904:3cc3:8b4c])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663fa6342esm171468e0c.2.2026.01.22.14.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 14:20:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 17:20:55 -0500
Message-Id: <DFVGV1BDS81K.3VWJ5CAO37A1X@gmail.com>
Cc: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Lars-Peter Clausen"
 <lars@metafoo.de>, "Michael Hennerich" <Michael.Hennerich@analog.com>,
 "Benson Leung" <bleung@chromium.org>, "Antoniu Miclaus"
 <antoniu.miclaus@analog.com>, "Gwendal Grignou" <gwendal@chromium.org>,
 "Shrikant Raskar" <raskar.shree97@gmail.com>, "Per-Daniel Olsson"
 <perdaniel.olsson@axis.com>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Guenter Roeck" <groeck@chromium.org>, "Jonathan
 Cameron" <Jonathan.Cameron@huawei.com>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>
Subject: Re: [PATCH v5 2/7] iio: core: Refactor iio_device_claim_direct()
 implementation
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260120-lock-impr-v5-0-d4d22347041f@gmail.com>
 <20260120-lock-impr-v5-2-d4d22347041f@gmail.com>
 <20260122190401.510234c4@jic23-huawei>
In-Reply-To: <20260122190401.510234c4@jic23-huawei>

On Thu Jan 22, 2026 at 2:04 PM -05, Jonathan Cameron wrote:
> On Tue, 20 Jan 2026 01:20:42 -0500
> Kurt Borja <kuurtb@gmail.com> wrote:
>
>> In order to eventually unify the locking API, implement
>> iio_device_claim_direct() fully inline, with the use of
>> __iio_dev_mode_lock(), which takes care of sparse annotations.
>>=20
>> Reviewed-by: David Lechner <dlechner@baylibre.com>
>> Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>
> So sparse does change what it moans about with this one in precisely one =
instance
> There are 9 false positives with Al Viro's updated sparse - I haven't che=
cked the
> original one recently.

Hi Jonathan,

Upstream sparse is kinda broken right now.

I'm not getting any false positives on the locking stuff but a BUNCH of
"error: bad constant expresion" on MODULE_*() macros so I don't fully
trust it.

I know at least one subsystem maintainer is getting these too so I guess
it's an upstream problem.

>
> Anyhow,=20
> drivers/iio/adc/ad7173.c:416:12: warning: context imbalance in 'ad7173_se=
t_filter_type' - different lock contexts for basic block
> becomes
>
> drivers/iio/adc/ad7173.c:425:9: warning: context imbalance in 'ad7173_set=
_filter_type' - unexpected unlock                                          =
               =20

This one is interesting because I can't figure out why sparse hates it.

>
> Lets go with a bit meh for that and move on...
>

--=20
Thanks,
 ~ Kurt
