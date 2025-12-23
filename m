Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72F02857D2
	for <chrome-platform@lists.linux.dev>; Tue, 23 Dec 2025 15:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766503768; cv=none; b=DYhX6uowbl6U1Z8z1VHtRG04krTAnuBrCnbOIQ17YTx//HCRYj68CaqLtlyYeqb/OGR0SsL7vms7CkD1qrP5YqXZIcvg4ph70q2UVNu1jJ1TA/kKdLI8yIlP43vtcGOn/uV33h1HMx9EogcAc8iqg2TmeTU6LZWBofanOzcMbm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766503768; c=relaxed/simple;
	bh=J3Ux6KfmhKmVgyLO5VYVS8zBuR2bX/I0/MfIw/LAZ8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZ1En/BIprveQ937eEYuSO6XApuxdZg6R3Hbic5RRU0MrgO11dg6h2PB5Isz/vciJyzTqJnN7EFaode6571VD/fPX1iMXxemzUfD7vlSZNttOM2n0cERdFkPr/qz7j1jHDA+nGdX90jvIJSScYOOcKDmMgA1GdsWt6Fy+YeafPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=irnkMBlS; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="irnkMBlS"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477aa218f20so32066735e9.0
        for <chrome-platform@lists.linux.dev>; Tue, 23 Dec 2025 07:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766503765; x=1767108565; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KU2jR3iD71XyPNeJB6Z0f1sjv8gA+ESxHLWTu3Zqx2A=;
        b=irnkMBlS8jAC8n95Ml0DqHLKqyBu/n2JY4wtsx9XP0BhjMxladPZISrD/R/3CceAwv
         WZWk/ACLo49vUzge+bZUqTBCmpt0lhgETm1u9HP2doBC6QmhhYN0B19HZlMyRhHx63Qi
         tIQ5s9ptovq3N4BjUYlHPndU6bZmYJp7O56uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503765; x=1767108565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KU2jR3iD71XyPNeJB6Z0f1sjv8gA+ESxHLWTu3Zqx2A=;
        b=KSjhZdudn2OPe5UEfW1+lc/7WJwr5jy4buOjypPwW/CKp3iudZUzgM0OtXGOga9ky5
         vllT+XGrLPbJh90KZK6y3U4CuXGpJ4xVEZOviryO4GaIjQrf6DSk+NzOpwGyF2aE0bfR
         gJS94miMQql9IMyl4Li70ljHDhe0b+/IZhkBgpXPYA3nuKqTquLRYHv4f0ZkORi5pA42
         jDSN7pfhkY6RHIumY5z70gVcszPXwNQQYB1Z1LoDjZtXjFkk7V1orkannTSgY0rtEMh8
         y733ry4Gevt3uk0Fp/pPGXW4dzXWaxGOYWpfkzg0CE5liubTsvmE1t1OgfRTGSI+jOoX
         5afg==
X-Forwarded-Encrypted: i=1; AJvYcCWY+1Ne/v7lpfiAN4/3EpnrlM4HUeazZaLbgGIyMN7CpfTQ7A1+1TDd/63jjBoc9e1k4mQz5EmysQzI1MOi//k=@lists.linux.dev
X-Gm-Message-State: AOJu0YwkgZWdQ8jN5pukk0QQTBlkCggUbsgmMotM364PL/Clm6AXJjOO
	luGlatCMBPzAQIUhkTeYYREOW25YK46eeedFLbY+brTBRxtBgriAggwvYyC2RC8KBg==
X-Gm-Gg: AY/fxX5KSpS2SB20CJw0u+IFrsc4XWYHOfyJ/qz7OcyhUJKBis1ZBw6zyDUyeQViDdw
	kP9BiOUSkjmOFGFAnPDOEKsdTV+f6n+jDKGMuiYE09x5Dn+KYAxNMe0MLmBx8uF4o3JhHrkHjvd
	mSheEXqyKBBeCdOk23MVrjA67sNra95DSMM/WMMKHg8VOx0EOEC4V3OzwfODljZ0eXoE59+t4MH
	biTdfTZHwgeRRVugEaW2CVMEQCovre3hGsoQTPdulRO26TGKikTyAAWHo/HhAFDuFQPrEYTg7OP
	xlUEQT30Bw/Qqbq7MP0ISSo7wfZSQO2S90wGb1U5wfdrB89j7Lthn1LtwafigEnS9LXBIddwnNd
	WJ1bazvd2j9VUeFTAgzitrav+q8q+i4GvnK7+AdqHUaw+FIZVTYPB/5A3UcqHgyzS8ZB8t0YBkA
	jTwnXcxr5NTnko1TeBwA==
X-Google-Smtp-Source: AGHT+IG/0CMavtTslZpbI5j2xnemhkhT+LYz90KZrJXqfzvE0jdXgerJdltJj03OeHUtFpEK624zOg==
X-Received: by 2002:a05:600c:4506:b0:477:9392:8557 with SMTP id 5b1f17b1804b1-47d1957711fmr143504525e9.18.1766503765317;
        Tue, 23 Dec 2025 07:29:25 -0800 (PST)
Received: from google.com ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193cbc0bsm248425045e9.11.2025.12.23.07.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 07:29:24 -0800 (PST)
Date: Tue, 23 Dec 2025 15:29:22 +0000
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] dt-bindings: google,cros-ec-keyb: add fn-key and
 f-keymap props
Message-ID: <aUq1UuFHE9B9zHIz@google.com>
References: <20251209154706.529784-1-fabiobaltieri@chromium.org>
 <20251209154706.529784-4-fabiobaltieri@chromium.org>
 <20251209192243.GA963693-robh@kernel.org>
 <aTm1PVLrS7Ra0OTF@google.com>
 <2gd2npolfpo5jruwraamwpn3wurm7w447jnwsbcfonmhos2owf@ejrqiz3qdxj4>
 <aUFPKni-iFkxQQGu@google.com>
 <nx4lo6qfyfoxha7poyipa2hjc2vogp6twxbcap2555aj4y56gg@ddhkfh7eifvm>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nx4lo6qfyfoxha7poyipa2hjc2vogp6twxbcap2555aj4y56gg@ddhkfh7eifvm>

On Wed, Dec 17, 2025 at 10:05:45AM -0800, Dmitry Torokhov wrote:
> > Had a look at the tegra-kbc driver as you suggested, first thing it
> > seems like the fn-key functionality there is dead code since 2013,
> > `use_fn_map` could only be enabled with platform data, not OF, and that
> > has been removed in 3a495aeada2b, as it stands kbc->use_fn_map can only
> > be false. I could send a patch to rip off that code if you want me to,
> > clearly it hasn't been used in a while (unless I'm missing something).
> 
> I guess you are right, we shoudl clean that up. We have another newer
> driver that uses the same approach:
> 
> drivers/input/keyboard/pinephone-keyboard.c

Alright I'll look into it and rework a v2 with the extended map, checked
the code again and I see your arguments, sounds reasonable.

Cheers,
Fabio

-- 
Fabio Baltieri
