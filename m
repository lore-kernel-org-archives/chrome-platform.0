Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387B27B
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jun 2022 16:26:39 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id n28so27819208edb.9
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jun 2022 09:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8z7UL87qNPTqb+Q3KPHmVnfDvzgXsjCKSbw/KgXuHW8=;
        b=nuXw81uWjcRA3iwjIPUWjjPWyYPm5FPGVF8S1Tr25dWvIRloo6TQdefzttqaK/WyEv
         6DTjUBANjKXLyWZSM7zPGHUDuAx3/9At5QmWNdQzkzuz9W8dBWd2b44Fye14M6JLxX11
         nCVMKTBomK7opo6KD58DUr+X86bTGm4o+ETeFlELCjTEFfG99b8v9MK7m3HYHmyXZUaj
         nPA7fuTHuwC9melcOmht9C3Y9GRhqy+Ih4i28GqZA0m8fmfkVju0bAKf+1P1S4kPqU6E
         /RuufGpmPhphjH38kFkntEU5i4o9MM2/gaogP2sxHEjOI0t4ROZgwDgMQiaWAewu9Doc
         0YTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8z7UL87qNPTqb+Q3KPHmVnfDvzgXsjCKSbw/KgXuHW8=;
        b=0XMUI4GBvcme682raskRAKy0JaJT61Iz8iKGpXNJ59W8/WEfeX237/qW30AdoEL+Od
         zNqm8n3v3WsiTRhrYqpx3OutPvp6i0Wzq8zmX/7ZFaeT89XrVu60raax9OeswvJU+Cka
         Y9xLVs2mq8H/ySm28TPxLljblSHNpbCgTd4HFh/9n60iJ03hWedCiNzYo6OUrGdo6gdr
         8HvwQrnhyU1Gk8EEO3IoLGZ8ldEfyqRw6F6LdTvxokuuDoy2BQtxqu45gatlxERPuJKy
         Z6wn1Cc/qD11cGMz+pemYx+gCyZQ8pMaJdGynyPOEAZcLNIBmcZfQ6jG1rtb3YAKVG4l
         qH/Q==
X-Gm-Message-State: AOAM530KvoTCOUaJaXdf68xYzQHE6HEf7NyjYJiVzGyZWD083oSw6Nku
	TubREu4ItIwWbD+EXcOvaXLoyUr/BxjyXNF9db7yqg==
X-Google-Smtp-Source: ABdhPJyxupeF0svhcBIYgAv9ztnH1682B7s9bQSzLdi2vZpE3OrurGLDRapBZDFAYuEUOVSmacyWBAUNKYvd1z9W3xM=
X-Received: by 2002:a05:6402:f14:b0:42d:f989:4a21 with SMTP id
 i20-20020a0564020f1400b0042df9894a21mr40418553eda.168.1654705597304; Wed, 08
 Jun 2022 09:26:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220608110734.2928245-1-tzungbi@kernel.org> <20220608110734.2928245-22-tzungbi@kernel.org>
In-Reply-To: <20220608110734.2928245-22-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 8 Jun 2022 09:26:26 -0700
Message-ID: <CABXOdTcoL7f68bqN5L_HSu5rk9+t+jm=-0rzHVGmoMozGro4nQ@mail.gmail.com>
Subject: Re: [PATCH v3 21/23] platform/chrome: cros_ec_proto: return 0 on
 getting wake mask success
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 8, 2022 at 4:08 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> cros_ec_get_host_event_wake_mask() used to return value from
> send_command() which is number of bytes for input payload on success
> (i.e. sizeof(struct ec_response_host_event_mask)).
>
> However, the callers don't need to know how many bytes are available.
>
> Don't return number of available bytes.  Instead, return 0 on success;
> otherwise, negative integers on error.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
> Changes from v2:
> - Separate Kunit test to another patch.
>
> Changes from v1:
> - Return 0 on success; otherwise, negative intergers.
>
>  drivers/platform/chrome/cros_ec_proto.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 9e95f9e4b2f8..68a411e84744 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -236,7 +236,7 @@ EXPORT_SYMBOL(cros_ec_check_result);
>   *
>   * @ec_dev: EC device to call
>   * @msg: message structure to use
> - * @mask: result when function returns >=0.
> + * @mask: result when function returns 0.
>   *
>   * LOCKING:
>   * the caller has ec_dev->lock mutex, or the caller knows there is
> @@ -266,6 +266,7 @@ static int cros_ec_get_host_event_wake_mask(struct cros_ec_device *ec_dev, uint3
>         if (ret > 0) {
>                 r = (struct ec_response_host_event_mask *)msg->data;
>                 *mask = r->mask;
> +               ret = 0;
>         }
>
>  exit:
> --
> 2.36.1.255.ge46751e96f-goog
>
