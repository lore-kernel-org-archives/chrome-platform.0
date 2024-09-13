Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CF813CF86
	for <chrome-platform@lists.linux.dev>; Fri, 13 Sep 2024 21:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726261514; cv=none; b=C4ea2E6DjZ6mPUDYSOnCZtZGCYNMFbuViXeGfPf5k1sV+rMg8oehcImwqyNGdbkWDRaZSYkwlyIOPfmE4BZd1vqKo7jGUHRXPnCOcPAr3X7NGTztbKCr5cIL42wR1xBHB9NK3VI/jCsG1NLZyMwKZJgSjGGl2j5pyOBqHHLApss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726261514; c=relaxed/simple;
	bh=Y5vaHHHX9R/doH4SFIBNsgP0FRw42PlBP15OcUVBXmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lx6V2Z16dYaQHe30gHbI+RLv1aDbTYs4QvCizhju+jQMl8Dyogjx4W9X9th19J4m9ksc9CwVIbFSmSI8vUICklxGjU21IN38I0hKeEdbu3E9NfiJKpoRshoi3OvbCqDoMVwgJEZ9vWNC+MAWdcXAF5SnYWFSpmksCaDbxv+W1Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ogJp2wOt; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ogJp2wOt"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4582fa01090so77741cf.0
        for <chrome-platform@lists.linux.dev>; Fri, 13 Sep 2024 14:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726261511; x=1726866311; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1BcM4lFpbGajeTbbT/mhOoL1c44seTsAjZcdL46W1OY=;
        b=ogJp2wOtrgnBjAXUgpxMlredFL/mOSUAbKEnoz7PUjMNvQZPOEimOYU6nl2SFMq/tZ
         QlX6GS8LA5fg7uG2fkOPMPchzVbzquYu1VU5isN+ktWQCPz70qw77t8K0v/uyt7So7qG
         O0b4B7IA68gVxNuSlCYL3GVPwqjV1m3G7nlVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726261511; x=1726866311;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1BcM4lFpbGajeTbbT/mhOoL1c44seTsAjZcdL46W1OY=;
        b=bZlSUEjTHA7Q3nBzsBo/mLtlNdXLbAfCFS9jJ3zQcoQ0wDdGMNCtodoOA4iUJRWpto
         Y9QAiX27r8jdHmUk5C4NtJduVWpFu/+ajhyzqwj0n0DEsPQ/YBz11wZ5KoBaK22Hprto
         VJdQo7rrnlk21yJbmjYKxBw9yPy+An6YbAqKltbzQMp9sywmKgE4i/z9PB9stZIjDx8v
         qnBp8eZfLcQnaOOaeOVwv22+fQrovmHHj+9DwFVBAstyhjiBFtgBZ5SbAsl5uMXs+394
         j5Z5YY0wPVvxb8W+UWdMrZsnA5XLoK4ZiGOPF6LanELBQaWXFvLLKwZkdAYbm2zicFE9
         GJYw==
X-Forwarded-Encrypted: i=1; AJvYcCVdRMuPLXri4B5UGlphjS+lHzruawfundZVUknV4hUCNyKUKWSWYIgaybpqfuCvFXFv495THC/DV99j3uXu3Z0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3Mk+xeA3wffvezfSmLzC0B2ddkXEE03l+A31A1x3LgyUN76Vy
	wqPAwqEo1SeVUNjDr3LB0s11hra85tE484Tq3uGK8s+V+qzgpV0FnZ08Bc7v7/ba7k3uZMlb2Pf
	O9io9ghAbWU2cEihppn9/t/tvKwnYMTmiMejT
X-Google-Smtp-Source: AGHT+IFNRp9kjdF5lPJBN4P/u35hlTu6w+0QAcj6x9ZSyI0WuN2oPGU/zG4A4BHZew+CcsGHtVNi4SatFGwQfWsqIMc=
X-Received: by 2002:ac8:7e8f:0:b0:453:56d3:d155 with SMTP id
 d75a77b69052e-4586079ad25mr7773551cf.8.1726261511093; Fri, 13 Sep 2024
 14:05:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240913191428.1539653-1-javierm@redhat.com>
In-Reply-To: <20240913191428.1539653-1-javierm@redhat.com>
From: Julius Werner <jwerner@chromium.org>
Date: Fri, 13 Sep 2024 14:04:55 -0700
Message-ID: <CAODwPW8nEkc=x+BeSajfMVjXzET_0G3h-xFMnbUaE8Lgi-173Q@mail.gmail.com>
Subject: Re: [PATCH v2] firmware: coreboot: Don't register a pdev if
 screen_info data is present
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	Hugues Bruant <hugues.bruant@gmail.com>, Julius Werner <jwerner@chromium.org>, 
	Brian Norris <briannorris@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Borislav Petkov <bp@alien8.de>, Tzung-Bi Shih <tzungbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> +       /*
> +        * On Coreboot systems, the advertised LB_TAG_FRAMEBUFFER entry
> +        * in the Coreboot table should only be used if the payload did
> +        * not pass a framebuffer information to the Linux kernel.

nit: The official brand spelling is "coreboot", always lowercase (even
at the start of a sentence). Not a big deal though.

Reviewed-by: Julius Werner <jwerner@chromium.org>
