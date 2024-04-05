Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF88663C1
	for <chrome-platform@lists.linux.dev>; Fri,  5 Apr 2024 01:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712278989; cv=none; b=DH7JnY2V8TflzTc0LQE17dIZUPxDuwlOicrYMMOwGhV+Ll8nU9aSpN0RRjUu8mcUNxa9Md74pPnDzOnpjsQafWWgjZawo0zmKVlKgRI36g2CAgS/XvvwOMjjQs+r88Zpo25xmpd/cflqUagF3z9f5GLXQ3rp6WD4g40r2oLXQTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712278989; c=relaxed/simple;
	bh=PuEKPC5ntikSvB+UjVXBWWMeTDjzBeQKNE0UE+QzXAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GEK0Inch7vNSiz/DO9InZG0+59h/CNfFo0U1GQk7LGaYOVAFkyHE2NDSVaOTLe/5tJQGi5sIuWbEPJLQfS5bubgIQa36HYI3KIfz45/WkyX9e14fZF20ENxtmh8l7suXGZ4y9lDe5Ghiq7KRcOpFwHLQ4wuOPdNhocaab0xwU48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net; spf=none smtp.mailfrom=howett.net; dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b=ZJ4myrzf; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=howett.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=howett-net.20230601.gappssmtp.com header.i=@howett-net.20230601.gappssmtp.com header.b="ZJ4myrzf"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dd10ebcd702so1889310276.2
        for <chrome-platform@lists.linux.dev>; Thu, 04 Apr 2024 18:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett-net.20230601.gappssmtp.com; s=20230601; t=1712278987; x=1712883787; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PuEKPC5ntikSvB+UjVXBWWMeTDjzBeQKNE0UE+QzXAc=;
        b=ZJ4myrzf5dHqWveVGl2aWW+65vgo/R6y4aMm5kDUMrXjaj1Z12AqJPvxAZ5mTiUbki
         fi+heJANoGwFWMbt/yhqju2zI0Sjg16thax49MjU6bhj3dj5vgqrns8dCUsfBVvpN9/6
         +PrlRp/Lzasw1FRDgKlCGK+gCZ59v3XfqAR20PUT2MCbS4JjeTuzCbMetzYWOpYRZNHO
         I9lnjb2urH4AVYxt4DQq5KKEfGdHBEIS0qvLaA10IbfVvundOohvinOB4SfhNJQ6xIgb
         idUORSrGb4mYcWtMsXUcENPCStNIT10deaoP+M5RKVVBkqvRJ1LHDWy/xdKOjz9JXw32
         B5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712278987; x=1712883787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PuEKPC5ntikSvB+UjVXBWWMeTDjzBeQKNE0UE+QzXAc=;
        b=vF9XzaP58egdklLhUFoZy7w4yT5z1pTndS8c3Tcpecm+oqeng/XZ/owZGvqWMDRseE
         Z4SZRtjVjfOWphx594izuRyYtaHXO6+19cVm+ipt7luEgsC7UvX0HZXU+z6s7Y2Fn3Kr
         LFC6eBEwPP/poTkSiqHdHqrHVyrESmXJGjR+oDQNlPZ++VeKfyHPbTbEE3lCRM31iysG
         FAh71FMjQrXvogkNXajDXkqDfs8b4WroJlVd+YNCcHIMpvdCvezny9Ot24+KTaD1N9+M
         Iiv+n5B0AfUmEDLOmDSGVsrSLT6oZk9gn7jZRea790QIhX8Z5W1bzlc5SbtovDQCwcCf
         hu3w==
X-Forwarded-Encrypted: i=1; AJvYcCVkhZ4AzHO1xrbp5a1SBVVr/SWkIfX31Y5j0ObWInwFVKpW1Xy+fX3pKIk31YQCHaF3Jpph7gD1b73+Gl2ERn/3nSUzY983n6J5/iwikfyy
X-Gm-Message-State: AOJu0Yyn56TWO7Cdk2NeqiBnHvo7kcspcm/PZorSNWdGCrSvficqmCXD
	0Vzo8PmhE0CmBKWuibYLGOQ2pcqp6WaKMCbwlaN0j4oYFjKZBgNGXTXVZxr6Ihw3epniZm3dCFG
	cO5KfhjcTN/tVKbDXn/kS96VImgkBHar7GVL5
X-Google-Smtp-Source: AGHT+IHWEnseDlhQnynBjqtL1hIwi1C7QJGT108fa6G2BAVEPIWXnUQUuYQSoYJUX8TWuJ1p1WmXr6d/cMiNu8/hnMs=
X-Received: by 2002:a25:ce4e:0:b0:dcb:ca7e:7e6f with SMTP id
 x75-20020a25ce4e000000b00dcbca7e7e6fmr4617451ybe.55.1712278986948; Thu, 04
 Apr 2024 18:03:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231126192452.97824-1-dustin@howett.net> <20240403004713.130365-1-dustin@howett.net>
 <2fba7925-f22a-4ea9-9368-57e50d2bddda@t-8ch.de> <CA+BfgNJrfP7H_10r+DLWrjwhkqd==3czhUaH8uC25971aEpMJw@mail.gmail.com>
 <63954058-34a9-43b8-8ccc-efc0b8429609@t-8ch.de>
In-Reply-To: <63954058-34a9-43b8-8ccc-efc0b8429609@t-8ch.de>
From: Dustin Howett <dustin@howett.net>
Date: Thu, 4 Apr 2024 20:02:55 -0500
Message-ID: <CA+BfgNJDh-niftXp-dP2oMCRybLaaW++38CBOBZsZpbU1pW8yQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] platform/chrome: cros_ec_lpc: add support for AMD
 Framework Laptops
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2024 at 2:57=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@weisssc=
huh.net> wrote:
>
> This doesn't sound correct. The code is using dmi_first_match() which
> always iterates the dmi_id table in order.
>
> I'll try to reproduce this issue.

No need! It turns out that I was tricked by my own initramfs.
Good tip not to let your distribution scripts pack modules you're
actively working on. :)

In that case: This series is ready to land!

> You could use b4 which can take care of this.
> It can also read additional recipients from its cover letter, so you
> don't have to manually keep track of them for each submission.

Excellent! Excited to use it for the next salvo. Thanks.

d
