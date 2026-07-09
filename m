Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65C5301708
	for <chrome-platform@lists.linux.dev>; Thu,  9 Jul 2026 21:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783633518; cv=pass; b=pKBayQYd5C/TnRcH+yKRO84ANh+GfOMsKmOgaa+uhr44C+y3Mp9SjEYoH8VZz7jjG41tiXKp4/v07BTQyXBQ8SnVmSSw0JCQqcPejRO1NEnzJ6wvhCZa/hrm4NiuEvrMexj0bq0nVUaYHL1p2djDJa9TidH60KMRMCxCPTptRww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783633518; c=relaxed/simple;
	bh=97uKos/2iMJDbe8c2Ylsf2FNjqanvMAOyyMPpCzzwcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GHN3lL3dZpLlpvXYe5vwakENUlXc1nZf9OnOLMyQ0YVP9TGjKB0rIWMYAoL6/gRY9EVlRMmjiKKoTCEu2KAT6iaLnnm6vGVVp5c6SQKKer6BgPXAFC5nNsdauV2UnBlzdKWwhc71N82bIXDgYIOHnQH5f2YBP/Vi2Sco82yhP2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T4AVEV9H; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T4AVEV9H"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493b8d99342so9845e9.1
        for <chrome-platform@lists.linux.dev>; Thu, 09 Jul 2026 14:45:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783633515; cv=none;
        d=google.com; s=arc-20260327;
        b=r63ZEYXjatI4isbM85op1ctGZa/GXVJccua/qq6eWq3L4Gg4ii8Xm4UPLdUUso8WMY
         MSyFwjzePBQ/rKcMWypKG2AgAVBymKVjFcjX5QUi8tBQK16KUTKYTGFOh9CzUlkFVwfw
         NJSDnksPMZTYrOwl5+4bY7OU7qcNP3o+zu5GQFCOQVlZoIRyJB6vW62nygpD7wKV3Qdu
         aYgHcnfnsLLiGuH4z5AHLXv6P6harbiyqCLG/dKefgP0TZiTDSvPO25IOURUHQUqN3ph
         Yzq4UxybZrfZ/UJqG6EmJgZDFD4Ce2+z+D2v0UFkuLZhRTpKvZigBQUF0jrKu6Eiqz7F
         Y2xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PJhEfvZFC3LPpnLPjpmX/P5/46H4OYG3hIyps5e/coU=;
        fh=7KLhWE68sKFqNUJYe9j/z6NSdhvw4/DkZMbIT4RH6u0=;
        b=ivAIa7eKVTNaOB2sLuB5hISAaTcxhqQ8o/uaxayKO/bfag8RIE01zUhlYdpRNphP2j
         hr/Jz1VSP+YbmpllTfpjTmLJ84Wnn3kWWuMXw3ykU86Gqj9viO1PF2yX4GpAlhZa9GRn
         5nUtt21WAR1u9PesmENZsdhByRbbngjpcaHEpnU+pYWRMpdln2u7EHhrQIgWAQ0Lk/gQ
         ylh5YNGFHHNZd9u1RArKqPDCpwSwz+TWRFdncj+n2bJr52eifLfM9cPiXxxGDB/vyZPJ
         9FNTElDZMYN/TzZjtM9l3ZAxYgweR/Zv7GIwd65cc4RtxyW+j/QW7F+6arOLrLdNrm7I
         pn/g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783633515; x=1784238315; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PJhEfvZFC3LPpnLPjpmX/P5/46H4OYG3hIyps5e/coU=;
        b=T4AVEV9He2c1uXahhvS3HCCJJH5nafr68+0TaZxgD/tQPF/BgRZeW+w9N8dKBKG8x2
         t1XyxESUYEg1bZF+UsBZQtgZ5v2pqV9xMcd3K1ecYnO95q5VRuw32qpXkV8reAfBbF13
         TQBkqxlnZrzIRInKyEnFLAPhkvHwHcmEOIN8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783633515; x=1784238315;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PJhEfvZFC3LPpnLPjpmX/P5/46H4OYG3hIyps5e/coU=;
        b=iwNKZCk2Z5dUT6cUsEXEX7brUybSx/9Nf3/9sla8kWGkJF0cjUEN5aJoluvqgh9kxp
         JmXlBdYB5GQzg3MUiNS7BHu9SepQirLiSYkcsxR6ldDm7C820Dmq92rhwrMeDi2rUsgo
         vyfPCBk2Jd7nvhoqWoYi2SVZl+G+pOZB8rLX4YkxI2bYOx/2D2GGjMFumqXunwc9F3/p
         I1wFX/rR5udmzRal/l53HcE0Rn3pD4WJuWF60OeoxqIVO5ATzMMlXcOVMcOwUM50mSL8
         JhtIYkCdXqz2gh4+sG3K4aLIrcQL51oGCWVHKq+dvr0R5yoVBMmHbKslCok6oIqp20mT
         uumQ==
X-Forwarded-Encrypted: i=1; AHgh+Rob031GykUivse+fBR5sjTY/B4muMTU1LERtrCFemsExUcbnUCOMhFNljXWwT3nisgCA2u01cPriRPLJ2UMzT8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzfhv6OgHVfXEqEjG1QcNMGNoVy8NxAQsEG1zfC5dfNR6HSnwBG
	3kia8p6u/Y/swUVSkuvjXQ9QDL03/f2VLvL4CUnaYTabl3Ld/nrnzYBY5gXT0bx+lOO3AzQoXa2
	09jNBDQu4Te3eZ633jNM4l2rGmgrDDmUodZL6mLY8
X-Gm-Gg: AfdE7cn95+vx1k9+ahF/soWDevqT6cqKgNm280nRXZo5k8zk4RuWVAlLQmuu/hCbedD
	k86m+WBhqlx7k5wtcGpBOa8nkDO0x1emBFbMHj87ZICdPf19MA1jF4Flv2jZjKublEvIbbDjmm0
	tCTzBtOVjiKiz5rCKVmDbDgEMiOiCCWsihxwuiMrU5w6bDSx9OFS3zXsrKn13BruMyPy5RD/e4G
	xrA7pq0UHzTFO1t91ES4crAGjekYSxx44eugfanYDv4zyh18Uwoth8Wf5ulQEh9O/SstP88pWp3
	mCu7Yvp596qlbNIWD0sbTDr2Gho=
X-Received: by 2002:a05:600c:a414:b0:493:c1a0:7fdc with SMTP id
 5b1f17b1804b1-493f2acb145mr484755e9.0.1783633514708; Thu, 09 Jul 2026
 14:45:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1783601414.git.sean@starlabs.systems> <1e2a63afb26f989db2179e2aa82f1938068c10dd.1783601414.git.sean@starlabs.systems>
In-Reply-To: <1e2a63afb26f989db2179e2aa82f1938068c10dd.1783601414.git.sean@starlabs.systems>
From: Julius Werner <jwerner@chromium.org>
Date: Thu, 9 Jul 2026 14:45:03 -0700
X-Gm-Features: AUfX_myLvshupDDVjc-azRWSfgrwIGthYfsz8I-jkiS6JGfW_xirAaWLBuoRGFg
Message-ID: <CAODwPW-xnHQ5JPAkN9+12C1=3qaavPcQbM5-HCtr5vP5bWdkUg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] platform/x86: Add coreboot CFR firmware attributes
To: Sean Rhodes <sean@starlabs.systems>
Cc: platform-driver-x86@vger.kernel.org, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Brian Norris <briannorris@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 5:50=E2=80=AFAM Sean Rhodes <sean@starlabs.systems> =
wrote:
>
> coreboot can publish a CFR tree in its coreboot table to describe
> firmware setup options. Add a firmware-attributes driver for that table
> entry and move the coreboot table bus definitions into <linux/coreboot.h>
> so the driver can bind from outside drivers/firmware/google.
>
> The driver exposes runtime EFI variable-backed boolean, enum and integer
> settings through the firmware-attributes ABI. It only registers settings
> with readable runtime EFI variables, skips suppressed, volatile,
> dependency-gated and non-runtime options, and keeps read-only or inactive
> options read-only in sysfs.
>
> For settings with an APM_CNT runtime-apply record, write the EFI variable
> and ask firmware to apply the setting immediately. If firmware reports a
> failure, restore the old EFI variable value. Settings without a runtime
> apply hook keep the EFI variable update and set pending_reboot.
>
> Tested on a Star Labs Byte with firmware 26.07 and the driver built as a
> module against Linux 6.17: runtime APM_CNT apply was verified with
> power_led, and reboot-needed behavior was verified with debug_level.
>
> Link: https://doc.coreboot.org/drivers/cfr.html
> Link: https://doc.coreboot.org/drivers/cfr_internal.html
> Signed-off-by: Sean Rhodes <sean@starlabs.systems>
> ---
>  MAINTAINERS                              |   6 +
>  drivers/firmware/google/coreboot_table.h |  45 --
>  drivers/platform/x86/Kconfig             |  13 +
>  drivers/platform/x86/Makefile            |   1 +
>  drivers/platform/x86/coreboot-cfr.c      | 986 +++++++++++++++++++++++
>  include/linux/coreboot.h                 | 147 ++++
>  6 files changed, 1153 insertions(+), 45 deletions(-)
>  create mode 100644 drivers/platform/x86/coreboot-cfr.c

Is there a specific reason to put this under platform/x86, or are you
just doing that because it's not related to Google? If so I think it's
just time to rename the directory from drivers/firmware/google to
drivers/firmware/coreboot, and then you could just put it next to the
other drivers. The only thing that's still completely unrelated to
coreboot in there is memconsole-legacy.c, but since it's piggy-backing
off the same buffer format as memconsole-coreboot.c I think it would
be fine to just leave it there anyway.
