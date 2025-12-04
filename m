Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D353C349B1C
	for <chrome-platform@lists.linux.dev>; Thu,  4 Dec 2025 17:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764869716; cv=none; b=qnp3iLMp9odtTgVXm9t9qesgOOj7TOXCaOZ5jMIMfnRp2ws4mSwoiN7YPNez2NB5N11BPAtlzg2ZYh/6g1NwR5Y/lY2yJ+/v07kXGpbMkE8WaU12HeBXBp8Z63O/rapE7Yjoyw3XozVfs7CdSbpZimayWzNiAdFCCrHlRTw0GvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764869716; c=relaxed/simple;
	bh=RJrF6VOS+3BAz5nEB1+TZdimw8zPQxSfnzdvz6TM/0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k8Wk/VCgflfcIyBkKCZzsOPAkIU0SxLEeAWMdj/RgsvlDiiTKn2vYvb20WUsmbTdMDsIUCzdLzRMZFwn9POKAIaUbj8ou1r2jekXghkdI/uoXxOJIm8XhTTltwojYoocVDt7KNxQl3CdrN+7q90On9Gzkt6/9XCdYq8ymeTSNvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=L2sq1/WL; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="L2sq1/WL"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-656de56ce7aso363593eaf.3
        for <chrome-platform@lists.linux.dev>; Thu, 04 Dec 2025 09:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764869714; x=1765474514; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SgjVXO0RU8Da0XtOb4CV/bXMWFtkfibexst/jI0YgUY=;
        b=L2sq1/WLJd8kcSUIPHjxqVV1rYWmJCs95xxLhR7+97wEwNDAUIdZ6uu0c2977YFz5H
         rLMUudTOROGKvFkiYKsiMNGluOAh4xL9lh0S7fDOEuwocVtOPJ0sQUSYWwnVMkay63U6
         uYSdxNXPt105mZcseTG9FStYQj6fRNa3nKAYYefPeQMw++zrPh5II2Z4qTzy1G0ICXUc
         KqbuDC7WXxEct+Ifr/zKlfuf2045dY9b5mBtb+Du8Q2j3LmVnTIjCWJyS0KweEU30aXB
         Vx8C4IFllzBIiMnHRQaHladf+ditiruFUit7D3z+6Xc2dJMJtxgXOgatA7P9R3VUYr3W
         kogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764869714; x=1765474514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SgjVXO0RU8Da0XtOb4CV/bXMWFtkfibexst/jI0YgUY=;
        b=XcSiBSkbIgGbQBFOB8qg+vnrUJp5YHmm1codO3aem5NGYpH0HkvINJR2duwXzM/M6/
         5EEbzs28FhmP74rdiJXnk55EOu+z30MxGUDvAIICnS8yiz7WNGyFenL5jJiViMJ6VZKk
         Dkokejhep4EfXFjBTnQRZ3SMK1mbN/HiVFTRez8uJxmLmt0kRNsTd9QwEvDEK2Z8fSvx
         nsNMeHrwB9NE1t4y3xM88zK8gC0+hvBTK4mf/YNWerpT4a8pbHGLiu6HMG4pKPI1H+f/
         51mtWgM2xjIv31Ye4rBxVpd26pdFkHlGCjpFVwhgjVPqOZ0K0PGhekSQjPjmVILcMiF2
         AiNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdQgd9auTEHePdYQVamEFlOpWOiWyreNxAdSyKj4kgOAUFv0kbuMuuzKY743WEZ9ixkRjW40WF/6PX3QHgYR0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwzAH6JkQhnG4jSFPLagMWF3d9XBZeoB89yCrOGpJsHDLZCLb7L
	PcS9JSZykm9z5GmVM5++S5q6pL0gfOb+G7cQ4AnhOEaCfBmIeA5eyf54N6xNIcz8BEs=
X-Gm-Gg: ASbGnct3rXQdqBDVNM5AjIthBgRX3hDjbs7FjkFgoc0VvoXfe+AkPhz8ne42X7FF20c
	nWEzt7qq9bC+G4GFirokO0pH9D8JwBx/XoEp7BzkFzXgIZAfM0u2zCMpjcpJOGp+teFN/DHImrw
	hhRe7r/qU1tkDU7bj5z/bvdXfxbUdqFvnkuDB0lQlUcEXUWPj27GOIiNCUqmAYYDJYoJfDcRNzn
	XOf3hZ+8G6G9+xO6+Uk+aYTa2MJR2TZIkqUBaPeWlUhr2B/sLNW0dC1wAT4Aj6CrQUcMweN1iZ3
	w0sIS27T2z0J6HXUe1xPaA7Y/RKZvo6IF5b/h441Ud54o7KuFKyQwrfTqbiKQPj4pL4RIzlbFVA
	pz9ygOwZU98/enl2FMXws7RRH2Lm/Md5wDL83TbyiRtSzAyZlQc++nzxExhAg6yytYpHuT3ut1z
	U+Yfmh8H2cNLQZzP1VTMrsDwh4SkL7QSq9NTOkDqlApYIFueEY2QiGVer0NwOJ
X-Google-Smtp-Source: AGHT+IG44Sj8rkBnNNJIB4NO4CCMMHVuCGhj2JaWu6l839/BoQuyQjUilc5y4oEUHndmxI0MuGTd7Q==
X-Received: by 2002:a05:6820:818a:b0:657:56ba:7455 with SMTP id 006d021491bc7-65972623614mr3322771eaf.1.1764869713725;
        Thu, 04 Dec 2025 09:35:13 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:25f4:78dc:7b9e:e7a4? ([2600:8803:e7e4:500:25f4:78dc:7b9e:e7a4])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6597ec5b35csm1037150eaf.7.2025.12.04.09.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 09:35:13 -0800 (PST)
Message-ID: <c9efd563-9d52-4761-a5f1-be0df0222dff@baylibre.com>
Date: Thu, 4 Dec 2025 11:35:11 -0600
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/6] iio: health: max30102: Use cleanup.h for IIO
 locks
To: Kurt Borja <kuurtb@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Benson Leung <bleung@chromium.org>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Gwendal Grignou <gwendal@chromium.org>,
 Shrikant Raskar <raskar.shree97@gmail.com>,
 Per-Daniel Olsson <perdaniel.olsson@axis.com>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Guenter Roeck <groeck@chromium.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
References: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com>
 <20251203-lock-impr-v1-5-b4a1fd639423@gmail.com>
 <f96694db-2ad5-46d3-a380-cba3eaa2de2f@baylibre.com>
 <DEPLIJFBZQ36.20XX5DCMCJVB3@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <DEPLIJFBZQ36.20XX5DCMCJVB3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/4/25 11:07 AM, Kurt Borja wrote:
> On Wed Dec 3, 2025 at 4:52 PM -05, David Lechner wrote:
>> On 12/3/25 1:18 PM, Kurt Borja wrote:

...

>> I would write the whole function like this:
>>
>> static int max30102_read_raw(struct iio_dev *indio_dev,
>> 			     struct iio_chan_spec const *chan,
>> 			     int *val, int *val2, long mask)
>> {
>> 	struct max30102_data *data = iio_priv(indio_dev);
>> 	int ret;
>>
>> 	switch (mask) {
>> 	case IIO_CHAN_INFO_RAW: {
>> 		/*
>> 		 * Temperature reading can only be acquired when not in
>> 		 * shutdown; leave shutdown briefly when buffer not running
>> 		 */
>> 		guard(iio_device_claim)(indio_dev);
> 
> AFAIK you can't guard() inside switch-case blocks. I don't know the
> exact reason, but it has to be scoped_guard().

You can. You just need the braces like I showed in my suggestion.

The reason is that guard() is declaring local variables and some
compilers like LLVM don't like declaring local variables in a
switch case. By adding the { } scope, the variables are limited
to that scope and the issue goes away.

