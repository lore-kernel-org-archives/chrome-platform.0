Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E90E30C637
	for <chrome-platform@lists.linux.dev>; Mon, 22 Dec 2025 22:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766443857; cv=none; b=GQRsYScC6Hy1LbS6+ozR5OrkKLmOtX/39E2w6SzuDJ9CZ7y5jHYCn6ntL2IFrjMvOV1k2V5g2ofWPtP2SlQ1tVTT7x4cA4nme60iBqxTKuVl7tv0wLlzhfN1hz7Yhj1Rr9ixTcvngVWFeAaZQnxjbCoNiF17Iqb0i3+ojuuXs4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766443857; c=relaxed/simple;
	bh=RzSww950eW72X9C0Oyyu85GpbJERYyT2MUe8Y88fdaA=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=XInNMuT8Dlwm9rys0gntyTAS8cDrZDAQ3J0oYf5HRXJZLliscIThLK4ESfK8w/e6Cz/O0+Ll7rlDUqTvgK3UsEp3ZHzPXZKWMxaKwdp+aGuhFdwu80/6fcZ+I0iNPyzAalQdPi3wk+D6yyOGrZnMm4BNOHWFS2o0B94ODvpd8CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bumHoul2; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bumHoul2"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5dbd1421182so3582605137.1
        for <chrome-platform@lists.linux.dev>; Mon, 22 Dec 2025 14:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766443854; x=1767048654; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzSww950eW72X9C0Oyyu85GpbJERYyT2MUe8Y88fdaA=;
        b=bumHoul28IWcDqar7ZrQQq3L3PUZ7sKrarXjz5KfR+VFliHF3lLHsS0dlFbTWLhooi
         EJY/3oDbNXywTupgjpXo/Tank3I6VUKKTB0dkTvuy6tPuIWkGTlmN8ryc8VO9czaJDoT
         w8fkrwvuIkNmM+m/Dld2wmBZL11f9ZkWvP3W6/rcf7Cun5XP51UiaNS1pDnSvvGFC8ki
         65jmPf5cqv4F/uDM+9+iFLoqID04p5bNgKwjavuu2LU5r6bD2sHdEGl+/cuQOmpfzmgI
         HKNgrVDeviT+3xyp1XjGyQ3hGPVPi4CJM8TThKkUV4TZifwS90TO2yIKq5EDs6xTUSE7
         NQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766443854; x=1767048654;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RzSww950eW72X9C0Oyyu85GpbJERYyT2MUe8Y88fdaA=;
        b=GdlKXrhXZ/9wUnd4elijnranRGZv/dVMxAvxa8VOgH5dQ4TzTb60lJd0NboibB7/w1
         BV0qvSzzbWEgMU6IIxC1ZM4DMF2DnHSZ/ll8XA/jOulqWw2JZf28EcwgvWBeEINS9ZpE
         wqC0mPJ9FnzncvGUoDadCT88HLiF2yJ8c3j9Y5bOaeKLCprmE6m4X5mzrcsiCiZQ6WxQ
         mWf5bF+ghRMJwFWG19J2WKJr5f6l3SOHfMdrgOpsdMKRT3utPPjLQZgu0nfEWId4MvPj
         Yj8LcGk6qInWz2csUO8os0ujbSo4gwzo8zloyVJa01YRw89paKA+vGCaWM0kD24LyzIP
         fmwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeUJS8/gd2EhboxbY6BJm/FciutJYmodPbzJ8X4N0A/ILdub1FRtM8ztSrYVOrng0aoUifk+K4GpiiR92L5IE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3yiQt5mDXHLVc5SFM5Y72kla0e+uzC4J9d23Gk5yxP5HnS919
	sFDdjjq805TXt2AxiH9JmJEMq6jZqYQH33zgvlxsQiYbcO8xBryu4IV4
X-Gm-Gg: AY/fxX6kWg3Qx82uIdt6KLY5g6krAbyorSzk0vrI+T3D2kykk13VTy/qUrWiDaDgOux
	L4co8sb7wwdZOEo5Xxt0lAxhJmQ91v/5mnE9CDj4/m3RNPQ8Vrwpf2/+swhGq32s/D3CTqfeuvC
	zWnGysG+R+Jv/oZ/k4mwhXqmrqx5WnOrDN3SGbLAMWrDcTOozb3gPjYW/uBWYWldsQRc7yprJNx
	askexuxwoZzj0wYkgaMbtLIKIj2YW3Ny1RllWZpEIEDJ8tsfQOmxB6lcl2ehT7yNYFnRyztYQ7N
	G3Y5thguld5jckEOAk7Wi6nwBy6PD532Au7a8m2sblg1X9LtBkjYLNdeaqkzzRo4WtaeZdVH6Yn
	fE+5TVYZlJJPuUQ0XGE5MjtfjV+A42C04xbcybOGQ9TfdkXx5nKw93FkwwDyH1bo0QJY1SGbhT8
	zECJ9B
X-Google-Smtp-Source: AGHT+IEtjqJ+IJYK0MT8jOtY0wj46KAN8QvGo3BiDSKvbuLac1bW+PMocHFXvhd7kIBYsOPMGQjRIA==
X-Received: by 2002:a05:6102:c52:b0:5db:e0fe:985c with SMTP id ada2fe7eead31-5eb1a67f585mr3880573137.10.1766443854448;
        Mon, 22 Dec 2025 14:50:54 -0800 (PST)
Received: from localhost ([2800:bf0:61:1127:ab87:5602:531c:8dfb])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-943415169cdsm3412875241.0.2025.12.22.14.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 14:50:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 17:50:43 -0500
Message-Id: <DF542YRSDA0T.1HEBLMS3VBS0V@gmail.com>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Kurt Borja"
 <kuurtb@gmail.com>
Cc: "Lars-Peter Clausen" <lars@metafoo.de>, "Michael Hennerich"
 <Michael.Hennerich@analog.com>, "Jonathan Cameron" <jic23@kernel.org>,
 "Benson Leung" <bleung@chromium.org>, "Antoniu Miclaus"
 <antoniu.miclaus@analog.com>, "Gwendal Grignou" <gwendal@chromium.org>,
 "Shrikant Raskar" <raskar.shree97@gmail.com>, "Per-Daniel Olsson"
 <perdaniel.olsson@axis.com>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Guenter Roeck" <groeck@chromium.org>, "Jonathan
 Cameron" <Jonathan.Cameron@huawei.com>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>
Subject: Re: [PATCH v2 1/7] iio: core: Add and export __iio_dev_mode_lock()
From: "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251211-lock-impr-v2-0-6fb47bdaaf24@gmail.com>
 <20251211-lock-impr-v2-1-6fb47bdaaf24@gmail.com>
 <aTxdOiDFqyT8oA3t@smile.fi.intel.com>
In-Reply-To: <aTxdOiDFqyT8oA3t@smile.fi.intel.com>

On Fri Dec 12, 2025 at 1:21 PM -05, Andy Shevchenko wrote:
> On Thu, Dec 11, 2025 at 09:45:19PM -0500, Kurt Borja wrote:
>> Add infallible wrappers around the internal IIO mode lock.
>>=20
>> As mentioned in the documentation, this is not meant to be used by
>> drivers, instead this will aid in the eventual addition of cleanup
>> classes around conditional locks.
>
> ...
>
>> +EXPORT_SYMBOL_GPL(__iio_dev_mode_lock);
>
>> +EXPORT_SYMBOL_GPL(__iio_dev_mode_unlock);
>
> Put them to "IIO_CORE" namespace.

I will!

Thanks for your comments. If this gets no more comments for a couple of
days I'll send v3 including the rest of your suggestions.

--=20
 ~ Kurt
