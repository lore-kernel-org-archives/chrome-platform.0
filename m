Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD703B4EB2
	for <chrome-platform@lists.linux.dev>; Thu,  9 Jul 2026 19:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625765; cv=none; b=oiWAr412n/T1J1eel1OYbDspHo7i/aXvoMbywxGoI85CwI3BEc5xNsmXy8ql31RPaK1zT2iTLBUuaXHh95wQcuam+3cgkOa6uP4u0FRNo9KVxqNWz0BWH+CEyfwqx8QZbSwBkfx6/PFCCJ6ZVv3WFPoEKHDHQpgaGRH3/Y/JgbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625765; c=relaxed/simple;
	bh=dly2a8f3IW/oWjPBuL8fZv6s8UgI5PKrdR1UMnyqqeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GOz9JTsNgvdXydef9ZHak9meI65hIvH4dKXksMmGGqWBc6DBk0O44SSE61NTFA/jmeeETBcRg7x5/MdPJDADa1M8CejxcXISrItCKw0SKNlW1EJFYRKE0Ven6JcLRGuQMuerxnu8Bl9MxWXJZDNESVOp/CZhtDGUnQd5mJ2l/6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i8q+Jr2o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i8q+Jr2o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089CD1F00A3A
	for <chrome-platform@lists.linux.dev>; Thu,  9 Jul 2026 19:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783625764;
	bh=dly2a8f3IW/oWjPBuL8fZv6s8UgI5PKrdR1UMnyqqeQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=i8q+Jr2oLcdULQBrmuesody31HxF1nJz5bSx0ZDJh95xbWIg0fV/ibc1kqMHdT+6J
	 KYH7vUp/Ydb4+0gLZ8H8fA1v6PIiQ8/HV33019e/WMXJCKNOpZt7NrGupuceOrIXK0
	 5uEetFiXybR5uOwb1UB+OTn16d7D5ZLxacjOzMn2Wh7zo39PY7t1qyDy/VbPYVfPMf
	 fbS9DDdchzR8Bv0ewBX+wy1cmRcruZBJfz+iy+xENZ7vPJoML8UMZWzpeVGsk7YFbZ
	 A+acBD+5H/KhFa5hx3nuWEXN+9HC7xVf6yBXG0SprqIMFoFjr3MzdFQ8xgIRlgyHpM
	 K7mSS0IGkd7jg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b00ca000ceso156891e87.0
        for <chrome-platform@lists.linux.dev>; Thu, 09 Jul 2026 12:36:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpxgqxDZyhfp6rp1Rh3AOwBGyGZeHogXVTEY/6cb9ZvtQjyA2O/mqtfQvVd79xpAgaTa3yPBmNmhnG/tZEj3zM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyn1xqNzMmytFvuv3bSgw6Plca4TAnrXXOyyRWvPI60kEmW3m5Z
	Ji/cvkv7w6QfPj84fz8Pzi/1GX90k1kRQuGuyR/c+LXW6SKktMtaAhwcU9CyBCyC78ma5vTIFf4
	6YeqwMjsoL40IB4V8Aj9q8I9Yd1VnRJw=
X-Received: by 2002:a05:6512:4287:b0:5ae:befc:97ac with SMTP id
 2adb3069b0e04-5b01147358bmr1837128e87.55.1783625762855; Thu, 09 Jul 2026
 12:36:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com> <1bc763b0de24d50e83972b5f0dd31ae52dc558b0.1783507945.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <1bc763b0de24d50e83972b5f0dd31ae52dc558b0.1783507945.git.u.kleine-koenig@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Jul 2026 21:35:49 +0200
X-Gmail-Original-Message-ID: <CAD++jL=5A+qcU4FQYzBPOVK8t+9xPRX5p9ycijkwOa4Oh1XJcQ@mail.gmail.com>
X-Gm-Features: AUfX_mwiwakv_8MfFTK61QSlgw1o70cNyg-w0pnD1Pyj-FexX_pcKllaNbNT9oU
Message-ID: <CAD++jL=5A+qcU4FQYzBPOVK8t+9xPRX5p9ycijkwOa4Oh1XJcQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/23] mfd: Use named initializers for
 platform_device_id array
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 1:17=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capable H=
ub)
<u.kleine-koenig@baylibre.com> wrote:

> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
>
> The mentioned robustness is relevant for a planned change to struct
> platform_device_id that replaces .driver_data by an anonymous union.
>
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
>
> Also drop a tailing comma after a list terminator to match the common
> style for these device-id arrays.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
