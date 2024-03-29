Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF8013CC63
	for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 22:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711749977; cv=none; b=MGwsgXAM2MwEONfa2hiyeUoG6w5OP6wzwHRZoGaHzeq00lEooinwqwV48TIdyUxBq4494BB/eCdYnCetiboHwdHsOG2LeJAWU/lTTZkZys+Qqk3UnJKy4d6N8fcLsAttDMRU+y81RaY+T0bordtWHKgMlpqpOs6HLU2RLzxhhLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711749977; c=relaxed/simple;
	bh=nV9Xa3IM7xgXhYdWwGJomDhP7UDLqK2glvaaFhOjZe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y9jo9pxseQ00KQ8JIKS5iQxjD1TnlZ7CGvkAeSxyudCrMdlcrNMMOmHDfQDmhiApzG71PyHjWCH1tw9nBI351Saiolrb8ZKRJi2Zo0iiQfJp8CiM25yOdgKX6Uo7YOAZFVkDuJsX6l9Xo5lT1Cs5dntS4HNHoEniP+USpfekCEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Nkv8EYiv; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Nkv8EYiv"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-69629b4ae2bso17590266d6.3
        for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 15:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711749973; x=1712354773; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nV9Xa3IM7xgXhYdWwGJomDhP7UDLqK2glvaaFhOjZe8=;
        b=Nkv8EYivpSRMiNJfz5wVRac/4ApiUiPy6Zeg6En+xCiwhLH1zqBAQe1qf1hofi6+3T
         Y4uMvuId1FbEBE0J4KiGZcBkIQF1CXEZjyKtXPvbEfQc4x8IvC0U4T5hjgTy9atTajK3
         g3jCApK+4m3aCaU4jB40/5mSes/pQVwT7aJd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711749973; x=1712354773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nV9Xa3IM7xgXhYdWwGJomDhP7UDLqK2glvaaFhOjZe8=;
        b=URcLhYf9Qmpb/ry63coENffDMB81vG2rBbus0Ti8JqIl5QHUGk4Q2lOJZaEf0VHRnp
         9CBPmqmpnCxp10z7Sb7wYIkbLLM5IqErRu+eBj1Gpknw426ATiJAqjwPF17EieXJDV7L
         qwy2Evkgx2rEKobpW0cOAYppl+vQhV7bw+ZIJD/T87dhMimvUfKSJW/DwZMeeTZwSUDP
         PrbHPQ+XgTH5JQtOYNI35O8Or7IBJOvt3wmErNDkUhb/HR2L1+Ynz1k3JxzINa+GhvGP
         LKNHcTwzGKVgfcI+Y3Q5bbLUfBTLbg5gc38k6723gH9FV1io+YWjUNupbOSyyaa1+bgi
         FRHA==
X-Forwarded-Encrypted: i=1; AJvYcCXc9INAR/5eccNPhPFHyvTqb5YNBmuxSmysToGVkrILWMGi0KNsB9vKpdImEmrpbiBgyWAIfz2VZBN3hiQGU+5fAjlfZrYWZPL5gXrz+z6q
X-Gm-Message-State: AOJu0YwedkT0n+DI+t3eu7RahYlio58isGFIwIqUFqaldsfDdGbjDyaR
	N4eKpTHeoIT0RmwIyj9if6HeLYWSaQZLaGg0ZYJ2Vuc9dWJwTrJsOBr+kl81devWYpfBrdc5XiM
	CFeDRDNOvrSYNkW99Ny12umacQqF/RQ9lJaBZ
X-Google-Smtp-Source: AGHT+IGSnhH3MvM5RwIbbS/34YE/7xYi4pOWO8e61L6VZDx1cFIdeGebuznubPkOzyANMTrrgX6Bab4sJhaJDC2rdVI=
X-Received: by 2002:a0c:e852:0:b0:698:e87c:7d65 with SMTP id
 l18-20020a0ce852000000b00698e87c7d65mr3221235qvo.37.1711749973661; Fri, 29
 Mar 2024 15:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240329075630.2069474-1-tzungbi@kernel.org> <20240329075630.2069474-8-tzungbi@kernel.org>
In-Reply-To: <20240329075630.2069474-8-tzungbi@kernel.org>
From: Prashant Malani <pmalani@chromium.org>
Date: Fri, 29 Mar 2024 15:06:02 -0700
Message-ID: <CACeCKaduUSrPG7w6hi=SPLwPjdJ31-9peHtyWwkitAhkQaxQHA@mail.gmail.com>
Subject: Re: [PATCH 07/18] platform/chrome: cros_usbpd_notify: provide ID
 table for avoiding fallback match
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org, 
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org, sre@kernel.org, 
	alexandre.belloni@bootlin.com, chrome-platform@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, krzk@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 12:57=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.
>
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
Acked-by: Prashant Malani <pmalani@chromium.org>
