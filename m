Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A1B30597F
	for <chrome-platform@lists.linux.dev>; Wed, 19 Nov 2025 08:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763542483; cv=none; b=SR9QI0FiEed+uior+sRf6O2Zb4DycLDoU045J79UQBh5gDFtX5hYCfrRk8s3rpYRlDR4A0r70e6H0PuVd/pl74hfwwF4Ow87w+7eXWdjISJlDScUlq8nJ5xYIdylYU6nrgxDIDBoYSWD5ARlZz5orzQf9Fc+IBDu/EHO1Evp1Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763542483; c=relaxed/simple;
	bh=uq9A+rP/n2h/Cw4vBdMGHC8Y4iUHLllWMCwq1JBoATY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ByE7qB/TuJm5mScNqjWs0dQwByRnPQkbr/YwjtpwvvoZGSY9VbEgoZ8JsXq5R4hKKIFHY9WorycYlze7tTnSgRj9ctqEgfpvEkPDrac55I+f4/RvMKyXJBm6yzbzgZF4p0niw+3AMqlmh4k5LDWIJfqiuZ6nOjBcHWg1E5/nz8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IWmFU+zp; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IWmFU+zp"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37b95f87d4eso52406641fa.1
        for <chrome-platform@lists.linux.dev>; Wed, 19 Nov 2025 00:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763542479; x=1764147279; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8vU/bXiUiSX+XlUElJe1ZIOtLsB+Q8+itOmUp+Ohro=;
        b=IWmFU+zpz+a3mr6ynMbNNx7Tk3YWilZQjb8CcAVyHF4FilxsZqS25eHlUVVv1ZQoFP
         VZZDtED+lAfjKns6CfA7jvngvVlDQ/v2Vs5GazghenFEvMXakDOZFZQnfZIpGJKzeGMH
         1mEcAx9+hTaj2p1DHCo7BcuVkVybBatCWL0bQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763542479; x=1764147279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C8vU/bXiUiSX+XlUElJe1ZIOtLsB+Q8+itOmUp+Ohro=;
        b=rnVf2Sfeq92if7O3SMwW8UXc9u0mSViE1sAiR/Fg2t2ERHbDOq5Xbi+ebZI8bYPbta
         pGnNX3wv5VLsjVt0uyQ1A8E9g2mTHbOklHaFrmnLFzOWB+/mDKTusa2bQ3QaUv7TGVIr
         72f4WZxDq2mSx9sab3EzFnzfSgjed6tknXJxO6JeRt8k5DKJmpCu2Ifna4eMIn4ExIUA
         nUVjWB++ifXRiFv/4cOaNbRnCi0n8UGo6H4O62DHhLxPrpVJW5z5v9/Gg9bLoKvQIizr
         sxwpw2OorXSZi9AJa9GsatHxYaefEPOJH3XQgC9dlanU6xHIYhzqZCip7iCQOoytwIwX
         s34Q==
X-Forwarded-Encrypted: i=1; AJvYcCWh9GnX3XD9gxKHk/rjsKurkQO/rBC5j1vnjE9f8mHpwXM4nQSJb0f9DXbjX2N0o9U7u7QTz1HiR8vlQGQNPRk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzaboaKgWbA5lnNnUSAqBLtocpQY8ZGqQNI7xGjiG4n6Hrpb0r9
	z4BC2h4wIH4peQMBWkwAkiVp+1b9hgQWezIwAcN8MgrdEQqLZWlp7qgCohPdXYvdz0O0GVNWUQo
	8dtxlE9VIhu2nBQ7bR9jKaX9/puVr/jTHYMNOOzSY
X-Gm-Gg: ASbGncvx/S44zFrizNSd0ep7Zbcg2G908+PHz4/T7v7A5hHPskTK8tVsUXTIz1pD7pM
	VsWrQh5f4lFKwW0jiHv6yw9JG3wJfAikYJQe6Il+An9s/yMU7wugMEdhzBXftUkzCPY76nA6yQg
	dxopDeZB+p2hC8i+kZ/zINqyupF22/IFYhIGeEgeWuY5q6/iti7wImtO2requLOTa91SJOYnmj9
	0JKPJ1VfB/W+742vX+tKifTuPLox0pXEBEHa37oqqd1wpzt9U4MS6D4446utZ64RqdwIX97RWwO
	Ftdt7RgQ+08EbuXq2pVsLi0+sA==
X-Google-Smtp-Source: AGHT+IFhlPMrRvpqdsL1dRrt5/hvTvDt2HQaw6mOPpwq4Z8rWgeUCX2QlUWOEDMbkLtDd/Z5qXCyPQTzgWFahIEpLfs=
X-Received: by 2002:a2e:a00a:0:b0:37a:4085:c83d with SMTP id
 38308e7fff4ca-37babd5c8d9mr55521611fa.29.1763542479298; Wed, 19 Nov 2025
 00:54:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251119071126.1719405-1-wenst@chromium.org> <18342493-54f9-4e5c-be05-568a3026663e@kernel.org>
 <CAGXv+5EnfwRA1SMvt=3n7gj1gS3BndXKNVfmfkC=y6n2A3VsdA@mail.gmail.com> <d8f3eb00-c7a6-425a-9e69-a01bc3532f0c@kernel.org>
In-Reply-To: <d8f3eb00-c7a6-425a-9e69-a01bc3532f0c@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 19 Nov 2025 16:54:28 +0800
X-Gm-Features: AWmQ_bnHnfSc8wAlhe_rBr-TemtbkaVyA6tPaH5I_09BBzsfr8kvP5fgv6NpHVk
Message-ID: <CAGXv+5HePVim+-fx0bG-geBHp3kLQbNGLyknGRx=LgLZ7H+DUQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: firmware: coreboot: Document optional device
 specific properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Julius Werner <jwerner@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 4:13=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/11/2025 08:32, Chen-Yu Tsai wrote:
> > On Wed, Nov 19, 2025 at 3:13=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 19/11/2025 08:11, Chen-Yu Tsai wrote:
> >>> Coreboot, or the ChromeOS second stage bootloader, depthcharge, will
> >>> insert device specific properties into the coreboot firmware node whe=
n
> >>> there are valid values.
> >>>
> >>> Document these properties in the binding.
> >>>
> >>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >>> ---
> >>>  Documentation/devicetree/bindings/firmware/coreboot.txt | 9 ++++++++=
+
> >>>  1 file changed, 9 insertions(+)
> >>>
> >>
> >> TXT files cannot receive new properties. You need to first convert to =
DT
> >> schema.
> >
> > OK. Let me look into this.
>
> After the conversion you will hit another problem - you need vendor
> prefixes for these, because only generic properties can come without
> them. Otherwise (without vendor prefix) these would define the type for
> all other bindings, which probably is not what we want.

I understand the concern. But given it's specifically under the
/firmware/coreboot node, which is inserted by coreboot, doesn't that
already serve as a namespace or vendor prefix?

FWIW the ship has already sailed for naming. The first three properties
were added to depthcharge [1] and coreboot [2] in 2018. The last property
was added to depthcharge in 2023 [3]. That is what has shipped in immutable
firmware on ARM-based Chromebooks since the RK3399 days. The coreboot
change was presumably added for other devices.

This change only serves to document what the firmware already provides.
Whether they should be grandfathered in or not doesn't change what the
firmware already does; it just makes it more well known. It's not going
to have any effect on validation either, as the properties are supposed
to be inserted by the bootloader, not added statically to dts files.

Presumably we can update the code to use a new name, but we still have
to live with the old names for up to 10 years.


ChenYu

[1] https://crrev.com/c/1028728
[2] https://review.coreboot.org/c/coreboot/+/28104
[3] https://crrev.com/c/4975217
