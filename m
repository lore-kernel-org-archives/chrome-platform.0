Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8724A30DD37
	for <chrome-platform@lists.linux.dev>; Fri,  7 Nov 2025 21:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762549805; cv=none; b=PN4U1Maxb+CBVm1RSQCYtjEOnuW1xvSrWN9iIXEWTePUtIg8Lvyd5ujLNuLHVkRoxsG8xqMCpsRUqeBLG1YIFtcdxrb8ZA9wQC3Bs0kwywjUOgrBNz8DGyaCrQepV3EPSq/F9YbZF4LfaxiCmOo4AntwGsBHpB/1NG6u5QpSVAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762549805; c=relaxed/simple;
	bh=zIMMhU08e0AhUMrxZVFeK23QuEqKtkjM3A1gejF0Vds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QgEDxSIWp4UDl1SDqaRs13gF9DfQpil7S8yAozgpmlOwkAnu2XGNjcmNJT1J690x0ijeIAKRktAwS47AVboh8UxiOJPLBG5WorXKINIRK6piyvIPUb0p4YP8+5Q9OS811LM23P6WnArRh08FpudLl3tFtjdar22wGoXHSfmrwE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hb9t614y; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hb9t614y"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-3c97813e788so720239fac.0
        for <chrome-platform@lists.linux.dev>; Fri, 07 Nov 2025 13:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762549800; x=1763154600; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D5C+80SdGLi7QO5N0XFDPLF3yCCePwCkQlTQxlk0Flw=;
        b=hb9t614ywtaMUCfPyTwpZ/bTkQKXvn6iFJ0aJTDAVs/o/KKIrZvo2PzllJu5zxcNz/
         tCBdPzjbw+rIcp0AHOKaJHaVzHOyAGw0jblHrWbf7w2RDh9R/2rIYQ77cr77iZRs+NBR
         aowjRsyc+o6vQR0kCNd4V8b7HZKp06qzI9IVUMG7AOPx1JwC6dI2liiMeilkkUVT3cVp
         /bTPB1RXlPNMeNRW2m+BQ9OMNUz7IUfWEjF/utuN9D/ri1LKJMuH5NCw+z6TfOIzsI42
         uNiXgVcuxnr0dCwJoFStflO5JzAgmC4GnETApD17Dx1CMHATZgotUUJUlYDs0dG9u96A
         JVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762549800; x=1763154600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D5C+80SdGLi7QO5N0XFDPLF3yCCePwCkQlTQxlk0Flw=;
        b=i5msCY34MemJvk7OmeNdOnU3FK2C0TQJ1Yt6wYd75sXqHoklQBQyUpGL6s2OBDRGdj
         5wkxCt8qf5L9Zuo1F3+bpgq2czA0ByazsP/duDt47rH7kmocMhR+r9j3vMQrzou44DAm
         GC+wn8RB8/wpgRqzik+TQpNjxZxSDFRVbWktb4wSObXuum8BzjnAFABVfm6cAnaNJFtJ
         1FBIj20iruSJPP8uy5MM7LaC8Vo9YzdQhyKTSfBzwxMEMZqMqJztN0XweKZAtMMnOFxe
         eYmhbiQLT8gRQs2v3oS3sLiEddk49eDSp+BSyan0PeX48FH70EpaEvDhg9LjTZt+8Ovv
         M6Rw==
X-Forwarded-Encrypted: i=1; AJvYcCV4DrDIDq1tWL/UXAWJjfhRHWGt7Vk9ddFwGAnnW2VniuXthqqtJMj3GygHUJzjNitm07woDAO2PjXWUnEdWfw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPtRtaa2RijLKnVkQPpGUU1auGDekgWRalqjwzX3fhvW4g8mnd
	fFCjlgz57PmEhuln13ki0tUgG3sR+qkvEh7K8K65zSF+ghA3xSCacWAElXy/lWhSm8Y=
X-Gm-Gg: ASbGncvJV/QbqmxctjtnoQNkgX/gJUTbF3iF4gWHHOfrXuYKdFOcuLDP4Tn3SST9Y/v
	xw43cvfRyk5MOHG7RcX047s67anpIxpAyJAJMChGzpoquEN8b+3pJipchWWxsQh3MdD3OdnibAN
	n30v1zfp88mTKRUe5OPyRqnKLNA6hqZfFzEQdN/ZB2eLehz9IIZSNqg309eWEdW5fxLLhZrPxYl
	GsfOfU+pvgcdQNfWtOLRp4tcDNRg50fTziJT4dRF4CaEAplqbPlF4geJjdobIdm73n/3ZiIH03k
	Or1ibGdGJ7wm+Vetzi/UxFccmxyVQol0VOq/YMDyW6tHQm3JEaRT4EUzSQ9eK3ns73MV8NUHh0d
	POt528HBalhfbfyjvLJpzMSsAGlC6Q07U9ryZVa+JDdnltZudrhIjupEwPEAMHkmhMCsI1oEz2w
	iRAvvvK9lTtZFlC60+eCGpDVw2RgDciv/sbxLRdY5K0QEYlWkO8/pr382pj2bf
X-Google-Smtp-Source: AGHT+IEQ9ejL+2ENcC9XsVRhLImuzZ+9b4tsXdGn2sN6c46sz5ZWDsXEvMKwQS2aRvyWRPmKUjbTWA==
X-Received: by 2002:a05:6871:28a:b0:3d2:a718:7b36 with SMTP id 586e51a60fabf-3e7c24e337bmr535332fac.20.1762549800616;
        Fri, 07 Nov 2025 13:10:00 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:7bb8:950b:327d:4ba4? ([2600:8803:e7e4:500:7bb8:950b:327d:4ba4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3e41f2557a1sm2394214fac.21.2025.11.07.13.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 13:09:58 -0800 (PST)
Message-ID: <fb4aafc1-dbfb-4533-b368-5d26e24acdf1@baylibre.com>
Date: Fri, 7 Nov 2025 15:09:58 -0600
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v2_2/6=5D_units=3A_Add_32-_and_64-bit_sign?=
 =?UTF-8?Q?ed_values_of_=CF=80?=
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
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20251107201005.3156118-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/7/25 2:03 PM, Andy Shevchenko wrote:
> There are a few drivers that want to have these values, and
> one more known to come soon. Let's define the values for them.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/units.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/linux/units.h b/include/linux/units.h
> index f626e212d4ca..5b3293bce04c 100644
> --- a/include/linux/units.h
> +++ b/include/linux/units.h
> @@ -21,6 +21,12 @@
>  #define PICO	1000000000000ULL
>  #define FEMTO	1000000000000000ULL
>  
> +/* Value of π * 10⁸ (fits s32 or signed int) */
> +#define PI	314159265

It isn't clear to me at all in the other patches that e.g.
DIV_ROUND_UP(PI, 1000) would be π ✕ 10⁴ (rounded to nearest
integer, of course).

Calling these PI_E8 and PI_E18 or PI_x10_8 and PI_x10_18
would help to clear that up.

> +
> +/* Value of π * 10¹⁸ (fits s64 or signed long long) */
> +#define PI_LL	3141592653589793238LL
> +
>  /* Hz based multipliers */
>  #define NANOHZ_PER_HZ		1000000000UL
>  #define MICROHZ_PER_HZ		1000000UL

