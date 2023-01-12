Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F1A366
	for <chrome-platform@lists.linux.dev>; Thu, 12 Jan 2023 04:48:02 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id v127so13545832vsb.12
        for <chrome-platform@lists.linux.dev>; Wed, 11 Jan 2023 20:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/iFkf8dHZxV1Ge0m0weqa7TetCQZl7ZILZ6zxgWwBw4=;
        b=nmSBF2GeML2BxZ5iKmqSNZCgcfDR4/DPvEBiO6C2Foa+6Xi2RHvBvLTExrvjax3xQm
         gV5j2hjBG4n7dvmsTySwwjw0ItQx4Rw9yF7Z2XckEz0aOsmQmRCg5MlTB0Y3owqwxAaR
         tLR/PNSrxA5P603aQAyd1lw5QOyRLHnBQ8Dok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/iFkf8dHZxV1Ge0m0weqa7TetCQZl7ZILZ6zxgWwBw4=;
        b=sd+WQKHNJykFfnuCeVg9iuXb3Jh7geXlp0OZ3B0Mxy0pU3NVCp1SBjH01kQxFnz8Jc
         B113+F2okGepajvJ5vFXUc4AOeT/qSujFa3cfV4kmmqQOI09zMZSw+3oyMt6JpHDm6cx
         1irm4cSbXd1pvrGiynVDU2fVtffhTpkd4b7NHjF1Gdqri9mXcHomjT5WWgxrZijf4yYy
         n8dXCWKDC10qXZOAMiVU1lshLIbGmOb/PwrqaBm1agArJ+9EzyyZ7A0zECZPI4P78HIW
         pucz6hiAIK8M7aJTm+/YQAN4inAi7W5V6nTmGlQ6MF986RDduM3hvHk4gIyYj3qfq822
         7Ung==
X-Gm-Message-State: AFqh2kp7jDui2zwgk4z7BhwAVbHcIW72Lpaoinb6eAplCRUC0+zOf0fl
	4L8V1c8rMIXIos4iQE4tGySjI+6Pei0KexKSsakyMA==
X-Google-Smtp-Source: AMrXdXsq65Pfq1n8QvzT8E7hNMWVMZtanS9I0KqgdCOuK7AxjGS5DbAVk3aWa2DpvwDgRbwjaHBoJi5yz+ayizGbupE=
X-Received: by 2002:a05:6102:3d9f:b0:3c4:4918:80c with SMTP id
 h31-20020a0561023d9f00b003c44918080cmr8931474vsv.9.1673498881458; Wed, 11 Jan
 2023 20:48:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230112043908.2938964-1-wenst@chromium.org>
In-Reply-To: <20230112043908.2938964-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 12 Jan 2023 12:47:50 +0800
Message-ID: <CAGXv+5EebW8MP7M-Bpc695arsPGdkbQzSq6iSWBsM99MBF6v=w@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec: Initialize panic notifier block
To: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 12, 2023 at 12:39 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> Commit d90fa2c64d59 ("platform/chrome: cros_ec: Poll EC log on EC panic")
> added a new notifier block, but failed to initialize it properly,
> resulting in a warning and stack trace (omitted):
>
>         INFO: trying to register non-static key.
>         The code is fine but needs lockdep annotation, or maybe
>         you didn't initialize this object before use?
>         turning off the locking correctness validator.
>
> Initialize the notifier block properly.
>
> Fixes: d90fa2c64d59 ("platform/chrome: cros_ec: Poll EC log on EC panic")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Looks like someone beat me to it. Please ignore this one.
