Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDDB3B14C4
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jul 2026 08:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783324864; cv=none; b=XXvZPHS4yqnZpGkN5UFy1vuVNlRQEY+W+r7r540taIKRgMZ+xBhHQU0Y5IOOe3P15ENlI9wZwD0OVax+RpnXvq9EDKqtmNjPEnaYlGbrmsuWEihoCP/HBS5FRHSXNjcvQ2TNohYk+K6mfin47QxMoPu26sHFZ8xdBFv4vZ3M14s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783324864; c=relaxed/simple;
	bh=6FRXXocn1lfRgJnxiPkpYYSBB5w4wnBEBhNnIuipX2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tp2KP7b/YY+62Lq3sWxYsGTylHCl6+BBxOFZFMVsiGCpKsz0ASJT71Rww+/yOzZ7hE81SrvQvRkkpL432rlEpZotp/OeT99utftJwwgONzzRg3iZOBga7pWu1QF/9K3gHaBzfp9ym1En4GO6EiZUpxH6tp+VhyZW/2AHYY9Uiks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-59ebb89109aso2130385e0c.1
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 01:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783324856; x=1783929656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xlcdnSGCAGaaD3Qtz41jPpd7wkV1TEYjW94sOKYd3zY=;
        b=FYpzLHTGnXqGjAwRzN8TexIy7tblTzLGVNKe0g9t745q7y+7YUEj5RDS47HiOuvTkP
         Q83skIdPITRHaHdIYJdoAVIRDk3sBRcD11JMdUes9h9G2YMmF1d0I7rygj8dcwzIsB4Z
         7qenOQH8B5BJ9YP7WvCPjSNorrmkoLDsRz0jVWTViooplJmppFGh2iUdtsEpZJioskWE
         L3rhSvUuhqTcGNopeGDnNA/UUXcQyXYC4HBzV4ezgIYDgKTgjrcdpzyBcE7cVM4WV7Lm
         ZnWROaQXtRZUuDv7/7aWDV7CSCxv+g0i1q1YreNXB7gFDuo8uTBvRJPB5LOcRItGHu17
         HBbw==
X-Forwarded-Encrypted: i=1; AHgh+RoE/zDcA6kIeAgxK4/YUC8J3kg0AnTohYxe+9SJ/DaMCCFER7Chn+WJRdtWcuZXRBZNfPHgtnx4S/GYlN+8rAE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+aVoDOiZ9UKTy1lCpsBP1lFg1khDRCbPtt4uHaBQahlpqHX1S
	TCJ7OgvRxg4FH/kOHrqwrxK+lOiO9bXygzdO+itIuJvcaW5LngL2I9NCRS3AeAz6
X-Gm-Gg: AfdE7cnl4HY8/GjeY9PTIgZF74fkNtcUfszw7QRV8ZrpFP5OGF+lSdywVKe6yqacBQi
	OkGQ0Yrnclt2y/OSl3+B6vHRRxm7gjY+3HPl0dV8xWLC3JTFq72K/mp2H3VG/bztkyG7J0Pnpvs
	CpQE7OAimC0nNyb/APdjwfhd2OsUaVuo3FaaE/K4xArHI7Oxo1x93yp2HTTFXuNfAw9cjdcytqa
	cU3RZeWdV6AuMOGmdXizkvbI12SUueJA87FSquaVJ47XsembQGorGI7lCxVKVWHBjebtiog2kJq
	FOJ6749W2Um0MuOLBDKXUUlJ68Xm6Lkz4nbIil+EYVWdyIYp5vpBr1378JbVPBcvpv8IBs897I9
	y2yPwYQcFuQtgg+APqEiiUKdRSJecAzQCgtyS8FYdLQMhuMJ/XGe45tLQ8w8pUhIpD4oeYkb6lv
	ID6LiNXo6LpoNard0pFlO22HYYB4Rua9v3lj2Xpw7MeBQsDcacHA==
X-Received: by 2002:a05:6122:e184:b0:59b:396b:cea7 with SMTP id 71dfb90a1353d-5be102a320fmr3292873e0c.9.1783324855763;
        Mon, 06 Jul 2026 01:00:55 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5be0299616fsm4433803e0c.6.2026.07.06.01.00.55
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:00:55 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-73a442f7cd3so2201360137.3
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 01:00:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RplSv4AR1eTItwhpGO73SIeGa2IKQZEcl2Wdf0ZxprcGZCOOkxqIGm2zTnz3Qrewkb1mBTTE3hQP+l1d67HpWk=@lists.linux.dev
X-Received: by 2002:a05:6102:800d:b0:722:826e:1423 with SMTP id
 ada2fe7eead31-7427f0478a0mr3286706137.20.1783324855096; Mon, 06 Jul 2026
 01:00:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1783263835.git.ukleinek@kernel.org> <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
In-Reply-To: <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Jul 2026 10:00:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKyFJ20N6qKafvMZ_0sVj5+XTxcod_6wGkwTsokn7dvw@mail.gmail.com>
X-Gm-Features: AVVi8CfQACxAMot5VlqKHI6FXvkOZpEWhTZp1dlkgWSruFHOk1f-I-dS5kVo31s
Message-ID: <CAMuHMdXKyFJ20N6qKafvMZ_0sVj5+XTxcod_6wGkwTsokn7dvw@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: linux-pwm@vger.kernel.org, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Michael Walle <mwalle@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
	Inochi Amaoto <inochiama@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Hammer Hsieh <hammerh0314@gmail.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Alexey Charkov <alchark@gmail.com>, 
	Sean Anderson <sean.anderson@linux.dev>, Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 5 Jul 2026 at 17:14, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
>  - Use a single space in a of_device_id array terminator; A single space
>    after the opening { and before the closing } in non-empty
>    initializers;
>  - No comma after an array terminator;
>  - Also no trailing comma after a named initializer iff the
>    closing } is on the same line;
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

>  drivers/pwm/pwm-rcar.c            |  4 ++--
>  drivers/pwm/pwm-renesas-tpu.c     | 10 +++++-----
>  drivers/pwm/pwm-rzg2l-gpt.c       |  2 +-

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
