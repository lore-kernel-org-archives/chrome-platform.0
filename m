Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D806553E24
	for <chrome-platform@lists.linux.dev>; Fri, 16 Feb 2024 11:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708083069; cv=none; b=hCyd4N2aZlpgqPLxIEoe0LWYkETVFMIkV4gg1PSjbJbo4Lk9jFs0D5CuPLif3LYKRyusvflRp02qmbAo73MrCabSpZQXS4YPMdkSqTFE4bRH9mLlciVt4R7X3XyukVSD3TzfDQOMJrL+0ydH06ww9+BgLmdif16HhJhw7gsUb/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708083069; c=relaxed/simple;
	bh=TJamkMeETVXAU6QkC7A8Ognn1K46paOc5DcsQ8n28aw=;
	h=Content-Type:Mime-Version:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=XzmrKjQRZOec6rh2gb7oBdGCxZ38GWR2zMLQ2SIde2jwNqNCs8uzNKGNo2Edk3zJdJPcP7KMA1Qu9oc73atmjQ0+hZ9ZS2Odz76Wb9F7oxTarZa3+jVHDEhzc363mvWWEfznw0AFQPsVx1mA4DxtBVfY1h/omUq5R20vyNZimXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRN7g6VV; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRN7g6VV"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a3d484a58f6so243227366b.3
        for <chrome-platform@lists.linux.dev>; Fri, 16 Feb 2024 03:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708083066; x=1708687866; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CeAZhE7j4dRyX+kzFFWa3n1YxsCqKudIIvx3LQHUXoE=;
        b=FRN7g6VVPUnSjOhnoAbAiT88I6OkzR8i11MamGXUhjvtoelHBCW9ewS9kG2QVic942
         gvestoXPNCoU6S435ZQlzg00U9vCypGD8OLUMMjbm6czvWn6Ovsw93a98fZohPvYAUQ2
         fv4l6oUbSYEox5mMXr3Y+EryltHg3hNSfru90lQwAjN8BMZwOFuPjkRrg01MDBMydPYi
         II5c7ZNO03skI9SIX3yha0kH3blUEBKNgaDXVR8KDiZz+5GXx8bXeNWBvf/11pOYbQx5
         Az60xWJt4K0H/MKpDd7sUSq6DVBQ3RkO8/gErcxCRm0konMcQLmCCFsL0k5DJ1i1jIi0
         nfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708083066; x=1708687866;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CeAZhE7j4dRyX+kzFFWa3n1YxsCqKudIIvx3LQHUXoE=;
        b=xR1g4B88oUNJvCQ+neeARZ/1mm24BnClKx62sdrYw4kT82aNAStEoLeOGMfr/RSH3k
         peINOWW8jsoQX13eIEBWnlJzU8n1a9mMFCqzhwrTQjjG2rPf7aRr+D5szGfbYI+lCNHk
         T9toegXPS68/XjEw08Y8AnxdVULvyXVR4ucH9IYIE8P6InNXXXncGJBWfWVnybkM6xGl
         RrJFA8N9lectuBx4jq26/qbQhTAfrbO5DUQ1MUh4vbmRxPvPswD9Qb0rJXuYfsvOB82C
         PFfxhVi6Gtb87Id92oyzN5L7jsfDbks8WC+3eE8P2LhtwhWbF9JnTz980rB0xkpweg8j
         zMjA==
X-Forwarded-Encrypted: i=1; AJvYcCWgWPFOPbfZQ4A0GOj92FkyiWuLgTUJtomNhgH7Sqf4dJURBxCAM7BFefhkduoUu57fuS12NAnksIiCvXu0+wjivyNNH+OXHr2364pCtEoj
X-Gm-Message-State: AOJu0YwevSu0IDTaex/Yoz0bPwVFqND6PWpWW98moB28ydj+qShAUQv0
	Tt4/wFOfDRfbMAHm6kQmqVPMY+Mk+m/b6Igw4gr7RgbBOOYgEDZS
X-Google-Smtp-Source: AGHT+IGXWz97gD5gN+VSAVL7iY1zPTDMUokWZgtmUOJLcJDV64j1IaqQ0abnS0651OrxU9XfbwlwlQ==
X-Received: by 2002:a17:906:11cc:b0:a3d:2cd0:c17a with SMTP id o12-20020a17090611cc00b00a3d2cd0c17amr3351354eja.58.1708083065855;
        Fri, 16 Feb 2024 03:31:05 -0800 (PST)
Received: from localhost (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ts4-20020a170907c5c400b00a3df003b6a9sm242282ejc.119.2024.02.16.03.31.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 03:31:05 -0800 (PST)
Content-Type: multipart/signed;
 boundary=b7223a00e4ef0df93c47d9276017bbb483a03ab38a891db7b003e5591ffa;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Date: Fri, 16 Feb 2024 12:31:03 +0100
Message-Id: <CZ6GWUQ73SSL.6HP29PU9Q7R@gmail.com>
To: "Mark Hasemeyer" <markhas@chromium.org>, "LKML"
 <linux-kernel@vger.kernel.org>
Cc: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Sudeep
 Holla" <sudeep.holla@arm.com>, "Andy Shevchenko"
 <andriy.shevchenko@intel.com>, "Raul Rangel" <rrangel@chromium.org>,
 "Tzung-Bi Shih" <tzungbi@kernel.org>, "AKASHI Takahiro"
 <takahiro.akashi@linaro.org>, "Alexandre TORGUE" <alexandre.torgue@st.com>,
 "Alim Akhtar" <alim.akhtar@samsung.com>, "Andre Przywara"
 <andre.przywara@arm.com>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>, "Baoquan He"
 <bhe@redhat.com>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Benson Leung"
 <bleung@chromium.org>, "Bhanu Prakash Maiya" <bhanumaiya@chromium.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Chen-Yu Tsai"
 <wenst@chromium.org>, "Conor Dooley" <conor+dt@kernel.org>, "Daniel Scally"
 <djrscally@gmail.com>, "David Gow" <davidgow@google.com>, "Enric Balletbo i
 Serra" <eballetbo@gmail.com>, "Frank Rowand" <frowand.list@gmail.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Guenter Roeck"
 <groeck@chromium.org>, "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
 "Heiko Stuebner" <heiko@sntech.de>, "Jonathan Hunter"
 <jonathanh@nvidia.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Lee Jones" <lee@kernel.org>, "Len
 Brown" <lenb@kernel.org>, "Linus Walleij" <linus.walleij@linaro.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Mark Brown"
 <broonie@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Michal
 Simek" <michal.simek@amd.com>, "Mika Westerberg"
 <mika.westerberg@linux.intel.com>, "Nick Hawkins" <nick.hawkins@hpe.com>,
 "Prashant Malani" <pmalani@chromium.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Rob Barnes" <robbarnes@google.com>, "Rob Herring"
 <robh+dt@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Stephen Boyd" <swboyd@chromium.org>, "Takashi Iwai" <tiwai@suse.de>, "Tony
 Lindgren" <tony@atomide.com>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, "Wolfram Sang" <wsa@kernel.org>,
 <chrome-platform@lists.linux.dev>, <cros-qcom-dts-watchers@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v3 00/24] Improve IRQ wake capability reporting and
 update the cros_ec driver to use it
From: "Thierry Reding" <thierry.reding@gmail.com>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20231226192149.1830592-1-markhas@chromium.org>
In-Reply-To: <20231226192149.1830592-1-markhas@chromium.org>

--b7223a00e4ef0df93c47d9276017bbb483a03ab38a891db7b003e5591ffa
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Dec 26, 2023 at 8:21 PM CET, Mark Hasemeyer wrote:
> Currently the cros_ec driver assumes that its associated interrupt is
> wake capable. This is an incorrect assumption as some Chromebooks use a
> separate wake pin, while others overload the interrupt for wake and IO.
> This patch train updates the driver to query the underlying ACPI/DT data
> to determine whether or not the IRQ should be enabled for wake.
>
> Both the device tree and ACPI systems have methods for reporting IRQ
> wake capability. In device tree based systems, a node can advertise
> itself as a 'wakeup-source'. In ACPI based systems, GpioInt and
> Interrupt resource descriptors can use the 'SharedAndWake' or
> 'ExclusiveAndWake' share types.
>
> Some logic is added to the platform, ACPI, and DT subsystems to more
> easily pipe wakeirq information up to the driver.
>
> Changes in v3:
> -Rebase on linux-next
> -See each patch for patch specific changes
>
> Changes in v2:
> -Rebase on linux-next
> -Add cover letter
> -See each patch for patch specific changes
>
> Mark Hasemeyer (24):
[...]
>   ARM: dts: tegra: Enable cros-ec-spi as wake source
[...]
>   arm64: dts: tegra: Enable cros-ec-spi as wake source
[...]

Both patches applied, thanks.

Thierry

--b7223a00e4ef0df93c47d9276017bbb483a03ab38a891db7b003e5591ffa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXPR3kACgkQ3SOs138+
s6FXyA//QEgOaLPJMLtFwzEUNlO0/8MF3SAbMW7kCkEt3S3OMXQ3wtyOeIC3nlyN
zwxSqhOzC1I/qdbqdnc5ejbrPWB/9d6ohPyc45vT19QAS79mc9nB2ZQm3AoVlPaA
HGQhrtMEx6KRBu+GjS9Sz9YQjBftSWl/kr8oAwXOs6wtg2m06tfm00LF3bVFLQEu
aTZ1Jal4+fIpK0OK/yz/yhczCMQCbVnKBClkwuoKQWJpxh7z/xYCY2Gm50VD4sN7
F60KcEQzW8DfY5dGd1eT9oY7UqqA+yoRDGNN7KNYYurFPoEL6jZqvSts1J26pp4u
MjFQS2jY6bjbQFR0RRUwwjPRRmUXRcGpW3qHN/+ajof0pXgRa/rWnthIB2boTs4Q
uApu3k81kwLXVgZZh9YRXCwcYf8sgMo7Qj849I8e5vRi/MuL6jwKyU7P8SwRrWRd
xIY0v+EKupY6iDvxPApV4b5Mw8gyxbRO6Kcm5Ep7Z8DBCeCr+g3iZFHVUXpG3vll
PjwZW9bC+U9kcn/W5qoJrdKqGFAsaqks7fzWoIBIX5rVNbNSNZpG7Dwi/EeNUmak
T5tJqIr3VbtsNd0ni6f42Efs9z/m0vsUKL6H5mGZoX3oTGXvzO91XF2gfFMEqOO9
8cxE1rJREy1F73S7VZWOE46nyNPlsD6qm5+fApxvV3eKGRO5wfU=
=fOyD
-----END PGP SIGNATURE-----

--b7223a00e4ef0df93c47d9276017bbb483a03ab38a891db7b003e5591ffa--
