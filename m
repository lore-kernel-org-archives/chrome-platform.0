Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE152980AC
	for <chrome-platform@lists.linux.dev>; Mon, 28 Apr 2025 19:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745869091; cv=none; b=CBV/x/IKvHVTkjH6GPB2MeFRySYxYd8VaJJLtYB49mK4ljgPs/qazmQAJjOE62c4+Y0A7yIMr1KtQcWHu0/5ybnFPxxAvr9AjcVmzEDGpwW2TfBf8eRk/XLjlr8BEskf8WmMjpzebcXKHcCYkq/8t3e48TbRaTvaYCJ4mBmdH7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745869091; c=relaxed/simple;
	bh=ti1qMv4NvH9CmMP3OH0AQa2stewX9HPWI7ryLNxsa5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rlwvEqtzXGhfIgNSXMK6sew3jRkMJ4sBWsbKYPN2CznGqH++fXxbjL+3Od/+1evLs+Wl+NwS+UQOQzxFmPz4QxBIsU4iER4rovYiEF1j+0TXHB+UBipGCnH+515hSKCqghTorNsC6kQxkTWX7d0V0aEM3oZWE4NVd8b9dhX3DYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AA44yhbt; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AA44yhbt"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22c3407a87aso77631075ad.3
        for <chrome-platform@lists.linux.dev>; Mon, 28 Apr 2025 12:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745869088; x=1746473888; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kZL+y4O4nVB6WkTciMzCG9+Q8Gw1aprj/ilNSB+S7lA=;
        b=AA44yhbtRjEWO+ZSm1vQP6/bg2etvAPwQE9KoIuUWmrJNy8EOL/MgA2pvAl052l3md
         qjqfbLox+8dWT8g1A/QQLOHHxyWwdUql3ieqYUiHM8nHPqfxCJBljkeB55FDH4NOPVQB
         eCjDc5WeKX2FRNN6lxLQVWZIeGON/n3lQ+N4fFvSXUnLVu+MjEvmTtRT3BkBUXFfAJiG
         B1ygYAAAfuNW2yNvZJFM4TytpSyQkUZsfzs7l+4c1/As7ucLY98Lm5dZATl0eWRAPOla
         yn47gGYJCNMianKQpxF8/WMjXrJmKh41dPoJShQNd4MpZMqOUCrzlWBYqLZWrrf0njF/
         c43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745869088; x=1746473888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZL+y4O4nVB6WkTciMzCG9+Q8Gw1aprj/ilNSB+S7lA=;
        b=rORh5kGv9UK407O8OHbQ6N7eH+Hmqn0TGKNmWZUYP9j7GXzNgoKXeKLmg8nxaxoB9V
         0GPym24LwPtJhJPnahNjTi/6vOK/8EjCDZ+MJDEBrNsPcpy6rVTDcUitv6EsnWF7EqIl
         2M+NkpK3vi/o9K2/+oAR/WTpqg6hRqCU7c/YGjLZFojpBqn6xx3KTjNl2tORwYphmPUf
         o77vYPdmg336UP3YEsH+uocbl63Sp6XBWhC0sGibz7y8Hco4JgYk3bwLJRqCPETwImEq
         HqfSsD1boHaerSPX8KX5BJwK9uCgHyRuSFN8vyC290BFanZit6shpdJ6onPVEokiQAKf
         1EFw==
X-Forwarded-Encrypted: i=1; AJvYcCW2PRCX/YQYJGy+9HV/SZ9jsxtI4pK8mrezjl1ro7e87n4fjVghb1jXXU50EIkEzESsPRzMcrJpwZz4wV+Iw8w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm5dKMnvLJjn853WL+sI50GijFAxeAE33TGopRcQJtpRr90SfA
	n/bLMeF8M1KwK82lVaBVUybQWVSZpNJ9CRdZHWXUhabP3iF9jSOtgsEw5pmORg==
X-Gm-Gg: ASbGncuoRAXhYgx//4Te2RVJ8KmLZKtRvP4lComLmClqsqi1PbYYGMcDXQPqKN9Grvy
	d49Ccj+XUg1d5eTTl4DGIRQfJ7puYoi/lffuBvaIi4Wc5kOc5gP/tIorGtsnPFJxeFCYGLFKAq3
	63JG4r8vhnh2uqWF69z5YgafNjRw770/NUHI/47FzGbJpTmjwvFYlPjnt2IN2d/hyTNoYZr75lt
	6JD+3BkmYmEYvQiEUvVu1BU+/kXYM6z6ZiErZ9yFymrWAWgQfpQRp1ixXFIRF9MdxMlbpfX4F3A
	TaEVGN/KmIx3gnIJ8P8r6tnR5FKlxpVUl1mgaZGG2ZbUlR9o1Y1Cvz47lhVIpBJ0ZHUVnwMQGg=
	=
X-Google-Smtp-Source: AGHT+IEb7sjPxHBoM6DBUpDHrBYIpIDFqqlG7FLfEAc+dm0pnpCG2yrmeVJ4VnqTunSOtGlfHUdVJg==
X-Received: by 2002:a17:903:4405:b0:21f:164d:93fe with SMTP id d9443c01a7336-22de608f23emr13724175ad.53.1745869087882;
        Mon, 28 Apr 2025 12:38:07 -0700 (PDT)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbdb4bsm87169915ad.92.2025.04.28.12.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 12:38:06 -0700 (PDT)
Date: Mon, 28 Apr 2025 19:38:02 +0000
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
Subject: Re: [PATCH v2 2/8] dt-bindings: arm: mediatek: Merge MT8186 Voltorb
 entries
Message-ID: <aA_ZGndUwSLY9yQ3@google.com>
References: <20250421101248.426929-1-wenst@chromium.org>
 <20250421101248.426929-3-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="coaj1VmWJVD9+zVN"
Content-Disposition: inline
In-Reply-To: <20250421101248.426929-3-wenst@chromium.org>


--coaj1VmWJVD9+zVN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 06:12:40PM +0800, Chen-Yu Tsai wrote:
> There are only two different SKUs of Voltorb, and the only difference
> between them is whether a touchscreen is present or not. This can be
> detected by a simple I2C transfer to the address, instead of having
> separate compatible strings and device trees.
>=20
> Drop the SKU-specific compatible strings and just keep the generic
> "google,voltorb" one.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
> Changes since v1:
> - Added Rob's ack
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index 108ae5e0185d..49ddc504c160 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -339,9 +339,6 @@ properties:
>            - const: mediatek,mt8186
>        - description: Google Voltorb (Acer Chromebook 311 C723/C732T)
>          items:
> -          - enum:
> -              - google,voltorb-sku589824
> -              - google,voltorb-sku589825
>            - const: google,voltorb
>            - const: mediatek,mt8186
>        - items:
> --=20
> 2.49.0.805.g082f7c87e0-goog
>=20

--coaj1VmWJVD9+zVN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaA/ZGgAKCRBzbaomhzOw
wnOoAQDrlivFR72rlTsDjXpRDqb5IDQN68oHJxMoVtwn/gvj5QEAwGk6b5hoLf1D
239knHKArUipas1DEpyXfJVjZk3+VQ0=
=L6Rm
-----END PGP SIGNATURE-----

--coaj1VmWJVD9+zVN--
