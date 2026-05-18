Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B1E47DD40
	for <chrome-platform@lists.linux.dev>; Mon, 18 May 2026 14:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114893; cv=none; b=BtaRMukTA4MjsTMxAjJg43RkTq0vOh4cPBzCkHJDGvb2F5kyC4R601dsfhkYX3CAM5YBfJ1/Ko3iXOrfXSQhORuKdiE5C+3TWgDiQikTlePux3Jg/sLHDvWYel5YCLu7BUlZ1mA1iOitslDz3j2ZkQcHFb4lkFt5oJ/AyTzansc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114893; c=relaxed/simple;
	bh=RHou1NZeZQJ2nBNPN4Aw2D1HXZfghIJsey4jXHsv5xk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pYNhDq7/Cmmv0b2xXBa74lmj24nwIdWhxMNfp0/S4c0YTsfck9H9OpMBk05Ui4IQQokEx+gapReoD1kkRW5tBdN29UVcNTx2zhFNPxGouZ+T5gp/g2WB3p1ef0rJje+N8xCZlyI65tUhG83pgIIIy33h8XIZNGw4wYQkmgxTSX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HuMUGfQY; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HuMUGfQY"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-688a8e5fe5eso1274631eaf.1
        for <chrome-platform@lists.linux.dev>; Mon, 18 May 2026 07:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779114890; x=1779719690; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R76EEUUYziDn4rTNwghYF5TGd9QqSpO9um+ZkcmBhtY=;
        b=HuMUGfQYfCXAFExRqFwHovKYoB/1R+477cscx7Pa4DdV64rqrwIihOuJK04bxYUPFX
         XrmCK23a1NyoRH70C5keOz4trJDM3qfdYOGzvQ19YgJGI62SMX+B6ZPNw/zxFlS04QM3
         NlEHqv18AB1DRrAro8adogwLOD7Sas+blREw9izAMVx63HiRjy3w47KgqriSrNJU/Ffs
         ONIEO+aBgGoVfJmK/YVSx+wsHnhtgJAcSRwNsR0H0MK1JvK8UIgDFJqQIpuz22lhSXfH
         QpC4rCtmIxdl0e7NDludUbM4NXuykerXFHpit972a/923t/IVLSymNsWOMIVmO6Fa4n8
         CqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114890; x=1779719690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R76EEUUYziDn4rTNwghYF5TGd9QqSpO9um+ZkcmBhtY=;
        b=imxzEof6ayGDKZD3TpSMIrOXoS9k3Wl0gscVt27upPer2SS+2iLPKk3XdfoXwx1ZRq
         Eg6I3hgjI1IgO9YxQCSolT2K1zzOWkPbgRP7XsUlHkwaKnbMiTR/aD6mCezdLOS6jiGP
         nyu1sUY9yjbuUJPwlK5P4HtH7O4CLRdmPi6IRPmKgLZtcvYktgx92VU8le+a6EXwIsKx
         ghbV6fjMy+wZUzcsJlysijPYUna/BsWsSndzMMKKH7M4EdKmgEQzkVz7hZhFoB/grSms
         m9WrEeijvsh6RoT3a7q95fBFE8rU6/PHxTuaw8hNo+b6IkbODYxSkbrlVfkY9vWS4h2G
         eQNA==
X-Forwarded-Encrypted: i=1; AFNElJ+El7q+P4GjZdyJP6tvTl3UsmU3wskOBrut2E5Pbolzs8Lv9rFzYyMYR9qQvJXWqepIhpJIySVv4dzJXRfaDFw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZqbbIAAZxvC6qA+zGFTHuQeZOnM+83kKtGDRE/IZ1aGYD+ocm
	xeMmCRDdHpWWWrtctHQFmoVX6uuTBzG6Yk7GLraPS7ag6PO6MX2QAuasGduTEkE1bC0=
X-Gm-Gg: Acq92OG9PVgO4U9KGOgfDfnoGAk9qRonrM+0zv4M2ozg4mOZ+YPizDtDLG/VaGmS3tv
	AYa0jM7y/C2nFisw1WyzEyE1FAXWW3B35lxDxF5fejlIUw95e7Kf70xu1xJe94cMPEAiOHaM0rY
	2ztMmY+4VIqdHX4DiuZCamCO6rORyRSOg+tkxtyF6510FLLLf4LXZzm3HssX2KadNogMEgInRF2
	cD0Nl74+E5wYiYpE0yWbnlvv7emYXnkMDMs5zwO8sMz/4eUX6spXdsiqWoOxXNtcFHDB3WHQnoC
	WhqwP1zP3QiihvUJGSqprP3x3H6RcQcfWMpI/FQt5bj26UmQ0IKznjpgc6goUcmNOGMql7nUSI+
	bve3sgXWFfCIEY55Sv/237rjYlPhUWrxhilaFmlAzYi4Yhi1iRtD5n598D1Es8y0iGt7hSkLSZx
	CNDAudlSSLE6E1HrE92s2CA45J6ti7mg7guoIiY9hfkoZBjGC19gGqgBJxjvRo7taCf4WOluFUL
	A==
X-Received: by 2002:a05:6820:1746:b0:688:2480:7fa8 with SMTP id 006d021491bc7-69c942dac4dmr10442247eaf.21.1779114890563;
        Mon, 18 May 2026 07:34:50 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3be6:1187:fed4:378b? ([2600:8803:e7e4:500:3be6:1187:fed4:378b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69d049384f6sm5675126eaf.14.2026.05.18.07.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 07:34:50 -0700 (PDT)
Message-ID: <41c0317d-2ce8-412c-818a-4a84201fce29@baylibre.com>
Date: Mon, 18 May 2026 09:34:48 -0500
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] iio: timestamp declaration cleanup
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev
References: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
 <agq7PPw0qupI_8Dh@ashevche-desk.local> <agq8Q1wpzIw4XhNQ@ashevche-desk.local>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <agq8Q1wpzIw4XhNQ@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/18/26 2:14 AM, Andy Shevchenko wrote:
> On Mon, May 18, 2026 at 10:09:48AM +0300, Andy Shevchenko wrote:
>> On Sun, May 17, 2026 at 01:17:17PM -0500, David Lechner wrote:
>>> While looking around the code, I noticed that there are a lot of places
>>> were we are manually filling all of the fields of an IIO timestamp.
>>>
>>> This is error-prone (as seen in the first patch) and more verbose than
>>> it needs to be.
>>>
>>> I went with the approach of using the existing IIO_CHAN_SOFT_TIMESTAMP()
>>> macro for doing a struct assignment. This does require a cast, which
>>
>> No, it's *not* a cast. It's a compound literal. And instead of doing this in
>> every driver, add it to the macro (in a separate patch). Oh, let me just cook
>> it for you (I added that to several cases in the past).
> 
> 20260518071349.469748-1-andriy.shevchenko@linux.intel.com

Nice, thanks. I agree this will be the cleanest solution.

> 
>>> makes it a bit more verbose, but we were already doing that in to
>>> drivers, so I went with it anyway.
>>
>>> If we want to consider alternatives, we could make a iio helper function
>>> or macro like the first and second patches did.
> 

