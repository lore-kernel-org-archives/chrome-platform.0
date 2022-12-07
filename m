Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08875136D
	for <chrome-platform@lists.linux.dev>; Wed,  7 Dec 2022 09:09:24 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id x22so12369675ejs.11
        for <chrome-platform@lists.linux.dev>; Wed, 07 Dec 2022 01:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LycWcOW4hTd+zMxG7ctf14bHvPvqRQgLxrdseEn+NsU=;
        b=kIqXSCKDkf4sQCsSPC3kOLk3BlpIHgjkJhEdlGQgau2QXnugNqxTPpILX/K39+tTRh
         U319uRITnQSWy82hqUjhUnKewilfz+4O4VSr+cYYmhLReyAkoTaWoLaBnwMdbnbq33Ax
         OtU3MKZIo9mSOoMZqoN5ghciaShpw/+kooSrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LycWcOW4hTd+zMxG7ctf14bHvPvqRQgLxrdseEn+NsU=;
        b=G+nW2rKFmA+Bt8oA0cEpC1NqafkX51wAmi9+p+mJSxLvpcIshxU2swNq1Ry/DaLCDb
         sXyENSpAN7SjPwTk/MiubXnwZ4NdZfC+wG9ntnusbqnmlvLfUwx3UkTxPoiI8tqWmYmq
         7r+tKHOz5G+jfZofsaPm8+UWVyVcY8/FEa7KRd9MCt1TqnUe2HCyAk3okSwxf08PsHAy
         UeyAuNkpV2R3A6AZlOgDalX9k+/a7wCdQKVTRSWOZZCQW8K631YcaZgPpRTYbhWwlTc7
         ZCAChDZL6iQeMXx1mWbGit7ClQcV0voOzOHRJXSOseiVWvfUb4qg8PSzDhqqtRfnHOsM
         ywWQ==
X-Gm-Message-State: ANoB5pk/IiBLMiCP+QGguf70DufhQGnw+HwSjnqedcYcYgnOSu4FAgcp
	8S1KrYM15JK7ejTfAmw8Qe4rxy8HcqOqC1MS
X-Google-Smtp-Source: AA0mqf6LD0P73Um8Q59U6yOOY6NADaeKLuOYXfvBxid8lxZ4JexfsmBAYUK+/GDn1MmTBi/vPOyXFg==
X-Received: by 2002:a17:906:5050:b0:7b2:8f2c:a877 with SMTP id e16-20020a170906505000b007b28f2ca877mr49571685ejk.90.1670404162917;
        Wed, 07 Dec 2022 01:09:22 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id k5-20020a1709063e0500b007ae32daf4b9sm7064910eji.106.2022.12.07.01.09.21
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 01:09:22 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id h8-20020a1c2108000000b003d1efd60b65so581324wmh.0
        for <chrome-platform@lists.linux.dev>; Wed, 07 Dec 2022 01:09:21 -0800 (PST)
X-Received: by 2002:a1c:f216:0:b0:3c6:c2ae:278b with SMTP id
 s22-20020a1cf216000000b003c6c2ae278bmr64557436wmc.127.1670404161334; Wed, 07
 Dec 2022 01:09:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221207040049.1.I1864b6a7ee98824118b93677868d22d3750f439b@changeid>
 <CACeCKads-Kwqr5iMj9=+ryXFiFnPoyNnhOuzpYspwKo5yP-+mw@mail.gmail.com>
In-Reply-To: <CACeCKads-Kwqr5iMj9=+ryXFiFnPoyNnhOuzpYspwKo5yP-+mw@mail.gmail.com>
From: Victor Ding <victording@chromium.org>
Date: Wed, 7 Dec 2022 20:08:44 +1100
X-Gmail-Original-Message-ID: <CANqTbdZVGiNMizP4Ht=-HFssySfJFugsc9_HAxEFRfhY7uPO8A@mail.gmail.com>
Message-ID: <CANqTbdZVGiNMizP4Ht=-HFssySfJFugsc9_HAxEFRfhY7uPO8A@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: zero out stale pointers
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	tinghan.shen@mediatek.com, gustavoars@kernel.org, 
	sebastian.reichel@collabora.com, dnojiri@chromium.org, bleung@chromium.org, 
	lee.jones@linaro.org, groeck@chromium.org, tzungbi@kernel.org, 
	gregkh@linuxfoundation.org, dustin@howett.net
Content-Type: text/plain; charset="UTF-8"

Hi Prashant,

Thank you for reviewing. I'll update accordingly in the next revision.

On Wed, Dec 7, 2022 at 7:02 PM Prashant Malani <pmalani@chromium.org> wrote:
>
> Hi Victor,
>
> On Tue, Dec 6, 2022 at 8:02 PM Victor Ding <victording@chromium.org> wrote:
> >
> > `cros_typec_get_switch_handles` allocates several pointers when
> > obtaining four handles. These pointers are all freed if failing to
> > obtain any of the four handles; therefore, pointers in `port` becomes
> > stale. The stale pointers eventually cause use-after-free or double in
> > later code paths.
> >
> > This patch proposes
> Please use the imperative form [1]
>
> > to elimite these stale pointers by zeroing them out
>
> s/elimite/eliminate
>
> > right after they are freed.
> >
> > Signed-off-by: Victor Ding <victording@chromium.org>
> This should have a "Fixes" tag.
>
> Best regards,
>
> -Prashant
>
> [1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

Best regards,
Victor
