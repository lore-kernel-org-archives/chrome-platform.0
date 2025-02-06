Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789901D90DF
	for <chrome-platform@lists.linux.dev>; Thu,  6 Feb 2025 20:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738874626; cv=none; b=J5bmXRzQb75m6Jno6tYxIoG9v6qQIK75TkxdeywrlKOS/4SCdHHHn5oBl1E5vcegQzivgK/UQt0G0KaPjEMONlYW2S1Pu1qPYDkZIRx8JAl+WdAVjCNsv4ccj6ZjouT4eaWq9gZyzO8bM2obVdIbTn2v03f9sPsQtDz++kTgD3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738874626; c=relaxed/simple;
	bh=ghMXVxcLYuC3amakcAM+2RrFtMQq4/vF5UL/FgqkJjk=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HmdC60EU/b7i8rvTEcPkcukYGIiuA8zQr10rH9bDpnrqqYq1B1CDUqdwR+nI40qkEKDnHx+BIvzsi5b9UcfSC5T6tkyqvneC49Tzl8Ybs+GXV8oraC6Mh2v+ZVZkXUL0Caw73JM77dOf6J23zTZrqDXgDpyqSVUyBLcDi7u0t30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FhxgEPqD; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FhxgEPqD"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b6eeff1fdfso114725885a.2
        for <chrome-platform@lists.linux.dev>; Thu, 06 Feb 2025 12:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738874623; x=1739479423; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ghMXVxcLYuC3amakcAM+2RrFtMQq4/vF5UL/FgqkJjk=;
        b=FhxgEPqDhRUKUf3NV6Y1QPYxG+d1iRz8NfLnTq0UKmgqNPEjloeswjicWx/rDCiyT0
         /ThxfPFK5ZlbOuVjjMKf6yctAbY6xmHtWjXzoLQVdkU8OgZ/W3Uf/5QyBjcB3lLEja8L
         miJJpzxclbAuOUupFd1fUUEooUWLjOUZcQduM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738874623; x=1739479423;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghMXVxcLYuC3amakcAM+2RrFtMQq4/vF5UL/FgqkJjk=;
        b=kFH2vqWPouIZCMiAkgcqizDtaEZTZuPeHdHeOZzSiRFa8q/qdjLf5mI1LJNbCNgAd8
         ZsL9k+5jSs4JLw1lw0eZ272Y7ZEjHW7XsjEdjkFCIpdXkK4MUBzLF4BMXrjplOarSfJ4
         pO23/1bypddWOkbJteU6PHKcjEI1SkAJLuex6p/H+QOzrnY7I8pKpRlR0pZkuCQxGObp
         EBD5Z04uPbeVgEl5mzLdKExlxUDq3bexIUAGULfiBg4xDszx+w2vPBGr28ydgfkOQ2bR
         cxIHcCznK/t1w5n7JeE9IGiGVSiYadqYBmIHRDpucjykTD1Oz5I2V2B+hipidU8a8fFn
         msmg==
X-Forwarded-Encrypted: i=1; AJvYcCXgZQPZNfRy6KX7mJ4R3EbpoVb3oSybwDSQ67cqB5ETfDr6bqjozhaZZQwBXaC7F3AgFcwm69lE8IDZs8VjX1s=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOZ3NlRt0FKQVTCc4fQGIHoNpeVtWiotuFOrAIuESAXnSESqX/
	tTGHIeNmTTGJ0meFzCWc+H6suNpuz5bPMNjDR1D5yvt2O7byRJelknZ0KIW67nb6qQAZBUdjWdC
	g2eidE6TG8TJKowJ/aSaoZGi2CMD1W9f7pxDx
X-Gm-Gg: ASbGncvQJkMFBN0o3a16D5oi0T6F5KzrKpEJjd7j5ohCLOoVyA3obR0Ol+3Gp/askHA
	OQ7HHV0rFn1cJyZp7vJGOVqekHliqYPPjS05e6GMtmu104PMeVYshZ+a+PLad0BTrDqQ2KrAthk
	I3EeHta21H1viQgHzpdTYQC7el
X-Google-Smtp-Source: AGHT+IGIi7KHGakyYrhAS6Nm6sSDzZzym1yivy6eswLvWosFcy/m0lzamEPvxM2Mp6Z9Nh8JG+b4sn+mv4BnqJ62Jhc=
X-Received: by 2002:a05:620a:f15:b0:7b6:dc74:829f with SMTP id
 af79cd13be357-7c047ba4996mr111088585a.7.1738874623312; Thu, 06 Feb 2025
 12:43:43 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Feb 2025 12:43:42 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Feb 2025 12:43:42 -0800
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <74527323-31ff-4ed0-b19f-e535f26abf2b@oss.qualcomm.com>
References: <20250205233016.1600517-1-swboyd@chromium.org> <20250205233016.1600517-2-swboyd@chromium.org>
 <74527323-31ff-4ed0-b19f-e535f26abf2b@oss.qualcomm.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Thu, 6 Feb 2025 12:43:42 -0800
X-Gm-Features: AWEUYZk9G69zlKfea1G0cVv2Pso0fG2dCEq5z01lgx0Eou9Uj4laycjO7Oq51wY
Message-ID: <CAE-0n50DXcAXQMaLtsamvxHjUrkJVBz42G6gtgKgW9Rh=qd31Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: chrome: Add binding for ChromeOS Pogo
 pin connector
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	patches@lists.linux.dev, cros-qcom-dts-watchers@chromium.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Pin-yen Lin <treapking@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Konrad Dybcio (2025-02-06 03:30:50)
> On 6.02.2025 12:30 AM, Stephen Boyd wrote:
> > diff --git a/Documentation/devicetree/bindings/chrome/google,pogo-pin-connector.yaml b/Documentation/devicetree/bindings/chrome/google,pogo-pin-connector.yaml
> > new file mode 100644
> > index 000000000000..622e171b6b08
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/chrome/google,pogo-pin-connector.yaml
> > @@ -0,0 +1,68 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/chrome/google,pogo-pin-connector.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google Pogo Pin Connector
>
> This looks like a very generic piece of hw.. many boards (esp. convertibles)
> do the same thing, with 4 or 5 pins on the bottom of the device.

Yes, connectors are basically just pins :-)

>
> But of course hw manufacturers being hw manufacturers, many different kinds
> of signals go through such connectors - if it's not USB then it's perhaps
> I2C or some variation thereof

Right, and I doubt they call them "pogo".

>
> IMO, we could perhaps add this to usb-connector.yaml as "usb-custom-connector"
> or so

Do you have a device that could use such a generic binding? I can't
really design something in the abstract without two or more concrete use
cases. Coming up with something generic looks like a quagmire, because
as you say the signals going through the pins could be anything: i2c,
1-wire, etc.

At least this is a vendor prefixed binding, meaning a generic binding
could supersede this one later. The risk of accepting this binding is
low because it can be replaced by a more generic one at a later date.

I will move the file to usb/ so that it is more likely to be seen, but
I'm hesitant to sign up to work on any sort of generic binding for USB2
plus an extra pin used for who knows what.
