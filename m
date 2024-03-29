Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C25E13E6D0
	for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 23:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711753443; cv=none; b=EswWEILbYpTlkg2LgRItpYIRGz1G+EcczC7bWwgZPnezrt0MIYGgQ3ud/eljzY5QHnBXIdXpDKHAxNkg6dojD+MTmjDKw0UDzTKUWX1+nkYOcaByjIz1swu0E9/yAGgM2ZCyLp1UvlivPlc0YYWF7RXAPKkym1wSmYFj2azNCxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711753443; c=relaxed/simple;
	bh=ElBPjDIZnQxhX8OMQsnhNQHvpAXQI/SVRBZi1UXufCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RUR5y3wDeAXaLQVDT+S9wiUO6RpgJ2XICyG17As/hAbsbHbJHHFCYo4cJbLcZ3wkGX5THY30+frXj8BgE6Oz9meDG80BDpoCSvC8vHyeOUYrPod+0E3iAXVisJEjfhS9KRuxKa0oQyJcVkvpjB2mPy0jdXjv9Z64MxhOka9+Jdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CkSGMDTS; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CkSGMDTS"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-696925248deso13950786d6.3
        for <chrome-platform@lists.linux.dev>; Fri, 29 Mar 2024 16:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711753440; x=1712358240; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElBPjDIZnQxhX8OMQsnhNQHvpAXQI/SVRBZi1UXufCM=;
        b=CkSGMDTSsnEkRCoz9rNFku4rtMyz132YpPWp6nEm5b2qGZIVm5H5ehncgjyH2GIz1V
         TgbLkXhkkGyJKQiavKX6iPE9bO3Yo/m5a/rXB4pdlkC8YHugnegq6YQ/T3KDcOUI6OEO
         qtMN6N3dKQPz+6VQpnSO+itTQxx2YoQxl2U98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711753440; x=1712358240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElBPjDIZnQxhX8OMQsnhNQHvpAXQI/SVRBZi1UXufCM=;
        b=fFRVGW+XcH5Ex3jcAacoS+BUf2K/hgxAl1mezu/0kslLil5qX22AOF6Mbm5xEDISuE
         0/CGhurBf2lIH2gz+Llu9+ggZgSX05JxY9AFpI+e0DIrnNMFaVNh/Dq+POPCXOeHCS8Y
         ZeRb8tfx7/w//+PNm2X1ziHsexyhzXD867J5GFP9pIRcB5nQR3MnK5s8J+5qvyxXSv9y
         cwxheGwF0jZvW/N49UgzXVH4Z9SC59aKP0XcEjQBxLiEF4ii/DE2qwd9mLg/Xb53BBMU
         MkY6xc4gePsVauFAf39tc8i7jtVPcH+4640XMJ53QCYHcyc+/9JD9Bn9wH2j5dNfo8T6
         mTpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdkDwr+ItNqA9hlzjFDkI0XO92m1kEYY45/g3T/Ote+oM2ekxEAtuhoJHq+pEafWu/O10ikRH0buKW08Uw970I9IXhVNTmWw616adnLKx6
X-Gm-Message-State: AOJu0YwzQwc+hhuAfhz+eSqTi5lExbsQ7sSlALGXjtoeAj2br/4rbY2p
	/E5x9cdld7ujc8LCmRQwJuo6hRQW+HVcr5++Tl2Yd+jGV0RNwYKXQUTMLc8SF5lfJ4kPFR68NJl
	MOS9QdThc3NI1Xyov31ULi+Ra2e4hIiAeegKU
X-Google-Smtp-Source: AGHT+IF+mqQ03gYx7d0d7DYJJ7rVBmyQcQsToUoGLPiRc+Fc5LU2ayUB7rH83oD5qBV9wXHQ8tTdvtFZhUqkRt2CKmo=
X-Received: by 2002:a05:6214:1905:b0:690:d952:f17a with SMTP id
 er5-20020a056214190500b00690d952f17amr1755577qvb.31.1711753440726; Fri, 29
 Mar 2024 16:04:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240329075630.2069474-1-tzungbi@kernel.org> <20240329075630.2069474-6-tzungbi@kernel.org>
In-Reply-To: <20240329075630.2069474-6-tzungbi@kernel.org>
From: Prashant Malani <pmalani@chromium.org>
Date: Fri, 29 Mar 2024 16:03:49 -0700
Message-ID: <CACeCKadpks=55-bfi2qOX0VdB5Fc0394OBEdKBoRBCsS6MNwAQ@mail.gmail.com>
Subject: Re: [PATCH 05/18] power: supply: cros_usbpd: provide ID table for
 avoiding fallback match
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
Reviewed-by: Prashant Malani <pmalani@chromium.org>
