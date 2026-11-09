Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794202894;
	b=X4L0oC9jhbXSIo5VnH7cG5nnkYmBi30gOYvfhjMxpiglCHxpGRI8Kz+FGK4m9wFtCzmN
	 HtC2icKjrUeGRL0dHTYHeYPBOpCxAv3CrQabGx0r51/EXJ3dFmz0INSM2NowJ6G8iSlug
	 mKuqwGSy5xtTngCPjs5WK0xmtn2HqV0SsP6Gd7OYFeXoKf+UnboK7WlFJX4M0/o3ONSG/
	 uO1JpPvFU6j0ZImL4kgm5bgCAQD+8nMwF6HsD1/lVNg1s5PH6+ZRZ34Fr4+XqBy5IRNyL
	 iJkRLdLraXKpYhKEQ4VIkkpGzuBmIaUyA4i5jgXqEFalHDdcOWgv6AwGxhJaqjNO/oQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TrI0GbzOqH9Y+vNRVIA18oJVEvnOoZMEzsKGzGyq4VY=;
	b=CQIEJ8UPzmg0y399Vz7poUfpJs1uPQz9XItzI9UP3PkgM38wxx97+TdniuO4w/SYSQV3
	 IzysWzL6KfQQfwZiJh/Rb/SsGIkpBsDBqgM6irkWMzzuV+0iMYnDif1LujfHuuF3Hjun2
	 PxdljhCcHOoixVZVIeGx82w0ikvdteqJ9Gaz6bl3R27nGIKBO0gH6aRj2AzqqCimVCTmO
	 gOb6Jm289tq0kDxzVZ/c/L1gNapSCl+vGpOY+omaZTY4Bm/rEMa+iJw2A6S2X7VoSskYc
	 MqiafcH6VTJ+xWpkGK9jCSsNgI02SHiEPPPN6YyjsGmfeurZ8D0g82uRxmMG43ZzAnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F1N8p4NK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF43606A31C
	for <chrome-platform@lists.linux.dev>; Mon,  9 Nov 2026 05:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACF43606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F1N8p4NK
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-679334baa1fso540009d50.2
        for <chrome-platform@lists.linux.dev>; Sun, 08 Nov 2026 21:41:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794202893; cv=none;
        d=google.com; s=arc-20260327;
        b=Kosey6Hqq9d2NlrJZFaMQ83kYLFMd/Wl926rYFZEhX12MSBCtVFbEG+iqksXO/+oR/
         iiJJK7KypCYrhP1+CSc968eiIxrHnXoYY0R9y5QRXFBV28W7+d+3/IK87KBZcHti+6wo
         JGeDtmfMLCL/OgPFGo041deoYDFTqNYgX+WxlxkKzTC0CgQI+PvT4dkqr1GGJruWMRw8
         V+Dw/xrg9WLsI5k2Hm4UbKd64LqufZjS7mBZzU8ko/w7FVBLxxg9AYK/hUAP4ecrfv19
         qQw/JGvyj2UB5jTcxEikHjG3ypkZdBQQ01sbaHczm8l6iZt1I3PuL/EyIWKU9zkRiDQg
         Kyxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TrI0GbzOqH9Y+vNRVIA18oJVEvnOoZMEzsKGzGyq4VY=;
        fh=hRxCqBo1SJiGxXDU/orxE3VyLI1dvE9FYIgcBr06UEo=;
        b=eJ2xhBEVJcF+baLSafrRhPpYTMkW02buxr9pI3FrTeoEVsqhQIWiF2KZtjJkf/58Zq
         /cKuadvv4scM27A2wzaNUU+DHrketfVulpXG5Bn1CCx49mP0grTZlOuiUpnwBTw4fY4f
         5/NIZbL6ZbNlqf5Io2OYneZHrSDFnYd2U8iDp04f0vV5tYmPPc02+PptcYyCbIcAdBlz
         0tXWK31TJ3POX9mCSZ8O7VvQKUMoxnLa6LS+eBSpgfeH31fFL7NK34U/OSAaJWbrpm7+
         n51ICviw44gCOP45o4pXWfkjM5v2KWe5S5ZhmvDmvBKODxt9EB06ldyNQHEDzGDkxZCA
         viNQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794202893; x=1794807693; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TrI0GbzOqH9Y+vNRVIA18oJVEvnOoZMEzsKGzGyq4VY=;
        b=F1N8p4NKsZvf/uj1oRoZfRhpB3Il1OP2D8Fz4sU1pvPZe1a/3577giQQ1o6yf1Axe4
         0/2kqRShU3DsxVsLG6J6YrrRQeBCW4W2RnWPodUwYmxVx5PdHPrjcPHpbrSSCFN8WtLQ
         5ObUFOShMfZ+lfXjxEvBl7Vrfene9RRSiBYvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794202893; x=1794807693;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TrI0GbzOqH9Y+vNRVIA18oJVEvnOoZMEzsKGzGyq4VY=;
        b=YP7q7MA6SIwV+u3ymKVANPr3LvhM1Ax7KGgMzyEFMl8svOVR7X1PFiUE5dTbgo1GKl
         xi76KNWvJQpXqlTf8V8nldnb1Vmcm/Ny5CR5L1eqL8FSk9n/IW6RnjXy8qrIuw5O+M9h
         RokXW6CsHe8V6af9NJJBVnCR2NIt+ZfMTZEzIIeFlF3dHurXxvlUD6jqumbQo4VckZgg
         77MjBkXCRoGocklScp6PpCBgOnocvA+Rs/cuAiwjzMavGL31ocTVwbZBgNnv3F5j25pO
         Cb5iASIfOiBzhjdRwu6lK4Hz3nXh5fdCEt+PFd8H/fgLKR6fALeho51WG79PoiYEampX
         mzAg==
X-Forwarded-Encrypted: i=1; AL+hErFkkmE4qfOSK99SmEkRs/uWfGr4XRqOAa4TZugAKrT4KAGpDnDFGdkcW+oc5vFWOPDosgkO+U8diDIn+J5gx5c=@lists.linux.dev
X-Gm-Message-State: APuU4Z+kn0diAmfZsZZ/hbPdeOzmZ2ifN0hpB0P00gMMzR6bBcNJyaL4
	D+sQgEYDGSlv+jDRmPEi2S+7XXMHR3J3O1bS+h3hY1OUa91IcglbsBcYFeUxV4S+LumC1fMMxMP
	RsQRWa3Db/mcL/4tw/6tW+Qg0nR2nGkqJHT/2QaIQ
X-Gm-Gg: AYBFou1nYGh3t1y87uAuhbN1HKE/5hcn73F9ktffP+c1ebBVk4fSjbHRBMJcKSFXu8i
	hoEHCYTjyWRKv7rpPTe+2Ei8+08NFmlmNDlB3UERdnMQcym97qEGz2uxFxFHg98AE299tz46j63
	KBzTDTiow68kYImRWPbkdjpJvvLKRzSJ4hioKcoW+xHxQypZbJMY9reSM+sidDrtt7Ku/zUO7hZ
	nI8TXj3xkzRW7vXNvoGyIv08hB5C096wqE9tL+N44bjZwY2hZfgLLyokDMFqH54Og7YXuELPEFu
	eYE//FYWHt/0u9QKOGdcDN4Ss6MKjt3ROPXrFpFabK14Inu5wGyHwx3SAwaVG0UTG9hQWIonCZq
	9SYULAuS0KrTgH+9b6qENXkoQ2acsqknAehLa1A==
X-Received: by 2002:a05:690e:4393:b0:67c:10d:e377 with SMTP id
 956f58d0204a3-67c3d97b42cmr874807d50.24.1794202892850; Sun, 08 Nov 2026
 21:41:32 -0800 (PST)
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103043734.2179858-1-wenst@chromium.org> <179406980914.3424803.6201831446824678583.b4-ty@b4>
In-Reply-To: <179406980914.3424803.6201831446824678583.b4-ty@b4>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Nov 2026 14:41:21 +0900
X-Gm-Features: AclHuK9Uis4PjHZvlrrahSmg0-iKCJazl9kKs9oybOBLW0q8BipFSNFJ0jiQ-bQ
Message-ID: <CAGXv+5G1SozUuj8v64oD07wz6dFbY+bXh-Q3OVvieY7v41ZJ8A@mail.gmail.com>
Subject: Re: (subset) [PATCH v7 0/8] arm64: mediatek: Chromebook trackpad
 supply fixes
To: Mark Brown <broonie@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 7:25=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Tue, 03 Nov 2026 12:37:24 +0800, Chen-Yu Tsai wrote:
> > arm64: mediatek: Chromebook trackpad supply fixes
> >
> > Hi everyone,
> >
> > This is v7 of my Chromebook trackpad supply fixes and optimization
> > series.
> >
> > [...]
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git =
for-7.5
>
> Thanks!
>
> [1/8] regulator: core: Add "enable and wait" functions
>       https://git.kernel.org/broonie/regulator/c/9f9bcca6adc3

Thanks! Though I was wondering if we could get an immutable branch
or tag for the commit, as three other patches for separate subsystems
use the new function.


Thanks
ChenYu

> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>
> Thanks,
> Mark
>
