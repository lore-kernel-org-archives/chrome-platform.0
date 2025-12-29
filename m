Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89622329E42
	for <chrome-platform@lists.linux.dev>; Mon, 29 Dec 2025 15:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767022774; cv=none; b=XVQmm8AKT7LJkb/jDFsqclp4YyAipixDE/ueoPXyWto+ROag81aug8XL8qxbqvvoKYZjuZbERjGcp8uAL2lyW3Y1Q2/QEISq3Rtm5zIOgDM6un4Dx6HS+fr/bGPnD2OqoqtvZwsncRblLZZfQLhbkF9MGoklXsTTtjykPxQaTS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767022774; c=relaxed/simple;
	bh=RcDGedmXwSRUgRLTsRrQXPhrzcqVDmty+VallOtpd/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/f/uDmi5pSrVYtNZcx321FGpn2r2tLgxIyXIPBPlGNVfOfDnGa3bjzvsovxXhs+YhhzjtzW8JDgUOMzB8en9YviRNZ0d938hGWIZaqDMqNGntdoun1nkXoLVjA/xRIAzGOqpUZaZmw/ucSC8+rZkQDx9BI2DAu0RFV7fKpCV4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SdBuFHAy; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SdBuFHAy"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47a80d4a065so45932055e9.2
        for <chrome-platform@lists.linux.dev>; Mon, 29 Dec 2025 07:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767022771; x=1767627571; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SGYWl17fxV3/QSiEObh01QR9aeCd8OVP6SgH7H57To8=;
        b=SdBuFHAy6BZnSvJ4Q70yknyp2mPIlvGNV3jY7fa1I+K0p6xNp+g3/2lEkKgVeOXkiX
         UxNZtrfx95Vrt6XaVgN+N358VSX1aGFnrtrTZ4J6CuRjYSiFCCRZ/yEE03MPhl7z282O
         Rj8nxu0X86W4CmebktHzPjdem54lWY/DKIsHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767022771; x=1767627571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SGYWl17fxV3/QSiEObh01QR9aeCd8OVP6SgH7H57To8=;
        b=BnssdG8E22T4ojHvJBaQb9sNL4+RvOpAM7R9Xo0U/5TYE9KQHU2Dcg6QMdDpS41/6K
         4fQBK7u9Rp3SKQY3BGxmgf9SYHHf6Z9/oP8lCz12UrCfMO8H+9G/y48OOpGVGq7KWnyA
         X/jqf5q17NwSIMpWoOm2SdVOMz3TNU2jjpwOZLckly/pg4XvObLXoFEzykE4bqttnkZa
         /A3oCfwb05ISNZHwcOco1XYLja212We0mpBMVkWNKscNvUV73C7Jy7ic5P5gohmCNGRA
         rYJ1jKHlJ22kT//aaA2MFF/1HYhyKdgJ3yHqgc2AHbcdebL4MLa0FmCBLEo7LFj8RA7W
         f9Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUgZBbTfjDi61Zk+SpbMql9Khqov/Xuxh5i9U4TCljZpaBKRU6QI/EEDAlVQ3gsgIIZIcyG+bZ8pQskhMZugl4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwYi4K0WV1dGhhfyYnoI0nY6SweT3DrLFnz1zTiI2daSIx/kbNb
	QmNpIgcgn9U/5Jv7cWGpSw7dvyLoMesmk5tBPyXhCKH/tBp857IeMXNlsXSIEs0Kiw==
X-Gm-Gg: AY/fxX5FznbGVvKc4iMNLU36NFBDC3cqucy4mTx35nCpmq5/GGoeqnymlN8Ij9Y0Wue
	aqLO4HzmUOE9/g0xaylR5MlBA2Wdd6TZoi/PrNsuRcS7iV7xW5KR2wDlf2sCvl+bm2rEHpIAiRU
	2uFOgPm/CKRL5xhHg/22RHkk95sIg8kLll0w5Bc9IeS3JKANhO9A+hPTmcGzuPZXDppDrhgYN2t
	iqF8ROk6gzb1BqWwif/ovWB6tFO8eiyu2JbxvKwP7iecm3vZBVUulQu/OBkRTXDh2DssgHdBKQ7
	AXendWZmG/a02JJ8ohfCwR4MNoR6x0e+35qtM27Dp1PReLg9msCN3KcgYobz1aPz8cZJQU7vGhM
	RWJmiDZXOLd0UVLGuRgcsg45s7RaHu/wSjeBs4nTuhqAQpg/dhw8pz7brQ/ZbqLxA/iYHOx/pRP
	xnXeU/+t0PvtIaQm6KBA==
X-Google-Smtp-Source: AGHT+IFl14WZKwhPmiisq47nhuqUJz7ve89LSx2Bze9QplnBFGeno8tXs3tel78LX13pZskSo/9nSA==
X-Received: by 2002:a05:600c:4f15:b0:477:b734:8c41 with SMTP id 5b1f17b1804b1-47d19538dfbmr400115935e9.1.1767022770807;
        Mon, 29 Dec 2025 07:39:30 -0800 (PST)
Received: from google.com ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43277b0efefsm29752839f8f.25.2025.12.29.07.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 07:39:30 -0800 (PST)
Date: Mon, 29 Dec 2025 15:39:28 +0000
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
Message-ID: <aVKgsGwb9Rqteekj@google.com>
References: <20251224152238.485415-1-fabiobaltieri@chromium.org>
 <20251224152238.485415-3-fabiobaltieri@chromium.org>
 <20251227-laughing-white-dalmatian-f9d98a@quoll>
 <aU__uxDmeUq20Mg3@google.com>
 <0c01fa63-670f-4c82-aa74-dc855cb12a78@kernel.org>
 <aVKDJhVuOz-V9tb2@google.com>
 <c539aa2a-e9be-40e7-9b75-1723bdaf0a39@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c539aa2a-e9be-40e7-9b75-1723bdaf0a39@kernel.org>

On Mon, Dec 29, 2025 at 03:59:44PM +0100, Krzysztof Kozlowski wrote:
> On 29/12/2025 14:33, Fabio Baltieri wrote:
> > On Mon, Dec 29, 2025 at 01:49:05PM +0100, Krzysztof Kozlowski wrote:
> >> On 27/12/2025 16:48, Fabio Baltieri wrote:
> >>> On Sat, Dec 27, 2025 at 01:44:26PM +0100, Krzysztof Kozlowski wrote:
> >>>>> diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> >>>>> index fefaaf46a240..437575cdf352 100644
> >>>>> --- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> >>>>> @@ -44,6 +44,14 @@ properties:
> >>>>>        where the lower 16 bits are reserved. This property is specified only
> >>>>>        when the keyboard has a custom design for the top row keys.
> >>>>>  
> >>>>> +  google,use-fn-overlay:
> >>>>> +    description: |
> >>>>> +      Use a function key overlay. This allows defining an extra set of codes
> >>>>
> >>>> What is a function key overlay? Overlays are DT term and therefore are
> >>>> not suitable for bindings.
> >>>
> >>> Ok, guess I can rename it to `use-fn-key` or `use-fn-layer`, open to
> >>> suggestions really.
> >>
> >> Use as Linux should use? Then it's software, so not suitable for DT.
> > 
> > Sorry I'm not sure how I understand the comment, this describes how the
> > driver handles a keyboard with Fn keys, the codes are defined in the DT
> 
> Exactly. The purpose of DT is not to describe how driver should handle
> anything.
> 
> See also DTS101 from this year's ELCE.

Sure so I guess this falls into the "describe the hardware feature"
category, so is the suggestion to rename it to something like
"has-fn-key"? That would be the hardware feature.
