Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947A8325739
	for <chrome-platform@lists.linux.dev>; Wed, 19 Nov 2025 09:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763544985; cv=none; b=fTsIu+z0Ec5bGQBhT+wefXA15iyBvlZuWSxP9/r4pkK4c/2hzwG6O0togkGXwwqxckH6ud2WB1cbcrWf/IWjNuOkKZHHlAk9qYD2UwBuTXxoSMb/1/0lvIu3ZZKvVhYhG9SbS66CxOb0r0UkLqVCgyEn9GldPfSSyG7LiGnq0tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763544985; c=relaxed/simple;
	bh=Kf03oQcBtavhos4zlkeUcbWQGji/8g/0eT4qXRaIMfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pXzB/Nu5qbhT/LLev8fIorBRjAeF3eJwXpAZsBFiDeZLi6Dx9va+gtB2rOlvR42JoWD+b97jvqkyKdsXgcJi/xZCQ38AsO7ktck2cFThoFz7Ye9DlpFuFoUN2RB8mE2QiwQcWZn0kRZJFfXXrA0F4w+BnRQSL/0aInOGxzz1+So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mbZowi51; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mbZowi51"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3414de5b27eso5232975a91.0
        for <chrome-platform@lists.linux.dev>; Wed, 19 Nov 2025 01:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763544983; x=1764149783; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6P8uDyScu6C9XLSpmcA4XuDYK4jr6mOghRaVnaENW4=;
        b=mbZowi51Y7Pw4obF2SDyr7MDhpdFac6CE7aPnB7PjcJ/yckkpJLyHjHRfj7A8DZ90m
         Nw0otb0hCgF/tJsSCmighjitBDOofmf5YEv8L3VMOPtPWVwe3JXpow04VjZjITj7RkHX
         W4VhYSamR58BC74pVX5IvDosGObEPbyylD+f0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763544983; x=1764149783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V6P8uDyScu6C9XLSpmcA4XuDYK4jr6mOghRaVnaENW4=;
        b=uagZmWkvy+lx8o9Rr4Cpzb0b6gg3nAyXCQZ+367gtvT9Qh8TDpGW+8JAdb0CDeK1G/
         p5N2BWT9DgEiCiWBf8AqShDl7s10688pCxootEEJ9nz3CqTvWy1SbTOlc/X6sW5odXhP
         p3kOsZ9k4p3pd3IY41RW7uAHl59KiWfBdY/4FdO3XNon4hnKIHA8kvyU8Ds8g7mlwgvq
         wyREktAVGnTrfwvyWvWh7MQogzh+ocw4OncW1UULfQzmVgNwluHLWx0GkS6Wa86VHZrJ
         GJ+rDwKQgIh21el8h7LugApEqX8BF0Od7r/ph61xrCdGrRmNzxpNHEwLu9XBqCH+Y3oL
         TIjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5kX9HOYHgmFI5FLK2aP81MAnLeYfBc15a288Z0Ti4kZcYSx+tXzG/d1/fDizdDvA8FSIsh92C5bZeFwG+2i8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmjjyvDBSWS4GhniNjWT94i84Kjjeo65lVozLfqioBbeOmKZTM
	kzhMY9zeKIX/1DdT1kMH1QQmn5/P3GQ2uQkv/YwMAqMAjZgOwIic1PCMO6Z6/KqJqZeWdKrI/IX
	7fK1obBEtrI+Z9m09fRbeKbJvCSVR54gaDPB/lakYZs9I3q73sV8=
X-Gm-Gg: ASbGncuYLLgJI5FIT3Cp+CKyxVVoCErQJHkk1wq79MgrNUY1I70Xz9BYA1e54KYcHmP
	42fCJvKzk29iC5crkvyFFEKbp6Imdi7ABDQtSXDBvt7x4Fi+VgzoJn57+ho6ykUOyq4e6/AmmUL
	IejBZdEzh7wqP1AWrMl1xfQYWUzNE7v9eG12OlC16bLNzUuQ7vqFrlpMBdjIyN4q81FdDNaQCxG
	/u1iJzTSNFNQ1xctt7B60ZFiGaUFpaDNJKWZ25A1MrFFJaL15DYk24MEA/KQ1ECdNqzSpKadPbA
	DUlfu7l3/RUEkIRDI6IE/W58/w==
X-Google-Smtp-Source: AGHT+IFkJsk4Xd41I5vYWSfC3DKAzGdHtv51O5Xe9lMmz3RD5rmx400+VHDPT6OGH/nk7mlg0LJRo3cilMQ8GtEQZ1E=
X-Received: by 2002:a17:90b:58e4:b0:33b:d74b:179 with SMTP id
 98e67ed59e1d1-345bd413350mr2018676a91.27.1763544982832; Wed, 19 Nov 2025
 01:36:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251119071126.1719405-1-wenst@chromium.org> <18342493-54f9-4e5c-be05-568a3026663e@kernel.org>
 <CAGXv+5EnfwRA1SMvt=3n7gj1gS3BndXKNVfmfkC=y6n2A3VsdA@mail.gmail.com>
 <d8f3eb00-c7a6-425a-9e69-a01bc3532f0c@kernel.org> <CAGXv+5HePVim+-fx0bG-geBHp3kLQbNGLyknGRx=LgLZ7H+DUQ@mail.gmail.com>
 <d8194781-56b1-49d5-a3a0-31360ee208b3@kernel.org>
In-Reply-To: <d8194781-56b1-49d5-a3a0-31360ee208b3@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 19 Nov 2025 17:36:09 +0800
X-Gm-Features: AWmQ_bkq790FPnbaW-3x2fv9oE4JznTqbDdzK5BBuOgkVlnutqSDLVP4wnWyDkw
Message-ID: <CAGXv+5FwrudX5JwbSTkRMNjOUPmbjzP+qJ7FMrgX0Jj52HvrQw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: firmware: coreboot: Document optional device
 specific properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Julius Werner <jwerner@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 5:26=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/11/2025 09:54, Chen-Yu Tsai wrote:
> > On Wed, Nov 19, 2025 at 4:13=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 19/11/2025 08:32, Chen-Yu Tsai wrote:
> >>> On Wed, Nov 19, 2025 at 3:13=E2=80=AFPM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> >>>>
> >>>> On 19/11/2025 08:11, Chen-Yu Tsai wrote:
> >>>>> Coreboot, or the ChromeOS second stage bootloader, depthcharge, wil=
l
> >>>>> insert device specific properties into the coreboot firmware node w=
hen
> >>>>> there are valid values.
> >>>>>
> >>>>> Document these properties in the binding.
> >>>>>
> >>>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >>>>> ---
> >>>>>  Documentation/devicetree/bindings/firmware/coreboot.txt | 9 ++++++=
+++
> >>>>>  1 file changed, 9 insertions(+)
> >>>>>
> >>>>
> >>>> TXT files cannot receive new properties. You need to first convert t=
o DT
> >>>> schema.
> >>>
> >>> OK. Let me look into this.
> >>
> >> After the conversion you will hit another problem - you need vendor
> >> prefixes for these, because only generic properties can come without
> >> them. Otherwise (without vendor prefix) these would define the type fo=
r
> >> all other bindings, which probably is not what we want.
> >
> > I understand the concern. But given it's specifically under the
> > /firmware/coreboot node, which is inserted by coreboot, doesn't that
> > already serve as a namespace or vendor prefix?
>
> Unfortunately not or not completely. Properties have single type
> globally (with exceptions). This means whatever you write here for
> board-id will affect every possible future board-id property.

IIUC you mean it applies to every "board-id" property that is under
a node that matches the compatible "coreboot"?

Is there any way to limit the match also by path (and not just node name,
which I know is possible)? If we can limit the scope then maybe it works
out?

Or perhaps you are worried that some other new binding with a broader
scope defines "board-id" and thus conflicts with this one?

> >
> > FWIW the ship has already sailed for naming. The first three properties
> > were added to depthcharge [1] and coreboot [2] in 2018. The last proper=
ty
> > was added to depthcharge in 2023 [3]. That is what has shipped in immut=
able
> > firmware on ARM-based Chromebooks since the RK3399 days. The coreboot
> > change was presumably added for other devices.
> >
> > This change only serves to document what the firmware already provides.
> > Whether they should be grandfathered in or not doesn't change what the
> > firmware already does; it just makes it more well known. It's not going
> > to have any effect on validation either, as the properties are supposed
> > to be inserted by the bootloader, not added statically to dts files.
>
> If you convince Rob then it's fine, but I don't want to accept
> downstream solutions just because they exist. This opens the door for
> every vendor to implement what they want and later ask for forgiveness
> ("oh it is already there and we cannot change shipped devices"). I mean,
> this was fine back 2010, but that was 15 years ago.

I completely understand, and yes this does have that feel to it.
But FWIW the change is in upstream coreboot.


Thanks
ChenYu
