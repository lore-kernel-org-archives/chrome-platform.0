Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927473254B2
	for <chrome-platform@lists.linux.dev>; Sun, 17 May 2026 19:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779045729; cv=none; b=MBbMtoPN0ApelLC3g3yz8VHvcqrNY8W/RldjwjXqqHPZ7cE/s8N6jvNv65OGFd1v2WVtB+jyk7di6rU2DsAq7qNd3fVjxCDAgGW3afwfDPoWDmOEbAC+lwYKr6SDxt0X4POE20mXyA1c/VQpNbi1CtljW2aWzpwymvIBNf6Y0bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779045729; c=relaxed/simple;
	bh=6F4HRBnD1ijw9LojF5iljzN3VgqrvJ5ysiNE+lXRJWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jLtdkc/oFlq930/misTF3iCj9RVcIp6Qus4UPe37qrc5l3KWfQhRrq8wlSoMb1u4NRh9mHMMa/RaJaq0Y9njFD38hsTabG68/WJCRMQ38pRPh6PRsyUMN2DreLnnUsxrOtncdqj4eEL8Lqne+3YCp/ub0HtcB8+MM2DEkFYpEPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=AmnX8Wu1; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="AmnX8Wu1"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7de7c57b52cso1562296a34.3
        for <chrome-platform@lists.linux.dev>; Sun, 17 May 2026 12:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779045726; x=1779650526; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t8oeugrZbzajef/1vQAam9ttn87tFGEQi6JKVNWh+g0=;
        b=AmnX8Wu1gV8kk9EtI0Kx490exuTyLu+NWx0nk/GjenGqQDi89nUDQeSxss3da9ePzj
         MZiR4GeLr77HsbilKuulrpnwqSNOlKkxxYRnR6XZytx9F0bkmODqkDlHHlZF0MFWrP6n
         7r3IEelBnOkbEwHar7BHidDBbegzCVcc7sYyVeQsI0A8xcThkpnigZD61HZhdmbSw5Zp
         wx6RLB6U1Iw+U3CNLMouwTXAlP+UCH996KT5+U8S96nnMT7nVbBbHo0rQXtm9UYAlpSX
         LM81nyRcwUDo27SECtRAzLbH2PjeaKcycwE+GYvcjKku1VOgjOy5lGhF3ecRHbM4JI5L
         K5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779045726; x=1779650526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t8oeugrZbzajef/1vQAam9ttn87tFGEQi6JKVNWh+g0=;
        b=lPHhB8oRwwT8IAL7WGRQxnSphdGlOnaFbOcyl1X7v6jD9fS+zoKcE3JVjc7HurmPiE
         O84fhhS9NTwIbrazeedJm93hycQ2G2E6aefrpMrZYCH2TMqP0JCSU7g006G3U2Bi4cDT
         /7lw9vDemX1L4WpHMnavTZJDLiiXaib2569FCgVrdNMsA762HNouyc1lTsHpiFjP0V1z
         mvxxza4zgNCXStC+Rs1kzgxzNqkZhOzy9ahwTfPR8xy5NKhTlCYm0T/i+bswk7D8Ytbm
         YFvcJUk8eE50I4TVTGf/v+CeAkTWPJOMGZ0yaseN3xSsFPKimTWkYgTPd1gys8mbUaXy
         njXA==
X-Forwarded-Encrypted: i=1; AFNElJ8q5nxLtH9RmZubGvO0akeeqS5OV0nKB3TL1LurmlSkzGvkzwkMVszUVHctneIkeP00laI7k7I9CbKx57rqeRQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5Q1lXFBW2unpI2dbONrXp+z32BHa2Ma/1chCNZkOI04vsvTBb
	OGM/9B1SrlUzRN9L/wVwEuKvROz0msxclpsxiIPxo06waL7Gd+hYMushQZhmoBOV2mI=
X-Gm-Gg: Acq92OEvdDbvOHvkxzva/RhXOREHwht90PhtYrEyDAyOjX0kMY92/asPUrznsQQJXga
	S1KdCxn6G39VAywYiDYnijRRVbdQUq/n8a1yGHLIbDV11R8uHOzQCDbkGn49ezkc8CgWNyGhU8b
	fSHw7I8StHwfsvYiRfAmiry69IfEMGJxeessKHGaf251qGljQ0koaMcACjPRKOeVSZx+KKiAAu4
	bXtt2tA5RIt/euBRxDnxmxrMFuCA23hb2rGglFCHTnrufJMKHGa5UME4LPOMvdNtHAav/HopKzF
	tzzJdEtZpTm+3KySQIi/K0AP5dn05qsosqy6qa8lPhLD5WD0E7UF33COhgiDawaVQ21g/c69l43
	vMPC2/N6HroXdWhL6ihMMwvBpqxqPoLRagZsNs8p4swJMMotd+suMZDlV5Yv0W6QxiDuEaeycQu
	gUoINPK4t+PgYHKpZsAhefAPsIHg7fFq3AbI3KqK/CZZGltshIto4XLYiP18W1h3yMzbIehj3An
	cEiwbyRug==
X-Received: by 2002:a05:6830:628a:b0:7e3:d199:3164 with SMTP id 46e09a7af769-7e4f2aa4df0mr8632934a34.11.1779045726420;
        Sun, 17 May 2026 12:22:06 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:7a4b:ddf0:f61:f58d? ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e55bbd10aesm6121272a34.18.2026.05.17.12.22.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 12:22:04 -0700 (PDT)
Message-ID: <83c11e2c-9688-4cc9-b7ee-6380de30fb58@baylibre.com>
Date: Sun, 17 May 2026 14:22:03 -0500
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] iio: timestamp declaration cleanup
To: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev
References: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260517-iio-timestamp-cleanup-v1-0-61fb908c11c7@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/17/26 1:17 PM, David Lechner wrote:
> While looking around the code, I noticed that there are a lot of places
> were we are manually filling all of the fields of an IIO timestamp.
> 
> This is error-prone (as seen in the first patch) and more verbose than
> it needs to be.
> 
> I went with the approach of using the existing IIO_CHAN_SOFT_TIMESTAMP()
> macro for doing a struct assignment. This does require a cast, which
> makes it a bit more verbose, but we were already doing that in to
> drivers, so I went with it anyway.
> 
> If we want to consider alternatives, we could make a iio helper function
> or macro like the first and second patches did.
> 
I should have looked harder for existing alternatives. Just found one
more that avoids the cast via a local variable (in ad4170-4.c):

	/* Add timestamp channel */
	struct iio_chan_spec ts_chan = IIO_CHAN_SOFT_TIMESTAMP(chan_num);

	st->chans[chan_num] = ts_chan;

And similar code is found in ad7192.c.

