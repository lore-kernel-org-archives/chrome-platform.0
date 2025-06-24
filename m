Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8DE1E32B9
	for <chrome-platform@lists.linux.dev>; Tue, 24 Jun 2025 03:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750735481; cv=none; b=aE0FRFRFefz4DiOihb9Ld1Y/vYN0iI2fX/Y6XFa+W148pLx92C3fK65UgLXPJJ0xaA426FEYmSXc3jbKyheMIYeGMKQNTlGSKXs8DRQATh+yppX9FNFPR7XEVR+HnXR8WxUPXhumxpthn8ehv1ujQEc+UJ5Ig+YgKfvQBouHzV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750735481; c=relaxed/simple;
	bh=A18mPcFzj7x/9SfA9+YBM6V2Bgu/HPCpdwcFxHdOTI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eb+oDHh2myX8fmcOFSt2k5oiE8F4fYBHGxFVfeWs5QXcTYr9vSZJKjOPeN+067R8+K/OHAzO4ioA2r0fw4SRZeH2yjnoKR7sLThDXKyCk34dfhCEsEUVeVGWMb97nQPKvuCEi79Stql9SGOAwkEgsTE8G4USkOSFyFQGtLeOm8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VceepZGo; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VceepZGo"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-51eb1a714bfso3567916e0c.3
        for <chrome-platform@lists.linux.dev>; Mon, 23 Jun 2025 20:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750735478; x=1751340278; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A18mPcFzj7x/9SfA9+YBM6V2Bgu/HPCpdwcFxHdOTI4=;
        b=VceepZGoVt7yy5O9I/h45N8egWGv9TDPQSDshU1uEKM2a7S2kjWkJvXORABaLrY3Kk
         bU/x4Aj9AwRbvIpjUJ7AU3ohMA+wVww2hXFsjXotPvfw58fNUzHeQw+sGxeHKYiQt6DE
         WbJqgZMyjV07Eew9jm6sDVyDgd8tsi60Va9Zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750735478; x=1751340278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A18mPcFzj7x/9SfA9+YBM6V2Bgu/HPCpdwcFxHdOTI4=;
        b=M3IGHlgfwlqxg0mWxcjmiGiJAJBNXEH95MpGuw2N4zCyuKCVujNAhAycos0QUwEuCh
         oA3DXmg0xmyiAOO4WbUKIrpemPD62dOUZDXszi8n7NHcdcmqsKNW+QxXkHBR4pUobowz
         kWJPCQlXJyLQRZG31IcUk77R/M5HN1wkElP6WgRgRE7AfqqQct+9Qh4o88+9hhlYljgP
         uJjRrsyuDzv7gDxCWLM93xnys8gnnofOBw5G2L4dyYgFxaZEQxdZ3Wnb23D1fnh3cG8O
         h5rQCDtd2XMdgrtc/D8FAvzeJnnfLHOmu9MfG44Z33ek+DpZbewpJlk/0jfcbtu525KH
         jsBQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/GPFHvJdz6nmSvJYgiTpy+EU8Ieh19tkYS9ZysBTWvJB/6XCzYvv65GxK7P3gveYBmTr89v2J7jjG9wgqA6k=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJ2FCTohUXyRw+uzqD3b7YX8PEyU+3g+fKZoChhMbirg7w/9P0
	dEWhN+aCXMclmYBTOu39sBr5EPA0AGb1KhvuEiCx/Q3Up17yMa89pKY1BsbP7BsCWLiAH49rbJf
	gcw1uUARJ8whWB/qGXrmWEIHOwa39wisBbHuZSdF/
X-Gm-Gg: ASbGncvjv69f+dvZXz4c5GsnbokpZDyCRdiaxfbNctkrjx7vOW/qWPZDpX1Gh83mQ+J
	Oqmiir6auqxset4k6HvUvhPCAyBPvTplMoPTilsRMpaI+UYYXr1/5p8jXVduGYqRYg198i3OLsK
	cpMycymIijJq9JRBSHicI/7remUzaWb+rUoRmhgoN6Kps=
X-Google-Smtp-Source: AGHT+IFNYMnscvSgYO2AT8l9jsnQ7oqyyTtyeX2nCvFqmYCEYP7Db1MOT+7UMgFSpQs8W5qd0mijj3mr9SxxAHYaRbo=
X-Received: by 2002:a05:6122:438b:b0:530:71e7:37eb with SMTP id
 71dfb90a1353d-531ad693f93mr8412153e0c.10.1750735478321; Mon, 23 Jun 2025
 20:24:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250623185153.222714-1-gwendal@google.com> <aFoL86kzENM2jMqi@google.com>
In-Reply-To: <aFoL86kzENM2jMqi@google.com>
From: Gwendal Grignou <gwendal@chromium.org>
Date: Mon, 23 Jun 2025 20:24:25 -0700
X-Gm-Features: AX0GCFszXx7J3AbEhN26GzsevDL5HNCwGCF0GKeR-hT7uUV5XXAQAnodsCHrUwk
Message-ID: <CAPUE2us7htmAC1x1sTHYKSuSgx9sTLE-sV2RuFpcNhxc9dy5nA@mail.gmail.com>
Subject: Re: [PATCH] iio: cros_ec_activity: Fix function casting error
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: jic23@kernel.org, chrome-platform@lists.linux.dev, 
	linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 7:22=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Mon, Jun 23, 2025 at 11:51:52AM -0700, Gwendal Grignou wrote:
> > .write_event_configwrite_event_config expects |state| to be an int not =
a
> > bool:
>
> No, `state` is a bool since commit b4b42f28a0df
> ("iio: fix write_event_config signature").
Correct, I just realized my mistake. Please ignore this patch as well...

Gwendal.
>
