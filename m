Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B934C25F7A7
	for <chrome-platform@lists.linux.dev>; Fri, 22 Aug 2025 09:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854586; cv=none; b=rgI97Lccv75uiGuyfkpiw/6IQrWYc2Zy/4335P9QoMfTMDO11D8LHqvOWoLxZYKHbRaLsUhl8R3Hq5KciYbq1r4gHLgNc7zzWQhNoaRWqSd9AsuT1fUV6Cy16kv/AtCOPTN6wPIUb2ZFwBkRRNPccOM1+YlFLy0v7DBtNI9PmJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854586; c=relaxed/simple;
	bh=A81kBoegl40q6quwOX0WX4yiOUHqnmUUvR3iJOA0a2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m9Qr5Z2j+UxZgP0+dGHqNLcUtPZTPzu/ruJezrtFeAMaf21G3Pahc1SXFNyxyJeAhzMZnF4tpiIU17XtLgxeOmuTouWFJ5IpFKbQhrhIsKXEv82npBSt8smt5ogFyQWrPqJngoz81Zsu9SdkfmqqJVUkZXmUC3+bAmufDxAiCtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OLcvOlIZ; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OLcvOlIZ"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-333f8f0dd71so15070451fa.1
        for <chrome-platform@lists.linux.dev>; Fri, 22 Aug 2025 02:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755854581; x=1756459381; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rvb5BTFOBJCsAqheRi5OrrkHsnM2r6jQ+WuONy16iw=;
        b=OLcvOlIZuME7ops2aYsc6nNdj5geRbvamtrHMzfElHLAvebJdjMV4aenF3G/Npe/KS
         AJ93abaVvwTHAj9SdY6ld7QmfhLv8g8rD6Q9vOcCj7gnuUrSwiA3RQUH3MS3yeuzR3ni
         a2pNnhIDTW9tvpr1JapLRW9pS+sXl7PzNS8tEv47aHIH+I0CLkWmnpKxmcApNLVrE455
         AriAyysA1uegQq8aIgJ7oTDUjw6wrPkb8g8tNeOKNdLD5Bg18/JbRAtsYqeXg2EipQGa
         eCSOGmAhg3xxc3HIRD/IgElp38cqSY4EkZrAuPGD3Y65YzewcbblTTfsFmdzD0uWE4nf
         UKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755854581; x=1756459381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rvb5BTFOBJCsAqheRi5OrrkHsnM2r6jQ+WuONy16iw=;
        b=SSzrSKaCrYvDOWoSRw7O0n+rGlJ/j4qdYC8QnVzCXcmI9mPiEp/0b5M/YEBDWLpkLT
         00HVscnnF8LKUG7c3Jq8NzevYSFOMjKtxw6/paG+2H4pbVqr8/0iRBWxQfBLbef04i8a
         1QL1h0SNoQwFNLb2UxzTzhCqITWI13OdoBlkSYvFSBMR0a0rgZ7nhRpJOywRxxoisGxT
         Li+KfJJf77I5sIfR6Q2os2Y65IGtGPYRxUhKsBGFT33nJwWcMmZ1CruGFR4CQQ0uZPSw
         S/6oBZ9kpIUSMevPH9p5hLPkIDD9aAv6J2MmhAuRQLq3hZ3y1f6staP5XHs3U3y9d6CA
         1/mA==
X-Forwarded-Encrypted: i=1; AJvYcCVf6MwzDkW/LbTREYEI2OKYdulLuGUbahjkzdwnvKIVN2qQPKUk6py2t9v/HP6StPFL7Is7u+a0A7gO+ghcRts=@lists.linux.dev
X-Gm-Message-State: AOJu0YycHqxRZLGrtSs+n+JDN8IS52r5VOYkp5B8CfHjcTRNNk6Geg9+
	eNo+6eSsauzK5c/HMTg5pXocKqe/hRwssG7fPaae76OQdL2ezB1mOlJdJO52DhrDfomtvK9zvOP
	w42j3ijqWs46GFyY2t6XWIPkAnPK6c8Lhw7aphCH5DQ==
X-Gm-Gg: ASbGncsJdzim30/8Mprm3JFYIqU7wxC/20NliRZ2wViNZzowAE65+1Xc/eoimXrIP3o
	J5CIH7QvKZkWi1vLw4lblz03pny0GiN/pNnAi7708kFoFvhhp8bGa3uJ2aqGgyqLE2b1VPmYe6v
	10j208DNRWUPRaVhPRR5wXiLYgWj9YK0l1I3owm/oZiQz+mfA2tIZsG6HhN0YNjm0s9HMjMNKom
	vip11n3o/QQppj70Q==
X-Google-Smtp-Source: AGHT+IGmS+5jZRiY3M87jYqtd1N1nFCNBKn5R2TEdrmd3+xxfd4PG/kXNNSVVgmhRVuloDKPRDouFdqjsq+r/vvoIgA=
X-Received: by 2002:a2e:8a86:0:b0:32b:5272:38eb with SMTP id
 38308e7fff4ca-33651002d61mr7071001fa.40.1755854580887; Fri, 22 Aug 2025
 02:23:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250822075712.27314-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250822075712.27314-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 22 Aug 2025 11:22:49 +0200
X-Gm-Features: Ac12FXwu_A2fq6cbJB5U4ofkj6w0TKETQ4RpzZE3LHHotvIJu8LJQDJ8_-1dTpA
Message-ID: <CACRpkdbLKXx7GEOPemFGSTFy8oDG99TUFwC7sH7xkaoqe-cY8A@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: mfd: Move embedded controllers to own directory
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Tim Harvey <tharvey@gateworks.com>, 
	Michael Walle <mwalle@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Jean Delvare <jdelvare@suse.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Lee Jones <lee@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Tinghan Shen <tinghan.shen@mediatek.com>, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Mathew McBride <matt@traverse.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2025 at 9:57=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Move ChromeOS Embedded Controller, Gateworks System Controller and
> Kontron sl28cpld Board Management Controller to new subdirectory
> "embedded-controller" matching their purpose.  MFD is coming from Linux
> and does not really fit the actual purpose of this hardware.
>
> Rename Gateworks GSC filename to match compatible, as preferred for
> bindings.

Maybe add some definition of what we mean with "embedded controller"?

Something like:

"An embedded controller is a discrete component that contains a
microcontroller (i.e. a small CPU running a small firmware without
operating system) mounted into a larger computer system running
a fully fledged operating system that needs to utilize the embedded
controller as part of its operation."

> Acked-by: Michael Walle <mwalle@kernel.org> # for sl28cpld
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Overall this looks reasonable:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
