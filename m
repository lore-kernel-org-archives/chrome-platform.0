Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A785733123F
	for <chrome-platform@lists.linux.dev>; Mon, 27 Apr 2026 19:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777316618; cv=pass; b=it0oR6SeDULW7GeQ3DppBYO8FkgblQTLes1MhPqjxWqOUhUlNJSClglwmoIB9j3tPMoNZec/hR+y1hEyUkJBuK8ToRvi9q3ceFQL9OsnigyWm2Q25br3Rh3Pj4Jey7IPtA4pTAnCaHy5H43fP6dgPA4o+nG0h6Gh7V6gGNuFxy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777316618; c=relaxed/simple;
	bh=qrAk2Ugdur8I1LF8nPq6o0cZ07+Y2miZE4zEPwxhJyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JHM3VyLZwpLv8V9OdJaA/wcF/E4lHaNoO0iTuzcNHzDGTtXt+Y72J2971T7bHUSomp9Dl6nJnfLMeqX7D4uGfsu2Q67ZIVCmRhQbfzsr7vNyaOQT4Uv8pY7XswkUP8sm61MbC1hxIce1cjXZkLe7iESKQTW8RzelpVoaUvoz2G4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DOQH+CJY; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DOQH+CJY"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891ad5c074so22935e9.0
        for <chrome-platform@lists.linux.dev>; Mon, 27 Apr 2026 12:03:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777316615; cv=none;
        d=google.com; s=arc-20240605;
        b=FdkJEyuKQb/D0IHJn/jug/AZeamRuxtlpy8hXa93l5YkXJsaCETZ6BXjpHz0reFpb9
         PLGKefM3kiwobSFfTA9z7ZA+LGF9eDq7lDinFP5mOG6ZwUD4kkFGCeQas0auPsnvDHKO
         pxSi5wlEQDl3RynHRDn/Xh3b3kf5dDmVmOBpJAH+m7zNbwYr9DW1QMpN5zQy9UhwkGdr
         lZmOU0npLI5ZeMrOA/H+QacpqYgtOoX8fcSlqfjeaUGfkor8Q+AfR9nY0XofFKnAKvGY
         Wri6LNmUtroB4aNDF5uJ2ywdWjdIOh+bzSZ6wtJkRS3JuJxwfv4+sDoJAqDND1F8h4A8
         qPzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qrAk2Ugdur8I1LF8nPq6o0cZ07+Y2miZE4zEPwxhJyo=;
        fh=R9IPaYifvRYiL87lLa7inNdLTrELYZcNV5TrfJmJvRU=;
        b=dflziAM9RsAAtO1ZOGw23yQnSmEOdpES9Ma79rv1MtFTdvs0pdo5ZOIV3MNurpojWF
         aVIZgT6N9eknSh+ymWFSxtEwGimfUQLxEBoax/jlt9HfBf87Yu8VmPRjwdTAtNR22gpz
         AdQ2iu/mbzYvUhrTTnunegQ9I1+7asHZmY5vLw6akuaFmNRxXXC9hPnQajP3bBjKvfiq
         sVZZHzLyuzEUSVKz0G9ULc5+4rnJx38tSUfmQ05N4Qeq3w/Zlj+oyQWPSbJYili3dT4t
         1Aig9QAYqIT79KRSWqNF4Bp6pHBr6DGFHM3WCAt0D5m8TA+1cT33hzu3IcKCMghGKUBK
         pG6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777316615; x=1777921415; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qrAk2Ugdur8I1LF8nPq6o0cZ07+Y2miZE4zEPwxhJyo=;
        b=DOQH+CJYzwvFOG/l9KKmULbRfDLtP2ZkgLB4PLGyoO1igrw2HYI2BDueOVLIlatT5t
         EBKaypweWhlmu7eIbEQLmSNCXGDkf9x4iSl/Aug/6LLaC/mF/q76QvYHY1rAEJyRfJC7
         /PrsCFkIkzNpLummzGTCtcZQwKjXT0n2fenFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777316615; x=1777921415;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrAk2Ugdur8I1LF8nPq6o0cZ07+Y2miZE4zEPwxhJyo=;
        b=Z6bLWiLlNtPgNvYdoarOULxFzWTgGYJksQCGjRdvPAmK/aPHMFYO7nzlTztC6veAgD
         qDdJL7V66OnEDrJUqaXtd0WCO8KVjy6jXoP4SFIV9iBsoMQrV6G3LF6MuGNM7rKdEelG
         ZCQzZ+hAhfBn8xrMq2eo/aacYmJofse9de4O/Zd/AX/ytPd7W3Mulaq6RZgNoTwNtQP1
         YxcfY9FeE/t1LTCjxncBFNsmZgXb8z8CMPp3TYtV55pUZv/BjBAPKSxFv9lWJBa90qlj
         oA6UYjnFxta1e1a+1ICxgTGm9rQIe9p/89PjMnWCaAmi0UWoFP3rekf+60kLwHMg5LTI
         4FLw==
X-Forwarded-Encrypted: i=1; AFNElJ9CLtLN5xck/dgXahipG24bTLIBrNPAjVpE9bom7B2fG+5M70sURneGuv+5o6dOHbHSPX3TcuNbvng2krlBBUQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw8J/1igmaOHYv9Lu6Mz25J6YmUPu0xPW/9/MNj1nGUd/fGP1A
	0zMwdTV0fQpRJKsW33TvgzSRTNOgSECpKiH4WVgfOmtU1Dwo4WDcVuKK8EMvsxgOr3oRaA9gNC5
	NUwn62Skb1M0LL+YSPAbS7x1C3Q2BcovVAKxoWZ1E
X-Gm-Gg: AeBDievvX4x8b27Cc16dTbrq3QmWFZlZlyZx9YeNa2h7Fqk/axZ0x6lN2EnoBpw3R2K
	GLXTXXo0dEt5GstKOPKFHCihHBIUXxG5ugeh9FyikVlw4d5pjnH1aXMn8HpYxJoBlcTWC4GYviI
	2doACm3CMguUqsKAPccBiSxNJNLfFgT9JdJY0lzzqYDVNN2+syr/md0lBJKAhDTy/EqSy6uRBXv
	Quc4eKGLe17kGZkjJWdY97+V3wHVQLTKMq1gz4chw8VEIS2AXW9gXauPKntl6JAyJsqDGVQusoO
	/V2DoLqj76bL7qWj9mwjSot2Hw==
X-Received: by 2002:a05:600c:a010:b0:48a:5d55:c194 with SMTP id
 5b1f17b1804b1-48a774c26ebmr150035e9.7.1777316614744; Mon, 27 Apr 2026
 12:03:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260426220204.118399-1-titouan.ameline@gmail.com>
In-Reply-To: <20260426220204.118399-1-titouan.ameline@gmail.com>
From: Julius Werner <jwerner@chromium.org>
Date: Mon, 27 Apr 2026 12:03:22 -0700
X-Gm-Features: AVHnY4Ibo7FJrX4buAgGz_pkD6kB6J8sFkQR9bwC6Jiikff7iBGRhZrVKovFOco
Message-ID: <CAODwPW8S2q+mcLY9xM+p6usqa+rXXj7nv0QBEve_4hywMtO65g@mail.gmail.com>
Subject: Re: [PATCH] firmware: google: fix orphaned devices on partial
 populate failure
To: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
Cc: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Why does device_register() generally fail? Is it usually a problem
with the device specifically (e.g. the device driver probe failed) or
does it always indicate an issue with the core Linux device framework?

The coreboot table entries are generally independent of each other, so
if one of them has a problem that doesn't mean we need to kill all the
others. If there's a chance that later device_register() for other
entries would still succeed, I'd say we should actually just continue
the loop instead of returning immediately. If it is certain that later
entries can also not succeed (e.g. because this error can only happen
when the device framework ran out of some allocatable resource or
something), then I think the current code makes sense that just exits
with the devices we already managed to create.
