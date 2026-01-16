Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF562566F7
	for <chrome-platform@lists.linux.dev>; Fri, 16 Jan 2026 21:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768600277; cv=none; b=Wf12LiDEmcwHJI31+1iIKb0jLxu6cnj9gRbFj1m16P8EfEje/sKzb1Tf7mo0ShbK5GHviBTWFnr68cyKwyW4ZBh3aEC+nxMkG+fx94FDz+75F1f7iZmTm/nj97GXUEsDxxe/P97wEY744n5gKef/muTuoAfnz6bwXCdCzQpx7fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768600277; c=relaxed/simple;
	bh=1ap1WGmCdUAfeAfA1Uj3FhkOVQp+SG6/lAV/o2C7jtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gmHcIKqLhABL9a+j84glgEwsL9tdmFEOts4oUGK46A0aDGqjFaXK4W6ZrQ0oLdhB1YfmuRXnl7Aj5Gf2LuurlRVgVPW5HYQ4r06mMmYckzFRhdtqUswnRwrGgoimArNvd6faHHpCATuW/lo4loe69ElKgOeTTFfY8r1iB2nFW/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HeYpELYq; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HeYpELYq"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-45c78da5936so1854783b6e.1
        for <chrome-platform@lists.linux.dev>; Fri, 16 Jan 2026 13:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768600273; x=1769205073; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l3940XG5D9uHiDmu72L1oryEY4P2+ezhQJ90ZGR7dK0=;
        b=HeYpELYqouRdm5tDL7NkavUuzq08rnlR6zg+su/Kg42ZODwL+Kmq3Rimn4f6S3d3zD
         K8f288BAEQg7NKLInbITEHSWK9plc9AiwWRemDOleflBN/6cQsGjuizaWS46F4zuD39m
         3hkSFJARgo02nas2TRcbiMsAnMnmek86LdD5B8WchP46qUVQTWUk6RpghAMKViGX/ejt
         CvNJhut/pTNfusvdj4cQQqIau5ci8d7S+m4mRf9Xt+bjkd5xAVWCDf0ax4lN3yaRLhHY
         9eX89mKU/8056Cycyq9uCPxPyNcuaYSGQJno+ePqYUP882qv6D5Td5n0JRckK4OS3He6
         p6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768600273; x=1769205073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3940XG5D9uHiDmu72L1oryEY4P2+ezhQJ90ZGR7dK0=;
        b=Px8YDfj4ejqKTyI3EG6H4JBvL/2yoXBP3m99hH84lNdaAnBQJwV19NFpf5vv2Ye56u
         4P2jKpfUV0VJ6WrYjCYH0GqGvzNEuBy1I3xhkRXXDGrkEgMkVlGHZTykdtJm2Pj82rBf
         fpvfmEmSb0GKj5MiE7Sv3oGqoUbGJEesXL8iSNP4d7VZrNJOX2IOmapCBctLvjEKSgas
         grDbYKCV2VhnoBFA8oI8Aru6pImsph6NNxmIg6jAd9jvICKi9LIjV956n2Z5pcNGD0WL
         R120BojndG5w5TNBWS136ADrstUStpEdsuwf+qyJ2FBnIWJujBFwEmKFkuuO67OZTDlA
         6Pjw==
X-Forwarded-Encrypted: i=1; AJvYcCXiSdMJlTxn+Aj0L/LBXRWHZS75NfrlRYazKU7pxW/+vTlqfDkY6X+wnvly9BwQrJrAN/pkJ1KxhDhS8yYB8Yc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyELoTp6yYaAudNRF9SaDnvys5yAHaUFxZG+EPb6/AhBQTqpCNT
	hnjsNN5bK9V2FA8XOfIAHdG5r1gtPiU8wVf5PCU5VeLOec3y33yh7b5KkrLV91Q22Uc=
X-Gm-Gg: AY/fxX4zbium3LMRmnAQscw19iIjDLUNi/ZEVVJ23TiDLI4GRkx1xt+Cb+I3E6TC3me
	LmFYEB9gHSXJO+G4s1N3eSFjn8p1CfG/2NsQQWh6ecW78d3M4yTpAjI+FrDyBqx6P65yFGIDYVV
	q6qZlV+zAXTnyU8SZWDVSiPoKidu35AUBc6rCeG1+uySDWnmwwkyEp6d/uleJcGO4qf2guN/9in
	pTXbSjDbAOTEe+xFskQsb1O/EtQwV3JS2BcfcuA76bBFJat89tveRy1xeDszIhQmyJvpx7bRmr5
	3Ei0nC1mqtluxJPuYEz8pePGbyNzZd+9nsDnqnOTgWUpfa+VoUSVC8Teh7bYJc3pnoyGpk0cpBX
	wRtiUY+3sltzuOTmTQhjJy5ipCggvvafxvl2wKnrAcNb8T8bxE4xARsDchC2s+qmRMJIKspeLmr
	AhvlE/86Ne5Yfjz+7FK0DKmKZcBceUS56DGSSnHcwAD8slWn8gbdJpYKCJFuoN
X-Received: by 2002:a05:6808:1903:b0:45a:58af:fed6 with SMTP id 5614622812f47-45c880fed55mr4136737b6e.17.1768600273578;
        Fri, 16 Jan 2026 13:51:13 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:bd39:740e:f70f:5f7d? ([2600:8803:e7e4:500:bd39:740e:f70f:5f7d])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45c9dbcdcd3sm2008795b6e.0.2026.01.16.13.51.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 13:51:13 -0800 (PST)
Message-ID: <5a953bf8-857e-4c67-be43-d60cc9b5a34c@baylibre.com>
Date: Fri, 16 Jan 2026 15:51:12 -0600
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] iio: core: Refactor iio_device_claim_direct()
 implementation
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
References: <20260106-lock-impr-v3-0-1db909b192c0@gmail.com>
 <20260106-lock-impr-v3-2-1db909b192c0@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260106-lock-impr-v3-2-1db909b192c0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/6/26 2:06 AM, Kurt Borja wrote:
> In order to eventually unify the locking API, implement
> iio_device_claim_direct() fully inline, with the use of
> __iio_dev_mode_lock(), which takes care of sparse annotations.
> 
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---

...

> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> index aecda887d833..3cf340208694 100644
> --- a/include/linux/iio/iio.h
> +++ b/include/linux/iio/iio.h
> @@ -664,31 +664,47 @@ int iio_push_event(struct iio_dev *indio_dev, u64 ev_code, s64 timestamp);
>  
>  void __iio_dev_mode_lock(struct iio_dev *indio_dev) __acquires(indio_dev);
>  void __iio_dev_mode_unlock(struct iio_dev *indio_dev) __releases(indio_dev);
> -bool __iio_device_claim_direct(struct iio_dev *indio_dev);
> -void __iio_device_release_direct(struct iio_dev *indio_dev);
>  
>  /*
>   * Helper functions that allow claim and release of direct mode
>   * in a fashion that doesn't generate many false positives from sparse.
>   * Note this must remain static inline in the header so that sparse
> - * can see the __acquire() marking. Revisit when sparse supports
> - * __cond_acquires()
> + * can see the __acquires() and __releases() markings.
> + */
> +
nit: I think "attributes" would be more technically correct than
"markings" (since we are touching this).
