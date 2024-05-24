Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2B14AEDD
	for <chrome-platform@lists.linux.dev>; Fri, 24 May 2024 18:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716575953; cv=none; b=aBWtK1SPbGnuWtdtOroyZxbkocaQU3NFWCnwBec/RLmPq4PCnw1PgDNzjO/5AVmDsetrlW0ejojdupvVbEGG3XaPb5LWN0dYhO9MlqeyIR4Q0r1z/QPHQ6C5u0X77YpkydSub5bWi+TvKwszCh8jWK+E7EpVXn/1X07sO2ZHqCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716575953; c=relaxed/simple;
	bh=4BWDlFzmKgPu7pIeN9TGO2G9NGrk4rFNS9672TWXGuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MtDyq4pLEhGahDVGweXJl+bBiCkveckXVNWLredQz5iT/WWHKgU+YaB1+rxG6tq0D8RBn4Ap1J8hS4eHH/Ch2266bQkOkfOD32X4TXKoL0RHeVLxGdbjV1sCxyLRKMeiYjLDZ4nTU0E+MU/WOFaWkZraYxSAxGkr53Gw7SN+S/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net; spf=none smtp.mailfrom=howett.net; dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b=XyQXffMA; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=howett.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b="XyQXffMA"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-df4e1f0f315so3363632276.0
        for <chrome-platform@lists.linux.dev>; Fri, 24 May 2024 11:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett-net.20230601.gappssmtp.com; s=20230601; t=1716575951; x=1717180751; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BWDlFzmKgPu7pIeN9TGO2G9NGrk4rFNS9672TWXGuI=;
        b=XyQXffMAxHxHL5vXdF/J4T1zmLiGoDHlL9m7MVaXfN8BRjU/gE88dsujAH7hnchvBH
         OIF8WsTrBo2486BLMdanAg/wt6mN28WJBs0OoRi3m8ySZnjJI89FhhfQuskJz5zvHQUE
         nQaWWT9xL24bbeKTsYou16cqMURXFAUN6CH+z75JU8H8b1woyhAoEOOD9XAsIO3XM+ef
         vW1ZaaCFDgCPNspAYOuHFmzM+adY2lbpbYWVoKdBxOxXmYG1VvVgVacjjEhZ1TqaBOGv
         xp9ngUJoa/uJsiBhAq7xdPHlKZcZdahUbNBbKrujjN87npJ4eT3HM4PBu+Y1kAGeuKr3
         W8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716575951; x=1717180751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BWDlFzmKgPu7pIeN9TGO2G9NGrk4rFNS9672TWXGuI=;
        b=GJZcHTlSSizHu7eJ2jR0bCehMeJkjA16ReOMjKotdu2ozz3HpCmbSTz7MML+tPBMxJ
         2+3VMmT75pJvDc4kSifCJfhl4F5AwXjv32yAaOSr03kPTXlpiBnzQW+QPc8HjxuqzNKB
         irakbzR+Rxlk2La5psWICr1hZXvsvBHRb95XBHmIAUa2AF5oQ9JmeC1h+TLYE5+mRb+5
         f1J+PYGIRp1FE10Xa6BmViFJln6kpTk3b1uqZLn66pzhuvUt24PCUADDtMpLoLRHfLmd
         4eXAncPXZ3YQBi9ilQbEnK6Y2Ssy1OrRCEcHS5JWbrRBAcH/ryNS3LVnBTFygRuIrtJD
         CetQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGE9cgGOSf806VkoqADyQzyhfi9dkyv+tQpy0/EmfJVNqRxUScf6F1NU4+UyLOqWUcdkB67SvXT16JRdUapKfp7RuyNnfsq05zsIfrPIJ5
X-Gm-Message-State: AOJu0YzFarsBmq7rjsNk25Czc40dAlQ+9h8NmWSpK8JvlMd1NMitPJox
	kE6l5hyif2/GyguV9b/oa9qfxX3TWRZsjqG6XHdaDUHsK3ex6tBxarhkmPVTnrdYzFHnaL5Rc9B
	IpqSa9O7ueyneS2FVl+CJMG70p+vOajAg+2HZ
X-Google-Smtp-Source: AGHT+IGySwby0Wi3hsPE2Ha/40Yh/i6YxdkBaMZS0CGt0TCthCDA2n11AkgR+AfJ1Wsm10vYyVXwWIN/nMtZG/RaeNo=
X-Received: by 2002:a25:943:0:b0:de5:51d0:9a8d with SMTP id
 3f1490d57ef6-df77237535amr3114332276.55.1716575950805; Fri, 24 May 2024
 11:39:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240515055631.5775-1-ben@jubnut.com> <20240515055631.5775-6-ben@jubnut.com>
 <ZkscFnmHeWWma7Nb@google.com> <87jzjk1ibr.fsf@jubnut.com> <Zk_63rrDJFhN1Y1q@google.com>
 <87cypb12j9.fsf@jubnut.com>
In-Reply-To: <87cypb12j9.fsf@jubnut.com>
From: Dustin Howett <dustin@howett.net>
Date: Fri, 24 May 2024 13:39:00 -0500
Message-ID: <CA+BfgNL7RGWuFK-M=Cpt8nLfroK+Xpqtzs4nQ1Bwnv6iiVd5nQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] platform/chrome: cros_ec_lpc: Correct ACPI name for
 Framework Laptop
To: Ben Walsh <ben@jubnut.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Kieran Levin <ktl@frame.work>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Mario Limonciello <mario.limonciello@amd.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 1:35=E2=80=AFPM Ben Walsh <ben@jubnut.com> wrote:
>
> I could add a new quirk which provides an alternative ACPI match table
> to be used instead of the default. In the default case the match_table
> will contain only "GOOG0004" as before. But in the Framework EC case the
> match table will be "PNP0C09".

My biggest concern with putting PNP0C09 in the direct match table is
that it would cause cros_ec_lpcs to be loaded for *all* devices with
an ACPI-compatible embedded controller; it would likely print an error
and bail out early on, but it would still be unnecessary on 99% of
platforms.

This is my misunderstanding the driver model, but is it possible to
add a second companion device?
d
