Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B66919ABCE
	for <chrome-platform@lists.linux.dev>; Tue, 19 Nov 2024 02:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731983004; cv=none; b=pBuKtuTIG+/0fxpwsx4Qqugm4WsGmL3NQC5Rqhmx3kfBqx5UPVVgK74D1xX1x4R0pl2mtfaGMixmiUyCMOr37npxS+Vj9K455pVYjovVLss3viNmvAXjCTk7QlilG4a/+jNJ0GrNDtuM5GR4CEJnTqJcEfqSe8bK7HJ3JCrdTBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731983004; c=relaxed/simple;
	bh=4MusnTHOvGCXbl0nkaIvWiNeJ03CAQCB33OcASeipXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f6gqZwTkcaDKfa/tin29PqKW8lXHvlxDKSEGRKAU5VjselY/7tZ5jiDRH/JuQAtgjXu8cVQsT3zr+pYRXsmQfVUKiMBuD2kHtPInJ10M0rT2S8N5xD8ZWAihsKdJ/wabF4QdZZfYImuvtlumiYEgIMPeT5AqK3XQPTZyfNquoG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ei6gmwJ7; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ei6gmwJ7"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7242f559a9fso434914b3a.1
        for <chrome-platform@lists.linux.dev>; Mon, 18 Nov 2024 18:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731983002; x=1732587802; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jHJ+VpcRmwxKu5/WPIGwQSIP5WqAzHzgd6c/ZcREfjA=;
        b=ei6gmwJ7btwcqApBPT6TFT5aSzB7ns8IZMVOd7ZdSPxvoXLtsZVKgJ4pANEwWXTNxY
         yZ348cPzIhqoD6itSynvRyBRQ2iXYCUbKvfmxRBVzbFh+YdsWZEIwBDf1JPT2N1QKKT+
         q+0ImBPX+aOy6Q3rvj+AtnKCuvGal2ewctZE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731983002; x=1732587802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHJ+VpcRmwxKu5/WPIGwQSIP5WqAzHzgd6c/ZcREfjA=;
        b=c9bILOsP4Ov0Z6VZGdpoQSOwxpOcdi54zXlosNNtyfaGU5UMLCKX4tIlShACJfjSoQ
         7nC+UPBg4NsnpLEmaNY7+bDLAwlsEHK/+7ByOhFWZqBUiNRTv9g38FPkX6IV2dJXi+jG
         OcSdqD6fkA2P5knT26HIH+IZ30WZm7K5ENG3N/s133dDO2kHXiYd4IVr/14HOqw1tVtM
         Z+F+mwHv925LymsVUtxYfmSp4c2NWtEAXyOPPLSmRAbypIwe5Et1gS0+KzAdj+2A4cik
         PJGTDXp9r0AV/gw+ba1nP2bMfbbw+STSnzlEp8Kje1YYTT4SV6poneN+MDkhDMn00OgQ
         PXwg==
X-Forwarded-Encrypted: i=1; AJvYcCV50MyV94mtf1bJmevZze2suhtUS8QYg4B5zVsS7lOvOyXhlD+1FmxRLyEHKleuy9hsdxPcz/6ZPScy+7dFVjY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqSI2GvdDb5dIZgaJPvzCGk51QPXGhedXsUBuusm0pa6xl0h6w
	fTeYNR3QBM2pAW7Y6T01ZY0fIPhda4aBbxH384KUoUnMUPr8OjiJP38JDLKgaQ==
X-Google-Smtp-Source: AGHT+IE78YUZbFTKrDWhSwPmB097Wk4a1j0g9tpeUAlr5hwezpZ0+bopaS9Y3Pj44h7ylBGk5x8F3A==
X-Received: by 2002:aa7:88cf:0:b0:71e:5150:61d6 with SMTP id d2e1a72fcca58-72476d58a6dmr19963818b3a.21.1731983001735;
        Mon, 18 Nov 2024 18:23:21 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:e40d:fa29:75db:2caa])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724771e1a69sm7123889b3a.141.2024.11.18.18.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 18:23:21 -0800 (PST)
Date: Tue, 19 Nov 2024 10:23:18 +0800
From: "Sung-Chi, Li" <lschyi@chromium.org>
To: Rob Herring <robh@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: chrome: add new binding
 google,cros-ec-chrage-state
Message-ID: <Zzv2ltfXqaW-2ALm@google.com>
References: <20241118-add_charger_state-v1-0-94997079f35a@chromium.org>
 <20241118-add_charger_state-v1-2-94997079f35a@chromium.org>
 <20241118202520.GA3273373-robh@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118202520.GA3273373-robh@kernel.org>

On Mon, Nov 18, 2024 at 02:25:20PM -0600, Rob Herring wrote:
> > +properties:
> > +  compatible:
> > +    const: google,cros-ec-charge-state
> > +
> > +  min-milliamp:
> > +    description: min current in milliamp.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +  max-milliamp:
> > +    description: max current in milliamp.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> Use standard units defined in property-units.yaml.
> 
> No constraints? 4000000 amps is okay?
> 

Hi, I cannot find a good value as the max value, the will depend on what charge
chip is used on that device. This is like a upper bound set from the kernel
side, so setting it to the max uint32 value is acceptable (from the driver side
when loading this config), not the desired current value. It is equivalent to
kernel side do not specify any constraint. Surely, if kernel set a value that is
larger than the max value, the EC will reject that request, either. The real
current is bounded by the EC and the charge chip, so it will not damage any
hardware.
If we can find a meaningful constraint value to document it here, that would be
great.

Would it be sufficient that I add the explanation to the description?

> > +
> > +  type:
> 
> Too generic. Property types are global. You need a vendor prefix for 
> starters.
> 

Thank you, I will use a more specific name in the following patches.

> > +    description: current limit type.
> > +    enum:
> > +      - charge
> > +      - input
> 
> What if you need to describe both?
> 

We need to declare different DTS nods for each. This node is representing the
constraint, not the charge chip itself.
The voltage, min and max milliamp on each current type are different on a single
charge chip. For example, I have a device that uses the charge chip rt9490, and
it has the following set up:

- Input current
  - min-milliamp: 100
  - max-milliamp: 3300
- Charge current
  - min-milliamp: 150
  - max-milliamp: 5000

I cannot find a clean way to merge different current type, max, and min milliamp
just in a single DTS node.
Also, we need to split different constraints into its own DTS node. It is
because the a cooling device in the thermal framework need its own DTS node, so
we can use it in the trip section.
