Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B1231F9A0
	for <chrome-platform@lists.linux.dev>; Fri, 24 Apr 2026 08:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777019620; cv=pass; b=ML7/jqbv/UtxG5bI0PH8Qgn2dpzWtvaX/cbNVmm8dFtw+5YzXHHllAsZafpL3f+GpcO+eltOJmpvp7BUD7jNp/0UnlxO3CNA2EztprpZ+Xc6A7UYuIFv/1RLixsV48qBSnyw+jxShSJ1MuTrgFk5neZQpn451nhoZL1zAfr1AIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777019620; c=relaxed/simple;
	bh=o9Tc+LE2N3K3qGHeG1DTzY+Vz60zfABeiP7uGBhtwqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tpmBMNYVz3g4IuY8bDYSAf/JkschnhCEFCKwNdeDvsEjezItWa7MLUzhyL8t9d1QYaJcosMEofEguViVL63DQaxKp1W57Czo9+CAS9wqGwLByzhTrgOzUPdpHejWupcr4rNqajZRHPzP4tzdUtBtvBmifuRiHnQniZaLEvKe6C0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z0Aq5TOk; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0Aq5TOk"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64937edbc9eso6687472d50.2
        for <chrome-platform@lists.linux.dev>; Fri, 24 Apr 2026 01:33:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777019618; cv=none;
        d=google.com; s=arc-20240605;
        b=W21dLbeorHpyWHoFkJM+/KBz/8ZrV/FAZqVVOioqiUAcsvM1Hucbi4X62UXolke4pW
         dbyeRa/W65eW39g4qAjkQ520XEARIVD5WzRw/+HDmU0T+oG6FhOvLWRKnNeZWi3M0C7n
         g5qma4o39PN9ehURK48quAwDcpb8L61fjk52A83cgSErDkq5+kOV3O/JAbjrp+ydjpE5
         DMx/ViBuOmqq+3vFCXnzJ/gGht2FZDJCr7j5ZU1y2qoPwgb7A8vwCD4rQMuylFqiyHd9
         H0NRBk26pm8It1BJP2+Dxw+RddTNnNq9P8bJa20t19Ja9kQ8q90d6tA+3mEyJEE/SLCI
         MThA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o9Tc+LE2N3K3qGHeG1DTzY+Vz60zfABeiP7uGBhtwqU=;
        fh=AKK46nI06gTijcONf8JnxvjAo5Qp9y0UhURHNC3gfWg=;
        b=iWOsp3XeXkZWTFOYs6zI9PLqfCcVAafB/JmCXzmEafCeqB7byA6rG57ex/bePHu1lZ
         MEHoM8iZQQC6kiMGZ0hbfBowm7CVxXevsRYa+vKiMy8tWIyyQSQNSBmLF/dFI3aZE2/t
         Dd9IeZwOBQFEPU1i5vesaFLb3b/r+NKcTu3FgAHiB0JuKxhszAksIl6BSw37xQwH/JIK
         NwIGLBM86upKkUAM8hRQLtgBuzlaNVIEx71HzNr1KEpEF26Cynhsizq4Aboy0br+LVwz
         1kJbWi2eeYt65+1ncIptiwUl4jmDLxX2rOrBlWmcbJWI7xf/fAvPmE2o7AVwAltUpFMK
         GJDw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777019618; x=1777624418; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o9Tc+LE2N3K3qGHeG1DTzY+Vz60zfABeiP7uGBhtwqU=;
        b=Z0Aq5TOkFE2lCqir58AMFuZ0Em6jJqNYS4MNbspqFrPz314/34jGyx9YfTPn9XCwO8
         CX8++nO44GSF84m+FdVyYXpxWbLl1Rc7uCfwE6EeEO+5sfdMlzOZ6E1ADHQWbiVg/XTY
         LpcbuBRXoFrHVWaWtyQ561++rhozq9ojv42l03qYMbLF62+aU86SdYY2R7xpe+Ami652
         aCKhu/TO5COKNWrIomFeJCY+obtwuwleqOJm1qYncnhTfhMGtBGGjwQL7qrluHsZt8NA
         iw/yFZ5IlYLBrc9GoFAz4jI8slVgXhZu7xfkeuZH9fCGxJOjHL84KZXzHRiydjtsxGna
         HcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777019618; x=1777624418;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9Tc+LE2N3K3qGHeG1DTzY+Vz60zfABeiP7uGBhtwqU=;
        b=H8/mm7TsQxtsBuff7HF750QIyWJVXfpf/6nMW3s2//m20E5YGnYHVHFe4dLoJ3uBBL
         MjY0YMCA8ksls6LRnOgBzTsuI0vF+iMxRgRJ+po5av0dZHyZaavLr0IJn4fFJBjlF7S6
         N2x358whF+ph8HmjjPGWPYUcx1DTmHLz538nsNLQZX+FvUzz0DaqoJqmFyoqtHx8ugV9
         NDEnMbyJWJPYliXyz2FMA4UfS2HXKrlxtQxDuaL+T7Ma+4XMGcIaELdxPsJvstNMrkGr
         K0POcao4TB22MsNU+9dxqzQrYlXZJg7ki0bLKH1d4GuEQXUJ+YQyHhxS7IknYE/i1pHI
         dc5w==
X-Forwarded-Encrypted: i=1; AFNElJ9ks8Hea7yAYpdrlZLrPBk4WqFCDxbNTeeVbZn0VrSVCUipbEZE9oeiJGSH6zq2F/SYnCy06j7N4kEMoRzupsU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDlDYqMVMinGrAaZSALwJGDXaMtI28M/Kl+i1Q2+RQnRn9Ezpa
	Ia3yyrrSc3fDgYQqHb2g+K/FN1AW8qnPD+eZFRF+WDKBYuDvuKYW6XUpdMGAG5gosVCzefLHoSs
	ft6Ce0DyOA2uWUVDpZlPgfDO3MU/SdlQ=
X-Gm-Gg: AeBDieviXRzseCERnzOMl4WoRKEyjFCsBY4gYlLHynPdYy3kxtcQgSjtwl0SNDOJKY6
	ovvDfNqU/KxjjW14KqxQBwD9fyFqpgSg6+j0L2V4KfPFzinbr00tlwJ+qQ7a1UIjEiK3df8meLJ
	bK3c9JKrIfJ/wKDhwiBjM5oyWTpWNfgXiFaNbZM1kLw9/XX46L9EXAyxHP03u5foI/iryRd4Xz+
	1QK7dQwjhdngoxRX63OfX8TQzGwRoleI+el1Fph38YriQ8IYZTed1TDI7pmOoM7WbEfS1Gv6Lx/
	d4G7yFKPtO1L/0xasfe2
X-Received: by 2002:a53:bf0b:0:b0:653:9e2:105b with SMTP id
 956f58d0204a3-65310863b78mr21753136d50.25.1777019617832; Fri, 24 Apr 2026
 01:33:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415175038.3633384-1-lgs201920130244@gmail.com>
 <CAOesGMghHi5bEcec9L6d1YUec0Cn5uEs8MrjdoT-zHSr-FJ8pQ@mail.gmail.com>
 <CANUHTR-XcTO4jy_TNe7tHcPPpVh_o_+-hgJtLBxN5MWupcvQ3A@mail.gmail.com> <CANUHTR-U+DDaWCKNUcNE2yScPkk6vVfnZ=GXpGtRt6SFYph_Ew@mail.gmail.com>
In-Reply-To: <CANUHTR-U+DDaWCKNUcNE2yScPkk6vVfnZ=GXpGtRt6SFYph_Ew@mail.gmail.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Fri, 24 Apr 2026 16:33:23 +0800
X-Gm-Features: AQROBzAGvtdaL5hCS8cZfjfvqw_W2IJgQzt_3ZfVldCokq1dpuv5P3O6ftcEQ-M
Message-ID: <CANUHTR-agWsWdZbjYUesvyp5OMqRrjbhg0zEbEgU67q8Br7b2w@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: fix reference leak on failed device registration
To: Olof Johansson <olof@lixom.net>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Olof, all,

Just to follow up: please disregard this patch.

On Thu, 16 Apr 2026 at 18:21, Guangshuo Li <lgs201920130244@gmail.com> wrote:
>
> Hi Olof,
>
> Thanks.
>
> On Thu, 16 Apr 2026 at 17:26, Guangshuo Li <lgs201920130244@gmail.com> wrote:
> >
> > Hi Olof,
> >
> > Thanks for the review.
> >
> > On Thu, 16 Apr 2026 at 05:47, Olof Johansson <olof@lixom.net> wrote:
> > >
> > >
> > > This looks like slop to me. It doesn't even compile (there's no local
> > > 'ret' variable in the function already).
> >
> > You're right, I missed declaring the local ret variable in this
> > version, so it does not compile. Sorry for that mistake.
> >
> > > This is also a no-value fix, the chromeos_ramoops structure is static
> > > data and not dynamically allocated. Please don't burden maintainers
> > > with these kinds of "fixes".
> > >
> > >
> > > -Olof
> >
> > My reasoning was based on the implementation of
> > platform_device_register(): it calls device_initialize(), but if
> > platform_device_add() fails, platform_device_register() returns the
> > error directly without dropping the device reference initialized there.
> > Based on that, I thought the caller might need to release that
> > reference.
> >
> > That said, I understand your point that for this statically defined
> > chromeos_ramoops device this is not a useful fix.
> >
> > Thanks,
> > Guangshuo
>
> We are also discussing in another similar patch whether the
> better fix, if any, should be in the API/core code rather than in
> individual callers:
>
> https://patchew.org/linux/20260415174159.3625777-1-lgs201920130244@gmail.com/
>
> Thanks,
> Guangshuo

After re-checking it, chromeos_ramoops is a static platform_device and it
does not provide a dev.release callback. Therefore calling
platform_device_put() on the platform_device_register() failure path is
not appropriate here and can trigger the missing release callback
warning.

This falls into the same static platform_device pattern pointed out in
the other reviews. Also, as Olof noted, this version does not compile due
to the missing ret declaration.

I will drop this patch.

Sorry for the noise.

Best regards,
Guangshuo Li
