Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504DB15A9
	for <chrome-platform@lists.linux.dev>; Thu, 22 Dec 2022 00:38:41 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-40b40ff39f1so7746427b3.10
        for <chrome-platform@lists.linux.dev>; Wed, 21 Dec 2022 16:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yzZhw6ffUxADtGAtnmUBgN031mQuJfIajgUr9oqVk30=;
        b=dpRdWg62PLIUZnk08JFnInnXwlKhrq+AJ+tLVEj9OK/VkhR0WZ7LSpDc7zqXfXtxrV
         EzPbW5sJeh6WjQFbHvXeoRPsp1ZYsD0udH2dQEXEOc3nl/3DTQx0YY6TLDKMnYnEQ8mF
         g61IP8JQt7AujwnTNvKoJj3/6C9WWpB4lWumw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yzZhw6ffUxADtGAtnmUBgN031mQuJfIajgUr9oqVk30=;
        b=JULErpLxK0fmQs5KYJ9R5yl5Ci64AEp6ljdnZgvmFg+DeGKgZnuZVYuQ4Sntw32YES
         zl+/dEwRI2hzhDYgxJchSnsKQeiLlPh94Wr3teWJiGKsRE/T7iDu6FFtFdNkukf85DcU
         O9H5sOq7GCgMGQ46qaNAEeXwmDUVDPtKaV6cpN5cQgR3n8RFZhzFYm/q3/nvD37BnGTL
         I9oZayHq+ADPDeXGsguJBpS00yYjJu2HJPJHyXyzm1p77qvUsOyBhLVEdPzasxwW6MST
         PXN1lMjKaBH3LysQ/m48qlBuPzYG9PIKPFQDVPn1G8/N5ql44KjiN9liNczToGXmqpB8
         Ml7g==
X-Gm-Message-State: AFqh2krBb4o3g8Xk8kDKT0iQ9alhYIuNW1FqXstVDeDEfle2ZX/QJdBU
	kTsyhr+vzwAvOdB7KRa3PI9525XECQYuioyrwII7yg==
X-Google-Smtp-Source: AMrXdXuJubKyhMZ6g8xPpr2vkvCRX54HmxW9BmdrsrKktXZz4aqmlb/i0oHqB0rL6LFiIbe8BQq/LHF5A5WBdGKMLwk=
X-Received: by 2002:a05:690c:c98:b0:3c8:cd0e:87d6 with SMTP id
 cm24-20020a05690c0c9800b003c8cd0e87d6mr400912ywb.272.1671669520177; Wed, 21
 Dec 2022 16:38:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221221185540.2265771-1-robbarnes@google.com>
 <CACeCKafZu=46NE--r9W-wtJWAhj8=s46yCBO4N4u5nt4COqYAQ@mail.gmail.com> <CA+Dqm30XF=wDVcdUabbHySp-fwf+zFNqXpdYDW3bDTOwRbkiZw@mail.gmail.com>
In-Reply-To: <CA+Dqm30XF=wDVcdUabbHySp-fwf+zFNqXpdYDW3bDTOwRbkiZw@mail.gmail.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Wed, 21 Dec 2022 16:38:28 -0800
Message-ID: <CACeCKafGg5=1MQQdCtXDm-3LE2VsixHPsUDngRwQXUvAwQ=u=Q@mail.gmail.com>
Subject: Re: [PATCH] drivers/cros_ec: Handle CrOS EC panics
To: Rob Barnes <robbarnes@google.com>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, dtor@chromium.org, 
	Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 21, 2022 at 3:55 PM Rob Barnes <robbarnes@google.com> wrote:
>
> On Wed, Dec 21, 2022 at 12:23 PM Prashant Malani <pmalani@chromium.org> wrote:
> >
> >
> > Can you provide a link (either in the commit, or here in the comment)
> > to the coreboot/BIOS code which uses this value? I feel this should
> > be documented in some form that correlates the caller and the callee.
>
> Link: https://chromium-review.googlesource.com/c/chromiumos/third_party/coreboot/+/4023535

Thanks. Please add a code link (for example, I could find [2], but you
could use another code mirror
if there is a canonical one for coreboot) to the commit description,
or in the comment when you send
out v2.

> > Any reason we cannot use the existing event_notifier (with value argument)?
> > It's a system panic, so I doubt that computational overhead for other
> > notifier block
> > listeners is a concern.
>
> The value field is already being used for "queued_during_suspend" in
> event_notifier.

OK, I suppose you could use the data pointer...

It's just I find having a notifier for a single use case overkill(even
2 would be fine); one could get away with exposing a method
in cros_typec_debugfs via a local .h file (it can compile to a stub if
cros_typec_debugfs is not compiled to the kernel);
the LPC code can then just call that method instead of invoking a notifier.

Best regards,

-Prashant

> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bdc48fa11e46f867ea4d75fa59ee87a7f48be144
[2] https://github.com/coreboot/coreboot/blob/ff6b3af113f84a1957dcdf8a8179a751ce08becf/src/ec/google/chromeec/acpi/ec.asl#L15
