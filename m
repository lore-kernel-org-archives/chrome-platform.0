Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6CB3E47D
	for <chrome-platform@lists.linux.dev>; Mon, 22 Jan 2024 15:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705936186; cv=none; b=PkXJi8lwwXoirXhsIfd4fTB0SVtYmN3hYI8nJtpxEYHlcB8ZlBXwR/pOVu1RvwsMfM03n1q2CE78v6MVl07ZBELrsehJ42sAiAXEJ3EDbDUTuw+9XyPNHg2W/vDBM6illdjDmusI3Hlb/w3WvwSHO4bxq8RdYzUwGyZlOAeeosk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705936186; c=relaxed/simple;
	bh=jRrHgiEv5YrpuZPjYjnGtdk6oRN9GqngHkVDqIa9fq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hPW9r4JS//PpQLFEAK7ih0OZiY1COLKUa8+81YCmT65fRiG2jZb3mKoTOaDitAYyvIl9tA/4U4AlVYZQzbnZTJfv5RvnOWn/IQCayK/Kv3jrv0OAyogicywhbOiLApwTT+qUIrREVGCYR3eu+qrJsgoLi+GWhrCGsDbm1fIj9lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L4CAHYIW; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L4CAHYIW"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2cdeb4b9aa4so38590701fa.0
        for <chrome-platform@lists.linux.dev>; Mon, 22 Jan 2024 07:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705936183; x=1706540983; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6qCq9mjgzXIcyyu8Xldo3rtV6iy8jAQllHcjOflIOk=;
        b=L4CAHYIWbBamRm8plaiK1H+eoXuWN+LzmYScuMvU9l/WhjRnuAW4o+FPD3vSx4rmMB
         RZ9E1+D3A1WgQPM13MuKAqxFusHlbbSBpuW0FkQ6YlgUwf80hmlP2CIYxkf0Ieo+N6y2
         VVZSk4UN78GuSMf76HE9rN46OLVrt+UyTPwIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705936183; x=1706540983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j6qCq9mjgzXIcyyu8Xldo3rtV6iy8jAQllHcjOflIOk=;
        b=tnUs30PnHB//8iCBcQsR58QVMjwcDHR/Y4+xR7JG1g6D2jatSuzuBDwC1+LxUe5ZCs
         6KlINOYpZ92L1s/xCnmpn9erN85ld66fcbvxIrxyloWTc5d3Echp4bo+Kar1a3jl38t3
         l6S9Hv3UpOTTu9/HcCvx+kwaqjcsHH3qxn06LCpQ8afl5Oa39rVRi+SiiYFlb+m8Z1LC
         +BIRK7QY5LTp/mC0i94vQX1mOe1e+695l5fK/faO50xY40nLibiGO7p4VbMPhv0Stp9o
         0kz0ULdEf86Yt38L58mxjDqan0JEoc8bWAPCO/r8ZmhF9Z8S3kIijWNv8AMGJhrtX/o6
         e/nA==
X-Gm-Message-State: AOJu0Yz0+0uFCSEUod/0rqEU2UscYOHfSxL+IoJCsme1if5X33cazKV6
	LrgwwoEsRf1VLNxRDR+gyBs3sUQQOMuNq62Lx3Heh/mBmGZgytV1BjE9pDmhCXNS6zy6LeRKvs7
	Sf1IkimKQNF7VHwM7ZHFvbi9n+JRvMD+2mpkl
X-Google-Smtp-Source: AGHT+IH5Di7gCKwIzxDI07ur5JWxCa0Zy2fz4w+FDojoTf5Vohxn0BkqSkHrzamnSL2FdOcvdK/g7QH5prbur3jeycY=
X-Received: by 2002:a2e:a408:0:b0:2ce:fd80:210b with SMTP id
 p8-20020a2ea408000000b002cefd80210bmr890160ljn.3.1705936183235; Mon, 22 Jan
 2024 07:09:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240119084328.3135503-1-lma@chromium.org> <20240119084328.3135503-3-lma@chromium.org>
 <1e7b8590-7dc7-47a8-8105-6d01db627f85@kernel.org>
In-Reply-To: <1e7b8590-7dc7-47a8-8105-6d01db627f85@kernel.org>
From: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@chromium.org>
Date: Mon, 22 Jan 2024 16:09:32 +0100
Message-ID: <CAE5UKNqF1h5SCrVEjGR_5jeDZGBkbSZGxZTJ39Wb2vONHLdk2Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] watchdog: Add ChromeOS EC-based watchdog driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Gwendal Grignou <gwendal@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Radoslaw Biernacki <biernacki@google.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 11:31=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> > +     wdd =3D devm_kzalloc(&pdev->dev, sizeof(struct watchdog_device), =
GFP_KERNEL);
>
> sizeof(*)
>
ACK.

> > +MODULE_DEVICE_TABLE(platform, cros_ec_wdt_id);
>
> device_id is not placed here, please open existing drivers for
> reference. Why this isn't referenced in driver structure?
>
ACK, I will take s3c2410_wdt.c as an example, thank you.

Best regards,
Lukasz
