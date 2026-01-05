Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D9232ED59
	for <chrome-platform@lists.linux.dev>; Mon,  5 Jan 2026 10:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767610557; cv=none; b=hq7vDDwHbqTBpiwHDCOfe8tEP9B103ET0rA62xb+V+skVyghfKY6zflmrEwVlQ3LzQkcHqu2VSwPFro2nWcsaafMkocAD2PfSCqlHXThzZQkyzdC8twC0mEY69S+xm4bkYBunmdCt1prEPCQAMnutdVRt0CKN1+SQyQ5OqTYtyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767610557; c=relaxed/simple;
	bh=gwAM3gYozmj68G3BkMYx4yPS500ChdCcsRj5wEpBaOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EKEHLm86buUZJEMrsLrCw0CXF3dAhEyWROGv/X0KhGsSjvfoycQ3Oor9R0KFIBma88gv/yQ6eqYg9VrVJNGOtLciQqMaadBg6ylW8MPOhDCjm464R2/cQ3inOUePyRSdRIa1ON+RTF2caKTE+o3ig2pGlm1s6Xcdn0IyKZ7Cmvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LGVMBYDb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LGVMBYDb"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47d63594f7eso23297705e9.0
        for <chrome-platform@lists.linux.dev>; Mon, 05 Jan 2026 02:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767610554; x=1768215354; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JnIbT9EGamTtHAub2XVlZI7RjkEaaQIsimhhYGKZi4M=;
        b=LGVMBYDbATfCIR9MB1JvRiO8Q2exj96MappER20mYNCpiAchCjqNQjraEhzNQA0o6I
         qZ7yFVyxW9NwsJzTlxNi7FBiBLyJze0j4wd3u9rUleEeJuFefExvw1xEXflmM5jHYFTU
         /VImBuCUsCqjBvd0BAfAh7VPtrnwze0Llg7fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767610554; x=1768215354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JnIbT9EGamTtHAub2XVlZI7RjkEaaQIsimhhYGKZi4M=;
        b=KWEyJeu4cUtyLaqGFKHv/58nNE+iJALpHSJ63ADc4kHkr3d9HZZqSJCz3ohRDlq1cX
         MKsFMYpJM5+bAppYf+2s1fw/cxj67EpFE+3pi4sZoeDvP27wcRTMwfQktW8UizthtN7z
         siGU+lQ5qGCJp0sXQtBMLvQ35B4H+TEl8JqwVvkX4hUTFVwyXtFqjTNqEcstKdB1MPxP
         MsFnW2woMS+vU5Fsz7wKySYBOSaCH5W6RKx/3mcvysZ3I1v6pNlt1DKESY3ZT85PiVhG
         h0I2mvXUV60sqZX9Fv/XXMBY5uOVufl0xuMU60Udrq7e24Km6bzoQnKChhcbx31y1s/t
         7CaA==
X-Forwarded-Encrypted: i=1; AJvYcCW6crkXeNwTunjZPSDEatUC2jl1vQwq5jnEpDc4Fg8XCoEfpYl9w+alAbUxZxHZqN6dd5zpYXj7bhkTEER4Gz8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMBnKjmQDdmdWQ3rynOcUL75sVfg3fBc3bR+Lo9baKOVd3lNpP
	JxOdqf0F/k0QsDy4WlDbxHOS5BBFRQEbc27/PcMvK4VANgv4zIPB1tQYDts4Pv3uDg==
X-Gm-Gg: AY/fxX6NY52Tls6rNo2TX3oI45GrP0pISuQrc+oqfgoLFmyY3PpJMcEOQkX3t1ABwGl
	EWSQSDcMJwxxXGwR9VYVJlCDsxntFjNJk6K17yA3ADnKloGUpkik0XiirPPR+pMg4mRi8ft4ODJ
	kKqbPCyBdjniJAZJagtVWoVfpgrXvtK6YniZlWCrWEuCPZt4Z5uY4sHFInEKAhiqcBIsjxwUc2s
	8XN7a3qo5lnJOzDrAv9jUbOcjXeHjY54Kmx5MG1V0C4itBennWkxxAOLJGlOwkcgm7dwsrKwiud
	9vk5Kuxg1f9JkK2gQa2uU5HLVVzYB9HMoMuYP5Qx94Qe8bys8AnvY0iuxgYjoiJEXPgpse+F+pB
	mnsMU4y/hQ1OAnWzc7zZ7Wp6yM6Z6UR0OG58DpTPqvmrpU0qU3x6ak8qIGwlR7z3AJNVGJmQxN4
	PZmcpYJq97FZZM4D9mpA==
X-Google-Smtp-Source: AGHT+IFA865YiL/SGKYZvDw31gF6v3vjD/bgpQhTY+81CJ5vFnSIbiTZ9Gkdx9EH+BTrotYpNM83Zw==
X-Received: by 2002:a05:600c:c1c8:10b0:47d:403c:e5a0 with SMTP id 5b1f17b1804b1-47d403ce6e0mr358741175e9.12.1767610553632;
        Mon, 05 Jan 2026 02:55:53 -0800 (PST)
Received: from google.com ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6da2425esm146867955e9.12.2026.01.05.02.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:55:53 -0800 (PST)
Date: Mon, 5 Jan 2026 10:55:51 +0000
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
Message-ID: <aVuYt24q6nihC4t0@google.com>
References: <20251231143538.37483-1-fabiobaltieri@chromium.org>
 <20251231143538.37483-2-fabiobaltieri@chromium.org>
 <20260105-helpful-ocelot-of-eternity-6bb1ee@quoll>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-helpful-ocelot-of-eternity-6bb1ee@quoll>

On Mon, Jan 05, 2026 at 08:52:56AM +0100, Krzysztof Kozlowski wrote:
> On Wed, Dec 31, 2025 at 02:35:37PM +0000, Fabio Baltieri wrote:
> > Add binding documentation for the has-fn-map property.
> > 
> > Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> > ---
> >  .../devicetree/bindings/input/google,cros-ec-keyb.yaml    | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > index fefaaf46a240..fa24b1cbc788 100644
> > --- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > +++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> > @@ -44,6 +44,14 @@ properties:
> >        where the lower 16 bits are reserved. This property is specified only
> >        when the keyboard has a custom design for the top row keys.
> >  
> > +  google,has-fn-map:
> > +    description: |
> > +      The keymap has function key layer. This allows defining an extra set of
> > +      codes that are sent if a key is pressed while the KEY_FN is held pressed
> > +      as well. The function codes have to be defined in the linux,keymap
> > +      property with an offset of keypad,num-rows from the normal ones.
> > +    type: boolean
> 
> You still did not answer to my previous question, why this is not
> deducible from the key map (presence of KEY_FN in the map).

The driver behaves differently with the fn layer is present, has to make
extra space for the extra codes and enable the logic to use it. I can
certainly detect it in runtime, would have to always allocate the extra
space even if not needed and check not only that there is an FN key but
if there's anything in the second half of the map.

I'm not overly enthusiastic about it, it's a bit wasteful on memory
(probably no big deal, half a kb of RAM I guess) and somewhat less
defensive to misconfigurations and in general I don't like the new logic
to be enabled magically, as a side effect. It'd be extra complexity for
the sake of saving one boolean property, but sure if you think that's
the way to go then I guess I can implement it that way.
