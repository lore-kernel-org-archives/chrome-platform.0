Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795416165;
	b=pQ5F8ra6idMfNENwfZ4sioaRQx8mWMzk4xMANWdXrmiDPYBOgC0D0yvagXKBdM/nYR91
	 X2wxN18aesv3vB3JTGX6CikBJMXUS81InnF+gIhZnZGU2s95PDi/UsdCZKxTaxiDCeN+8
	 Sx3oQIUgK30A2HLi2lU8g942yDylmxwYNBoDTVp9lHUZGmQCpwdg0noyxsWVP2Wm3s03y
	 hkISMz9D3Keiz05Vg2/J8CVb8sDLeBTBc5GVeSuxbJPYo2jAWEglSv79flb0Koo+nVgv5
	 cyRNgiUWGuPQna26jXwj4dCNeQ1dfrWim8eowlVRG4+6s9U3HAJLKLStnMETOgZIBBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=naTtgcRj/MertQfpVKpr5lkSMEaf2WtEA0kcdQKCaus=;
	b=3My0liJhQ/b7RX7oRIQhjcgH0w0vu/Cw3AniwCsYuAVzT2GENORPIM7HMMnPNEKhMZT5
	 iehNhocwSDuD3T1+Yah1jzqN7gIdGake2Z4ZxB91tUPm605Awfyh2OTKT8yTWDRedZ1OL
	 m5IIg/R5HVATVzl5jIeV2WEvPgfRE5FVztJa/uNLHl1kron4UZE6SyKM9M5cWXxg6Yypm
	 gGgwzJ+sMSYKBazi7kgQpxeMNPIbVRdD1BgA2YrBHfgRGehCRJLvtORWmrSIb1I1bZTqj
	 RTAnq87gzOD0snjrbi1vtQ/eYBZZeCdfKoNmVP6QI4xqRkeTK24cy32A4PnUJL2WCow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gz3siUq+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0A4606A321
	for <chrome-platform@lists.linux.dev>; Mon, 23 Nov 2026 06:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF0A4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gz3siUq+
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b0d126f631so22831147b3.2
        for <chrome-platform@lists.linux.dev>; Sun, 22 Nov 2026 22:42:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795416164; cv=none;
        d=google.com; s=arc-20260327;
        b=HuUXAFLUdd5CEpPIUqqL8nXyQJnWCvk7ADRR3s9YN1uZyCcW8wkZXf8oWM/naE40Fs
         ns+9W1Cb0sA//2rKV//2XSMzmenKjGgDB64k1WKjZsdD4XfrYclx+inreqou2Nz0Z58f
         5sSTeujfR5kI+7MPkFRtuyk7NXXUhHtGYNUwHlGJ9pjd6Wlsi+ljwNnyu68QtmrKyTw+
         Al45XsRUfsd/lZOT7NFOkEIZeKBwd9L+OjFYyGxkmlNRpNsN5YknjgfJbJRnxbb2GUNz
         pgwBIs/1fQ6WfA9Q1vZXATWs1bvhWoHq2VciZcYZwHKpf7PNVybnCi1npgRRgGSvAWA2
         4ByQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=naTtgcRj/MertQfpVKpr5lkSMEaf2WtEA0kcdQKCaus=;
        fh=AaDNSPXLvAU0viyAckMoGAfxXmhXx5+UlCROzXBdl/c=;
        b=My8v7nEGjmOneVWIeDm+neSpXvDSfvY3hkqMYParIcA3XjEkpoTfNTdVcI7nRNSlwX
         +QGR2pL4L874sUaVT/F+4Xaa/IlmttJXPNpShVuPobIURAZ3Rdhl5/x2b78FBXINBwjy
         xluP8yz78Us2t1MmiygTO3mFPznPAzTLM8ClnRrwcGPBUcV1HhHMjvh9scrz1S+TkTlM
         wXAL0jT1IK5hsW12VC17UBRuNVkk8RRYLn16rFbfJMf39LtzrGYxIxPRm+m2gsw7UxGq
         VGMAvkfG+KhGkdnbSDb2KXPSKoeqOJGil+608aTX1jCKaSFFdmowVuLlbHxI8rLes9Hz
         XeFg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795416164; x=1796020964; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=naTtgcRj/MertQfpVKpr5lkSMEaf2WtEA0kcdQKCaus=;
        b=gz3siUq+/hDVvp+YL0DOn2IhCFYCEUSKVa3Y0E1LNqSE9020vMe+OtfsVVvXEpdFk6
         KFD/n7erVQ9I0BaoiTStX60MHgD4ApJCkT+5z4JTAIDnBmcd0Ja9/48FNySdlQHmzFEP
         KlSzSYXMUJ85VqtxeUJeTJRiwqRTeXTq3r3Vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795416164; x=1796020964;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=naTtgcRj/MertQfpVKpr5lkSMEaf2WtEA0kcdQKCaus=;
        b=g45WLwzDX40j0HZ6llFJOCWFofFn15CUw9FCo3iq57ZaRoiOmAPRLDibGUl3AJ3/+E
         i/wTWrCEi5fGyZuvxTeY8YTajbg8GiVTFhw+znAPolO+oe+mjKh9Cgx2WsFF4YDlgoT5
         m0ZWFkOvWytDVE7YnyDqbLhd3WS/HQZ3A0pXUdFhdJOLroqR2DTv5VkBPTpd4PcnTTGN
         EnBQvuAuo8lsvxYA/utAgo5SOVrv8H2ChsWq2gXTMVVz4OQ9c3gWEGwVrI/Vm22Mt/76
         MF0RUDEgRYOFMnPppvSsf/iqC7qzyhHuZk0BnWokjn6KGY6MKy1MyU4uwJxDQzOXdqoc
         eRAg==
X-Forwarded-Encrypted: i=1; AL+hErGRNM/1Pz21zM+CSLm19G2KJxbSWYvJN6YDX6EFeem7nrZQFIpccjjU8+LFLTh+sQxSyOIyFcLXDMUr0UtE4WY=@lists.linux.dev
X-Gm-Message-State: APuU4Z+izLXCgeIqwFR+MyCsVQoDt23u3t8uTMf0a1sErVeEsV9h1qx1
	Nz9mPBT8C4j9PAXo0tVakqHfS3rWa9gWTqW0LozPizfjQaRSdo6N3ZmoteNq1IRpJInuKSTU1RS
	FyZJVM7LAuOcRH/lVIlaEPdVMaVJUXGsQjz7Jm8aX
X-Gm-Gg: AZFdTZezTUz/x9502h7aXOxyJStlp2EdqRj0AgZKVSNbgbU9vt+CjUm0A3Fvb/Pc4l0
	HDi5qON/m2zRLUO2jVVwbggUvrAgnYcu2GJ/AE46wEd7S2XdWd7M52iviXHp+7ptQO9w3P+YHjP
	o6te/6WYPnCaYOEscJ88E7xg8amjIz8GIXJg8ezXIHrHZINjSFCh7JIPiMowDY8CGAaFjEsHUUc
	kHwj+ElmTU/IKt8DMYgClEJbAWZWFcc3/E11sYPTls24dVqQGlkFVbyPJCsdyDZ9d5oVkGlI6JT
	BqUPYqK2dp1KVjD+T5cHJgTcXOdMtar30Mm4ZlK2W2lfNbrMrX6lHqqLIGmOOkxkGjc9kB5GmLF
	nX3ffzpNQfhOB0DO6CRBVu6suF8/N936kXEP9LrQzynZAAGL6AfEwc4yScq3wO3UGb9E=
X-Received: by 2002:a05:690c:9c02:b0:8b2:bb94:8cb2 with SMTP id
 00721157ae682-8b5204ac257mr41593057b3.35.1795416164019; Sun, 22 Nov 2026
 22:42:44 -0800 (PST)
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103043734.2179858-1-wenst@chromium.org> <20261103043734.2179858-5-wenst@chromium.org>
 <avLw2AiqcnO9Blun@shikoro>
In-Reply-To: <avLw2AiqcnO9Blun@shikoro>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 Nov 2026 14:42:31 +0800
X-Gm-Features: Aa3M54qFQQaP0XRNtPCyFnaJIa2pdaKUHFg7uIqYmbd3iYo_i21tDqRJOm5IHRA
Message-ID: <CAGXv+5F5hf_8U6j6tJ1WcS6gUCiA82ny+6DXPv12g=vUjwYUhw@mail.gmail.com>
Subject: Re: [PATCH v7 4/8] i2c: of-prober: skip post-power-on delay if
 powered on sufficiently long
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Tue, Nov 10, 2026 at 6:24=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Tue, Nov 03, 2026 at 12:37:28PM +0800, Chen-Yu Tsai wrote:
> > On some devices the I2C component is powered from an always-on power
> > rail, or the power rail has been left on by either POR defaults or
> > the bootloader. By the time the prober probes the device, the device
> > most certainly has finished initializing and can respond. There is no
> > need for the delay.
> >
> > In such designs, the system integrators tend to work around the delay
> > to avoid the boot time penalty by simply omitting it from the device
> > tree and the component prober. This is undesired, as the device tree
> > is not fully describing the hardware.
> >
> > Switch to the new regulator_enable_and_wait() function that makes sure
> > a certain amount of time has passed since the regulator supply was
> > actually enabled.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> @Andi: Chen-Yu is the maintainer of the of-prober, so I suggest these
> changes just go in together with this series.

For this series, you'll need to first merge in a tag from Mark's tree:

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git
    tags/regulator-enable-wait

This tag provides the new regulator_enable_and_wait() function this patch
depends on.


Thanks
ChenYu
