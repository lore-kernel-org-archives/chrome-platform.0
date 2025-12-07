Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEBC242D95
	for <chrome-platform@lists.linux.dev>; Sun,  7 Dec 2025 15:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765123195; cv=none; b=UdPfihwEmghpPdS8njZvw1hiOfHD8emK8Gz34xgjx8iornP47IodRqaS1ZRMkg9D2RSMsjiVRVAxznhAWiIYB4Sqo0Z+yEIDwhYjgh6CKhpZyTA0tclvP2lra78TS0ulScYa37gdkRojmE9RqrSm7NrIcH4fe3WV9izvb0fEwNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765123195; c=relaxed/simple;
	bh=lN2nyMT5KURr5BnJaibgIHzRgf7UPdc+YsOVRYAzzEs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=s+8D6bY9IJU2z11S2Wjwgr82ypgU60haJYCAp/m9qUHXpVbAuP+19W7KsE8/YypIy33HYEeDDaVGOZL7xqmwvw/6IV4vDTGSCxcomEIGUXwEpn3eneKh/excOGWJxuvJ8x3v5EkPGz+2T8CY4C5b77VsiEX8cxNgYTPkmQhEptM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQUDhSPp; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQUDhSPp"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-55b09d690dcso1359502e0c.1
        for <chrome-platform@lists.linux.dev>; Sun, 07 Dec 2025 07:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765123193; x=1765727993; darn=lists.linux.dev;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lN2nyMT5KURr5BnJaibgIHzRgf7UPdc+YsOVRYAzzEs=;
        b=ZQUDhSPplF/s1YXhZDRJ9a0zrB4TvzoP2InoSpB0hgkUCFaEWlZV5mnVfjz7aYwqxG
         7+26NFqDWQu1nYJYRZglalE2Fd0bv/9LmxzQQ64QO+OBEX6bo1qKqC2snQhIj6A/ZmF2
         xLN6Ez49pp5CDkM+mvrx//TlOfZZz2f+k4tXDYLl5UXA+qlAMVJZvVwrSWsm4AiLuChF
         H4Ipk9AmuZqWYJURRHM5FNvJ7osYk/aDgIhTyZCO/7n15kfWge7wo/jwxsUWOZHtoXKu
         S1VCFrOOzOV7qOVBivkmpSOJj7XBHhIFNER0qEyp3eTuQqzhT/FLP83VdLJsyvy0HJO8
         0FLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765123193; x=1765727993;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lN2nyMT5KURr5BnJaibgIHzRgf7UPdc+YsOVRYAzzEs=;
        b=czH6p517WvW4LXsIj16sNihaO6Mb3lGEaeShfMk4Zkb0lZbzh6tg5XULtrB1FS24Uc
         rTuKgNXqIyy7E4x2Tx/ZhsmCQ3hQpLbIDMmi/ZGQDF+oTZ+NXFxlyK3m+BKJZ+ovcC/D
         KqeIOKUTKLxVWcMZUzDXqEwE68ZN9zLeMUoJUQPy7MDefon0WNJcOf2eCGAOSdDY6UzQ
         sapmgJUvCWiQpiQqF089u1kRo3yYuiydhNAlRk2PYQFgDALuCEBDfD9ZsZ2UAPlk5jy6
         M+A1MYXWG7+6+EnK03CfKfdGbaUQv7OnIcQi/flC10Pzy0oO80avzmJlDtyv21bhYCw7
         UxDw==
X-Forwarded-Encrypted: i=1; AJvYcCVL69/0ZuNRhErXpXpFHOvzAD+u6+5Qf8fgUOKAfDAGvOEUusKBa6i6bi5bhIBLFJ+FE5eaQ1sGYNrgBKswCGo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzigm7MtdHo9ec6e2hPsYzl4j8YNw3PkZ7fE9Bqo9/QsmxObyO/
	XQwuGPrMJicM0wekMA3fcXt18IoByl1WGwi3x3pgoldn0rGFNXWOnZM4
X-Gm-Gg: ASbGncuyST+BIv8mSSU2WFwhnwOHM6wvFmZyr1/Gm9uDLPKWBv5RhyriFRePGJxd7uq
	4s1rh3NgEeAbpdiD6s3xM+Mtkz6oOQ5v1I1v4pk4e1FoIs8JVYahlubzV4Ffx+VzSR8DVvqy9LJ
	DVAEFWLu8t+pYeMkkPfqFs7rYkF24bCXB40gs1zndsfzHTKM5ct4q9ZbEmaWzKU36imYH/UXJBL
	NfTvrIHp9FIhjiotiwjvxtqHMhmEqjJjcRKB+EWPoTIX/q9+6Ndvc7AZ+Wn1aMbI7vv0NEZRAqF
	TO3n+DfLjICy0Kuu7GoLr/r1yDPCKdRQoQO+9t/p7ntIQ/Nwwnl7OteL1ahmsPmx6HmWei+7Zsz
	uPKIN3Px+h9bfoHlfu/mTvCi61E2kScJHVl/S2DResUMIlZn5ITNNKvf6yniCkmiw7uaz8LaBPE
	OA2xI=
X-Google-Smtp-Source: AGHT+IHb5qCj47GPIJks5IrPfFovkp1AcVzoXUqVEm5uXUvz/i0JGsqz6kwhm3CHmygeESKzo+fSKw==
X-Received: by 2002:a05:6122:330a:b0:554:b32c:6f76 with SMTP id 71dfb90a1353d-55e846e664dmr1336197e0c.15.1765123192735;
        Sun, 07 Dec 2025 07:59:52 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55e6c568ae2sm4895821e0c.5.2025.12.07.07.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 07:59:52 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 07 Dec 2025 10:59:50 -0500
Message-Id: <DES3Y754XVT8.1KUU58F8LQUHA@gmail.com>
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
Subject: Re: [PATCH RFC 3/6] iio: core: Add cleanup.h support for
 iio_device_claim_*()
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "Kurt Borja" <kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com>
 <20251203-lock-impr-v1-3-b4a1fd639423@gmail.com>
 <20251206182057.40402e66@jic23-huawei>
In-Reply-To: <20251206182057.40402e66@jic23-huawei>

On Sat Dec 6, 2025 at 1:20 PM -05, Jonathan Cameron wrote:
> On Wed, 03 Dec 2025 14:18:17 -0500
> Kurt Borja <kuurtb@gmail.com> wrote:
>
>> Add guard() and ACQUIRE() support for iio_device_claim_*() lock.
>>=20
>> This involves exporting iio_device_{claim, release}() wrappers to define
>> a general GUARD class, and then defining the _direct and _buffer
>> conditional ones.
>>=20
>> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>
> I'd like some documentation (alongside the DEFINE_GUARD() stuff)
> - particularly warn people that using the non conditional variant
> is very much the unusual one.
>
> Perhaps add examples of usage for the other two and ignore that one
> on basis alarm bells will ring whenever we see it in code.

Sure! I'll add it.

>
> Jonathan

--=20
 ~ Kurt

