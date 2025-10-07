Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02162E573
	for <chrome-platform@lists.linux.dev>; Tue,  7 Oct 2025 00:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759795361; cv=none; b=ErrX26ZXCaUiRSCDQo+0gS6ZypY8ABZRAcz+KDPqK3mWz2A+sBsmc6z0BXawAeTkGYCuvuePFNfZxlCpmYynmWHnRiRa2KdD1aNNaGKQuwnk3V8kXvVWkWKgyyRnbb2QvSfxgoLFu6YqhYdlxBAziyVL7QEim5eUWoDdYeXvG8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759795361; c=relaxed/simple;
	bh=GwSFfmTyex/Og8tIgQnlCm7Ltt0AWUYILU/NMPicnRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WzbwHm5hnUaXBhg2OdEQLp9lJ/6UKw0ugBlfvOsadY7sBz/nlM6aX6ltIsGwSGn3CuJDWO4R512Q6/v6/y6+Mrdx+wBJU5lA4oehWuX+oQSvqftOBkBs3TMp71tCcGQ1O/UW3Hm5QN5AijWg/yKT/JrA/v0Lx5hbQsd+7hpwSlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n+lPWTYc; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n+lPWTYc"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e2c3b6d4cso45228095e9.3
        for <chrome-platform@lists.linux.dev>; Mon, 06 Oct 2025 17:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759795358; x=1760400158; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GwSFfmTyex/Og8tIgQnlCm7Ltt0AWUYILU/NMPicnRk=;
        b=n+lPWTYcjgD58XR3hUJOtFWlgLgG0isR+QWDmdZHoOgaUy9PAHYv5GgEuZ3y0DTsij
         2i9o+kCPfCZ7yeI9BKJBO2R1yxLeBNlBo3uF1HFEg67U5JpQGEcTpgO6KM0L/s+s0DaC
         LVosOVeifGfMcRxlgVaUyn4eG4cQusBhqOLnVwGSxb24kBT6Ec1KGKZD49bcGKPxFaIC
         uOVDgoVpbxatWYVj3knq4nqoUTb/7+iSzN0KdOEv3yDb4d4hb1opGSn/SXZKWp4uUpIW
         XoEVYi7OWl57kQQyDPO3RXJvMuj40ru00cPvOeFXdBmRhtry5s9+XS7tYP93Ueq5L7kS
         gymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759795358; x=1760400158;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GwSFfmTyex/Og8tIgQnlCm7Ltt0AWUYILU/NMPicnRk=;
        b=tPDLqYz5mjgYoX2UHChEWByus7vNRihceagmSP0PXeorXvNAm5FKMt+YPtjvafUD3B
         d/cDiTW/cGUdf846ITLMCS/BE13jZ0r8Pri0VrhxQGoqw1GUqJ21rr9uxz15Bi9QfSmm
         wUaZqg1OYQu4TqpDdBFPQqKQ7SwMeWY9f5w/iQ0PQKBDRMtekIoGjwwUEfCseEo0TVcX
         GY+J/q2P03GIzyuktQrp9nxdedaJDi8e34s9FPJeDjg5yd88PlrSRMI008+KlfcyoeH8
         L/pQT3gDAGkgrMdYStFQAlcT3dNJ/vt0cp0o+Yxj3Q89Ps97DnFUCpMzxDas44hwj8FX
         BVsA==
X-Forwarded-Encrypted: i=1; AJvYcCUSPFQWLrNbBSIxYwCmrzvzW1Pg+YJte8qGc4hR9pyDSnQfK2PPYak95M9wAYWnzVlr8iEAgnto9V04hlBCPSE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0Ewxgi1p1K1DOz0AfGs3xD+q4CSlQz8oB/w46BnWFVCALcZ7S
	KTSqMmmj4dK1lxrjzjl7ndWG+42RUBP/Syj3Pjzxw50oDkiRrm0Bc0czlDLfU74S1QyjRy3CqJS
	vSFXI87AvqXI7f3ZUBSxeBQng7ljvyqbnLdfFc61w
X-Gm-Gg: ASbGncuXIoxt3TQn+aHBdX8HptI8Ep4fbBTymExE3GdpDzwBEHOOWj8EtXR+rjCo7jO
	FAFcQb9bq7HD1frrmP44fxLNJTCUEJ5RBgB+geKdrZ5aaiMEpM6Oh3nQhKdvxHmiU8dwT3EeDdZ
	dlVNVG/Mj4b5HgCqKB75m4SQpvSi1jsWpKqfEQL15sDU7S1azdCdzJR3a0hMmOaYoXKhv7RSbnh
	1wNjT0/KVpLPOa2MASfRNwRLoDqf5vVjd+8e19M+h+2gWoIG+uRcqf/ARUUqZEbSh4C
X-Google-Smtp-Source: AGHT+IFu3eahCb6HJmJNeqU0wWf58q+EC/8RvlKhhU41gVbmjp7uomfLvsENYszTvLbyaEuRfiMuIjvaNdO4L8NtC1E=
X-Received: by 2002:a05:600c:680a:b0:46e:42cb:d93f with SMTP id
 5b1f17b1804b1-46fa26df6f0mr9764035e9.15.1759795358233; Mon, 06 Oct 2025
 17:02:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250926202234.3064386-1-jthies@google.com> <aN5iyOsHILi40AIp@tzungbi-laptop>
 <CAMFSAReHEt7nUZvsnB5pyPTaddSVSdtiiX-RLpY4MfKq3qfX1Q@mail.gmail.com> <aN80BqZrhisWGY6p@google.com>
In-Reply-To: <aN80BqZrhisWGY6p@google.com>
From: Jameson Thies <jthies@google.com>
Date: Mon, 6 Oct 2025 17:02:25 -0700
X-Gm-Features: AS18NWBm6TS3dyOBYNW2SS83PPwxqu5Xwod9WP1KlWrgtte3M27gAsgDllBt5tA
Message-ID: <CAMFSARc5hb1v91mN6PAuUVw7Girn5QCkr7NgCxCUQbHPGEzckg@mail.gmail.com>
Subject: Re: [PATCH v1] platform/chrome: cros_usbpd_notify: defer probe when
 parent EC driver isn't ready
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: akuchynski@chromium.org, bleung@chromium.org, abhishekpandit@chromium.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> I think fwnode_get_parent() should be preferred to use from maintenance
> aspect.

Sounds good to me. I'll upload a v2 patch using fwnode_get_parent().
