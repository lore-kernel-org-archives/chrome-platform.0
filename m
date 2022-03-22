Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9037A
	for <chrome-platform@lists.linux.dev>; Tue, 22 Mar 2022 01:40:55 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id j83so18153924oih.6
        for <chrome-platform@lists.linux.dev>; Mon, 21 Mar 2022 18:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=6cy5E/85aL5JmF2pjEIWOn8cdkPn4kZuLVsVcwh0VCw=;
        b=ZG2mTl4hRiPGIsQOCem02L1efR0uk4lEtDZ2klTX+4ywa0MAPregei5qmLCo3RwkSm
         TmHLpM7DRwjVbB6rphkHqPT5E1uK82uOJOw2YOU7pszylbs0rmkL77FKtvslchjITSZ7
         6jhrRzZbyHRcpoDjgRH+ImYAQ6OBKYpPbdKTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=6cy5E/85aL5JmF2pjEIWOn8cdkPn4kZuLVsVcwh0VCw=;
        b=4kwiX4NbReRmeer2dgjCEbipUhAP5kb7yADJqEkeSNCqpEShr5iUfb0j37KsLauCdW
         N1VzaHNavRYp0aRJhoyJu4uawHVNMGjFsTGdyW2uV14T7dh0OHOvgTlMutpTkiCCGVhG
         g5ettnJS17OYVnO6KcYkWo9b/R3YP/+4qj7xVZq+SafDViNOv7C/HDNBO3CZGWYmZEx6
         XOp5ckbiLtWTUBGB9qfyYiWbANa8kq95Wr0IzYxdPKjZtBhltKWWOh1JX8MBf8F5Ru17
         M2scZX6cNjLmMpNDLJBCJu8zvV8EnOP4AuSdOquoc9wd1orxDa1mkrG6WVlXKN0gLOWx
         HrAQ==
X-Gm-Message-State: AOAM530G109C1BSLN5ek7RGTAUif24Qp/iYbFvsiqtZz6d4vX+HwCYIl
	LTrhmw1zbxZgSBfj3XTgrkE+FyNWGyJQK0dq76dx2A==
X-Google-Smtp-Source: ABdhPJw/+VAE25qRttG0wCMfm6qrIFot8Qt6PjAcz4RU30vU3l71cCaYqSwzmv5nHPkBwcOJjVsoFQFVl9pP99Ke9k8=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr903174oie.193.1647913254705; Mon, 21
 Mar 2022 18:40:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Mar 2022 02:40:54 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YjknOFMere5DG5He@robh.at.kernel.org>
References: <20220321191100.1993-1-swboyd@chromium.org> <20220321191100.1993-2-swboyd@chromium.org>
 <YjknOFMere5DG5He@robh.at.kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 22 Mar 2022 02:40:54 +0100
Message-ID: <CAE-0n52o+XsyzF5GzRQ9piPYnntBTtpo+t1b6bChT-iUVg=aFg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: chrome: Add ChromeOS fingerprint binding
To: Rob Herring <robh@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	Guenter Roeck <groeck@chromium.org>, Douglas Anderson <dianders@chromium.org>, 
	Craig Hesling <hesling@chromium.org>, Tom Hughes <tomhughes@chromium.org>, 
	Alexandru M Stan <amstan@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Rob Herring (2022-03-21 18:32:40)
> On Mon, Mar 21, 2022 at 12:10:57PM -0700, Stephen Boyd wrote:
> > Add a binding to describe the fingerprint processor found on Chromebooks
> > with a fingerprint sensor. Previously we've been describing this with
> > the google,cros-ec-spi binding but it lacks gpio and regulator control
> > used during firmware flashing.
>
> Then 'google,cros-ec-spi' should be a fallback?

Sure that's fine. Then the second patch isn't needed either.
