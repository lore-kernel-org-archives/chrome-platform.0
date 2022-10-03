Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C574F8F60
	for <chrome-platform@lists.linux.dev>; Mon,  3 Oct 2022 09:03:00 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id d18so2567905lfb.0
        for <chrome-platform@lists.linux.dev>; Mon, 03 Oct 2022 02:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=WFcFQjxqJEFnrJQ8qbV31qWM6RmdFnAwK/71OYcFvf4=;
        b=mHh+n+cnmkVaK/GqIBEktKSE/ejYIxJzhEz3Hdnn70fU4MszIDQ7RrKkj3kW8jA5lx
         KjzN7D0n/CbQ/3UzYmrkMG40js1lIRwdLjtMDeBc4YuPleQvNzHPZiKHzl5aoX9BMbqW
         V61N3N+ldQF/xCIoliHLel5uFcJTgToJ/Hyhwj6HjFfY1QNj1ZlQodwZEuXusdwIf8xl
         /CtpXnzEcjiiUGIjKZg5sHveuyT1lfMxaTrBAtRXb4Yt45xCgemTuSjHUwR5s+p2qDo2
         8Xq9AJYxreSi2HqDTIEyRQGas/dF4usEIE4wTjYJUxOdcyrvS+0W2SK0inMPNDX//hN6
         Dusw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=WFcFQjxqJEFnrJQ8qbV31qWM6RmdFnAwK/71OYcFvf4=;
        b=0waGYig0HxpTxgJr3xTnS0Y7D1qSfy+FPYMfLhNIdW9KKROpDhbTHljvLBfw1UXBoW
         lVQry1x4mH9JUe6R2HutFMFM8q0i4LVExOBsKeWmr8NaG7nqqMNzalz9qZsJGv9OLlkp
         bKfqFEkPZmakcl3OUA5uNTSFN7wC74aSHOgtX6/dEi/6R1im1L4nYiN7/ZzO/P8iizqe
         KRu3X9Ptyw+45PoWrQlHm44JUoMe74I+VA8AO6vpGyJg4SaqUFiA5IcCBIs74zGJq8A4
         NAaR53tP7ErSUT7IuO8sfNudkHnCVkDj3MPZrpsSpShMAhP5TaJRRvLV2T8vrMmV2ubI
         jL4g==
X-Gm-Message-State: ACrzQf2oypMEokZ7Q9/BobVz2r5/ryMykw/Qe3IcvNPwXbCcm28MWN73
	9ArrsAoVW8s5F41o4JxybsE=
X-Google-Smtp-Source: AMsMyM4+xsbj6WOlcC757YkmshHzz3QVQ2wuPWpm/cGhsx1CE1yDfBL82V6qgJTEqcdswNVfolfbHg==
X-Received: by 2002:a05:6512:3f9a:b0:4a0:2af3:4523 with SMTP id x26-20020a0565123f9a00b004a02af34523mr6773412lfa.184.1664787778721;
        Mon, 03 Oct 2022 02:02:58 -0700 (PDT)
Received: from ?IPV6:2001:14ba:16f3:4a00::1? (dc75zzyyyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::1])
        by smtp.gmail.com with ESMTPSA id k22-20020ac24f16000000b00499f700430fsm1372487lfr.224.2022.10.03.02.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 02:02:58 -0700 (PDT)
Message-ID: <7ae09809-4f3c-9872-5a87-0a05e73d39b4@gmail.com>
Date: Mon, 3 Oct 2022 12:02:56 +0300
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [RFT PATCH v3 10/10] iio: Don't silently expect attribute types
Content-Language: en-US
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
 <b36ee317-abfe-9f55-70b5-bbf3138f50c0@gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <b36ee317-abfe-9f55-70b5-bbf3138f50c0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/3/22 11:58, Matti Vaittinen wrote:
> Hi Andy,
> 
> Thanks for taking the time to review :) Much appreciated.
> 
> On 10/3/22 11:43, Andy Shevchenko wrote:
>> On Mon, Oct 03, 2022 at 11:13:53AM +0300, Matti Vaittinen wrote:
>>> The iio_triggered_buffer_setup_ext() and the
>>> devm_iio_kfifo_buffer_setup_ext() were changed by
>>> commit 15097c7a1adc ("iio: buffer: wrap all buffer attributes into 
>>> iio_dev_attr")
>>> to silently expect that all attributes given in buffer_attrs array are
>>> device-attributes. This expectation was not forced by the API - and some
>>> drivers did register attributes created by IIO_CONST_ATTR().
>>>
>>> When using IIO_CONST_ATTRs the added attribute "wrapping" does not copy
>>> the pointer to stored string constant and when the sysfs file is read 
>>> the
>>> kernel will access to invalid location.
>>>
>>> Change the function signatures to expect an array of iio_dev_attrs to
>>> avoid similar errors in the future.
>>
>> ...
>> 
>>> +            attr[ARRAY_SIZE(iio_buffer_attrs) + i] =
>>> +                (struct attribute *)&id_attr->dev_attr.attr;
>>
>> ...and explicit casting here. Isn't attr is already of a struct 
>> attribute?
> 
> I am glad you asked :)
> This is one of the "things" I was not really happy about. Here we hide 
> the fact that our array is full of pointers to _const_ data. If we don't 
> cast the compiler points this out. Old code did the same thing but it 
> did this by just doing a memcpy for the pointers - which I personally 
> consider even worse as it gets really easy to miss this. The cast at 
> least hints there is something slightly "fishy" going on.
> 
> My "gut feeling" about the correct fix is we should check if some 
> attributes in the array (stored to the struct here) actually need to be 
> modified later (which I doubt). If I was keen on betting I'd bet we 
> could switch the struct definition to also contain pointers to const 
> attributes. I am afraid this would mean quite a few more changes to the 
> function signatures (changing struct attribute * to const struct 
> attribute *) here and there - and possibly also require some changes to 
> drivers. Thus I didn't even look at that option in the scope of this 
> fix. It should probably be a separate refactoring series. But yes - this 
> cast should catch attention as it did.
> 

Actually, now that you pointed it out - do you think this would warrant 
a FIXME comment?

> Yours,
>      -- Matti Vaittinen
> 

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

