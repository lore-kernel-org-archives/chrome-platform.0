Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF86388E69
	for <chrome-platform@lists.linux.dev>; Tue, 11 Aug 2026 18:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786474214; cv=none; b=fz3GokkVY80jEyZfuP95RA/iRjE8GXAIbP0WDduTMUa3jVx6wPbh07IlM9l3S1dJQhAupIG+4IV1KZfVqLGz6h91aXeAcyOC5T/JZW74rpYvcGdQv8woVM3YC1PqA+bKG70EK6gafwQAxIEcbVjpOTDbV62ByLvhkdxsoyP+OTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786474214; c=relaxed/simple;
	bh=/XndPrnbkW/+T4iyC4fdQzl3+nRdbMmQ10eWKLyZ1V0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NR8ezHxVJfJiFtw/EOfzyJ+Bmw3oPervw52DyLucVhi2S7QR3agzmFdxAtuVDxH+W2jlSlclQEjitdHsxzGrT5u56DD4rbYKvF/3e5imDNbwMhRtFqt+EgJ+N5hgwT0yomCdcLXpzgk2q7sAu/2pqn2E3S/wPNohXzVackzLFk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HtAprtdd; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HtAprtdd"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca80d708489so149687a12.1
        for <chrome-platform@lists.linux.dev>; Tue, 11 Aug 2026 11:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786474212; x=1787079012; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GnHJCm2ZqOWuDJ2d9OnSHmMgxlAtHC/PNWplMTJtneE=;
        b=HtAprtddW8u2Xt3mBZ1KXk4hYpTLYKcFOW7wK760BefA+RRkUS/UCOlo7VVcGdXXMh
         gpT7Pt6KXozTLLi6gFLiOLtCMqKfGsdcTJMyKoU84AnYqjk3wdwcgJ3YXAp+hAcurFTz
         OYi3OLCFUEpFcYwerGqfKNHq27BuT673NDTjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786474212; x=1787079012;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GnHJCm2ZqOWuDJ2d9OnSHmMgxlAtHC/PNWplMTJtneE=;
        b=RsTsV6geZtBIPXLDO63jF/BzXkzmyFNvXE0TNO4/d8NaZoSxqsZMZ6d3cbOkfhR2Cu
         etbWg4FADnax8FkH0MH2TDCUEjamSNj6hyAEtiz4UCJ72fV2JyFws90zcxXE3Mv5jpzp
         m8afpsqgzoS/pG1FCtNGSSbH2sksVwmReiSPyRcBIfKkFB4uJQoxwBg8eGExElQQB0D0
         EEYjK+Htkxui4wdN6ayXL4xoXOn1+cgmR9viLn2UiXl59vctO44LlcGDniWJhQvkBYn0
         7v/sp/XqnDUl6Y9HLwzPNdW5JiMev0OkBk90A4k3aciEA2YeekwryAmMwEyix7ueUHp+
         Jwug==
X-Gm-Message-State: AOJu0YwbhxdnlAwcwJ3JWEwjsAnPkD0/PDc0O1VJLRJ55YPcYuOZ8pNE
	Jfr7uE6Li3ozBPDZ4NLXQDbawtZGUOzHTi91rVDPdHGiE6lcVwSlrH0tXXD9vzVp8g==
X-Gm-Gg: AR+sD10XE043pIVofL/OL0enzFPOiL/yJ3Pv5haMGA/hW1h5HxZr5LxTcK3mYSGUwXO
	Xf15JBE+44MDuDC0eJr6sbdQIJlPmKKIn7nWigI9zehAhGljYxYBdYCju9zOtZKX7kCYYqQie5H
	63/8CRPJfgicrRTDodYBgtqwaYPc95gjbPuUkSp3axg3mCEURL17VPUTJ87biZXaa8it1omESt/
	Oo+p5oif31u+Tcfdgwg30NwB/rXE9BpAkMuOZFdL+1K4HV6Kv5WlHDYqVWW7zBZklNy53OPoDaD
	OPxYhkSVjIRt+Iq+dTJQScpXsV+RdsgJ/9KhRTh+03x/LJS0GEfCxnZFw3vhaWeqYYx3ijYvu1U
	tAgOIy3bEUxTBU4F8KlV1r6QNGdVZggzYqrVQVrMwijWAqIpDaAJvu8/vIrSfhaErG6W7wztqhc
	bgSJJzC8cTgoBmjkaFaug+O/8RQ+lqmD9jYpEZzIZUv8ZWyq1ejTIzrtGmlQN6zHvOE1cx+kqE1
	iBdQJ7UDbZVqCn5GfaNC9kCaWw=
X-Received: by 2002:a05:6a21:3117:b0:3bf:b7e8:68ab with SMTP id adf61e73a8af0-3cc377db1cemr3285344637.2.1786474211555;
        Tue, 11 Aug 2026 11:50:11 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:79fa:d268:80cb:4947])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1412458a390sm1677688c88.14.2026.08.11.11.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 11:50:10 -0700 (PDT)
Date: Tue, 11 Aug 2026 11:50:07 -0700
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
Subject: Re: [PATCH v12 4/4] firmware: coreboot: Add CFR firmware attributes
 driver
Message-ID: <antu3wHFDzxMXBKd@google.com>
References: <CABtds-2qyH84oOG_JhXN6eNQOV9H9vhQvSG4JCv5E+r9VdwKcw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABtds-2qyH84oOG_JhXN6eNQOV9H9vhQvSG4JCv5E+r9VdwKcw@mail.gmail.com>

On Thu, Aug 06, 2026 at 01:28:39PM -0700, Sean Rhodes wrote:
> coreboot can publish a CFR tree in its coreboot table to describe
> firmware setup options. Add a firmware-attributes driver for that table
> entry under the coreboot firmware driver directory.
...

Kind of a large driver, but in a partial pass, nothing jumps out as too
scary to me.

> diff --git a/drivers/firmware/coreboot/coreboot-cfr.c
> b/drivers/firmware/coreboot/coreboot-cfr.c
> new file mode 100644
> index 000000000000..54aae1442bcc
> --- /dev/null
> +++ b/drivers/firmware/coreboot/coreboot-cfr.c
> @@ -0,0 +1,1208 @@
...
> +static int coreboot_cfr_apply_runtime(struct coreboot_cfr_setting *setting)
> +{
> +#ifdef CONFIG_X86

What's X86-specific in here? Are you just needing inb()/outb()? That
seems like you could 'depend on HAS_IOPORT', or #ifdef
CONFIG_HAS_IOPORT.

> +	u8 status;
> +
> +	if (setting->runtime_apply_method != CFR_RUNTIME_APPLY_APM_CNT)
> +		return -EOPNOTSUPP;
> +
> +	outb((u8)setting->runtime_apply_id, COREBOOT_CFR_APM_STS_PORT);
> +	outb(COREBOOT_CFR_APM_APPLY_CMD, COREBOOT_CFR_APM_CNT_PORT);
> +	status = inb(COREBOOT_CFR_APM_STS_PORT);
> +	if (status)
> +		return -EIO;
> +
> +	return 0;
> +#else
> +	return -EOPNOTSUPP;
> +#endif
> +}
> +

Brian
