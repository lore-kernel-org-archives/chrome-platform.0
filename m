Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B469A360
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jan 2025 18:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736189484; cv=none; b=L0kEcX4Tis9bpVVlpHRNU1M4bHz7pZPMh3+B/GDh3opaER6kvvqdtSfNBkru6uDo3x/RwcWOWF4b0k9v90H5QtVwbdqGFQAgI3APwFxdlzAZB7YZQMZqOY/I1kcgYQcF9GF3JtG9t25oKh3Hbc8x/i/7c2DaHCXajFSsUWmCo7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736189484; c=relaxed/simple;
	bh=7vBwNoKC2ik/5/8W8K71faleCmRy1JoYDRVesYu/Qwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k2ZVVEzuEkEnHRcNmnQXBn0YKlsLzSwFkxEzgL5ttGWxCX+cDLnU8EZ0J850vCjxMtLXsTwsGZDmxd00NzKmxpE7j6tVExytY1rkVS0V95DK9JI+9fbCCkl0s9Bil42Y6ozlIllNM4V/k6CPKcGTLLRUTfnrfxEWgGra2c6bnA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mb75s0rW; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mb75s0rW"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5160f1870f3so4615029e0c.0
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jan 2025 10:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736189481; x=1736794281; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKg4JDYZZ55IejgwFvB68njAGTZfDEie3EX0vD4c1LY=;
        b=mb75s0rWZPForxbhCQigu1kHyCQbciw9WekwFFTRSI1DildyKSyCvh3PapvsMqL9oo
         RflGKEp7zAtNxnIqvMBXNZ0807Mr4+BXmyA9iT7bnO5pu88LQospKc7ZGUWkWl2hBsao
         huFyctu1GvmMDjV7crmuZ3ZFVJnW9dqjQ4tHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736189481; x=1736794281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yKg4JDYZZ55IejgwFvB68njAGTZfDEie3EX0vD4c1LY=;
        b=rH8clWQPzRhbbM++bHRsrStCHJcV47J7oqG6eHqIG+DGcSKKhA0Dscwmz0XXCKji/R
         tDI85cBiicUQTEw4QZLW3STBSscnKJxrB2KhJ34jlQAW9E9MfKpkwu4SKO13zetcl+pD
         a4attoBvSkG+c55b8zk/4X4wY3amBs7LtrFNNi24Dxc2cvoBLQfXn0qyrqcQ2ob/YTPV
         ODk4U2C5vrNDZb+zjJQS2K5Up9HTlLF3MnlncLDwh0RfGR8I5m6bzNAUBTMWIllVX0Rm
         KdjnqQ/T3ot03vWO+6MZLXxw0Q1nV1aUqYSHdEldiLr80/9xV8IXKa14iXOs/wxEHtZO
         7U6g==
X-Forwarded-Encrypted: i=1; AJvYcCXhogLN+Ju/BsV+wbXo0RztVDT5Ewj8j2rAEkbnuPYWX5apxoWBE8PmxQVUZ2rzc4m4dlVwquOJtujny0vzGPk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4YMQopxQkaj8oIttZsM7tdvV9olhg3+M0NfQD3vRsDT27G2+M
	dvDsWLY+CESxcFWgLlCNie+SB9q5nekIGTVrnQvxIoJ85/8eupmGQwQSQLp2LlajJnfEVPTy1mW
	01P85fvtpAYZfJxuTIwU0cTnoArpzzaVUNYoi
X-Gm-Gg: ASbGncty4nrCLmMt/bbjOk4p4071LYrtFArVRB4AivmqIF50OogGwFj5mHEbyF5c2Mx
	uJfoW9MnQ3pbN7FVRgeJ3qXMRoguXQjNmi2/Sz3HjBqGLoOnHKjN7DL57T/j9E5F8ozgDh14=
X-Google-Smtp-Source: AGHT+IFuX/UDTjG0jda2sHvBVVEihOsr5K1U9WQyDFW9lQie5d1ORyCk5tXF8FiP/HcYov/fN/8MzQdIPxFdeK6JMcw=
X-Received: by 2002:a05:6122:4889:b0:50c:9834:57b3 with SMTP id
 71dfb90a1353d-51b75c5afc3mr48158055e0c.4.1736189481722; Mon, 06 Jan 2025
 10:51:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250103001950.2868856-1-gwendal@chromium.org>
 <20250103001950.2868856-3-gwendal@chromium.org> <Z3uBBRFHixsNjG2e@google.com>
In-Reply-To: <Z3uBBRFHixsNjG2e@google.com>
From: Gwendal Grignou <gwendal@chromium.org>
Date: Mon, 6 Jan 2025 10:51:10 -0800
X-Gm-Features: AbW1kvbW-62qh_2DKypR3QLqyHEmwO4Cdl7QYrjx-68Q5St_aMYUf17GQ_e_8do
Message-ID: <CAPUE2useM9LE_O1vWOw1Czsi__grfg4P6drSCWPrJV8yA7upaA@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/chrome: Add Support for direct EC register
 memory access
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, chrome-platform@lists.linux.dev, dustin@howett.net, 
	ben@jubnut.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 5, 2025 at 11:06=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Thu, Jan 02, 2025 at 04:19:50PM -0800, Gwendal Grignou wrote:
> > Able to communicate with the EC:
> > ```
> >  ectool version
> > ...
> > Build info:    brtk-0.0.0-df0ad93+ 2024-12-13 19:25:55 elmo@396-a1a
> > ```
>
> Not sure if I understand: does it originally intend to show EC firmware
> version (i.e. "RW version:")?
>
> > Coreboot must exposed the memory region:
> > ```
> > cat /proc/iomem | grep GOOG0004
> >     fe0b0000-fe0bffff : GOOG0004:00
> > ```
>
> `grep GOOG0004 /proc/iomem`.
>
> > Can observe the commands flowing between AP and EC:
> > cd /sys/kernel/debug/tracing
> > echo 1 > events/cros_ec/enable
> > echo 1 > tracing_on
> > cat trace_pipe
> >      kworker/7:0-51      [007] .....   188.619393: cros_ec_request_star=
t: version: 0, offset: 0, command: EC_CMD_CONSOLE_SNAPSHOT, outsize: 0, ins=
ize: 0
> >      kworker/7:0-51      [007] .....   188.625656: cros_ec_request_done=
: version: 0, offset: 0, command: EC_CMD_CONSOLE_SNAPSHOT, outsize: 0, insi=
ze: 0, ec result: EC_RES_SUCCESS, retval: 0
> >      kworker/7:0-51      [007] .....   188.625663: cros_ec_request_star=
t: version: 1, offset: 0, command: EC_CMD_CONSOLE_READ, outsize: 1, insize:=
 248
> >      kworker/7:0-51      [007] .....   188.635119: cros_ec_request_done=
: version: 1, offset: 0, command: EC_CMD_CONSOLE_READ, outsize: 1, insize: =
248, ec result: EC_RES_SUCCESS, retval: 147
> >      kworker/7:0-51      [007] .....   188.635130: cros_ec_request_star=
t: version: 1, offset: 0, command: EC_CMD_CONSOLE_READ, outsize: 1, insize:=
 248
> >      kworker/7:0-51      [007] .....   188.642764: cros_ec_request_done=
: version: 1, offset: 0, command: EC_CMD_CONSOLE_READ, outsize: 1, insize: =
248, ec result: EC_RES_SUCCESS, retval: 0
> >      timberslide-3755    [005] .....   188.643039: cros_ec_request_star=
t: version: 0, offset: 0, command: EC_CMD_GET_UPTIME_INFO, outsize: 0, insi=
ze: 44
> >      timberslide-3755    [006] .....   188.650876: cros_ec_request_done=
: version: 0, offset: 0, command: EC_CMD_GET_UPTIME_INFO, outsize: 0, insiz=
e: 44, ec result: EC_RES_SUCCESS, retval: 44
> >      timberslide-3755    [006] .....   188.650912: cros_ec_request_star=
t: version: 0, offset: 0, command: EC_CMD_GET_UPTIME_INFO, outsize: 0, insi=
ze: 44
> >      timberslide-3755    [006] .....   188.657907: cros_ec_request_done=
: version: 0, offset: 0, command: EC_CMD_GET_UPTIME_INFO, outsize: 0, insiz=
e: 44, ec result: EC_RES_SUCCESS, retval: 44
> >      kworker/7:0-51      [007] .....   198.858864: cros_ec_request_star=
t: version: 0, offset: 0, command: EC_CMD_CONSOLE_SNAPSHOT, outsize: 0, ins=
ize: 0
> >      kworker/7:0-51      [007] .....   198.866866: cros_ec_request_done=
: version: 0, offset: 0, command: EC_CMD_CONSOLE_SNAPSHOT, outsize: 0, insi=
ze: 0, ec result: EC_RES_SUCCESS, retval: 0
> >      kworker/7:0-51      [007] .....   198.866882: cros_ec_request_star=
t: version: 1, offset: 0, command: EC_CMD_CONSOLE_READ, outsize: 1, insize:=
 248
> >      kworker/7:0-51      [007] .....   198.874414: cros_ec_request_done=
: version: 1, offset: 0, command: EC_CMD_CONSOLE_READ, outsize: 1, insize: =
248, ec result: EC_RES_SUCCESS, retval: 0
>
> Can't it observe the trace before applying the patch?  I failed to
> connect the trace and the direct memory accesses.
Before this patch, the commands are not flowing between the AP and the EC.
>
>
> On a related note, the patch should use prefix "cros_ec_lpc" too.
>
> > +static int cros_ec_lpc_direct_read(struct cros_ec_lpc *ec_lpc, unsigne=
d int offset,
> > +                                unsigned int length, u8 *dest)
> > +{
> [...]
> > +     // Check range
>
> To be consitent to the rest of code, don't use C99 comment style.  Or jus=
t
> drop it as the intent is clear.
>
> > +static int cros_ec_lpc_direct_write(struct cros_ec_lpc *ec_lpc, unsign=
ed int offset,
> > +                                 unsigned int length, const u8 *msg)
> > +{
> [...]
> > +     // Check range
>
> Same here.
>
> > +static acpi_status cros_ec_lpc_resources(struct acpi_resource *res, vo=
id *data)
> > +{
> > +     struct cros_ec_lpc *ec_lpc =3D data;
> > +
> > +     switch (res->type) {
> > +     case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
> > +             ec_lpc->mem32 =3D res->data.fixed_memory32;
> > +             break;
> > +     case ACPI_RESOURCE_TYPE_EXTENDED_IRQ:
> > +             /* Ignored, using a more generic way to find IRQ. */
> > +     case ACPI_RESOURCE_TYPE_END_TAG:
>
> If nothing to do (or comment) in the case, could it drop the case?
>
> > @@ -498,29 +560,52 @@ static int cros_ec_lpc_probe(struct platform_devi=
ce *pdev)
> [...]
> > +             if (ec_lpc->mem32.address_length) {
> > +                     ec_lpc->base =3D devm_ioremap(dev,
> > +                                                 ec_lpc->mem32.address=
,
> > +                                                 ec_lpc->mem32.address=
_length);
> > +                     if (IS_ERR(ec_lpc->base))
> > +                             return AE_ERROR;
>
> `PTR_ERR(...)`?
_probe returns an int, using another error.

All comments fixed in v2.
