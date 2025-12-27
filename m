Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24ECA31328A
	for <chrome-platform@lists.linux.dev>; Sat, 27 Dec 2025 18:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766859239; cv=none; b=LP/OXuxRT2tZxXtX3vyIQNfZOUhmiPhaEi2g4a21xkwW8tcmOpjCPfRLUt9iwrSDCCsI8luX0bDSB5vtamd9tX8xYBx+aBvNVXkQyBce7DMODmcxOukGFJNFY4OQYyDc8xxJCcP1agvTTOCAWsG4IaOnUxm1KavqAdiH963RDp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766859239; c=relaxed/simple;
	bh=4vuQrVLNaJGUWJWBNtmz4jC/+TxwI/W3PLlQhaXQly8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SSyyfbIZVSXlhFyyzwNLqlTJT7did/CM57TKA9RcibSr4B2vv+JTLEuI/R6XWaxT19GhpfMse+hKMzMIBOdeeUKuddMOfXRsOgTPVP6CxBcms2BatYyLgDMLoQfGMe12Ewm5Ua8+qAnokYq/erGf82IKbM5i503SNKjE+galyPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=diiiDhFj; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="diiiDhFj"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-455af5758fdso5262060b6e.1
        for <chrome-platform@lists.linux.dev>; Sat, 27 Dec 2025 10:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766859236; x=1767464036; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P/yiNmEm36TsWNfUH8F6Tvae1msGjni9hNs8R/sZzZE=;
        b=diiiDhFjcfv8e0ub6IXCy0FSAYfRilQkm449Pmo2IBuhBCfjHoU7bxIweZ9qQr1I10
         YDD4tT/tPocQjHI9aLbJye2g+szwesS5HIMqrxcasxM+SNQF2T+qefNPHFmqRPxO3GdY
         HhSnF5ak3Aac/hAEFzzTg5AxWfAiKJX+8sjfh9Rc4XCLz8BVkKumQTXcSZSw4nEI8vES
         vszgeWXm0VcWp3yQ9AEAi/OE87JNXl1k/CYLAJTLQbUr5KV6Ck+o7AaPNHfANUUeCDWQ
         GpR8tUDzCGPWosluPfbONACklmJwnznf4LLz14OFJmHRjIdYv+xXSOejc1G3alzV+09Y
         /XjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766859236; x=1767464036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/yiNmEm36TsWNfUH8F6Tvae1msGjni9hNs8R/sZzZE=;
        b=IiP/qPDy30rbO7u8wjToAUcruyV35JQ+H0VZdKIpQNNXE2uY7wThB4q/Xo8WNaTQhS
         Kvef/0m6Dk/pCADqdzD/3u4itWAfrDC1nKZQXkgzbILypegEDnTD6MxaCPEj2XpdUBTX
         m/sLCVHupvOtL9NrEKcd+pb7K14VX5AW7W8tNSfwfmeYkfGivcY/WMOGUWDXAuH44Xmi
         597RJLiYVqWh+G5KocGHejlpKURwKBdsOP/31cAc94xfWmHGXNof76SGQM3kAohEhj2S
         aXMm5/AcO7Hn+ZQm/8mvGnhiy0HUMOTz5JnadfE4xJMZcRG7cVocropB1t1WcRRVU7Bj
         QkYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmJ94+YmyUYu1ZLlXUHpbO5sjDonIt9BNvQxJpOjGkcUGHx7iyWwRxY2ULt0MhEfZF0hFUKJNNPPaDSqEooaY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLgYkcDCx+MesFRR2emcieufoA01PYgoM6DQXnPytIK0yGP0z1
	fCOl0OA/1RlF3K9RabNynnDlqITHQrThpWoS6LPnns9efXYssoVgq0r4e52Evx5XLR0=
X-Gm-Gg: AY/fxX6kvG6rY+MI7tPJcs5+fiNbasQWx3BB7RnjUzXBrsXo4J5LP49BfHtWPxoeokV
	xctn14umPjpyuQepEy8LCvJRPH3iNAHtg299MaQg1PugWnC1qaeE6MmwkyLXaLOTz2T9GlojfhG
	2Wpsx3+TJuNnJ9UDI8OoovI2id9OFuaVvvUXCljTTBl3J0kfLar7FUU85HNmnkpBmJ5602I3Oqu
	/mPO/5Wngkrfmi8wE+JmnyWRFrG0vPM5QS9zdOFSHKkQTwVuTHNZUL7MP+qTogxManYB9Tuoaqe
	Z2zOeazAjJDanpZEAhihKMJIwLytpysQ1KkwryRLCUwD/aZFoQapXOYnKDRbP3T95zluiEGyPaf
	sZJMnPyqD2xunYKnaN6hvlJaWrBNOcQqAVykNX11xCQnbz3f31EkA9/uYo0w8fPeUaCUhf4aicQ
	dp5z5vSmRzhc0cEPuylZgA22aXp1uJ/BSeqlBkk3hCR7JtR3XB1WroI2SZ/3cp
X-Google-Smtp-Source: AGHT+IGRcPFLai4mdcLU0/c8FbOjABdWxrmxqFWaowe+JFLVesdtVhhbz4Mg5CS3rPVcjo/exX2ISQ==
X-Received: by 2002:a05:6808:5393:b0:450:1116:d74f with SMTP id 5614622812f47-457b213f198mr11926747b6e.27.1766859235858;
        Sat, 27 Dec 2025 10:13:55 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:81b7:1177:37cc:3153? ([2600:8803:e7e4:500:81b7:1177:37cc:3153])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-457b3f1db46sm11302546b6e.21.2025.12.27.10.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 10:13:55 -0800 (PST)
Message-ID: <c4b3fa79-97ff-4f5b-a3a0-f1c24e9349be@baylibre.com>
Date: Sat, 27 Dec 2025 12:13:53 -0600
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] iio: core: Add and export __iio_dev_mode_lock()
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
References: <20251211-lock-impr-v2-0-6fb47bdaaf24@gmail.com>
 <20251211-lock-impr-v2-1-6fb47bdaaf24@gmail.com>
 <92d07935-b2b5-4cf3-bd45-654d77cdc23b@baylibre.com>
 <DF96UPJ1TKP2.2U8D76HGLPT09@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <DF96UPJ1TKP2.2U8D76HGLPT09@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/27/25 11:51 AM, Kurt Borja wrote:
> Hi David,
> 
> On Tue Dec 23, 2025 at 12:19 PM -05, David Lechner wrote:
>> On 12/11/25 8:45 PM, Kurt Borja wrote:
>>> Add infallible wrappers around the internal IIO mode lock.
>>
>> Not sure what "infallible" is supposed to mean in this context. Maybe
>> referring to autocleanup?
> 
> I meant wrappers that do not fail i.e. return void. Should I word it
> differently?
> 
Ah, I think you mean "unconditional" - as in "not a conditional
lock".

In the body of the commit message, you could spell this out more that
normally, this is used as a conditional lock, but to prepare for autocleanup
and we need an unconditional lock for the base guard() to be extended
with the conditional ACQUIRE().


