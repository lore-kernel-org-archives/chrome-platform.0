Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E64280CE0
	for <chrome-platform@lists.linux.dev>; Mon, 29 Dec 2025 13:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767015213; cv=none; b=bWd8yKLP8X+cDWqDDg4og6ybpNVua06A4wmIajpRvr83CLKzaUNSEAWhZXhm8j1jeUZFxFnw1a909j0EArKhV/Dv/45LMkk9gywHo51fN5G+2Ewxj7BgTqugw0i7oj5lFGqgRAMYG9eOdwNW0hTslRrcgay2F2cw/J4L+DcndxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767015213; c=relaxed/simple;
	bh=gpqz5nElaphZZvs4CCE1UfaZsgG+uPqb45FcVwe74RY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KC7RTI/T8zF3qojVaLFm41xhCgHI6BfdN5QmIR/d/I4+e1gxstItRnUYlTdU4qvlwvSm2Kviequh4VDNN3LolTq2WTBdURkCE86kM+1i1g3kvW6WLqQ/DWlwxRZcWdjQYveJck/m1YnerBKYEc2FgHkyHrWx43d+d8jq8ITG2Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hN+L0iQP; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hN+L0iQP"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477aa218f20so54210195e9.0
        for <chrome-platform@lists.linux.dev>; Mon, 29 Dec 2025 05:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767015209; x=1767620009; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ce+SSTAL9sTdn9J8kGBQul5VYS4g6m6imR78LaTLra0=;
        b=hN+L0iQP91rXNgi9Bq0ZfQPA/UglMmk/RRzJ5qEGnav3gjUN69hBAVgFXFVdqHpctT
         OvTQM70gqmgGbMvNF6WJG2fD8+7f9i9xcxi48QJunxK9jiu1xEmkUf3WAltZX08/Pmiz
         Iq5UlHk/x77ywc0/z9F1kEvkwN1bPGDyfTq6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767015209; x=1767620009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ce+SSTAL9sTdn9J8kGBQul5VYS4g6m6imR78LaTLra0=;
        b=UIhK5hUVjBC3FBAnwdsO+7hw6wD6hUGk4gSZrU6yvCoDOkNS09xXnLHWBj2geL2Lqn
         iPdjWT+46nCDixBpyFaUig89UwhgGPrl5x1kbnIAR2I5a89rtXhnQ5au3LNv2UimnKnW
         uLYAgIZQOLERaGJMYxm27630rv2sTkA4BrW/w8lcYRZvGLShqxz+hF4J+JTiaS/hIS51
         3wv4zj68JgUgt5/ebAyw0YUnbRDI8Scyp8FUSOE2zog2lRr+PnkNhyxteBrjKdlMR8e9
         hB6hKTY4PV5PCm9yahq29Lpd1Ghncn40UAZEa0dBvc+9lwcdo7QeKCioZRrs9pvlZpTX
         Bcfw==
X-Forwarded-Encrypted: i=1; AJvYcCWqr8euzfex9NJwDxXBpKSBf3THaUZugkgmhbgekZRlT4b1jJV5uL5a6aFEsE/7GTaXSTmgyFHbaa2fN4qO9wY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJDKzSloBkxJNMcdWtVasYNZyD7YmrSo9bkdBbp0zpqFKX2vdj
	WciONqrv4T4YfrWUa8Pi6mIipmNOLJRRXqVck8lW5lUw60GH1ai3PSlf35wpQ6LZ0w==
X-Gm-Gg: AY/fxX5mydW/fAC1jN3+Skg+tNQycTQCHYg/r8Q6aQ6Lv0yr4ROT/0S9w2ZsAwoZSLF
	s7xEy3E60MGrfUh+CnLxS3vR4zAM7q/6MufUnQTSX2dcYUJcX2gsTdOj0EL2NacM4pieaGAlCNP
	u5V0O91KUO2+13MbCJ0dqoqs69qFIg12iugHABGwTowwaRL+WsOu/xMlxfts4n+hWdUFRVMtZbu
	CSferJp50okzaUn3ZH2khK+8vTrjYyRAeYiPY3FGEpPQnbOc0ZrRfYRC5XsZKCZHTo121oVS1QJ
	OS3VXCuMyKfHBs4fd/qzIt6AZay1E8Rw5ky8M+qAV7InvnzEEoCaQUGfdRxpZr8FQ4RnCvWUA7f
	H8jKdwLlbGrMQcnmmxkw06Hdy31Wpn/+XB53PrZ4T/FnYVZuDmKNUGI815fFFShuwUujYnGQPmr
	/2KTQmKVR46KGqIJT7xnrUIU+ywxqr
X-Google-Smtp-Source: AGHT+IEUBZibrNmtAx6mvVHkXWievEathjOoZ/y0M7H5kW76AmTFaxiWkAnyB/oLKVKeKbF8HcRCLQ==
X-Received: by 2002:a05:600c:c494:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-47d19582aacmr352970715e9.30.1767015209342;
        Mon, 29 Dec 2025 05:33:29 -0800 (PST)
Received: from google.com ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2723b2bsm591030295e9.3.2025.12.29.05.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 05:33:28 -0800 (PST)
Date: Mon, 29 Dec 2025 13:33:26 +0000
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
Message-ID: <aVKDJhVuOz-V9tb2@google.com>
References: <20251224152238.485415-1-fabiobaltieri@chromium.org>
 <20251224152238.485415-3-fabiobaltieri@chromium.org>
 <20251227-laughing-white-dalmatian-f9d98a@quoll>
 <aU__uxDmeUq20Mg3@google.com>
 <0c01fa63-670f-4c82-aa74-dc855cb12a78@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c01fa63-670f-4c82-aa74-dc855cb12a78@kernel.org>

On Mon, Dec 29, 2025 at 01:49:05PM +0100, Krzysztof Kozlowski wrote:
> On 27/12/2025 16:48, Fabio Baltieri wrote:
> > On Sat, Dec 27, 2025 at 01:44:26PM +0100, Krzysztof Kozlowski wrote:
> >>> diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> >>> index fefaaf46a240..437575cdf352 100644
> >>> --- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> >>> +++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> >>> @@ -44,6 +44,14 @@ properties:
> >>>        where the lower 16 bits are reserved. This property is specified only
> >>>        when the keyboard has a custom design for the top row keys.
> >>>  
> >>> +  google,use-fn-overlay:
> >>> +    description: |
> >>> +      Use a function key overlay. This allows defining an extra set of codes
> >>
> >> What is a function key overlay? Overlays are DT term and therefore are
> >> not suitable for bindings.
> > 
> > Ok, guess I can rename it to `use-fn-key` or `use-fn-layer`, open to
> > suggestions really.
> 
> Use as Linux should use? Then it's software, so not suitable for DT.

Sorry I'm not sure how I understand the comment, this describes how the
driver handles a keyboard with Fn keys, the codes are defined in the DT
linux,keymap property and the driver needs to know that there's an extra
layer to interpret the codes correctly.

> >>> +      that are sent if a key is pressed while the KEY_FN is held pressed as
> >>> +      well. The function codes have to be defined in the linux,keymap property
> >>> +      with an offset of keypad,num-rows from the normal ones.
> >>> +    type: boolean
> >>> +
> >>>  dependencies:
> >>>    function-row-physmap: [ 'linux,keymap' ]
> >>>    google,needs-ghost-filter: [ 'linux,keymap' ]
> >>> @@ -132,6 +140,23 @@ examples:
> >>>              /* UP      LEFT    */
> >>>              0x070b0067 0x070c0069>;
> >>>      };
> >>> +  - |
> >>> +    /* With function keys */
> >>> +    #include <dt-bindings/input/input.h>
> >>> +    keyboard-controller {
> >>> +        compatible = "google,cros-ec-keyb";
> >>> +        keypad,num-rows = <8>;
> >>> +        keypad,num-columns = <18>;
> >>> +        google,use-fn-overlay;
> >>
> >> Difference in one property does not justify new example.
> > 
> > Sure but when the property is set then one has to specify the extra
> > codes in the linux,keymap property and this examples shows how. I'll
> > drop it if you want me to but I think there's value in it.
> 
> Examples are for verifying schema and you do not have schema enforcing
> this, thus still pointless. Add schema for that, assuming property will
> stay.

Ok got it, I'll just drop it in v3.
