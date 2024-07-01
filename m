Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B48847B
	for <chrome-platform@lists.linux.dev>; Mon,  1 Jul 2024 01:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719797718; cv=none; b=U3grbAzeU+AUF0jteBIJPhbOqsI+DlQ7jO7jOjaIDuarZPotK1WPxtdjfrVclqhpYDwzxQY97FVMEP/MSD7Ar0/w4WVCUQBm0e+qI2FDxscWjDbsGFMCNvoXSc1oFdGcNXeyeifgb9vY+2d99qAamz6BqM9Ipzke6jB/YvER/5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719797718; c=relaxed/simple;
	bh=QXGvyv4dc/C594KPbdWqh+erqMWMNESAXYjWqoBFgok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VuPy9gVqNRn4MDA5BhzPgrj8YC91YiMtNcNK/6TNT6ThD13yf/dZZZRjy2DhCiQ4i624Rev/Gp/r5G+zibAilONRPgeA5+UN2Z53a1309KEztT6zP7enP7scN4WsHqpGJN0xaORGuFhYVD/D+N0MyS32IDPwfKdP/QrDu9UXu58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJz751WV; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJz751WV"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-70670fb3860so1405357b3a.1
        for <chrome-platform@lists.linux.dev>; Sun, 30 Jun 2024 18:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719797716; x=1720402516; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TQQn1j58t9nLeF0b2LNufFZwTiFUhCHzGVW8dgiIQ9I=;
        b=BJz751WVG5RcBStmsPt84zUsiTfmQF8pQrvdXAJZ4dfglqcYYFAHJIlyJowCCvzsG0
         bXYoHs/ppU+QrQ6Cseke+8yH/BHEe5Lm5n0h93i0Mz0U/2ZhKecvx7AecYQ010aBoZFR
         5ltQWaDmdK1X13GEBss2aNd33P4CyVgJzDTGsFDZT2JoUcGOZYP7HegMJtwnNK60roXj
         f97QTGWfbXZ9ZsMnh7OijTG9g1ke69/5QJiaQ5MB/i6vUAdrUcQw6TwJWp0oUUmFfXSC
         3J+sgPbema5viopj65G6VdgkBeuwH1J8RStovBepBdcUhSWilWlg9Bj4q+uvjHUs+HRA
         ckSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719797716; x=1720402516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQQn1j58t9nLeF0b2LNufFZwTiFUhCHzGVW8dgiIQ9I=;
        b=e096GkOdWb2nZzA0tLg3fOJT30vRlvjf3ShRRzRx9fwvWkMe/iBhv8J/oK4THcJ7OA
         4bnT97nR+AiKFBO7jmMu9+xA57UQqCyb3moKDdXhszWEgKZaiRQ7I9E5Vo3qA2HPXJyx
         RhPnS3YYevtPrJyHPTbLJ5XTYA1M/L4PGhxNLTObCJzBRj3Al4M3plG2llRmrdbMWvUW
         Pd8TbyXwuOFSSJcfd6iYNPo+lX0R44frEMIkmZO3EXarDObseWnaJ0BnYWRSFmUXK1Os
         4fh2k1rrKJIc8sPny6sKhIKEkNM34mevlWeQSG5lgQAXKEUNuFWIF6rtboQjut3Hpp/u
         RCkg==
X-Forwarded-Encrypted: i=1; AJvYcCWI1j0HJF8mv6z/uLkqaS17a1JjY3lXIDUZ/Dv6POEpZwjGh18Bsy+FBtV9KulqytuzGZ3XYFUHOJoAbdZTArEz7uoZvxqEPhBUg0Mbxli+
X-Gm-Message-State: AOJu0Yy/3Qfrsg0U2dDsUwCgMKmlBomxcSkF/dpmdualdkfVOn8JCjKo
	r/Rtjk8PH/NsdhPS85T8j4QlvsbC17wIo2QdyOQdwhaftm3YGOIY
X-Google-Smtp-Source: AGHT+IFBK4tz7vP4nvoPFyP+apmogncqsE6QoVtl2tcv/PWC9oXL42qPiAGp55B55QszY0izCcu8kA==
X-Received: by 2002:a05:6a00:3e1d:b0:706:a87f:98ae with SMTP id d2e1a72fcca58-70aaadd0e01mr3447630b3a.24.1719797716258;
        Sun, 30 Jun 2024 18:35:16 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7783:69e6:8487:f6ab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708045ac8b2sm5267910b3a.183.2024.06.30.18.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 18:35:15 -0700 (PDT)
Date: Sun, 30 Jun 2024 18:35:12 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Daisuke Nojiri <dnojiri@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Reka Norman <rekanorman@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gwendal Grignou <gwendal@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Lukasz Majczak <lma@chromium.org>,
	Ching-Kang Yen <chingkang@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/2] dt-bindings: cros-ec-keyboard: Add keyboard
 matrix v3.0
Message-ID: <ZoIH0FfNGAZPgCCi@google.com>
References: <cover.1719531519.git.dnojiri@chromium.org>
 <9ae4d96cc2ce8c9de8755b9beffb78c641100fe7.1719531519.git.dnojiri@chromium.org>
 <ZoFM9QJVp3cpf012@tzungbi-laptop>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZoFM9QJVp3cpf012@tzungbi-laptop>

Hi Tzung-Bi,

On Sun, Jun 30, 2024 at 08:17:57PM +0800, Tzung-Bi Shih wrote:
> On Thu, Jun 27, 2024 at 04:53:08PM -0700, Daisuke Nojiri wrote:
> > Add support for keyboard matrix version 3.0, which reduces keyboard
> > ghosting.
> 
> Dmitry,
> 
> I saw your R-b tag of the patch.  Would you like to apply the patch
> through chrome-platform tree?

Yes, I think that would be the best.

Thanks.

-- 
Dmitry
