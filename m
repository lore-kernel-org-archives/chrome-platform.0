Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A64812
	for <chrome-platform@lists.linux.dev>; Thu,  6 Oct 2022 12:53:57 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id d6so2535417lfs.10
        for <chrome-platform@lists.linux.dev>; Thu, 06 Oct 2022 05:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=jgwtLPJ++8LIBXvoR40Ojn/bqP9gjiaU+M/jYaXBo5k=;
        b=ckl50uFPWPylS0hGbvj8cr3bZ+XnkIx6hWD5aDIGMfrqr6xPMfSrWtn93ToxYD5lRp
         vJCeGeIDPsVKugYLYhsBh8TFIbuLHcqkkIbj8M8Ajk3mUuV6oTZwWXwMjmCmtx2OiiW4
         mLdHN5XD190L0bTRcAItO1XAENJiH4SW9HQUQVtSoT2grWihidF8KO0IL+UfR4VLJ0qA
         UpsLtsk77dYkcE33svn+oFYxnPVBCfTqYcru1a00fpr8ebb5I4foZr0lJxR3PYYwt5HT
         lSFrLex0im4NGIzfLGU3Vb/DsgaXXEzuo8GD6bvvT1ZgVVkinh6QtGKmtNWWVg62yEfH
         yTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=jgwtLPJ++8LIBXvoR40Ojn/bqP9gjiaU+M/jYaXBo5k=;
        b=LnIWVQAp1WI1Vt2NRpGlIrqQHp12tYk6w4HJjL2nfNrsAjLNkQoWEP266M4y3kVb+f
         un0ttGoVe7zn6wae35g21bd+MgquvwPqY5gH7V+0jUFe3MRsuK/ajwGTqcU58DoYRhtP
         i5Ry4z9qz5qMk2TXjYqTgrGZwMMPhCT77/TbNJxBUUN+4rXxj64nPgWPJK5Bh1ArEbIB
         I4BCrmiKNpxWwE4lftw/Ynt5BHBBKcEUa6/ugqnAByyXZUHE8LMLoqu0SaZDRu+Uzm4f
         Z8BSnyIe1Qiciz/o/BAp5hMWTf+RowgylpS7aFiSUmopNcNr8NicPtHeAH7gEt3sVEe6
         Upsw==
X-Gm-Message-State: ACrzQf3uOGBb9bO8ztGZtVyQnAhT++FfbNbwbVwO5OrAUqVDT2vVHxkV
	VplPnwD+TovGw7zO+ld9CKg=
X-Google-Smtp-Source: AMsMyM54GsEvYJD0wKautAAAWm5cvHk0bNLRw0sbM04efA9nFAioyhHR5MF+cE9jwNmgDE6x4MHjnw==
X-Received: by 2002:ac2:539c:0:b0:4a2:259c:c849 with SMTP id g28-20020ac2539c000000b004a2259cc849mr1847119lfh.323.1665060835453;
        Thu, 06 Oct 2022 05:53:55 -0700 (PDT)
Received: from ?IPV6:2001:14ba:16f3:4a00::1? (dc75zzyyyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::1])
        by smtp.gmail.com with ESMTPSA id by37-20020a05651c1a2500b0026dce5839fdsm1584342ljb.94.2022.10.06.05.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 05:53:54 -0700 (PDT)
Message-ID: <8ef99012-4959-a674-13c1-186b9c1c2cd4@gmail.com>
Date: Thu, 6 Oct 2022 15:53:52 +0300
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
To: Claudiu.Beznea@microchip.com, matti.vaittinen@fi.rohmeurope.com
Cc: lars@metafoo.de, Michael.Hennerich@analog.com,
 cosmin.tanislav@analog.com, jic23@kernel.org, Eugen.Hristev@microchip.com,
 Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
 bleung@chromium.org, groeck@chromium.org, alexandru.ardelean@analog.com,
 nathan@kernel.org, miquel.raynal@bootlin.com, linmq006@gmail.com,
 u.kleine-koenig@pengutronix.de, paul@crapouillou.net,
 mihail.chindris@analog.com, gwendal@chromium.org,
 andriy.shevchenko@linux.intel.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev
References: <cover.1664782676.git.mazziesaccount@gmail.com>
 <63f54787a684eb1232f1c5d275a09c786987fe4a.1664782676.git.mazziesaccount@gmail.com>
 <c163203c-d87b-7e71-f582-964a99e37efb@microchip.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <c163203c-d87b-7e71-f582-964a99e37efb@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Claudiu,

On 10/6/22 11:35, Claudiu.Beznea@microchip.com wrote:
> On 03.10.2022 11:13, Matti Vaittinen wrote:
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
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Tested-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> 
> on SAMA5D2
> 

Thanks a ton for the testing! I do _really_ appreciate it :) I am now 
slightly more confident regarding the fix here - and a lot more 
confident that we do have an actual bug (as you explained in the reply 
to the first RFT) :)

Yours
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

