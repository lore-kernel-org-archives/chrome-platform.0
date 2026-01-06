Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D6932C31A
	for <chrome-platform@lists.linux.dev>; Tue,  6 Jan 2026 11:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767697286; cv=none; b=Qg2xVw5EBQuBwhtBdN6Qs7Du0yz9CD0EbhSjx6ip+9OMp6tq5skO0/bWPoq55w9HO9HKjS4s8PwAuX1dDT2AA4NhoFrv/bzGf2Hj1XMR2gs1W6c3NdNjPSxbDuoQLwg+Dtljd3wKIDCIfUseJncCrjdcIRz52+RmamXj9URIrWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767697286; c=relaxed/simple;
	bh=K8B1ITgIq3FUq81iGq9UYGee0jVJIvlcDFoY0m6i980=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/BFL6YsBUXsYnbEbmTaWADaMM0S4ZDUvxuHOPZ2V/pwRjgVnSlhFfS7lwcfzIu6pxWO3fFXRl8wnf2utuUkM87HPIMKljzU1dxGXCJAIa5+SL6vJaPt0ckt/unr8MAqpTC+xKrQbgk71VqX3Ux27FI8fHcehyvImuWV6T2q/zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fFpQ5ePE; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fFpQ5ePE"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so562579f8f.1
        for <chrome-platform@lists.linux.dev>; Tue, 06 Jan 2026 03:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767697282; x=1768302082; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O3m/v4VXTV6NMfNLvVjfAE6l9ij7+j/SxZwfjGUHi2c=;
        b=fFpQ5ePEBkXIrmi4Wl5zh18SXin1Y7hBIreZFk3vpjFgc9ybL5HPsba16MLfKtVa4P
         sGOjjlBEW/0ocEdh/ElcsSRz3DcJJ1E9q3wKZuuGYkHAuftySZ04sKhAxRe2aDISZA4c
         VvLmC7BAt6M9RBX7Rg6pZq3B3DcUSw2spbrQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767697282; x=1768302082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3m/v4VXTV6NMfNLvVjfAE6l9ij7+j/SxZwfjGUHi2c=;
        b=SotxkQ/aJwkFqEmLMXhGbGdE8g/QrylNGXZC1deQ0/2DXlmhvl0aK24D1chsxdybf0
         SmzhBbMDt66naG0MoC/ZOiDA/JkJ1k8mjjWvOEWpjcTwjEYIpQ0118cliuu4wtUXyFo2
         0GGM+0PfQdQKgywA6yPlASrBfmAZX6dgHBO/leVYh7ZsH6QQ7zCH+sNVp/dwL+L7HLAj
         YN5oKfcr6wmfcdlsVzs+4dplUwHclxkDtVFAcNbvT8gsAx/j4dp+IDXN0uVFJ4ws4jpv
         poFI4qCbdSiizjrEuttAkXmu0FOfFTEeytnDZ/11kUWSJpTWLE/KAOCJbQmIljKRkeNC
         TQ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZlxvtdRK+2fHzMzTu0xQ0z647qBulFHGzI3ykyMVh2f5fAstitM9EPIynTMZyt7anTrxwoWmXA0ODz99jYo0=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb4WFLjR65nPBTyVzogTcXw5ql/kgszJ82X+YPYPQIVO+fLMTs
	t/yFr6PNkdGdT1S5AcFuq4Jffl4TSg/z1ebnOp6YdMXZkE/eGb9Y0+Ru1XdMByK5bQ==
X-Gm-Gg: AY/fxX66AAnhJ0VOp+rPm+zy0bAYsk4pW7l8cz3FdJ7+JigA3Kohv5rvNgUfSlhBjin
	iWLmV8mBhP8mXKCtvQcjshyvKrsGuoj37lS5FR5oE8fIQ0EjkPJCQehRw3Aigd6oFWBybPC3wlB
	2JKnRBkxDcA6mXiwXOA+8EGYn9rrBVrp05Bm9zlJ8wo8PC3e7vQGqdniSiRBm8e/dvuuWrxdWOJ
	X0qLGqNyirknqJrEihTYQ58qzh/+Bk1+Hu2uNkOMW0PrzScrVmYtJXXWE7oQHNc/01+Fvq/zNXj
	FoCnA8P8/4la2wFdcPVO8xMJoDBmu1hNff7OfVoJ6iGZtOZDz3n1SiaK46zdxgKb+qvMruSuH4H
	vkI7WSEgZLzDLdSe5aOA0aNLk04mcgRURHMe18QvVDo0AoTHlfQU8sWNktyXAaQ2p/eoSwuipuV
	rwKEhFeg+qb2ByEVuZpQ==
X-Google-Smtp-Source: AGHT+IG9g5Uruo7F3IpKCSwx4dA/EzxEcppJATTbysJnloBLnkO2XLfNlAmhjuyITGfSxfeZpj0FHw==
X-Received: by 2002:a05:6000:2c12:b0:430:f9c2:8500 with SMTP id ffacd0b85a97d-432bc9fc09emr2909739f8f.43.1767697281958;
        Tue, 06 Jan 2026 03:01:21 -0800 (PST)
Received: from google.com ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16d2sm4050362f8f.13.2026.01.06.03.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 03:01:21 -0800 (PST)
Date: Tue, 6 Jan 2026 11:01:19 +0000
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: google,cros-ec-keyb: add has-fn-map
 prop
Message-ID: <aVzrfwY8SrIAGn-e@google.com>
References: <20251231143538.37483-1-fabiobaltieri@chromium.org>
 <20251231143538.37483-2-fabiobaltieri@chromium.org>
 <20260105-helpful-ocelot-of-eternity-6bb1ee@quoll>
 <aVuYt24q6nihC4t0@google.com>
 <20260106-oryx-of-major-protection-10c4e3@quoll>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-oryx-of-major-protection-10c4e3@quoll>

On Tue, Jan 06, 2026 at 08:27:10AM +0100, Krzysztof Kozlowski wrote:
> On Mon, Jan 05, 2026 at 10:55:51AM +0000, Fabio Baltieri wrote:
> > On Mon, Jan 05, 2026 at 08:52:56AM +0100, Krzysztof Kozlowski wrote:
> > > On Wed, Dec 31, 2025 at 02:35:37PM +0000, Fabio Baltieri wrote:
> > > > Add binding documentation for the has-fn-map property.
> > > > 
> > > > Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> > > > ---
> > > >  .../devicetree/bindings/input/google,cros-ec-keyb.yaml    | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > > > index fefaaf46a240..fa24b1cbc788 100644
> > > > --- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > > > +++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > > > @@ -44,6 +44,14 @@ properties:
> > > >        where the lower 16 bits are reserved. This property is specified only
> > > >        when the keyboard has a custom design for the top row keys.
> > > >  
> > > > +  google,has-fn-map:
> > > > +    description: |
> > > > +      The keymap has function key layer. This allows defining an extra set of
> > > > +      codes that are sent if a key is pressed while the KEY_FN is held pressed
> > > > +      as well. The function codes have to be defined in the linux,keymap
> > > > +      property with an offset of keypad,num-rows from the normal ones.
> > > > +    type: boolean
> > > 
> > > You still did not answer to my previous question, why this is not
> > > deducible from the key map (presence of KEY_FN in the map).
> > 
> > The driver behaves differently with the fn layer is present, has to make
> > extra space for the extra codes and enable the logic to use it. I can
> > certainly detect it in runtime, would have to always allocate the extra
> > space even if not needed and check not only that there is an FN key but
> > if there's anything in the second half of the map.
> > 
> > I'm not overly enthusiastic about it, it's a bit wasteful on memory
> > (probably no big deal, half a kb of RAM I guess) and somewhat less
> > defensive to misconfigurations and in general I don't like the new logic
> > to be enabled magically, as a side effect. It'd be extra complexity for
> > the sake of saving one boolean property, but sure if you think that's
> > the way to go then I guess I can implement it that way.
> 
> Driver logic is not an argument here, we don't care about it. You should
> answer why presence of google,has-fn-map in DT makes sense when none of
> the keymaps has KEY_FN. Why this is a valid and desired configuration?
> 

Think I answered that, it felt like a clarer design to me. Anyway I got
the message will send a v4 with runtime detection, it's certainly a
valid option and works out for me.
