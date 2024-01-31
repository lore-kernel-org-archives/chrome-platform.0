Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7453715C9
	for <chrome-platform@lists.linux.dev>; Wed, 31 Jan 2024 00:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706659336; cv=none; b=a6/0ZoRH3jsbQFYH526b5F3lzM6dWopQEofKp3ziOjL6kWAkUExFHiIxeBMvXrWTUB91nvMRzG8T+qfdkVtBsFA7MN64RjX3Dh2o/dsyYBHYNQxrejz+x2G8GksLz0fY1C1ZcfFcM7P13iDLZBBplnld9LJoDfXI0fxOZWayx3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706659336; c=relaxed/simple;
	bh=ELB3rB3pTBAyVWgkgbBLwzuWJhChYKsQ8NutVLQX82k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lIDzbPMClBG0AlUZd6WU4Uv4OMthVcEntUY3hkD8r3D3BEUCjIwry/szDSa3Z8hNjUlMsNBGbsMb0THEbOOJYUG3q4PCUZ/9rspcIPlSi32zAqyPMWOPKRA4uyNdtYFLXsSMsYPMJQtGEU27oJlK4L99OCMTSv7UmkKhqPMjZtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bO0h++B9; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bO0h++B9"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2cf3a095ba6so54535771fa.2
        for <chrome-platform@lists.linux.dev>; Tue, 30 Jan 2024 16:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706659332; x=1707264132; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZ6gV8n3Hy2+6G1uDais5tZDUXuFFy3xqXRf85finO4=;
        b=bO0h++B9lkLIWKufay81ISdf57JiSeE7twmH67zEFbvgbT3NBQ+qWS1XWAAAFqb3Ul
         uo6/Amyo/d0QRPe8VSkJr7ALpMdgmLBFrn5lQZL3poIJEFpqspoXtWGUS7UuE5F7vBuW
         GxuttYaA8SFV9eX5oT77ddJxvFR7/oYGX2+Oc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706659332; x=1707264132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZ6gV8n3Hy2+6G1uDais5tZDUXuFFy3xqXRf85finO4=;
        b=Fpz51kVHSfokZlXflf1tZ+lzfJ/8U/IAE7kPBerNy4cbPZ7A6pap6yWql43x9Afy0/
         uXSMdpQ0S83P5FC/K5AtrTMe76oTl/snbcVZj3p56G4EA8/iHePw2+lmBUGH8/nqRKTf
         zoMZstpv+/ZlkSev/k/U8z8HCYhHmgqRd5yLQ5OQ0JlMRwxpvTFeL9QC6PZp3Q5bdGtP
         S0+jCn0ejv2iCjLmHdFZTG97R110RyCl9mllNbp7IGnSs5O/9l8sGFOHy85sdnbZ9UO3
         /PGB+n3b+NHEf40SIRD5O0f95GxVBCU4G12aUXZKsaQ56tyK8AgYt4njDdH6wiji8b+9
         f4Nw==
X-Gm-Message-State: AOJu0YzGQneKFyf5TsKN+RPFy4v/YeLindnQ7MXcgCsNr+0HGTcCJ4xJ
	rZts5ZSalFOc3l4rDiTgFwcfqTEJV5CLDDoCrq9XdaQZlMCUdRU/HPBSA67jox1+6qagKa+Xd9A
	=
X-Google-Smtp-Source: AGHT+IEfjTS5jRJIqQP2YA7VpAPHaS40Y5N6hWk0lzOm78Eh/OQSQ00Izi8Y+Fke3MBx/si+ywFpkg==
X-Received: by 2002:a2e:9b50:0:b0:2cd:122e:4424 with SMTP id o16-20020a2e9b50000000b002cd122e4424mr36232ljj.17.1706659332445;
        Tue, 30 Jan 2024 16:02:12 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id n16-20020aa7d050000000b0055f0f643ebcsm2198977edo.96.2024.01.30.16.02.12
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 16:02:12 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33ae7681d03so2103308f8f.1
        for <chrome-platform@lists.linux.dev>; Tue, 30 Jan 2024 16:02:12 -0800 (PST)
X-Received: by 2002:a5d:680e:0:b0:33a:e828:c3e6 with SMTP id
 w14-20020a5d680e000000b0033ae828c3e6mr15698wru.30.1706659331581; Tue, 30 Jan
 2024 16:02:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240112131857.900734-1-nfraprado@collabora.com>
 <20240112131857.900734-3-nfraprado@collabora.com> <ZaQVScQ2AYquG-Zr@smile.fi.intel.com>
 <ZbA4VthTMPT7BSRo@google.com> <2024013059-poison-equation-81d1@gregkh>
In-Reply-To: <2024013059-poison-equation-81d1@gregkh>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 30 Jan 2024 16:01:57 -0800
X-Gmail-Original-Message-ID: <CA+ASDXM-m6U+JFvBSSHMxAf8Ct-T-pL8tmcHxHQjepdRFR-s1w@mail.gmail.com>
Message-ID: <CA+ASDXM-m6U+JFvBSSHMxAf8Ct-T-pL8tmcHxHQjepdRFR-s1w@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] firmware: coreboot: Generate aliases for coreboot modules
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, kernel@collabora.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, chrome-platform@lists.linux.dev, 
	Abhijit Gangurde <abhijit.gangurde@amd.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Nipun Gupta <nipun.gupta@amd.com>, 
	Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>, Umang Jain <umang.jain@ideasonboard.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 3:51=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Tue, Jan 23, 2024 at 02:06:14PM -0800, Brian Norris wrote:
> > "Don't you want to have a driver data or so associated with this?"
...
> But why limit yourself to 32bits now?  Why not make it 64?  It is going
> to be sent to userspace, so you have to be very careful about it.

Is that question related to the question I pasted/replied to, about
driver data? Or a new topic? Sorry if I'm misunderstanding.

Anyway, for the size of the tag field: I don't have a strong opinion.
But FWIW, they're coming from this project:

https://review.coreboot.org/plugins/gitiles/coreboot/+/269b23280f928510bcad=
d23182294e5b9dad11ec/payloads/libpayload/include/coreboot_tables.h#36

As you can see there, we're extremely far from exhausting 16 bits, let alon=
e 32.

Brian
