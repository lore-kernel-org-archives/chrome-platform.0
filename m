Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBF015C14B
	for <chrome-platform@lists.linux.dev>; Thu, 14 Nov 2024 04:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731559122; cv=none; b=dCJr4HWcjW4AUnOHVy35/4rvTkCGWD5ZqcbhJDySIFcR7tD7vw8zVEJvdFZZdk+ZnBqAobUXe3/3ftloFah+/3EEArZjfoDWEgFRKFLSn/6ACMTIFTDcXwGTtU1ExkAy68sJqzImMxwNkNCzYKEOOMJU96isUeCJD3PBgxV5IPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731559122; c=relaxed/simple;
	bh=KrECHCN57Uje1vrFO67HE1DC1Xmmx2gntpXyCHCrYaE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=YQYDsQfI7hF/aDOr0rpmENtfVYppQKY4briTlxJ9Jdmyccx2m42MO5hFpLpWFsbjq+YJukcN2c9iiwJT0qp7p6CayFF/sEO6bixC2kKhYep7AoK0LH5Ov5WqsDL/hLohOtqnsSOuGDAbbVRKsUcqgBw2+XPwKw6fjIhEfJzd5Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9x4wohY; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9x4wohY"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7180bd5b79dso80689a34.2
        for <chrome-platform@lists.linux.dev>; Wed, 13 Nov 2024 20:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731559120; x=1732163920; darn=lists.linux.dev;
        h=autocrypt:content-transfer-encoding:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1hjtcyRCyAV5gy419UlFdW2e5MCQYCiKnBPOORr2yqY=;
        b=h9x4wohYmoHZutGemejvC8AjtSj2LUHshtmI0J28MCT7vWvPZNDlRoqaZI+7DOy3PB
         ySmnziBGmrr28L3OBUvcZrhE5m7c+rffGYKyT9G7ffw0vrMFXkpvx0lkXOwOvmmnGC/k
         meIUd2mjqGL1L5cNkbkeE16L/VyiiPKGdsOVuEKIRw+girgpioIROr6UPK1op0jAeD0G
         H0l0OxNu8FTohNC87C9cpJE0BlbRIcxRrxXusIvTlthAu+aue+SXAA0X3PKITmjjYEoa
         uCzjrTV9aDJ0scE0OPt0mr6D6juJIOt6CeYRT4CdIvWeVdpqBQgbfJHAYOmd5f8wST+b
         fHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731559120; x=1732163920;
        h=autocrypt:content-transfer-encoding:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1hjtcyRCyAV5gy419UlFdW2e5MCQYCiKnBPOORr2yqY=;
        b=XaGmGMVnnE/K7Lk9vMLyALo9LH7lJwiZnPnR/uwhVSjqYcqzTVs5+11ISz18fytBjN
         6qBiBKf3XTaoTJ8KmDQrjmCfSdzUVeTmvThcz+LE8zrdGwRduro/hyG1SDSEr3847qyv
         Opa9LuchTSMjtnu2u8+qz0h4K11fsnizoAVVRr1WtE8IYBbieSgDejRaglUQJphUJbHL
         yI3BtMcuZPh9HmqY/OLyR0CcipHpfYCsariEAE4yXP0KU4hp0uOaeOoo+j4jHuvK5LN/
         Fvy8tZ3auh5roqhHqZ4ALDUiILdiJWd2Ye361j4QJUG82mnrBSogznWQ2oAcQrZE2oJv
         FBuw==
X-Forwarded-Encrypted: i=1; AJvYcCWAdzUgBcw/zfrN+JPt/oC+SdKisV7Lcpxamj3aWcbGZ/IPl/ZY/rn8ylo6lMx0LHrJC5etMbi6xCQTXlmb+Jg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8zTXB3UuWCCopz1YWQhI1/QUSd42ALcY9HL/U3U+jqSQo4WNf
	ngQtThOzXYBfjPO/mtVnt6ZAGt80PAVrQMRUp8HHaMVD2LiyAyLV
X-Google-Smtp-Source: AGHT+IHhaFZfNF7Ak4vVWXByirnBphJJ153wav2VJG8tySIWyTSKGMA9WO2tsvADs2YnmyL/CouXZw==
X-Received: by 2002:a05:6830:3893:b0:715:3a11:ece8 with SMTP id 46e09a7af769-71a6e5daa02mr999247a34.20.1731559120297;
        Wed, 13 Nov 2024 20:38:40 -0800 (PST)
Received: from [127.0.0.1] ([149.40.62.54])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8b37f668csm177935a12.48.2024.11.13.20.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 20:38:39 -0800 (PST)
Date: Wed, 13 Nov 2024 22:38:36 -0600
From: Brandon Casey <drafnel@gmail.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
CC: bleung@chromium.org, chrome-platform@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_platform/chrome=3A_cros=5Fkb?= =?US-ASCII?Q?d=5Fled=5Fbacklight=3A_support_Google_Link?=
User-Agent: K-9 Mail for Android
In-Reply-To: <ZzVbbh86elpYQG5s@google.com>
References: <20241113023800.6263-1-drafnel@gmail.com> <20241113023800.6263-2-drafnel@gmail.com> <ZzRLOmDCOrCa5DJW@google.com> <B7B50D15-7465-4370-8D82-47C75A16A3AC@gmail.com> <ZzVbbh86elpYQG5s@google.com>
Message-ID: <439FC80F-141E-438A-B201-772C9509D048@gmail.com>
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



On November 13, 2024 8:07:42 PM CST, Tzung-Bi Shih <tzungbi@kernel=2Eorg> =
wrote:
>On Wed, Nov 13, 2024 at 02:44:55AM -0600, Brandon Casey wrote:
>>=20
>>=20
>> On November 13, 2024 12:46:18 AM CST, Tzung-Bi Shih <tzungbi@kernel=2Eo=
rg> wrote:
>> >On Tue, Nov 12, 2024 at 08:29:05PM -0600, Brandon Casey wrote:
>> >> On the Google Pixel chromebook (aka Google Link), the keyboard led
>> >> backlight has the ACPI device id "GGL0002"=2E  Let's add it to the
>> >> configuration array=2E
>> >
>> >Why it can't be matched by "GOOG0002"? [1]=20
>>=20
>> I'm not sure I understand this question=2E On my device the backlight h=
as ACPI id "GGL0002", not "GOOG0002"?
>>=20
>> >Have you tried to update your AP firmware?
>>=20
>> I have not explicitly updated any firmware=2E It has whatever firmware =
Chromeos has installed=2E
>
>IIUC, if your AP firmware includes patch [1] (submitted in 2015), it shou=
ld
>report "GOOG0002" instead of "GGL0002"=2E
>
>[1]: https://review=2Ecoreboot=2Eorg/c/coreboot/+/11478

I can only assume that Google did not ever ship a firmware update for Link=
 that included that patch=2E I believe this device has all ChromeOS updates=
 applied, so it represents a stock system, though no longer supported, and =
aside from being in developer mode and having a Linux partition=2E

My firmware also reports the acpi device as GGL0001=2E

    $ cat /sys/bus/acpi/devices/GGL000*/hid
    GGL0001
    GGL0002

    $ cat /sys/bus/acpi/devices/GGL000*/path
    \CRHW
    \_SB_=2EKBLT

Is there any reason why we shouldn't do the same thing here for the keyboa=
rd backlight that was done in drivers/platform/chrome/chromeos_acpi=2Ec and=
 support both the legacy ID and the official ACPI ID? I see your commit 703=
e77134 which added GOOG0016 in addition to GGL0001=2E

-Brandon
