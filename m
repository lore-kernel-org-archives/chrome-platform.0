Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D3517D2
	for <chrome-platform@lists.linux.dev>; Fri,  2 Feb 2024 12:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706878061; cv=none; b=VFeWV2H4nHaopz3VuROmJBtenPCApy2fi3Lndnc2MocZboFVSS7qg7tFfFymIYIDSn14B3z1yFE9O2kj7RPu2KPqbXlc8LClzaXdda7KEi2sxD5VnrNYPxK9HR9HLuOi2SDOgWrv4pD7LKPy/FjOuUqldRc1PyVecNTaGEX50Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706878061; c=relaxed/simple;
	bh=1wyJXQnKtxG5KcQLBuLXfN9nPIzxAbbDUplVjEvd6Ks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVYGlGSw+B5oL4Crv0+cZEiXSPVY7LSBQN29sXSRCV8fqmI5OJBd20Vt+tzCwBUvJ5MRC0DHK9WlWp/xVCchmrfVXrh0G/R23+VN2ju8e85zlXEhuG+PXrejuy+7f8upc/rKhC8yEyBVGEqQlcb6XsF3YM1klWZeYG0JlGxQGDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GrVM4uGy; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GrVM4uGy"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d07d74be60so17395191fa.3
        for <chrome-platform@lists.linux.dev>; Fri, 02 Feb 2024 04:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706878058; x=1707482858; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOWIy2zvMPH1XH46d4jTRJkw9n61PEb1vxh49lVP0XQ=;
        b=GrVM4uGyGKt6GRWYNHmzWS7+B/gl0zRKQJ4pvRPbNgTYastLq6WZ9YWpVywGn4GEDF
         IPzeU5tQAdebHhzVHClrszkqgpOmb7qw1lTj3vbVSlP3ZCKsW4XtE2X7ihp7lIx155fR
         HpvygC444LEr67Tk6dRosWWZjlZkdXvPOYnQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706878058; x=1707482858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOWIy2zvMPH1XH46d4jTRJkw9n61PEb1vxh49lVP0XQ=;
        b=nwOkob3vJyYVNLMk+qEcyYikA+n5N7Fwb5XuTqa/CUJn7XU6MY48kxncxHP5Z1yddR
         zlk9ZOS/QgvYIL6A4gMXxLsDG5DdUR6Dc6Tvx1ANXCLVA6WXZZQpn2T0BbFon5Vr2B9J
         8UnQbiYJp94KH3N2rhaWQq9OI0RgvUQfWvSQSQldW7H2bkoGbpld13qDEsh3whv+oK/3
         htfOnTr6lKC+4WcFxebG1CXoCWnzXDUQ6hd5uwvW5bmSQZ5BxwVedgM8fJy5yi9TugyV
         gVlQ7Nirt3bETElnpV3b43vPppTTKSgItrOgKYf56BzRZly7TS90Gh3AZTqkc2R608DN
         yz1Q==
X-Gm-Message-State: AOJu0YyMnHjxAoBoHGCoPCZyEUflHf24oQHjd2XcZVOL+cK1hP1cVv7g
	B/u+m9LMH5tU5h8x9nc4tKutQpg5mkVTfdIA/0kdKy/CODCP3VVTYK5Y1HNRY4uK8LvgA9UBO6P
	7rn3JbipjhdkkooYfiwdVY5kQ/i0P5WKTzea7
X-Google-Smtp-Source: AGHT+IF0s/5ZKFtzhTR4j6QPvRkkJqWsYRXpAF/+v59PGjiQFmrY1yExMhIMTdn4RO+aKhe4pUPeTW5cDnEklfQlqh8=
X-Received: by 2002:a2e:bc08:0:b0:2d0:7572:458c with SMTP id
 b8-20020a2ebc08000000b002d07572458cmr1827253ljf.1.1706878057840; Fri, 02 Feb
 2024 04:47:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240126095721.782782-1-lma@chromium.org> <20240201130605.GA1379817@google.com>
In-Reply-To: <20240201130605.GA1379817@google.com>
From: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@chromium.org>
Date: Fri, 2 Feb 2024 13:47:26 +0100
Message-ID: <CAE5UKNqNR7869EqjNRdn_osnxLLtJma=eMmsYBE1fvzA0g_ybg@mail.gmail.com>
Subject: Re: [GIT PULL] Immutable branch between MFD, CROS and Watchdog due
 for the v6.9 merge window
To: Lee Jones <lee@kernel.org>
Cc: Gwendal Grignou <gwendal@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Radoslaw Biernacki <biernacki@google.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 1, 2024 at 2:06=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> Good afternoon,
>
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd3=
3d:
>
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-cros-w=
atchdog-v6.9
>
> for you to fetch changes up to 843dac4d3687f7628ba4f76e1481ee3838b27a35:
>
>   watchdog: Add ChromeOS EC-based watchdog driver (2024-02-01 11:49:30 +0=
000)
>
> ----------------------------------------------------------------
> Immutable branch between MFD, CROS and Watchdog due for the v6.9 merge wi=
ndow
>
> ----------------------------------------------------------------
> Lukasz Majczak (2):
>       platform/chrome: Update binary interface for EC-based watchdog
>       watchdog: Add ChromeOS EC-based watchdog driver
>
>  MAINTAINERS                                    |   6 +
>  drivers/watchdog/Kconfig                       |  11 ++
>  drivers/watchdog/Makefile                      |   1 +
>  drivers/watchdog/cros_ec_wdt.c                 | 204 +++++++++++++++++++=
++++++
>  include/linux/platform_data/cros_ec_commands.h |  78 +++++-----
>  5 files changed, 257 insertions(+), 43 deletions(-)
>  create mode 100644 drivers/watchdog/cros_ec_wdt.c
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

Hi Lee,

I'm about to sent V5 of patches:
* watchdog: Add ChromeOS EC-based watchdog driver
* platform/chrome: Update binary interface for EC-based watchdog
but I'm not sure how I should proceed - can I base those on the master
branch or shall I rebase on top of  ib-mfd-cros-watchdog-v6.9?

Best regards,
Lukasz
