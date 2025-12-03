Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86809255F3F
	for <chrome-platform@lists.linux.dev>; Wed,  3 Dec 2025 21:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764798620; cv=none; b=T16alVi9Y6cm/XMr9PHsZel/muiCOKjGzUvEwP4vRKrDz5JKi+eHv4wh1pWw1IXIBFgJdNwXEJse6gnIQKSqJQkDn0ClCvzHc5VnQvj54/UUOgQ7HS3ot8k7gl+CbbcasT6ZdDtqtNyeG2t6WpN9DgS9VgZAY/HcwraF53RW8CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764798620; c=relaxed/simple;
	bh=YgHZypyagJe1BCLcrMUNn/7Ro8RBkzNoa+EVq0F9gHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jgkCkeKjCYheWtIVdndoOpXgG6tArx+PF2wibH7mp7y6w1xfuZViWR4y1JoboLPSdCLgVI+JZ9cfrgqbMU6FWB8nC2GfqKmY30/FV3Uy3r2qdQ+nziVednr1+Wq8tlGkxX/G8tjeYTwKXuDjBLKxqdeTELJVgVZK6bJN11l0Kq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Dmkd1otU; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Dmkd1otU"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-65979e14157so71735eaf.3
        for <chrome-platform@lists.linux.dev>; Wed, 03 Dec 2025 13:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764798616; x=1765403416; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2aHgJcHMP1b26Of1JkY/qA3Wj2osFan8vLqjXrah45I=;
        b=Dmkd1otUQWS+BrbMhwde3enH/R6NXiYp285zFp0Nb4CKpIuNL0b29/J1is+c/98KZ5
         qSPYMLULg0Lk0fEpJ1yLeT0woNSORA+PkadLaEeh7Q8Mdfr2nA7IYS1tAOGX/kV+TI1L
         3vjtnlT8jd9L2ALaJevkZKyGLtYsDiWR4vFJqadyMpNMN3TXoN26QtNsUlBIkrgu8/Mv
         WDS9/RAka9cvCWELpDi7MpPeDQzlUaLPoeAC/i5vniIjWObmndCKveEObH4c4XurxdbC
         rPWcecv1PV0SgWSuvCqLbDQSreIyYjV6EXLo86tHdsUULfjpEbVj0UpHp/8oV8p7Oroy
         ew1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764798616; x=1765403416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2aHgJcHMP1b26Of1JkY/qA3Wj2osFan8vLqjXrah45I=;
        b=f9Ppkui/prVfLAc5o/oUxPZVHJdPLEfRIAt1XYcUznzIhmGj0vWojM7lmUl4GH79GY
         y7M93+O+k5BZ/dTKNsHMw608eZzaHQqQOJ93rxr4yxomIruasm2Hv8cCX4Wye1S2nTvx
         ag+L6+JNGnHLsXfDoO0cWNlVBliYTa7sGr3NO8qNZ6nXtqJhHr+rTQBY5Fr/6GW0qHvN
         GroZ9UmHK6AvrzG225HZ+tvXfoEvSIvm1oIFGaYlMNLRI0oJ9WvjJuYcj0csuR+ESseN
         OzSUsilb3AX08OIGqj+R12u+lIvJ2yLNE4eLqDeiMTxlnhYQwQakf39vXnLcK2aOZnXd
         RILQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKa5TMLUynJ/+OA0H19VN+J9zUbLfpvVCsem2PH4qei9iimTX051Xfhmo9NBnXhcrN7a4af2EiFG+JFU+Ap34=@lists.linux.dev
X-Gm-Message-State: AOJu0YxycmYk/vrJaEFXUdX0Is6j5gaCPVYN4NNavFTK9EffOdggQYqA
	GHgAoQArTQwZsGtvkRFIVS5naDHla917xBNWrmc1dsRWZinI3UGgj3pAColBLWZGU7M=
X-Gm-Gg: ASbGncuuxbb2HrMv66ICgKH5keoIffmSCvon3X811SrVCctglyDEXtwndxfxYlQpNu4
	P7j2vowQmHrp/H7QoUpNWcvpmBYYcFXQL1keS+W7FtZgrFamB/ZBiqNeExZvdKVNtv2n2z9RS9d
	2p4q2vFcDr7g4xWRFiHpNSapYVVz/Jin05swdqXblnOzur33HSSPbkcqL6T/zBbu6NwVzUmQ2tW
	MDX6XtMZvKhmz8YeL4/sv5ABFuQSZYbren8GdF+xA1/QkoF7ifm+BwkNW8uOJaTsOw9iqqoZ0nf
	bkIgHOkfnf4/eXQ842KaycG6JJCiMdjzjYZrIlyaf635/64q+jwgzVVOpccRBYB6h3NDtwE0/Az
	o993T5pO0iaXd9v4OpGg31HW6m26bpzbBBsZ4WE9PI9eCbgrdUMHFKcFjtibwqTWtoYuoGx0I6M
	bVJR/Y8yCO0FEJ8KU=
X-Google-Smtp-Source: AGHT+IFutLafJ3wb941bakA0AIIVuPFpUqb3HuvqoTC3uqOBylvA9l2fj9oSwy8CkX9eqOUervTgRg==
X-Received: by 2002:a05:6808:124e:b0:451:4c7e:4657 with SMTP id 5614622812f47-4536e41cf4amr2208801b6e.26.1764798616600;
        Wed, 03 Dec 2025 13:50:16 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:6b05:aad2:5053:6d1? ([2600:8803:e7e4:500:6b05:aad2:5053:6d1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3f0dcfdba71sm10902274fac.12.2025.12.03.13.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 13:50:16 -0800 (PST)
Message-ID: <40cd9574-ac26-45c9-91a4-b08ad799ca99@baylibre.com>
Date: Wed, 3 Dec 2025 15:50:14 -0600
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/6] iio: core: Match iio_device_claim_*() naming
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
 <20251203-lock-impr-v1-2-b4a1fd639423@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20251203-lock-impr-v1-2-b4a1fd639423@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/3/25 1:18 PM, Kurt Borja wrote:
> Rename iio_device_claim_buffer_mode() -> iio_device_claim_buffer() to
> match iio_device_claim_direct().
> 
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
If we decide to do this, I would squash this with the previous patch
to make a clean break of it. Although it is helpful to have "mode"
in the name if we can keep that without breaking things.


