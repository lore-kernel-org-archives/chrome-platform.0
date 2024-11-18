Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19BB3BBF2
	for <chrome-platform@lists.linux.dev>; Mon, 18 Nov 2024 18:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731956338; cv=none; b=NlkErkA4kWb9633TdCJ06dnpursABTSsPfz2W7MmOkWKeATaj+z7qf5jOMXmV0FIJRGZKav2biaIix6SUxr0lnp6HehZEwGNjI4QwKyCq09BL6jCy6Y8Uz/WCqeDtjog42r4TclVLmVWvjDUR8bTqhtJPNga/S4bIJ1nFawT5I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731956338; c=relaxed/simple;
	bh=EEdfgCrwU+YBTP0tN0W6ct7VDKE9r0pzLwZJAowB+3g=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ejXGu9mQDseCwIwRZJlouELGSCoD2MkR+UXMh9lflYogpwqsJrBvV0PsliDflASOBcS2XyS4oQa2A1DkEb/zu1/nlP1rnquWQGIBMOidCteye5gNIL6tHj1vgEF0X38CSDMsdrXCZnjE1oxVb/YYuES1s9+582np6tanM7BKGXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/SsVY+m; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/SsVY+m"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e388d853727so1436339276.1
        for <chrome-platform@lists.linux.dev>; Mon, 18 Nov 2024 10:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731956335; x=1732561135; darn=lists.linux.dev;
        h=autocrypt:content-transfer-encoding:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1xx8riKZgtvjyHVja1tLoZeX4Tgbhp42y+TRwOglfSg=;
        b=F/SsVY+mkJ0KCgu8wgp9kPIynJochMBV0VCFa50D4taGT1CUZT5Z0IK2qSINCE8jIz
         C5dmtU7/d0eVzzDCwsuAPNPcHlMiaRhtzTA5+ihLDgqTmPIGGajtnO+E2Fv3Iv1MiuWr
         CdQTJO/RuUSsfMbL1YUD/WE9DOi8ZaMJ2lWE5k2dt3J4RxEBQN5vX7LlGFLu6Z38vLHe
         9SrtUJsuz31NQyB3u5rXCV+vJvohf5wq6yJcDuUH9UdONqm7x2MTLqBdLwdBwhoKgsAy
         eEO5q2hz/z6xNoeFg9Mf7zvfvBKkufjV2WhX9vPhKdsLF77x3P385JwyQtlPSYxzkl5Q
         OVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731956335; x=1732561135;
        h=autocrypt:content-transfer-encoding:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1xx8riKZgtvjyHVja1tLoZeX4Tgbhp42y+TRwOglfSg=;
        b=hUGeN2okmKGko3Ys7GqJMdyBn0lRz3LxkTHkLuSMNbHpbOulfXiOmz2dbqWe7ZLz/4
         QeI0piHKf1MgeOxL7dlmayF89NpdcJyDb/mf+pilxRFAflOHQ5xJGMxlENEfprHhvMso
         dg2yIL/5WBX7BZVzWI+La2UtazQolVkVTNaVpS4NIHudShIYNuxZQGIxsdsaQTrydQPi
         9RUsbTZcptkyDk8o3RRUnVwLh/lNxzGDNYn/PIVa3uwjsKPvjyACdVBAlmX+/Y7dFRVL
         Gq1Oq2DPuN7L494Jpfi7IIyz1zKgQ/9gU4IrUuc0/iNnUXovuKcKIP3VKvNddZFVcHKJ
         PK3g==
X-Forwarded-Encrypted: i=1; AJvYcCUgYtuuDkNvhoi/v9uqHPEmA7fId4ShBrP+PYRaJMtCghR7Ncz8ROmd4rtcHwitrnVwXpdzeeCHdQNECIBbLfQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZfE8eqISdlwmNEkfnCvMBWTHLtN+to+hfx+aJV6k7/W06ciEW
	p5OSqkKs3m5zuIXSCsOEt9uilnv820mf4hBL1kIXaacP6rvHDiap
X-Google-Smtp-Source: AGHT+IGRxxihYyb6PRdZ6g6/2QgAKE1bUsPBCAzX46sm9Zexxcd+vFv6xDTe56vleQarBlkuTu7p6Q==
X-Received: by 2002:a05:6902:2b91:b0:e28:a9d4:8328 with SMTP id 3f1490d57ef6-e38263bbbeamr10800023276.35.1731956335524;
        Mon, 18 Nov 2024 10:58:55 -0800 (PST)
Received: from [127.0.0.1] ([199.33.91.59])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e387e7e72b4sm1882743276.38.2024.11.18.10.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 10:58:54 -0800 (PST)
Date: Mon, 18 Nov 2024 12:58:52 -0600
From: Brandon Casey <drafnel@gmail.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
CC: bleung@chromium.org, chrome-platform@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_platform/chrome=3A_cros=5Fkb?= =?US-ASCII?Q?d=5Fled=5Fbacklight=3A_support_Google_Link?=
User-Agent: K-9 Mail for Android
In-Reply-To: <ZzW6mz9TGc8bglOi@google.com>
References: <20241113023800.6263-1-drafnel@gmail.com> <20241113023800.6263-2-drafnel@gmail.com> <ZzRLOmDCOrCa5DJW@google.com> <B7B50D15-7465-4370-8D82-47C75A16A3AC@gmail.com> <ZzVbbh86elpYQG5s@google.com> <439FC80F-141E-438A-B201-772C9509D048@gmail.com> <ZzW6mz9TGc8bglOi@google.com>
Message-ID: <EA9C2C4B-05C8-46D7-8B25-495377413347@gmail.com>
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

On November 14, 2024 2:53:47 AM CST, Tzung-Bi Shih <tzungbi@kernel=2Eorg> w=
rote:
>On Wed, Nov 13, 2024 at 10:38:36PM -0600, Brandon Casey wrote:

>> I can only assume that Google did not ever ship a firmware update
>> for Link that included that patch=2E I believe this device has all
>> ChromeOS updates applied, so it represents a stock
>> system, though no longer supported, and aside from being in
>> developer mode and having a Linux partition=2E

>Please try to wrap your message to fit to 80-column=2E  See [2]=2E

Sorry about that=2E I didn't realize my email client was doing that=2E

>> Is there any reason why we shouldn't do the same thing here for the=20
>> keyboard backlight that was done in drivers/platform/chrome/chromeos_ac=
pi=2Ec
>> and support both the legacy ID and the official ACPI ID? I see your
>> commit 703e77134 which added GOOG0016 in addition to GGL0001=2E
>
>- The most important reason: "GGL0002" is assigned to other purpose=2E

Ah, so this seems to be the crux of it :-(

>- For some reason, your machine is using a quite old firmware=2E  It make=
s
>  less sense to me for supporting a should-be-deprecated PNP ID by [1]=2E

You seem to be suggesting that my machine is in some odd/abnormal state=2E
Do you know whether Google has actually ever pushed an updated firmware
for this device (LINK) that included the patch referenced in [1]? If not, =
then
shouldn't my machine be considered to be in the "normal" state, not the
oddity?

-Brandon
