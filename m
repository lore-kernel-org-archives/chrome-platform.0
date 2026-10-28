Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793168178;
	b=GEVZcRZNw08Gqs8cnaRb2404Gz69kwaQ1FFSPaFGZv5gWnAk4u4W9YXLs48l1M85XzzW
	 PITyGEdcEfG5/HjrH42H1rzJieSvNUKREeOWhb+nWqYaYjDP8KI+aPnZ9oat2JtQMj0fq
	 MqZOloalm+a0njdvyvGZs3Z5Ch7vMXAVxOgw8o4RKht0586tZ7LFSfKl94v+501oms9Tx
	 U7A3vwAqzZG6JKmVeoZtDnY5zLwyQHW7EJYCISXPUZwS+g6WU9cCdhfPkVYP/1A+N3NUC
	 OUyeNGoG2uywX1Pn8BxoxeIX1IFDbWbEnS404tnhTMl0Y9EwQqB+4MfVDUZIMrQRF2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793168178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=upb2yDjK+Sz2Or79oIRzVU6fGyWUl+WecZ9r73Zp7qs=;
	b=JhxN92oOsGQpDJcWDUncGN7qclMv62r+2bZPmxtuVj06RCrAYDyJDsAI5i9aAQDGYH2i
	 MnTBljoXfujmghKYnu6I4TuZwo9jsZ72gm7OY8Dpv/lii2CbDJ91+ribs2zK5agZrW46q
	 nmwZ86gu5ON436l3HzmXYz2VCe8gK5EYfvpUDTjbX0cKHzQDnvFQJ2D+2Xb7LY4ye+x6E
	 O2dXEwEoIZaw3nW5jvxTXuuAXrPEtI5T+7ay2QRN6tIh5HMH+MPNQP2iYLHp+XnIz8lgO
	 pdA7qNu8K+T0Hwp3qJmXaG0oidxtGY6GoXj6dyRfpqu+8y6QEdp3lcEWioEz7/VCPLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LCPU5rhj;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3396606A31D
	for <chrome-platform@lists.linux.dev>; Wed, 28 Oct 2026 06:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3396606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LCPU5rhj
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so652678e87.1
        for <chrome-platform@lists.linux.dev>; Tue, 27 Oct 2026 23:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793168176; x=1793772976; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=upb2yDjK+Sz2Or79oIRzVU6fGyWUl+WecZ9r73Zp7qs=;
        b=LCPU5rhj0hptuZOPcs6zWFQb6ttlTYaILXzeefPUMKG8xt2WIvKBRSHtiCoWwiKnO5
         hQuvn8d3JR8b0GSU3ZIb4ktISIq/5wrcTHVaJXWbgDRC14VvvSxYzd6r6Qm5tvT5VMH7
         3dWder7jJzxKxMfmCnHu3T9BF4NVOHaZ86M1q1wKhfCeaGWrlE1UiVY2JxKX2OqXgS8D
         M6ALI9oKx2AoDFREEGGQIVNIg9JiaOCF8ECeWRgHXSRL7mKOUaJ3aDjFONI4HQpT6dA9
         cHP+j+wzA1308NicTUe8s9QTsaLwVhqammiGGSTuGqm4kLvaEwV0MZSZZ4huw6d6v+o2
         EXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793168176; x=1793772976;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=upb2yDjK+Sz2Or79oIRzVU6fGyWUl+WecZ9r73Zp7qs=;
        b=q93pXB8hy1TakUfOP837uCXbJ0ObdVNaK32TGgz1hX9baZUI0rdqSpblxvp546NPua
         alaDOrxjQxaDrWDi76DO3BpnJGQvIf83OHIAZk1bQlq/QmmlhkJGlPfKebfbGr/2SEj1
         Jnken/8kYttUHXniHBp+yKtP5nPPIb9+P4tDY/C0+j13SK1cLnfg6/63D6w6VxTyKIxu
         zUPYSb7CAR6lJA+EGfFUYwVKnaBBCAj28LwzvS8pPOfQXIWvYIE5iMzG0EeHY2jETwRz
         jZo3tihuMqb3DG9lIjfenKDZjUT/Y7yxO2tK5nORtJnnwUXFCUnKiSAawB5XKxbW+AgS
         sguA==
X-Gm-Message-State: AFq9FYKDTWXLvOx2D+8uKUdjeAY73qpnwQ176+C0m075MnwNJIqVAWHO
	8oGpJqAzT2V9eauw9LimEnJOsWm6vXUPJvXjPiypX+MVj9ZFEV+LHxr9
X-Gm-Gg: AYBFou2auulDPxnEFdeSp9AV5nc71P6Zlp72pt3JWyynXGuhrftFIzXtPippAwnKh6K
	86oLPk7eENsPXJwMQuMuedQFXAr645L1ytFo8FYCD2crXJMVGnwGbyA2O1BqnRw5iYJaZXBKmbk
	dIaN1vLyHh9pB9AMpUJ3EEXn7ljAyllGYP22jYtUwKNqeYQMkjoqfTHrg9SjE/iMrp/LVPAiqN6
	S0X+3Q9MldshdVSzao4bDj+aBCv205ZFJ2LjSY6H+e2NprVIF/Nv8yqnrdBu9wJRKoCk5AcdJWg
	8/AWfEL1cMQodWibJCasbhVR/8emWfvJtwgJPyQilX7GljM1aixx8m8ciJDeDF1ngl+p+1YVufD
	Ev5LqeSIMmdM9Wrmftu4iWcWNX0/mQgCeFki6VRvge085OiyQCWAE5E0FAC84wsHXxiKTQ6GQNz
	10idviK6ijuowyAc01uUKf4bTtmcxvOWGMXB+VUP+nHRuHLo3mUMlm3XRpCMjdBwu9jk+f1cr4h
	9kaFdy5X59gdhUDM7kgOCA6gwJrLDtqD7uLHBQgcb8t9oMeVBICRZnIr86QhWDh4oEbUTSeAOEQ
	m8oFKDbQDKi8o/BXRzWJVRwiH1l7tdXHbiMNO7QdcvpBzJP5TJI73D5Wq2NKpP+Odgb55hJpCPu
	AfSs879AjYw==
X-Received: by 2002:a05:6512:3a82:b0:5be:4be3:bb8f with SMTP id 2adb3069b0e04-5bfcad787eamr578392e87.19.1793168175751;
        Tue, 27 Oct 2026 23:16:15 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca47f9f2sm400912e87.8.2026.10.27.23.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 23:16:14 -0700 (PDT)
Message-ID: <9e9a2f4b-b6d6-4faf-95f2-e227b41d27eb@gmail.com>
Date: Wed, 28 Oct 2026 08:16:11 +0200
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] iio: accel: kionix-kx022a: annotate the lock
 helpers
To: Rupesh Majhi <zoone.rupert@gmail.com>,
 Alex Lanzano <lanzano.alex@gmail.com>, Andy Shevchenko <andy@kernel.org>,
 Benson Leung <bleung@chromium.org>, David Lechner <dlechner@baylibre.com>,
 Guenter Roeck <groeck@chromium.org>, Jagath Jog J <jagathjog1996@gmail.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jinseob Kim <kimjinseob88@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Remi Buisson <remi.buisson@tdk.com>
Cc: chrome-platform@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Marco Elver <elver@google.com>, Bart Van Assche <bvanassche@acm.org>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
 <20261027124954.110697-5-zoone.rupert@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20261027124954.110697-5-zoone.rupert@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/10/2026 14:49, Rupesh Majhi wrote:
> kx022a_turn_off_lock() returns with data->mutex held when it succeeds,
> and kx022a_turn_on_unlock() releases it. Annotate both so context
> analysis follows the lock into the callers.
> 
> Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Thanks.

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
