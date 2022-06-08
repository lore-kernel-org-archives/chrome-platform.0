Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B297B
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jun 2022 16:24:27 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id d14so2257246eda.12
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jun 2022 09:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wHmSX/+IrCFNegvbLq/KbryGfOKoReahgwi84iPHREk=;
        b=exlHTD26n1woC75nYXQqD7MSrK1NcMRDeViWnpyM21efKY/9x7ptHc9hL4qoeQkdO1
         AQ8iLeSnsN5DvPhCnEhnkKAjFAOJHr/RCVkFEg1iCMNfrkBpvF20h055Yxj6QClLkVKG
         hpbqLAme+/1wb5X8rfHnsDgmRxwlANFef3fm3DCdWWWkKVlefcPO7FZtS3aXcHm9gprA
         ZJQLQRbsdYtSZEmfoHTlp2RpM+ix4sDpARwADpRARi+pObRWQieQLtxoqxHKVZop0L3S
         tywQ9+TQ63IrwcbSo3LGJ7eg5FKn2gi7SEZg8yht3/dpG9r04tu8jO7M8/sNEGBCEiic
         8lnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wHmSX/+IrCFNegvbLq/KbryGfOKoReahgwi84iPHREk=;
        b=8DSprTJn3cH5GV5yY16w8zWOWhCdyBgUkeHNniMu4KBYnrRREIT4BfuNr/VfRy2Qjj
         GcsketgO5sGSshECYeWL2wGdFIxBr9d0iYvYXWe3pb0gmm94GZUsXHq87P766BEiNXcN
         ZytUKzgRYk4PwwIgFjCNe/8N+BtiHGZO29ezw1s9pml7PWLwYBNGNHs/cvHONHSnjGgE
         MhfNF6zs0GdG9FCRkvFyqwSCiQHImhE2u2QQpvFQzbEH6vi5x5VSKmLPGnsgumr34OTu
         5z0NuymxWN4o05Z6WcXGfL0vdL4QTmWa99rSTz+aeEaux/m58MWef8CKz9SkMx80PqhU
         IHJQ==
X-Gm-Message-State: AOAM532M8hJHSbSglhjCGCG9mGSI3QT3LzNo56Fu6ZxdeVxpy1RwgrO8
	FzrQfFFbI1Gbq4CbO2AxhlckiIkprullHtkS6CWqUw==
X-Google-Smtp-Source: ABdhPJzcgrDqdyNxP5/wE+aC9cCO13ejUBwYztiDOChX/CzbQiemjTtslfL99Zk5TZz6wo8zRhGUgeJ1NYhhNWxaT10=
X-Received: by 2002:a05:6402:350e:b0:42f:b2c1:9393 with SMTP id
 b14-20020a056402350e00b0042fb2c19393mr29818135edd.11.1654705465508; Wed, 08
 Jun 2022 09:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220608110734.2928245-1-tzungbi@kernel.org> <20220608110734.2928245-21-tzungbi@kernel.org>
In-Reply-To: <20220608110734.2928245-21-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 8 Jun 2022 09:24:14 -0700
Message-ID: <CABXOdTdqguBzxcKWXm+tQJ-XGa_1J26bBJqPLiY7qn4gfn+czg@mail.gmail.com>
Subject: Re: [PATCH v3 20/23] platform/chrome: cros_ec_proto: handle empty
 payload in getting cmd mask
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 8, 2022 at 4:08 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> cros_ec_get_host_command_version_mask() expects to receive
> sizeof(struct ec_response_get_cmd_versions) from send_command().  The
> payload is valid only if the return value is positive.
>
> Return -EPROTO if send_command() returns 0 in
> cros_ec_get_host_command_version_mask().
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

That answers my previous question.

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
> No v2.  New and separated from the original series.
>
>  drivers/platform/chrome/cros_ec_proto.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 6a5771361383..9e95f9e4b2f8 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -458,6 +458,11 @@ static int cros_ec_get_host_command_version_mask(struct cros_ec_device *ec_dev,
>                 goto exit;
>         }
>
> +       if (ret == 0) {
> +               ret = -EPROTO;
> +               goto exit;
> +       }
> +
>         rver = (struct ec_response_get_cmd_versions *)msg->data;
>         *mask = rver->version_mask;
>         ret = 0;
> --
> 2.36.1.255.ge46751e96f-goog
>
