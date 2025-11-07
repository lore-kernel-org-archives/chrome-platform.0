Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDC430DEA0
	for <chrome-platform@lists.linux.dev>; Fri,  7 Nov 2025 21:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762550051; cv=none; b=Hx0395cDJ1H+AuLGflWfFjZD5dbCYZUL1WouMf5i0qVtNRLMDjxe4filft57HHZWtxsitMXL4ib1LTWOBlujlb2HXdrEZo07s+bJSnvCCHMNaC74kdnM7GEnM+cE5tzDYsKJVf+L59UR5IoCbNrYgr0iv9RC7QmdnDkP8odCwbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762550051; c=relaxed/simple;
	bh=UV51qyXzYtxwGuB0zES4FqkBW93FAxvKUjuQF+mTpr0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=nV1AMCf0Ej2zf/hI9PHqgzOfZF+qyN9RPo67rKHg02R1f4dFSvCOBJYY4IvzQ1dBSjuhlTiZa8roUhLQVlAej/tZGpwQBiJQm6Kl4JgTD19d5BriznhJSQ2FuOIuwmChmzOAuTUo18amXSTyMYRBEfQUWQ5O88H0jcrfLtiyfuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=C7nFsp6t; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="C7nFsp6t"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4501e8152d7so235724b6e.2
        for <chrome-platform@lists.linux.dev>; Fri, 07 Nov 2025 13:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762550048; x=1763154848; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vo2b5stOOMkheFTgFZGlOEGzsHrk4gEITKRM/xPVOlg=;
        b=C7nFsp6tMc+mePWo+HTXN3CFaO//pnMt5ox2Plcfp685AP0czSX4K0GckrZkbtJ6uO
         HeRquR81N1Jb+Xs9GQ42FF/4tQPlZH4+n1BpjIPwM80foDFHoBQJEd/xcfR93T52Jr1o
         WfQp15rU0vMtViZsiso/vgZ0zgrH/yTd0oYtPKYVqAm8BhbzlkKqwu/WjDBwN/Z8Umww
         Bl2uSIJptjqdsKrKCB4UkR1rToNeTWlyrZG2CPZybkEeHCxyR2Ww+vhdMKJ+3noSSvmK
         d4TXwwQaebh+WRuFy9AE7ZAh4w0kRWgE6QQL5mP2i8Neni9ocTw5rEEwizk+L6gz5Jd5
         3iHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762550048; x=1763154848;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vo2b5stOOMkheFTgFZGlOEGzsHrk4gEITKRM/xPVOlg=;
        b=HZ14c5jKr5nS7CrLnq1kdxJHGl3FbgbhTX9VpMB+j4Jftk8uWSoDn2UB+nUDFn85UA
         nP4b0hmZpMvjmm4q2CdgNvnQhCKQQrRcFBmzofb8PKMSS/Jc8cvwym63t3fwwZB21nec
         y7slQfNZnGcUmxvjntFz4bk39ipkE/ylvVK/kVXw+nHZygNI/zyxNIjR94QrPstkolam
         eF+ufla4IiAIOeLv8waqwYjybUTHn2Q3YdvTgv9QHrkgcuORhbO2Kd7ZXWjbPTLMYqvw
         AdPaMwaCwCV2IzVA5tcFRjYMKYgXyIVuqkiox68skUi4UCnbJhSm0ox7a/qQ97kksfWP
         wZmA==
X-Forwarded-Encrypted: i=1; AJvYcCVruiz5tKg+HRMttO3JqXcqpn7qL1caW2pxz9Qd76vKGDHMvp8rNVHG76I75zcR2ZXTJZAhGEOmKErFQ8SuCcY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1OAwEhMhhrbeLwDXrzdd6QzMiDpIOXu+Ouj1oT2tW/NlNLaAW
	t1I6o2gK/Rp/3HVvCUj7AZv8a8fp0VCTwx8gO8frnOvgfUqfF8+Z9Pkwz1pcKpirRt8=
X-Gm-Gg: ASbGncsBNnaJ9dZdlqbQ228p9u8Rvj4fRbZWAnElJSUCottRELn/4utSQUtHWZn14PG
	rnnxv8vKN9jo2s8rs4ySpd3ikOBXt+rJp4HsgviKPU/l/moLAksGJtXHZJMRftb+AhIZCQcm0Vh
	g3vsIx9z4BBFPl4uGhpZhbsrHIxBR9l5Ty/UhS8USsWQyvsk/kfJmxf5/U1vQBx7orVHUeUZZcX
	/Tchvgv5Lf5mLB3kf3zDfsj7YMXP/JzNzWLlcPENWss8jCl+KQqWrm3yCG36Z62OyN2zjk3chpC
	D/KIea1LD0S2MLA6TZVzHMWGiTiPIRYwdQqqEJz/wR8B5fnf9qjhzuxrqPZLPbvTSjq5JnE2xih
	LifIvBtu2YU89+5H7uAKBwN5CNTkt59yPHluQPnQWzJjeExWpptjHggHJuS7O72sbOsb8Sxn5hW
	5obhlJT9wOee5lSd3GcDhuRo+m0w75AYi47RqGJBpVMX/+vYteGaJ8CYRpQaAN4FosDZ01fHE=
X-Google-Smtp-Source: AGHT+IH58JNXTTmu6lPkALuS59F00c00c+agrganN7d8UEB0Nzs1Gj/HxCtytEXComYXlhKlM//Npw==
X-Received: by 2002:a05:6808:80c6:b0:44d:aa05:ce74 with SMTP id 5614622812f47-4502a1be72amr387091b6e.19.1762550047721;
        Fri, 07 Nov 2025 13:14:07 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:7bb8:950b:327d:4ba4? ([2600:8803:e7e4:500:7bb8:950b:327d:4ba4])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-450027f640esm2781467b6e.23.2025.11.07.13.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 13:14:06 -0800 (PST)
Message-ID: <45bf8a0c-0491-4356-ad54-79c25079ad19@baylibre.com>
Date: Fri, 7 Nov 2025 15:14:04 -0600
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v2_2/6=5D_units=3A_Add_32-_and_64-bit_sign?=
 =?UTF-8?Q?ed_values_of_=CF=80?=
From: David Lechner <dlechner@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-iio@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
References: <20251107201005.3156118-1-andriy.shevchenko@linux.intel.com>
 <20251107201005.3156118-3-andriy.shevchenko@linux.intel.com>
 <fb4aafc1-dbfb-4533-b368-5d26e24acdf1@baylibre.com>
Content-Language: en-US
In-Reply-To: <fb4aafc1-dbfb-4533-b368-5d26e24acdf1@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/7/25 3:09 PM, David Lechner wrote:
> On 11/7/25 2:03 PM, Andy Shevchenko wrote:
>> There are a few drivers that want to have these values, and
>> one more known to come soon. Let's define the values for them.
>>
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> ---
>>  include/linux/units.h | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/include/linux/units.h b/include/linux/units.h
>> index f626e212d4ca..5b3293bce04c 100644
>> --- a/include/linux/units.h
>> +++ b/include/linux/units.h
>> @@ -21,6 +21,12 @@
>>  #define PICO	1000000000000ULL
>>  #define FEMTO	1000000000000000ULL
>>  
>> +/* Value of π * 10⁸ (fits s32 or signed int) */
>> +#define PI	314159265
> 
> It isn't clear to me at all in the other patches that e.g.
> DIV_ROUND_UP(PI, 1000) would be π ✕ 10⁴ (rounded to nearest

Typo. Should be DIV_ROUND_UP(PI, 10000) or  DIV_ROUND_UP(PI, 10 * KILO).

> integer, of course).
> 
> Calling these PI_E8 and PI_E18 or PI_x10_8 and PI_x10_18
> would help to clear that up.
> 
>> +
>> +/* Value of π * 10¹⁸ (fits s64 or signed long long) */
>> +#define PI_LL	3141592653589793238LL
>> +
>>  /* Hz based multipliers */
>>  #define NANOHZ_PER_HZ		1000000000UL
>>  #define MICROHZ_PER_HZ		1000000UL
> 

