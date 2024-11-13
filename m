Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB87442AA9
	for <chrome-platform@lists.linux.dev>; Wed, 13 Nov 2024 08:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731487502; cv=none; b=QRcoQSkdl4WxIocmitD5MFU0eMJyXIdo3dGbrvnBf9I1zglK8itVfNzUIBANGrsyBVRKLtoKo+ghHvpMnjuSQsodCK81huGH5upsJNKJCElanKsnlfOVqq0En7HZDVy7DKtpc9lQNGagVqwjL855T1GgERJJ3g8SRkE9moRQP3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731487502; c=relaxed/simple;
	bh=HLab2BZURmDBUSAGkqL/3RliVrtngSyifO4tFITnwTM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ZI+TEiTLyYT+89vuVReSSbxlQgouDzhT/dZFJhXNzmlEB/c0FjACuJSwLvPqUTwDCElqJQphqe78D8f5B1u3nDxEPsenYDW2Khf1HvurdKVcCHLbMSv9Odff74OarY2x6qElFnywXGJIhhizKJIKZapx6HNoBDt1UefyELK5VPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhvgCp1G; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhvgCp1G"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6ea5b97e31cso4123707b3.1
        for <chrome-platform@lists.linux.dev>; Wed, 13 Nov 2024 00:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731487500; x=1732092300; darn=lists.linux.dev;
        h=autocrypt:content-transfer-encoding:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mhXwOd5X60HmPHKcH0KWOK6X5sCayRo6azjgIio8BHA=;
        b=DhvgCp1G3JLAw8uP2Ke9aViU7iKFr1fIX8AdNwBUTUS+GpOxPB9z5DnA72puPK7sMW
         BzPVq+CMfQBCXph1VBTJzsW/s/HBaw5hfqFh+IqU7NG2YyqK6ACkWrGrPk8anz5lUNxY
         DRLQPadORIjh8Wsq3En0zai/IctOQwvwujyPm7jIjjLvNm2ZRgqt70C5mqYXJ8A8p3p8
         5SnTep+DDR0hs6gdVyXaexHLhYp+v2i9AMnHO5SZIRUVTkgchoTvAMROcSbSZSNtziqf
         GG/KPZ+mlg8RUVS8QIBg5pnrjs+SKDcKZRh71OBw5CbLC0jOQK0qLDBW2gZ5QCRN42cL
         yq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731487500; x=1732092300;
        h=autocrypt:content-transfer-encoding:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mhXwOd5X60HmPHKcH0KWOK6X5sCayRo6azjgIio8BHA=;
        b=lJPrStqU9GG3uYvKQZHNWoC0OnAIjtXcd2XEg3v659aUJ7oyhloT0jO2hPXsqb1lRB
         a5z8ixx0TilBymfNKsNJ5VC5xTqt/lFB8+WCEsJmpLTYRaJgblsIuNZZGHhd3WQlTf0k
         9FOcFwLpLQaZK5lM8mgzzqjXRNrF539IdnH4P12lPra+9VSIIqSwA/4lssuiZzRCgutP
         fE1QvT4gZJglAfaehtdx9VzDrnG/Ub6DSGjfxRIHgsefFS/JXu3YlVx5OIfAAdA7N1G8
         3utORMaJsPZpgIkUTyPB7Jl8ZksY9JjgM513JMxOgfodi7vXTuklwapSNWVysMqPANR0
         UDJw==
X-Forwarded-Encrypted: i=1; AJvYcCWnYjALgr+M7c9N5d9hnYpf37XiBqdEkZ32aRBQjMNv6ZodIl4MrJCo9SqLd/fktyYWIqOjFBrZ/1JHpLp2mhQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx88q0O2eEts8UPlpLIJqn1/FwedJau5fd6qrVDFA84rFxus7e3
	sgOx5VTb17sOqs/GKsE+oz9TBeYv7mUavaENMsiY7JDnaT3q+UsZ
X-Google-Smtp-Source: AGHT+IHAMUZL8qwGJVQsUJx2oq4mlepOdXz5fH3SBs+/OrEVg3ieB09gGGrgpb8gY4OOnrelauXquw==
X-Received: by 2002:a05:690c:490b:b0:652:e900:550a with SMTP id 00721157ae682-6eade53198dmr160147037b3.19.1731487498163;
        Wed, 13 Nov 2024 00:44:58 -0800 (PST)
Received: from ?IPv6:::1? ([2600:1700:3031:b410:84d9:b053:85ab:94b7])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eace8f099csm30003637b3.48.2024.11.13.00.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 00:44:57 -0800 (PST)
Date: Wed, 13 Nov 2024 02:44:55 -0600
From: Brandon Casey <drafnel@gmail.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
CC: bleung@chromium.org, chrome-platform@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_platform/chrome=3A_cros=5Fkb?= =?US-ASCII?Q?d=5Fled=5Fbacklight=3A_support_Google_Link?=
User-Agent: K-9 Mail for Android
In-Reply-To: <ZzRLOmDCOrCa5DJW@google.com>
References: <20241113023800.6263-1-drafnel@gmail.com> <20241113023800.6263-2-drafnel@gmail.com> <ZzRLOmDCOrCa5DJW@google.com>
Message-ID: <B7B50D15-7465-4370-8D82-47C75A16A3AC@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Autocrypt: addr=drafnel@gmail.com; prefer-encrypt=mutual; keydata=
 mQENBE42B1kBCADosD8+3gzyAVveakKoT7YFFTpFKzztL3XJYXmOAJYqqKMh8HVaWH1gnVHFa7Kn
 5kCwQFd9bibmiBo8UCiytwtjZ3217wKUepeYgziVw83u8n9WZmf5nfMR9ero18vEStyWXNBlEbWn
 IPxXVeCL0v0gFXdWAGQCTYgKYvXCdKz6xO5y0jvOyZPZiPxSVVARAsnBWAqf8/jC3ovHfb42Vy/p
 qFyodmCAHvTVYBCfeHGE4OCJkzZsKMo8aqfxUrQQf1/dZ6cSWJhf3JXGAFfAyqC5m/bnBswAi6nk
 WEyKZ0ZvnlVmBL+twUcx6Y7pwbSscsuD6++iV6jrtVcTYyemb3p1ABEBAAG0IUJyYW5kb24gQ2Fz
 ZXkgPGRyYWZuZWxAZ21haWwuY29tPokBOAQTAQIAIgUCTjYHWQIbAwYLCQgHAwIGFQgCCQoLBBYC
 AwECHgECF4AACgkQCsrjhT7ds2fmqgf+I5yO5Xr/F321B9i8TzIH301wph/Sr0/ztAtOeTe9FwvR
 HtaLWCzy3HN0avj53U0hcECRfyhn2HYpecMTJKp4hTdB24DQV9gTAkMjCW1N0WVodtP7BMGcz9nt
 X5QEjKvsaz86aM6vBaAvUpPl0QYB/XNu9ikQwsvT22uOhk0/gS6rQpAfjFC3bIQDTVXDXxjvUn6V
 X/qUfI6OGSW7nRqvR4MKZLpa7m9SoXMTBWGd6TcTNKrVmwMXId5WhwGanWMZNrM7jSTjClzq5ARX
 LZtPeULLgoMT19ew9TPIhfse01ZrNi//q4rLT6apdi8iuqcB22vLKdpqqZtU+vGcSLVU0bkBDQRO
 NgdZAQgA0bAkxJJb4vqB85Flv7l2HHPSv8udhg8lX8OkZ2Za7lk/cK64WPdeaRhQAburKw7cWgE1
 2CCd4f2jppx2DepH2YrWeLpoVJp/DthrfM8MBCHBQQWufU6+QuDLFvU6RBsDNbwXVzowJdfnyDUv
 TerI7KsbFnyUdqPBxCUk9yu8jnlu6PX5xkv2/lebWBi/A9Dt0r7juof1FgttBBWXcZVjANua4TC/
 pFlfGSGgWHMoG9qILaP6SNcz1WEVbOGFg8WvLtIgeHmfggWpIWvWbPUR+VNT54A6tWv/lDbHP/b0
 wpRqAMy6ngyLSgriEBusSE/mtaED+xZO9v38wbIxc2JZAQARAQABiQEfBBgBAgAJBQJONgdZAhsM
 AAoJEArK44U+3bNnFVkH/iPcxPLSAaejkFYQPpl/F+sKJifzA3N/FO8JzSw3lH0NN9ov4GVztEGq
 86Li3ivP8bNjyasf6q5pO7fc/nn4ga7MF3my7XHqpwAMSQfzA+IpISazlOMGO5aOtsF66o8Mi0gP
 QobQhVtq+MfGIwowe1kNq4XWf81Ybcin9JcgILrnRy+J6lmfSTJVapg3ae42nJ4ExPf2HL14mSnv
 h+nE00xjnB2yrSyeSM41N+12zLh/w+WGGunjsy5hfAzdLgjalXdRQhM3G7chGRfLnQmYvl7Vj/+v
 j3gBDGEiFW8qfujnjkPJi8LN6gFg9hIefOxeKQcfK5Djhm6HJMLMFosqeNg=



On November 13, 2024 12:46:18 AM CST, Tzung-Bi Shih <tzungbi@kernel=2Eorg>=
 wrote:
>On Tue, Nov 12, 2024 at 08:29:05PM -0600, Brandon Casey wrote:
>> On the Google Pixel chromebook (aka Google Link), the keyboard led
>> backlight has the ACPI device id "GGL0002"=2E  Let's add it to the
>> configuration array=2E
>
>Why it can't be matched by "GOOG0002"? [1]=20

I'm not sure I understand this question=2E On my device the backlight has =
ACPI id "GGL0002", not "GOOG0002"?

>Have you tried to update your AP firmware?

I have not explicitly updated any firmware=2E It has whatever firmware Chr=
omeos has installed=2E

-Brandon
