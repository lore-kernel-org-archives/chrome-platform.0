Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A941FD7
	for <chrome-platform@lists.linux.dev>; Wed, 16 Feb 2022 05:47:21 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id p5so2714361ybd.13
        for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 21:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=elu8Ka2cZem2k4zQRGJEv65TLQWlji0lH04NXcgaWoI=;
        b=LVuSa+60cggKNTvJ1zIakxD1VIAn5f/pbblK/YjQD5LI7TD31BHIqZ24c6BKqeGFCI
         OaEmU2yh7N6fQW6FBGELn61X/aBcQctz+GZJlD44yKuQ8BpCCCk9taP4fVgo/fJyMHo+
         exJd028Ht/JAdX4P236LDPuuUXUe1VYdLdI4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=elu8Ka2cZem2k4zQRGJEv65TLQWlji0lH04NXcgaWoI=;
        b=HdWvwubsUASN5iC197tcoXo6NKYTkYqmeB0XuwHhXYeA6OP2BOEAKzOPUz27sDQVy+
         N3jW/Eh2v5yCPSQ9gS8AYjsrh77GHWGrVY6XrSBp7MzjP4JEtznF8+iI5mJAJaQ8wh7A
         KC9//wAvSovI4OwQcixSqQ1TrNB2rAdcEQeev+hJC/dtiFVWHcF5fpt/OlUeCWcjcVPz
         y51wj5tYZYDUtvI+NgRVz6ZhVf74tlj8Q6nNdPXrjFJwpMxOstKLYhedxdow37CyhDRj
         V3DcPSAVeldmzUF/OQ99k+6bKkaI22GXnepiRDXDGE0p77goa892Rp4jH+pFWCi7kmST
         GKkQ==
X-Gm-Message-State: AOAM530BsbiNyfcogofE1WvR7d7pCjLZxizP0LApKd9o3QJQocJyoQBC
	VWr6Jgg+H+BNRTgB8nsCTTle72EuSCB61zXyf6IWCg==
X-Google-Smtp-Source: ABdhPJwHGG5NOl9rUjmJ5FIROtsaZzXi5k/xwDtwVPIUKH4MttQH+YypSdaXae9uXC3An9ibKfa1nMBwNwSdBnnhYtI=
X-Received: by 2002:a25:8b0a:0:b0:61a:4aab:3e78 with SMTP id
 i10-20020a258b0a000000b0061a4aab3e78mr880886ybl.619.1644990440308; Tue, 15
 Feb 2022 21:47:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220216043639.3839185-1-tzungbi@google.com> <20220216043639.3839185-4-tzungbi@google.com>
In-Reply-To: <20220216043639.3839185-4-tzungbi@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 15 Feb 2022 21:47:09 -0800
Message-ID: <CACeCKacKtJ50b2TuuhcVYPq0Fd0unVJdMuNDk1PLNK_r2JHZ+A@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] platform/chrome: cros_ec: initialize
 `wake_enabled` in cros_ec_register()
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 15, 2022 at 8:37 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> `wake_enabled` indicates cros_ec_resume() needs to call
> disable_irq_wake() to undo enable_irq_wake() in cros_ec_suspend().
>
> Initialize `wake_enabled` in cros_ec_register() and determine the flag
> in cros_ec_suspend() instead of reset-after-used in cros_ec_resume().
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>

One minor thing to consider, but regardless:

Reviewed-by: Prashant Malani <pmalani@chromium.org>

> ---
> Changes from v3:
> (https://patchwork.kernel.org/project/chrome-platform/patch/20220209095703.517608-4-tzungbi@google.com/)
> - Change the patch title.
> - Simplify by initializing wake_enabled in cros_ec_register().
>
> No changes from v2.
>
> Changes from v1:
> (https://lore.kernel.org/lkml/20220125101527.1812887-1-tzungbi@google.com/T/#u)
> - Use imperative mood in commit message.
>
>  drivers/platform/chrome/cros_ec.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
> index 25cd8df6e7b0..b6604a9ab315 100644
> --- a/drivers/platform/chrome/cros_ec.c
> +++ b/drivers/platform/chrome/cros_ec.c
> @@ -191,6 +191,7 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
>         ec_dev->max_passthru = 0;
>         ec_dev->ec = NULL;
>         ec_dev->pd = NULL;
> +       ec_dev->wake_enabled = false;
>
>         ec_dev->din = devm_kzalloc(dev, ec_dev->din_size, GFP_KERNEL);
>         if (!ec_dev->din)
> @@ -383,10 +384,9 @@ int cros_ec_resume(struct cros_ec_device *ec_dev)
>                 dev_dbg(ec_dev->dev, "Error %d sending resume event to ec",
>                         ret);
>
> -       if (ec_dev->wake_enabled) {
> +       if (ec_dev->wake_enabled)
>                 disable_irq_wake(ec_dev->irq);
> -               ec_dev->wake_enabled = 0;
> -       }
> +

Better to leave it as is, and ensure "wake_enabled" is cleared after resume?
Will result in a smaller diff.

I'll leave it up to you.

-Prashant
