Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69E8353A90
	for <chrome-platform@lists.linux.dev>; Mon, 17 Aug 2026 21:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787002478; cv=pass; b=ccGcpx6BBzOuexdRLL3hhXmqFvPf6BEwsF2Mu/8U5+jpcq06Z8JfbGudZhxZaIMfsMy24JDdCWgCGrI4Xohd0n2j7sqRrAftoO0blY0lP0S7APV+Af29qXIYsQX8CnUAMafe8o38NJ2CiFDkkm5RYoTo631mc38oZC5iYW4QCfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787002478; c=relaxed/simple;
	bh=epwU7jREk7vRi+ttZATQY88mwFXUAqQ//0r/cT3c4p8=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZpokWVIOZoDzHhtdeW6+R3Rw5P65gD2iLjIgO7L5pbMA2VSOxqa4ATSODryXJsfaWIPBohzEqb/UN0qIPQUXFQvOfpkqTFzcvz5zuFxrF0H3zvnaEWCWlQ0G5wNN3tbtA+eU2Y+5Zwf2QlRHgPAbIkET+I6QwuSsjCdm8X+epNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=FhJI86cn; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="FhJI86cn"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66c9995ca60so490913d50.1
        for <chrome-platform@lists.linux.dev>; Mon, 17 Aug 2026 14:34:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787002472; cv=none;
        d=google.com; s=arc-20260327;
        b=oyofLnTluVF19kv/wCUjYFfUxZKQHyKaT8YiSyyd5VuTfQaiztocB3J+JiG0783wyf
         MxNLGhL9sjoRW/yl7xIFFdrkQ/PERzqFKp3ZHb5/GRvwhJh4xk6lqvNsm7YOOtFfRDNy
         BlLNuZLHoWLkQYut7E3sdgGvba2OFwwZZPJz0ANCpWG7LvcqggUpphUOg4tBNJW/d2Ch
         LR/RdPfjek80Ty9KcqOk87SXX8zguh8Vpv9L/70HLzA/vwv5niAd8F3UA58Pf0XuIjAx
         oTxWkiIy0yfiW9pko+umXJfKIvotiMcovD/7MDv/9nWSyE8R7TRlIiJa6pRlwqc1fLII
         YR8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=epwU7jREk7vRi+ttZATQY88mwFXUAqQ//0r/cT3c4p8=;
        fh=QXk9vKEZPRp6ajGaPeXPYkBRjBwj/BlEtQF77F5bbdQ=;
        b=Zhbc+T8dlNVCidvuMIVbXLmxhCVO53hzzke4TYsmTR6ceHPxAWqKuJLBUc3P4MSp/6
         Flpj2stSOZVEX5W7q6ecP94VGfAPpCv0yFLr8nVBH3jbMFtEFR1VwiG7IcrGdXNDduU3
         Nm6ByvOpY34fay4PkxWNvkr0uAHiXw6DQzcqeZsNhQALSnBnaza5b2RGNj3QhcZpFJjV
         Ojuas5x0jvEW7mINu2DseEm8cLwkxpftUFcCK6aJak0E5JO7hghVOydjguawcx2LXDdj
         BitXjHFUJWxyglBoAG5kMVUt61yG4EbBE12N2LbENkJ0OTgKw/VcU5CVTq4+NHL4q5po
         GkZg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1787002472; x=1787607272; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=epwU7jREk7vRi+ttZATQY88mwFXUAqQ//0r/cT3c4p8=;
        b=FhJI86cnRKofu0c7dwSaGPvk6Bh3gxBh3XjQpZ/knJPbpw03AXwntHTSo9V6ZJZwIm
         sAUgyiCVsdlUUkXdGAjGk/ZPELV30XGcJGNpVv/qe2S/B7Qu4A1/Zu3Kf8p74Qal3ZUJ
         wuXTjkx0OyNshhSJkzkMLEtg0gedJoVU0dv4smhodkwunp62FKWS9S0OFgb8SV4CKxz7
         17n4XXARpniZqus90BbtLcJKck3UWuWgabu3cjzuEGLEG8U/uXO3BfgnprB8la0tFdIi
         mtXp7YvOxQukWH+3IT/IkyMfGtxBodUWqEa7wOmnLsLc4lzHQM2wlVwA1cXq9mhzxDBZ
         I3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787002472; x=1787607272;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=epwU7jREk7vRi+ttZATQY88mwFXUAqQ//0r/cT3c4p8=;
        b=MUaB+EgFGMH/FgW4xGG1BUwoJSfnAuZTw28obNB4AlIoAxraPAYTF284izrCxSpEgp
         aKgHVh5yGfoAiNpjbdzeG3Kym9+MVEa8bpuB4C8A3Qjj0s5LKYs4oEUr2AXJYZ4w6mUU
         xXbXVy7Q00+DHrPR+OWGrI5DNiikCUpM9oZSIF/IQRfeEjw2W6DkqMvbt/jEYwMhkbL/
         2S2imxbqT77Cjli5xNDORqVqwtygkJ1+0fKB0f6kIpj3L/rQBTrtO/tryj5IeRf0X8fD
         f2v/N+8Rkj2TXoavNyaIyzXyMq5+c5S0lhX5+qbPQTKO81+FcSg/9l3qOSNxyzKDWOez
         Rteg==
X-Gm-Message-State: AOJu0Yx4otXad8bHVXZFQDVj8o/AXKsCEOnYf5mcvCSVXKU45hlRjwbo
	az1OkIz5yfXRsnj14v2jOHj0jjH15/hqDL+pWb4JX2FzclHslFxBvMKxU9O04o15+3WD9c8I7U0
	lIq9QCCAvDMLfOB/vab7jMXNP+xwc+06nQ+o1OMKEoyeTzFrSWftifg==
X-Gm-Gg: AR+sD10WHwhWHo4VtIyJ++m0NVK9c3sMB5JGaHiVsTyhTSGYNIKONk8WCziSPVuMTiG
	cTGFJW6nrR2FEKu40sQOcICCEw6+3Pd0QRAbz289x2SUpwCOnoUmICR5rIZjgs7S3ypRQd7MEzN
	RlRhxb1wYWuMf/aoflmX9ksiqXDE+FPfUg/OlGcMkKv7x7Rd0DPV6hDFBFmSWaFDJZgClpq1hYl
	Qu6r+CZuSpOtDFxIwqxyCKeKniAwy8Wv6v5KJiqyW9IzHMT8JctN2A1OBmWf80chJGJVUO1U79B
	4lS7vdyiBYKl12IPOqZgXnlQY0iNCGNcOH1JY9ZLAHxC5WDQxKUduELy9ykwPfXd+3L3Gu0M
X-Received: by 2002:a53:4903:0:b0:66c:72e8:c224 with SMTP id
 956f58d0204a3-66cbc0dc3e3mr563068d50.5.1787002472110; Mon, 17 Aug 2026
 14:34:32 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 17 Aug 2026 14:34:31 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 17 Aug 2026 14:34:31 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CABtds-0YAuFxEOUREOCOB2HErVp8h+dkhMwTj2ZrQqh_dGHMTw@mail.gmail.com>
References: <CABtds-0YAuFxEOUREOCOB2HErVp8h+dkhMwTj2ZrQqh_dGHMTw@mail.gmail.com>
From: Sean Rhodes <sean@starlabs.systems>
Date: Mon, 17 Aug 2026 14:34:31 -0700
X-Gm-Features: AcwNN1WvdC1G44iZL28Kx9gAhqGc2MgHY5_ATU13fLffGtrrj5IDQreS1lxgkL8
Message-ID: <CABtds-3HCx6Z5whZ+T5F=5CwxkcKze-WhS_t3qA3Bmy99i79Jg@mail.gmail.com>
Subject: Re: [PATCH v13 0/5] coreboot CFR firmware attributes
To: chrome-platform@lists.linux.dev
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, prasanth.ksr@dell.com, 
	jorge.lopez2@hp.com, mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, 
	josh@joshuagrisham.com, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	florian.fainelli@broadcom.com, chenhuacai@kernel.org, mst@redhat.com, 
	wenst@chromium.org, tzungbi@kernel.org, briannorris@chromium.org, 
	jwerner@chromium.org, tzimmermann@suse.de, javierm@redhat.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
	simona@ffwll.ch, krzysztof.kozlowski@oss.qualcomm.com, andersson@kernel.org, 
	geert@linux-m68k.org, dmitry.baryshkov@oss.qualcomm.com, arnd@arndb.de, 
	ebiggers@kernel.org, luca.weiss@fairphone.com, michal.simek@amd.com, 
	sven@kernel.org, u.kleine-koenig@baylibre.com, bhelgaas@google.com, 
	dakr@kernel.org, o-takashi@sakamocchi.jp, titouan.ameline@gmail.com, 
	kees@kernel.org, dri-devel@lists.freedesktop.org, oliver@liuxiaozhen.dev
Content-Type: text/plain; charset="UTF-8"

Please ignore this v13 thread. The send path corrupted several inline
patch bodies.

I will resend the same patch content as [PATCH v13 RESEND] once I have
a working patch-safe SMTP path.
