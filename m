Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEC97B
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jun 2022 16:13:58 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id kq6so29390378ejb.11
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jun 2022 09:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OpAXdwZORFKOvufIunvkEJrAFgZQ4NyOlXoZC5h0a6c=;
        b=GJCPf0tMR5KB3tq7Gq+jOWVHZ2cU2+4uYOTuLelzQMdvxjByTt5ghKXjWHrT5QS13V
         86ZK1gL1SSML3H/VJI8zoFMPVRmNZ3mCVZ1S1eZ78ofZrBMXOYI5noo/sJDSxqSM+PZE
         wigVLL5OjMxYX5cKwqdS7EDmQrjYLHC7H4ahxV0vekgUeBk7BFSdcANbzkOUFVkQRpnm
         BscwDT5cHAGWXydy0U/F2QyVg66/SspdTcoRLognJcaKwezYd8Q7u+9g9J290mI9cBmL
         fqDSfjMHZuY/02kkjvb7Lr+TnTLFjk6jmU+O/sWd56hO08eVW+u3Pr7cmIT9OUHb144z
         dvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OpAXdwZORFKOvufIunvkEJrAFgZQ4NyOlXoZC5h0a6c=;
        b=zhsvXWuHaoBkaWrP6FPqJP5QjT3QSaWOWopsZJSOCAE9g1s4Ldo/L3jHTZ2mUEP/qr
         mt4kDYXJ4NjMnCMAixWzS4pjT/QKfvt3xMz+S78kSAol/mdoOC7TeKhDLkkqqT3O2dt1
         nQreX9oc/06Ort99hj0DyRrQpakCmtg2Q5iESRhmESfXTBCKO+M4ux5grmBdIVXDitk+
         bqw6Bd2KbuBV62bgxSVOKT+y/OpdpTJCP9aEvy9Rtm0zuyUH5fsbpCLsFRaMvbRJbBe4
         SZRHED3EKKvywXhaeqokLTTvbn4bAYb04J/6CY56AlokMAbkhG1DC/xcrg3IIeaw6eSU
         w9/g==
X-Gm-Message-State: AOAM5317pmUlmCnDGAcKQxA7Z9vcRfTp8lVCA+KTyP2CejSsHIK+/8l3
	i8QYhE2gI2KHRLRFvX7MOaA6S7yVrmAHNqIkIfDBIUDT05w7vdJ1
X-Google-Smtp-Source: ABdhPJzJ0AJJ9icMZPuUHYLgOB+vOx7hnBA7Vnp7/yXbm/rZI09fSn3FtoK1o3wfuzxV/p+RU41uXof455lUK5N+9EQ=
X-Received: by 2002:a17:906:85cb:b0:70b:ffb4:b0e with SMTP id
 i11-20020a17090685cb00b0070bffb40b0emr28556697ejy.533.1654704835154; Wed, 08
 Jun 2022 09:13:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220608110734.2928245-1-tzungbi@kernel.org> <20220608110734.2928245-10-tzungbi@kernel.org>
In-Reply-To: <20220608110734.2928245-10-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 8 Jun 2022 09:13:44 -0700
Message-ID: <CABXOdTe0+Zp2O-_S3fb3+T3J40BAxUDpSKkbQvoGw2xpw1cW6g@mail.gmail.com>
Subject: Re: [PATCH v3 09/23] platform/chrome: cros_ec_proto: handle empty
 payload in getting proto info
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 8, 2022 at 4:08 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> cros_ec_get_proto_info() expects to receive
> sizeof(struct ec_response_get_protocol_info) from send_command().  The
> payload is valid only if the return value is positive.
>
> Return -EPROTO if send_command() returns 0 in cros_ec_get_proto_info().
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
> Changes from v2:
> - Separate Kunit test to another patch.
>
>  drivers/platform/chrome/cros_ec_proto.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 893b76703da6..6f5be9e5ede4 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -314,6 +314,11 @@ static int cros_ec_get_proto_info(struct cros_ec_device *ec_dev, int devidx)
>                 goto exit;
>         }
>
> +       if (ret == 0) {
> +               ret = -EPROTO;
> +               goto exit;
> +       }
> +
>         info = (struct ec_response_get_protocol_info *)msg->data;
>
>         switch (devidx) {
> --
> 2.36.1.255.ge46751e96f-goog
>
