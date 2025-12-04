Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A151833121D
	for <chrome-platform@lists.linux.dev>; Thu,  4 Dec 2025 14:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764858954; cv=none; b=tEGIbSXasVUCMLzGbS7kc17jwXngzRZLHc6THEdrDKbCyjWOIeyr/aNNrQcvcnEwtfHuO1y7Gqv3eSXFkULAUBxXKAGDeGAbTpVoqDk+7llm7HiVWvc6doCyi9n3BPF3M7Kbd7dzYPRKonRTP0JwQ3zk+LAGqRj1HbuVKyrhEJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764858954; c=relaxed/simple;
	bh=Hzz+mPxqldPjZ0UGeBzerpsI2NE9QERo1z4GmIcyRAs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=as143RV2RwnqBjyUn4q39GVGpqi/GXKIhuzNmzTWKDD4kqsXUscEpKc+NJW10c+Alb9OEID5/kKRq01kdJrgTFcI1WEjIN3P6B8Uo0r+zSySnpE29kwz/P6N01cXlin2uAmigyxBsO9nX/1NrCxHMkK54XxR9GS6CM2hDI3VczU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CL5ljUAU; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CL5ljUAU"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so9325775e9.1
        for <chrome-platform@lists.linux.dev>; Thu, 04 Dec 2025 06:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764858951; x=1765463751; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1Ns2EjNq5op1uWpU/IDU/iN5rRJVwaStIACnAldV00Y=;
        b=CL5ljUAUQn9wB8Iu/4rwB0RUwbBlPMxzVQ9jFLKK8lTEVmugAyuj7JDhJ1RPkxT35P
         Tt5uk/qog8wwVVVgg5uDl52ruVTtGQFM7EHpvWSyx+JqmaZcH5DfOL7aYJQOEErYxyR1
         0LskWHYIdT6ZWhXu74df7rdoYpcUWIQhd1GMciz6UNB3GOOYsx54FuQNxJD5j8So3QxY
         Job9Kmd3gQmfhyqvzRVrfvdWjDxLls9GfuI6qnfWFr67M8AIjuj9C7NX0BqKZ4zE2MOQ
         HPjSncSV4oJ9pXLEdAqjFF83DvarXBD0evfO0oxnkmFa4nhXkfnaFarZQVDw72BxdMQW
         ABSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764858951; x=1765463751;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ns2EjNq5op1uWpU/IDU/iN5rRJVwaStIACnAldV00Y=;
        b=xQSoeNZwI/8AHFRJ1RpcRurLXm3tThGzwQcKEmyxMB6ud0JQJ1c2EXbnZ0wPuy8Nm2
         QYVQfaJISI9Xk0rwHCe0foLCMwjAao0F7+azroZjPtxsRUCYX4ipn0pP7KloySmVKIgN
         78Y4LqYUsdml3/ixQhV3jjkRbyTsA6+lCmncL2LYm4hQ+Vi6z6SjqoawtTJ9Z/ix6bzs
         D2VZhHtcp//Cme+O4RQuM1AkUbDlq6AocWUvHadkF0eiawutPSjswSzVmdKhOW5lZejX
         THPXrdsMoGErr2C7CG7pPMtGDysDS1objh0gUe0G50UFaQNhA1A9qkTTe7FjawrRYk3j
         PB4Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6eVDs0gSpVIjsQiT1/rXnMCaijtrn9bAh1yht/ajZPP4T1fI/3DfX9hbDoxe0+9pH2Zfs4DzfIaLZIZ99DeM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOaeqosIiygIRCh6Yn6KqDau71cRjcHdtimee8TXGDuFPXam7Q
	b6PuhYO81lDxSWv0Orlbh+qL+nJw2a0vUz5C1y/rWkm/wJgCLWDJrG20
X-Gm-Gg: ASbGnctLkFsEurtjkuWPsQGvNtgTU56PacuwV1hh+M6JTrTUCb0K2li8sreGEEymJ/w
	GUzPouDspGGJJu8kwMX1LIY1Ixcx923DBOPWeqc3pB9n2NM2OQJNby/j/w4WJIfTiGvhECbXZif
	wlNVNncT8XQNljKr+OZvmIwHBcFxreYqfk9/3Q5wl4rMHRKoYgwcbu4rGAb4L1ZXGyj5+gWLAls
	CLG99bKiNVXC32KNuh9tho9abWPXjukKRxTJBxrE8wdm7ANYNU2g3DsxUw0ECdJr942H+/vSEiN
	sLMbXmi3AwYEBHGP8U0irZ7hfnhpnwiOQPkFDuOrLRIm4+pvCSTS4UFq6eZDbwHq6/+DVieSQnd
	zi6hi/rtJnPf//I/shJWPFbUteoC8NEbjsIUox0sHjvHFrAhJZExiyR1Zl77JkQql32oecy+tjM
	06LhG6E8YVsHP6ee1zr8o=
X-Google-Smtp-Source: AGHT+IG2seHuOWerjwXCdph63ZC8vZL+eIqVpQkFO/I0w+Uy389U61OmS2BgkM1euyc2+4rlvr7rWg==
X-Received: by 2002:a05:600c:4e8a:b0:477:9986:5e6b with SMTP id 5b1f17b1804b1-4792f395439mr23688625e9.28.1764858950670;
        Thu, 04 Dec 2025 06:35:50 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d22249esm3624680f8f.25.2025.12.04.06.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 06:35:50 -0800 (PST)
Message-ID: <77ca77847511e67066a150096a7af2fb84f1f25f.camel@gmail.com>
Subject: Re: [PATCH RFC 0/6] iio: core: Introduce cleanup.h support for mode
 locks
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Kurt Borja <kuurtb@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>,  Lars-Peter Clausen	 <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,  Jonathan Cameron	
 <jic23@kernel.org>, Benson Leung <bleung@chromium.org>, Antoniu Miclaus	
 <antoniu.miclaus@analog.com>, Gwendal Grignou <gwendal@chromium.org>, 
 Shrikant Raskar <raskar.shree97@gmail.com>, Per-Daniel Olsson
 <perdaniel.olsson@axis.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?=
	 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Guenter Roeck
	 <groeck@chromium.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Date: Thu, 04 Dec 2025 14:36:30 +0000
In-Reply-To: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com>
References: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2025-12-03 at 14:18 -0500, Kurt Borja wrote:
> Hi,
>=20
> In a recent driver review discussion [1], Andy Shevchenko suggested we
> add cleanup.h support for the lock API:
>=20
> 	iio_device_claim_{direct,buffer_mode}().

We already went this patch and then reverted it. I guess before we did not =
had
ACQUIRE() and ACQUIRE_ERR() but I'm not sure that makes it much better. Loo=
king at the
last two patches on how we are handling the buffer mode stuff, I'm really n=
ot convinced...

Also, I have doubts sparse can keep up with the __cleanup stuff so I'm not =
sure the
annotations much make sense if we go down this path. Unless we want to use =
both=C2=A0
approaches which is also questionable.

- Nuno S=C3=A1


