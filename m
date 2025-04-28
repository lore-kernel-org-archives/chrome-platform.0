Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3079F2973CC
	for <chrome-platform@lists.linux.dev>; Mon, 28 Apr 2025 19:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745869139; cv=none; b=VPMXTHdEPZFu/jnIqeYz3XlmNX89xVq4KzY0kRpO916Ne2PDwNM7XQ7nvXDkz0A4ay3hYYQZABaRITt1PaytrX1omCdwzQrh/ZaJgiSqw5mTLAtfMfNE4b74ufkRUQ60/VkVA8pnC21+miRl6Kt9QN+c1esvhOySfk+LwvCL+xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745869139; c=relaxed/simple;
	bh=13xUiVobxzRSH7gXywjwaNcP6SoEC7CZkLAaSA9kBcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtBSpwhlyHZZ7x8Nv37S0GUcwju5FtjeLBq1EV653D6lafjTfvz0C1QC5BIqqqZzIVIxUYNaNpB6lFPbK13K6taAP7guCXhhjml+/eih6QqCYKRZP8AqnSn6oif7hwyCUdpfvxFe5aj19F8mmjGme2BJUCbZ4bga5NY+ebqASZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NoKLPCPD; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NoKLPCPD"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-73972a54919so4409045b3a.3
        for <chrome-platform@lists.linux.dev>; Mon, 28 Apr 2025 12:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745869137; x=1746473937; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=14iGLLoPFCaZQPh6Psc3FLMwpAjwEZFNk7aZejXSCSk=;
        b=NoKLPCPDV78uhh86HjIWLDjVnf+zS597LtOdXNoeFidWR9fpktPu1/N2Ocr7uE0RA4
         kbMEImrisCwZC0UzrS/e6L8Fkcr38RT04bo5Vmewb8qDV92Wumy9zMb2Ri2iE9IRaqfE
         Genu/MnVH3BYskXNJTyBKo5sHOw2l10nRxybn0xEkW2raXNY7Z3T2XZkkFnbQjD4f0cK
         L5VTEnCGsPj5zogmSHclk0sAOL/05W5B09q8T3zOof1w5Lzq6khK+NqCgIRbKcx90ROP
         lUCVbXhLt6e/2JRkvUzc3+BnFEYSWDJ8rfAJd3ENEVvMYBhLfH0arBoZqhmCWecaGk5L
         9tgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745869137; x=1746473937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14iGLLoPFCaZQPh6Psc3FLMwpAjwEZFNk7aZejXSCSk=;
        b=Alvwl+jbdHOMvTmoDXpgNi12qSE3Ncztb4UryrOBzzgzBa2t9wD83X5OuBP0+DZxes
         cNjde66DJGSyeMEm4biE/IhDWXXWhTBcCE98dvhbcWvvmiw8NE4Lfn4ktaKjDU3gAe7h
         MkKhbKdvKuhvQP3KVOhY1og6s2a4X9vosj1kKm/J4wZp7BAYGkt2bJGmGM1DQfqEXqrq
         MMMw59OYV/s69y1vjN2o1o2CvAXCUpkj6TmLuXoyJgVvyOMhDurbNFeOBgrqXwknfTWz
         zc7WmkhjhDddYVRf11rvpbI+gAppZosOjAq9le96EnDDtackgLKX/lXu5sZ1gudyIiq3
         bkcw==
X-Forwarded-Encrypted: i=1; AJvYcCWIdHYES9sQtUdnt01Z6lir4r7Twgvy1nl/qLPhH6nHB9BJkJr4aLbMB6rFdWk9+tg790zImpctzg8lVlzal5A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxq8usVfd7D6+7CWb3yWhjnuW57cWpw6HSSJ63/g6Nz+oeGxYSV
	II4ZGrNW0dsSXQHyRkD+4AlkGwubOL4NlEwXOt5Mymo1tvaG9sD2X4XCPDboFQ==
X-Gm-Gg: ASbGncslAjSHrqvNygwfYT/NYH+CJbuYX5hhkYC1exwhWb4cRhuDB+AMumPw8BaYsfo
	4E85Jh8CcpKkCOdZ9O7JGJJ4UkNbg8cZy2L7dXixvpEPJW37bGazKl7UPZbWPjcO4mfOYhpFxqx
	AKwcXwO0XUp9lm2zi/EPialJm9k5ZTRp51Y3JTl/SbZqRU5rkk6osNQ/20c24kHExyfuHNzujyk
	Fe+FGZQl/ABL6dcqxpBfjuksg0RLIqMQi/8PDkfkWhJ8L9QYqZFkk+1VHgmfctkQmYm1wvM6gXQ
	dIZqw2bGVI6w2bo95aZ6ygijDuIT1R+bpiIGn/jqgOZUfSaFLyCcShfY84TP3bnz6ZOW2SUt8A=
	=
X-Google-Smtp-Source: AGHT+IHmlLzT3YLWMcB9dRwkEoEHVu8JunNQRTVgpY+NajhMftB1PbhiEiMvQy73a8wiTuoNqCPhhg==
X-Received: by 2002:aa7:88cb:0:b0:739:50c0:b3fe with SMTP id d2e1a72fcca58-74027139a2cmr1699641b3a.8.1745869137003;
        Mon, 28 Apr 2025 12:38:57 -0700 (PDT)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25941e7bsm8721326b3a.52.2025.04.28.12.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 12:38:55 -0700 (PDT)
Date: Mon, 28 Apr 2025 19:38:51 +0000
From: Benson Leung <bleung@google.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 3/8] dt-bindings: arm: mediatek: Add MT8186 Squirtle
 Chromebooks
Message-ID: <aA_ZS8cNneR_fyDK@google.com>
References: <20250421101248.426929-1-wenst@chromium.org>
 <20250421101248.426929-4-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XymM9xtRtIWUo1hO"
Content-Disposition: inline
In-Reply-To: <20250421101248.426929-4-wenst@chromium.org>


--XymM9xtRtIWUo1hO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 06:12:41PM +0800, Chen-Yu Tsai wrote:
> Add an entry for the MT8186 based Squirtle Chromebooks, also known as the
> Acer Chromebook Spin 311 (R724T). The device is a 2-in-1 convertible.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
> Changes since v1:
> - Added Rob's ack
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index 49ddc504c160..f0b4ccd81c4d 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -291,6 +291,10 @@ properties:
>            - const: google,steelix-sku196608
>            - const: google,steelix
>            - const: mediatek,mt8186
> +      - description: Google Squirtle (Acer Chromebook Spin 311 (R724T)
> +        items:
> +          - const: google,squirtle
> +          - const: mediatek,mt8186
>        - description: Google Starmie (ASUS Chromebook Enterprise CM30 (CM=
3001))
>          items:
>            - const: google,starmie-sku0
> --=20
> 2.49.0.805.g082f7c87e0-goog
>=20

--XymM9xtRtIWUo1hO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaA/ZSwAKCRBzbaomhzOw
wmjGAP0Rjz88KZq9wxTkLmE2fLTGJpXJLEOGhasJsrHYmQgrDQEA+/raQJKGPQgA
EgvDbveTPRWunILosNFF76r3ozB4zwo=
=vSwx
-----END PGP SIGNATURE-----

--XymM9xtRtIWUo1hO--
