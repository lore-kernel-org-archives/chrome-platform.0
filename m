Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD0F363C55
	for <chrome-platform@lists.linux.dev>; Thu, 22 Jan 2026 22:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769120856; cv=none; b=b7lrBohGTuaTccef2JGhwV3JsypS1HpV0xRaJocT5qcCphG03w1biqzEG1loiL8D5z6qx7KLizIDUzBx4tT073Ow8XQPcFeXd3UaiAWQye52dPkJ1up8d2u/dx4LHDBjychLAhLtVo4n1F6X1Fl8ddJ6XPJsrZ2RiO8MVWWA2ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769120856; c=relaxed/simple;
	bh=ZssbIbYyhJxGAI1RfQdyrNCll8e8m/BvfBwg2KD5tsk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=p50/lFdspnEWJsryERo5Fi1KJYd6gOYxggC6RjV9svzzUKpZ6Mh9noLl+sEoACtrDt/NELqK0gri1rnZbcf+RXMYe3vQ7rQADdGc93e8bza+yEgtAPEAY4kXzMiZfOLT6Ave1CtAQiVf+RLd70+DJot5xeYhdLwHGg+B7bd0jbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mvy0f6JW; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mvy0f6JW"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9480ec9596cso439555241.2
        for <chrome-platform@lists.linux.dev>; Thu, 22 Jan 2026 14:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769120850; x=1769725650; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UklvachexUu0ZUTLfggsuMCR/kjk6daLXKn7WqUk/vU=;
        b=Mvy0f6JW7q1RUkheHVD5KqL0L1QYg7aiGqzAKU1I07n/UfbX0W7grq+DPDJqU4OEzl
         zmgyt0hQCzloNe4ZXaI8sueYMfvPxH8AySq8M7Mi0BbxvWtxZLAdNPYGGh50Jnn3aTbU
         F3iuire9hJnemdjSQGjdKpak3bUTUC7a+UcnnGBHdd7LXs3Z8LvN5M6hSU2aQk3Fxlas
         rsMSJ8RNBIPNxVC9Cbe/yu2zQzY4CAsxJmIrngmM8zhHCOl3rh1u9r1EOJGjRJYyil8A
         zo534nVWuTHkMsGKhRhI/xIBeTvnpFvaHtqYCWvyQvbx6Zh45ITcm//oQVK230W2tIe/
         sQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769120850; x=1769725650;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UklvachexUu0ZUTLfggsuMCR/kjk6daLXKn7WqUk/vU=;
        b=RqldkZ88jlYi9Vmv+g7ssJ5pkqqQTjJ7qzXso8XKIYBhwABLPZ72UianOwUquH7ZtM
         Lrxzi3aFOotJDXqUFssVEd3jAQRAl52Vh0br0YcgZXiIWPeUvQnSVLvdoW5n0pBuPr8p
         Vk4RPSkxYCJzrcpqhwAi+SKMeGWscGk5LLZ8Qbbn6GR7QKAfC2atQ4VxfNgCT0aXSceP
         hjNLoliDCtFOxF4t7f0ZRgcTs8zDJiW5CWjdrRykQhxNXJWMzL/q2DGyLsOQ7tfOMQpY
         yAO2p6W8A1X3oW+htl9UJfEaksJc3F6LJenlR0AX1e86RsRQGtp+vCmQ3wGdbyBVEOnH
         QzGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmho+EMCSe84uitAX6L/40RHY9WxKfHnkr/fETJy+44iUoS/QTU+CQfXUf14UnTbaTWuemh7NDtC9KV1jnCss=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx68vWnuVZlJyFzN8KsFoON6+170XTcSRvmsJfGlNNcCpXTLm/1
	yO1/QIy/ru25UVsmRcRiqOiooBjRnaHQGOjrDASXdhh1Xelc2m7WEM4n
X-Gm-Gg: AZuq6aJESz29briAwEX+DAIXsWJXndTBVyUZb86kR3H/1BY0VHEOE1VyDo8t+BpOuiu
	yc+4n9s+HEUtZ8NFoce1IRsI47VerMYv1UipoqpAOkFHFMhqi3726OSintvUH/og4/28+wcA/1i
	yy83WvJvJS9xu3fUz3XfzEwoFxrWcsZulbdzLogPxSlFNWDugpKNePFLt0ngsiFFSvFi0VWCmvO
	LLU1SfR9kyHRZtQKEliZp4fc6iWS3DTXlo3T38rNouHzNdP/5qldHcnZpuoQ6yj0/+wPCG5bvMt
	nORW6C1xnzLb1Qe/E+j2OJMXIQtKRsy134xzA+T71fsDMaM9dpw4KjMZjwjZbaZH2Y52cJXlqNb
	AUIJm9OEY1PmZFNnDykIOB0/klbB5xQMeIbNOK0aVCL/83sOvVLkLG6RRV99chYyV4DGBCJvHny
	eyPz2jtrA=
X-Received: by 2002:a05:6102:508e:b0:5ef:7221:aaa1 with SMTP id ada2fe7eead31-5f54bc6f7bcmr368453137.27.1769120849596;
        Thu, 22 Jan 2026 14:27:29 -0800 (PST)
Received: from localhost ([2800:bf0:4580:3149:c903:2904:3cc3:8b4c])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9482e37e7acsm100671241.13.2026.01.22.14.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 14:27:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 17:27:26 -0500
Message-Id: <DFVH012QRDMJ.Y86WT9BEWQ3R@gmail.com>
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
Subject: Re: [PATCH v5 0/7] iio: core: Introduce cleanup.h support for mode
 locks
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260120-lock-impr-v5-0-d4d22347041f@gmail.com>
 <20260122191648.2c10cdf6@jic23-huawei>
In-Reply-To: <20260122191648.2c10cdf6@jic23-huawei>

On Thu Jan 22, 2026 at 2:16 PM -05, Jonathan Cameron wrote:
> On Tue, 20 Jan 2026 01:20:40 -0500
> Kurt Borja <kuurtb@gmail.com> wrote:
>
>> Hi,
>>=20
>> In a recent driver review discussion [1], Andy Shevchenko suggested we
>> add cleanup.h support for the lock API:
>>=20
>> 	iio_device_claim_{direct,buffer_mode}().
>>=20
>> Which would allow some nice code simplification in many places. Some
>> examples are given as patches, but the last two are the biggest
>> differences.
>>=20
>> In this version I dropped the RFC tag, as the general feeling is to go
>> through with this after some modifications. Main one is the addition of
>> IIO_DEV_ACQUIRE_{BUFFER,CLAIM}_MODE() wrappers to avoid drivers using
>> the guard classes directly. I also added comments on the forbidden ways
>> to use this API but I definitely still take suggestions on this.
>>=20
>> For now I dropped iio_device_claim_buffer_mode() rename, as this point
>> is still being discussed. My suggestion based on the RFC discussion is
>> to do it, but in a separate patch (using coccinelle) and while we're at
>> it rename the whole API like this:
>>=20
>> 	iio_dev_mode_lock()
>> 	iio_dev_mode_direct_trylock()
>> 	iio_dev_mode_buffer_trylock()
>> 	iio_dev_mode_unlock()
>>=20
>> Let me know what you think and thanks for taking a look!
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> I've queued this up. For now it'll just be pushed out on the testing bran=
ch.
> Hopefully the new noise from sparse won't bother anyone too much.
>
> Jonathan

Thank you for all the feedback!

I'll try to keep an eye on the lists in case of automatic reports.

--=20
Thanks,
 ~ Kurt
