Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0361D137742
	for <chrome-platform@lists.linux.dev>; Thu, 28 Nov 2024 04:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732769845; cv=none; b=ebDDhZ/Bptc3JKoR1bNg/6PVBAJgjJyJxsiy+JS7ED54Xd8swPeYpHjxA/dXWau3dCk8KCcCRqTJY90aj8T6FD/a2s0uozUj1JEZ/fnBcSVh+spj3OB9bAJqbpj9BNVm4D+mHFPLDhh+yROI1Oppjoee5415JY7JxYAvkqeMsp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732769845; c=relaxed/simple;
	bh=9gNdiwWZ1MbH1bVKN1QAiVS5Fv7sTB11zjZfTxLD7cA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=mCZ3vLkeHYGWupd7KAQPw6PCuspuHXyCnJdXe8k7gACe1TmwxWA6AanfMBwPSyScOS81rW7EkyHHUZLeHhRf/KY9ZKxS0YElAXGwYlAP1n8O/R3EnlFB/0MMxITPzS2kVbDjZHZqX4wSXPKv+eRE3xteE5ROZy1ott+r38gojoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l8DMXId5; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l8DMXId5"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53dd8b7796dso354290e87.1
        for <chrome-platform@lists.linux.dev>; Wed, 27 Nov 2024 20:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732769841; x=1733374641; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gNdiwWZ1MbH1bVKN1QAiVS5Fv7sTB11zjZfTxLD7cA=;
        b=l8DMXId5pXxA8faZpuifAVkDCJ1zIFntn1LFJiCW3z5dFbYQsOtmYagEEh9bjfw4I7
         nTMvlPQN2uzWJj/AkU7ha7JU86wSK7pAVKGldULBxtUnOLr1EQv8hfZJiYD6N/KhafJx
         UpDcnh2JNw7cD3ceV3ERlFsrH+cO9F4m6+ZJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732769841; x=1733374641;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9gNdiwWZ1MbH1bVKN1QAiVS5Fv7sTB11zjZfTxLD7cA=;
        b=ecqcraKjTkcfDd25ip97A5Dq41O5H0JzNRqAODSo0PAnWuOCpdpm+1EeCwTE/A/su0
         J6130rZrpfHHZxzvQrDS8l4ZYR4r8mQPMsW911+zhQxthgXdC8DFGyNCvbdAT5/KIZJb
         N1wDWWWw9ML3xDcwVpm9orVItsFfv0gE2yyupxcSZzrROVEppJfC5YS+i50vYxhaGcCc
         Tkk4wGvSojJXpE8a/q5TpwbS6B96LAAii0JMzRjFVkNa0Q453r8s4HHlfcDZGvPbrNv7
         KtQ0fymoURIjtvaUg2A0BxJU7HL6TmqIT1j2gx4OSFn4RWgqEny+TE5HUNHENexvAxXl
         PdCw==
X-Forwarded-Encrypted: i=1; AJvYcCWmFZaoHYumYaSmgURq6m+mWUzDuLD5pf0D4r+9JzfJP1S4vfsCdmoHt4D1Q5elwnSlO+Cxr8/3EFkE9RnjRtc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVZqI5Jae2q1xZhTkx4szVtZxW6vrrwXehXv0uSMKa/tRG6w9+
	AemfkGtVkLMHmNBeNrvSdVuWL671RXaAGqcK7FPFG+9Cln2jPtwdNgtDKm1tjzHTEsW1uD/GzqS
	DTTMUCDCPineF4KXmBeDYYCQqRdYRSuUR7b5h
X-Gm-Gg: ASbGncskQHicH0yt8P0UPDN1sPTv4bdWEsDy/5TU4iDgEZ2pe8PwBhfK2delwtYYzoS
	ANXKwlTbkXTSuJpVcKFMtCWvz10EGUOySH7vveHJrKOkJKcjapyxNtAI63C0=
X-Google-Smtp-Source: AGHT+IG7n8N4nAMz6o9K2XahUaKaMVFWZxqJsiGFCbLs2B2ko1EorvcGfAfKGctbegSVwAcOe4uRUizxkULBFWIPM2Q=
X-Received: by 2002:a05:6512:23aa:b0:539:ea7a:7688 with SMTP id
 2adb3069b0e04-53df00a9f35mr3140014e87.1.1732769841115; Wed, 27 Nov 2024
 20:57:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241106093335.1582205-1-wenst@chromium.org> <CAGXv+5Fzrz9sBvE=FpV6URpcZtxvchxfY9WE4k4s+S3BzMWw2g@mail.gmail.com>
 <Z0b_f0gg9KgSozPH@shikoro>
In-Reply-To: <Z0b_f0gg9KgSozPH@shikoro>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 28 Nov 2024 12:57:09 +0800
Message-ID: <CAGXv+5GUGwqEGpyJptAUc7aqdGAeFP=-um4=EfUNzxkahiXB9A@mail.gmail.com>
Subject: Re: [PATCH v11 0/7] platform/chrome: Introduce DT hardware prober
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Wolfram Sang <wsa@kernel.org>, chrome-platform@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 7:16=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Just checking in. I just wanted to make sure that this is still on
> > track for v6.13-rc1.
>
> Eeeks, not only Andi was so busy that he lost track of patches. Please
> accept my apologies, I was under the impression that this series was
> still under discussion. I sadly missed that it was ready for prime time.
>
> That being said, I applied it now and will send it to Linus by the end
> of the week. Sadly, this series was not exposed to -next before, so I
> hope a few days of -next will work for him.
>
> But I will surely try. Sorry again!

Thanks! Fingers crossed! Hopefully Linus sees that all the stuff is
just new symbols and pretty isolated.


ChenYu
