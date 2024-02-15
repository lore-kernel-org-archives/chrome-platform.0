Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5221ED9
	for <chrome-platform@lists.linux.dev>; Thu, 15 Feb 2024 00:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707957897; cv=none; b=CzSMXLd9dJZbdPIvpJB07/9JTF+styrzedyQ8eEzI41QGUpS6rxcCUk4WK/y3DykJa8tB8LUnRk7r1aXC6CWphupSfUn3PBplVic6tEyNI/mBNHdXai6qYGYEVSIg7nTPZMH1r88YIIF4RdsEO5Yc3aQdxdHmlcKUHiQtPF/U1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707957897; c=relaxed/simple;
	bh=wP/opWg4NPPj3Q1TJjBcRMLyLYuk3vBq7WguCOVgHEk=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ADjzzsxa8UQysgsjR8pycBiAtfhjTeH95hYA+sR8SmlspWrMtZZTqUJMabJoFhpJuKnfNfttn4sB543QsWDFuu38IWFB6wXNsPbHDrCztKm7rIa+NHH/IS2BWf40FDE5AT5sY6zzzGqGe0/+/ukLOxJUEGojq4eAqNurTn6o1x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y8QHOChQ; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y8QHOChQ"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d204e102a9so3445401fa.0
        for <chrome-platform@lists.linux.dev>; Wed, 14 Feb 2024 16:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707957894; x=1708562694; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZK7IS77/W7TToczCQpY2GYKtvK4AuoqqptX1LvYKQRA=;
        b=Y8QHOChQR/tZrshkhmnQf9JxOTP2KOfGitD4G7eSrJ9E3MuczzpmdZjrN9oJUQqaNc
         LRhtj1SEMTCgrm8xdOmlErSAXCIq1onNw/BH71K218uIRqqg22LDHL01qZKOnrAwISC/
         IC88xpU4UM1HL28Ri66+UkfTIy8DqFxIzrVJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707957894; x=1708562694;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZK7IS77/W7TToczCQpY2GYKtvK4AuoqqptX1LvYKQRA=;
        b=diB8tBOrVoyidiLdLyKhWuV5PV2CaV9oTC2KZfgpqt4dV6thtEaABkoUso/aHYC9WP
         u+/xJY7x8ociYtoSmSf5gsQb5p8odLflyBetIpSptYtbbjZavwc94CLOFQaqWGzj7tjB
         1dDezIO4Didj+/Gh/HCFL+ZNcTg+Ys4rZeV1pYVKHmxCu819IMNxnqR3AvqWxCwbSIck
         1exN3xSh7vGKrBVDSd1r2RCiQKjYH367WokyZxyt7HpIaVka6fGGdgmcrZ6Ksz2EFenk
         uopoOV6c1rf4YJdi/45P+GpGHOlGryRZqMUgPtp5CBeek6y7eGD712c1qoPDYrzOjjYs
         OFoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9j/qmxTxCkd+ErulG6KFuoZFDywqn5xXQgVLglZcHTvx2HsHAXW+lYjsFn+rbQkDqdhWKTHfS7TfYCj8TUn6AribPKJQE5hZzChId7Qro
X-Gm-Message-State: AOJu0Yz/TK7xi8uBpvS2wcUL4ACkfA9G5jVcUjOTfomrNaHmu5uu8KS1
	yB93mmghQbKjWrjZV5LMMOFJr4zhk/EQZ6nB6DD42lmm1I9oKXBCiS1puVTp7qDaefn3Wr4TTLb
	oqi5jR7FL/9ArgmOBCRg6uGnAaoYblNdPD25s
X-Google-Smtp-Source: AGHT+IGKsNObiv5/sSxZv6aITBScisJn3oLmwBXS+yX42z/wkWCduLTcJnTn4E24I+pmYo583/8HG2h1y512aeNzcHg=
X-Received: by 2002:a05:6512:3487:b0:511:5c98:acd2 with SMTP id
 v7-20020a056512348700b005115c98acd2mr193884lfr.37.1707957893979; Wed, 14 Feb
 2024 16:44:53 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Feb 2024 16:44:53 -0800
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <a6ce4811-2a3d-4df6-aad3-9942a1bcfedd@linaro.org>
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-2-swboyd@chromium.org>
 <a6ce4811-2a3d-4df6-aad3-9942a1bcfedd@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 14 Feb 2024 16:44:53 -0800
Message-ID: <CAE-0n50Ms_QcscgGrFe55O-j5j+GA+GvvDmp=Qo60bcSD9VxUQ@mail.gmail.com>
Subject: Re: [PATCH 01/22] dt-bindings: gpio: Add binding for ChromeOS EC GPIO controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Pin-yen Lin <treapking@chromium.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Krzysztof Kozlowski (2024-02-11 05:26:33)
> On 10/02/2024 08:09, Stephen Boyd wrote:
> > The ChromeOS embedded controller (EC) supports setting the state of
> > GPIOs when the system is unlocked, and getting the state of GPIOs in all
> > cases. The GPIOs are on the EC itself, so the EC acts similar to a GPIO
> > expander. Add a binding to describe these GPIOs in DT so that other
> > devices described in DT can read the GPIOs on the EC.
>
> ...
>
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    spi {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      cros-ec@0 {
> > +        compatible = "google,cros-ec-spi";
> > +        reg = <0>;
> > +        interrupts = <101 0>;
>
> This is should be proper define but then are you sure interrupt is type
> NONE? Does not look right.
>

I copied this from cros-ec-typec.yaml so I'll have to fix them all!
