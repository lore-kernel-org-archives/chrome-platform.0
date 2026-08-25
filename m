Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7183D5222
	for <chrome-platform@lists.linux.dev>; Tue, 25 Aug 2026 07:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787643875; cv=pass; b=kJnv9RK2zWa1CeNJLl9lPcTYa4ADHiibDCpTIrhBGUk20myynefiykfAvQe9ezQkxBT4UZn5kqZSf4NixX4nahouP/Kkn4qSRvjys6zN23VdfFDSE4EkGAzLfiCrz3j3uoscW+fC3ulQXKnU3WwSCm+0hM9f5MXQztIXSyKKAcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787643875; c=relaxed/simple;
	bh=Mii/DeCzm2nMtl3hgGSjPHkjrDmEfCYXtshu5NQAkD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RWMPzP5i0bY7jLGHzdy3xBYmXjFBv0bfEf8UCUeU0K+oBs6nVlTnaxeEEX4Zsu3WrCPv/TbrLmW3ILtJ430UoXwFMKljEJgiNngdlgMUQAbn79clj/Z8ttD52T7yyF8xSQYng5UVKqpTzkDzwoEXk0argfJ7mhWqaE2ujw70Xj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Do4OQBoA; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Do4OQBoA"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-669944f60b3so4962324d50.1
        for <chrome-platform@lists.linux.dev>; Tue, 25 Aug 2026 00:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787643872; cv=none;
        d=google.com; s=arc-20260327;
        b=BbZTxMdvbgf5pJF2e7AFmLa+eqANweTQOo574oXzes5o2NXLeK2bPZPCLi5eBd2Wp7
         rxR/sYxbWEM0twOm3JQsXCvVw8UKM6CBFq81g+8NEYmfLzXeQIxnDixU7mDNzvnnvxSl
         qHy25FtzWrtXRxQo11sApvyTGV8VY/Hv5lWgyoxwH26+yIAfUiyaS3RlklUZUtJKFtq+
         XCqE7PRYHJvo4tG66P0o0MMCL5yYEbjYb8vaiZUl+sfFVhMVTvN8fMaQ7EV+slVF+DjN
         +ZGQi7YUCWY23MuIE5uTfJ7faN1zF8x545o3gwjbhdPAGQc7eapezqNVeSCiwtmYadtd
         e11g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V/xJK88pfs277nwbYNBwPuRxCY6IirnLC5W4+cq/H6A=;
        fh=cKqdEDXvhncMxVuBIDEhj1KHOjXNmEiwF3igW5+KXlU=;
        b=IuvTFca9DzUrFwsxjOMLgRk9gdaWEgWuxAd0OcBHI6nBv0s6eYVyk+uNWemjFX2rR0
         ZcoC1OVQDnUGqr9cpukMcasrOieQIhBdisXjU43/si2q8rky/w0CbBcDwRNeVEYsNGim
         uZyxZvy3oOCIcdDIGvGmf33m5nsw3iexK2XP2Ty1EbFNBb7BELhZYu6YwQI4sREvB10p
         45fF/2mggZDqbTc6UgStwlif8odde/I4fCqpdOpboPnAk+5UzL4pBtBT4vwDl15GpHSo
         M5SSqvcl6I8oCXQVGnFm+c5QzRMvmKHO+0xhtdfDchzTR5ildqg1GHmHzVeOviy2wGUv
         Kf9g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787643872; x=1788248672; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V/xJK88pfs277nwbYNBwPuRxCY6IirnLC5W4+cq/H6A=;
        b=Do4OQBoAviE+1n5LyjiiY3PME0fps0/3TWtYeUmblZ8YgAxgJaiiTKm+xvi/bWi23S
         UVYlkRF4mRUEvdJk9vu0fcU1LYkOzLCaDWlWG8kGduT6QRW4KlrOkAX4jMwuxK1dv8KH
         OuIVHuDunTxGbBNiNGpWx19KAJ0TJ0IOHbDNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787643872; x=1788248672;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V/xJK88pfs277nwbYNBwPuRxCY6IirnLC5W4+cq/H6A=;
        b=LyC8mbs7D54maQa7qA/ZRP9fwb7t2shnQEXAjqcnbwzyaw5Dkq7w9nhzluCTGzgUAa
         2Zj9WzEjtfxE4PE3SVhHF9PfEZYMFX1VhXM/wW9coexsFOuufD+z7W44mT00gatc09rv
         rDxSuw+lgBFPhtweCaOIaLAn8uNH1eM31Q4xpcR8W3fCD5z4HEPkDrTlhlVaSUnFoeH5
         TLjrYLD9xYj82B664orIaS815V38l3v8W69rwb3SbhbhrabIS3mciHbacaoILgYw1Ice
         2L/LyXKZAWyslG0/+FfIX9gN+p8lm3i1Ruv22iCabL2usXBAZQqK0QZCP56NmtVPzbXA
         86ZA==
X-Forwarded-Encrypted: i=1; AHgh+Ro39twHKq7a+aOy3bNil8LHllJNyRGLYbf6nWHjxKjT7tKiB1YnU6zyscQrVoE01SQeL9z4pizoWb69o+spE4o=@lists.linux.dev
X-Gm-Message-State: AFuF++kgTqkr9VDQi1Bjmtk1iZe8FlxV4XKlUKT6sOsItCcLaF7HR063
	80BUJA0sA+UFXIdfgauA/4yr27CNWOmP8DgfNnEGJyeTRYS4J43viwIlf8c8hD0wt5zEePFAHwx
	yDW3e07HA9juRQmKvcGAG8Aal9hjN0Uj0dSVauauP
X-Gm-Gg: AR+sD12eqqavahLwiANpKFyjJQvFCweNbR8bqZAph9PTESaKkqoTU62xOJyEB3xVTr1
	WFYWNyyCuI24g2HswoIjUQXIsfhWwM8ZWKEi/jBkn7hbFJcdCmDn58oENG+BTP26uPDykvsMcqc
	5nD7ScSAkTyQlMKtmD6MxUX08hj7g2dCRteHAlBs85/Xbs6e4mgA/02Fe1ljCq4Lr/H1UKVHrUN
	Bdd4vd1M5Pq7w3E2iWwspwmqWKYkX7f6GQtENJ7I4i9tnBZmumMv0MNCXIjXyDzJjsIlJ3Aix+1
	oJoT6He8SEU9FBUBfbkHGE/++uZuFgjdpx9F7dz6QxWXkDsWapRlqZOXQ2ay8rvWnJs+QPb1
X-Received: by 2002:a05:690e:1449:b0:66d:1131:b81d with SMTP id
 956f58d0204a3-66d1131bc41mr2549091d50.29.1787643871703; Tue, 25 Aug 2026
 00:44:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260825041628.988369-1-wenst@chromium.org> <20260825041628.988369-2-wenst@chromium.org>
In-Reply-To: <20260825041628.988369-2-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 25 Aug 2026 15:44:21 +0800
X-Gm-Features: AcwNN1VHbO3y1ftfkF_7R2W7KDk8RFMySudnf-TTSiUhjGplV2Fwnh0fieb32LM
Message-ID: <CAGXv+5Het3zp_OTp=_ktg+_d5Q55zkE0SwQnM7TVyJDmOdBtyA@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] regulator: core: Add "enable and wait" functions
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 12:33=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> In device power sequencing and initialization use cases, it is common
> for the driver to enable the regulator and then wait for a certain
> period of time to pass before continuing.
>
> In cases where the regulator supply is always on, or has been turned on
> or left on by another consumer, the driver could shorten the delay or
> skip it altogether, provided that enough time has already passed since
> the regulator was _actually_ turned on.
>
> Tracking this requires support from the regulator core. Introduce a
> "last turned on" timestamp field to the regulator device, and "enable
> and wait" functions to the single and bulk regulator consumer APIs.
> The existing "enable without wait" functions are then converted to
> macros that expand to the new functions.
>
> The timestamp is updated each time the regulator is actually turned on.
> For regulators left on by hardware default or by firmware, the core will
> set the timestamp if it detects it was left on and its supply (and their
> supply, and so on) is on as well. This is unfortunately best effort
> only. The core can only assume a dangling regulator (one without a
> supply) has power. This also applies to the dummy regulator.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v4:
> - Try to update last_on timestamp for regulators that were left on

Sashiko flaged a few issues with the changes:

- _regulator_is_enabled() called and subsequent timestamp update
  without lock
- bulk consumer wait_us incorrectly assigned
- _regulator_is_enabled() could return an error

Will fix and send a new version. I probably should get a local AI review
working first.


ChenYu
