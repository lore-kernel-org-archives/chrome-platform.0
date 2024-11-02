Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6C41E515
	for <chrome-platform@lists.linux.dev>; Sat,  2 Nov 2024 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730553683; cv=none; b=ZJGF3bufZFnUw6fdMTOrXLgQjnOHUigTwVj3jGOUOfzpEm67qOGvHA9E2fyRnV09pY65uXk6l/blzp3ztBILbhGM+1vZ0fmrSwy2UenPSNy9oSJrESm1o5ie88oQnj0XbzHmeuo+kYDnK0zr10+trqG1r05T7lpgrp8s3NCJM/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730553683; c=relaxed/simple;
	bh=TYC9l1TDXilNXaG0BsW3CdCYdRUtd8+mZKCtV6EyLI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s2E1K6Ajh3hc9FM/mMYD2tEgmVx9JvmBxgz4VWDmH6Xd/e59U0XYRvzLoS1UmhaGtXjApoiyik8COqL7NMbDajeVZJ4vqwBxrg0LhtlaTCk55YV1kADYvOBELzTyjNfLianHZFk9o0JEWvJBE187/ykS50tc0fulUzWvT5ziUag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tweaklogic.com; spf=pass smtp.mailfrom=tweaklogic.com; dkim=pass (2048-bit key) header.d=tweaklogic.com header.i=@tweaklogic.com header.b=eENKmBUk; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tweaklogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tweaklogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tweaklogic.com header.i=@tweaklogic.com header.b="eENKmBUk"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20c693b68f5so30444885ad.1
        for <chrome-platform@lists.linux.dev>; Sat, 02 Nov 2024 06:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tweaklogic.com; s=google; t=1730553680; x=1731158480; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8P6J7CC2+ddqyvspzxGk9dhLYIMX+2ilpolCnOsNTNQ=;
        b=eENKmBUkLDgy7Oy6uyQmK/oyIcBhTd6L9XaOTSuibiZr+XLwjWOBdVZI9aWOqwZEzg
         9177eRFyZ3yNspvJjf9b2lCCiFjEPjYvodcHeORHIR9afyYaAKrVZFx8ZkvzI8FYtHgJ
         doeRsfDBJZ6+KKP9L8wUdZxKT0YiiMD3VlciQsRqNtW/70iJv1U+rP0GwYJas3s3o/o6
         EbirFqT5znVJI0UN5QwHLQLEPa9qx7fys/Z6OXOeD1DetVIeaPQnydiixShh5LsM79Jq
         vVRht5LJUOKJ2ImryGTd7KZTrl3Wl8pyhM+qLKPt1hj9Do/zJia6TVtexmTTx3012MoQ
         hMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730553680; x=1731158480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8P6J7CC2+ddqyvspzxGk9dhLYIMX+2ilpolCnOsNTNQ=;
        b=wX8NWbyrxN8HhlK318KpBG6F6pcFM3/5/9H+whxAMlAR0yKsZWXPJcKSS3Z7958792
         UAZUm32gKFCjKI/EK2jZvLCGEvPCquFJ7I/nEOcvXluL51okleKQQbjmSs3gwvV2foK9
         5mPMc4Ye5YrAj3gEfNhDAqHZDHR1QZkFiLUtrL/YY4YPmdBJk5DAW2IrpawhLm+GugyJ
         i8hIZ3iXB5TInY9GIEjElSm4EabNXXk3sYTxHIS8Y6+hMXmqyYouM7xMHdlyPGL8CjNz
         SKXFu2UX6Rx9J4nrMNhU4yH9/SCY34/p8eYOceIQK1pc9Nces2TtDiAdutgCzZ5AyTaN
         2T+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtsrN40W49yjPOkgTz1Xc/Hz3nCgX00I02h9uw1QMiBxV0Z3un2s9AwB8aZcmgSLk+Qzb3DkJFnGb/+MqcwU8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVt76JSTDJxOYGJpoxtd21MglxWUZJLUcvOxya4ieztP1yfbUV
	0Vt7jPMOLQK7LGp9AA30y8LMsEZN7smKltu4M7E143Hh+ECTNqXd57sQyuKC7sk=
X-Google-Smtp-Source: AGHT+IGq+i8a8MyrkZrVMk7tFGx4jYT5BKdNbeajY1pRzeXD9zZdCy+jANqzkpIEbDK9zAkNl1bK+w==
X-Received: by 2002:a17:902:d2c8:b0:20c:a055:9f07 with SMTP id d9443c01a7336-21103b1a5cfmr145523125ad.26.1730553678217;
        Sat, 02 Nov 2024 06:21:18 -0700 (PDT)
Received: from [192.168.50.161] ([180.150.112.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2110570b482sm33784505ad.71.2024.11.02.06.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 06:21:17 -0700 (PDT)
Message-ID: <4e4e5281-d489-42b5-b358-c44958cfa4f9@tweaklogic.com>
Date: Sat, 2 Nov 2024 23:51:05 +1030
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] iio: light: apds9306: simplifies if branch in
 apds9306_write_event_config
To: Jonathan Cameron <jic23@kernel.org>,
 Julien Stephan <jstephan@baylibre.com>
Cc: Mudit Sharma <muditsharma.info@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Anshul Dalal <anshulusr@gmail.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Ramona Gradinariu <ramona.gradinariu@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Dan Robertson <dan@dlrobertson.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
 Michal Simek <michal.simek@amd.com>, Mariel Tinaco
 <Mariel.Tinaco@analog.com>, Jagath Jog J <jagathjog1996@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Kevin Tsai <ktsai@capellamicro.com>,
 Linus Walleij <linus.walleij@linaro.org>, Benson Leung
 <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
 <20241031-iio-fix-write-event-config-signature-v2-13-2bcacbb517a2@baylibre.com>
 <20241101164118.687be624@jic23-huawei>
Content-Language: en-US
From: Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>
In-Reply-To: <20241101164118.687be624@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/11/24 03:11, Jonathan Cameron wrote:
> On Thu, 31 Oct 2024 16:27:08 +0100
> Julien Stephan <jstephan@baylibre.com> wrote:
> 
>> Simplifies the regmap_wite if branch in apds9306_write_event_config.
> Applied.
>>
>> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
>> ---
>>   drivers/iio/light/apds9306.c | 5 +----
>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/drivers/iio/light/apds9306.c b/drivers/iio/light/apds9306.c
>> index 8adc74040db2bddf93fbb773e3519abcc726b9a6..9c08e7c3ad0c17519689a630d42fe9b90438dfe8 100644
>> --- a/drivers/iio/light/apds9306.c
>> +++ b/drivers/iio/light/apds9306.c
>> @@ -1125,10 +1125,7 @@ static int apds9306_write_event_config(struct iio_dev *indio_dev,
>>   		}
>>   	}
>>   	case IIO_EV_TYPE_THRESH_ADAPTIVE:
>> -		if (state)
>> -			return regmap_field_write(rf->int_thresh_var_en, 1);
>> -		else
>> -			return regmap_field_write(rf->int_thresh_var_en, 0);
>> +		return regmap_field_write(rf->int_thresh_var_en, state);
>>   	default:
>>   		return -EINVAL;
>>   	}
>>
> 
Hi Julien,
Sorry for the delay.
"int_thresh_var_en" corresponds to APDS9306_INT_CFG_REG bit 3 (Datasheet: INT_CFG, Address: 0x19) which
is a single bit value only. If user does "echo 4 > /sys/bus/iio/devices/iio:device0/events/thresh_adaptive_either_en",
which trickles down to the "state" variable, do we really want to write any other value except "0" or "1"?
Correct me if I am wrong here.
Regards,
Subhajit Ghosh
