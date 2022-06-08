Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1B417D0
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jun 2022 16:30:32 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id fd25so27855592edb.3
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jun 2022 09:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5LOrhUovmaXW0suEK++cbwhUK+zWv0DfKlBlUwAV4lo=;
        b=qYqOefA9OScbwUmWnO/BEh0VDQeePTDaCToVY2urQCiAvHu9sZEiQjL0YthhKgOYGS
         3dJmrcyo0vMgf0UKjbjh80XGcUItQIPbTGBDDUm28eqUhq70+tNp5TDESRDUGoacMAMX
         2K5hLE8pcV9r+dufkNka+Ddt4bdCaxUTq2bZ7YNCuDzfgRZuv/SWkDbRx0PYx7fS9/XG
         cOD7w+avBg7n8JNzFWBnjDfAjCgkT0jmvJEldObj4OiSnPLeeYTpiGKY1sjBnSJg2jx2
         WOZAbWsDqsMB6Re/ge4p7ditTPeHtm1xzF8V3l+8v5mq3xejXena1B+ldtTOocAoMEAG
         AEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5LOrhUovmaXW0suEK++cbwhUK+zWv0DfKlBlUwAV4lo=;
        b=bStSmTMXAtMSn496LLnhbQMKChW8yq8d2A1tYoxDcjH620dJOGzzWd5fCoeQRtoD0v
         76wphxMSXG0OKrMiCgftPuTCPmWVteXo5mwLl5QU49MelG1OLAZKK3SoxxIsM6FwYT0Q
         rQSavB+O3CRQez1ahhVj1D6WgLcdFZdxzz1WKp5+NvKjgrkumTc/StjmCGbh+owI9VJZ
         VIaa/0Py+g1GeknKw32c8n2z3kC3W1gb49PZcEB4aCII74He0pZ4P99MasF1qI8YvYE1
         uHBc//KO0jHCu0cv4g74DWfz8i17KLRTLAVJb46uu0Qe3sIJBHq23CFixCdn7wngdBuv
         pQTg==
X-Gm-Message-State: AOAM530EJSJKbAV/Se9OnDcUo88iVtvgstEhm02RdKpmRmXJkURNkdNr
	UaEA85cADYRK/EtzwvUYgHSCbJKxrbnDxDYUzUBuWw==
X-Google-Smtp-Source: ABdhPJxaDgaNer/+GfHw7iyy/pyb3b2P5Mhjw1tdAYR/amDWZz1ff+RoIUIJpg6SkoACSFVSlDqNJu32kGl/yzE5130=
X-Received: by 2002:a05:6402:2687:b0:430:328f:e46b with SMTP id
 w7-20020a056402268700b00430328fe46bmr2235466edd.33.1654705830946; Wed, 08 Jun
 2022 09:30:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220608110734.2928245-1-tzungbi@kernel.org> <20220608110734.2928245-24-tzungbi@kernel.org>
In-Reply-To: <20220608110734.2928245-24-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 8 Jun 2022 09:30:19 -0700
Message-ID: <CABXOdTfLVq30r0+E9GaThXaJgSVjYg6AMP4JfxoiVZ64bdT+Bw@mail.gmail.com>
Subject: Re: [PATCH v3 23/23] platform/chrome: cros_ec_proto: handle empty
 payload in getting wake mask
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 8, 2022 at 4:08 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> cros_ec_get_host_event_wake_mask() expects to receive
> sizeof(struct ec_response_host_event_mask) from send_command().  The
> payload is valid only if the return value is positive.
>
> Return -EPROTO if send_command() returns 0 in
> cros_ec_get_host_event_wake_mask().
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
> No v2.  New and separated from the original series.
>
>  drivers/platform/chrome/cros_ec_proto.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 68a411e84744..5cbaaba26ff7 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -256,19 +256,23 @@ static int cros_ec_get_host_event_wake_mask(struct cros_ec_device *ec_dev, uint3
>         msg->insize = sizeof(*r);
>
>         ret = send_command(ec_dev, msg);
> -       if (ret >= 0) {
> -               mapped = cros_ec_map_error(msg->result);
> -               if (mapped) {
> -                       ret = mapped;
> -                       goto exit;
> -               }
> +       if (ret < 0)
> +               goto exit;
> +
> +       mapped = cros_ec_map_error(msg->result);
> +       if (mapped) {
> +               ret = mapped;
> +               goto exit;
>         }
> -       if (ret > 0) {
> -               r = (struct ec_response_host_event_mask *)msg->data;
> -               *mask = r->mask;
> -               ret = 0;
> +
> +       if (ret == 0) {
> +               ret = -EPROTO;
> +               goto exit;
>         }
>
> +       r = (struct ec_response_host_event_mask *)msg->data;
> +       *mask = r->mask;
> +       ret = 0;
>  exit:
>         kfree(msg);
>         return ret;
> --
> 2.36.1.255.ge46751e96f-goog
>
