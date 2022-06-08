Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914AA7B
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jun 2022 16:20:42 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id q1so42481332ejz.9
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jun 2022 09:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RmDceGWW6LP3wfxI3yqcjFMbNeD7K7beSuFUrjXeR0w=;
        b=UV8kMWLoytR4IJW6CbsB8cH10BvVrj56KVYteRKxaYm1iEX0Nklw33dFypmPPi/PBN
         vDExHNbxuQigkwpNpt8/nK9uQENDeKsPKU0UFaCFMN22pal+v/hLUGYeAitykRADOVQg
         2ZA/+OI91ZI8YcT9ssbUq5MwljFBoK6PNRz7G2sv7/WoL/8/Kwp7rkjJMxxb8Rh3DpLy
         QUOP1K28c8lk61flXWRr0eVbG1gfYhVUpuhmUAa8KPelp/eFt+Y9yq//LOru43+XBsaz
         9bGCBEQ0rEW/6v2YFq1dOinZzbT0AEZVbb/uZNJ6tMb3gk/l2ZQgqdlWE0TYwuknDKSl
         4YtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RmDceGWW6LP3wfxI3yqcjFMbNeD7K7beSuFUrjXeR0w=;
        b=13g+BbLam8Tuy+70R7LZv/uQYglu9M6XkPu7n/Pb8p92IHvgz385KOB0GrpU60KlrU
         J9H68+rcAoim969AuQCfmrdZiK4sE9Cbt7+ATB5FY6/FbSbo03sfIKgWtBmgxf/mZ731
         3ag1fOkGm6L1aw20cD5WCzsW928dz6EEmadOfIxcRC415XCkOlQ/7j1f98wdWCdISo/u
         Pd3WYC2CiBLbe8oi3BRHAG3TwlXDUoKx3ZWXt2IbRQLsttxapGoXeKLyhOiOTc/HF+yl
         L5x1Be54YA/OLtV7Q6ZdHw2DEeZ3NYxIiDdwmP53+l1iU9CCYA0Oq53oicQvz5pT/Smv
         Hd3A==
X-Gm-Message-State: AOAM533yw43DVUUCL7AH5EvUCzMJAdqRDc4IZp2ESFGtxVFFJHJOpwCA
	KAfxSr1d8YnMdeefp6h+eH7HkPbjktdL8pFzbLC04wBpkmu84Lvf
X-Google-Smtp-Source: ABdhPJxxoJyx1HvNWhRKyxEg6Po41wCjmAnKE6n1u8PuJGFw1V5vlfYQA9oUqdlunBWPcV6g4JDVqMeo6b8eZIm8lZk=
X-Received: by 2002:a17:907:8689:b0:6fe:e525:ea9c with SMTP id
 qa9-20020a170907868900b006fee525ea9cmr32584625ejc.720.1654705240639; Wed, 08
 Jun 2022 09:20:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220608110734.2928245-1-tzungbi@kernel.org> <20220608110734.2928245-17-tzungbi@kernel.org>
In-Reply-To: <20220608110734.2928245-17-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 8 Jun 2022 09:20:29 -0700
Message-ID: <CABXOdTd76gczEimVxqWFmyHtbjG=dqALcGcudfZJrUd7qKcVfA@mail.gmail.com>
Subject: Re: [PATCH v3 16/23] platform/chrome: cros_ec_proto: return 0 on
 getting cmd mask success
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 8, 2022 at 4:08 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> cros_ec_get_host_command_version_mask() used to return value from
> send_command() which is number of available bytes for input payload on
> success (i.e. sizeof(struct ec_response_get_cmd_versions)).
>
> However, the callers don't need to know how many bytes are available.
>
> Don't return number of available bytes.  Instead, return 0 on success;
> otherwise, negative integers on error.
>
> Also remove the unneeded `ver_mask` initialization as the callers should
> take it only if cros_ec_get_host_command_version_mask() returns 0.

Make sure this compiles with W=1. Compilers may think that ver_mask
may be uninitialized when used.

>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Otherwise

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
> Changes from v2:
> - Separate Kunit test to another patch.
> - Rephrase the commit message.
>
> Changes from v1:
> - Return 0 on success; otherwise, negative intergers.
>
>  drivers/platform/chrome/cros_ec_proto.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index efbabdcb31ae..06bc7db1213e 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -453,6 +453,7 @@ static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev,
>         if (ret > 0) {
>                 rver = (struct ec_response_get_cmd_versions *)msg->data;
>                 *mask = rver->version_mask;
> +               ret = 0;
>         }
>
>         kfree(msg);
> @@ -469,7 +470,7 @@ static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev,
>   */
>  int cros_ec_query_all(struct cros_ec_device *ec_dev)
>  {
> -       u32 ver_mask = 0;
> +       u32 ver_mask;
>         int ret;
>
>         /* First try sending with proto v3. */
> @@ -505,9 +506,7 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
>                 return -ENOMEM;
>
>         /* Probe if MKBP event is supported */
> -       ret = cros_ec_get_host_command_version_mask(ec_dev,
> -                                                   EC_CMD_GET_NEXT_EVENT,
> -                                                   &ver_mask);
> +       ret = cros_ec_get_host_command_version_mask(ec_dev, EC_CMD_GET_NEXT_EVENT, &ver_mask);
>         if (ret < 0 || ver_mask == 0) {
>                 ec_dev->mkbp_event_supported = 0;
>         } else {
> @@ -517,10 +516,8 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
>         }
>
>         /* Probe if host sleep v1 is supported for S0ix failure detection. */
> -       ret = cros_ec_get_host_command_version_mask(ec_dev,
> -                                                   EC_CMD_HOST_SLEEP_EVENT,
> -                                                   &ver_mask);
> -       ec_dev->host_sleep_v1 = (ret >= 0 && (ver_mask & EC_VER_MASK(1)));
> +       ret = cros_ec_get_host_command_version_mask(ec_dev, EC_CMD_HOST_SLEEP_EVENT, &ver_mask);
> +       ec_dev->host_sleep_v1 = (ret == 0 && (ver_mask & EC_VER_MASK(1)));
>
>         /* Get host event wake mask. */
>         ret = cros_ec_get_host_event_wake_mask(ec_dev, &ec_dev->host_event_wake_mask);
> --
> 2.36.1.255.ge46751e96f-goog
>
