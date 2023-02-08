Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618F89473
	for <chrome-platform@lists.linux.dev>; Wed,  8 Feb 2023 20:39:26 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id y19so20790418ljq.7
        for <chrome-platform@lists.linux.dev>; Wed, 08 Feb 2023 12:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hHBMLXtkMDMuBmGxWJ5xKD6KTeIV58QP9tSrwZRgoHc=;
        b=UYT25/g3diV3Jq60eACmOjYWKzeUlN7xIlFvhQd0LhIfnA0s3fLLt8JuP8N/toHf8t
         nfNl0VORppwAhZXGkdbZrd9v4IFvW5TJ+vvR/O5IB/5olDIU0LSHSaD8ebHszq46bxiR
         QLyXefS0PyyvcrIiB0ET5FYn3fVGc/zIyRg78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHBMLXtkMDMuBmGxWJ5xKD6KTeIV58QP9tSrwZRgoHc=;
        b=q9v2UZUcMyyDoXWOvJ2I9S6UM+TNEtX1QmKf6oENCxCtF7SKjHC4wQM2U8mhHm1sw5
         +7il+OQOQqkKLAkd3fIZvnpggKPPco6aGyvjtbOPs1YhM082NqErWap4LrfMkaMGKZDS
         NrcPQQ7McA0IKMxq6BcstX6hDZwqrH3rXjrWhXeBP5YqX8RoKZY0Z9fXBfipDjHAExkV
         UtLYIctIiGllE4OoQdkPODyYB5cYW06uRCPbV5Ydn3XOs5em6kUUJ4as6C+6/odTTkXC
         yPDP1aJM1vJ1ycwZf0bYGQn2aJna4eDHl9DkZLNNpamClI5EHgiAboTbkr1g55er8TJV
         RWKg==
X-Gm-Message-State: AO0yUKV0EbdNllQRlW/bxxphv4AoAahevJu6SMVsBmWniIqDchAHs36h
	p6fm0u4u9NI2+HXTgYN8y5cpiiBYghDlWCVCTRtIxA==
X-Google-Smtp-Source: AK7set/su4csPDm6Y8kHABC9mltJZzHg8OFQ8O69kscI/hl8JIKzjPP59FvrooV7TfPYdGAJoENWNUwYal1cEXgmXb4=
X-Received: by 2002:a2e:94cd:0:b0:292:7e94:82e2 with SMTP id
 r13-20020a2e94cd000000b002927e9482e2mr1851447ljh.78.1675888764474; Wed, 08
 Feb 2023 12:39:24 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Feb 2023 12:39:23 -0800
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230207081130.1.I657776750156793721efa247ce6293445137bc8a@changeid>
References: <20230207081130.1.I657776750156793721efa247ce6293445137bc8a@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 Feb 2023 12:39:23 -0800
Message-ID: <CAE-0n50KzCB1tSAiPdKdh4G5kaZG9VQCN3VYycSsBedXynjr2A@mail.gmail.com>
Subject: Re: [PATCH] firmware: coreboot: Remove GOOGLE_COREBOOT_TABLE_ACPI/OF
 Kconfig entries
To: Benson Leung <bleung@chromium.org>, Douglas Anderson <dianders@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Julius Werner <jwerner@chromium.org>, David Gow <davidgow@google.com>, 
	Jack Rosenthal <jrosenth@chromium.org>, chrome-platform@lists.linux.dev, 
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Douglas Anderson (2023-02-07 08:12:00)
> Ever since commit a28aad66da8b ("firmware: coreboot: Collapse platform
> drivers into bus core") the Kconfig entries GOOGLE_COREBOOT_TABLE_OF
> and GOOGLE_COREBOOT_TABLE_ACPI have been dead. They have no "help"
> text and thus aren't user choosable. They also aren't "select"ed by
> anything. They also control the compilation of no code.
>
> Let's remove them.
>
> Fixes: a28aad66da8b ("firmware: coreboot: Collapse platform drivers into bus core")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Acked-by: Stephen Boyd <swboyd@chromium.org>
