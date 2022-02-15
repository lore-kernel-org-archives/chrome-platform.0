Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B046B1876
	for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 21:40:08 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id y6so142010ybc.5
        for <chrome-platform@lists.linux.dev>; Tue, 15 Feb 2022 13:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C8xuYxRJ68vaFJBdVd9NfqCNlYsJqG1kjsEF5boZD8A=;
        b=eADfEASGf41Zozakr/MEjRH4bSkwlovWnu3d87MwzQDtF1No3q199FmcpMBCYr72x7
         AT7ALF6lJf0+vFq+xQbi9nmJKVfbN279qoVaGwqpPQIMSfIDObz2W1kOttgZDVNS1WEx
         mE1a7x64gBgv6VvynLN2tCILVCgs+pXQutja8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C8xuYxRJ68vaFJBdVd9NfqCNlYsJqG1kjsEF5boZD8A=;
        b=V4cVT/hsbTaTBH/8gMjYnuKiFkrsCoQOjR3xuenb2Ta13fgjwV6/Ma7q4Mm+khBmIu
         tpAB46HFUCFCoRV18abheGUCjhcUOMynxPA0A7vf16tRu5B8Ma7ybAjdEepDPi9UzuiD
         1ZG/T+h/tvd0yloFnQBThP+7apXrpW7u20a66PLUJ/tiRZgc3qnJFt4z0Cra/6YqQNc5
         hO5G9YLH9LIpQzN1CQECVQtL7DQbqgufjlhxoe/gTOevY830P30tVZdqwwPz+VyVdHFp
         cGgYMcguoSfwKFyh1uczEndofa0rl8IWagqNRGk3czat09diFqG5b0USxLZB2XeJWoBf
         Ce/A==
X-Gm-Message-State: AOAM532i/rygm58vQBrg8r4X9Wu6zL4jxn0BpeaMmkMx16abtLkNJxpY
	J77FP7blNoAf60ppdeBCgWbZ41TSLOFBmFmGL4am4A==
X-Google-Smtp-Source: ABdhPJyiOvZNB8Vk6Tr3xTea3KjCqQrd2bsnQmi1lpofCoogawj5Qgk6GIHXwpFqorhn6fu9H6RZDFwOMvVyZmuYUd0=
X-Received: by 2002:a81:cf0b:: with SMTP id u11mr927509ywi.182.1644961207787;
 Tue, 15 Feb 2022 13:40:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220209095703.517608-1-tzungbi@google.com> <20220209095703.517608-5-tzungbi@google.com>
In-Reply-To: <20220209095703.517608-5-tzungbi@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 15 Feb 2022 13:39:57 -0800
Message-ID: <CACeCKaf3uNOtr9BUONqs7W5QCYha-3MzZGX196UtYsBdezODwA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] platform/chrome: cros_ec: don't initialize `err`
 in cros_ec_register()
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Feb 09 17:57, Tzung-Bi Shih wrote:
> `err` in cros_ec_register() doesn't need to be initialized because it is going
> to be overridden in the following code soon.

As mentioned in the previous version [1], please drop this patch, since
it is not necessary (doesn't meaningfully improve readability, doesn't
fix any bugs).

[1] https://lore.kernel.org/chrome-platform/CACeCKaeRz2D-DdPRHbrvywTMr2w-MPuGZ+-mBhNtWCapgm=ZXw@mail.gmail.com/

>
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
> No changes from v2.
>
> Changes from v1:
> (https://lore.kernel.org/lkml/20220125101527.1812887-1-tzungbi@google.com/T/#u)
> - Use imperative mood in commit message.
>
>  drivers/platform/chrome/cros_ec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
> index 07dd5cc35d7c..618b8b4c42ef 100644
> --- a/drivers/platform/chrome/cros_ec.c
> +++ b/drivers/platform/chrome/cros_ec.c
> @@ -182,7 +182,7 @@ static int cros_ec_ready_event(struct notifier_block *nb,
>  int cros_ec_register(struct cros_ec_device *ec_dev)
>  {
>       struct device *dev = ec_dev->dev;
> -     int err = 0;
> +     int err;
>
>       BLOCKING_INIT_NOTIFIER_HEAD(&ec_dev->event_notifier);
>
> --
> 2.35.0.263.gb82422642f-goog
>
