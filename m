Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0965E2E7F21
	for <chrome-platform@lists.linux.dev>; Fri, 12 Dec 2025 04:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765514648; cv=none; b=q6WE7MzVb5FKcPeTbN4pKwEgxJcyflPhrdpMHAdoXEFcqX9Yuow4aeXDtJ+rCoRZKLHARrD2CcKNF4skE/QwhGAqSqDqtDo9ju8LOfFRtU0QDtmUJqdBnJPwINABzFReSwDXXLpD6ZwfJgcrpNfJ2iS0UkdgJKbSN7eqXVrvjqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765514648; c=relaxed/simple;
	bh=ktZqzCzHfOOPzM2EvOjd8+qE5gzVGh5FQ5OGoF8l4X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idFCxTvPRwUlkvPfJBus8zg7WOoyadFl0ZRqdzCrJCF3r6WlS0eAT7hHxjPJ+nHq+Whms7t+YRPF8QHf92xZYPkcD9ZPXCwf8eeKY7MT9JGDRxOc/DJdgms+qcrKZtf/vSo08iLPRvh8Qh+GyhTlMLOQAVZFF720lfwvI+Ss4tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJw9ytv8; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJw9ytv8"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29812589890so9978465ad.3
        for <chrome-platform@lists.linux.dev>; Thu, 11 Dec 2025 20:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765514645; x=1766119445; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J9gBZpsCmG1xQqso4bAzsbXRPhWxYEn6n/PkIlRaLDM=;
        b=hJw9ytv8u4OwN5pgW1MipGxH2OIHkF6tdfsCJYoHVOruDQ6QY87soHsY+Kf+GtlqAs
         Rk+MvNolyG+whO9Jfu54vPc3DumNcHsFHh3KDViG0mVbZHqX4MaANp5SJ+gjs22Bl/1P
         Z6SG1oIN4bJY1YjUw+4h0nAomjaCGejQnxoi12WC64Jw4/WWqvRQ8WxCxUZd3Ob6mJeU
         nju8MlHe3L3xk0+eymuC3K4a5JNpVYhjY2qhQGLQ5XLTOFOK8dvzBTssLf7wn9egDtWN
         +kw2kpABBwUfO/5PbbvFe+ex+QCHqQPEiwFlO+oOsYQQoN3F8cK9OuYeKgKvMvq7W776
         SwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765514645; x=1766119445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9gBZpsCmG1xQqso4bAzsbXRPhWxYEn6n/PkIlRaLDM=;
        b=fDM0O0QUhg9QGt6tlxYM1vCctE+jUHCPoBCIxLEcnXh5wAIiLXVcQ+8n9sAYaUK5Il
         8xtz2BvObP5lb1I/WIswil7MbbRbJdyYSQtqFqqqJRAYxVVt59tk2xKTUtHpN3rAA149
         jh6TvTf5VrGWLjvcour+CRXSTmpU+Usp0wLr9bEeCrnNhs7RgYXmnP6OoAa5vzQfWIDN
         NGT/EmUYpG9WtXAb/IB/AC4zRXdCVwzupHSIN9sphoVSAZJj240SvpWncsqbeeaChtpM
         EEna3zNJr70L58/9KQJwNOYEle8A0cbw6zl3z9PSZInQIFTrIEZmXeUl1blHr5txzuQ7
         ioXg==
X-Forwarded-Encrypted: i=1; AJvYcCXjQE5JiH1Xtj9U2IA0FBAhoy+eb4aGoAyCtQbAEKC/GtVbJK33LbJXp3YpokyisExMCreSde6nMfPTfv5ij1E=@lists.linux.dev
X-Gm-Message-State: AOJu0YwnWzJagjsOWS1TIDFXy6MezV/dCUDBFlfeJXgT/jcKjrSaRZus
	RhTMmdar7cJuHmw6nNfnG4oDfnlL9dBs+rMhLcHcKkcD5+Ts74RYd5yT
X-Gm-Gg: AY/fxX5WtC4kMfk+9hg1hMcaN0xOix3Lyt0TzKfwxIC0I+frPRGEfpxcMBX9LNz8uek
	3tOY8jib8SrlKpRfH+RBe/Ww0+DgEULe/LM21n85uWss+x/8lVCpA7cdSIyDYJytdHaMq+uK7Ek
	/YADmzlg7wjKOqZL8vk5CDgTsPbTNsePFMzznjf3UNIq8OvkRUWKOGuoBxvJM5lAfFWwHDdYs8g
	Wb8usk1GRX2W5lBpRAQP6MTywl9AjaEFa67fU1shzD7Q/GJk/AT+8qTqeRqv0TmeCQHe+JkJ3Fi
	gdiGDZZA+SjwMqTBPJCtE98tp9ovGRTiDxaWI3nfdHH5xTp6OaWqpMnmCZQxG7b/iYc67l4JXmu
	vtw/w98p6oWBNdkkaXsCpN4rGcqi8a5PYLJ9UBYIkFRMUDZiT4EScZEuqmTwFAvYSL/x6yvkboD
	VVMJ94/z/jxW+EB/Wtk9kH4RclF9C4Pu2sT3qFE7AgDLChAsufuoE=
X-Google-Smtp-Source: AGHT+IEOVfeIqM/cAri6W38bw/FvyPFw68AOKnN78T6Txd6eJUYhJLV+lIMPJu7qekNQBdDcQJN4rQ==
X-Received: by 2002:a05:7022:f50f:b0:119:e569:fbb2 with SMTP id a92af1059eb24-11f354dc81emr355897c88.33.1765514645119;
        Thu, 11 Dec 2025 20:44:05 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:fafd:f9bf:2a4:2a0b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b4bb8sm11165691c88.7.2025.12.11.20.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 20:44:04 -0800 (PST)
Date: Thu, 11 Dec 2025 20:44:02 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Fabio Baltieri <fabiobaltieri@chromium.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Simon Glass <sjg@chromium.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] dt-bindings: google,cros-ec-keyb: add fn-key and
 f-keymap props
Message-ID: <2gd2npolfpo5jruwraamwpn3wurm7w447jnwsbcfonmhos2owf@ejrqiz3qdxj4>
References: <20251209154706.529784-1-fabiobaltieri@chromium.org>
 <20251209154706.529784-4-fabiobaltieri@chromium.org>
 <20251209192243.GA963693-robh@kernel.org>
 <aTm1PVLrS7Ra0OTF@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTm1PVLrS7Ra0OTF@google.com>

On Wed, Dec 10, 2025 at 06:00:29PM +0000, Fabio Baltieri wrote:
> Hey Rob, thanks for the review.
> 
> On Tue, Dec 09, 2025 at 01:22:43PM -0600, Rob Herring wrote:
> > On Tue, Dec 09, 2025 at 03:47:06PM +0000, Fabio Baltieri wrote:
> > > +  fn-key:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description: |
> > > +      An u32 containing the coordinate of the Fn key, use the MATRIX_KEY(row,
> > > +      col, code) macro, code is ignored.
> > > +
> > > +  fn-keymap:
> > 
> > If keymap is linux,keymap, then this should perhaps be linux,fn-keymap. 
> > Depends if we still think linux,keymap is Linux specific?
> 
> I'm open for suggestions, trying to understand the pattern, these are
> specific to this binding I think if anything they should be
> google,fn-key and google,fn-keymap, similarly to the existing
> google,needs-ghost-filter -- no idea why function-row-physmap was not
> prefixed but I guess it slipped in and now it's not worth changing it.

Just double the number of rows in the regular keymap to accommodate the
FN modifier, no need for separate keymap. Also no need to have fn-key
property, use whatever key that reports KEY_FN. See how it is done in
drivers/input/keyboard/tegra-kbc.c

Thanks.

-- 
Dmitry
