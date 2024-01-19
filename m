Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AD854646
	for <chrome-platform@lists.linux.dev>; Fri, 19 Jan 2024 14:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705673437; cv=none; b=Lki9UeFK3EBjmbh4hGnGv6LFlYjDs73YbhbdbYliyqXdI2fce4QnSYlUCTQQzAPI5DfW6xQBIlljVTzwZpDdwJNHKO8MHoiWLy6vVAhE76KZcjORyDcHBG9fIzw5Bkiy3hhQNS5kVfmlQPO1wbl26ekrq0tQWf3sNbUo1g6NMhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705673437; c=relaxed/simple;
	bh=nHXK0M/RJcCyXcMUGL3CX69X6MS8uSHqxCI8rFn2VmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DBywfHaZrRYqy+AOFO3ePSG4e5fKcEwkRvoatlqbz2VxjeHd4oeqKzYWWpOx3wjMdZ3ToLUzbgsd/eiNeRvXBPHLNowHEOiYopydITtOI/KFaDKE0akCJFPi5aD7Z5EavuJAR8eN2MN2gZlyoB7Oxr/U01VtXo7MDS4NZsx8WQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QP+I1Lkz; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QP+I1Lkz"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2cd880ceaf2so8882491fa.2
        for <chrome-platform@lists.linux.dev>; Fri, 19 Jan 2024 06:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705673434; x=1706278234; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHXK0M/RJcCyXcMUGL3CX69X6MS8uSHqxCI8rFn2VmM=;
        b=QP+I1LkzMqkha7VkUX0rtwNA5LULn40+mPuq4/YkS5cclBYaJx2ZebhAAJBdeuHH+3
         HZS50tCEcpnzE12MojOcMlAh+PYyXsvUkjZqHVjKoGfGmXwbiRs1q18YzdDEVw2Ax+n7
         AdXKiXfGifvOUzp3+5Lz+5he5tMz91yFAoHKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705673434; x=1706278234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nHXK0M/RJcCyXcMUGL3CX69X6MS8uSHqxCI8rFn2VmM=;
        b=qaZapTzUBDIkgZKRAxVsrjVvsFrIFlywSQ7jVp8bEBFK94ekMuUWZmR305p3XwZIRZ
         Mk+r9/c90KOHNgY/JJQv6TpDmE0wE74y+c+pZWqfgmQBsCNbfSAVFhHlTsPO6RV+NQwP
         gCPDeDZ/cOqgtvkHA38BE+AkSOUJcp7yL2fg3jZ0JS1n6zJUb3AKeoNGEJCekgefu4M9
         gROH9kCbmtoNNCsOJ4YULw/r5sk3qtsDQjtq9Jr3td85M2IYTHawvDvtiC8YCLTCkFpb
         oz1/VJnSsE0J+LOJovla6gf7pEV2uxOlwSc4QYgXma+nFvMHibjD9+MMu5Csbk//KMOO
         Cr5w==
X-Gm-Message-State: AOJu0YxcdCaUyRDV3T5buFCaQUXgLseYhqtjcAm0ZJHhKAbNIRC76IRH
	PeaCFOcIAidCQx9QogTZSrbRQ0QtarGyvV22bULlO4GshV8qZWEIm7o7eEA9kM02jIapwQf1uis
	PYSAyRr9z5BZRR4n5WQj9xdIV++WnhJhdPBQW
X-Google-Smtp-Source: AGHT+IEFCjeV0kPn36vLidVc3VqzoEt8h6MuGqJE0fkj1ZsKwfkPt7HEFEvhTaN/u0H5BfClm2yPwTDCwB/jUKb8HV4=
X-Received: by 2002:a2e:3506:0:b0:2cd:2ac6:9685 with SMTP id
 z6-20020a2e3506000000b002cd2ac69685mr1271557ljz.92.1705673434623; Fri, 19 Jan
 2024 06:10:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240119084328.3135503-1-lma@chromium.org> <d2329494-2c57-41bb-a9ea-2c9903500d1e@roeck-us.net>
In-Reply-To: <d2329494-2c57-41bb-a9ea-2c9903500d1e@roeck-us.net>
From: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@chromium.org>
Date: Fri, 19 Jan 2024 15:10:23 +0100
Message-ID: <CAE5UKNrU9YHoCQr8HLFf9-T4-NobQ4jWtryVqq9okFz8nVezgQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Introduce EC-based watchdog
To: Guenter Roeck <linux@roeck-us.net>
Cc: Gwendal Grignou <gwendal@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Radoslaw Biernacki <biernacki@google.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2024 at 1:50=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 1/19/24 00:43, Lukasz Majczak wrote:
> > Chromeos devices are equipped with the embedded controller (EC)
> > that can be used as a watchdog. The following patches
> > updates the structures and definitions required to
> > communicate with EC-based watchdog and implements the
> > driver itself.
> >
> > The previous version of this patch was sent here:
> > https://patchwork.kernel.org/project/linux-watchdog/list/?series=3D8179=
25
> >
> > Changelog
> > V2->V3:
> > * drop "-drv" from driver name
> > * use format #define<space>NAME<tab>value
> >
>
> I am a bit lost here. You dropped my Reviewed-by: tags, even though
> I specifically said that they applied with those changes made.
> Also, according to the above patch 1/3 was not changed at all.
>
> What else did you change that warrants dropping the tags ?
>
> Guenter
>
The "-drv" change was related to patch 2 and 3, and I have used
"format #define<space>NAME<tab>value" only in patch 3 (as
ec_commands.h is mixing those)
Sorry for dropping your "Reviewed-by" tag :( I've assumed (wrong) that
I cannot take it for granted sending V3.
Alos in such a case if there are changes in patch 2 and 3 and 1
remains untouched shall I send only 2 and 3 in the next version ?

Best regards,
Lukasz
