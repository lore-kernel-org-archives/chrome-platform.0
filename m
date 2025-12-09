Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC9A329C75
	for <chrome-platform@lists.linux.dev>; Tue,  9 Dec 2025 17:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765299927; cv=none; b=e8NvwRt5Ll8tWxEJstewxmKzDjYfljobmr+w0iTFrr5tMsaw4lrj+Jf8nC3vTdChUdkiAdp9QgY+++msRqexizuY8eA/NPE53/IyprnA/QjtwDZ6/3Wi9wYTymq5dpnLJ1dpXAjevTaqSjshTINXAcnAODv7qjBLzGJfMAq+DDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765299927; c=relaxed/simple;
	bh=djwV1YPqHJRmfMBqb2pv7M2B8bAh/V9aaC8VS4CE0eQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oWN7tJ8xfCKxCU+XcSyBeFZ2kybXR4ItLZE9s8U/8LVEC6nWByN5oIk6YCvlOK7Rkb8e0ugRGmqeWOW96DUA3WvMbe8IVhphTL1NbYigplqAt9tYb7t/QU3UnRaJqF1fpOGhNVVMzNP+Q8L+inzeNgpKWfkJWl+r9DZMbH7YXew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=g3yA+KET; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="g3yA+KET"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7c6d13986f8so35170a34.0
        for <chrome-platform@lists.linux.dev>; Tue, 09 Dec 2025 09:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765299925; x=1765904725; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G4n56/mm+y5lEIPHBvAL6dNtszRve9ILxt5EMAL7gg8=;
        b=g3yA+KETqXVhUSx0pCPbMngf7mLWAKVz+M1i+5uILId0qEtzR6cb4qUJYyRv9lILpq
         IzO15hHsnTyCJRGG9xgndPxfQ+x3xBu1HBajl721pV1+sjwmolg8crDzUAjyi/o6SRRK
         5R1/TtjPuP6Dnn0kjU7wsKhvERYVCrQk5a2zrJlsoOirvZiDy3AtfsQ6WmGuGLOCzBdZ
         /i6lvK97//mtESowrCbD3lEGbi9DmbsoZwZIk0Mditoeax3iBYi8s8sQepDwSVTnNVMQ
         yvKsxbEPLSzmS4NFpjQuPKg/ZTH1Xr5TCws8oXTlKrOXTXiss/D4M98G2kzrQXwiDeI6
         3IjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765299925; x=1765904725;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G4n56/mm+y5lEIPHBvAL6dNtszRve9ILxt5EMAL7gg8=;
        b=VxlQZpCvCR3fnBofSd1d0FRnNLPFQTsaqP0LCts4JTeeAjW6S5pcByHoA+jIp+UupY
         m9jLLgB8IOWJEWineeAWlYL6r5+eVq5cYPpGXnBH/Q/UwvHuGu5Km36JRGnEAF7ON1CH
         w6t+Y1ZmYNULBXGoE1auaNGd9b+flJdfBPCpDyzL8ZFOZsTL/t9oKSazXE4jysksbzXE
         Zlrl9w+adyiQpPt5XSp9Uu5ABy/gmV2NEpTW5JpD0qNqFI1OUuX1xeRnPqyc+zST2TDo
         qWrA9SDzmTKwRcGSV0J2/FqoRHWvQsx+GsNt5bVLNUhCc4LoONYQkhfgdQTfR2sJ1wOv
         olvw==
X-Forwarded-Encrypted: i=1; AJvYcCW7sOdfWcmVpiCHTve61kDBsNcZxtLEHarWRh/EAOQylrQvOkqWyvUqnmqFAIEA+F3GdSMycArYIBIVTvfliSA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKEwWT/OpVA3g3mE1yYUWvzO6d3JJlMBQwhl3FkV+WJgR+2OVu
	gJWaslAxP1SChDRZ1Z+4Kh340CoXm7Mfet+qHNqtKcV2RBVHVqt5Bsb844yO38mFI6A=
X-Gm-Gg: ASbGncvQZ4qy4gwUU0qokdftRpnyqeZ6UzZqLrbwzdKwi7YEKt0BcnOnM6/46ph1TqT
	oO3/axNz2CBR5Z6OtP4JerXmonZ0RJ65X6pWyEsNSy9wd9m42e4HbLxuJGDeCpiytMGcerlhIPh
	lO+BsDCchQNO7zGibCwc0Al4AN2ncHtSdXz3pbcYOp25FFtxtymCXhx98MKaXq8IEIgPmkqNpA+
	hBdwGRgBKOHvgJONm3QZPD8Ysl5qvoHnLAU/gQM+gAjCiaWKUohV1yclg5qi0LaMpcYYrXFT97t
	Jzqd9KtlyQOL13YMxGeM/JHh49N+FvJ+h+X/jSzcjSD+7Enc5KR9IpCF9AP8yP2+/BvFllqwaIH
	MbDwNbNiYw5tqqmVv8gl/jwrS8wswdGo5e4CH1lQolz4AR4e/MZnuY16xiyrVkBtAFmkpIORGhX
	EEXsn8wQF9am+cTKmWxyDO8PEFXrjuTX/hvNZwLiuueRMB8PrXptWsPmfgTLmB
X-Google-Smtp-Source: AGHT+IHciYLjfEru5jIntKmz+IlcCYn208iA7CXd8tNMDSBw5mXO3tJHz1jntfIlpMhCeSxWYUZMIg==
X-Received: by 2002:a05:6830:6e85:b0:7c7:6a56:cfb5 with SMTP id 46e09a7af769-7cac65f16f5mr870582a34.11.1765299924620;
        Tue, 09 Dec 2025 09:05:24 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:e3b0:13f2:d6fb:6f28? ([2600:8803:e7e4:500:e3b0:13f2:d6fb:6f28])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c95ac833d3sm12635774a34.17.2025.12.09.09.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 09:05:24 -0800 (PST)
Message-ID: <7aeab2a4-72d9-452f-af86-1e44d5133b67@baylibre.com>
Date: Tue, 9 Dec 2025 11:05:22 -0600
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/6] iio: core: Introduce cleanup.h support for mode
 locks
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Kurt Borja <kuurtb@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Benson Leung <bleung@chromium.org>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Gwendal Grignou <gwendal@chromium.org>,
 Shrikant Raskar <raskar.shree97@gmail.com>,
 Per-Daniel Olsson <perdaniel.olsson@axis.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Guenter Roeck <groeck@chromium.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
References: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com>
 <77ca77847511e67066a150096a7af2fb84f1f25f.camel@gmail.com>
 <CAHp75VdNjqZdy0+aSbBzn9CwEwHUhjwED+KRVqkdOMc_N+nX9w@mail.gmail.com>
 <20251206184645.51099254@jic23-huawei>
 <54483083c42cf7500239ebb7c0d32d25f11bb02f.camel@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <54483083c42cf7500239ebb7c0d32d25f11bb02f.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/9/25 4:34 AM, Nuno Sá wrote:
> On Sat, 2025-12-06 at 18:46 +0000, Jonathan Cameron wrote:
>> On Thu, 4 Dec 2025 17:07:28 +0200
>> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>>
>>> On Thu, Dec 4, 2025 at 4:35 PM Nuno Sá <noname.nuno@gmail.com> wrote:
>>>> On Wed, 2025-12-03 at 14:18 -0500, Kurt Borja wrote:  
>>>>>
>>>>> In a recent driver review discussion [1], Andy Shevchenko suggested we
>>>>> add cleanup.h support for the lock API:
>>>>>
>>>>>       iio_device_claim_{direct,buffer_mode}().  
>>>>
>>>> We already went this patch and then reverted it. I guess before we did not had
>>>> ACQUIRE() and ACQUIRE_ERR() but I'm not sure that makes it much better. Looking at the
>>>> last two patches on how we are handling the buffer mode stuff, I'm really not convinced...
>>>>
>>>> Also, I have doubts sparse can keep up with the __cleanup stuff so I'm not sure the
>>>> annotations much make sense if we go down this path. Unless we want to use both
>>>> approaches which is also questionable.  
>>>
>>> This, indeed, needs a (broader) discussion and I appreciate that Kurt
>>> sent this RFC. Jonathan, what's your thoughts?
>>
>> I was pretty heavily involved in discussions around ACQUIRE() and it's use
>> in CXL and runtime PM (though that's still evolving with Rafael trying
>> to improve the syntax a little).  As you might guess I did have this use
>> in mind during those discussions.
>>
>> As far as I know by avoiding the for loop complexity of the previous
>> try we made and looking (under the hood) like guard() it should be much
>> easier and safer to use.  Looking at this was on my list, so I'm very happy
>> to see this series from Kurt exploring how it would be done.
>>
>> Sparse wise there is no support for now for any of the cleanup.h magic
>> other than ignoring it.  That doesn't bother me that much though as these
>> macros create more or less hidden local variables that are hard to mess
>> with in incorrect ways.
>>
>> So in general I'm very much in favour of this for same reasons I jumped
>> in last time (which turned out to be premature!)
>>
>> This will be particularly useful in avoiding the need for helper functions
>> in otherwise simple code flows.
>>
> 
> Ok, it seems we are going down the path to introduce this again. I do agree the new ACQUIRE()
> macros make things better (btw, I would be in favor of something similar to pm runtime). Though
> I'm still a bit worried about the device lock helper (the iio_device_claim one). We went through
> some significant work in order to make mlock private (given historical abuse of it) and this
> is basically making it public again. So I would like to either think a bit harder to see if we
> can avoid it or just keep the code in patches 5 and 6 as is (even though the dance in there is
> really not pretty).
> 
> At the very least I would like to see a big, fat comment stating that lock is not to be randomly
> used by drivers to protect their own internal data structures and state.
> 
> - Nuno Sá

Due to the way that conditional guards only extend regular guards, I don't
think there is a way to not expose the basic mlock wrapper. So "don't use this
unless you really know what you are doing" docs seem like the best option.
