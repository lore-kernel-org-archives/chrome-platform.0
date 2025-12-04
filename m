Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE5A34B191
	for <chrome-platform@lists.linux.dev>; Thu,  4 Dec 2025 17:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764869743; cv=none; b=tNMYJBZ+c6OYBDSugUlNMtd9QGWfIf7UXkhlRN8aGUWEn/BDAjC+Q2SuCOPm9p/SAizWLvXo6gejOobCttLP6Ys3E0gX53O5EO3JbEu/qfX8TG6j9gTrFoQZreilw+K3FEtXRzf8mL8yBTU0ffmw0FdWhcg/MxMpBp8wcHmzPX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764869743; c=relaxed/simple;
	bh=6R56nSeR32U6rOCR4CVmw0k/TDzh/HkC9g9vHuA++6M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nPyzO81+0TomirRdqnroaqHljk7Zh4ya6Ld/m4KpnlajLn+7hmCOY688DSGRJn7QUPPo9ZHSArQjOsgovOL35Zls6yJbC83N97vpMfSm2LqQI+V3NYYxJ3h9JHlbyCRFqW9lwgO3V5dk83fBzoeNP4hMTsP1jKlm0nBLPPD0Z1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSKyv3WV; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSKyv3WV"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-55b26461e78so391324e0c.3
        for <chrome-platform@lists.linux.dev>; Thu, 04 Dec 2025 09:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764869741; x=1765474541; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6R56nSeR32U6rOCR4CVmw0k/TDzh/HkC9g9vHuA++6M=;
        b=DSKyv3WVTyK+7LUv4HntbI3Cax1w0ZDWzPC2dTtES6/m+/utM4y7kn/RPD7TKsfL0M
         7+x+rC7SX7quGukt3X7rQBOIor30OLp1sn61/Nu9r0UIpOR+ICFe76ywaICM7EzGUZk4
         S++qm2lUBwQxPGI8Mg/3cPk3MddejgnbELcTaTRlslnl6TaCpRWCyrY8jXPZRdywK/kr
         SUvMWoLTt1LPz7gd36QPZ/wCjoLxQkLpc2rtaZdu23c37e8Dkrt/DOft0Q5OIW1wenQv
         eaM2sE1JEbuOzGLWokgDVxbFN6Zlp/LGlgVsShpemDtKHlCzcX8R9h8RtBr5Pf6DAbax
         tdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764869741; x=1765474541;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6R56nSeR32U6rOCR4CVmw0k/TDzh/HkC9g9vHuA++6M=;
        b=GXS4pvL0TfD5iISWNU/HfCgkhKA5ZuCSd8fTVT1E4gkLbpYLjbut43vvH90bo3jk/i
         mxyej+ijIPe09mCetP6owZvsFYsRH41RiaE5yhxSmwRM1tSGz1vi9yw7qYLMrxX2LgNV
         FmsgcKIuINRTVYcSCOCEdIR3HB+QJk3GnDXyicA4iazy86iMqsJwVDta1pIQHjz9pUc9
         HJLhiaKzUxpj9jQTHJMdDtmW85E9EL3nCygpzIzzx6M/8uAk4wC7f6PE/a/GSy1nGm/h
         ciAxZMt1qjhoSgJM3H7pCj+KN9o//0h2uuH5g4NpGJlAmIjOgP84JUMRLdjf57a6qzx1
         elLg==
X-Forwarded-Encrypted: i=1; AJvYcCUlJCujL/QfZuB7iualFEMXbD4BPiptK+xeCs52519BMwnui0U7F9GNHechjvUbKdS/Zjfno9sd+QktGn1ypqs=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywj322Cm+GFkTNHmsMP0IibzygFnwW8rLxXNCvtQ0fBsxH9K5R2
	od4FUO/1corX4JR+s6JKzf/mCtCIz+SWsN61eBauEiBqfsKYdj2WYC4o
X-Gm-Gg: ASbGncvuv8hTPJNlV40Ir3D+iPwRV0M45tRQEs5d4X7cjkz8mCBi45fDE6oRsxU62R9
	MSmRSHXrirFkQ4aoaTr51BbS8gpX65VyDwIPmX9lXI2DnrNhGTs+hb9X/e9FeDBxCJDhssp2POP
	Qdql1tBUf4Rv/t68cT9lpa+uV8N8UoU2jZsQQ2oM3IP/QdYkZQFvh7g3smwvYLG3DK4/hNucyb4
	b3/n+oJC/99uoEvuFtd9OVCBTY25dinCw6JT1dortXtATyx8M+i7oy7beeNSTs5dB+kODz5y9fV
	DYE4pDyxiUjQNUvaqqfLhpN6PoUiOoB2OtiQh+8dkP6Rml4dMHnIP6o/ERy9tZ8MfDgE+5EZnaK
	d+WVX5/riI21r+PnmgYBTlDi86+cpaXG68UnLWRr0SS1nNIfUTNhgseevm3DL19iSgS1wphG6ow
	+LOT/NgqW0qSsWNs/p
X-Google-Smtp-Source: AGHT+IGwtANy/661crb/1sN/81i88XnN3TTdGswi0hzsnAwJI2k0rXUkbUlonsTOlnKceWWaxsvU4Q==
X-Received: by 2002:a05:6122:318b:b0:55b:305b:4e3b with SMTP id 71dfb90a1353d-55e5c03d909mr2486205e0c.17.1764869740700;
        Thu, 04 Dec 2025 09:35:40 -0800 (PST)
Received: from localhost ([2800:bf0:4580:3149:7d4:54b1:c444:6f2f])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55e6c567571sm929666e0c.4.2025.12.04.09.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 09:35:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Dec 2025 12:35:38 -0500
Message-Id: <DEPM3WWMT76K.P5E00DKJ73UO@gmail.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Guenter Roeck" <groeck@chromium.org>, "Jonathan
 Cameron" <Jonathan.Cameron@huawei.com>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>
Subject: Re: [PATCH RFC 2/6] iio: core: Match iio_device_claim_*() naming
From: "Kurt Borja" <kuurtb@gmail.com>
To: "David Lechner" <dlechner@baylibre.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Andy Shevchenko" <andriy.shevchenko@intel.com>,
 "Lars-Peter Clausen" <lars@metafoo.de>, "Michael Hennerich"
 <Michael.Hennerich@analog.com>, "Jonathan Cameron" <jic23@kernel.org>,
 "Benson Leung" <bleung@chromium.org>, "Antoniu Miclaus"
 <antoniu.miclaus@analog.com>, "Gwendal Grignou" <gwendal@chromium.org>,
 "Shrikant Raskar" <raskar.shree97@gmail.com>, "Per-Daniel Olsson"
 <perdaniel.olsson@axis.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com>
 <20251203-lock-impr-v1-2-b4a1fd639423@gmail.com>
 <40cd9574-ac26-45c9-91a4-b08ad799ca99@baylibre.com>
In-Reply-To: <40cd9574-ac26-45c9-91a4-b08ad799ca99@baylibre.com>

On Wed Dec 3, 2025 at 4:50 PM -05, David Lechner wrote:
> On 12/3/25 1:18 PM, Kurt Borja wrote:
>> Rename iio_device_claim_buffer_mode() -> iio_device_claim_buffer() to
>> match iio_device_claim_direct().
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
> If we decide to do this, I would squash this with the previous patch
> to make a clean break of it. Although it is helpful to have "mode"
> in the name if we can keep that without breaking things.

Agree, but If rename iio_device_claim_direct() that would be too big and
I think it should be separate patches.


--=20
 ~ Kurt

