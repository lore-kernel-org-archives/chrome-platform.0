Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4D78C1E
	for <chrome-platform@lists.linux.dev>; Mon, 28 Apr 2025 19:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745868773; cv=none; b=ik6JHy+ZYZCb9/mif9WAibwfHvTX0rtKz+wRuj2oev75Hgi21uwV2YwZsN6oWq7QhVk5W212/svK7KmN4JGqaN0Zh5gm+20MnQnm+uSZyHH93LtIaJR4VewlAwJFc0RIFdH+vyJJwUzypG/9iOIWGHN6zRqr4eGK5Cen3PE2vc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745868773; c=relaxed/simple;
	bh=Y6n23dawAWFH2JLNBPqMIuR/bd0pb0K07Z82KXD09aQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GAIWuE85Ss6VvVxeninB8QRRnU6UnxMgI4ydS+PyuCW7ox7qnvQlBiKMqaPvTk02aDJbL+oEcl1kvDFgysw+23hhTygSfKpa7rgtlMUnB7CNVXPaggI81VK0WB9HavIafANphF3EqZkTI84HXezSiPnKKiHd1kM50yd5NpfBZBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e1KaesJh; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e1KaesJh"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-224191d92e4so57492585ad.3
        for <chrome-platform@lists.linux.dev>; Mon, 28 Apr 2025 12:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745868771; x=1746473571; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfzpR+XCt8jA2E6ve9YtKygB0tbO6iFuLJbvzZ6DwIk=;
        b=e1KaesJh4IDwJq6nWwm9qV9tJUxlBxA6zcUaK1hlYOs8xjywAAa/67/R6SqnmCakru
         N5PsjUvq5JCCQrBE1a6tz5y8QResHFX1c8rxGVUBRLBE5D/Nwu4G0+fdrSFc4hBwno/X
         akuFDjthY9cAwa78g2DfTGokliBZxFceELPY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745868771; x=1746473571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfzpR+XCt8jA2E6ve9YtKygB0tbO6iFuLJbvzZ6DwIk=;
        b=E9izNE5kmszsyvb3GsUudcUWl2EFqx5+bIV0NFQJ5tpVHZLrRJu6foy3htWghOfAUN
         LTLacqcdlXPDYb3HLiO9lNUQtJm2+KpoEbCmwSLjdZjSJ9iECHirCsLsb5+7UNa8zSaV
         0dl1RcOysIVahmToQLicl16PEK4UgvnHYdEH+HULPaH0ImpeYArklFE8sbh+9UMkQ/BO
         FLmAbrlP/hzzMHEyOQDcW7H3uuFNY2B99f57vhAY/43oSuOfHOc1JttnRmftPlVI6cID
         3wxCIVYfbeShoEHoUYe5Q0Q02Flu/WYSQ+4mP28QLi5sqXrKfKvHVimJa/mukOAk9lve
         /W1A==
X-Forwarded-Encrypted: i=1; AJvYcCWh+y6bZmCVBNI7TYNqfRL8Zgoivyqp1hF/TaHV7HFTp7ks8Ab09JxWGB168yaZEk0vHdy0fQoj8Ph46i9JcB4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyebKbNnS1IsV8CJ7U/ibyBwI/T92bQVzV0xu9RmcmPaCxtQN8p
	aCieU7Ow46Kkcr3tHmw1Yj8BYihwMoW9Xx0O1QMr1NzvMF8l+hhA6ie8PsFM4TW5R7Bg6Wyarro
	=
X-Gm-Gg: ASbGncsHpy2DMZI4uCZqFx9Tz659tJdJgmIGgRLqh6uq/BZW3/eO39lQCago7AA+axc
	FeTdyOUYhjyBTAovCLgodG1dHNRcbNVe9ZAcuU1yDMPxZN95sEa08IiuF9AZUhbAObmyrMJPpQ9
	9+mMRfu8rv0BjHsqzr0Kl1beSRzmXZP4QOWlWPP9PidbJyUlpKPd1MdIe+O9WeJtQLtxaVFq+IO
	OnRcAonZlsQFI37AdKDKx9a+sowBtXzYevH4u6+OonTE1XYiJf7/Sn/vuVsWCPaocSqO7Jc2Be+
	5DBvVTDK6rv/jR9oML40D9VhF2v0irPRsZgQBIjpGS/uCzYE2sGo3m8XHssY/A3i0hkjYfxKOxl
	YsPzQ
X-Google-Smtp-Source: AGHT+IF5xVze17RhH331yC3p7sSlUliuu4U4fPYc6xA4Cjgi6ul5QYTh17WExV6B7mnJkqfTUt7+vQ==
X-Received: by 2002:a17:902:d491:b0:223:4341:a994 with SMTP id d9443c01a7336-22dc69efa2bmr146332465ad.9.1745868771670;
        Mon, 28 Apr 2025 12:32:51 -0700 (PDT)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com. [209.85.216.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbcc27sm87075215ad.84.2025.04.28.12.32.51
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 12:32:51 -0700 (PDT)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3012a0c8496so4142680a91.2
        for <chrome-platform@lists.linux.dev>; Mon, 28 Apr 2025 12:32:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXBhr8InuDOSR7C8Zk2tug7ksrIw7eoHHlS+085CSpZMRWcegpXAAKyV+ydh124EsFe0tNIm7GgBv22wphKmVA=@lists.linux.dev
X-Received: by 2002:a17:90b:5490:b0:309:f5c6:4c5c with SMTP id
 98e67ed59e1d1-30a01398884mr14674637a91.25.1745868770606; Mon, 28 Apr 2025
 12:32:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250421101248.426929-1-wenst@chromium.org> <20250421101248.426929-2-wenst@chromium.org>
In-Reply-To: <20250421101248.426929-2-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 12:32:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XLonF5qM+f6diESvnqAHKm4Y7wwPsNssdNqZfkn2OzSw@mail.gmail.com>
X-Gm-Features: ATxdqUEnTKoRxhC-TaBEXil7UFoCr2GvfRCzsqwspS2g_INzWAwlvG_Di1SAl68
Message-ID: <CAD=FV=XLonF5qM+f6diESvnqAHKm4Y7wwPsNssdNqZfkn2OzSw@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 21, 2025 at 3:13=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
> longer boot-up time. Power sequence timing wise it is compatible with
> the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
> out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
> enumeration, both shorter than what the eKTH6A12NAY requires.
> Enumeration and subsequent operation follows the I2C HID standard.
>
> Add a compatible string for it with the ekth6a12nay one as a fallback.
> No enum was used as it is rare to actually add new entries. These
> chips are commonly completely backward compatible, and unless the
> power sequencing delays change, there is no real effort being made to
> keep track of new parts, which come out constantly.
>
> Also drop the constraints on the I2C address since it's not really
> part of the binding.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Reworded commit message
> - Dropped the enum for the new compatible string entry
> - Dropped constraint on I2C address completely
> ---
>  .../devicetree/bindings/input/elan,ekth6915.yaml     | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
