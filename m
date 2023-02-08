Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C127220EE
	for <chrome-platform@lists.linux.dev>; Wed,  8 Feb 2023 07:52:45 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id mi9so17587946pjb.4
        for <chrome-platform@lists.linux.dev>; Tue, 07 Feb 2023 23:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zhDJApKtBQcvwymZ5SCtHomIXxqcYYVtYxL3jD0nv8A=;
        b=eqGrOQjEwqnci7sSQ7FMs3Ok0ATLFezDT3iEUXY6o7kh6Z2Ah3wdtWQk9ljBd2sXfX
         7ay1T3MqcGgE8eiymGU4SGIrPRS2Elb5ALGjaZXq8n3K70j3/4yVN6LLZNfTK0c339Yh
         RbNoAlQVxOKVyUcIsXM34bjv7F4KJa2E7uzGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zhDJApKtBQcvwymZ5SCtHomIXxqcYYVtYxL3jD0nv8A=;
        b=7z4b2s9VgWbn1/OyYMSCzc7rI1maQAkKnxJQijdby/uyPHXVAzB9+69m8l2J5nv5Q4
         L0wkcD75r1VhKkWiS/q7LJnTEm6BFPDgK3yszKhLvUcKF61dNCwEiwZx9HpU3elEOr2i
         0iK0EXayQqAihKEMhdtt4R+YH4aw1daPnhipAcgoXjcu2XZ3x8zP9JE3MgyYp/O398rm
         SikfEXcBxDoy/RVAjBenNNmplkZgvsqv9rJrSiHMvlv5/9pV1QHGPXFP0EsHtSgnDcDZ
         xtE0Gcw8eEX87Uei20BkV3C13zqALgbeEUrMcBqOFiDjnoLrotMYepCxTex5qZw+QjHn
         Z8zA==
X-Gm-Message-State: AO0yUKXeu++no21S7rungk92VWQIAnWVXLJi8yIitlLpBJnuh8iDAf6e
	tKTnkkuIjHF0U38X/n9/rljv7ckf9iSg3493pfdTkPwaSge4cg==
X-Google-Smtp-Source: AK7set85cPdzxaY0rLNikp+E53fZOD5mAQhhWbvkPlDWSAtyKYtHs7ThVA1FO3XcwaBZAO9Qs/JSARXhC6J9eEVZWXE=
X-Received: by 2002:a17:90a:7483:b0:231:eb7:ece4 with SMTP id
 p3-20020a17090a748300b002310eb7ece4mr448656pjk.26.1675842765263; Tue, 07 Feb
 2023 23:52:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230207091443.143995-1-colin.i.king@gmail.com> <Y+NQLOJ9IlbQJttd@google.com>
In-Reply-To: <Y+NQLOJ9IlbQJttd@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 7 Feb 2023 23:52:33 -0800
Message-ID: <CACeCKacOiJHMGTaT3J-B1_rYbU=yJQ2Xr7nFjX_1aMcya1xT_Q@mail.gmail.com>
Subject: Re: [PATCH][next] platform/chrome: Fix spelling mistake "Attenetion"
 -> "attention"
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Colin Ian King <colin.i.king@gmail.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 7, 2023 at 11:33 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> Hi Prashant,
>
> On Tue, Feb 07, 2023 at 09:14:43AM +0000, Colin Ian King wrote:
> > There is a spelling mistake in a dev_warn message, make it lower case
> > and fix the spelling.
> >
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>
> It's about time to cut for the coming merge window.

I thought there would be an rc8...

> I guess you would
> like this simple patch to be included as a fixup for f54c013e7eef
> ("platform/chrome: cros_typec_vdm: Add Attention support").  Please apply
> the patch if it makes sense.

Sure. I'll make the modification you suggest and apply this tomorrow.
Thanks for signal boosting it.

>
> One minor suggestion for the commit title:
> "platform/chrome: cros_ec_typec: Fix spelling mistake" looks more clear
> to me.
>
> With that:
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
