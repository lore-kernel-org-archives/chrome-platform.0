Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED147B
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jun 2022 16:15:08 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id o10so27754768edi.1
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jun 2022 09:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tbbr8cqlM6JP1/EQV/OxwLpk923WPZfF3f3/reyY39c=;
        b=pVryUjmwn4whBpZYVa57ovLNVPxnEQjKuBNPxsdoHbh7hmx0ZFuQFGABiVHN6oMoI3
         i4BRyjnH8n35ss+AkcXl4HIqx7Qk8R9+EdAJpoIIFIpxohXUfPTOCQrkOj9tNSaLaPWu
         tE6TZRJEzqsmnLTJNjrMtlQNAEV63ot8l/Z5FnHab3UxlxnbsETap47NCzjPFf4TDMrN
         +COlv0NWE7zzwjENxT/7Hx2pynkKhnUs+hWkeZP4CCHcJzKfKOdiZ/F00W7DH0pHjc5d
         yV9lMLhTd2pwMuEoiznqCtK+agVcEIR/9TF4LwXnuuJAMs8s6Anaoge6sLstwdF8xZm9
         qYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tbbr8cqlM6JP1/EQV/OxwLpk923WPZfF3f3/reyY39c=;
        b=XO+i/MmX+FIXe4mQnxl07aI/L1OfWJ0bjdQI8ZUVNPL3wS0iItmj1Qm1Sy550rm+ij
         Y8zBwieRNg6wwM9smlna4X2OqySnD0/GKSlS2Bw7rWYUhjYZkMTjiiftXq4GuEEnvZj9
         3+4D5fwhChNB/T0TkqrT0U0obJGOI30bM6AahsWyjN0Q08KTYYN3RqY5FnlFiLGXuTNp
         ixZISrdgz7vbhJ7SnQ56McZqJJbhxa24BbcfvtT7JGKaXjmTM3ZdmclrB7fpIFZqB6Jk
         GN0mbuMa+VFtZAb+royzJlQaOYQgECVxO7MQdBDfOcKIHZqxNKJLhNZNZ63b5HZT8yxq
         qqmw==
X-Gm-Message-State: AOAM5310cb1KHIMusw1Tp/s3Lrdj24Dwr+5EnWeRAN6b+LyNfJy32RSq
	74uh/+W7+9DW43pRSjVo59XQpSQt+JGO3rVBXuQF3boWoOc5SL//
X-Google-Smtp-Source: ABdhPJzChkltkDWfRpxI27D6Nsqy515FN2xdSfY/pUuD3QpNiIPD4LAFMwKEyLcTtg9MSMfDidj2HIYO1A0YcdTM1x4=
X-Received: by 2002:a05:6402:350e:b0:42f:b2c1:9393 with SMTP id
 b14-20020a056402350e00b0042fb2c19393mr29766337edd.11.1654704907120; Wed, 08
 Jun 2022 09:15:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220608110734.2928245-1-tzungbi@kernel.org> <20220608110734.2928245-13-tzungbi@kernel.org>
In-Reply-To: <20220608110734.2928245-13-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 8 Jun 2022 09:14:56 -0700
Message-ID: <CABXOdTemMhLvQ_N0fgQ=VH9JgxGxnYy1DHrZx=SFFu4dxsT4iA@mail.gmail.com>
Subject: Re: [PATCH v3 12/23] platform/chrome: cros_ec_proto: handle empty
 payload in getting info legacy
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 8, 2022 at 4:08 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> cros_ec_get_proto_info_legacy() expects to receive
> sizeof(struct ec_response_hello) from send_command().  The payload is
> valid only if the return value is positive.
>
> Return -EPROTO if send_command() returns 0 in
> cros_ec_get_proto_info_legacy().
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>


> ---
> Changes from v2:
> - Separate Kunit test to another patch.
>
>  drivers/platform/chrome/cros_ec_proto.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 04b9704ed302..473654f50bca 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -356,7 +356,7 @@ static int cros_ec_get_proto_info_legacy(struct cros_ec_device *ec_dev)
>         struct cros_ec_command *msg;
>         struct ec_params_hello *params;
>         struct ec_response_hello *response;
> -       int ret;
> +       int ret, mapped;
>
>         ec_dev->proto_version = 2;
>
> @@ -377,12 +377,18 @@ static int cros_ec_get_proto_info_legacy(struct cros_ec_device *ec_dev)
>                 goto exit;
>         }
>
> -       ret = cros_ec_map_error(msg->result);
> -       if (ret) {
> +       mapped = cros_ec_map_error(msg->result);
> +       if (mapped) {
> +               ret = mapped;
>                 dev_err(ec_dev->dev, "EC responded to v2 hello with error: %d\n", msg->result);
>                 goto exit;
>         }
>
> +       if (ret == 0) {
> +               ret = -EPROTO;
> +               goto exit;
> +       }
> +
>         response = (struct ec_response_hello *)msg->data;
>         if (response->out_data != 0xa1b2c3d4) {
>                 dev_err(ec_dev->dev,
> --
> 2.36.1.255.ge46751e96f-goog
>
