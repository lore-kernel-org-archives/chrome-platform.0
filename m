Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF567E8
	for <chrome-platform@lists.linux.dev>; Wed, 27 Jul 2022 00:26:55 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id d8so22068231wrp.6
        for <chrome-platform@lists.linux.dev>; Tue, 26 Jul 2022 17:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8Yw+cKl53wNMcfpI/MRnxnx1KIbCu6LC2VYr7vldE9s=;
        b=CVhRJgIAzdoOMqq25qQOjSnIvOpcLPVX/EzmFfAuCwGD+WxjLsVqIVbSivJUmCeg9K
         uDL5NHcMveoTbyzfKZiOpaVm3GHrYYVKta16Kq0iNbmbOyxHnHELviJrDmbiI0gA6E17
         4yA+JrC7NIaCDqbggmsf246K96Z+LCAZIYXOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8Yw+cKl53wNMcfpI/MRnxnx1KIbCu6LC2VYr7vldE9s=;
        b=ombRemgzbfDRJo9ATKD8StkDVd3DaW6W6oI5jiMu+0xHbNhKzG/PNd6Bebnxjn94o3
         YvTXzsrLH4r/OLcH3xq9DhdDme33rOsF6h4rb6wWHvsq6wwX6LuVCMEPpsR+9EyszV07
         mzK0lC1zJq4WjCfTGcfz9Vwr2P0THO6n4s+I1aanCR3Xx5nKaGepC2CaxlUvFpDxEdAB
         MxXrMaTaVg2iiD48+7xQ0OHeFkYz1Cc8cvPhDSNdEDw34MvToybL2NhZ/qrl929j2A6W
         Kh4akgBYDYk17f0Fn00adPLsQbkW04YeQGD5RuylIxYoHwAPlc2VcbHMlLUO3N2TsL8m
         ZSoQ==
X-Gm-Message-State: AJIora/buMViFLzUfpvapfVOHDFsHoZT62bxBo5exMktx5a89S7FocTP
	oXQFYACipD/fBrohGkTLb/JMweuR6ciIQ91jYChYLA==
X-Google-Smtp-Source: AGRyM1v282cuWyMIrxlKYKG+Y2hspRzqXJoTLgdsCs6bWpGyhUZ69tYSLecLQbclcK88MzyVVu8yo+0M5DtJSCxKDsI=
X-Received: by 2002:adf:ee8f:0:b0:21e:529e:fa3b with SMTP id
 b15-20020adfee8f000000b0021e529efa3bmr11946186wro.207.1658881613377; Tue, 26
 Jul 2022 17:26:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220726235115.1184532-1-jrosenth@chromium.org>
In-Reply-To: <20220726235115.1184532-1-jrosenth@chromium.org>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 26 Jul 2022 17:26:41 -0700
Message-ID: <CAODwPW-9UPokepL_VVGuCLaWTDT7hmN9R9Z2yXABrP4g3_N4uQ@mail.gmail.com>
Subject: Re: [PATCH] firmware: google: Implement vboot workbuf in sysfs
To: Jack Rosenthal <jrosenth@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, chrome-platform@lists.linux.dev, 
	Stephen Boyd <swboyd@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Sorry, this wasn't quite what I meant. I think we should definitely
not hardcode any details about the vboot data structure layout here.
It's already enough of a pain to keep crossystem in sync with
different data structure versions, we absolutely don't want to have to
keep updating that in the kernel as well.

I assume that the reason you went that route seems to have been mostly
that the lb_cbmem_ref coreboot table entry has no size field, so you
had to infer the size from within the data structure. Thankfully, we
don't need to use lb_cbmem_ref for this, that's somewhat of a legacy
entry type that we're trying to phase out where it's no longer needed
for backwards-compatibility anyway (and in fact I think we should be
okay to remove the vboot entry there nowadays). We also have
lb_cbmem_entry (see
https://review.coreboot.org/plugins/gitiles/coreboot/+/refs/heads/master/src/lib/imd_cbmem.c#222)
that exports info about every area in CBMEM, with address, size and
CBMEM ID. The vboot workbuffer is CBMEM ID 0x78007343.

I think we should just add a general driver for lb_cbmem_entry tags
here, that uses the "id" as (part of) the device name and contains
node to read/write the raw bytes of the buffer. Then crossystem can
easily find the right one for vboot, and the infrastructure may also
come in handy for other uses (or debugging) in the future.
