Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AEF1DEFE7
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jan 2025 18:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736189014; cv=none; b=eEWKEg03yqs0uT5H1fQrsbaWR9SdOUzxmg5y9NPbIKRnW32uBr+ocRt23DAu93y0kV1rIvp/KM5/u1sk1+izznFWJhphHLg4gw2Mvi8JXlZrnnMoUMFYnW71YqHVA88mFZzIumZq9CIs2Ri4RsVFve/WaG9dnji6Z0mL22N9V4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736189014; c=relaxed/simple;
	bh=7aN90AR7PqYNg8bBc3NK4O2h76WvLMYAbDuqAU8+OWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OapJc6rdSS+YkipH0vLzT46zEgFCH0w/iEAsTxuqxVOrC24ksexmUljXGiMFGnNS6AaHvP8lQewCa8kfJCXgFibNlPsWJTn9OGdJuBmL0t4G6x/1aDjxW5/k6nGIXxImMuc4KI49ySRAMmB+4m7m6hkywsLhMzK38Fk6Rb9SItU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=axrj0h3C; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="axrj0h3C"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-51640f7bbd3so4504393e0c.2
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jan 2025 10:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736189012; x=1736793812; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81ZFvMgCvonNvOa7sNa0pgwWruFLmxxFAQesD1YVwY4=;
        b=axrj0h3CagI9lhHuaIG5VEZ0a50W1lRctxv9/w8bSwTJ6KpF5gP0I9RwNGPo5P8Zc/
         waWMAGCHisqgpsfSAJJG35OOnI8+fEttARprUyQ0ic9yWlE2eN4achzVQCn3DeF3bj0L
         dqq+Q3wagWh1LUpEqgK+x5m1JUNPNPwueAnus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736189012; x=1736793812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81ZFvMgCvonNvOa7sNa0pgwWruFLmxxFAQesD1YVwY4=;
        b=F5ZUF2HbY2r088OzVbUdO8pdN8ICLhXTvUsHiVUZUAjtJD6zHMAPz8q6+3AFKPoBDw
         KVn+yCm+HSnoM2xU8KA/7vX6oM/XunB5NibgbZHFFEF4u/qVqm+MMl3kC2lDMHi4v+EY
         EojbJVk470JrPTreD8vVrQTZIA42/ApPzOkSz9ZlMd4CHoko0Nvfg7wLMjpaugXNZGZx
         MZqnFqKW4GUeZGxRyBe7vrKoHcInhZivVT7/+eVqL6yV9qo+droHUJYZK5OMI0fH/yrT
         Q6KmR/t0h51ynxDRjCeR5fIszn1rR7Ax3uvaWkN381RDcNv+PKxs3Qfci21il0sVfpL7
         MixQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzaJ+FH3AibiuGB3pUHQIWEAEkfOyB7zbj/ReJ6zk4pWxiZ0nh59IeWzMKap77lZfkY5BGEKzGklfh+sT7ONo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxnJtH1q0bl9OM5QCuieeXis4UBcj2RskXfoVOOwN5q9pDAvQUB
	P3hXMcASJxTfd9vswcA2OE7M4UNC6eXlMYjQYDqFqrM1MgC3LtziPEk8anw64Fxy7gQziVA9Wxp
	NpzQs5VX61SyLBn/O0r9qbNLAk9ZnGniKSTf+
X-Gm-Gg: ASbGnctwMoDjCbs+eFGbnOF0CuLzQKwNY0s3roKoIZSF8x2Nn6QIAT5RUUg0rQVev9o
	99MrI8LcGpjtvX/DQ8HslFhdZQqAkRhEZCyy3LmkJo0rAb4D+JGamQNLwcz7iJlkicqD++Kk=
X-Google-Smtp-Source: AGHT+IHk98Kf7OM+ZBtDPuup4OOy0upl2rnDixUREr43ZTUaabOIIjtlaFd/yhcsCMWeQUv7LYZQFV7Kq2SJw9Avw3o=
X-Received: by 2002:a05:6122:4891:b0:518:7ab7:afbc with SMTP id
 71dfb90a1353d-51b75d3f1a1mr41957018e0c.7.1736189011943; Mon, 06 Jan 2025
 10:43:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241231131047.1757434-2-ukaszb@chromium.org> <20250103233407.4001046-1-gwendal@chromium.org>
 <2025010438-canopener-renounce-4a28@gregkh>
In-Reply-To: <2025010438-canopener-renounce-4a28@gregkh>
From: Gwendal Grignou <gwendal@chromium.org>
Date: Mon, 6 Jan 2025 10:43:20 -0800
Message-ID: <CAPUE2usEN1OZ-=A19PH2yx3tCM1aNnXqNZt3stvgWZod7GxW=w@mail.gmail.com>
Subject: Re: [PATCH] driver/platform/chrome: Update cros_ec_trace with new
 USCI commands
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ukaszb@chromium.org, abhishekpandit@chromium.org, bleung@chromium.org, 
	chrome-platform@lists.linux.dev, dmitry.baryshkov@linaro.org, 
	heikki.krogerus@linux.intel.com, jthies@google.com, linux-usb@vger.kernel.org, 
	pholla@chromium.org, tzungbi@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 4, 2025 at 12:13=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Fri, Jan 03, 2025 at 03:34:07PM -0800, Gwendal Grignou wrote:
> > Add this patch to "platform/chrome: Update ChromeOS EC header for UCSI"
>
> I do not understand this changelog text, sorry.  How can you "add"
> something to an existing change?
>
> > to add the new commands form cros_ec_commands.h in the tracer so that
> > they are nicely decoded. Enable the tracer with:
> > cd /sys/kernel/debug/tracing
> > echo 1 > events/cros_ec/enable
> > echo 1 > tracing_on
> > cat trace_pipe
>
> We don't need to document how to enable a tracepoint here in the
> changelog, right?  That's going to get lost and why is this new one
> somehow special?
>
> confused,
Sorry, I did not use `git send-email` appropriately: the code snippet
inside the email was not meant to be a standalone patch, but to be
added to patch v12 1/2 "platform/chrome: Update ChromeOS EC header for
UCSI".
If this is too late, that's fine; I will send a proper kernel patch
through the chrome-platform@lists.linux.dev mailing list.

Gwendal.
>
> greg k-h
