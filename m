Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9202617C1
	for <chrome-platform@lists.linux.dev>; Mon,  3 Oct 2022 08:58:39 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id 25so5334504lft.9
        for <chrome-platform@lists.linux.dev>; Mon, 03 Oct 2022 01:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date;
        bh=XqQodRH6a0lQZyrQzj66WYhNicw1wjJoyMwDWMJ/yGw=;
        b=bl1ytC6xg/0TJjIaMmN+k7HXrHD8sja3rF4SvTIZx7wgGqYO/r+PfPOrhBeKihL4f0
         kaO6kuj2Yu6L7uImCcWZ5u9PmECHLQ264Vx031PAxwHI4Q3SUhtNKhCsZJciqhTKabCV
         pBKnGkX8lrftB2h0lPVg98YEw3Xt2g3gRRrmABN+ZWD2JtdA/sYGPy8vl1F9KHz1GmD+
         xCp7P35IhJYRDKtpWBTocD8ZOfapZHSrhC/ZPtoHtVv9CLC4cHahRYMjb/S8VoZlS+xb
         ZEixKtM/Dy2QNEVJYz1rRHw6OF9FjQGsytLKdYupw5tPH63XrFos3zFIwpPOzf3z3i2Y
         u06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=XqQodRH6a0lQZyrQzj66WYhNicw1wjJoyMwDWMJ/yGw=;
        b=786ghvrHZPMmN046AvDPiI29vI88Ny/9NTVNFdwYIlRR8OMMfGfx4EryOpHGpOK3TV
         WWyz96JdI9Mmb4ZKmXHLpVJ80xJd4PNA8z0Xg8CfIpdc/YokFeIEt6O/0z4Ojpu4NWoU
         wdtH4Gma151tjkqlB7xjJM2jHK8UZepqs1hYwhpXTWcw21g1fQl5TIyUQh+0uJFgmA7l
         M0p5dMP4RD4u76zopvuVLahf2iKjbkA4Vm1TqrnXG2klLqt9raBD+/UZ5NLOLSOiGr72
         aEKFLSjrZ1949cF8vuoifqK35LLSDfxAyo5oi9YGUQaWFSb1Xr21tzxIBD3Lm6tlXfU4
         sGYw==
X-Gm-Message-State: ACrzQf1XIedlgG9PFC8flKVkS5/VBDGvLpF/JEC5BkI2lj6WuXEUelAe
	K4O8qD6au+7XxyrTDdVnmiQ=
X-Google-Smtp-Source: AMsMyM5iOPWlnaPtqydnwwB96XQWlOM0ceWCm7e8fBeobmzF3gn2nYS9+MkZN4L3bjNU5DHtFJiI0g==
X-Received: by 2002:a05:6512:b21:b0:4a0:45a1:7bf1 with SMTP id w33-20020a0565120b2100b004a045a17bf1mr6618049lfu.461.1664787517419;
        Mon, 03 Oct 2022 01:58:37 -0700 (PDT)
Received: from ?IPV6:2001:14ba:16f3:4a00::1? (dc75zzyyyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::1])
        by smtp.gmail.com with ESMTPSA id o5-20020ac24e85000000b004886508ca5csm1051678lfr.68.2022.10.03.01.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 01:58:36 -0700 (PDT)
Message-ID: <b36ee317-abfe-9f55-70b5-bbf3138f50c0@gmail.com>
Date: Mon, 3 Oct 2022 11:58:35 +0300
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Miaoqian Lin
 <linmq006@gmail.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>,
 Mihail Chindris <mihail.chindris@analog.com>,
 Gwendal Grignou <gwendal@chromium.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev
References: <cover.1664782676.git.mazziesaccount@gmail.com>
 <63f54787a684eb1232f1c5d275a09c786987fe4a.1664782676.git.mazziesaccount@gmail.com>
 <YzqgqERDTLVkJH67@smile.fi.intel.com>
Content-Language: en-US
From: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [RFT PATCH v3 10/10] iio: Don't silently expect attribute types
In-Reply-To: <YzqgqERDTLVkJH67@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andy,

Thanks for taking the time to review :) Much appreciated.

On 10/3/22 11:43, Andy Shevchenko wrote:
> On Mon, Oct 03, 2022 at 11:13:53AM +0300, Matti Vaittinen wrote:
>> The iio_triggered_buffer_setup_ext() and the
>> devm_iio_kfifo_buffer_setup_ext() were changed by
>> commit 15097c7a1adc ("iio: buffer: wrap all buffer attributes into iio_dev_attr")
>> to silently expect that all attributes given in buffer_attrs array are
>> device-attributes. This expectation was not forced by the API - and some
>> drivers did register attributes created by IIO_CONST_ATTR().
>>
>> When using IIO_CONST_ATTRs the added attribute "wrapping" does not copy
>> the pointer to stored string constant and when the sysfs file is read the
>> kernel will access to invalid location.
>>
>> Change the function signatures to expect an array of iio_dev_attrs to
>> avoid similar errors in the future.
> 
> ...
> 
> 
> Wouldn't be better to split this on per driver basis or is it impossible?

We need to change the callers and function signatures in one patch so we 
don't break bisecting.

> 
>>   	struct iio_dev_opaque *iio_dev_opaque = to_iio_dev_opaque(indio_dev);
>>   	struct iio_dev_attr *p;
> 
>> +	const struct iio_dev_attr *id_attr;
> 
> I'm wondering if we may keep this upper, so "longer line goes first" rule would
> be satisfied.

Sure.

> 
>>   	struct attribute **attr;
>>   	int ret, i, attrn, scan_el_attrcount, buffer_attrcount;
>>   	const struct iio_chan_spec *channels;
> 
> ...
> 
>> +		for (i = 0, id_attr = buffer->attrs[i];
>> +		     (id_attr = buffer->attrs[i]); i++)
> 
> Not sure why we have additional parentheses...

Because gcc warns about the assignment and suggests adding parenthesis 
if we don't.

>> +			attr[ARRAY_SIZE(iio_buffer_attrs) + i] =
>> +				(struct attribute *)&id_attr->dev_attr.attr;
> 
> ...and explicit casting here. Isn't attr is already of a struct attribute?

I am glad you asked :)
This is one of the "things" I was not really happy about. Here we hide 
the fact that our array is full of pointers to _const_ data. If we don't 
cast the compiler points this out. Old code did the same thing but it 
did this by just doing a memcpy for the pointers - which I personally 
consider even worse as it gets really easy to miss this. The cast at 
least hints there is something slightly "fishy" going on.

My "gut feeling" about the correct fix is we should check if some 
attributes in the array (stored to the struct here) actually need to be 
modified later (which I doubt). If I was keen on betting I'd bet we 
could switch the struct definition to also contain pointers to const 
attributes. I am afraid this would mean quite a few more changes to the 
function signatures (changing struct attribute * to const struct 
attribute *) here and there - and possibly also require some changes to 
drivers. Thus I didn't even look at that option in the scope of this 
fix. It should probably be a separate refactoring series. But yes - this 
cast should catch attention as it did.

Yours,
	-- Matti Vaittinen

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

