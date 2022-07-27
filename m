Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5885D7EE
	for <chrome-platform@lists.linux.dev>; Wed, 27 Jul 2022 01:40:58 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id i4so9206596oif.2
        for <chrome-platform@lists.linux.dev>; Tue, 26 Jul 2022 18:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=ZQP39BlWuH5uB0igKBxBSRYwBAlp0vmJqoxShBhFmBY=;
        b=dI2oF0ZD8dQ0SzyPbg8twIuj4mxUSEjCINx9u4QJDkseMmtr0SHQJ+/mijZafeqRTS
         yjCUC7o6km74hUzt+USVp7m+SHz8f9jdwRmiDdZugO4cH9w3k7NQh4k4m++b4Jj/ftbX
         qsMI4p0BMuDs0sn+J29Su2nd190GkHbD7dmQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=ZQP39BlWuH5uB0igKBxBSRYwBAlp0vmJqoxShBhFmBY=;
        b=n+46nik4gE4aQZFDUjYmGphmHm3tHieSo0XxpvyS3m6qgQtY2EZjJjvJ5ZL6cDpzcH
         5DrXYrFQg9VxoNiz7w8zYPfgzDfqBHbVkMcc7UHueLq+jXb9xHdECdQPG9O3PgRRx2VA
         Ok9ZhoMlXK3jFGJpqvrsLpyYBgcSmE8gn27pYODLY8vI2Xni65vE9Dp4N10w++FGU+Xd
         ngfLfdz0lQqKcVXPEaiarF6HMZo2QIkHH2HB5eCquzVN++/baT5Gzkaz8Urrz5dhqxdJ
         rflg9ojhspV3T0PIESGzFoovJbMfEwqUcfB0XU5WZrvCXsA2WsIBaWik8V0kg0g5RlrV
         i80w==
X-Gm-Message-State: AJIora9FgE2lxrcqOnVRdSmT4f6pSSMKzpdD2tffbEg1aMZfiXwwe+dG
	hWdDYg0ZZWDxve7AIVGMmPN5WrYCe3TnysDZAIKwCA==
X-Google-Smtp-Source: AGRyM1uoeYlsAmwt/493nEC5g8suOwARV4xuMdrjwWz2LdrSKJMHfmgJDWrtUE5AcUZccggj4+diTgO6NtU5+paSQ98=
X-Received: by 2002:a05:6808:2206:b0:33a:b472:48fd with SMTP id
 bd6-20020a056808220600b0033ab47248fdmr874798oib.44.1658886057293; Tue, 26 Jul
 2022 18:40:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 Jul 2022 20:40:56 -0500
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAODwPW-9UPokepL_VVGuCLaWTDT7hmN9R9Z2yXABrP4g3_N4uQ@mail.gmail.com>
References: <20220726235115.1184532-1-jrosenth@chromium.org> <CAODwPW-9UPokepL_VVGuCLaWTDT7hmN9R9Z2yXABrP4g3_N4uQ@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 26 Jul 2022 20:40:56 -0500
Message-ID: <CAE-0n51RsN3P5hT+kApw-kPqjm_K7=7bvySWLNdQuQPnrQYZRw@mail.gmail.com>
Subject: Re: [PATCH] firmware: google: Implement vboot workbuf in sysfs
To: Jack Rosenthal <jrosenth@chromium.org>, Julius Werner <jwerner@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, chrome-platform@lists.linux.dev, 
	Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Julius Werner (2022-07-26 17:26:41)
> Sorry, this wasn't quite what I meant. I think we should definitely
> not hardcode any details about the vboot data structure layout here.
> It's already enough of a pain to keep crossystem in sync with
> different data structure versions, we absolutely don't want to have to
> keep updating that in the kernel as well.
>
> I assume that the reason you went that route seems to have been mostly
> that the lb_cbmem_ref coreboot table entry has no size field, so you
> had to infer the size from within the data structure. Thankfully, we
> don't need to use lb_cbmem_ref for this, that's somewhat of a legacy
> entry type that we're trying to phase out where it's no longer needed
> for backwards-compatibility anyway (and in fact I think we should be
> okay to remove the vboot entry there nowadays). We also have
> lb_cbmem_entry (see
> https://review.coreboot.org/plugins/gitiles/coreboot/+/refs/heads/master/src/lib/imd_cbmem.c#222)
> that exports info about every area in CBMEM, with address, size and
> CBMEM ID. The vboot workbuffer is CBMEM ID 0x78007343.
>
> I think we should just add a general driver for lb_cbmem_entry tags
> here, that uses the "id" as (part of) the device name and contains
> node to read/write the raw bytes of the buffer. Then crossystem can
> easily find the right one for vboot, and the infrastructure may also
> come in handy for other uses (or debugging) in the future.

If there's nothing to really "drive" then a driver is overkill. Would
exposing some raw bytes in /sys/firmware/coreboot be sufficient here,
possibly under some sort of /sys/firmware/coreboot/cbmem_entries/ path?

I honestly have no idea what vboot workbuffer is though so maybe I'm
just talking nonsense. If this ends up in sysfs please document the
files in Documentation/ABI/ and include it in the patch so we know what
is being exposed in the kernel ABI.
