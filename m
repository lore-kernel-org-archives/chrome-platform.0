Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFCD33D9
	for <chrome-platform@lists.linux.dev>; Sun,  2 Oct 2022 14:25:54 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id q14so6584833lfo.11
        for <chrome-platform@lists.linux.dev>; Sun, 02 Oct 2022 07:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=gxTqR0Ey2zRGFAUJiTDVmDjU/UZZW0WZ5gZEg22u3Wk=;
        b=jGnsuOP2BMD7JALE54C+npRn7uDNrfknnPc4XoFlhqP3O5ytopAP9/R8NwM3PMwoBv
         zT2lZBhtCf1RkuHWXEgu1A1qvGdG1a+qfDnAYS3nQHPYqv/uB/MTY0pN+PtY/gKlGimJ
         K1wkNPbnwxpkwq0eysMLflHyfPL0fOXNPmhdu9HjFbQosJTdyViC1f8xEz/SAEAxlZOJ
         zhALucQNra65JJZNjp2KrNFhaosfTTLaZ65L4W+/HTSMhTHeIFrtV9a3MfNhk9/czVH6
         GRutJpvguYne9QMTdBoHiXHDEf7u9rkHUnILZW9/dbEXz8jW+8NmG+HJiDEt/5fM1fAe
         iX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=gxTqR0Ey2zRGFAUJiTDVmDjU/UZZW0WZ5gZEg22u3Wk=;
        b=AtAhyrdC9UTnMvKar9X5hMKXztXCtYK6vhJK3oOjnh9MZCj7b8w/QPNaUa4O9h04P5
         03HkMWkxAC3O9D9e+uN3RYIsT05QU2YQNsCpcE+rZ9U0eUnJK9PnwTewgY/UlNXBGM9C
         EeKpDr9HQaCjz2XOOZBtb+icxbl0i4AOCpOWBndGWkVQh7mTsuymrtbC3VTEoBKaa2JV
         bHbSfvFLkvw2Y7Je/gpY3vQlAYBHYssJ/P8dX7LSLsZFiMS9EWseC9deensdBD7PUsm2
         Uk9UhR32dHeRbgZRzJ2wfYG/qU2hb59ZfxSObJeMpIfFXLMGEzyO5FkeSYTsxozE+MwD
         xXlA==
X-Gm-Message-State: ACrzQf3Uea2rF9fPAbGOiVjZSl2uZUOHDY6gAU8a8WhKHXwjgp8ceqw9
	E7DXj0WPiW1Gzjtox9xvBs4=
X-Google-Smtp-Source: AMsMyM7m7VInrlw3wi4/yW200f1frbq/JSXeri3ENLMmDbOyWr8ifLVIGnHwkYh+TbO6im/nsFplgw==
X-Received: by 2002:ac2:5cd1:0:b0:4a2:291a:9460 with SMTP id f17-20020ac25cd1000000b004a2291a9460mr1803288lfq.203.1664720752562;
        Sun, 02 Oct 2022 07:25:52 -0700 (PDT)
Received: from ?IPV6:2001:14ba:16f3:4a00::1? (dc75zzyyyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::1])
        by smtp.gmail.com with ESMTPSA id a18-20020a05651c031200b0026c5579c64csm648964ljp.89.2022.10.02.07.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Oct 2022 07:25:51 -0700 (PDT)
Message-ID: <3ebe3c45-e951-678b-ea55-89c5bf62e8bc@gmail.com>
Date: Sun, 2 Oct 2022 17:25:48 +0300
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [RFT PATCH v2 2/2] iio: Fix unsafe buffer attributes
Content-Language: en-US
To: Jonathan Cameron <jic23@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nathan Chancellor <nathan@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Miaoqian Lin
 <linmq006@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Mihail Chindris <mihail.chindris@analog.com>,
 Gwendal Grignou <gwendal@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev
References: <cover.1664610071.git.mazziesaccount@gmail.com>
 <614bb5336c2922578da60a43570f42018623557a.1664610071.git.mazziesaccount@gmail.com>
 <20221002145644.16db3aec@jic23-huawei>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20221002145644.16db3aec@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/22 16:57, Jonathan Cameron wrote:
> On Sat, 1 Oct 2022 10:44:23 +0300
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> The iio_triggered_buffer_setup_ext() was changed by
>> commit 15097c7a1adc ("iio: buffer: wrap all buffer attributes into iio_dev_attr")
>> to silently expect that all attributes given in buffer_attrs array are
>> device-attributes. This expectation was not forced by the API - and some
>> drivers did register attributes created by IIO_CONST_ATTR().
>>
>> The added attribute "wrapping" does not copy the pointer to stored
>> string constant and when the sysfs file is read the kernel will access
>> to invalid location.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>> Fixes: 15097c7a1adc ("iio: buffer: wrap all buffer attributes into iio_dev_attr")
> 
> Hi Matti,
> 
> This feels like we are doing too much in one go.
> I would start with fixes for each individual driver, then once those are in we
> come around again and do the refactor.
> 
> So for the first patch set (one per driver) just siwtch to yor new
> dev_attr but still use a struct attribute * array.
> Second series then does the refactor so we don't introduce any new instances
> in future. More churn but the code to backport is more tightly confined.

Agreed. Besides, backporting the fix to stable will be much easier that 
way. I'll split this for v3. Thanks for the input!


Yours,
	--Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

