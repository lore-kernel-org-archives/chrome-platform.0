Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8B246B3
	for <chrome-platform@lists.linux.dev>; Tue, 20 Dec 2022 15:09:54 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id m18so29899381eji.5
        for <chrome-platform@lists.linux.dev>; Tue, 20 Dec 2022 07:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1MJr5lFV5nhRPoqsOj5t1c5SzwCs5Lg+OTuhWULRuVw=;
        b=MykL2hB5O5a1AHoo0FMfUfeBRgpfuNYmh6vyM3MsgKyDS+HgvfrF8B9UGkghR9VNOm
         RJvYcxPucN6awqURznsvrtQOSTiygajFgWBsUhk4r51xAOGxDv33l1gJ5xuw9lissQL/
         5vbqWT/Xh/qMZuwge27Zw6qwss4fSTcQADAi69lOivRVXZahHsxyxT01934JFSDyTmH7
         vNCk39LPxkzmn7Ehah1O4gW9CeUWdl6EI5/D4WX6YQPTMQUnLQHWmbkLleDjL/erB2MW
         9hX/GPosIN5eP705ZX10i9WjYlLKruiKXDKDniMS+EYR6kelsWcYDdHal77iIh06AZg7
         +NzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MJr5lFV5nhRPoqsOj5t1c5SzwCs5Lg+OTuhWULRuVw=;
        b=2eCdO8KUbD8qwbuPevIqSdKI14a6U6Q4gT9v5rFW7Y9OKLLtryKFQg0XBGmGOXKy2m
         jUEUyq6WSggLs0izCiUQ0mO6X4r3KfPlDLk9JajCyiV5JoJY42zXDd7epj3s1vuPIbGY
         5HWLRDT5OuCPDweI+8dugEMiGi/QKa6egIoAqIiXsqjW+VCA/3t4RByhNq4aH/0o0FfW
         mfetNr9zP83qTO8gjFu5Nao043ucwPN8cY9C/90gnoklPCToQd3sPO++nhe+FzntXQei
         Tcmf0ArtC2ozV3f1ikHweKrhyiUgopzrES1MwvCnb0JMvn4dIQcgh/46cO1pYfDy+gdW
         ZowQ==
X-Gm-Message-State: ANoB5plRH8qthJq6yHmQ66xVM5bqWAHhNrGppclJWeGNHtLh4AYEcRc3
	CHC9a8H5JP1z4/Q4neVncIud4wSneRGEqQ9FfG/tiA==
X-Google-Smtp-Source: AA0mqf7scMAiQ6lGJpfP2Y5U6FnUI3WNVJtfOpsp8aUPHgMcLgIDBBAEzETiZizCBQm672z5sVlGsDXzmPJTl/ZXkns=
X-Received: by 2002:a17:906:4d88:b0:7c0:bbac:1921 with SMTP id
 s8-20020a1709064d8800b007c0bbac1921mr25738321eju.530.1671548992860; Tue, 20
 Dec 2022 07:09:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221220055954.11197-1-zhouruihai@huaqin.corp-partner.google.com>
In-Reply-To: <20221220055954.11197-1-zhouruihai@huaqin.corp-partner.google.com>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 20 Dec 2022 07:09:40 -0800
Message-ID: <CABXOdTeJuFn-23OiTshJTQWMBvkiqOXUh6S8z354eEPzj+q4Ew@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: deferred probe when typec
 count mismatch
To: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
Cc: pmalani@chromium.org, bleung@chromium.org, groeck@chromium.org, 
	knoxchiou@chromium.org, weishunc@chromium.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 19, 2022 at 10:00 PM Ruihai Zhou
<zhouruihai@huaqin.corp-partner.google.com> wrote:
>
> The kernel bootup is much faster with normal mode. In this case,
> there is a chance that the cros-ec-typec module get the actual typec
> port counts but not accurate from ec before ec is able to setup it.
> It will block the HDMI mux function.
> Hence, return -EPROBE_DEFER to put the device onto the deferred probe
> list when the typec count mismatch between ec and node.
>
> Signed-off-by: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
> ---
>  drivers/platform/chrome/cros_ec_typec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index 59de4ce01fab..d821501e875c 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -382,7 +382,7 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
>
>         if (nports > typec->num_ports) {
>                 dev_err(dev, "More ports listed than can be supported.\n");
> -               return -EINVAL;
> +               return -EPROBE_DEFER;

I think that is problematic. It might as well be that nports >
EC_USB_PD_MAX_PORTS.

Is this really seen in the field ? The EC should never report a wrong
(random) number of ports. If it is not ready, there should be _some_
indication that it isn't ready. Does it really report a more or less
random number in this case ?

Guenter

>         }
>
>         /* DT uses "reg" to specify port number. */
> --
> 2.17.1
>
