Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB58B155326
	for <chrome-platform@lists.linux.dev>; Sun,  7 Dec 2025 15:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765123168; cv=none; b=KRJNg5WL/SWq/i9xUCzPBiM+CF+Xw8gVarK5K7M46iVMolk4yQphyOR4LBifFHI514kNIkCJ17z52bx2ozImRRt7YfEnx1f1HljwryeDFNTvj/G+DnUyzPkwY/4UFqImxQY2kphsl8C45aist55gweRUc+XWn0nSpw0X8fD5f6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765123168; c=relaxed/simple;
	bh=Ebs9xnJdozT9JhjRrPwwYTQ932pWegL9n1JhdAV3v+o=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:Mime-Version:
	 References:In-Reply-To; b=B/Pg1GrikFB8S+67qbXFYrvF/nqQgA0CSZvVqHutlzFnkw6IQhErmut8i7Kb5l5sSPXj0rU+94Cy5w+aUjdqBKVnFQKQPByz6ioVJ4mv50A6lE372rHNrpa8Tl+v6o2li5EA0AKZ7vL5dAfBRRp/4KjFDq0A0V79ml0AQ51G7lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i54KdCCf; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i54KdCCf"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9371f7571cfso1052156241.1
        for <chrome-platform@lists.linux.dev>; Sun, 07 Dec 2025 07:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765123166; x=1765727966; darn=lists.linux.dev;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lAgMFlNyMLRLjBCsqD3swe1jJ7Gk8kx8vIqYEMB0v5c=;
        b=i54KdCCfJIQm+V3dEoHGtlNMiGmulfPH4+2bIZuTA6E0UqN5ipCB61loKf9s1CdT7f
         J7kSJtBGaLXQQvt9LEKvO/xPSYysfjQBFnotlS05tEhfpuvrom+wVhudDiL3GZzxqrbQ
         sa0NtIVOyWly1OVLZEZTuqX2L1G4y48oLruPOTGwfkqKW97j2J0dNIOB1tZvj6IyuS3q
         DLhsa9NgL/cVSdFkXg34IlMK+5/o8Nca158orxJUIZGTOSP+hBR0Ah0lhs1D3wZSJCBR
         C0gtDBzNe53dfOBXzgdJzCJrxOjP8oGDzY7TfhIMhGTDcfzA/8QrnWLb57w1VfYsZOzV
         JEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765123166; x=1765727966;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAgMFlNyMLRLjBCsqD3swe1jJ7Gk8kx8vIqYEMB0v5c=;
        b=WWL7jUge6h0P40/4hMgIRj/ktgeiA+ReZmkUTrKnRmFQdXkT1Vxvusy2dNCqKSktHB
         Ayz0DsKbzt9d57UO8VPVK5i+cW3s70necwR12QyAtyQibLHlsWEqVChPQsGruoz8SKQ6
         KCgO2tf0cIdFf115f6derBRnG+LwmNi1vRMzGmDFwcpwdO+0KiZ47aV4chVSanDIGaYA
         yU2IsChmcmIZEzM3w91YHB1gdwqmhqz4w8HDl6xHa0jT0V6ZG5jAd7BJc5vGZdrQ4XPK
         Kwcf/7Tt1cJ2IsVrf7D/ARQ15OYcXZ2MAF4JaLwG8mdj8NUglc9bXznGu71NtuKyCT1G
         60wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVECCnx0QHpyE/hzjkScm+rzIM4m6Sb7wrtEWeKBl0Qssxd9YGDU8O/myZikJsklOo653e3NfSH6ZIdmO9Vw0Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YzyYTQC3af/6h8+Ifm55XY3JvTLocoGwxH6/QkYN5b1GcqprEBY
	eEDoWwmNUDq0BIknxWNm6jsLHJTVchRo6718gMjnkUbidD+itMq/p+cc
X-Gm-Gg: ASbGnctugAURSOgg1ha81rMGEbbZKgX00YRQyfnoWYAbnA9Ionrc4VXue/NxH1daV+t
	UrGQLkO2mYrjFJ3yvosKbZImrGPPCA4w1pnAHApmlIQNm7TWtfWup1MtjKEFeg+ze11wcnQYl1H
	LJiiNhjoKVT5VBc0+muAdottqzNV1bq696T9nhfbrv7O2hzVKJatU5m3u4CsRTc4OcPWCHkmmQX
	R6IoSdUco20rvRctKEaRVLCzt93tfqfoAO0f6zaK8dJtdw+Ocg3VRRgba13yDy+Zj+aCnxlGlis
	SCwSRSa42PqZRBQnhYVuKqaXoQ3doDFvKMXxOcphBidSQFrudDL4QVsp41z9qbqBYteLtQ9Tp8D
	wvPkLJc3BzXoOpEER/Zqc7lKMX2xWiKVaQUgawUwwp0tVgbheT/AuWIwvSCknDsiAHwwEd4ZRLr
	jx2zI=
X-Google-Smtp-Source: AGHT+IFfxCyfUKoveUH7oGp1n4BsXKh+nrF3WusJSRi8+b035IQ1lyTlQABylKlq6X/maPcFuV+GdQ==
X-Received: by 2002:a05:6102:1590:b0:5de:8e5:222d with SMTP id ada2fe7eead31-5e52cbda9admr1225249137.22.1765123165695;
        Sun, 07 Dec 2025 07:59:25 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e510cbb3dasm4480414137.9.2025.12.07.07.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 07:59:25 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 07 Dec 2025 10:59:22 -0500
Message-Id: <DES3XUNSY5DQ.3GYGCUOO0EVQI@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, =?utf-8?q?Nuno_S=C3=A1?=
 <noname.nuno@gmail.com>
Cc: "Kurt Borja" <kuurtb@gmail.com>, "Andy Shevchenko"
 <andriy.shevchenko@intel.com>, "Lars-Peter Clausen" <lars@metafoo.de>,
 "Michael Hennerich" <Michael.Hennerich@analog.com>, "Benson Leung"
 <bleung@chromium.org>, "Antoniu Miclaus" <antoniu.miclaus@analog.com>,
 "Gwendal Grignou" <gwendal@chromium.org>, "Shrikant Raskar"
 <raskar.shree97@gmail.com>, "Per-Daniel Olsson"
 <perdaniel.olsson@axis.com>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Guenter Roeck" <groeck@chromium.org>, "Jonathan
 Cameron" <Jonathan.Cameron@huawei.com>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>
Subject: Re: [PATCH RFC 1/6] iio: core: Match iio_device_claim_*() return
 semantics
From: "Kurt Borja" <kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com>
 <20251203-lock-impr-v1-1-b4a1fd639423@gmail.com>
 <9562673ef83dd73b6092b5a7d2042b380a55700c.camel@gmail.com>
 <20251206180546.2a8b8780@jic23-huawei>
In-Reply-To: <20251206180546.2a8b8780@jic23-huawei>

On Sat Dec 6, 2025 at 1:05 PM -05, Jonathan Cameron wrote:
> On Thu, 04 Dec 2025 14:23:19 +0000
> Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:
>
>> On Wed, 2025-12-03 at 14:18 -0500, Kurt Borja wrote:
>> > In order to improve API consistency with conditional locks, use
>> > true/false return semantics in iio_device_claim_buffer_mode().
>> >=20
>> > This also matches iio_device_claim_direct() return semantics.
>> >=20
>> > Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> > --- =20
>>=20
>> Even if the rest gets a NACK, I think at least this patch makes sense. I=
n fact I
>> would even extend it so that we have the same inline API with proper ann=
otations:
>>=20
>> https://elixir.bootlin.com/linux/v6.18/source/include/linux/iio/iio.h#L6=
79
>>=20
>> So it really has the same semantics as iio_device_claim_direct()
>
> Yeah. This was on my mental todo list. So great to see Kurt
> dealing with it! :)  These calls are much rarer than the direct ones
> so I wasn't so fussed about getting the sparse coverage. Makes
> sense to do it just wasn't high priority.
>
> As Nuno, suggested though I would like the sparse support for these.
>
> Jonathan

Hi Jonathan,

Great! I'll squash all "semantics" patches and add sparse support.


--=20
 ~ Kurt

