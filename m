Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C346125D3
	for <chrome-platform@lists.linux.dev>; Wed, 14 Feb 2024 09:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707902716; cv=none; b=nKd9R+HCKCP0PPEO3YSHsHXObcJ9HyVPebFKaX+R+Zq0srjjxSymhDDq1NvLhSsKlMh3gS6Yg+hUhsEI1xtkVC2FCQHzlcBMyCPpYTCGQljhYbd2y0O6g0YjbGV5+8mAeCSnSS6NIzFgPslepwDUXNe4XjEOsvfdoszgWwSv1WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707902716; c=relaxed/simple;
	bh=J1nlR7f5+4VweetZBJDt8RvIZycTzFvwTxgEJjmw61c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZ+bgCOzkIqeJ6YrW6na/oOR1MTWuljWISaQUKhuSNIcLo4k0RXS60CYxn8dk1iZi/AAem7a+vfRHi6cXUyjvvfrn3XVIRI+4fX65dcrc75r/cMFeqwut6EgoIMlzkdkWqs9/OvawPhhRPrfgPJ1Yj2OQBVf03mkt0qpeEQUdu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W/xWAyBb; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W/xWAyBb"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3c02fd8e970so2704941b6e.2
        for <chrome-platform@lists.linux.dev>; Wed, 14 Feb 2024 01:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707902713; x=1708507513; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1nlR7f5+4VweetZBJDt8RvIZycTzFvwTxgEJjmw61c=;
        b=W/xWAyBbv+7xEkbGfV50GiJnQiYPoTz1BxQjWK2cWWfRr1/Vlc3jUvNW85g9S/x6F+
         T/vRUNxBde7RQcwCTeS76YA3m98x8s6+jNxW2ZnLDxlfM4M+1Hbs2kU6gINCSLRu17PU
         70krNYSTcFjgzUE2+ZoeBP0/hliptqsDecMnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707902713; x=1708507513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1nlR7f5+4VweetZBJDt8RvIZycTzFvwTxgEJjmw61c=;
        b=Gr8smoKkNxeSHU3gPQudWH2E2FjLYsBBRCOuxrYESsJwseN4vwtCZ7NehfHvykoMuc
         cwzesdDI60bkwxw1EvAk15p7t/zSaQWC1hFI0MbY3Wqc4zyuvdt1xwVBe/nWxvvajU1Q
         8OFL0wXmEy2HoiEnpd+RgUNXvg3VC9/48duPfR+zFQDlvgnH6OkDAEtY65054ac7qmi4
         2OdzLL2Tr38l1z5QX7xLpAHghBexEvLFXbNuUOnAaB4DHKVuICWyPSJjp0B0Vc1x+nP6
         zoIdl4dW27+3o6/aCCVg3oWfLQrNbio6aNKnXFDhkiiOOd+QxSxNHJYL7iCsYDMB9TS2
         IVCA==
X-Forwarded-Encrypted: i=1; AJvYcCUAUK8cvaTkjUMaR8kbQZT3+MxcEHaQuR4mW0zLXjLxqNdCiLLk9WnG7/AT651DemRA+DT3tOcSHZhjW3dxMdr9a10hGtHCLwmJZgj7Ncez
X-Gm-Message-State: AOJu0YyiKQzeGH99aD2Phs/UdQ7MxmESXhu0K8CFs3+1tZT5qIJKBtzx
	RhPq0AMO5oxj0XNYrYAcvsdyOflJwnXt4FT2nxuYWQ/dDGI8l6Z9ha3zT5E1RXGjHpfuchsGwUA
	hkwvlBblYo4mDDuWMgdo8V0CC8xT/HgKwRHJb
X-Google-Smtp-Source: AGHT+IFPrTWFaWzsN18ynBbOfrj6yKauy1rbW7JKosKMMVVRaNYQETiv1wgDZLXfoVbmYSl1ebWX/KyJ74+mf8oQl6g=
X-Received: by 2002:a05:6808:1a23:b0:3c0:3b90:ae1f with SMTP id
 bk35-20020a0568081a2300b003c03b90ae1fmr2355849oib.49.1707902713458; Wed, 14
 Feb 2024 01:25:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240213130018.3029991-1-heikki.krogerus@linux.intel.com> <20240213130018.3029991-2-heikki.krogerus@linux.intel.com>
In-Reply-To: <20240213130018.3029991-2-heikki.krogerus@linux.intel.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Wed, 14 Feb 2024 01:25:02 -0800
Message-ID: <CACeCKaeosTp2gS+5oZO3rMCVa=sWSD+PeSa6a2noiv9foJ6sEQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] usb: roles: Link the switch to its connector
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	Emilie Roberts <hadrosaur@google.com>, "Nyman, Mathias" <mathias.nyman@intel.com>, 
	"Regupathy, Rajaram" <rajaram.regupathy@intel.com>, 
	"Radjacoumar, Shyam Sundar" <ssradjacoumar@google.com>, Samuel Jacob <samjaco@google.com>, 
	Uday Bhat <uday.m.bhat@intel.com>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 5:00=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> This is probable useful information to have in user space in
> general, but it's primarily needed for the xHCI DbC (Debug
> Capability). When xHCI DbC is being used, the USB port needs
> to be muxed to the xHCI even in device role. In xHCI DbC mode,
> the xHCI is the USB device controller.
>
> Tested-by: Uday Bhat <uday.m.bhat@intel.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
FWIW:
Reviewed-by: Prashant Malani <pmalani@chromium.org>
