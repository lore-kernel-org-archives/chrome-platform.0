Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C671BA49
	for <chrome-platform@lists.linux.dev>; Mon, 16 Dec 2024 22:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734386948; cv=none; b=WrGtLiCIVPTGRKqCtbHkzDaquNYu5cLq0cmb2hx7CZQ1hOL56XhUe0VHCt2cVzBJ+M0uIj0VdU9+aiFoU2VoTHbabyHF91mnSoSCHu6401qJqmPJCGplGWi1bQwJjLhaKOANQQQx/RlErUDEPQmgG6qlstUDxbcBz6IbyY0Ryq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734386948; c=relaxed/simple;
	bh=yQCX6UcMnDUp/ebrXSxVTtMu3+RTnTHd4uQij3XT5Fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uyh6JtpISW/8vkA+A7MLRs8/MyZzflczvxd0RTOHrAQ0cPPxXYDXYW8D8IgfDx0MBjof75MXylisdhTuy7lhHr2OKHo5gjwEgb4TQZ+MOkUH7ALNjQD181Me6LUS3O8UfWyrUIq2yyTaq5faXPf6fDxPLSdziFC0MQVQyVe8oMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E9Kz+89b; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E9Kz+89b"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-216634dd574so26860005ad.2
        for <chrome-platform@lists.linux.dev>; Mon, 16 Dec 2024 14:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734386946; x=1734991746; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yQCX6UcMnDUp/ebrXSxVTtMu3+RTnTHd4uQij3XT5Fw=;
        b=E9Kz+89b8oyAwowesVJ9Ml1LZwfHfSAoruyl3rMS4b9DwrK+LQNIuS+2l4AMecvoer
         5y1PhE0LTsYo6uO2CwNWpk8XJq+Nv7DxJgI9YFyTJWGyFOjAxPK7CVT00XHcxa1Z21Hb
         IduwjIw38tby2icB04OYGPZOER59y36PaTPGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734386946; x=1734991746;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yQCX6UcMnDUp/ebrXSxVTtMu3+RTnTHd4uQij3XT5Fw=;
        b=VIlKfH7+7udKcT0MjoLIrd4n46PEAb9EGxgmmZ3HprUf1+6OaEnsB3ymIgxGXmqhos
         fmOCnMPLIWNMteph0xrpL2wyA4wcsfpVTlnPU2JcPR9zrD0CNIuZpTU605VH8ulVLTXl
         32MXsLlpSHIbLQltFuSuTboqAIuL7l7l/RMZBcR2GRcBVeCBMbYmy0a4ycJBrr/AkZJ9
         A8nUaVSM1ZR6gFX6HQb5S+PiTMlehaZ/Wq2QrDikADnw2mmZYOggSmdrhhdXMkheKdVU
         AB/9Jb5F1ZX2mryqrJedTQGA+gHN3kvsxmrZrLbmbP8WVcbuVYHiURCVwRmwyBi8OjR5
         oYbg==
X-Forwarded-Encrypted: i=1; AJvYcCXJUs+srM6Kz1wzEacvPvuPJr+12Nt4qqMoLqNwpgkHlLED75Mi1EJeBX8dyysliorVFar2r1Rr+wXDWmhODoA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8n358MIxjLCoXCHWsRge6VelQWSysp56cTBUKa/4M6haY/hMZ
	e9dJ3aghNm4/4O/+f8HfpFTm+u8V65/PJeJ0+as2aNR9Htkga43iPLfnrpQvJg==
X-Gm-Gg: ASbGncs12nxbaDK2HHT2jtHW7vNy8axEZek77hiHLO3Dsl1cqKM+PucysNmLd7mIqgo
	0Y+N4z4KFkzgu5hJXZuCqAii7ODUKAJvUtiHt2iZ6UmRJrjRqCl8s9DoQyfw+IYwKcUbmCjse4S
	K7/q96/VumwwX8sopDGFcHpFuYMyLh+GQ56qCCTtZSVmIq1znTnGNabg2nfufGLQSm7PpqqMdvj
	fgmHY6OVwsD9qXaDgjhu4T64CpuDkA5rt+9qgfYoLbiPHYucuTqb4g2Nie/a+nkFbX2gUNp2M2+
	XM+nbQhN1ShgNys2sg==
X-Google-Smtp-Source: AGHT+IF0qnHFTodFMN4c/RNBWrM8LsGEcXlK4lpCa1SOJvQ51xusdNhWmW+BhonT5mL6jRMgbb0K1w==
X-Received: by 2002:a17:902:db05:b0:216:431b:e577 with SMTP id d9443c01a7336-21892a5bd14mr183701945ad.51.1734386946608;
        Mon, 16 Dec 2024 14:09:06 -0800 (PST)
Received: from localhost ([2a00:79e0:2e14:7:953:5b91:a52c:e817])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-218a1e502c2sm46192815ad.128.2024.12.16.14.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 14:09:06 -0800 (PST)
Date: Mon, 16 Dec 2024 14:09:04 -0800
From: Brian Norris <briannorris@chromium.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Julius Werner <jwerner@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] firmware: google: Constify 'struct bin_attribute'
Message-ID: <Z2ClAB6qY5LaMuHQ@google.com>
References: <20241215-sysfs-const-bin_attr-google-v1-0-e5c2808f5833@weissschuh.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241215-sysfs-const-bin_attr-google-v1-0-e5c2808f5833@weissschuh.net>

On Sun, Dec 15, 2024 at 03:49:08PM +0100, Thomas Weißschuh wrote:
> The sysfs core now allows instances of 'struct bin_attribute' to be
> moved into read-only memory. Make use of that to protect them against
> accidental or malicious modifications.

I'm not in love with all these "_new" transformations that need a second
round of cleanup, but I'm not aware of any better way to do it.

For the series:

Acked-by: Brian Norris <briannorris@chromium.org>

> Please also note the remark at the end of the vpd patch.

I don't have much opinion on the options there. It seems like it's the
difference between an extra cleanup patch or two if we go with the
current series, vs. extra work for you with possible conflicts if we go
with your alternative.

Brian
