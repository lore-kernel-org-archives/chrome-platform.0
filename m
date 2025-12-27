Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472B2325734
	for <chrome-platform@lists.linux.dev>; Sat, 27 Dec 2025 17:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766858330; cv=none; b=aZdC7rxEbJccn5S8Qsslx7knMMqcq5EMjmO33FUaPh8GxtUH075jVc/CKTHzAeiOkECCHR1Q0nCLkriju3JzvP1UjQVFYHQTOCbCLRY4eKayKUNx9dgKuouUHYwQIBBhKAuwSve+beyyv3ZCPmLCa4MrdplOXDi6QxcevD9lh1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766858330; c=relaxed/simple;
	bh=unYrbs1T+wnAEQdMdfCauI1Sktq4y8Uw/FBTmPNJYzY=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=LqBcjBmkota1MZPHdOOoSZ5980kmjsTX1/d6dNPqnpDdA4mtjF2cNhKKH7glLfiwSHcQ1pLwOrwhKtuD7aKZ2zKJXRN1zLD3pGAKTyas2EVG25BQJMJhdZLfD+LHGGe4BdWh2oA8ppM77NTziqiFjnGJYHDKrHLT1V1hTj7m2FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIXwyfos; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIXwyfos"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-55b24eedd37so5730771e0c.0
        for <chrome-platform@lists.linux.dev>; Sat, 27 Dec 2025 09:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766858325; x=1767463125; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PQuMr6wBVUJuyrHrhYcC4MChvAIPzu2L1/FVbd0FA4=;
        b=TIXwyfosBWjVRk8PWlxXcec21h0g8cAWY5mmveX4vAe1VzduwXIepjGqMHkKyNNkqM
         O/GwOPSyw1PEhzxAIzIaJd97M/fhnBgTlVGJkVrRi2sqC+1FPoJt2O7e27AOywXRGpFy
         Z9T9KJcq0LjlRFa8Qp0blmmwBUW4mmyZItshZcf/qvXz3WFEwPM5sITiwXP3uMXhbDOl
         UGEjtt+J7rGo3GSeb9/9R3ZjbCv44zcOk/JgOtCC/TIlwGtaircT7anPO41gItUllqDv
         LKYY6Q3c2v5qMeURYPGVfj7Ui2782YgaH4u6deXhQ4Lds/fqCATIAWFnxmxEFBvKxZf8
         efzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766858325; x=1767463125;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3PQuMr6wBVUJuyrHrhYcC4MChvAIPzu2L1/FVbd0FA4=;
        b=sws3C906EkF63Od+aCTEkHjHjSriB2OyzQOtrnRZHI4zhLWGqJ7gR5Z69NnQ35pOJq
         +zvTKdFfqcskUhmAtUP0OKh31XtcrU5h9WfsF/FNCLuyOXc80+5+BZTUPcxeXrJx8b58
         gaEgDzCgVXUMJYUy6ZZJPPhWi4Oh/0FNXlIEIzpxuFBHuL6hxhqDEyURRJVPqxaKgUnw
         fJOsz52F4WWIlzYc9sQjU+XAD2jTafhZbTyPxII8TqUbluL6EOzcBBkM00VJwESQ67ne
         fRMwNnvfsqR73DfRwCnU5nMcyQzeXcJ9+pvDgKEnTZgouR85booK9QVjavtV5G+uEAc4
         2Jeg==
X-Forwarded-Encrypted: i=1; AJvYcCWJyNKawJptoGAkQOnq5I7eeBC9bMyjeIGR8g9gYxTSIPRaW63JEQI1PoZvzps1nFj5GksCqtT2vTOPgwdPRvc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwinKAdXjyO7BoJJaw2V4XWRbY9P9NUyB856N3LEijLG5Q62lmx
	nZKRxt8ynfNYwsE67F4IQ7mAVYbVD+KbeXBgc+wGTgrMZ46+CIYkQuac
X-Gm-Gg: AY/fxX52qa0hwf2WqUkD5EHOIqx60s0MTS6EFCpz5gyRWuJhs7bDJpJRbEDWoKEc2VD
	oyBHHXLEpaI8WXiLLSZZ0+rI8YTdinokHwKJggi1ws5GneHRMzIqdHyh5T2gkRGeuyN8bgCvPeB
	X4r8P/a+AQkjAt3NXoc/lbTUt/5oSnqcpl2Eb2eGGJsNFUDHQVDaQECqlzuh1Pu67btn0N1vtbf
	jhJKpMyexPh5F8c5oxGYmPA7mxgPcLdpWmLa2Zrh6VNr9Hz5W4rhyKW67TwRU42VgHmvB+CjoMq
	altdpS8OzYtfXePkQyR079YBKGqIWM00dsDzuJMXOXOBPM+hsNVhCWhoh1yV1Zcg9D8xXzH1+m9
	K0X+VY5b0YTyEqQh+Z/ui5K+jyqxi3rXEtbP5NPNlcqi/y9LFcQ9WnvFd9mGEbjpbqCPtQSk+0P
	ltuA==
X-Google-Smtp-Source: AGHT+IF5qieJEyZmb6QmnGjcQXf/tzE1xyqtk3YZirur3Xb0fzxTbnHNfA2HC5NRTch0STJMLcwhFw==
X-Received: by 2002:a05:6122:238c:b0:559:79d8:27a5 with SMTP id 71dfb90a1353d-5615bb9b5a0mr8288055e0c.0.1766858325180;
        Sat, 27 Dec 2025 09:58:45 -0800 (PST)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d165f2csm7886851e0c.20.2025.12.27.09.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 09:58:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Dec 2025 12:58:42 -0500
Message-Id: <DF97040MFVN2.18VE8M36CAX80@gmail.com>
From: "Kurt Borja" <kuurtb@gmail.com>
To: "David Lechner" <dlechner@baylibre.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Andy Shevchenko" <andriy.shevchenko@intel.com>,
 "Lars-Peter Clausen" <lars@metafoo.de>, "Michael Hennerich"
 <Michael.Hennerich@analog.com>, "Jonathan Cameron" <jic23@kernel.org>,
 "Benson Leung" <bleung@chromium.org>, "Antoniu Miclaus"
 <antoniu.miclaus@analog.com>, "Gwendal Grignou" <gwendal@chromium.org>,
 "Shrikant Raskar" <raskar.shree97@gmail.com>, "Per-Daniel Olsson"
 <perdaniel.olsson@axis.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Guenter Roeck" <groeck@chromium.org>, "Jonathan
 Cameron" <Jonathan.Cameron@huawei.com>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>
Subject: Re: [PATCH v2 2/7] iio: core: Refactor iio_device_claim_direct()
 implementation
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251211-lock-impr-v2-0-6fb47bdaaf24@gmail.com>
 <20251211-lock-impr-v2-2-6fb47bdaaf24@gmail.com>
 <6ad0f764-91f2-4946-81cd-9363ec87722a@baylibre.com>
In-Reply-To: <6ad0f764-91f2-4946-81cd-9363ec87722a@baylibre.com>

On Tue Dec 23, 2025 at 12:20 PM -05, David Lechner wrote:
> On 12/11/25 8:45 PM, Kurt Borja wrote:
>> In order to eventually unify the locking API, implement
>> iio_device_claim_direct() fully inline, with the use of
>> __iio_dev_mode_lock(), which takes care of sparse annotations.
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---

...

>> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
>> index aecda887d833..76398dbfa5ca 100644
>> --- a/include/linux/iio/iio.h
>> +++ b/include/linux/iio/iio.h
>> @@ -664,30 +664,42 @@ int iio_push_event(struct iio_dev *indio_dev, u64 =
ev_code, s64 timestamp);
>> =20
>>  void __iio_dev_mode_lock(struct iio_dev *indio_dev) __acquires(indio_de=
v);
>>  void __iio_dev_mode_unlock(struct iio_dev *indio_dev) __releases(indio_=
dev);
>> -bool __iio_device_claim_direct(struct iio_dev *indio_dev);
>> -void __iio_device_release_direct(struct iio_dev *indio_dev);
>> =20
>> -/*
>> - * Helper functions that allow claim and release of direct mode
>> - * in a fashion that doesn't generate many false positives from sparse.
>> - * Note this must remain static inline in the header so that sparse
>> - * can see the __acquire() marking. Revisit when sparse supports
>> - * __cond_acquires()
>
> I think we should leave a comment that says these functions need to stay
> as static inline so that sparse works. Although I'm wondering how sparse

I'll keep that part!

> could still work since __acquire() and __release() are removed here. IIRC
> it was a bit finicky about that.

Now __iio_dev_mode_{lock,unlock}() are declared with __acquires() and
__releases() tags. These are then used conditionally in
iio_device_claim_direct().

I did test every driver with `make C=3D2` and it seems to work in the same
way.

...

>> +/**
>> + * iio_device_release_direct - Releases claim on direct mode
>> + * @indio_dev:	the iio_dev associated with the device
>> + *
>> + * Release the claim. Device is no longer guaranteed to stay
>> + * in direct mode.
>> + *
>> + * Use with iio_device_claim_direct()
>> + */
>>  static inline void iio_device_release_direct(struct iio_dev *indio_dev)
>
> It could make more sense to make this:
>
> #define iio_device_release_direct __iio_dev_mode_unlock
>
> To make it clear that the auto cleanup functions that come later
> don't call iio_device_release_direct() but rather call
> __iio_dev_mode_unlock() directly.
>
> Otherwise, someone could be tempted to modify the iio_device_release_dire=
ct()
> function and the changes would not have an effect when auto cleanup is us=
ed.
>
> (Same applies to the release buffer mode function.)
>

Agree. I'll implement it like this.

--=20
 ~ Kurt
