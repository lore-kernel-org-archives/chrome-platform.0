Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC37242D6C
	for <chrome-platform@lists.linux.dev>; Sun,  7 Dec 2025 15:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765123182; cv=none; b=uOz7G5rlXObhuMc40EBA2Se4zZ/b78PBoPYSIErFqzhfh4KPHHK1GPZauWrQbnRexYlf9/03edYU1NUbP5vXV66JXibSgEg/LJBIjK/dP5jsyDMcr29hcYmLySBcfV3x6wRMLHW/7txPT2f+/kwAuZuvzTf3q3NmaZpPLGpCY7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765123182; c=relaxed/simple;
	bh=yyNUlROQCvKp4HOi2SP71/oqKu0yWaC+JHckQnMu9DQ=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:Mime-Version:
	 References:In-Reply-To; b=C0Y6CP2MQA3rHU9LEq10LULF58prIsy8uo34tc66z9pTcaMkeT2V9kHr9J3aV9QrWPgfKTz/oI6MN0+6SbMif/8SEbMkQMECeAJZ9VDzy4yL+5xmxJBxDbnNByax/PTt2nGVeZjuUCPZGJ0WVjxc+xmC3vj4AHTTT/WHWbwg/l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIT6HEYn; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIT6HEYn"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-55b09d690dcso1359453e0c.1
        for <chrome-platform@lists.linux.dev>; Sun, 07 Dec 2025 07:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765123180; x=1765727980; darn=lists.linux.dev;
        h=in-reply-to:references:content-transfer-encoding:mime-version
         :subject:cc:to:from:message-id:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1tqJEH0nvtzunebE0gFQ9Z6ukbX9uGV2B9981sp0bk=;
        b=hIT6HEYnJeutgsDPkf7vTh1CqOVzqSCaNTf9uzS+PFeLTXpmF6Jz6bUDV9OSZ7gdPj
         pwERY3ObnJ7gtgffboirhawsc2gDyIO7KamzJjn+iPyE9Rc57rFo2mg35HGSzkBIQkjQ
         KDbOcRpbcUQMAqsjMZ//C7pwS+z2yEz1twcXXGCAQMdmXACts8B+H7hOHwKpSJmbqifm
         WE4JcKadzoPis1BxEsI8q3qj3JjfB9ZRI00gA1QiEWrnUi8B/O+MC+oq00P0zdeUFZqF
         Ft+ujz1TXr1U7s6SlE3Q4Yz7RjIKFOLc2oA7aE8H+DiQNW1aYRaf2uKLgc6yrfHc18xC
         ngLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765123180; x=1765727980;
        h=in-reply-to:references:content-transfer-encoding:mime-version
         :subject:cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h1tqJEH0nvtzunebE0gFQ9Z6ukbX9uGV2B9981sp0bk=;
        b=jKyEp+BAbn1NVpcpUm5YEqStJn0TKBwp8hWkKkWu1KrgwJn6zP0veEXsQifnpOs0BH
         Ov71qSLHkEakElwX/AP6tAcpFvUTFJuFUl2lxZsDoxkov3aVxqMYM7vOkXUGWyMNYWG7
         Pp9IE2jui4/m2QL000NTrF0du2M78+5U4g0Q5QwuFYGN/vxi64batiTHLbEGE8TutCJO
         zukNgXGzb9RZ7N3T0yJd8AwZbq/UeyYq31IwmOSG7oqqFNf2cpu9wUddQ4nTHDxubk96
         xFwO9O1xCnqO7RaqsD61neUZvRHShliJOWWFZHIugPq+6Vw0fdPLU0UpRFos4P7g1Muk
         5IZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEHExeFRGdOTDWDEnRKRxvynaeOTuB6liaLXU/omZeVS0JFr0nyi/qEZkXBRoxq7PoMXqCZv3XngIsvlb5A8w=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJ3KqTIPEgAH/nyYy2jdE0fl9tb/SG6pnXJSNfR6O7bASSEcqC
	KIirGhq5UliFywR2QZ24oGHInJjOLKT3u8E2V0QICWj5ytuHRT0PZ3Ym
X-Gm-Gg: ASbGncte7Dg+mI5lVaYG9tn010FnEkiKwz/tPqAH8sma8JW27ZE84I7XUjBhJZJA7Hu
	PdjEATLTS+EUPhMX4pVUDZNa3amtuKSd51mGwqyG15e2uyXWSBT3Ig3pR1ePkgAXZ2lqK90FOoJ
	XtQ6cKHzmQiSTu3AcZxzFAUmcvv3KIE2fl2qjwpr/1/3sZtxOogSnM9GyO+x+RBRfUy79CH++1z
	46crQoh0Wsjsn0ryQH+ovTx2Eysjn7aN3e6vBF27NbrP1an6K4beCbMY9MKpJBDSw2Mwgtc2x2Q
	/I9b4SNZmheAKAE61jICmXjgwQV6u64MZ+37Q4EMJzJ/NXmmjPk/28cx/Cpuhc5ewoZ+IG7JrZW
	gch0iCFmwGiPKvRt6rku5YeJs40+6HvDaidViES0LNZbf+KVw5Lt3y1RzxV1j+4R4+N3O9EdLAB
	ZoKRc=
X-Google-Smtp-Source: AGHT+IH3R7zodvMeVJJJJ7fn2S6JQ+o/S6MOmjVgK3nMnTwxe+33R4LGyRZImJUof8loaB4NiZRB9Q==
X-Received: by 2002:a05:6122:6598:b0:55b:d85:5073 with SMTP id 71dfb90a1353d-55e84587aeamr1556249e0c.4.1765123180107;
        Sun, 07 Dec 2025 07:59:40 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55e6c972414sm4860987e0c.15.2025.12.07.07.59.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 07:59:39 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 07 Dec 2025 10:59:37 -0500
Message-Id: <DES3Y1DXTLGR.38DNWI7NC291D@gmail.com>
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "Kurt Borja" <kuurtb@gmail.com>
Cc: "David Lechner" <dlechner@baylibre.com>, "Andy Shevchenko"
 <andriy.shevchenko@intel.com>, "Lars-Peter Clausen" <lars@metafoo.de>,
 "Michael Hennerich" <Michael.Hennerich@analog.com>, "Benson Leung"
 <bleung@chromium.org>, "Antoniu Miclaus" <antoniu.miclaus@analog.com>,
 "Gwendal Grignou" <gwendal@chromium.org>, "Shrikant Raskar"
 <raskar.shree97@gmail.com>, "Per-Daniel Olsson"
 <perdaniel.olsson@axis.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Guenter Roeck" <groeck@chromium.org>,
 "Jonathan Cameron" <Jonathan.Cameron@huawei.com>,
 <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <chrome-platform@lists.linux.dev>
Subject: Re: [PATCH RFC 5/6] iio: health: max30102: Use cleanup.h for IIO
 locks
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com>
 <20251203-lock-impr-v1-5-b4a1fd639423@gmail.com>
 <f96694db-2ad5-46d3-a380-cba3eaa2de2f@baylibre.com>
 <DEPLIJFBZQ36.20XX5DCMCJVB3@gmail.com>
 <c9efd563-9d52-4761-a5f1-be0df0222dff@baylibre.com>
 <DEPMCPWLO4FO.2B2OXMF2CZ1G@gmail.com> <20251206181758.2bfefde1@jic23-huawei>
In-Reply-To: <20251206181758.2bfefde1@jic23-huawei>

On Sat Dec 6, 2025 at 1:17 PM -05, Jonathan Cameron wrote:
> On Thu, 04 Dec 2025 12:47:08 -0500
> "Kurt Borja" <kuurtb@gmail.com> wrote:
>
>> On Thu Dec 4, 2025 at 12:35 PM -05, David Lechner wrote:
>> > On 12/4/25 11:07 AM, Kurt Borja wrote: =20
>> >> On Wed Dec 3, 2025 at 4:52 PM -05, David Lechner wrote: =20
>> >>> On 12/3/25 1:18 PM, Kurt Borja wrote: =20
>> >
>> > ...
>> > =20
>> >>> I would write the whole function like this:
>> >>>
>> >>> static int max30102_read_raw(struct iio_dev *indio_dev,
>> >>> 			     struct iio_chan_spec const *chan,
>> >>> 			     int *val, int *val2, long mask)
>> >>> {
>> >>> 	struct max30102_data *data =3D iio_priv(indio_dev);
>> >>> 	int ret;
>> >>>
>> >>> 	switch (mask) {
>> >>> 	case IIO_CHAN_INFO_RAW: {
>> >>> 		/*
>> >>> 		 * Temperature reading can only be acquired when not in
>> >>> 		 * shutdown; leave shutdown briefly when buffer not running
>> >>> 		 */
>> >>> 		guard(iio_device_claim)(indio_dev); =20
>> >>=20
>> >> AFAIK you can't guard() inside switch-case blocks. I don't know the
>> >> exact reason, but it has to be scoped_guard(). =20
>> >
>> > You can. You just need the braces like I showed in my suggestion.
>> >
>> > The reason is that guard() is declaring local variables and some
>> > compilers like LLVM don't like declaring local variables in a
>> > switch case. By adding the { } scope, the variables are limited
>> > to that scope and the issue goes away. =20
>>=20
>> Ah - You're right. I dind't see the braces.
>>=20
>> Now it is overly complicated. In this case I see why guard() isn't
>> really an improvement.
>
> This bit of guard() usage is fairly well known and I think people are
> getting familiar with it.
>
> So I'd prefer the form David suggested. It is nice to get rid
> of the mode claiming dance in here.

Ok, that's good to hear. I'll take David's suggestions for the next
version.

>
> Jonathan


--=20
 ~ Kurt

