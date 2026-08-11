Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C024A35F60A
	for <chrome-platform@lists.linux.dev>; Tue, 11 Aug 2026 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786474375; cv=none; b=n0RbZJwQ6/Si7BYnIyTfMO3Dy9meQMmieS3GV1ib8Y6hQ+b99k7bjCSI6QODQZRGm1gOHNtjNBS5F719Z0mpaFLRz0VciKpBjSFOhA/z0X0oX5YIQgqFoiTsdmxfyilFNGCEt2EnDoJGxaE77izPv+SKygrpse1qvEikv7FfMLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786474375; c=relaxed/simple;
	bh=JR5HHb27zLtgTE3jEjvE5O4QP0G2THjkTCSY0L3E8eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFNUtJgjW8DgGXFmN4ZLi/A5USEZp8gCdjBLafxxSBpS5PSFAizhkhraUJtajEpzIQKDuNc9stkrcicyvpPUC9e+D2O633YqCb4Ulwb217pBdF7s3wjBUA7Iz/RhrIpsKVCsQM+V/x13x3j6qaoKtcf02un7NgCAZzcx1TQZRC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fV+waVaf; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fV+waVaf"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbee3777e1cso77542a12.3
        for <chrome-platform@lists.linux.dev>; Tue, 11 Aug 2026 11:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786474373; x=1787079173; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/A62uLpxfiS9evE/MOrYEJH336pQ9QO0r0n78qP4dLA=;
        b=fV+waVaf1ORtB4cwWJfGaIoascJhLgT+4DSE6F4AwblCp+o0O/2lLiCFus8WxLBMRe
         M6bg/sDanbMntWLhGexiBFFTVSZq/m/JgJTZhP96Kqdeex8tVIPIcPW7BlAp8DCCkr9K
         PMRroStpqSqyFcKdAtxMU74MDOi246Td+pTjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786474373; x=1787079173;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/A62uLpxfiS9evE/MOrYEJH336pQ9QO0r0n78qP4dLA=;
        b=q4qfDveBuoH83fbeI4XwNuCD+PS5Pv8S2BwbuvG1SO8tHw4LUAxi7OlpI+AigGwJD3
         5hW2tWtjgJbYMSLpUPB06q5Hueuyw3zC82T4tgmiQ8omhiQJ2+MNFNAEGN6qU8h9g0/e
         kVVlsQ4MNeToYkXDg5E6RtEmbIpMZZx0wKCg3K5nxonRwdSTHXcvlvryXsH+eFa+xs7P
         fXxODfXVpPQg2O4ssS8JphO+8vTFh/x2WiM3CiA7l5waXEdtnrTX/m/U4kEK6x9ByJyX
         CFqm0JNvYt7L1rc8sRoOt1apQWCgStC1kJBjKmk/MVmzR0fYe0jXy9hADE1i2GHUccIS
         kfsA==
X-Gm-Message-State: AOJu0YynQslg2NqybS4gHrskc73psx2swaE/HRvXWkLVYSO8iPtfMO6T
	GrU/oluJ9SzPzp1+OjbbBGjHekJrkmhgYd3OQeOPiJkFFEzvr7RCIrZUWX9Z/cxzjg==
X-Gm-Gg: AR+sD110r7Q0SPb4QCT5dDDl0iMqlyjYyKV7YwOAVMWXLyBmHIGF++HhGKt5TvA6jCK
	asyvUpbkkwqhx4aR9f0xLuUusBtZ/OHOuXjoKy/QIKt0XrD+IOWxNhsk2mbOVd/6Q3RwGZ29Qqi
	BUzeFZub2tJXHrFB0J7sTP6kmFM84P+Y5MWG7510lrPNO5zTm+k7knjbBHYc5eRatA1o9FTCwSV
	vgiKzkomQmY0Ug3uzuoleJn1qeCYtB3gwbEOs4hMkhRp/YwbgUQgWwaIjpGIE1ezLgI4r0rU7Ch
	w2D7+n2ChOuXOEZHCY11lNozjMdXoAE66zn/RF7LnOHdth6E8MZfYVi5ArewMHvhMKpJBNHRJhm
	ILnhgAlJk8x9/wFaQ/IR1MeKm+c1/Xpvbcg1EX1JucsI/H3wMz2eCGJOydvlgtEEYLMHSZ5gyRN
	XAG1c5UOfLEvEUKkSTfo+QW9yKDPk41eOPvrBuOuwwnOKxKOzFdgr7ICiMD3sD6RD5HIWZG3r3c
	pZ9r7ven1W87WtPZ9HUT6b+gVs=
X-Received: by 2002:a05:6a21:699:b0:3c4:396d:4a7f with SMTP id adf61e73a8af0-3cc2ba20ae3mr7611480637.15.1786474373068;
        Tue, 11 Aug 2026 11:52:53 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:79fa:d268:80cb:4947])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-31cf6d7a3c7sm2872543eec.29.2026.08.11.11.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 11:52:52 -0700 (PDT)
Date: Tue, 11 Aug 2026 11:52:49 -0700
From: Brian Norris <briannorris@chromium.org>
To: Sean Rhodes <sean@starlabs.systems>
Cc: chrome-platform@lists.linux.dev, corentin.chary@gmail.com,
	luke@ljones.dev, denis.benato@linux.dev, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com, prasanth.ksr@dell.com,
	jorge.lopez2@hp.com, mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com, josh@joshuagrisham.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com, florian.fainelli@broadcom.com,
	chenhuacai@kernel.org, mst@redhat.com, wenst@chromium.org,
	tzungbi@kernel.org, jwerner@chromium.org, tzimmermann@suse.de,
	javierm@redhat.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
	krzysztof.kozlowski@oss.qualcomm.com, andersson@kernel.org,
	geert@linux-m68k.org, dmitry.baryshkov@oss.qualcomm.com,
	arnd@arndb.de, ebiggers@kernel.org, luca.weiss@fairphone.com,
	michal.simek@amd.com, sven@kernel.org, u.kleine-koenig@baylibre.com,
	bhelgaas@google.com, dakr@kernel.org, o-takashi@sakamocchi.jp,
	titouan.ameline@gmail.com, kees@kernel.org,
	dri-devel@lists.freedesktop.org, oliver@liuxiaozhen.dev
Subject: Re: [PATCH v12 3/4] firmware: Rename google firmware directory to
 coreboot
Message-ID: <antvgf6pF8JbW9BA@google.com>
References: <CABtds-3MAA8y5ksGcps6s-iLx8dOF7EoJEJH9079Y_E+-bJB4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABtds-3MAA8y5ksGcps6s-iLx8dOF7EoJEJH9079Y_E+-bJB4A@mail.gmail.com>

Hi Sean,

On Thu, Aug 06, 2026 at 01:28:26PM -0700, Sean Rhodes wrote:
> Most drivers in drivers/firmware/google are coreboot table drivers rather
> than Google-specific firmware drivers. Rename the directory to coreboot
> and update the Kconfig prompt, build path and maintainer entry.
> 
> Keep the existing CONFIG_GOOGLE_* symbols to avoid user configuration
> churn in this mechanical move.
> 
> Signed-off-by: Sean Rhodes <sean@starlabs.systems>
> ---
>  MAINTAINERS                                                 | 4 ++--
>  drivers/firmware/Kconfig                                    | 2 +-
>  drivers/firmware/Makefile                                   | 2 +-
>  drivers/firmware/{google => coreboot}/Kconfig               | 6 +++---
>  drivers/firmware/{google => coreboot}/Makefile              | 0
>  drivers/firmware/{google => coreboot}/cbmem.c               | 0
>  drivers/firmware/{google => coreboot}/coreboot_table.c      | 0
>  drivers/firmware/{google => coreboot}/coreboot_table.h      | 0
>  .../firmware/{google => coreboot}/framebuffer-coreboot.c    | 0
>  drivers/firmware/{google => coreboot}/gsmi.c                | 0
>  drivers/firmware/{google => coreboot}/memconsole-coreboot.c | 0
>  .../firmware/{google => coreboot}/memconsole-x86-legacy.c   | 0
>  drivers/firmware/{google => coreboot}/memconsole.c          | 0
>  drivers/firmware/{google => coreboot}/memconsole.h          | 6 +++---
>  drivers/firmware/{google => coreboot}/vpd.c                 | 0
>  drivers/firmware/{google => coreboot}/vpd_decode.c          | 0
>  drivers/firmware/{google => coreboot}/vpd_decode.h          | 0
>  17 files changed, 10 insertions(+), 10 deletions(-)
>  rename drivers/firmware/{google => coreboot}/Kconfig (94%)
>  rename drivers/firmware/{google => coreboot}/Makefile (100%)
>  rename drivers/firmware/{google => coreboot}/cbmem.c (100%)
>  rename drivers/firmware/{google => coreboot}/coreboot_table.c (100%)
>  rename drivers/firmware/{google => coreboot}/coreboot_table.h (100%)
>  rename drivers/firmware/{google => coreboot}/framebuffer-coreboot.c (100%)
>  rename drivers/firmware/{google => coreboot}/gsmi.c (100%)
>  rename drivers/firmware/{google => coreboot}/memconsole-coreboot.c (100%)
>  rename drivers/firmware/{google => coreboot}/memconsole-x86-legacy.c (100%)
>  rename drivers/firmware/{google => coreboot}/memconsole.c (100%)
>  rename drivers/firmware/{google => coreboot}/memconsole.h (82%)
>  rename drivers/firmware/{google => coreboot}/vpd.c (100%)
>  rename drivers/firmware/{google => coreboot}/vpd_decode.c (100%)
>  rename drivers/firmware/{google => coreboot}/vpd_decode.h (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e6a8c271e79d..62ddee473f55 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11069,14 +11069,14 @@ S:	Maintained
>  F:	Documentation/networking/device_drivers/ethernet/google/gve.rst
>  F:	drivers/net/ethernet/google
> 
> -GOOGLE FIRMWARE DRIVERS
> +COREBOOT FIRMWARE DRIVERS

I won't weigh in on the Google-to-Coreboot naming, but if you're doing
it...
...this leaves MAINTAINERS sorted incorrectly. You'll need to move this
entry between "CONTROL GROUP ..." and "CORETEMP ...".

>  M:	Tzung-Bi Shih <tzungbi@kernel.org>
>  R:	Brian Norris <briannorris@chromium.org>
>  R:	Julius Werner <jwerner@chromium.org>
>  L:	chrome-platform@lists.linux.dev
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
> -F:	drivers/firmware/google/
> +F:	drivers/firmware/coreboot/
>  F:	include/linux/coreboot.h
> 
>  GOOGLE TENSOR SoC SUPPORT

...

> diff --git a/drivers/firmware/google/Makefile
> b/drivers/firmware/coreboot/Makefile

I think something about how you sent v12 has broken a few things:

 1) some aritificial line-breaks; the above 2 lines should be 1 line.
    This breaks `git am`
 2) the email threading seems missing

v11 and most (all?) previous versions didn't have this problem.

 Brian
