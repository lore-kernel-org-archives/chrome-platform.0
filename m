Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB172DFA31
	for <chrome-platform@lists.linux.dev>; Thu, 12 Jun 2025 22:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749767932; cv=none; b=Dz6umBTRkE4mkY7yh6OsOd23iqLBo36WAtYUF/W2t6QclWu1Em68kF1GpxdbesgXZn4F4fsVQwBjA0TnfzzyoFUPHfsB5sTM4gqnbWVYIK/NMi5GPvgAtRm5b5V77TarTnEHF3n/Ajxyud7ucmsipQisx9PIEvfpk/2MX8f2oqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749767932; c=relaxed/simple;
	bh=qeiCeGRpO0jQPrPrE/YnP8cb+uMMbCIjMfsirNjXYuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpKUkwcI9PG6w/CdlR7HCg5lJccjRDo4VSTJeVbzcO89qWDckoEHSRFdcquVF/epainwa4bLqm8vPeHlHgXlor70SnW+BVBb/06QIKTCChrjadxGkRqJArjMmyziHL6GZfnkhrCYdsEL8tDajSSqCDWcPMc9IGrkt/y+iWEzqiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dON3m1lD; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dON3m1lD"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso1845231b3a.2
        for <chrome-platform@lists.linux.dev>; Thu, 12 Jun 2025 15:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749767930; x=1750372730; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J6Fvf8WT5Rb3cjKjtjxn6WWzjAeKWIIgK6WQmx+5Ghs=;
        b=dON3m1lDYauIPOAVtDVsEFWDwTL8N8IucpTq7eyjpZKtUWSvz96injn7DxCTA5XGT1
         Iwn6Mx1r13u0Ib43eZE+AJY5AexbHR1HWopZMxDL1iPaJucmGvf4ZA44QVtavJpAbcP2
         fEDDK6v2TOg+e149mbYwRj5LQSBXDzuOE6yiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749767930; x=1750372730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6Fvf8WT5Rb3cjKjtjxn6WWzjAeKWIIgK6WQmx+5Ghs=;
        b=MXlEGwnbkn+Qi4CKOQ895tZiwFxuOLp5cBnN7PrdnJhAns1Y7JkefcWCDFWi3UANmu
         tQUd42B537OhFrVHKyR4N6gW97ucElmWUg8qmr6P+hm1lUsCdt2FanhNTmPlFIGkGaqs
         oja+fmkxN0VYPnSV5H5ORKNhANvqhwHxG30yYGQdzG3Jn9z3saSp9EVsuJ7YL3Hjt4wO
         8pHMASASIKh3sie131MCT++V7KvprM4uvEzYlv/xtDoiV1ll7rhpHQ2oNID1l+hRm57g
         H/7SeTROrYquEFQaDP4TVyfWjIfULn6k8vHVSpU68SjscbIaOsagAQPvGk3MDcZCl7dl
         njkg==
X-Forwarded-Encrypted: i=1; AJvYcCV4iymkizEjsKINeIG/8KdueeR9TO5OtDEpPj0Q93h1LQrwpO0LTLzrk274NgpLCjc6VTyAocC6NGFO8y9o9ZY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzeM9Dg/xoo29Gq29TJXwj+4vSTkeMT645/qrrS5fFWHXX9rF+w
	J9oUyYFHPNKKNvvMe4M4XQlIAYS5hQdVAF8Df0GcMxfvFDJgYYQgldluVQ5VkkR/pA==
X-Gm-Gg: ASbGncuc6sANP8SrjlpLG+EyL6gguV5t9TfLGfF9UroGTyvXRyhau1kEPfvDBXo62zN
	QWfSsR2+ZM0/FNiXVc0rR0ITj1IRNSm8UWpHkVyb3s8Xxe2hmtzoSK2WGD3T0ieOgQQGRDE/Md2
	IwcNQp7cpkoeBbUbA/6dgQWvxyVj8iuZifZoh5F0hDb6YtTo9fj4kNt/IXYRIWn27fHmppyXwlF
	PgcV3QA4q02PKIl5L3IfU89PXKx+a4JknEZ2RkCfxXWFQN6/qv3qqE4rT5PfY6E2tmQ+wtKJrzl
	n9q/UMtQ+8N6huLjzM8LJKPEKxwypZu85tkZ0kzXeuduX23Ole/ShQM67k7niIpT6kNjrqJ3HM1
	JswgO7AWqe5PJ4/2Cpqewglof
X-Google-Smtp-Source: AGHT+IHqiaEQ6mdHLqUXXWFR0M3wpvpZgv0dGpw+onPhdrgwOTLTvDPCn76ggFnz9nH3sFK3EQNJbQ==
X-Received: by 2002:a05:6a00:124f:b0:73c:c11:b42e with SMTP id d2e1a72fcca58-7488f71e8d7mr1300715b3a.20.1749767930186;
        Thu, 12 Jun 2025 15:38:50 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:9a04:ac66:831d:e4a6])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74890082b10sm275617b3a.105.2025.06.12.15.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 15:38:49 -0700 (PDT)
Date: Thu, 12 Jun 2025 15:38:47 -0700
From: Brian Norris <briannorris@chromium.org>
To: Michal Gorlas <michal.gorlas@9elements.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Julius Werner <jwerner@chromium.org>, marcello.bauer@9elements.com,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] firmware: coreboot: Linux-owned SMI handler to be
 loaded by coreboot
Message-ID: <aEtW98A2-AHYjySO@google.com>
References: <cover.1749734094.git.michal.gorlas@9elements.com>
 <410d4d62b031d0e751e1933cf746540d5cb1682c.1749734094.git.michal.gorlas@9elements.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <410d4d62b031d0e751e1933cf746540d5cb1682c.1749734094.git.michal.gorlas@9elements.com>

On Thu, Jun 12, 2025 at 04:05:50PM +0200, Michal Gorlas wrote:
> Compiled in similar fashion to the realmode trampolines for x86. Currently
> supported are two SMIs: ACPI enable and disable. After being placed in SMRAM,
> this handler takes over handling of the supported SMIs from coreboot.
> 
> Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
> ---
>  drivers/firmware/google/mm_handler/Makefile   |  51 ++
>  .../firmware/google/mm_handler/handler.lds.S  |  46 ++
>  .../firmware/google/mm_handler/mm_handler.S   | 510 ++++++++++++++++++
>  .../firmware/google/mm_handler/mm_handler.h   |  21 +
>  .../firmware/google/mm_handler/mm_header.S    |  19 +
>  5 files changed, 647 insertions(+)
>  create mode 100644 drivers/firmware/google/mm_handler/Makefile
>  create mode 100644 drivers/firmware/google/mm_handler/handler.lds.S
>  create mode 100644 drivers/firmware/google/mm_handler/mm_handler.S
>  create mode 100644 drivers/firmware/google/mm_handler/mm_handler.h
>  create mode 100644 drivers/firmware/google/mm_handler/mm_header.S

I'm not reviewing most of this patch right now (for one, I don't speak
x86), but for starters, I think you need to add a .gitignore file in
here somewhere. After building your code, I see these untracked files:

	drivers/firmware/google/mm_handler/handler.lds
	drivers/firmware/google/mm_handler/handler.relocs
	drivers/firmware/google/mm_handler/pasyms.h

Brian
