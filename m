Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF535DDA5
	for <chrome-platform@lists.linux.dev>; Fri, 19 Jan 2024 08:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705653303; cv=none; b=UhXwHEQzqGLkn2s1bBq8nZDduiA/SxFBVgUwlsieOtx5DtEOOh1ZXYtTZ2CV/UOFP/nQHlEUETkBp+NzTk92vWJS0yK4YlHOQnAvek/f/MI2ffPq3Ny1uelwJu0T9REQrgvaSkLt5VZ5kykki+ERpNT6uOY8oL/rMK1P0WgOAgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705653303; c=relaxed/simple;
	bh=h5PiG7Y3C3wtVijqXyMQ5ULW5o06mfqMjUtDXYxPOz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fB5tFYNQPzQlUyJYjPHXWqt1JigPIfFBqAJpYgO16gXHAKloXNCsAAqGx2gkWBtE5rTh1kB2Ma6Bi4+KehyPP+mG3MyTZI7DPnu/1jrddUlp2H21aeEY/kQ3acX45M0JMSrxNH43xneBkLyP/Y43hbefkudHhwVQfT/TQ+IYHlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oZOyWzUk; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oZOyWzUk"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cd0d05838fso6713491fa.1
        for <chrome-platform@lists.linux.dev>; Fri, 19 Jan 2024 00:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705653299; x=1706258099; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SazaNZvt6lGiurJ58Mpk9uqodPXR3M0NpSG4gQw9/io=;
        b=oZOyWzUkAcFZG3wiiAzR2V+dDpU9rPTfRop6BMjbTMJrV7X4NcvMzs66+ZgehHz0Zs
         VvcA+HjSrwfQAeIyb/Cn4EtStmcQtloytbz6GGq4JN154kugNs4oNia876oCGO1D+J8K
         /Rh+D3zk/2h8yfE8NilIcXAHKuugSdGfjzek0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705653299; x=1706258099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SazaNZvt6lGiurJ58Mpk9uqodPXR3M0NpSG4gQw9/io=;
        b=CciCkXGmuAMfTCZ9hxw3Cw5XWD9d/1EdIQkQRb0YQgzBaKMxnEg1ENkLCc6oOJocyw
         mgiqpald9gC8iG4HIUI+rp8k3kRN5IGiBbp9RFLHrbWT6ugYno+bVvErGSf4+aIT7/Gb
         NNKxGBGiWmHALNCMPqtEqFbLcG2TGTATARf4l9iPeZQVeicDHrRWh6aFaeAPh4qlN+qm
         tQ70U2IbCMoTu3TPkDOp2qXPNi/qBwYLWG0Il3F/gU4sFzoWppJmXl1B3W/mWKEbWome
         fph7HRvUAFhQB+qs2b6EplgFGzUPuFEYqK5nb2KODQeLGtHlpPe6jrGSi7h9/ltLOxfe
         QajA==
X-Gm-Message-State: AOJu0Yxpdto47Vvjq3qxaBOrx8Vckyz35pBppWJ9M7ilKaOtassVg5rJ
	1O76JHz294RMfcM2tloc+bak1Y5LKYJgctV/MYBFw4sozQXEMngPUvbQM2Xb/hcwNXCLua9Z54H
	mCGi65ULPOj+5hCJYPsYgl+0O9loAau6ovoHW
X-Google-Smtp-Source: AGHT+IHumnjC8v2ZVnJ4jI370OjVCVyQIbL03dj526jJ2a1saWl50XX/H3mQqM2tG/aYTwIxewEYydTL+1hGMBgUPkM=
X-Received: by 2002:a05:651c:1a11:b0:2cc:fd12:40ea with SMTP id
 by17-20020a05651c1a1100b002ccfd1240eamr1651789ljb.42.1705653299491; Fri, 19
 Jan 2024 00:34:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240118195325.2964918-1-lma@chromium.org> <20240118195325.2964918-2-lma@chromium.org>
 <ZanvffnDDoT0j2af@google.com>
In-Reply-To: <ZanvffnDDoT0j2af@google.com>
From: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@chromium.org>
Date: Fri, 19 Jan 2024 09:34:48 +0100
Message-ID: <CAE5UKNqa8kbcjNmWb4=m4tLJJKStUaYYP1OMVkqr2T3Xgdz_MA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] platform/chrome: Update binary interface for
 EC-based watchdog
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Gwendal Grignou <gwendal@chromium.org>, Radoslaw Biernacki <biernacki@google.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2024 at 4:41=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Thu, Jan 18, 2024 at 07:53:22PM +0000, Lukasz Majczak wrote:
> > +#define EC_HANG_DETECT_MIN_TIMEOUT 5
> > +#define EC_HANG_DETECT_MAX_TIMEOUT 65535
>
> EC_HANG_DETECT_MAX_TIMEOUT isn't in the latest ec_commands.h [1].  Could =
you
> either add EC_HANG_DETECT_MAX_TIMEOUT to ec_commands.h or drop the macro =
here?
>
> [1] https://crrev.com/5a76e67210b15fcf67d8a6f90439993598949ae4/include/ec=
_commands.h#4749

Yes, I will update ec_commands.h on the EC-side to match above
definitions although it doesn't influence any logic on the EC side.

Best regards
Lukasz
