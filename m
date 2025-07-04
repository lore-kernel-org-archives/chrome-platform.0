Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C3D35942
	for <chrome-platform@lists.linux.dev>; Fri,  4 Jul 2025 03:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751600375; cv=none; b=cUP2WTdg3tddEMsZP2z+YO5Pt9KfRDc+lk2JCp0kqL14wEpMGo9x3Q90bFXIRYo0BQxriL/kMk6k+hgkhDUc2DwNtLvahHSoMfXw2y1X099u9W5pcyM3pgFzGV66lmZTpRFT9LhAos0sUIl/ajgBJChFQS8hPM4WJhNJf9F/mo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751600375; c=relaxed/simple;
	bh=FDt34RbEYo0vqpY00U9ijTPtHhHk6iMis9c9F4GmtsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dyePeA7M5gdf6vlqdUuK54WE7zcCKKCqpMkY24Bv8YkOXkeWj1NmuUyI+/euIFeM0SUw6uFoDWQ0mQ0qCRF9CevlMCP7oJ62EikX5o7nSmjQP1xVPGIX3V5TMUVXVVYC6XpO03PblniUgUnZteauzCaBDNonAhFplCxsB4D1tH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KlkkKpA5; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KlkkKpA5"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-70f94fe1e40so18991947b3.1
        for <chrome-platform@lists.linux.dev>; Thu, 03 Jul 2025 20:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751600372; x=1752205172; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDt34RbEYo0vqpY00U9ijTPtHhHk6iMis9c9F4GmtsA=;
        b=KlkkKpA57/7G6K8T0jvoUAJvOLLmTaSino2juCDu5QLNAaldDMN9R/8V53Gl13ll/O
         Tg7aIUUm3F59EU/chScOhbpUT56MBNa2+EqUWyfMHgvcU9mImhd22zBWsvhB2XqCd7A2
         beUfIc2NAK6AfJTy0Kr+yGVNbKH8l9bzIyIuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751600372; x=1752205172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDt34RbEYo0vqpY00U9ijTPtHhHk6iMis9c9F4GmtsA=;
        b=fOqZVkhOCJCNbBEC1BlE+Mmqv93mugA/HLdAaRpGCD0ozqrYk8YEG/5rYpz3jZhJPe
         qCs57pxyNU9y4xZ39KZLwx9VBeEg5WubIg7ao/0PqljH3J968Ku/D8Hnx8qmx0BZijdh
         bFnDI6MFWw5jAG6ezuJu7AXf20dKFRCApyUmN982+VkvOLTAKKNOQa1NxTx+LJZsRi79
         r6P3VGDQU3dAIyTrgs9hW4BmIXHrhIrVtCPBYnSixFkr2F30ktZEDpoKOvYe7MbkbXY4
         sA8QzIPq17006plePryBLAB6BwNJJTKs8cvE5RiTgjeyRl4YB7v7+eKNL1nWLqkaGcld
         SjQA==
X-Forwarded-Encrypted: i=1; AJvYcCU57Rh1T//LdI1tAhMu6PSz7Sz8Z/bkCF0hhmxOG/F8CYkJMYLmgX63CDblWzUCsF9nOmL/5wlMYTaixDXGnj0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRvaWeMKq787Petf2WPe3QmhFo3BkmFOrXBV7PkL15lGVOVmkQ
	LYgAn7V7hEl2EgkZf1k/wwYhvD6B8JFpxwu2NaavPXEGBz0jNhPaRy3mFgos7FeKtLVkve8h6BJ
	Lv9/z0KMtVlFJJiABwJl9Ep7Tg3bdyHh3x9H0Upoa
X-Gm-Gg: ASbGnctTOpVjJS3tSy0SeSW2Nn72ifyK4jl3xAr6Qh/JpqAPQxOg5cUHgAFjdUWoRiv
	Hd4JCGS81z3o5+7fm5+MD79JM7ltp7H+ntvLf33gn2LKt224tK2BeGOHK3zd4bTlSCXEccQHCuI
	1FYraFgnmidmWf+pAwAOD3xIQo9hoNZTGRxh3UxHC2oWnQ
X-Google-Smtp-Source: AGHT+IEpv4/ABsyEPWBaSbnhDaxcTMMoASH0qOMAb1EUBzfvoB9Rs9KL0TsrqeATirMWAbb6GqIiVFu78+U/gU30DoM=
X-Received: by 2002:a05:690c:46c5:b0:712:cc11:aff with SMTP id
 00721157ae682-716672d3d02mr24980587b3.11.1751600372350; Thu, 03 Jul 2025
 20:39:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250703183523.2075276-1-robh@kernel.org> <aGdAmGGPDA71rDE3@google.com>
In-Reply-To: <aGdAmGGPDA71rDE3@google.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Fri, 4 Jul 2025 11:39:05 +0800
X-Gm-Features: Ac12FXx1clDJs40GrPtAnmhl7h9XO9sxxgXTs_ThD6wPGcXtPD9F4XTO-6ZiN-s
Message-ID: <CAFv8NwJcwD0wqJAoe99M+dQYA383n0g9U+5+Z77uuQ2d=Ac5pA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Use of_reserved_mem_region_to_resource() for "memory-region"
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Benson Leung <bleung@chromium.org>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, chrome-platform@lists.linux.dev, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sound-open-firmware@alsa-project.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 10:46=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Thu, Jul 03, 2025 at 01:35:21PM -0500, Rob Herring (Arm) wrote:
> > Use the newly added of_reserved_mem_region_to_resource() function to
> > handle "memory-region" properties.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Thanks for the patch!

Reviewed-by: Cheng-Yi Chiang <cychiang@chromium.org>
