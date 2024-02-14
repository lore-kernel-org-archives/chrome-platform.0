Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A58438C
	for <chrome-platform@lists.linux.dev>; Wed, 14 Feb 2024 00:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707869014; cv=none; b=aP1OZdqWUci/4LbN45koo89OMjhCX/mKr20K92cTEThrErv9oLeKNTtCRwgd/M3St1hAtODq2wfIGlptrI2w/MU3xLwVQkHxN0uR8UAWSjhD0SJctP6/4uOXGOIgb8zZLXVru9/23nFvsTcW4X4q2WhTSQpTb0DTJ+JjHyh9W2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707869014; c=relaxed/simple;
	bh=LUHwCmgFvsLI2w7Qfq1pAeSWXQrKo7dao4Gqpb0bey4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J6LdSkKqXqTKfwkwLYVeKXTuwbbbAXd9BqXbSpx4Kx89/sy7pWTs5VzZHi4VqTLLhHAZsJkccAljHADiYq09JEmxGztW2HSgzHvSpdAOBBWnCAlgCOzsgQ87bRJGyv1JFw8uTK5At234Wu0/vTht5quwXGweALnqnOu/csZzods=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UBvvh2a8; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UBvvh2a8"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-51183b02564so1960915e87.0
        for <chrome-platform@lists.linux.dev>; Tue, 13 Feb 2024 16:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707869008; x=1708473808; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUHwCmgFvsLI2w7Qfq1pAeSWXQrKo7dao4Gqpb0bey4=;
        b=UBvvh2a8gdaTGgEs0B14nsTDWesRKEDcWqoHJw/K4o3EZQUDmC5pzD6FgxnDq6WExS
         teJ2tAWg0kYcs1KsPAwqBsfzs1OFko0L1FreEVOFyBjgfU8HywL+IhasqtkHhd+zLGkY
         6l8Wty/B1kkmZtsVLc4g5QoQlehtnhb6/4CRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707869008; x=1708473808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUHwCmgFvsLI2w7Qfq1pAeSWXQrKo7dao4Gqpb0bey4=;
        b=CvGt6H8dHDJk+zKXEfcS+t8B99Uht1uA9/8SXO/IOl7MKrQwQ07NLZzr13HX8+lerw
         WGHpKuDbFKVwJTMAs2YeNn863N8cfp8Vgz4dhTH3GeJr9u5Fx54oLZfcUj+x+bGv7fYO
         LNsGKIeI/eDCbUss9It/+oOTbt7WCXWq22OG8Ms92NqRzUVHSKnvU7He4Dbv9wQ+xiBy
         N7ptHOmhDknNoFUyKyWjJfXA/e63xybADXTmktDT6tIOlZDu1ON0bFsfjqmJwkOA6Lzv
         oZBYgpOyefI30OD6y49LqB1PdMIqwtQr9LPjskBGkuqvYZkHsgPVtw+BoPxZItiqxU2F
         DYVQ==
X-Gm-Message-State: AOJu0YyrZWYOkGI4gpTlOLdkD+z5yoh0fIJGpylKKA5Kh8rZv9eK6Frt
	cWsldVwwA5Hf4//LaxaGQf5PwsV5klVvYojAHPj6Mn5HsjWgURgantNVqAfeNrGHR++nyeO/520
	XCSa2
X-Google-Smtp-Source: AGHT+IG8ErY8IAs1ayXhFfLtbkYuUwZ/d3ndrwo69i7JpL5YsIHGS+diYi3t2jf47XJhv0eU6ysP9A==
X-Received: by 2002:ac2:596f:0:b0:511:3bd4:6a97 with SMTP id h15-20020ac2596f000000b005113bd46a97mr676999lfp.7.1707869008170;
        Tue, 13 Feb 2024 16:03:28 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id u15-20020a170906408f00b00a3bc368ca7esm1762475ejj.53.2024.02.13.16.03.27
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 16:03:27 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-410c9f17c9eso100795e9.0
        for <chrome-platform@lists.linux.dev>; Tue, 13 Feb 2024 16:03:27 -0800 (PST)
X-Received: by 2002:a05:600c:519b:b0:411:e5c1:9b2a with SMTP id
 fa27-20020a05600c519b00b00411e5c19b2amr21434wmb.2.1707869006878; Tue, 13 Feb
 2024 16:03:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-5-swboyd@chromium.org>
In-Reply-To: <20240210070934.2549994-5-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Feb 2024 16:03:11 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UuunNnXJ0kAzRPVy0DX7Wv2eQOa-fMJQ-aKtaGnyQaQA@mail.gmail.com>
Message-ID: <CAD=FV=UuunNnXJ0kAzRPVy0DX7Wv2eQOa-fMJQ-aKtaGnyQaQA@mail.gmail.com>
Subject: Re: [PATCH 04/22] usb: core: Set connect_type of ports based on DT node
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Pin-yen Lin <treapking@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthias Kaehlcke <mka@chromium.org>, linux-usb@vger.kernel.org, 
	maciek swiech <drmasquatch@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 9, 2024 at 11:09=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> When a USB hub is described in DT, such as any device that matches the
> onboard-hub driver, the connect_type is set to "unknown" or
> USB_PORT_CONNECT_TYPE_UNKNOWN. This makes any device plugged into that
> USB port report their 'removable' device attribute as "unknown". Improve
> the connect_type attribute for ports, and in turn the removable
> attribute for USB devices, by looking for child devices with a reg
> property or an OF graph when the device is described in DT.
>
> If the graph exists, endpoints that are connected to a remote node must
> be something like a usb-{a,b,c}-connector compatible node, or an
> intermediate node like a redriver, and not a hardwired USB device on the
> board. Set the connect_type to USB_PORT_CONNECT_TYPE_HOT_PLUG in this
> case because the device is going to be plugged in. Set the connect_type
> to USB_PORT_CONNECT_TYPE_HARD_WIRED if there's a child node for the port
> like 'device@2' for port2. Set the connect_type to USB_PORT_NOT_USED if
> there isn't an endpoint or child node corresponding to the port number.

The above sounds good, but then I look at patch #18 ("dt-bindings:
chrome: Add binding for ChromeOS Pogo pin connector") and patch #22
("arm64: dts: qcom: sc7180-trogdor: Wire up USB and DP to
usb-c-connectors") and it makes my Spidey Sense tingle.

Specifically, I _think_ if a port is "hard wired" that can sometimes
tell the system that the port is a bit more trusted. In the case of
the "pogo" pins on detachables, though, I don't _think_ there's
anything that prevents someone from making a "pogo to USB A port"
adapter and then you could plug anything you wanted into the pogo
port. If there's any extra trust given to these "internal" ports a
nefarious attacker could presumably abuse that trust for the pogo
pins.

I have no idea if this is a realistic concern or not. I'm about 95%
sure that hardwired "PCIe" ports get extra trust and get "deferred
IOMMU flush" enabled and, in the case of PCIe, that actually is a real
security hole. For USB, though, I think the system is more isolated by
the USB host controller so I'm not sure that there is any extra trust
given to "hard wired" ports. ...so maybe the answer here is to just
ignore my rambling. ...or maybe the answer here is that everything is
fine but patches #18 and #22 should be modified not to cause the pogo
pins to be considered as "hard wired" since they really aren't...


-Doug
