Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F205F2F21
	for <chrome-platform@lists.linux.dev>; Tue, 11 Apr 2023 20:30:47 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id j19so2958097qkk.8
        for <chrome-platform@lists.linux.dev>; Tue, 11 Apr 2023 13:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681245047; x=1683837047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CV6aPszvq/JP5mKLiXwUdzLZv3idMMVclWegKUhvRAw=;
        b=fpdg9BNHYQJKKv/YaHE/Dr9N9yZHN4wP87IPezZmm4bx3FOxfDCGOYEek8wkDPC1+6
         KpFMclm0H8B5Bq51zVw4EYMOMtEwYYznUXdRnMZPSQGFespd/lsfGahTnP0s8TUqYgFi
         mXM1yGep7C142Eg/o5gJ6w9T7nUPHI3F70nVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681245047; x=1683837047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CV6aPszvq/JP5mKLiXwUdzLZv3idMMVclWegKUhvRAw=;
        b=LDuWWFGxkzfGmeHEh0jAfB4rRTDuG5S70U1ciGo3meTPbZ12wWmbAOZ/GlXEqr4w0I
         QGzyC8zCbw85yjc8r/I4jQWPJtUc1s8ekeUTusE4NeUsN9a5+ngPePbvnkqgKdFE3EBx
         G56HldnElAqP0MwKAz+jaxwDX/HBQxIlEPYevU28NE61Vz02Px7wHtpjMhkH5V9HuOA3
         3MO8YLP7SpBHDPNg9uCpEbBbirEC7XD10pNHznIdPz7Wblh9g9gkQYrWG1eusSpSyv5l
         A2xuiVPgusQUcCDmsySqPWd6wqSHuInUROsOnu0ER3n8HY30bmlsgUoXEkFIWU8oa9EZ
         rvbg==
X-Gm-Message-State: AAQBX9dOjESr2kgNrdAmrUC4E1Q8I+DaLsptxFiJ7Z3A6Vp26LeA/KmA
	gioVOg7mcV1GswCoVTrTF322NBPvEaibBWnuh7qJ3w==
X-Google-Smtp-Source: AKy350ZxpCavH7w1nKcdAqTjEm9L3x6Px5zdaNLHgSGHbxIFCPyYY9RX0SZZcgHRTyzACkB491tYN18svtEbbr5k2wM=
X-Received: by 2002:a05:620a:1981:b0:746:9411:4c18 with SMTP id
 bm1-20020a05620a198100b0074694114c18mr1330584qkb.5.1681245046928; Tue, 11 Apr
 2023 13:30:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230322041054.1856718-1-windhl@126.com>
In-Reply-To: <20230322041054.1856718-1-windhl@126.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 11 Apr 2023 13:30:35 -0700
Message-ID: <CACeCKacsy5tbSFATgtsDYfAJi68ExpbJDBGv2Z0K4N-dC7H8aA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Add missing fwnode_handle_put()
To: Liang He <windhl@126.com>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Liang He,

Can you please resend this patch? I don't see it in patchwork or the
mailing list any more.

Thanks!

On Tue, Mar 21, 2023 at 9:11=E2=80=AFPM Liang He <windhl@126.com> wrote:
>
> In cros_typec_init_ports(), we should add fwnode_handle_put()
> when break out of the iteration device_for_each_child_node()
> as it will automatically increase and decrease the refcounter.
>
> Fixes: fdc6b21e2444 ("platform/chrome: Add Type C connector class driver"=
)
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  drivers/platform/chrome/cros_ec_typec.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index 2a7ff14dc37e..3a242effc85d 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -443,6 +443,7 @@ static int cros_typec_init_ports(struct cros_typec_da=
ta *typec)
>         return 0;
>
>  unregister_ports:
> +       fwnode_handle_put(fwnode);
>         cros_unregister_ports(typec);
>         return ret;
>  }
> --
> 2.25.1
>
