Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A172F21
	for <chrome-platform@lists.linux.dev>; Wed,  9 Feb 2022 06:06:10 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id p5so2953200ybd.13
        for <chrome-platform@lists.linux.dev>; Tue, 08 Feb 2022 22:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FN0gab/8iuXeK8A6dckkUHN5/70lWEtJi9g53M43cC8=;
        b=iREUxyq3oNb1QcyV0Xj2gsXk5dddXZgwLrzx4f5yCEWrRgCB0Mff1aQ19MpHDoYWUm
         R0oPox2fE53BJ4iR7WZZZXDMFPkb6wGXSat5eYLwUuKNNsAn+cAqpr4e/qs5lgCay7ry
         /SKF0b+xGLxo83xSFbY97FDm0Tnp9aSvgYU9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FN0gab/8iuXeK8A6dckkUHN5/70lWEtJi9g53M43cC8=;
        b=voYBm/WWJMes/7peW1WhQgfhIR2ApY9sE+5USXfKg7NIGnsqcb0fYDn+sYRTsIclZF
         uLusUrCU9H8mPTJtx4vxx7YnFvfnc6fcR/LzkYQtTVtqlXnld4UF66aRtBZKMF5g6Ot2
         AZreYD2oKBB5ggHSo74joDYdr3QKKky7ZHL11Oeny+hioB6NnT2EFjJ9exKIKWLUaTS+
         V+y3cTYrLWo5mmEkfS3uYLRgVbkX6JjVf5pWqXU741B6LTmO4PJWWLOOJ1dyF4jSr8gQ
         fVa7yymACnOdkVORttMNo6jY0m7Mm94mWkqOnIP2VCqkzMX2fRQzfqwY+VsQN/dqRbfl
         TNeg==
X-Gm-Message-State: AOAM531q7L4AZyIME/bgbQNRzT6VGWVLztCmxVtGakm1vvlpjhD5XDr6
	wZH6wixx2rck+8VVVfxxUTheBeriMf5AeMhWU1yAQQ==
X-Google-Smtp-Source: ABdhPJyZ8q0NTd4CzSsBTcZGEIRPTm0oAVMw6rwXOSVITPr5T3+pG1W5E8XPum85xY1cBbu7fAjBjwrnWcFrqroA6d0=
X-Received: by 2002:a25:be43:: with SMTP id d3mr729575ybm.454.1644386769330;
 Tue, 08 Feb 2022 22:06:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220209045035.380615-1-tzungbi@google.com> <20220209045035.380615-4-tzungbi@google.com>
In-Reply-To: <20220209045035.380615-4-tzungbi@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 8 Feb 2022 22:05:58 -0800
Message-ID: <CACeCKad4hs3WMt_fVQHdwOGF3xW8boKKOKsF8xR4o8q8-0jxnA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] platform/chrome: cros_ec: determine `wake_enabled`
 in cros_ec_suspend()
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, Feb 8, 2022 at 8:50 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> `wake_enabled` indicates cros_ec_resume() needs to call
> disable_irq_wake() to undo enable_irq_wake() in cros_ec_suspend().
>
> Determine `wake_enabled` in cros_ec_suspend() instead of
> reset-after-used in cros_ec_resume().
It sounds like we can accomplish the same thing as this patch by either:
- Initializing ec_dev->wake_enabled = false during cros_ec_register()
or
- Setting ec_dev->wake_enabled = false just before the
device_may_wakeup(dev) check.

Both of these options accomplish the same thing as this patch, with a
much smaller diff.
