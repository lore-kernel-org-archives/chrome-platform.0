Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724CC82D7A
	for <chrome-platform@lists.linux.dev>; Thu,  4 Apr 2024 11:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712230355; cv=none; b=psT7X7Qy+kCUhj510vYpXBJQJRc5LwFYtX6dR8yBjnaUWkK6BOdda1s4Al6bvcO6281U3wSIbJAZ6Ieyx5pEP3EpFEndnQgzeBMzygtBgx9x8qvA6iPirdkVEFjUETyZF+lv0LSA0Ic2N4Q+PtP9lsLEwxcBDAaI1aKisK5T548=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712230355; c=relaxed/simple;
	bh=wUwTbBI6FvC+9csBIWb+K1MiF218QWtdW5pK12heMYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l7UgYg3N45P3rtFrSmYuR0umdwCWxchm3n7jthZUNzJcHS2AJecY9jlPGGXgvF22w9bja4I5pP04VYW9lzsLwyU7+f/qKM/iEuKBFuICDW7l5CKE2kehiKTehWxMfHMnfk5xNA+xg5ZAAzDsBU9MYJ008TfgtfiPGWRcGPqnQzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=THGoHvg/; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="THGoHvg/"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dcc84ae94c1so987519276.1
        for <chrome-platform@lists.linux.dev>; Thu, 04 Apr 2024 04:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712230352; x=1712835152; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hqMPpBRPBNPrxNkvU21NJl5hteTV5S6UOoiZfBhbP8=;
        b=THGoHvg/N+W+Koh+16P/bRLGPXsfZbYUqZMlu+zU82d+jnvVOsdYeFum1GEN6rriAL
         +Y02ArhoTTH6DboId3nI7X4IZWkOSXMGmdauwqiZwOU19yr7dZ2li50iIMprCuFqCgHt
         YeZ+D4PkkZ3RqdWo0hDqvoUMgtodAk3wJFj8w43VG5w35cejwfcSOytA+c3ALQwCFv9p
         PsrKxWqlfe7P3N06huHqBHQPLOSoqx8gl/sEYMq8w0hg6kvyfITfOGIMvj1EMAF4gdce
         kA+aKjEUfYSuCS3sPhtapBJuEY2tBm8G+OzHjYycb3Lm/iJc8F+JAVau9aoUnwyPTMJq
         n0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712230352; x=1712835152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6hqMPpBRPBNPrxNkvU21NJl5hteTV5S6UOoiZfBhbP8=;
        b=Rr5xyyD2ki4OFOJP2geYr5HOfFhHQJZPruJV1BFhI8PXzyfq4jfeDkSz24LkksYFrc
         hjjM6WMkoZuU//CDJ3wL0NNLGyu+7drQoOB5+D1vzQgkmM8p1vInVTs7aAQkAA8oH1au
         pp+/IOOe539YQExhCgbbyeGdeQrThPZWrvSW/QUKMiHDbx7F6tCs8hrvaDF/RuhlQrvP
         o/ZHPNYqL4BJFFchfE3XpI6BACe2/a7ujOC5Yv2o4HbyU/tHUTQx8LxNR604Wzoj26MV
         4lafFgNH3NLIkMEdBe7+aJWAu1kQR//RXCQYmwdNMD1HNAjDbjAxgbUSArWy05fxZxfI
         sx6g==
X-Forwarded-Encrypted: i=1; AJvYcCUd7i9+HG/tEOYT9ZHnusg4QM6NFyRi44B5wJys0YQ4rCp3GOb5and2xnNta3KYvAt23wRn0iC2LL8O2oeVWBX6fZFD6W6hIfJtglaghD8Z
X-Gm-Message-State: AOJu0YzZjPE/tmNgD/SJJ6PDZTkby42SZ88Z7W9MWS24FjQs/Xu+bj2e
	7bbfpCUKEmmy5cjmjy7im8I1XbvXa7seCmiN7zvXXhx+mHR4aRlU5dCunve1qsQDVVndq4Im5gp
	qSu5HIhPIQzpXFk/WSOufMzgmHEbzMOUiY14RSg==
X-Google-Smtp-Source: AGHT+IF8EfX9KQQ1p4iTi06dX8tZK+FXrkWjcL6lXHqjNaEzB+PCWJA7HAgzLCdOea5bBV2RrgagddXs06++gkV4LIw=
X-Received: by 2002:a25:dfc4:0:b0:dc6:e4f8:7e22 with SMTP id
 w187-20020a25dfc4000000b00dc6e4f87e22mr1960662ybg.62.1712230352423; Thu, 04
 Apr 2024 04:32:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240329075630.2069474-1-tzungbi@kernel.org> <20240329075630.2069474-3-tzungbi@kernel.org>
In-Reply-To: <20240329075630.2069474-3-tzungbi@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Apr 2024 13:32:21 +0200
Message-ID: <CACRpkdYGH27Z3YKN4b1y_ZeagbtYqX1Wo7BXnyKsZ=oH-FoQmg@mail.gmail.com>
Subject: Re: [PATCH 02/18] gpio: cros-ec: provide ID table for avoiding
 fallback match
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, brgl@bgdev.pl, 
	hverkuil-cisco@xs4all.nl, mchehab@kernel.org, sre@kernel.org, 
	alexandre.belloni@bootlin.com, chrome-platform@lists.linux.dev, 
	pmalani@chromium.org, linux-gpio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, krzk@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 8:57=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:

> Instead of using fallback driver name match, provide ID table[1] for the
> primary match.  Also allow automatic module loading by adding
> MODULE_DEVICE_TABLE().
>
> [1]: https://elixir.bootlin.com/linux/v6.8/source/drivers/base/platform.c=
#L1353
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
