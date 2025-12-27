Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F5E632
	for <chrome-platform@lists.linux.dev>; Sat, 27 Dec 2025 18:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766861080; cv=none; b=K/2a60VrlOYNPLiPXZGp4/ijfYC7HGq+820gUzRBhT48RMiF03/9G0HZzpKUszmGyNRU0L3U5Xjy1nm6Cu53hMFf0kpdGSWGJNZk8bPbzesxy5QqyYYh71CYvoNN69zr0ptKe3wPLHh/oLHxcMsPng8fbTtzm54uTxylw1qboNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766861080; c=relaxed/simple;
	bh=rdhIBTfFdXUktQ9sa/Bcoyf0GMkDmxm1f+vi1Bd9iOU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DCYcsFDxqEeRIxhK7m6Uq52fi+hk+AOF+fVZGS0+zm8KmW5S6G+UJjPWZfy0/p4qr2nOUf44awXA5thJ3RpeUsYOrDpUsOhA3ww2IsV9CRZ/B4n6h6KbeAV+XWDOa4ni3SLl4UTGN9nW5tuPT9QYfm22Q2U5AQ2hd/Vd4bpJtc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYiI0rpG; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYiI0rpG"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5eb8f9be588so2249311137.3
        for <chrome-platform@lists.linux.dev>; Sat, 27 Dec 2025 10:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766861078; x=1767465878; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7kO+jmMKH7V5UQhMAssLbKi2imCsali/qeRnKC3XxI=;
        b=OYiI0rpGHvUsOQQl6cykDzISNrTdgmKkprRDAwSoohd7axjOyRkVB8EqI0XYa/8k5v
         KH+1U/9mqgqV3cXJQWexb2yeH/M3qbfRrup9wokg6CC1eLSFZ4QVV+hIW8d4fDACFPk7
         N+Vk6cXBJ1FzkaM2xrzHeRlWaGkUH7fyt7kACsCbbaF7d6t/CrtKei/TKiZquOusJzB9
         A3Ox1ozcpFKiZZE4UAmOxaxTdIyspG7KfA+xF/c0b90OHkF8N5xwNP+pGH8RwRwrNFsq
         6slifKHNBVbmG2okrTtvk5YmXxnQop/owlk+elcuV/dEpw0naUcsCNkR9Vv6AVFUNf7m
         GrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766861078; x=1767465878;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L7kO+jmMKH7V5UQhMAssLbKi2imCsali/qeRnKC3XxI=;
        b=a5u6/J06knjRXrNOyFeX/QXSTzZI6OnbtiK6e5aYC3tntExtS3b01H0/lq/Ih1IDu2
         g569pJkRVAw6vliesQYSxM5pCqyeSj8A7FyYZw798l+OgcF9vrG81b3mGJm5r4KlUN6h
         TXJgc1n/MpJZU+4oavj0HNvIpRFEfOEi7wxUholku2HbSt4KWQC+eOymGbg2pDUVimft
         qdgUfiGiC9wPZN+ubukRp25RZ/XGYWQx6mpwL+P+MqZOYAqV0VvDGMOjTNU6+LR8LgMx
         CvK1Ska87z3/vbHkOYedoMGBbOtt/cFudX91hroGM2KhqQPlazjTFAaJukrjaO9CGo35
         SPNw==
X-Forwarded-Encrypted: i=1; AJvYcCWCLuuI+886/bNjXO6sOd7TQYMRAPaIxjGhV3cy0JsLiVG1MBbEXoXZs636w117v7uyA2xx29c52c98zFwDwKk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUx1gS8fXivferZ27uhD2lQqKParS5MPhDpy2lw07w6UqT/yCO
	V3KFzoF488sKzBx7aEWbTletrCHlMmQHuAaB+BxNw+ZdzUMAt3WD9tNj
X-Gm-Gg: AY/fxX7vb23lKSijs1Gj71e6eMMq3rCplTrUDy6qtM8guqa7SBNNlhBmn1//RkbvdOG
	bM+dmmxAtrt7F37+F+/BYOPxDlb4q+7Uxys9Kn/x+hPXI9eOUr9qcwiCXJX6qvXDz8u91JIizPi
	HQuz/Q4OAH6aWTLEoogkS1jA07Fkk8gnZT25kk4GSnYTQdQgxxwXy++5cAje55MJCDNxnTGqrBO
	J/JrTHtVkeL6ZILCjBUUPRu72Zt8/vgJ85oBRPR7heS4nHBboJk8xYZPW7IuNdFkx5kcHLT25Yv
	M1EKQYk+31RX4GK6vLowMrHqy3TtJhW/84kV1CtLg8t26GebY57Hv8N6tePbuzqkhI59cOd8bfo
	8KUUFynrknqYmtgKvSg3xRYYf0YtC4pdsZ5XO4XIY/gXHKcIKlOiaurJVgHS49PMsVzZ/GSi2/J
	MmlJvmEgXvZgDy
X-Google-Smtp-Source: AGHT+IEZcQ/IcoUf7aH/caNcZC+d2KO1dJbj+QLlr65L47GvTlxUk1imjM7pKXq3ZG6lkoTMvo/JAA==
X-Received: by 2002:a05:6102:2c81:b0:5db:deb6:b261 with SMTP id ada2fe7eead31-5eb1a687a81mr8750016137.13.1766861078123;
        Sat, 27 Dec 2025 10:44:38 -0800 (PST)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5eb1aa4f32dsm8215153137.3.2025.12.27.10.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 10:44:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Dec 2025 13:44:35 -0500
Message-Id: <DF97Z8HIH640.49M8GK9XPEXZ@gmail.com>
Cc: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Lars-Peter Clausen"
 <lars@metafoo.de>, "Michael Hennerich" <Michael.Hennerich@analog.com>,
 "Benson Leung" <bleung@chromium.org>, "Antoniu Miclaus"
 <antoniu.miclaus@analog.com>, "Gwendal Grignou" <gwendal@chromium.org>,
 "Shrikant Raskar" <raskar.shree97@gmail.com>, "Per-Daniel Olsson"
 <perdaniel.olsson@axis.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Guenter Roeck" <groeck@chromium.org>,
 "Jonathan Cameron" <Jonathan.Cameron@huawei.com>,
 <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <chrome-platform@lists.linux.dev>
Subject: Re: [PATCH v2 3/7] iio: core: Match iio_device_claim_*() semantics
 and implementation
From: "Kurt Borja" <kuurtb@gmail.com>
To: "David Lechner" <dlechner@baylibre.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251211-lock-impr-v2-0-6fb47bdaaf24@gmail.com>
 <20251211-lock-impr-v2-3-6fb47bdaaf24@gmail.com>
 <20251227144707.1bebcf27@jic23-huawei>
 <DF97CCMNGWVP.2JBZR7CQF1FID@gmail.com>
 <f1c1ca8d-7896-4ccd-b59b-8c6c1bf4fa66@baylibre.com>
In-Reply-To: <f1c1ca8d-7896-4ccd-b59b-8c6c1bf4fa66@baylibre.com>

On Sat Dec 27, 2025 at 1:24 PM -05, David Lechner wrote:
> On 12/27/25 12:14 PM, Kurt Borja wrote:
>> On Sat Dec 27, 2025 at 9:47 AM -05, Jonathan Cameron wrote:
>>> On Thu, 11 Dec 2025 21:45:21 -0500
>>> Kurt Borja <kuurtb@gmail.com> wrote:
>>>
>
> ...
>
>>> Given earlier discussion about this one being rather more tricky
>>> to name than the claim_direct because claim_buffer sounds like
>>> we are grabbing the buffer, I'm not sure on the best naming to have
>>> here. iio_device_claim_buffer_m maybe?  Ugly though and
>>> these are super rare so maybe this isn't a particularly major
>>> concern.
>>=20
>> Yes, it's a bit ugly, but as I proposed in the cover letter, if we go
>> for a full API rename, it shouldn't matter for now?
>>=20
>> What do you think about that?
>>=20
>> I'll go for iio_device_claim_buffer_m() if I can't think of something
>> better.
>
> iio_device_try_claim_buffer_mode()?
>

Yes, that's better.

--=20
 ~ Kurt
