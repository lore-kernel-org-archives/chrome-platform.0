Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B522D73B4
	for <chrome-platform@lists.linux.dev>; Wed, 19 Nov 2025 07:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763537567; cv=none; b=N2oVwCSXUdmOVgczrOF2CR4aLMaaMpjlqaVe+siq7HZMwhS0l/7GyyjMhxDpWuWLWNIrcTKyp8WHggxd/+M5W0bH16vL5kWuqPkIfFjGNQ+NPLiCwYUbSQWl7vfTZEo5a6R42e3Hr7q6oXeTiwrTf6kHzEqycvetPqcKEdsFocg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763537567; c=relaxed/simple;
	bh=QH5oLqLZDQZSVsmh0LNkhFrypl/KCzx0EX65VAszEfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cNKr9UUbVxirIUgE22xhMOpTe8SYUSjQkgPenJcK/1seeY8D6IuuSiRj/iMto4roRll3WC8HPePB94I/5B8gZX+Ff5ehEI55Fan3FtS0UjDo6j6n622+XA1NeQikvkgy+GD1dHxj6AxCkR6F3froMS4dpc0TXvKY+NVPfPLtbBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MgjmPZ7y; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MgjmPZ7y"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37a2dcc52aeso63916931fa.0
        for <chrome-platform@lists.linux.dev>; Tue, 18 Nov 2025 23:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763537562; x=1764142362; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IO0DNZhiENG8w/XHNdOtB6qefAmL2Exx733Q4ukPAMg=;
        b=MgjmPZ7yh11Q3sZTukJ4BP7a2oBNVbC9OotJq4m860XLx1hCWnZOgIfAQN0s/nl8FB
         qWQieSWUixyVL9nvJfjrD92Px7Ux/JquCB7SRWSzykHQlRE4j2Zc/M4BIbB4u3H79Hgv
         Gg95VL1KP/k8K0Z+WTazgB42FtJGTzQTBPSns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763537562; x=1764142362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IO0DNZhiENG8w/XHNdOtB6qefAmL2Exx733Q4ukPAMg=;
        b=XMQktx8obdyginGGGiw8HabUMIbQ6mbNiIA/Bnk7KfuvNWYJc5Son+aE50Vru60hYf
         MrcIYDlmKqxwhMRM92jMm95/mtSgqS4RifNrwCS9Ew9gUsrjS4pvNp7BP+huDCba/8Qg
         Z4urxcUz5qAGzanQ25Bd7znmvjrxCbB6yh9V9FnWId9dmNiVcV/4xL4H4DwlnGHks1LV
         wUUy3P4B3Qs4pz5ovITVSW8/RI/f1DIxlCvVrOECTelisJ7hyNwLjmvriSAmnxTrol1m
         krkzZk+b/XlWvAsxts2jCfvKwa2PpnHHtydC+YqHyTTYuqWLkBAW2q1xkVfv7QOBYRO4
         7Nlw==
X-Forwarded-Encrypted: i=1; AJvYcCVyX85nxEY5fqhwY9fL6vocE2OHa1KCt3LDjn7Gd1VZaZcQuNuuJAW3ghQHPB9eA8IcGOUcZDWIm9ihKavzDr0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3V8Xsd27L4KO3Wfnwcr9R0X53hRI8IyA81keVaigNaWDqgiV6
	PimYANYrBD344CDcZc1Q7z3jhaUkDAgbC3OM3c8GhQ3ZWFIxm2yiPCw2tUKJy3a47A5rbzI6SAz
	MCUQmBKbwKW+Ubh+lCoS2/SKXGFw3Ro5XUpK/pXUO
X-Gm-Gg: ASbGncsr/lkD5ZdrkHmV6w3FuwNx6C3v0a6u2m6fFDQOUIexQlEdMhr1ND2lXBu81rl
	APAOlF4abgvHuoTapbH86xdhIITgsim8fucIVlZsVEMoIBxr6ZPn9TNqzDKVjE0I9mAxsteZib5
	Yqx7DW/SHufhhZGALId6vodt3UF3Lp8x9iUy9DL3MMqqp8YpZ4Omzi4XrshiNOSVNS43i6ULUth
	rm0NJaMLd7JAcNofX94RbKhh/iEPvUTcceIPHUZzD2dcF16RnS7pNL+5fc2MAgYff7ukcokIY/q
	W8dm4Z3NMmf3gSxwo9Rlkhh41A==
X-Google-Smtp-Source: AGHT+IHJrAu1K7jWQMAE6p11RyXzPNk9G1nAtzaQ+Z3fQ98mNJH85oUoeMLP1XXO3FI/y3LlEG4mixCcvEMB8DZHxuc=
X-Received: by 2002:a2e:a1c7:0:b0:37a:432f:8ecc with SMTP id
 38308e7fff4ca-37babd71d49mr48399931fa.33.1763537562422; Tue, 18 Nov 2025
 23:32:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251119071126.1719405-1-wenst@chromium.org> <18342493-54f9-4e5c-be05-568a3026663e@kernel.org>
In-Reply-To: <18342493-54f9-4e5c-be05-568a3026663e@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 19 Nov 2025 15:32:31 +0800
X-Gm-Features: AWmQ_bkw083HXAHlfoTHPiQeY1k_8hzN3vGBWotGu575ZiGZHcE5k6oSmz34_IY
Message-ID: <CAGXv+5EnfwRA1SMvt=3n7gj1gS3BndXKNVfmfkC=y6n2A3VsdA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: firmware: coreboot: Document optional device
 specific properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Julius Werner <jwerner@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 3:13=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/11/2025 08:11, Chen-Yu Tsai wrote:
> > Coreboot, or the ChromeOS second stage bootloader, depthcharge, will
> > insert device specific properties into the coreboot firmware node when
> > there are valid values.
> >
> > Document these properties in the binding.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  Documentation/devicetree/bindings/firmware/coreboot.txt | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
>
> TXT files cannot receive new properties. You need to first convert to DT
> schema.

OK. Let me look into this.
