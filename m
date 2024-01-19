Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217194F205
	for <chrome-platform@lists.linux.dev>; Fri, 19 Jan 2024 14:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705675843; cv=none; b=Ny1DvsFYpwUN9+tB3akaG/Ps8UCOnFh2a79VhxQRUYgRjT/wwzVqEVXg2s8JRxsx9wvU4jb82/CuW737Tz4ZAMJ2RXHk3t/bAzICogmeMtTt4KCF+Fx2cht2SvH08+X/+VWFQca1UsVDuweSbsjBeojbvmxXUpvGHh+F6lLv15U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705675843; c=relaxed/simple;
	bh=xwoZxI275/To70YZy7/2EL0Bm3UA5vkR9ZSvms7w7kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HRDziAz74A0pPiPoMVq80wj3K0/mwyKEntZoOv1rqHRE8s03LlfC6ROPlzvvmLp8G9L1Zhc+E4fcN3PWkv8IOJ1r1Z/1aMLkHZ8/3nHVwEkKKbynyhRTMwlKXXynALmHPoEv43DQXtaQ0wKFwGUO/YR0uBfF6ln2gXAS2wocn/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T++0X0wG; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T++0X0wG"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2cd1a1c5addso10854511fa.1
        for <chrome-platform@lists.linux.dev>; Fri, 19 Jan 2024 06:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705675840; x=1706280640; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V12/jbF4jIzNWrp077wLTVh0cToW9uUJVCHOyKjvBFY=;
        b=T++0X0wGm9Ytj5tV+1E+zuSsp3FS32WiM7wuDTiiJzfcy5qXuLaSiW/sK8DqqnK+ne
         HjaVTMF7sx0m8F8bkAYzK5362QKTtM7dRMLKvvdzcGNJhmklSx/Pbiae6okk3Ee0OnGp
         ldCSqnvqwVkJ2VpA7nK6GLogsxNfxqFsmtIhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705675840; x=1706280640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V12/jbF4jIzNWrp077wLTVh0cToW9uUJVCHOyKjvBFY=;
        b=ooqkBCGTm0j74sN4yKS2MF3l+ND3s3+8R420enxnKUQ8+SLTOb2L7aqDAi9RQg6eev
         QORfcxnI3XijLM5Ahi+iR+0o9OJxKS3ADld4KsojPJcI8dMFFsEeugNhLNTODXTi2cKZ
         bKRWFztj1Wp+Llz6Wl4wL9yCjFCogTqkxrWUkje3/I15gxqzu1T3gb0vnB3GOq4SoVXr
         5wN4G7AV52JmKzj0+W9SVEs21wZxzcOMKXkqTkSl1ElzfKAE8j49G6dOwCD3/v6ONmGg
         ZYLCu1rudWcd/8Dk5vhy2Z9sjy6hzqZ8sNoG7OzCtgbbVAM+4jKEIcmb3FDZP6FnUZUo
         C2WQ==
X-Gm-Message-State: AOJu0YzZY9JhKLPk0p9TfJ549J7rN8oaNHJjjnQNQTEFqbx6mQRZdRQH
	sV26b4748Fyz2R3H282+aaRtoutJ/N4KSqf7zqB/RphGknTWwqpRD48ebN6hWkXq4Opk75Ir/Og
	y8Rirf0Sv+nwFXsRQk5oYx9A21gVbO1GNeAKpVIy3MuJsJn+Sew==
X-Google-Smtp-Source: AGHT+IEH73vRz4SgGHZs9TuhJC0z+cpuBSlZovW/NmW8yw3ZvTrIcxh08D3tt5qoPVhNMiGL88Dec0EKLhJ85Vmgkk8=
X-Received: by 2002:a2e:2a45:0:b0:2cc:7575:edf9 with SMTP id
 q66-20020a2e2a45000000b002cc7575edf9mr1475021ljq.91.1705675840226; Fri, 19
 Jan 2024 06:50:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240119084328.3135503-1-lma@chromium.org> <d2329494-2c57-41bb-a9ea-2c9903500d1e@roeck-us.net>
 <CAE5UKNrU9YHoCQr8HLFf9-T4-NobQ4jWtryVqq9okFz8nVezgQ@mail.gmail.com> <b65b46a7-c65d-49bc-a5ce-5085da2fc112@roeck-us.net>
In-Reply-To: <b65b46a7-c65d-49bc-a5ce-5085da2fc112@roeck-us.net>
From: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@chromium.org>
Date: Fri, 19 Jan 2024 15:50:29 +0100
Message-ID: <CAE5UKNqM6t+nzY-68pVBFxT-_TCjMjDUE-GwRgXp9ny3vqP-1A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Introduce EC-based watchdog
To: Guenter Roeck <linux@roeck-us.net>
Cc: Gwendal Grignou <gwendal@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Radoslaw Biernacki <biernacki@google.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gunter,

I'm sorry for the confusion, I've just forgotten to add "received-by"
and there are no other changes besides mentioned in the cover letter
changelog.
Thank you for mentioning the process, now I understand why it is so importa=
nt.

I will send V4 for the sake of following the process.

Best regards,
Lukasz

On Fri, Jan 19, 2024 at 3:43=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 1/19/24 06:10, =C5=81ukasz Majczak wrote:
> > On Fri, Jan 19, 2024 at 1:50=E2=80=AFPM Guenter Roeck <linux@roeck-us.n=
et> wrote:
> >>
> >> On 1/19/24 00:43, Lukasz Majczak wrote:
> >>> Chromeos devices are equipped with the embedded controller (EC)
> >>> that can be used as a watchdog. The following patches
> >>> updates the structures and definitions required to
> >>> communicate with EC-based watchdog and implements the
> >>> driver itself.
> >>>
> >>> The previous version of this patch was sent here:
> >>> https://patchwork.kernel.org/project/linux-watchdog/list/?series=3D81=
7925
> >>>
> >>> Changelog
> >>> V2->V3:
> >>> * drop "-drv" from driver name
> >>> * use format #define<space>NAME<tab>value
> >>>
> >>
> >> I am a bit lost here. You dropped my Reviewed-by: tags, even though
> >> I specifically said that they applied with those changes made.
> >> Also, according to the above patch 1/3 was not changed at all.
> >>
> >> What else did you change that warrants dropping the tags ?
> >>
> >> Guenter
> >>
> > The "-drv" change was related to patch 2 and 3, and I have used
> > "format #define<space>NAME<tab>value" only in patch 3 (as
> > ec_commands.h is mixing those)
> > Sorry for dropping your "Reviewed-by" tag :( I've assumed (wrong) that
> > I cannot take it for granted sending V3.
>
>  From Documentation/process/submitting-patches.rst:
>
> Both Tested-by and Reviewed-by tags, once received on mailing list from t=
ester
> or reviewer, should be added by author to the applicable patches when sen=
ding
> next versions.  However if the patch has changed substantially in followi=
ng
> version, these tags might not be applicable anymore and thus should be re=
moved.
> Usually removal of someone's Tested-by or Reviewed-by tags should be ment=
ioned
> in the patch changelog (after the '---' separator).
>
> > Alos in such a case if there are changes in patch 2 and 3 and 1
> > remains untouched shall I send only 2 and 3 in the next version ?
> >
>
> Again, from Documentation/process/submitting-patches.rst:
>
> ... the patch (series) and its description should be self-contained.
> This benefits both the maintainers and reviewers.  Some reviewers
> probably didn't even receive earlier versions of the patch.
>
> Note that the same document also says:
>
> Wait for a minimum of one week before resubmitting or pinging reviewers
> - possibly longer during busy times like merge windows.
>
> I could just send another series of Reviewed-by: tags, but quite frankly
> by now I am wary that you might drop those again, so I guess I'll wait
> a while to see if there is another version of the series.
>
> Guenter
>
