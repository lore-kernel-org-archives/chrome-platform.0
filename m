Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD663D5F47
	for <chrome-platform@lists.linux.dev>; Thu, 22 Jan 2026 22:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769120557; cv=none; b=peI0MK2am0Mt4YVlvLWjqLlBlD6xeU9A7h64g+E5vOvkVvcaRnLTWe6TMRck/Z4rOhapMxtPCOWTkRfQB1uEzTNAS594GDUTowwhuQCRfQB3mo7JqZo1+mRjl04n/Hh29F25lYILB77fbvxPBRoMYyzNOUdQOtW54oKHF/QbgoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769120557; c=relaxed/simple;
	bh=v8li9rEEOi4RxbsVCtE9cbtgvcBBy/CLG+X+vCFd4VI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=h6FD6n5Yj/jq6jRFVsR712I54vh3lbP5BuzC7qrwesoIWp6jtlPF48vFz52U3T1bG0jpqUXtkoZUwwWfgXNUXyxHxI1DkcJYJBv/vURkuwdPPtqESrgoupnqzU3tQA73G0b5NNVDvM1MzDkvZ/d0GXwk+OipxYBOyf+1DjrCOMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mdwnnEVs; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mdwnnEVs"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9480a1f77d5so931115241.0
        for <chrome-platform@lists.linux.dev>; Thu, 22 Jan 2026 14:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769120549; x=1769725349; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iga57dbeE6nIO6l3TfOl2awwaa5/FxEDkOD4DnDDCnU=;
        b=mdwnnEVs1Q9hB1yi4ao7OjjHBA0DbDjgIG+3uA5+jgnn413Cl+wmr2gh7ZCQs8L1dp
         N+y2zB/khP5QNoq+ZoePlguz6nWzCmc2chgnO1fdy4Nxa56Tmzd+GndTgxKuMK0pflcj
         vZm8nnxzww9j57ZBq+jLlIRKQFzu+8Dz4xcd/XcTfKIHpeSROeSkg7bXgLTUUKppqCjX
         CDv9FrlK4gDySK+xBxOJy3MmEDdQJvQ2h8j46+cuXeKQ4BkctFQ8R8v7YYSMtdF+0VcQ
         qYvp7uYvqPtJapAD60N1iR6saOFXzLrn/TAvV08AeQZJmcZNLJVBKxn6RYhRgFi0Jl1I
         LDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769120549; x=1769725349;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iga57dbeE6nIO6l3TfOl2awwaa5/FxEDkOD4DnDDCnU=;
        b=oWvhhruo3gkxfpasx4YJ6IyO7Bi5zYq4ntrN+z9jfhRoJ4n2gSuDCh1d5ZWLwSAwu7
         2VlRcG4BqLAzsCPceyaJJzjB/+TkOfKO0YRN7zvFdirfi9lZ83iCUNWkVX0LvbZFIjdD
         Jw7ffCNCwo56dx5EO2zs+UTZwMtrdgmfzSPIHLuOy12svoZXVjkxrUpaxsQrv2qKXJ3t
         wNm6tgC4dF/s5pPcPjVqSp9QfOXFEijRx/o2hxd/7F9iKOvG3SZcFlXke9hIajHVmHBA
         ICqL1OMxcFpTFnrlKlLuDnfehuKcszWIl9Lyl3arEr1ZKwCDuoa/yWCXq3QKUwVQEqzE
         sfmA==
X-Forwarded-Encrypted: i=1; AJvYcCXp/hpAhQXQoObM/4IFipG4bJqn8IdZnwdUQsE7lxgSj6yDaepIDVsWXwQ96WoOOn7Z1wZuj4KTF1f/hSRbRJI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxjKCVPPlK0/c/Rrv4bQy/w7/SShfVSRx06bI9TSmFTmA99dyk5
	NpHRlRihss32cEk5VbAs1fkOYdq+EL4UyHlVrEQeSdST5ZGvxQUigdoN
X-Gm-Gg: AZuq6aLqvbfliTnS6oW7S/BJ7RiR6CanS2dQ/aV6Qw03t5HndyhoaXDF7nNaedEJoDj
	gKpPnJ5djmytxvw+lyX6AfY7KYNad4MR1yZpGf4Zv8NsH99nUZV6jZ7KeAv+ZDaeN+FElNCQ9Pm
	A4hGRo/BcNCs17/KbmCI14htIFA9dsnKTAcE1JGB6XSuMUCljLFQhVLuk8kHKx5SmKqthd9JxnB
	Fv8Wx/xcLLp/glV6U9SlNAxVWrhfWDKB6c492g30i3fPDCKORH/7U4XBAI87+QVYo7rvIkM0S+o
	wh5oW2bbJUtme1INdl/RcILEZyghcRPNZYFNXZRSd9xA8oLH6LCaWVwdN5aLw0zHdHyv9JrG5rz
	j+41TsyIOZkBojOn7B5UEdsW2jRQrbsTY+oLMsyTz7roCNwkcv/ML1sCTC+9Fy8xQTiMM0d+wz+
	GTlwPS5CQ=
X-Received: by 2002:a05:6102:f14:b0:5b2:d28a:8937 with SMTP id ada2fe7eead31-5f54bb13469mr433935137.12.1769120549446;
        Thu, 22 Jan 2026 14:22:29 -0800 (PST)
Received: from localhost ([2800:bf0:4580:3149:c903:2904:3cc3:8b4c])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f54d3d8225sm149921137.3.2026.01.22.14.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 14:22:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 17:22:26 -0500
Message-Id: <DFVGW74ECJL3.1238NAUKM1U4B@gmail.com>
Cc: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Lars-Peter Clausen"
 <lars@metafoo.de>, "Michael Hennerich" <Michael.Hennerich@analog.com>,
 "Benson Leung" <bleung@chromium.org>, "Antoniu Miclaus"
 <antoniu.miclaus@analog.com>, "Gwendal Grignou" <gwendal@chromium.org>,
 "Shrikant Raskar" <raskar.shree97@gmail.com>, "Per-Daniel Olsson"
 <perdaniel.olsson@axis.com>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Guenter Roeck" <groeck@chromium.org>, "Jonathan
 Cameron" <Jonathan.Cameron@huawei.com>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>
Subject: Re: [PATCH v5 5/7] iio: light: vcnl4000: Use IIO cleanup helpers
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260120-lock-impr-v5-0-d4d22347041f@gmail.com>
 <20260120-lock-impr-v5-5-d4d22347041f@gmail.com>
 <20260122191252.320750d4@jic23-huawei>
In-Reply-To: <20260122191252.320750d4@jic23-huawei>

On Thu Jan 22, 2026 at 2:12 PM -05, Jonathan Cameron wrote:
> On Tue, 20 Jan 2026 01:20:45 -0500
> Kurt Borja <kuurtb@gmail.com> wrote:
>
>> Use IIO_DEV_ACQUIRE_DIRECT_MODE() helper to automatically release direct
>> mode.
>>=20
>> Reviewed-by: David Lechner <dlechner@baylibre.com>
>> Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> Given sparse doesn't play well with this stuff, this is (I think) more or=
 less expected.
> drivers/iio/light/vcnl4000.c: note: in included file (through include/lin=
ux/iio/buffer.h):                                                          =
               =20
> ./include/linux/iio/iio.h:687:20: warning: context imbalance in 'vcnl4010=
_read_raw' - different lock contexts for basic block                       =
               =20
> ./include/linux/iio/iio.h:687:20: warning: context imbalance in 'vcnl4010=
_write_raw' - different lock contexts for basic block                      =
               =20
> ./include/linux/iio/iio.h:687:20: warning: context imbalance in 'vcnl4010=
_config_threshold' - different lock contexts for basic block  =20
>
> Hopefully it will one day catch up or we'll move to an alternative for lo=
ck checking.

Yep, sadly it's to be expected when using cleanup.h stuff.

>
> J

--=20
Thanks,
 ~ Kurt
