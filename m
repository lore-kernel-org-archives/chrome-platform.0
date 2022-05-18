Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D7F1FAB
	for <chrome-platform@lists.linux.dev>; Wed, 18 May 2022 16:28:38 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id n10so4868569ejk.5
        for <chrome-platform@lists.linux.dev>; Wed, 18 May 2022 09:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2T+/PPPf7+3b/P3u/Ojh1mw+Ir4CRwarSeghbRqZSCk=;
        b=QuThysBNWbtYdQLwKisRzSxHxXH2bzmhew7tpYNn0YQij0/qm5bugUhw1P0L0CuRQW
         c5VhBk8AjuJ0fbt2Rb4VLeJiSzpr7dHyYjrGSKUvAmIX8AGcGAmATXyYqmxGKvERkTNp
         +DgB9wEfUYQWynFiTPs9Bw6eureGsDCgSW+inCCV2CjbhYph0jM645LG3EL6UakYEPu6
         i2J9N47cWHmb5rAy8b2URfuXo3EnkMBK/V3N/fMlpLoziPPV6h8MjLfjzRaK4qbbTUeW
         F3dz/Ys5Fl00cjXwavdGR+nhonhP8upRA85Ze7/GEtSs5iS0O+1a5jF6GeXQKOaRbwUv
         HQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2T+/PPPf7+3b/P3u/Ojh1mw+Ir4CRwarSeghbRqZSCk=;
        b=Q9jpbLcsfvvuNN+336qoHuZCnyK0VK6nBgvHD9ptSLzHPb4Le11JafUXjwrg+F/hBK
         8SBNT+1PJ/EPZAy8ZzZNOA0vEz/d1aj5w4qyzTKoecpyVegkX54qQJ9L5xcvn+A+OneB
         v++dL+Jbl5zsgvWKxJyCiLiZzyIdEgxZDVOC8nK7nGpIR+t8yYh7w/A39NvszNxjBthn
         2rfTEHQaPhIvELFyvCfHt2WqvjBZ3AT69MUp8CRUQTlPZFt8dTPxY39iSJOAbXMCaqt3
         YRpCD/5ceAnteYLOmrz5kRWfQQBdjPaXAGC2OEAZ6r9MJFIe8xcuaBg+Tc4UMAM6FxlF
         y4UA==
X-Gm-Message-State: AOAM531GxGTJCsg9xboQ2ubVeC3hRg0AWTAVWUVQlAmoBoUtSuom75bG
	bX11P5fPtIXlK2YpVTtNYX6syBwuC9Y8OOXu9HLqKA==
X-Google-Smtp-Source: ABdhPJwfTAyvrsh1V2tpQziGWOESnnWRABmgdgov0Bjz1bFQmUI/Ipdka8Fnsrwfv3vc5GdV65SWiZgMGi4hW4LezMo=
X-Received: by 2002:a17:907:9711:b0:6f4:6989:6afb with SMTP id
 jg17-20020a170907971100b006f469896afbmr397884ejc.618.1652891316548; Wed, 18
 May 2022 09:28:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220518091814.2028579-1-tzungbi@kernel.org> <20220518091814.2028579-4-tzungbi@kernel.org>
In-Reply-To: <20220518091814.2028579-4-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 18 May 2022 09:28:25 -0700
Message-ID: <CABXOdTfHKgj+c4oA-EaVqRjaNmFn4i_GDEpEqdexvV0L=dNmXg@mail.gmail.com>
Subject: Re: [PATCH 3/4] platform/chrome: cros_ec_proto: update
 cros_ec_check_result() comment
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>, 
	Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 18, 2022 at 2:18 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> At first glance, cros_ec_check_result() is quite like cros_ec_map_error().
> They check for `ec_msg->result` and return corresponding errors.  However,
> as calling from `pkt_xfer` and `cmd_xfer`, cros_ec_check_result() should
> not report furthermore errors.  -EAGAIN is the only exception.
>
> See [1][2][3] for some known userland programs' code.  The return code
> from ioctl only denotes the EC communication status.  Userland programs
> would further analyze the `result` in struct cros_ec_command* for
> follow-up actions (e.g. [4]).
>
> To clarify, update the function comment.
>
> [1]: https://crrev.com/54400e93a75ef440a83d6eaac2cec066daf99cf0/util/comm-dev.c#154
> [2]: https://crrev.com/fe32670a89bf59e1aff84bba9dd3295657b85e9b/cros_ec_dev.c#296
> [3]: https://crrev.com/4e19eb1d89de0422ff1bbd3f7260b131c761098c/drivers/google/cros_ec_dev.c#120
> [4]: https://crrev.com/54400e93a75ef440a83d6eaac2cec066daf99cf0/util/comm-dev.c#164
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> Changes from previous version:
> (https://patchwork.kernel.org/project/chrome-platform/patch/20220517082817.1591526-1-tzungbi@kernel.org/)
> - Update the link of [3].

The patch should be marked as v2 if there is a previous version. Other
than that,

Reviewed-by: Guenter Roeck <groeck@chromium.org>

>
>  drivers/platform/chrome/cros_ec_proto.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 01ab58b3269b..13ced9d2dd71 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -204,9 +204,12 @@ EXPORT_SYMBOL(cros_ec_prepare_tx);
>   * @msg: Message to check.
>   *
>   * This is used by ChromeOS EC drivers to check the ec_msg->result for
> - * errors and to warn about them.
> + * EC_RES_IN_PROGRESS and to warn about them.
>   *
> - * Return: 0 on success or negative error code.
> + * The function should not check for furthermore error codes.  Otherwise,
> + * it would break the ABI.
> + *
> + * Return: -EAGAIN if ec_msg->result == EC_RES_IN_PROGRESS.  Otherwise, 0.
>   */
>  int cros_ec_check_result(struct cros_ec_device *ec_dev,
>                          struct cros_ec_command *msg)
> --
> 2.36.0.550.gb090851708-goog
>
