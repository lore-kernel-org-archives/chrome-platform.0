Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E5D38D
	for <chrome-platform@lists.linux.dev>; Thu, 15 Feb 2024 00:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707955668; cv=none; b=gmCOjTFfowFZNFg2ochi8V4Symb+56NgJeaHBkt0/6XGOLOIYp48293Xody4CUchk+iwC0aG8Ea7s50eKJrGfISDtwOeNXRuVtiTj8Tlvy8h1TX4KKie4Aa2pylUqAN0OsudC03Zim6nBGUOoYyZNk+C11BBjJ0jJXb1FPlSuYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707955668; c=relaxed/simple;
	bh=mqihVnhqmNxSJUbv/RGxqZmC0xVgRGexMSCP0Ns7bYU=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jIr4qiAOsBp6mj/v4YBC/zglGrZJLojIse6Q6gkWJIrjXRreDLaBgZoHL7haKQPYiZMUJtM4SWMkGzNsnf9SV/aadv7ECHCRklpNJDIYn3GVx34m1uZhcfxUYtCuR4QUpgYtbiYti+CrM6jCVqkD4NPT5KSadQGYMvxRl87AYmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ncvWl5wu; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ncvWl5wu"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5114b2b3b73so360101e87.0
        for <chrome-platform@lists.linux.dev>; Wed, 14 Feb 2024 16:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707955664; x=1708560464; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Er+ESEKbgXvc1t5qmUg/dKRx14VLf4dPpeD7i9BwE5I=;
        b=ncvWl5wu65jGyezVrNFU6a5eRwiA1/nLYmL3i0I28I8Fi4LVyqjVe49sUrJ/0jWlXk
         LFJxDn4SHkGJ2U9E+c0ZSy1dcpduQ9nvRqQnmpiBnsZJtlPboBcOBYdzTHjLW6Gs0cYk
         frpgavUED3Cq60dQILpGI5CnMx0frZ/ZFfej0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707955664; x=1708560464;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Er+ESEKbgXvc1t5qmUg/dKRx14VLf4dPpeD7i9BwE5I=;
        b=Y9ljL9LGT3Iz7YkTO0bij6XFdFh4smuhhDRDVW7HnRq3AINHK9pWcsa8CnWEwUEX+y
         DvpcnikozZ+KXhb+OF8TXI1AwEJ0z+1zLPwXhn55IHGzkUFdYGADV8s+miH4ueLFOu08
         eIX+Axm/+tdyYYCRroBfmxJID+dJ/YRMloi4w0c/yu7vwvRftSmGCU6six+1F2+83YgK
         k/hMyrX7yyxvm8OzVWU6fHIE5li/sMLWu0QogK9OaCZcmggNJKfvAT5paHBWHnQScghh
         O55VllIUB7DZ1VywpB0uocZFs0Pfw9NYAhO228OwFxK8ykxPow5GxSfi2V0ShVaEIWjd
         zenA==
X-Forwarded-Encrypted: i=1; AJvYcCWqE3sQCUE5ZPvLdDgYJ0dlJLHN1ZLIYZz/E0s1wDQXJva2hdXBEP5alYmbOY1WXKGOv6A3XmSaUlK6O5hoNWm+AoaIzw8vw2f5ob2+4MDg
X-Gm-Message-State: AOJu0Yxos+ZNK3i3holWIbjv6XGfZycLq+cP8TkajArtpU/8a5/mqhsE
	FiVOIe7Lvvy4BDYnJOuJ84LyP8jdXV/+TMuddmyiLPwgjV7/3ghw6jnD5T8YsE8RCdNbwp/QC9z
	O9vkmwcocmSIUttmdsE+QfNpJI1Qoiw5AQBWw
X-Google-Smtp-Source: AGHT+IFV146fri/yEai625WOmmn4P92hjYL0lv0BuNrjWlIcprz/viy3Rv+xCRbYoWq6nvQJZDmqN9KcjzHIR0bVyZk=
X-Received: by 2002:a05:6512:77:b0:511:7292:c4db with SMTP id
 i23-20020a056512007700b005117292c4dbmr243676lfo.12.1707955664213; Wed, 14 Feb
 2024 16:07:44 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Feb 2024 16:07:43 -0800
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <18ac05fb-a78d-4e95-a73d-461f509cdc5f@linaro.org>
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-19-swboyd@chromium.org>
 <18ac05fb-a78d-4e95-a73d-461f509cdc5f@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 14 Feb 2024 16:07:43 -0800
Message-ID: <CAE-0n50Y_GRMt8km=XjGC5Zm5dvb2t4gccznJn9HEFS4p7y8fQ@mail.gmail.com>
Subject: Re: [PATCH 18/22] dt-bindings: chrome: Add binding for ChromeOS Pogo
 pin connector
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Pin-yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Krzysztof Kozlowski (2024-02-11 05:39:36)
> On 10/02/2024 08:09, Stephen Boyd wrote:
> > diff --git a/Documentation/devicetree/bindings/chrome/google,pogo-pin-connector.yaml b/Documentation/devicetree/bindings/chrome/google,pogo-pin-connector.yaml
> > new file mode 100644
> > index 000000000000..5ba68fd95fcd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/chrome/google,pogo-pin-connector.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
[...]
>
> > +properties:
> > +  compatible:
> > +    const: google,pogo-pin-connector
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    description: Connection to USB2 port providing USB signals
> > +    required:
> > +      - endpoint
>
> Drop required.

Why? I'd like to make it so you can't have the node defined without
connecting it up to the rest of the system. Is that bad?

>
>
> > +
> > +patternProperties:
> > +  "^keyboard@[0-9a-f]{1,2}$":
> > +    description: The detachable keyboard
>
> If this is detachable why do you define it in DT? Only hard-wired USB
> devices, which need some sort of special handling. are described in DT.

From the commit text:

 We expect to find a keyboard on the other side of this connector with a
 specific vid/pid, so describe that as a child device at the port of the
 usb device connected upstream.

ChromeOS userspace is checking that the connected device downstream of
this port has the expected vid/pid to quickly rule out USB keyboards
that aren't the detachable keyboard. I wanted to express this in DT so
that it didn't live in ChromeOS userspace forever.
