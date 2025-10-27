Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329512877DE
	for <chrome-platform@lists.linux.dev>; Mon, 27 Oct 2025 14:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761577155; cv=none; b=F+rsgeiIQ3W5gV4jG6OkWLiLjnr7yVk6Frr57cNjPTnF2sMXa4qM9QPS8GKUNt4q/dAB+fV1pG1PvZn3YJnQRFpzP+f2KMkDmegO5tFEHIiL6vE3L1G4fPukPV4xoKtj7zqSdf78DuMitwG7b8K4ckWJNW7+jKeaKE/eR6nxZSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761577155; c=relaxed/simple;
	bh=7wL4+1onpcS68N8zd7qV0fUv0eIqqqeHEAHM6Nw9pSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p/RGxqbuYW8Xaa+6nqq65e9sx62/WqNNfgRcMC3YvPRhXeK4QgAU67czLU/XG1KkrD5DkZJiCJOlA28zIkDr91SGwCxoFZKwTuDAxytsLqmMlog0YpMgrjMP3PagoXE0TVtxASJCObnbE0+EJ1eT5F6PW0YCpc8mMKwNhP3dnxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UtXW5Imn; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UtXW5Imn"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-3d275090417so1375203fac.1
        for <chrome-platform@lists.linux.dev>; Mon, 27 Oct 2025 07:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761577152; x=1762181952; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=42PPEESTPRM1MqRXwgq0RfVuUgixMW7zVQ9CGj4vqjk=;
        b=UtXW5ImnOKDJ4QNXT4gxNzfkvaCdhr+y2rMFGAwVlye1AURPY6aXRcExuWNPMHci7G
         QtI3tt4quwKEQWbT7gz7bV08aeHZWUEoZP87pFBUYKvbk5fQG3Qg9EVXYQ8MlHctwlrq
         wKeu5lE3SdnMkEX0SPPhgTrJYqw5g0XVOaZHoGTeJBzDWbIWEYZQXFY+xIPhV01QHksa
         QjmVux1F7IrRAddJjnRYtBbAXRzbSQgUmZ1lKTgpoWgebcOia+1t5HhIAa9hVuoHdWlE
         hQ/vyUcmRDc9Vbkel+EEYpHNXEXmf99LXPnUnhBsgLVs1LSnjulOJ2wC61ks5NdT91NT
         pHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761577152; x=1762181952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=42PPEESTPRM1MqRXwgq0RfVuUgixMW7zVQ9CGj4vqjk=;
        b=DU4H/QlcaIjaszDFUxF4pLOxYgIQ0QP4MCoAdHYbvBhrpKC5mLtESBmA5k2SEj6Avr
         TlRjbPo05BMNqoko3vCjk96XE0KjMYwsBlfDnXms5Tosv1w4vx+3Q3d0gJucq3RZB/ce
         xejmUe776fD8pgOncOb7Tf8TGMLPQGt/a4nbOnGlgtyVi1h9EraWYaQFbF2v4q4zodvj
         AyDgHK1v/PrLjAbVALz+Uoj4AiHAXguWc3iwitkaLPSmHzwQhtgnWOnRveQwmHeT6Pbo
         Qatcfr4wdfd07mLVZGPLVPRhTE0yZY/k1mFQLXsVhU3tSHENN4hH51c0egXTp8S1Ev6e
         6l3A==
X-Forwarded-Encrypted: i=1; AJvYcCXB+oNsZYohkTSijmJu1ddl8G4yGaeJdKu05N2rRC6lGqAc23QC0lZG2xBucFAF4HwCr1NYIqVkIDMelyF8OsQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzENr/E1IhbqevRUjBIYovxUMHvafToQdwhSvxfsz3rRw/q4qaY
	lPoqlFIiJI79dEVlJgTug9DfFgfywaOCxlcj2+P8IP5tz9uDeB100JZlYNlar2X4bhY=
X-Gm-Gg: ASbGnctuirostWNhAUg3xr412n0QTPYxIfJKHU7LNSoINMWv10MmxH7e+Dv12WTYngL
	0f5eTRiBUGSmrEIr8alP84vE8OYjU5V+hcjTmXK/+Epr8Uyn8xktKZhJsWXovdga9BMUVWYCPwc
	prcuNrD7wqW0r5eFgPwK4zNYYsbpLOtfWfzfypne2w2kEcqy+Z2yhlP2lBMWPu+OzGDo08kpHRl
	kZACxU7vqnfCy5/q6Qqh7cLtrHF9DRhIExCF4pX4I6FIrO9VaWJT6u4kJ4Gf1je+HOihbWVl0ne
	3lVy9p1EQX2HJ2n2HQH1jF9kw8JitecmmQguzwI/tKWkEjgw/fuJeiBFl08KKNH0zeOzkUwkvzy
	LhzN4o//2aJ2vs3SROOjDXn0isVAE9QYdtjwvf9nK87/TAlOYYPoILP8IeUyyX/5Pw/C4Jcu151
	ph/bKDFqG673QnY9nkwTltZZ+ewPQrHGQyy3SqnyGTCi4SnZ4nXQ==
X-Google-Smtp-Source: AGHT+IHzuM7f2/mhqN6TNTjfjdCykv8WqRrQS182YAqAkII2xhAQD50KGvCHAYvbwychNayps4clAw==
X-Received: by 2002:a05:6871:ac0e:b0:343:13e4:9d3 with SMTP id 586e51a60fabf-3c98d18e2bdmr17563909fac.49.1761577152296;
        Mon, 27 Oct 2025 07:59:12 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:46d5:c880:64c8:f854? ([2600:8803:e7e4:500:46d5:c880:64c8:f854])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3d1e2c30b50sm2536302fac.11.2025.10.27.07.59.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 07:59:11 -0700 (PDT)
Message-ID: <66c8f410-6bba-41d2-88e2-46dbe133adaa@baylibre.com>
Date: Mon, 27 Oct 2025 09:59:10 -0500
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v1_2/6=5D_units=3A_Add_value_of_=CF=80_*_1?=
 =?UTF-8?B?MOKBuQ==?=
To: Jonathan Cameron <jic23@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
References: <20251027143850.2070427-1-andriy.shevchenko@linux.intel.com>
 <20251027143850.2070427-3-andriy.shevchenko@linux.intel.com>
 <20251027145213.7c93a3e2@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20251027145213.7c93a3e2@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/27/25 9:52 AM, Jonathan Cameron wrote:
> On Mon, 27 Oct 2025 15:34:51 +0100
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
>> There are a few drivers that want to have this value, and at least one
>> known to come soon. Let's define a value for them.
> 
> Is there any way we can make the x10^9 bit obvious in the naming?  Or do
> something a bit nasty like defining a macro along the lines of
> 
> PI(scale)?
> e.g. PI(NANO), PI(10000) 
> 
This was my first thought when looking at this as well.

Or something like PI_x10(6).
