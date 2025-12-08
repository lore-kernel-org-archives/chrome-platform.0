Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9F72D0C82
	for <chrome-platform@lists.linux.dev>; Mon,  8 Dec 2025 08:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765181049; cv=none; b=EznRG+FkhFVt1UXrz0JXssnRLyRlGSXTdRoUXAOUok1CTR9tensJfDBxZ2Co/8bjl37fUnpFWP01DYpfACS3B2X+sdi3LAuVsle9lQNEAvBb9fQRxO5kj2/Tm1hz88Ma7NSEXbIWEe+T5gAxpfh/KE0WGt3HunvSln63MDgx6CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765181049; c=relaxed/simple;
	bh=LcIjzS/QX9OdfzWd7S5fStct/j5BiQOmeNhDz/vl8LE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bIAYadlyyE6+2TUfjOp8sjNuhSPmIe0kNop9txT7xxCWiuO9KuGto5pkEc7my2HAOih947k6ATteR1cMt6PSI1sWHh0D6wYstJx6R+8X0HTK7DDa4cPxy1HTSzLXwZOA0zBLePaa5Xz1m6JIG8+P6Ma6ww5yz1twOR8FC6kXdOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jcp8ZR6L; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jcp8ZR6L"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5959b2f3fc9so4300341e87.2
        for <chrome-platform@lists.linux.dev>; Mon, 08 Dec 2025 00:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765181045; x=1765785845; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0+tebP17XJiSVpHNLRMqnpjIXpj4TNVdcjDVZw4M8+c=;
        b=Jcp8ZR6L0V1PwZpCZ+9CA1hskSfeJ7ACY4QdYff0DmpktMn7ngK0MBb1lzzX0HMjch
         9jufzpQwBIJWq7r8v/aoBzqVXM+ktjGqLEfCAyxOa77aC1POJf9mhKx8+6g27qVO6NgF
         77KDdX5225mIWgb/XCyCgIB90j3jKdtD5/7uDYqi9rLz52U3t0XUpDqGyLYzK2Sg0w4j
         q1UTAkCMRnPZ8QfMFsKgvNWQiCDxwXvwpbzUGk7bXKmQcwzH/Rm7lvaTMUVWBDECvQ2O
         yLjQfyryKYtdkKHp33lY+Lcfxl8r2lbEKmXzvdF0YO0zTuSwh2HRWVRzXoZXgfFyAl4G
         ncXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765181045; x=1765785845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+tebP17XJiSVpHNLRMqnpjIXpj4TNVdcjDVZw4M8+c=;
        b=ThgQvvoYXA9PUlAiIDVFyxxsG3sy6KkQxrIWWerLfXwzFshAvs45XGfxFhcFMEvKtK
         0YBom2Cc2HRafOY5js6O5y53MUzUAD8QKAgoXMiPJMQZR+w3+dg4DQZXAtIIaph1aJmo
         ExZXHQJHsNc/5rVL/hyBJGwM90gzAmKprE5PlMUdApe33XjD25OKnhlUJBsTZ7r1mA1T
         SYOYiRgwZq9eiIXBPWHRLcByylyIsVl4orC+KNzeC3p136KBglS39hiTAkfXsmo81pYi
         r9jGk20YqcM3ZnXksEVf9zsP3DerEUS37CwaJBcgTXsPJTrJ56APswp0uj0KDMJz5ERs
         0gOA==
X-Forwarded-Encrypted: i=1; AJvYcCWlrPQ7yS+LqSnLEbRIWJFcvPyJ3Fj8jpkxJZM/tzadIa8Fuugto8795EdvGHYLXYEKVRuJTekJM1nksMKIDu0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6ZUE+dMTOf7GeG4k1TNLTfg39Gam9wsv8VqijMdbNQfGTNirD
	XSrthuH8K/HbtVWW/PT+uEsMsh5h4spk4Mo80MTcJCLZ3H4KXxkX7Wk1
X-Gm-Gg: ASbGncvWm05nOor/PiwvOpmbJLL/ErMeBbafqzWfoxaQz9CCAllXnV6msrwE5H5BAKO
	2s6YIFOQmkR6sB4RQhZpq6lOMRKFsdTrve3JTLfDr3PiIlTUXJ8HiK4KITxfaLYIMHm/BPEs1bT
	RhguhqqWn1YcF9XuXDcoS97d/4tF13Mb4Y0ElAYcb7BNdLB8iwj9n6wl8TklDI8JDd8aqhYCZFm
	+Yvjb66DuXD48hKRFsbCjxgGn97sDnoTuVKpKkLEBQQMu3XzwlLFadsE8gBb/a/Dz+4fa97+vm+
	67iCaXEwhfozT6N3/n7F8M1i6XenwKL+kVRkfSyuWU1KhDK77sjFaqLDMHzpyukwVwjOXT222Pl
	SPSz/41QFOiYVr79SIlC+B6AEj+iNddIw6zExl3Q9Y4yy/cyfULcT+1ZNIg9rSDY3SvdjEYugyT
	TXc/zLtiVIV/zZxRJgvpXWtCmDsTT6hEpU+XCpkXku2oBEHue47d8pNQXwM7AHNgQ2B6z2O/Lgm
	lNqk+c=
X-Google-Smtp-Source: AGHT+IEtsjzvo2jB+dbI9VQ7yZrjbx6yvK3VRttDJmqZME09yWJ/CiejjRuxkvbF6yvGpf9tC/V6mQ==
X-Received: by 2002:a05:6512:104f:b0:592:fb5d:6300 with SMTP id 2adb3069b0e04-5987e88bb77mr1971804e87.10.1765181045203;
        Mon, 08 Dec 2025 00:04:05 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e2b7sm3942418e87.51.2025.12.08.00.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 00:04:04 -0800 (PST)
Message-ID: <bcbe66b0-23bc-4ba1-93ab-f2c09262e07b@gmail.com>
Date: Mon, 8 Dec 2025 10:04:03 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kconfig dangling references (BZ 216748)
To: Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>, andrew.jones@linux.dev, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-sound@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-mips@vger.kernel.org, asahi@lists.linux.dev,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Paul Kocialkowski <paulk@sys-base.io>, chrome-platform@lists.linux.dev,
 Paul Cercueil <paul@crapouillou.net>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-gpio@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Cameron <jic23@kernel.org>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>, linux-sh@vger.kernel.org,
 x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2025 04:04, Randy Dunlap wrote:
> from  https://bugzilla.kernel.org/show_bug.cgi?id=216748
> 
> The bugzilla entry includes a Perl script and a shell script.
> This is the edited result of running them (I removed some entries that were noise).
> 
> I'll try to Cc: all of the relevant mailing lists or individuals.
> 

Thanks Randy! This is good.

> TEST_KUNIT_DEVICE_HELPERS ---
> drivers/iio/test/Kconfig:11:	select TEST_KUNIT_DEVICE_HELPERS
This is a config for stuff that never went upstream. It was replaced by 
more sophisticated kunit_device, which I believe is behind the 
'CONFIG_KUNIT'. So, this should be dropped, thanks!

Yours,
	-- Matti

---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
