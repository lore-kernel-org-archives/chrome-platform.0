Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C81D46AB
	for <chrome-platform@lists.linux.dev>; Wed, 14 Feb 2024 01:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707873477; cv=none; b=sF4ATgsWpZsSAO70daB1Ffol1uWCMxx22EUPXkee/enFzq/NvQjcvodO2THhln0Mg8iOv1jmprLJb/6Lsso0RXFO9YGesSQUSut2Amy54Ap90LgK53Xo4vp6OUCH/pESEojgzCJxLKeTP9P5vVyDZcZKouZl5625XT6TaQKljb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707873477; c=relaxed/simple;
	bh=rBM05EwNb5zPmJZsUcrviXxJFm4T/Pw0l7QiMDppS5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JLFNcCaI5G5hVq3y5cXD0jH3qcEF7r60OUzN9Kimhr1XJX6Y6c2mGmsAEocCiX+H1c+oDq3TNnLC2tyaJVDoVd8h4aCm4h0eaarVF5+W/rSBZ2nmAbhQYIkLeWCaDfNV0vzv14F/cS7xJ0QjhgUf7TnTghvq/hsCz32CKdjD8dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lF4IVjVk; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lF4IVjVk"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-55f0b2c79cdso6988357a12.3
        for <chrome-platform@lists.linux.dev>; Tue, 13 Feb 2024 17:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707873471; x=1708478271; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBM05EwNb5zPmJZsUcrviXxJFm4T/Pw0l7QiMDppS5M=;
        b=lF4IVjVkq0zoeTjK/sRz5SP0JtJKd/YuJobILjJIkXwVbyoPpSYqX7Tb4jR3G8iyd5
         RWqhuYEyavUL9cghLStJLPscLjv8EjVd6fn57YzEcYfPQdsqrvqn7D8Cpz+Z2y+YXakA
         LQ9LksP5PKas91t/5Gq0e5Y2v+BDLCo1GiVjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707873471; x=1708478271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rBM05EwNb5zPmJZsUcrviXxJFm4T/Pw0l7QiMDppS5M=;
        b=wILNYMi95FlLMgDC6WvTccQfmAYDxb3eHck+xUYu40ga0ZuR/JcsJ+swWqb0Ftb/Wh
         aKeUE9O0zDb3zEzuuLf1TtOzrhZSFUXl0/PUdedXTlXYLCSjO31dIzK+Bmpp4cBOWntS
         AsHnFdYjSFeFoeQdVU4MnFZoB8OBs5fhtJ9QY6YZ/1iIkepopPs72H7IZc8mpgDZ/T21
         LmxvV66BFcxr1PcN0DRr8rDJgdGvzx9wv6qCJLk28BC7NLSIU6rBzvDUI4N1zFnkZfkG
         WoSSSN9IQKpmZZI54YJRbN2NnM2EkTsODtm5nt2QiPeA2O8tqWA2SBSMRvU0Fq50K8o/
         Dd3A==
X-Gm-Message-State: AOJu0Yx1y4sT5KcgEKQ5khkspvshK0oe1nHGBLjvWxLCEI0y8xPFWWx0
	L4jo00YKvTaOfvIP1Q6Fi2ngVyd1jQKCFCLvClkfI+rg59jFmiJ8vhC4JefHK8S+ExGzx1Lx03i
	LjL9w
X-Google-Smtp-Source: AGHT+IHNuXDP883nZZSOkZRwFjMWmWlm9q4KzbduokpUcP1GzpkBN+Cn0BDvU5s0uy+pPPh8K3c5JA==
X-Received: by 2002:aa7:c40c:0:b0:561:998b:ae27 with SMTP id j12-20020aa7c40c000000b00561998bae27mr930377edq.33.1707873471631;
        Tue, 13 Feb 2024 17:17:51 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id x63-20020a50bac5000000b0056368be8a58sm21291ede.27.2024.02.13.17.17.50
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 17:17:51 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-411d9e901dcso45525e9.1
        for <chrome-platform@lists.linux.dev>; Tue, 13 Feb 2024 17:17:50 -0800 (PST)
X-Received: by 2002:a05:600c:4e4d:b0:411:62c:b4ae with SMTP id
 e13-20020a05600c4e4d00b00411062cb4aemr75039wmq.7.1707873469959; Tue, 13 Feb
 2024 17:17:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-19-swboyd@chromium.org>
In-Reply-To: <20240210070934.2549994-19-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Feb 2024 17:17:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WE4bgwTWTKjPbQR9RCt-SEVZXfQtXoaXAjvTiZiMr=wA@mail.gmail.com>
Message-ID: <CAD=FV=WE4bgwTWTKjPbQR9RCt-SEVZXfQtXoaXAjvTiZiMr=wA@mail.gmail.com>
Subject: Re: [PATCH 18/22] dt-bindings: chrome: Add binding for ChromeOS Pogo
 pin connector
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Pin-yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 9, 2024 at 11:10=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> Describe the set of pins used to connect the detachable keyboard on
> detachable ChromeOS devices. The set of pins is called the "pogo pins".
> It's basically USB 2.0 with an extra pin for base detection. We expect
> to find a keyboard on the other side of this connector with a specific
> vid/pid, so describe that as a child device at the port of the usb
> device connected upstream.

Can you remind me what the side effects would be if a different
VID/PID shows up there? I know it's not an end-user scenario, but I
have a pre-production "coachz" keyboard that's actually programmed
incorrectly and shows up as the wrong PID. Presumably I could either
throw the old hardware away or figure out a way to re-program it and
it's really not a big deal, but just curious what happens...


-Doug
