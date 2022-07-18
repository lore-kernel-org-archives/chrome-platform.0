Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0D51C07
	for <chrome-platform@lists.linux.dev>; Mon, 18 Jul 2022 13:33:24 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id j22so21271017ejs.2
        for <chrome-platform@lists.linux.dev>; Mon, 18 Jul 2022 06:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/kXAx7ah4HpRG+01WFj99UWodkpRTD76480uGpstIdo=;
        b=fN/w6gbahfXVJVzwo0RCILbViBL9L0qywzdz9Ka3x0LdPCHqwgLEOiMnL0jrrW3qiE
         w134epUUAHiOzvsX6oObhsLZp3UtTn9cJ5tKkWkBpLNHQIyrimcHvTUrsqV4/MbClRgi
         3dQKWtRqnlL8KqoXPfkjur7Z7riJBc1mWGhlxGz+Vl+sVSh/c/uwolsMqC0hlC4yasbv
         oVfjLddvR7wO5NSuUoP2XLaBEA5OvwAlmMPcIkaiyAoQCsWkNTZZQvtZ8cOqy2py54OX
         h6NiAWfqH58kGNxVgiV6mqTaVRXBjYozhPagMuXeWtoNDoydl3MiruRpW7hze2b+df/H
         5ymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/kXAx7ah4HpRG+01WFj99UWodkpRTD76480uGpstIdo=;
        b=cMFf0zn+Gxi4ldF7dzyqiQ71bXew3XYTeQQVea5zOtWqTs3uHVRLWbMOHaNEFAznFT
         2c9KuMnPem0E+YxOH6GRvxmx8/M/VPLP9h6v3ETFRS4OTd9BB8ojCBZq3JprpBMwJjS3
         535Jj3FKlS6eGAHnT+SxZMxyPiACv+/F92dEBzPbL8WNbb52GkjT+Lyk+ahf1aBz4xsm
         YiLicAMSONdWtZbDFQzcPJs8SKINyeBQO+XQNVRaWzgoqTrLu9RJSXhPPYK/Zx6A/W3p
         kA87ecrM1IzfutnP57m9yaHv49aDi063zOPJWcH8A8+SsVoC1y54r0Jl/CmXt2b2Jhgu
         7tJw==
X-Gm-Message-State: AJIora8GJIXKK5zfRbp8Rz/yki474zRdIHzJadi2HgLRhX8lLob7uIP+
	GrdcfOf6GyZ0HSHyLzyjU1PxcjiOFjnr9X89/ILOYA8htf0=
X-Google-Smtp-Source: AGRyM1u5fJVQo2Ki3UQ3YTx283cKYLZ8z7I+odIE1wk5V95Cu4ufa/Q/r9xT+1OzNOe956EgZNjg3le4dePsT/lnlqA=
X-Received: by 2002:a17:907:160c:b0:72f:1031:2184 with SMTP id
 hb12-20020a170907160c00b0072f10312184mr11133344ejc.355.1658151202457; Mon, 18
 Jul 2022 06:33:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220718050914.2267370-1-tzungbi@kernel.org> <20220718050914.2267370-9-tzungbi@kernel.org>
In-Reply-To: <20220718050914.2267370-9-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 18 Jul 2022 06:33:11 -0700
Message-ID: <CABXOdTeNi3k8ieL+A6+A7eZyYAzT6UL_M=2j6c0d5iW2_HuLNg@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] platform/chrome: cros_ec_proto: return -EAGAIN
 when retries timed out
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 17, 2022 at 10:10 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> While EC_COMMS_STATUS_PROCESSING flag is still on after it tries
> EC_COMMAND_RETRIES times for sending EC_CMD_GET_COMMS_STATUS,
> cros_ec_wait_until_complete() doesn't return an error code.
>
> Return -EAGAIN in the case instead.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
> No changes from v1.
>
>  drivers/platform/chrome/cros_ec_proto.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index a6ad7f7956e6..9dec475edc84 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -167,6 +167,9 @@ static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev, uint32_t *
>                         return ret;
>         }
>
> +       if (i >= EC_COMMAND_RETRIES)
> +               ret = -EAGAIN;
> +
>         return ret;
>  }
>
> --
> 2.37.0.170.g444d1eabd0-goog
>
