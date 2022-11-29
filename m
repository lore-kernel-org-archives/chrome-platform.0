Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C586FAD4B
	for <chrome-platform@lists.linux.dev>; Tue, 29 Nov 2022 18:13:15 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id k4so10421896qkj.8
        for <chrome-platform@lists.linux.dev>; Tue, 29 Nov 2022 10:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oxizSDtUrKGW9s75wfUhGFGOv1cbxYsbxzO0Bfc6NkI=;
        b=Eaz6vuCU7u00zWseDKdCYKMAVyDLlMsX995nhSluQCaJIl4kZ3Phky9xWJrvZSlDkX
         K//ngzfvIXB80SXU5z+0dquHREqnSOdDWMoxmy/DJ2gk1h70eQUC/xc5CmfoS2Rp9qFb
         cQwDvq6Rgx7Hdel50IMqDkWCaIoAjIqqZKJ8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oxizSDtUrKGW9s75wfUhGFGOv1cbxYsbxzO0Bfc6NkI=;
        b=jdLPRydGelsgV50v4OFhQEEdnvMSmLuumBcPYuR6U+bam8X6auP9u/G3Gx0m+AVDez
         3RGc8xMLBPZL8zPv0zG7ckM871STdB7pthtJ7srIMhgkk9zwi/ep9/b7Lc8Dr7HRJTEE
         n0+A9hDtyJSpOWRLRx6m9DFO7SXbAzrF85/Si5hPRsW/5Tz311IjiR4HAqfAwV1MrQCG
         k3oagxbZXUVZNhUErwZWJpXPyCtxmfTo/YxB0/j/39D3c5CvIuOnmgmRpV9iZ8Kf+0em
         TxZxIfxXHzn3HxwyP7vhM5FujndRoAXlAqk6PIh1DmZhrs8N/CeBxO/uIJRHHe+qBR7K
         wtNA==
X-Gm-Message-State: ANoB5pnnW0P+6g/Zx6sRNcrrTDl7S12cBn2D+9jnk7PnDfw1fmGAxb8N
	VwN6U8qs4KvlUZg95Jg1B0lMYXRn2a8zJoSCJN0K/w==
X-Google-Smtp-Source: AA0mqf6Sx/sJ2/wuBlsiie3OPD5aPlMymeX4M0l+aBQxKXtQvnhP/H6W7D77zIgpkf39KgHmL0C10xO2/QupgenuriI=
X-Received: by 2002:a05:620a:2694:b0:6f6:b34a:5333 with SMTP id
 c20-20020a05620a269400b006f6b34a5333mr51687260qkp.1.1669745594753; Tue, 29
 Nov 2022 10:13:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221117114818.v7.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
 <20221117114818.v7.3.Ie23c217d69ff25d7354db942613f143bbc8ef891@changeid> <Y3cbswXxTKWhMjKT@google.com>
In-Reply-To: <Y3cbswXxTKWhMjKT@google.com>
From: Mark Hasemeyer <markhas@chromium.org>
Date: Tue, 29 Nov 2022 11:13:04 -0700
Message-ID: <CANg-bXAxeL_N53umfeoYjAyDfw5EeHmcniZusPo+bb-BE1R4Ow@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] platform/chrome: cros_ec_uart: Add DT enumeration support
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Raul Rangel <rrangel@chromium.org>, 
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Enric Balletbo i Serra <enric.balletbo@collabora.com>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> > @@ -392,6 +393,12 @@ static int __maybe_unused cros_ec_uart_resume(struct device *dev)
> >  static SIMPLE_DEV_PM_OPS(cros_ec_uart_pm_ops, cros_ec_uart_suspend,
> >                        cros_ec_uart_resume);
> >
> > +static const struct of_device_id cros_ec_uart_of_match[] = {
> > +     { .compatible = "google,cros-ec-uart" },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(of, cros_ec_uart_of_match);
>
> It would need a guard for checking CONFIG_OF.  Similar to what
> `cros_ec_uart_acpi_id` does.
>
> > @@ -405,6 +412,7 @@ static struct serdev_device_driver cros_ec_uart_driver = {
> >       .driver = {
> >               .name   = "cros-ec-uart",
> >               .acpi_match_table = ACPI_PTR(cros_ec_uart_acpi_id),
> > +             .of_match_table = cros_ec_uart_of_match,
>
> It would need be wrapped by `of_match_ptr()`.  Similar to what
> `ACPI_PTR()` does.

I'm not sure we want a guard in this case because we compile the kernel without
CONFIG_OF enabled for (most?) x86 platforms. Yet we still need the device
tree code to enumerate using the PRP0001 _HID method.
