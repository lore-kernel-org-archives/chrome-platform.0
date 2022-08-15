Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3E35386
	for <chrome-platform@lists.linux.dev>; Mon, 15 Aug 2022 22:04:12 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id s11-20020a1cf20b000000b003a52a0945e8so4523026wmc.1
        for <chrome-platform@lists.linux.dev>; Mon, 15 Aug 2022 15:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=DScyr7zPgAT1My12tB2sc7eXpGm1MaYAl6gmOsXWGKM=;
        b=EFX2ZpZxXNlQ+0y+akoxxEz26KyvWVXp6freMq27U8K1Yf7BiioBwUiYOUtWfHYF+d
         R//fuRSqmVCQ8rQnm5oZ/fM6Uy283inBkDUSIYMoD4mhu0DBg+Px95K2A3ngfIVyEeJp
         Z4v8zHSNa8GLdF0wcm5sgBeW/jcjHBpj3U0Bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=DScyr7zPgAT1My12tB2sc7eXpGm1MaYAl6gmOsXWGKM=;
        b=SfVs19xnJDWaq1gozFpN+LqLsRst54gF6CW8vgxj4SzEMbNXYViTlLb2s63NeI3xXB
         8/WXfXB1qwHszZMW99ZzQPBJ+qrdexGVbci52vMgIBDUJq6WhPkY3yh34b2hr4vfxgBz
         fa9ghksDhyNix64uW7wH0raTxGPm8JYtu7d1oGSsDaLBnRcd5nJbL8mrDEX0V6MMbcDn
         Qx05MR97jJYNquaOnETB8EDNSFi1IsIaKFnL597jTy4hWCeEpYw8pbQ6GzhUx0X2XuBQ
         twSXukLtuWG/SmZYvfWj1+1AIPNJC0cbB/2kAvhkSOHteIxXrDzl/6GpVXrWiCumLBu5
         WLHA==
X-Gm-Message-State: ACgBeo1FwBIYwx9+YESNQ4P6Tn9t72A8lkgYgRA8atdUM41B6j+0I42C
	1l4thX/Lgorp5KtnBzgWmJImaPTgbkuvaRzmTj1H6A==
X-Google-Smtp-Source: AA6agR57CeIcH1AYt48OOWPHb+xVD/XdmU+1myzuZqcB4oiegyEYpMK+k3/rHxtaQmWmSMuGEi5y4iaCvGN/RhcGL00=
X-Received: by 2002:a1c:f209:0:b0:3a4:f42c:9ffb with SMTP id
 s9-20020a1cf209000000b003a4f42c9ffbmr17599965wmc.62.1660601050918; Mon, 15
 Aug 2022 15:04:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220806204857.3276448-1-jrosenth@chromium.org>
 <CAE-0n53gc=1vwZbhGUaF2EyXotMPjqoQixUMJDidcs7vLmNORQ@mail.gmail.com> <YvqyM3n48Q/0i9XZ@chromium.org>
In-Reply-To: <YvqyM3n48Q/0i9XZ@chromium.org>
From: Julius Werner <jwerner@chromium.org>
Date: Mon, 15 Aug 2022 15:03:58 -0700
Message-ID: <CAODwPW-B80WBvhOvQ96PGwoCSa=fpnYbHv+DM3EMEzTr+1v1sg@mail.gmail.com>
Subject: Re: [PATCH v8] firmware: google: Implement cbmem in sysfs driver
To: Jack Rosenthal <jrosenth@chromium.org>
Cc: Stephen Boyd <swboyd@chromium.org>, chrome-platform@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

> > Are all entries supposed to be writeable? Are there entries that are
> > read-only?
>
> The idea here was that we could use crossystem to update the cbmem entry
> when it makes changes, however, I do see this as an odd usage of the
> ABI, and in v9, I removed writing entirely and all entries are now
> read-only.
>
> If tools like crossystem need to maintain changes to this buffer, they
> should either maintain that copy themselves in /run or something, or
> daemonize and keep it in their process' memory.

Sorry, but I really don't like that approach, I feel like this is
swinging too far in the other direction for no good reason. There
should only be one source of truth for these things, not every process
for themselves.

If people are worried about allowing (access-controlled) writes to all
CBMEM buffers, we could restrict this to just a hardcoded allowlist of
CBMEM IDs. It would only need to be the vboot workbuffer for now, and
if we ever find another use case it would be easy to add (unlikely
that this would happen often). Or if you really don't want this at all
then ditch the `mem` node completely and just have crossystem use
/dev/mem on that address and size (although this would run into the
memory type uncertainties again that Stephen mentioned). But we
shouldn't keep a dozen redundant caches of the same thing.
