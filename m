Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A45B78F54
	for <chrome-platform@lists.linux.dev>; Mon, 28 Apr 2025 15:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745855318; cv=none; b=mbMkVZfntxDgsTKcNUnuM/ePaCgjk+GtC4Z2r6TAZhz/vEpzsCYYud7RwipLBxAzr9h1Dx7ySHyRHWLkmIGIvY7RG3Fl4yZ/c/YaZE+pozputAieBKWWsFpA/GfqAFvy1kDxqhc1w0/ZadDFftI07Is3DnJtN0iYR8Gdc3N6gok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745855318; c=relaxed/simple;
	bh=Oc2BsjsMwgLoD5XEewehoYbq0a/17WumRr5giysjpjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hq7AHm9aAWDGevVT8ShDY3j9G/Gsh8FKhkVpBsYsci2DUBpA/wY16TRWwsiyvOIGLtvCtPQTpafSJSd4a5IHBl/nuRaDW6vCYLy4iDEio/SsgZFxp9p/di8wcZE5Gu+W6FDjd2CGcY/frQXjCOhVXNJdcvQTfgQ4drX62EQ1wpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZHL2+Ws9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZHL2+Ws9"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394a823036so48025015e9.0
        for <chrome-platform@lists.linux.dev>; Mon, 28 Apr 2025 08:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745855315; x=1746460115; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oc2BsjsMwgLoD5XEewehoYbq0a/17WumRr5giysjpjI=;
        b=ZHL2+Ws9zry9KRlxsTaLKa9Jfs9URK4YjldDwaZ6cgKzh7SeX/CSCK8X6H/LBUaP3J
         uaBTjRprHTmRtJTwsmhZAskzBosW4DZdURqCv4l5YXRz0i3rYDt9tWvz0gUylb9AqK7r
         2ayEN9Vk4jJYZTyIk0iHoLU4xuo45/lWIl8wl/IChY6hUr5OtBFSWWMX5hej05vmMpkk
         8ie02kjmoTMVaz4uaW9nbMLdzigYUvJGYr/NYDIzOYxMsZsJImxsonMOwt/iAmPzChE7
         u8yEm32hwJVj72nmPRlc08Mm1kMSjdQ8cJn9xs2u1ehIJrLIwEqCf41/U5KpsYdl9ya8
         TAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745855315; x=1746460115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oc2BsjsMwgLoD5XEewehoYbq0a/17WumRr5giysjpjI=;
        b=AmZvbWndoyiT72tzgEhm/E886qvGSEfxxsOvsFNB1Q3HXPfxIUj3YkYnNiKaWubVKH
         KPUmVToS4YaoV5tmlRiUMUlpY+6Q084QwwrZ8E4yxjk+C1IbS2qh4XBmmUXN4LhVH4j6
         BRloNBxivIXCxBQ2FFH1FxY+u28/GVeLOGUo5QB5xKAQb7w7F2sNMoiR4417FSOxxUbF
         xwyCM5Lzc0CigrqbG47dFTFCBewtRhazpRvVZtcuZxvKLFKanxGOuLrBA1loxMNKastL
         +gt9WtA/jPepfHWswP52X9oOxkkuJbgca+hGYpWVDQ72fK14Kt2Ca9FrCUDTPO+PrafO
         bc5w==
X-Forwarded-Encrypted: i=1; AJvYcCW6dWo4bQ6Pr3zo6gS+y75utgOcMk4M7y8T01qPXZ3ZzVTA0wIMX+gg12thmu+vQvql5YuDJMn1xnZbCquhJxU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzs61bTiwairBwzHhXj4x7Kp3cIDDMs9aHxoV5qZcGvpeG7m6e6
	izIcPZZ5vhx/Yb3MLKYWCUX4FwJjqDsrw6SRMFAdW4zHaErtmCpxGeq+2v/5BwdR1Jg1fcX26k+
	3mAs03ckNgjedbTSzVmMLgwv7CIw6cTfbLd7q
X-Gm-Gg: ASbGncs3UFzsU3KNSIZcsi/kCF4nlNG+iem8f37Fg6U7muDTRZnzq0EFrY155mto735
	RGGhAZZAHkZNJump7g+Wv78JrRsFkq4ukaVWIztwaqanRuyp/tlsS4PvHzXvibDSTtLfWLiNjMK
	n77LULO0pMZtVFKYNA4jA22jtHT4cxkyv0ALHMbVO1OA4WGmLDyGg=
X-Google-Smtp-Source: AGHT+IEBIX0s48PYMYc7ZAlkpJ51AqlhXnnrtXNl3j1AB6qplVBQOPQcuk1wi9rMT4KwloL8RHijaKT7JBlAdq1V32g=
X-Received: by 2002:a05:600c:3b0d:b0:43c:f332:7038 with SMTP id
 5b1f17b1804b1-440a669994dmr95026445e9.21.1745855314637; Mon, 28 Apr 2025
 08:48:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250426024810.3876884-1-bleung@chromium.org>
In-Reply-To: <20250426024810.3876884-1-bleung@chromium.org>
From: Jameson Thies <jthies@google.com>
Date: Mon, 28 Apr 2025 08:48:22 -0700
X-Gm-Features: ATxdqUGLnoEyfsnKxMr20maG-7vwqQ4ey0dYeEd5XwxkmwS8PcuhP05zb5tlI_Y
Message-ID: <CAMFSARdg=p71wWoUT4G8E87bLNvxQ-JhaLbeAL6D0aUfAs-jUg@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Set Pin Assignment E in
 DP PORT VDO
To: Benson Leung <bleung@chromium.org>
Cc: abhishekpandit@chromium.org, akuchynski@chromium.org, tzungbi@kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	sukoo@google.com, bleung@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 7:48=E2=80=AFPM Benson Leung <bleung@chromium.org> =
wrote:
>
> Pin C and D are used on C-to-C cable applications including docks,
> and for USB-C adapters that convert from DP over USB-C to other
> video standards.
>
> Pin Assignment E is intended to be used with adapter from USB-C to DP
> plugs or receptacles.
>
> All Chromebook USB-C DFPs support DisplayPort Alternate Mode as the DP
> Source with support for all 3 pin assignments. Pin Assignment E is requir=
ed
> in order to support if the user attaches a Pin E C-to-DP cable.
>
> Without this, the displayport.c alt mode driver will error out of
> dp_altmode_probe with an -ENODEV, as it cannot find a compatible matching
> pin assignment between the DFP_D and UFP_D.
>
> Signed-off-by: Benson Leung <bleung@chromium.org>

Reviewed-by: Jameson Thies <jthies@google.com>
