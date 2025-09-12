Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468752D7DD1
	for <chrome-platform@lists.linux.dev>; Fri, 12 Sep 2025 09:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757669066; cv=none; b=bfxySHvArKvqNzhQ/xde3FrCq3rN+ahNPHkcOoyF0Ju0aC+zUNXJEwCQ5yvTI+gQrIrKn212Ml0saiXhCWk0okTa/+XJyaA8+h1sjvaa8k5RgcGNS+pMEYA1kDn8z61HvP2Rkv5pj4y75fMOcSTCisXYGYm/0nQYrNLmXZhhYCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757669066; c=relaxed/simple;
	bh=zZ3EdgDqG32koRVEzkCdU26BudT4DPvEmFEKbPHfTpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dobfl/sSKp6E4T/9s/2NQgrPB14M5Ia7vFO7BAw+7Z1ofpvjlCxydi6DE/A8wt8Tzg2IttfNJvS5yo1pYyr3OaJPV/84o5xHrQyYpeJkmfNeRXvGE7/SmOidDJc3qPOYeTXqC292J7j3AaVWy/TsdE8uZt5T727X4cm7zPYodf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r2ApLPGM; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r2ApLPGM"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aff0775410eso469721766b.0
        for <chrome-platform@lists.linux.dev>; Fri, 12 Sep 2025 02:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757669062; x=1758273862; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ejOVXapMEGWfb71MDH1k0hVwflqRG+5TP6RxYPYRsR4=;
        b=r2ApLPGMdQ/Mz3v77C3z7opLj6m4/z0GK0KJjQabc6AzYbOCaES4FHScW+LQzCUD2k
         RU+DhusCjOQIyvM9S2BkWcoUp2RitTmz7AELTo0gK+HBH5rfkcy9gJIL1HKwi6qeyC4p
         UJoKxm7i/gfX5m1tpZAUD0F2imBQMeBZ6HPomNfZ+PlT7mgej6k1ok6ykNn/pcm6WhNU
         Bhc8qxtFGE2N2SOZvRBK//bKGwHEiPhy+0r9FOK3WiVguohQcdZEWBbsLJ1YqvnZaQi7
         Ia/dXM8dggl5ibsDeF4bUPZwd0c6wIoxKUJ8Aqhz8Sa/ow8Ke4OPIbRQPn9wM59mk3UR
         pfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757669062; x=1758273862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejOVXapMEGWfb71MDH1k0hVwflqRG+5TP6RxYPYRsR4=;
        b=CT6wab45FVUO0y6FihQyhtBu7Tj/mKdXMGmG/WkKKM3mZmOiU6rXeVomwvAMHjqffG
         b2CI8eXQFsgFfAznD6pAVJdYHQJws+DgiKxwePffpXRTHUkZhcANRbR9XWCBMh/WUD5C
         KWYaS7b6oLgocPi+aGFi7tdLCmspQ2OSihJqbHRF5T9A9B/tGv7pgYPmqARgSSj69Vva
         4yQQS6fr5+nJRfWcqFrfZmPYbAMmE8Ay9R6AKgaWHsiGleLMhlYxcVgtt4ymMYA9RXDa
         wolWWZxAykGdWA1rOLE5t4W3yaTqPmPLDiLcCCjoSDNZCcAaCshe664BUhB6a6scWOmr
         hwmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP4frg3aaOqGADyFba2M7coO3aZHIeh157rH2i6jzde2TkFdiZw2/VhiiCz9jxRbQFnUEU0kAZo/D7CHxoEh4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhyW52ef7SuUQH6Zxyj7P23dB9aKjUBuJP2+8PIM10t09gYYsp
	DBsl48fse5SYHadrf0ssP8xjj+QOkIbnTg4K/19n3CQ0ri38f4CEI5NyyY2Lf2EVEYCwpkiPj6v
	ap+/6hDIUp//X9ACAmbnLRQwZLwPIZ5kYIk6fFhYmPg==
X-Gm-Gg: ASbGncue1NKu0Ih43k/ItJmUh+WoI36pCNxXueuA50jw/XV+C0gd8wJPG+wolbBgvsz
	teerSLJUSDrurxAHfJTziFEfyedevqF3P+/BiVYNmi0TmPY+Ftff5DHd3yT1GJyKxyVlIecYp4Z
	LQRCbVhug1hiw8rFRo9+SUDk/piL51Em+zBCGKc/L3/z094kiSIz/qK6+gEVbrxdZOQ6vdCLZOW
	JOySjW+D6DunqdqMQMtcL62Rou7n9B0qBj7QYeV6uyH2SzV
X-Google-Smtp-Source: AGHT+IEG7d2O5fuiKOqLaxk4wNWtHu8A08plk+DQOGkfs2DJxQxya6tEWqjjc+qZvluiPc70wIKTosdznqW6MDbVNpE=
X-Received: by 2002:a17:907:96a4:b0:b04:25e6:2dc2 with SMTP id
 a640c23a62f3a-b07c254393cmr229565966b.22.1757669062471; Fri, 12 Sep 2025
 02:24:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250912081718.3827390-1-tzungbi@kernel.org> <2033c6cd-4112-4c8a-a9ef-2ab34f3504b8@kernel.org>
In-Reply-To: <2033c6cd-4112-4c8a-a9ef-2ab34f3504b8@kernel.org>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Fri, 12 Sep 2025 11:24:10 +0200
X-Gm-Features: Ac12FXwlBWZ3wqZGCB6PrzXYD4LYlvvCAzsc1bzxtVBUhf_RXrToQWQG2Wcs3jw
Message-ID: <CACMJSeuKH+WKOXLNU92dMssqhK02xG3z=cT0VeXYM+ZGuPCB9g@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] platform/chrome: Fix a possible UAF via revocable
To: Krzysztof Kozlowski <krzk@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Dawid Niedzwiecki <dawidn@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Sept 2025 at 11:09, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 12/09/2025 10:17, Tzung-Bi Shih wrote:
> > This is a follow-up series of [1].  It tries to fix a possible UAF in the
> > fops of cros_ec_chardev after the underlying protocol device has gone by
> > using revocable.
> >
> > The 1st patch introduces the revocable which is an implementation of ideas
> > from the talk [2].
> >
> > The 2nd and 3rd patches add test cases for revocable in Kunit and selftest.
> >
> > The 4th patch converts existing protocol devices to resource providers
> > of cros_ec_device.
> >
> > The 5th patch converts cros_ec_chardev to a resource consumer of
> > cros_ec_device to fix the UAF.
> >
> > [1] https://lore.kernel.org/chrome-platform/20250721044456.2736300-6-tzungbi@kernel.org/
> > [2] https://lpc.events/event/17/contributions/1627/
> >
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Thanks for the work. Just a note, please start using b4, so above Cc
> will be propagated to all patches. Folks above received only the cover
> letter...
>

Thanks to Krzysztof for making me aware of this. Could you please Cc
my brgl@bgdev.pl address on the next iteration.

I haven't looked into the details yet but the small size of the first
patch strikes me as odd. The similar changes I did for GPIO were quite
big and they were designed just for a single sub-system.

During the talk you reference, after I suggested a library like this,
Greg KH can be heard saying: do this for two big subsystems so that
you're sure it's a generic solution. Here you're only using it in a
single driver which makes me wonder if we can actually use it to
improve bigger offenders, like for example I2C, or even replace the
custom, SRCU-based solution in GPIO we have now. Have you considered
at least doing a PoC in a wider kernel framework?

Just my two cents.

Bartosz
