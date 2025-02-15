Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD89144304
	for <chrome-platform@lists.linux.dev>; Sat, 15 Feb 2025 04:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739595255; cv=none; b=TjI85H6XW5vhWGUF/6CEHFZd6ARLb//WDI8wyKOwjbg+Dg4Ak8y4jauRhhhc7XTadYhr8XFHjVLVjYYl4RV4C9iI9g7lTJXa/DohAjDhxkc5jPelYZvoXW5X8srodXQKbz8QsiAVPlPCRnbAGiViDHe8xt0EUJMgjROTUnveuzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739595255; c=relaxed/simple;
	bh=Qd+3HqLIBmzspnj051AjsoWB0jQ1fLQfmy2L2Kb+xZ0=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eRnhYb6LmBDLmP1q4EbTQmlWmCB3tihkNsvOyTuA9f1sx8vSbR9ptMxxnWPRQEYDg6LVFD+CqwJenEp5PJV9OoINt2oEejJqL31KOTvMETOe8Er31pKqHXeIYlcdUot+DKCKWRbW48lAbqtampl7PUMApvUhvG6UIuYYQ+PpaFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W8oLOgKM; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W8oLOgKM"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e44fda56e3so24276776d6.1
        for <chrome-platform@lists.linux.dev>; Fri, 14 Feb 2025 20:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739595252; x=1740200052; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xk5ud9oKcdPfSa08b0yRfW7p4KmWGP1BqSd4dcIlPyY=;
        b=W8oLOgKM1WjJZsBm1CNsKRzmCug9gWkMxs0iuARBGNCQlAld9BQd9g3w8i2v9W83El
         K03PnzDGpJOk5iDvnK7h+s3AmVGq8XP/2KO9LYNcCX5zuhb3bjFMI7dwfEwwrXIaVU/S
         7rKVmN2yxQJN5MboQaHPnUDwRntgPulKpi2no=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739595252; x=1740200052;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xk5ud9oKcdPfSa08b0yRfW7p4KmWGP1BqSd4dcIlPyY=;
        b=k3HAGeQXnZW8xttEyCUFz9kHofQ7Rr5FDV7u3sE9spyYITcSwnbWXKJ8qVv+JPAVAv
         F5965PIQmq+kcVRAq39bl74c5X4xqqxhtaJnoOgC2BYeaLhwbfP3MvD+oG4t7ypjyr3V
         UeJ5RhRR54z55aP1zhJ+X+0fKS196pjQsT4dpOXOyCY+6r1eszJ8HCBw3bwh4L/eh494
         AnC55gj+LfbOEi8lnsqUPH/hFVmxWqAgLtYpsdvCzvqwlaWMRR0uuXEGBl7LZJj0t2AM
         AMu6lAuj3I/FoYjEcg7q/lXjHJxBeBVFrCiqm0wk07xoQ1jNwV2iatpLhXxvSgIFIN0c
         3+OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUO66CVbvRe6ShnphvxzPFrtn/yL48q/voK6KEYA5uLYZIS9bahktKSmX+OlaVVoKoEj5rxVdQZzBQpElEEJN8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQgv9+kNbw5zQhgWgXosGFKF1eTN6yrhVA/HAVyUTgp5o16rbq
	iMIZo9XB8jutQqEAtd2NuUOgpCIQ34YXLM4hUTtxNrBr4CUKFNzb5sqyxgbTLkRGnswRamittn9
	vyG2mSVzxEoyEuoTnH7Nr4wxY8wgvoWmtFDhs
X-Gm-Gg: ASbGncurh4N774AESvwxIld2Khsw5gmwskQJzhkP6Udd+roaN+pApdJC0esBdqVKrnP
	zJVfthtEre4GcTCNfg3G2H1F/CBCm5N6mA/24AgMh4EfeUQFhvhhU/lfNDdPL61flxvgfAEoG5N
	heFlR4QeKLtpQCYAA/3hUZntZV
X-Google-Smtp-Source: AGHT+IGzK9Xw2SmDlUW8aMokwQq0lVBTGu1ZfRfxjaN3RAOn85fLCKnVOv/nBSKRqAiwjG3tNqoev++XhSLCxsebavE=
X-Received: by 2002:a05:6214:d09:b0:6e2:49eb:fb7 with SMTP id
 6a1803df08f44-6e65c8c0796mr145135586d6.3.1739595252358; Fri, 14 Feb 2025
 20:54:12 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 14 Feb 2025 20:54:11 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 14 Feb 2025 20:54:11 -0800
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250213-amigurumi-shrew-of-grandeur-bb1a13@krzk-bin>
References: <20250210225714.1073618-1-swboyd@chromium.org> <20250210225714.1073618-2-swboyd@chromium.org>
 <20250213-amigurumi-shrew-of-grandeur-bb1a13@krzk-bin>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Fri, 14 Feb 2025 20:54:11 -0800
X-Gm-Features: AWEUYZm38Pxk6_mjiF-w5FYKquBrOAN7Cotkk66MVQ85J6cLXb_xLqE4js1sOZU
Message-ID: <CAE-0n53Q=HFtZqgTNN2iq-XEaedr2zMJ63=k5+Rn3PsOf69fiQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: Add binding for ChromeOS Pogo
 pin keyboard connector
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	patches@lists.linux.dev, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Pin-yen Lin <treapking@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Krzysztof Kozlowski (2025-02-13 00:11:25)
> On Mon, Feb 10, 2025 at 02:57:11PM -0800, Stephen Boyd wrote:
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    description: Connection to USB2 port providing USB HS signals
> > +    required:
> > +      - endpoint
> > +
> > +patternProperties:
> > +  "^keyboard@[0-9a-f]{1,2}$":
>
> What does the unit address represent here? Why this isn't just
> "keyboard"? One connector usually has only one keyboard, right?

Yes one connector has one keyboard.

>
> Maybe it is only to fulfill the usb-device schema? The reg is there to
> represent USB hub or controller port, which is not true here.

Right, this is to fulfill the schema. These pins are connected to a USB
hub or controller port, so we use that as the unit address.

>
> I don't have any idea how to solve it. I assume you need the keyboard
> child, right?

Yes we need the keyboard child so that we can make sure the keyboard
that's expected is plugged in instead of some other one that doesn't
pair with the device. We treat the detachable keyboard as 'not external'
or 'expected' when it matches this VID/PID we have listed in DT so that
we trust it slightly more than a standard USB keyboard that you could
plug in to a USB connector.
