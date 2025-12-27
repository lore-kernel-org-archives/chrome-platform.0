Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5C525A322
	for <chrome-platform@lists.linux.dev>; Sat, 27 Dec 2025 15:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766850498; cv=none; b=G0eaemMoGKOzPhlyBJA65rUwwFUAN+QgRrujhs31V61ohJv+1hHfzTSX4U9zFa8m2FHhVYXjhAXO0wJierVYGQ9UQ04MhGw+a5I8o8V3NjBG1SWGkUpViUcBRdql75M6CFy6auprFT0/HaG+5m4gEldTcYbzAPknuQUs77VfO+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766850498; c=relaxed/simple;
	bh=6EyvenFkUbRfEc/p3VGn5q6/vzpXU8dt1a2C1/gKoHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9LRv8jaPWoBBItrhGsZL/WrC+NA3Qf7MHMVsXNxv9kPpY6ao5BGhv+mJtmY9ZZPsaqqQ/DPdYBboEOTV1KRSbALZyEbNcw9WkUD7iK+Jx9FUFetgYM+bEULyKlcbtw8I097H7IWn0mSZgWP+/40YBs17+dy2tYhXmKiGFoh9oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NJD/jOZJ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NJD/jOZJ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47796a837c7so51364395e9.0
        for <chrome-platform@lists.linux.dev>; Sat, 27 Dec 2025 07:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766850494; x=1767455294; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r+FpSWC3Nc9MHvTyQKmZfza7qICMlSOsmY2JJtFLFDE=;
        b=NJD/jOZJMirz2+OBKYqgbgR3HEkMXEJY8JwnbeScoD15kxlff37Q7J4VXa3SW6cD6T
         b0GVhObLAQrKkAn72rkc5ZvTQ5lXD1OQETqsAGInUO5tlhtA1/WfcvE297EVPa/4JgCz
         6fYg/qdwRPf/HeCCOH3lfhdWsboA0YYkdlQ7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766850494; x=1767455294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r+FpSWC3Nc9MHvTyQKmZfza7qICMlSOsmY2JJtFLFDE=;
        b=ZDO3OvbuYUgS2SPns7sDTkYgdq2lI9AotGjAiwYYYHSDw8RAcWISjSED70czH9xhNl
         mZJIsCSCvQEkvtQx+qNVtgM/bawVBn8s/jSRLwgIRegIiouGcoe9Cdog93/gA4rDCa14
         c8WvHfmDzAfVorwIBJVZi9pUuThT55ElbFpS0tnyVc9tEiOAjZl3qYP7QT9RSSzzKS4p
         7nf3jJusfDWDLP7G3FLB1Gnh72V7zQ8t9a2x4jSe3wXUN/eKJdQ9Cpo/Ome+CKGJC0XV
         skOogNXbwNYpRfJTT+MP1Z0yuHMt5P7TfpoPqy3nEbe5IC2aZ3YGifpE8QZvmP5EGzs5
         VphQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtzr4J1EgjMyFSGiIvVGW0xolwRtWH/uNuLrG6LNSh6Sv8ARNrjm82fuL7LD/6yxPINUNLT7jpcubkE8HTZcM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdkuqYBTxVFfecQLg39BaEJKQwvl9bLE/PjWoX4XgIyz2H4kiq
	/a7WmG4gR35lRKobfNDZmDlVa754QM72stiPI3tI6k8Qf02r0zGX3L3jcbXzzVWdPg==
X-Gm-Gg: AY/fxX7CO7e0sOA5nDtDotJDpslx28E/qj/JR8Mn4gq3g1pDbjMShUlrdyVSMfbWVMK
	Ro2z52LxFdhYjKWJJXFm99rCv9GPjFQOa6WHR6/ue2mFLv5+sgVsdWmM6GgrpyIOJlKkO89zrqa
	aeeH+9juTyQiUDnDLoTXgDk+NU8bOAPtslh5AHwYOGLh8ORkaaU0ySf90cKCwbfmAIDvEtPP79p
	JcykZiMf9FDihntIYsqMQsfQlCsobVKHSW3WY86g8cO3a+7ScUUQKdwVDrfAbxIAUWNHaoPk4l3
	HsjQiX69UrYbg9SNNRz7JW1VusWaebRwxF0D6qAjLsQXGusdax8obUJXxY/qm95BJzfclhz7IR9
	YXEZtbbb9zzRVg2RY74ntldYKD+py2FCC8wO1XSbgjX6IK2aaeOOleQo4GmQz4ggMpAETJ+3MMt
	K5u6bKQMEsbAPMzbMyZw==
X-Google-Smtp-Source: AGHT+IEgCUZpTF8yVMFQbUK1f2VfqWGes79Q7SFq4BTt5go/LyghCIYXvXp0oSXhz5n1SME9CswxKg==
X-Received: by 2002:a05:600c:470e:b0:46e:506b:20c5 with SMTP id 5b1f17b1804b1-47d19589469mr282225585e9.26.1766850494231;
        Sat, 27 Dec 2025 07:48:14 -0800 (PST)
Received: from google.com ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa477bsm51705043f8f.36.2025.12.27.07.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 07:48:13 -0800 (PST)
Date: Sat, 27 Dec 2025 15:48:11 +0000
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
Subject: Re: [PATCH v2 2/2] dt-bindings: google,cros-ec-keyb: add
 use-fn-overlay prop
Message-ID: <aU__uxDmeUq20Mg3@google.com>
References: <20251224152238.485415-1-fabiobaltieri@chromium.org>
 <20251224152238.485415-3-fabiobaltieri@chromium.org>
 <20251227-laughing-white-dalmatian-f9d98a@quoll>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-laughing-white-dalmatian-f9d98a@quoll>

On Sat, Dec 27, 2025 at 01:44:26PM +0100, Krzysztof Kozlowski wrote:
> > diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > index fefaaf46a240..437575cdf352 100644
> > --- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > +++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > @@ -44,6 +44,14 @@ properties:
> >        where the lower 16 bits are reserved. This property is specified only
> >        when the keyboard has a custom design for the top row keys.
> >  
> > +  google,use-fn-overlay:
> > +    description: |
> > +      Use a function key overlay. This allows defining an extra set of codes
> 
> What is a function key overlay? Overlays are DT term and therefore are
> not suitable for bindings.

Ok, guess I can rename it to `use-fn-key` or `use-fn-layer`, open to
suggestions really.

> > +      that are sent if a key is pressed while the KEY_FN is held pressed as
> > +      well. The function codes have to be defined in the linux,keymap property
> > +      with an offset of keypad,num-rows from the normal ones.
> > +    type: boolean
> > +
> >  dependencies:
> >    function-row-physmap: [ 'linux,keymap' ]
> >    google,needs-ghost-filter: [ 'linux,keymap' ]
> > @@ -132,6 +140,23 @@ examples:
> >              /* UP      LEFT    */
> >              0x070b0067 0x070c0069>;
> >      };
> > +  - |
> > +    /* With function keys */
> > +    #include <dt-bindings/input/input.h>
> > +    keyboard-controller {
> > +        compatible = "google,cros-ec-keyb";
> > +        keypad,num-rows = <8>;
> > +        keypad,num-columns = <18>;
> > +        google,use-fn-overlay;
> 
> Difference in one property does not justify new example.

Sure but when the property is set then one has to specify the extra
codes in the linux,keymap property and this examples shows how. I'll
drop it if you want me to but I think there's value in it.

> Please organize the patch documenting the compatible (DT bindings)
> before the patch using that compatible.
> See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

Ack, will do for v3.

Thanks for the review.
Fabio
