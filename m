Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA44CA2D
	for <chrome-platform@lists.linux.dev>; Fri,  6 Jun 2025 07:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749196250; cv=none; b=hMU0LCHf8l5DPAXXX2ic07eNVVXrMWNpDlrweJgF4b9Bm7cKiXT2Q0rCa7puKW47sbXr0sJX9wKrM41YZG/zV7N1SrKbKPpWE7cxR2bUTb0FvgVmPWBgl2SmrhpRdsfd2Jev9z+DJQg3u0n2SPcjFFFTVdfqIq0pYHbTPEkdWdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749196250; c=relaxed/simple;
	bh=wPoBJxhkcFhcU1dhyc7aep8kuC84kUm5vq3DmgKJjwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YSm1itlQwCqoCrQzDTzkaxMbD5yIrhcyV7BtEVZADZLNlrxiiA21UO0BxbPlRUMg5EGPq1NqPDIRTWX2C9DTk65fMevGksbCRQ1+Rniv0BsZU3Ds0jgDtNewdFrEW8RXQ2Qnu1AR4KsExOEPGk2KwwlfbaM+T+7YpnpuypT5AXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KOVlzToR; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KOVlzToR"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5533c562608so1769259e87.3
        for <chrome-platform@lists.linux.dev>; Fri, 06 Jun 2025 00:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749196247; x=1749801047; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rm4T5ss5l6d5YD6Na8dlxdY8BKrMjQHyc2yVXx42+4w=;
        b=KOVlzToRaYtOYd80K58SRz8KkN0xj6zXTSCZ93CSf0/rFg8y0Y/0bZafDWjAo7WOI1
         WWOg65W4kTgrJbW3QWlfCGOwY7iQYXWHoOwnrWf048hmAOxkaIoVHD3YYe7rsSlnot1s
         HDaccawTUe0kZPAXvIhz85X2Qv7bvxHErbLMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749196247; x=1749801047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rm4T5ss5l6d5YD6Na8dlxdY8BKrMjQHyc2yVXx42+4w=;
        b=Z9MV/4Zr26ZIc5QTxUcmxZXQEZZ1yhiHzTI3ozbHj62VS/sBH9hUNT9aohbQak4ejt
         7elGAZn5DKpJda9Na+tclXL1m+/6nvHSifRJHu5thVVvDiH/omIj1OYIZmDCqsfzh2FV
         xtiq1op2CwQRol68OZbT+WpR8dds+2hSXMfYaaO17Ppi5gsqrw4HqEnjqONTTurEbfJp
         p3UzGWd63En060pv7HiSccSNmigO8qgYlfpkNyFbIpLglihE4skGRXzV/5T8Au3gd/pl
         ADEXovofng6PKAWcm0BuCq4zTuCLFmSO+6Lk0QsGc4uS60bxtT2OoGAVzs5Nc2ME/Zp8
         ZHsw==
X-Forwarded-Encrypted: i=1; AJvYcCVnpfSN7YhSiqYg07claXM/13gUN9utkdGtjOvZW4GZUZN/xr31x9T5qDX4vvXlHt5kZ4GvYNQtZQmFoIqw8YA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6YRBk1iFmFZPYWDGmNK4FWRB+OVB7meDN/uToT+Gm4w3hvK6Y
	Re7yWKbKVKb9OZqCfW6TxArQ4P+T6hwzaS+ZTGJ2fanRN/i21iiZg4opsH+rrAIYPKafFOBPnGg
	vR8cYR51ofRfsL9PGPUU8CsfYxWSiLKXOPXGk5lw1
X-Gm-Gg: ASbGncsLRxWr3AWVfHvoZSDZ20bH25yVmECTOVBfYqFlUhMMqhlPG9mtoBPTEGq87sT
	wInOHZVAygShhkHUu2ZfiOkCI+7WVRsx+hJcpte0XbpK7eUJJXfjKGi7j91RwFANWFeSQ5BX1an
	tCjF4bSGvqSb12Vu/rKagZaG/GHlXb4DaYXsbuxpg0qLwMiFK1FBoUCjZb87ym
X-Google-Smtp-Source: AGHT+IFbKR4s9CitEfgNJcsl0QhC9Vk4xSWEUHEwXIP7bIcoci9LebkzJqucGfI4/l4+Z99afgP92CHraRrtTZAdj/I=
X-Received: by 2002:a2e:b8d6:0:b0:32a:8846:9776 with SMTP id
 38308e7fff4ca-32ae70d541bmr2192651fa.22.1749196234912; Fri, 06 Jun 2025
 00:50:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250421101248.426929-1-wenst@chromium.org> <20250421101248.426929-2-wenst@chromium.org>
 <CAD=FV=XLonF5qM+f6diESvnqAHKm4Y7wwPsNssdNqZfkn2OzSw@mail.gmail.com>
In-Reply-To: <CAD=FV=XLonF5qM+f6diESvnqAHKm4Y7wwPsNssdNqZfkn2OzSw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 6 Jun 2025 15:50:23 +0800
X-Gm-Features: AX0GCFt9WzCgD2IIEFQ5utFqrLWuXwM5tZhCHvVXVAvSJ22GZSGtAIfEBPnfCtQ
Message-ID: <CAGXv+5E3bJf0o8y4kve_f+EefKqcOeW99VA_HcgKRm2+Bj+uhg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Doug Anderson <dianders@chromium.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Tue, Apr 29, 2025 at 3:34=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Mon, Apr 21, 2025 at 3:13=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
> > longer boot-up time. Power sequence timing wise it is compatible with
> > the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
> > out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
> > enumeration, both shorter than what the eKTH6A12NAY requires.
> > Enumeration and subsequent operation follows the I2C HID standard.
> >
> > Add a compatible string for it with the ekth6a12nay one as a fallback.
> > No enum was used as it is rare to actually add new entries. These
> > chips are commonly completely backward compatible, and unless the
> > power sequencing delays change, there is no real effort being made to
> > keep track of new parts, which come out constantly.
> >
> > Also drop the constraints on the I2C address since it's not really
> > part of the binding.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v1:
> > - Reworded commit message
> > - Dropped the enum for the new compatible string entry
> > - Dropped constraint on I2C address completely
> > ---
> >  .../devicetree/bindings/input/elan,ekth6915.yaml     | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Can we get this merged for v6.17? Or could you give an Ack so that
it can go through the soc tree?


Thanks
ChenYu
