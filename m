Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379492EC571
	for <chrome-platform@lists.linux.dev>; Wed, 14 Oct 2026 21:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013484; cv=pass; b=O3gAtWUYgmdhWa8cEpHOufjQZF9z+86nSFNKXZIrVRkAfS5oB7wYl9v3rSCJhDrA2f41fz6XPOtzA4gyHBNy1iHjRWUlDy/Ggch4lGbIoGHLL3H9z+ygFARZxk2ymBAJLRCIEOPWgSnxei6SNCvx4E99I9F7ywa5ci6TVh9hleI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013484; c=relaxed/simple;
	bh=N2//8YzpYh7RD5FH3/we2KabQEoyKWuwF8/BIhfoJs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tw/Qp8RxZcEvj1dTilSW4zcGzFE01t9zLuBzWRH6JbXyebDRlsMF+oT3xF94Cdb5VU/Y963OshIcPZegtXmrpoioaBWVPyLkovZFevIU0QEbxE96RjaxlxaNcHpRYGuXIXFE2Fuw8gXiBD4m57VSDks/dEJCRclUT56x2tYIN9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vxJNULKb; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vxJNULKb"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5337fa12431so1407611cf.1
        for <chrome-platform@lists.linux.dev>; Wed, 14 Oct 2026 14:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792013482; cv=none;
        d=google.com; s=arc-20260327;
        b=Anijmho0UJzo7igQbjZYYN8iY0JhOevD693PK6auSIYez9qPuqppqaTcLH7OJvLV3Q
         Qf9+X8AVB/Num54xkxPOuYBoUSzM9GCyvxnGrj5w+GMs/hFskJ86P8bPm3I97H28tPx+
         DZlsQias4cZrpE46LW0SLyzes4iFwrsOLS7yk9xu/8fmDL1T7cmkTA9FlgVF/ztlW804
         daEvxbnRoUvYDVtlvs86hYxfeul/Uu7cycqYY5yMA42zLpOJa7s/fjjOd4KRsjaZXaDy
         unKR4vOJ8T+ulO7m4F4n/ADDtleECtkjWQfmEV+fsjCZyXKQKitveCrXTQ5VJ5es1Ide
         xYng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=salcn/4EyworpNRCKf3UMv4eLln63cK07XscTHdnYOY=;
        fh=br0gIQO8Malgp/ojiGYDjOSgKkmT5njEXvtnh65M6aY=;
        b=GFZLPaJRdRwbVsvxsyuFOYd/HYabgSArQo7iymfvUPckL3oascyh4zNW7FPSYbqygE
         4U/qJF4qOBfkc9fr5t0oebY/AG7pZCunbKz18qwz/7kbhTo6pEw+X9naD/EVcmLGP7p1
         bY0P3AaQZa8DVezzoMFAPIe6R1k4r1C0SZXOpn6Q4CgbDIW0v/ACh7nnAMjtBSIOB0g1
         95LVKg6w7iz3Km8vWJz8qDSVtrlsSngawkIb7gncEHqEMht8ZGDursNqhah9TY/bzOej
         7Kw5/51GnyYRuaoH7uPb4YG9MSy6FAuX6nBxRJmrk0PBEbix767AtuaHeAwS5Zj+7Psq
         aCxQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792013482; x=1792618282; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=salcn/4EyworpNRCKf3UMv4eLln63cK07XscTHdnYOY=;
        b=vxJNULKblZymSl6gVI1ic3sRSu4kGEjgIeobTje2blGtcFkofJSRWkyM6uSJqmGcuq
         FXvu58we8ehSniiQLU7LBoaDmhMD1gcwz0iSnF8W3Uirr+NLLJwUaOJuMucXYls0PT9P
         blVWF3HP3d4f8i9HfDq9Vsxz6fFoXriDybqUrGUiN1sSrXOTkhnzVC5N2CEvdoa5xH4y
         OweuJdzYrLfhLAapDpGyCcjwRELM8x2wVXVNFqJRzSM9nkQIjeunVLfjxSDcNHgslkyq
         Cs723Q9BS6JHjKfQcnenEugXgiacAOD5+6y1orsE6iOE1D2+fEksMgDhEg3gombvBeUT
         R4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792013482; x=1792618282;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=salcn/4EyworpNRCKf3UMv4eLln63cK07XscTHdnYOY=;
        b=0Kt9smL/7GCmwQEo9LlaMZerPUcz3hSL27LH8is5qSjCYrVt1u2maj6l0dhWrQJUHm
         JzLufaXO+CCy+2UZlDKG4OjfkIdfArjYGjdxvt5KOgCm2N7YmkMcqSn3nNLDRgcPAhko
         sJUmmllIWQRfxNHUdTS7KmBkKyBx2xzABZOWBPQMvdPLvLEK5E6exurXu0WsTdwHJiVJ
         5Ne6is/rbh8midiEQpwSF9APwxEH3KUX7Ck9DIPjvyFfc9QHY1ap2gTbBopApcm+CjON
         pT6lAGg69BlZZ00SXJAW1eZErNxu/5UPwWCSFo/bHWuJ/KaiOTDyDt8veLZW1O0b02af
         3hew==
X-Forwarded-Encrypted: i=1; AKwUvBzrbYdS4w2Z0JSZCrBNNVLHECjBLp8JnU9Q91HOYPTKen+TsAqmRRlPKI7Fgvj9YEMmWPqqrQ6ekkOTo/ndxK8=@lists.linux.dev
X-Gm-Message-State: AFq9FYLGESdHMXPf/TjfIbMCuexU3wMvZqknXGHU+WqATtKbSgIUxS+d
	I0G8sg0WVf+53DzsqYwtAulyYxmMY3rV6oicL5NdfRxEC9zp+78+G0stwlWojS/bbzxOn2pYXME
	QAqm1xAFyQCMEZIATNX6dFaoLJLw8NitxV3LckipcPWqBg8qhzGZujD60
X-Gm-Gg: AYBFou1yvqnu+KmKv6lWrTATCMJ26MjBLwiwgu+3dK7wz47UR/jOX5Zvg2bGjtELYGn
	w42fd1+uJ6cZKJqZI0H+JW2SsTWV75QCeLmqpgqSJHjdtwps6LM6Zmx7jKl5PUwvIyl9XPmIyxH
	Z+4bU2h1bHFULdQnHgEcJr6gbJK9KHIw5I6vNHaP9GHR8hSFYXQLv0yQGpDwUsrb0eVvphwOMPk
	zMYaQ6Y6wpkj91bt8F/ZSHkFdVmChpEU1QV/zYZtzZI2IG5dXPTUPohfuPrkvkKMTN/j5V0SWz0
	EbZC/l6/nymFrYhELCmXMACnta9ntYWulrFPUSvKpsXHpeOOlhmhGDi7DXon9W6wqk+Zp0vyABr
	ukvIJnsxsRA==
X-Received: by 2002:a05:622a:1306:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-5361649aca9mr627821cf.1.1792013481394; Wed, 14 Oct 2026
 14:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261008172208.1139281-1-scollyer@google.com> <as8slqeTjJYWOlaa@google.com>
In-Reply-To: <as8slqeTjJYWOlaa@google.com>
From: Scott Collyer <scollyer@google.com>
Date: Wed, 14 Oct 2026 14:30:45 -0700
X-Gm-Features: AclHuK9dTNy2V58Mvde2wiIYRycH3eWAjlKVw_MqF69XjxEhPGK5vsGbDkVBF58
Message-ID: <CALUcz=0LAVTML4GsrSvJ555Scr20v3b=t3Qs=E3Vm5yiZKBBVA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec: trigger kernel_restart on EC_HOST_EVENT_PANIC
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

When the EC crashes, the AP will be reset as you mentioned. There is a
slight benefit for the EC case with this change in that a controlled
shutdown of the AP gets triggered. But, the primary motivation for
this change is for ISH panic handling. When the ISH resets, there is
currently nothing in place to trigger an AP reboot, and this results
in the sensor stack getting out of sync. So when the ISH panics, we
need the AP to reboot as well.

On Wed, Oct 14, 2026 at 12:17=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> On Thu, Oct 08, 2026 at 10:22:08AM -0700, Scott Collyer wrote:
> > When an attached EC or ISH device reports an EC_HOST_EVENT_PANIC host
> > event, the EC/ISH subsystem has encountered a fatal exception.
> >
> > Handle the EC_HOST_EVENT_PANIC event by:
> > 1. Logging an emergency message (dev_emerg) with the device name.
> > 2. Calling the panic notifier chain (panic_notifier).
> > 3. Emitting a uevent (ERROR=3DPANIC) to userspace.
> > 4. Triggering kernel_restart("CrOS EC Panic") to cleanly restart the AP
> >    so that panic logs are preserved and collected by crash reporting
> >    services across reboot.
>
> If the EC crashed, wouldn't the AP be reset anyway?
