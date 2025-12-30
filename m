Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7CB276050
	for <chrome-platform@lists.linux.dev>; Tue, 30 Dec 2025 11:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767094970; cv=none; b=FnY4wzgG54nbojcZhV1dvwDASb0R3b21hwu71W7kb8a0h4LVZq08xAC97EGUhtpLBPK6usIP/SvvlL24DSXcaWUJOAos86IuBAWsZT+8LxB8Rk5cZgqdSG2JL+nDf5S4KoSUL3DE/n8uleWzJw1pFdVkHstovGVwwXaUF7NFqFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767094970; c=relaxed/simple;
	bh=W1I5n7Y43qAPPmembYAFQ2bODbvz/MzKLDxex8k0KLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B0DNF6uFlGGZyARyb+A73fCqjzVXBqisTe8j05jsAtpjMYXJyioitltln/jxVRHw8JSXLnYEsqlQEYEA0EKZTFqJy7uWxxon0n4yWxHA3eu2M1riC7Mh3rm38VK+M2Wsr95nnupI+7NvHd5UUQq8lgt+oDtjHej+NOH/ZSCZhak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I38JvwdX; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I38JvwdX"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so7704891f8f.1
        for <chrome-platform@lists.linux.dev>; Tue, 30 Dec 2025 03:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767094966; x=1767699766; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ec7rpaL2aGUuJsuasFfWfPs3/0VhYUl5PR3FKjXgrDs=;
        b=I38JvwdXK3B9L6mXHIlGNrl3fA/WDYBVeB80WvqmZtxX3HnsYlAaGUAMEH/i1c39Rp
         4DrJ6ZstHiOo6LowFoSw8AzCUrZy6ZIRquaNiC/yKRrH2/ERntvw6L/XndG+1nQI+Eiv
         cBrzMCNtqVPWNHZi46f9Qi6x6n1Yvrkcps1aI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767094966; x=1767699766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ec7rpaL2aGUuJsuasFfWfPs3/0VhYUl5PR3FKjXgrDs=;
        b=cWYFkB8nIviRr8TUl5NVSuOkDhxga+RKp2pgCHxVx/xKLrmYO0hAiF4X2D+s5AAPaq
         e/nRQHuLLfE5z5idAN57180BFVVE9deureZ7x+M8Ce5qQb6zxHmwIIkWd3qfpOo68k87
         kTpDjMfW+5aQdLOKJPwN6Ec13JKJaeZo93o15Pi75RpnU/G5ZN52+kdNvfJwJYb7gzRH
         B1PExYTT3GLYTMC7RxA+MoTvzJJ8GL1kKh/+idsbJE0XCG9AXB4jNqTQrUqkuM5ean4k
         0Uw6Ax7OFdSBzLapoFDrSqeHVFaXRy40r4OcudlEcBV6a38ZB77INAHXkNtcZ2nXbKl7
         yTdA==
X-Forwarded-Encrypted: i=1; AJvYcCWouOLAtMMIPdOxJqecBm4zdBtgyr4gN388aq0zRo2F2/Rbt9GJfyK9feKGWq3l+vKKREfLI26iwqCdArjb+Cc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYk6Zac1If76wBonf7cvtxAqCkeQ+Fjmxg0n99PyMt8oeBlElT
	/hU9gnLkM9dC3DzVSLWosIu/Db+XEFA0zp7caOBteGc4UFrVC+P8adpNSu2ENfckkg==
X-Gm-Gg: AY/fxX7pM3bwVLZKhIxIEqZLf3UbLbaTYwj7p5yVGz/1cmVjHudKiMzvE+l+XDDEYqa
	lXwz6ClnndhUAgSWokBOVQdAf0/jfFJ0D1Mt2k7s2UqUbdil1VQej50/bcAXvgNbqbooXLXrXWj
	/LwLNnjOlsftl2ADw1cuij5AcYULEnuyTOc4BDhNvTV7d39+nj0EgEkXrn11kDmwaWJ/WtjKRkt
	ks9f08QDcj2Lp6iSpIicxkZiRkh4+v+dV+A5mm9GdGJhWConBrcjJwBOk9Hm1xEOI5FvLxbCAyh
	aaRbLgS8YfS+8pggtwAPjHvhQFMedTyAhIGS921f1cKJLWrl/0JZrDnl7JGTVnowzsqNa7tdeD9
	bh67CKz60CPKgd5HGLxJDmN3WoC7r0DBYEvF4i6jR18xeXWIzE26gFBTYTcgQ8hFMgbQSFVFpRL
	BGdbIrurkhvpTRlLilPcuQTFQa/V6p
X-Google-Smtp-Source: AGHT+IE1EZZ3iXjzIXqJjM6pUCinYXxs5mhQl9LTGmF+m9PMSBJUOFGdEr/Asv7D9VBeVrox2F4jkQ==
X-Received: by 2002:a05:6000:2586:b0:431:808:2d3d with SMTP id ffacd0b85a97d-4324e4fdcbfmr38901938f8f.32.1767094965729;
        Tue, 30 Dec 2025 03:42:45 -0800 (PST)
Received: from google.com ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa08efsm68411184f8f.29.2025.12.30.03.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 03:42:45 -0800 (PST)
Date: Tue, 30 Dec 2025 11:42:43 +0000
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
Message-ID: <aVO6syiW5uUtOXRi@google.com>
References: <20251224152238.485415-1-fabiobaltieri@chromium.org>
 <20251224152238.485415-3-fabiobaltieri@chromium.org>
 <20251227-laughing-white-dalmatian-f9d98a@quoll>
 <aU__uxDmeUq20Mg3@google.com>
 <0c01fa63-670f-4c82-aa74-dc855cb12a78@kernel.org>
 <aVKDJhVuOz-V9tb2@google.com>
 <c539aa2a-e9be-40e7-9b75-1723bdaf0a39@kernel.org>
 <aVKgsGwb9Rqteekj@google.com>
 <e0f7c2f1-c876-4e19-a836-2b1629cdabf7@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0f7c2f1-c876-4e19-a836-2b1629cdabf7@kernel.org>

On Tue, Dec 30, 2025 at 08:26:56AM +0100, Krzysztof Kozlowski wrote:
> On 29/12/2025 16:39, Fabio Baltieri wrote:
> > Sure so I guess this falls into the "describe the hardware feature"
> > category, so is the suggestion to rename it to something like
> > "has-fn-key"? That would be the hardware feature.
> 
> 
> Maybe, but then I would follow up with - what about "alt", "ctrl",
> "shift" and "fn" keys? And what about combinations alt+ctrl, alt+shift?
> And also caps-lock? And why exactly this has to be even specified if
> matrix map already has the FN key?

Fn works as a key layer, that is when the key is pressed the rest of the
matrix uses a different keymap, different codes. The driver has to make
extra space in the internal data structures for reading the new codes
from the keymap property and use them when they are specified. The other
combinations you mentioned behave normally, nothing special about them.

Looking at the input driver history the other driver that [used to] have
this was using a platform data field called use_fn_map, guess I'll go
with use-fn-map then (that one has never been ported over to dt).
