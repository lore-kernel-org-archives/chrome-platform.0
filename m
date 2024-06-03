Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8769D137939
	for <chrome-platform@lists.linux.dev>; Mon,  3 Jun 2024 18:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717439324; cv=none; b=MzuhCSOTx/N0p9neStVL3h59K2BzRunqPcg7GmD0/zKz9nOhE3F82+yX+TNueX3o4PzWgihW5GXUVPLQjDTGR9/ocW3vXnoTqEeYPcl9ptl61yu6EbpMnOJeoLSGF6FGyezoCn6M/exN3MMvibzPP/L6hD2s2l705Gvaf9jjP6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717439324; c=relaxed/simple;
	bh=5pzzmTHBAXlzWf0fDrqD3054nWAfrzHKttjQoBvV6sI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nnlp/DpojTgoEGubytPP9mjnyrJkOUSt3fWDofO5B6R9NKWbhICEgd6kdsdb50/52wa8Sbu51aTvPtjiy75kKs9UOIq7MvFv3ea1kQPBDUawPFUhiNIkS0bSVbJzn/ovU0EiQg2WNerlEPK5pyl6PfzDtIJvICi4rMZYhI+k0Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net; spf=none smtp.mailfrom=howett.net; dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b=MRDOWERj; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=howett.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b="MRDOWERj"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-62a08b250a2so2688387b3.3
        for <chrome-platform@lists.linux.dev>; Mon, 03 Jun 2024 11:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett-net.20230601.gappssmtp.com; s=20230601; t=1717439322; x=1718044122; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pzzmTHBAXlzWf0fDrqD3054nWAfrzHKttjQoBvV6sI=;
        b=MRDOWERjfZy1DwFqIsqZ3fbfxKK5CH9nLsJ/LG+4sFVLnZxKB6lngBNjyj0ryxWLpt
         c2lOokQVGotuW8tSVFTHZT7e3O6BIdPLaadzfvVS9wpOfQitUqj5nlJ9KT4JHtRL9RqG
         O0eGqS6/YpkwWKsED1zPk8yCE+jaKBSok98sWAJAzUeuONOlJzr1ni1zx/Y3DLbH5tHB
         kqsahCc1s4ASzVIVGhgp7DTQA0+zaiF7J1khZHuSte62Fy4tIXANvU4f3JPsqJLo3azI
         4tgUhw38KNfO/BAAMnfZt9uPpjOZMChiGL1Y863ty1Y/BTI4wMSya2B7iRJPE3B4Wp+1
         yHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717439322; x=1718044122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pzzmTHBAXlzWf0fDrqD3054nWAfrzHKttjQoBvV6sI=;
        b=RZYZKe5xHNVXdFHivXBk5bV/argdx2qeKK4fdnHiDKPL4gdmKnhLoyLtTapFdsKt7s
         7ggewCro3YTlj4tAKrrZNkkVrwCHF3C2kG0HCptVHHW+yREQbWxFdijmynD8RKed7UQv
         yTEws199KBomo6uG2mKN8l+IjZmFx3oa0RC2mDA8PFtrYoIbRz3dq0I4vYDGL1S/2DAW
         QJd3lZ5cmdS+7F7UsyiassyClPXSEnj+CULmx7tpbr3F3iRoTPZuCO75BUXkCBQYPI4k
         zXoIL6NHxOFUhsFkinzOocHhoo9KaGgs3xuJ52YJB5Aqy2aAL4wbB5FMLjsKZe+vyEog
         hIXA==
X-Forwarded-Encrypted: i=1; AJvYcCUYhuDx4BprgmuM/H7eq2/eTrE7sBzE3pm7WnJPt/748wYNpa/MYsuSPVpI6JzzHakPBd9CZ6/6Alyp4CGrWp5O56lBnFEcMWSlgAxiked4
X-Gm-Message-State: AOJu0Yz/AP+Hl3VNwmTFgRehQcYCq8l6EaHGdZkCqZE3c8TuLuyeDLf8
	96VFnThtYzlXGVGolvDoJ3ffQZXo7vwK0oXfzPjs0jIQJrDCV+T7S1swES+1AScL9dO/I0djuMf
	juQJwN/yFrL5rYCp1ahroq1lLiqvaCnXs0UNZ
X-Google-Smtp-Source: AGHT+IGulLHiVlAu1zMn1t7/FgP4mCz1TMuwVkx21CLBQBobctyxmCSyaH0vfSMDP6EvEXT0pr2zriPWNX0ELMfuTkU=
X-Received: by 2002:a25:db04:0:b0:df4:46a6:77ed with SMTP id
 3f1490d57ef6-dfa73c4df61mr10211456276.27.1717439322486; Mon, 03 Jun 2024
 11:28:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240603063834.5580-1-ben@jubnut.com>
In-Reply-To: <20240603063834.5580-1-ben@jubnut.com>
From: Dustin Howett <dustin@howett.net>
Date: Mon, 3 Jun 2024 13:28:31 -0500
Message-ID: <CA+BfgNKcG4ShokZ3ERmg75nJXMRbwJeAH=GnWwHt6A3XRar+gQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] platform/chrome: Fix MEC concurrency problems for
 Framework Laptop
To: Ben Walsh <ben@jubnut.com>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Kieran Levin <ktl@frame.work>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Mario Limonciello <mario.limonciello@amd.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 1:38=E2=80=AFAM Ben Walsh <ben@jubnut.com> wrote:
>
> It has _not_ been tested on any Chromebook devices.

Good news!

I've tested this patch series on the following devices:

- Chromebook Pixel 2013 ("link")
- Framework Laptop 11th Gen Intel Core ("hx20"), firmware revision 3.19
- Framework Laptop AMD Ryzen 7040 Series ("azalea"), firmware revision 3.05

It works as expected.
There is no detectable difference at runtime on Link, nor does the
driver appear to improperly bind any ACPI devices.
I cannot reproduce bus contention on hx20, even performing operations
that would consistently fail without this patch (e.g. long flash
reads).

Therefore, for the series:

Tested-on: link, hx20, azalea
Tested-by: Dustin L. Howett <dustin@howett.net>
