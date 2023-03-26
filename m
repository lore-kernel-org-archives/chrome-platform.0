Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF0433E9
	for <chrome-platform@lists.linux.dev>; Sun, 26 Mar 2023 14:48:41 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id n125so7458721ybg.7
        for <chrome-platform@lists.linux.dev>; Sun, 26 Mar 2023 07:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679842121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcghtnLQYWlrvN8UwYfuf9qQmAOeyu8/SUpilu6PFgI=;
        b=p8IzhEFmfZ8dhPBowj50bo0UUCALpJhcom4BKvxBu8myp042SUSfsiE1vMwSNx2WvG
         g+OrXEpw7FZ7grx+wd1wvVCtWl8b5pEYnliyXQuN2Ciqzlln/ZbeWZxE2dHRnk51gHFy
         FQbVNZpmsORVTZ62wOAHVGDYexKeoPQ9YWLqWXVDOINdujgOabL1lda99D1TyGHRvPrG
         6r2K/mSBE2CBcmJX58GJ+M368xX22E9axU4AqnoRV4sYd85ASuZZl3l1YInGKjy+aahD
         beAkr9on0Wz0znzOQo1/hfQinouNHFTSVkwiuC0Epr/jXd0e8eryUXO/jxvrT6O4YUkr
         zu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679842121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZcghtnLQYWlrvN8UwYfuf9qQmAOeyu8/SUpilu6PFgI=;
        b=hD1631CfQ/2T9fcRpsEnfZCDWDhTlP/UgI8IAH+f98wybVF0RbeV5vZbVHK96r1pig
         /lyKgDNXZc4Wu5cVBC+WgpDrtLEHgfApAFmMiFh5DD9kCj8Y34KVPHogRSp1iq313qjU
         w1AxF5IAIQcktA1RH89LPmei0SCFZfoGIpSh1N8NQLI3Hj7lTna2DzDfMNb9Jmc+ePAw
         jkUKHqrJ4y4K8D1t8B9RyWifstXo2aX4jiAN/mrxJ5EEjecW0x6PzH1vmIlln7aujMv5
         UPkM4WVQh7ONk2PFxtFG+kEtzRrKmVwW/1bNcT8L1UHq/kQ96oOIrJFAjT2495LcCNKQ
         Y/qQ==
X-Gm-Message-State: AAQBX9cpHetzaIWKuMlsU9w1uFLxQqwnpRVwH5vozYlC+zrN3SkWP41b
	p4MYSZhZCZzTOHVP/veoVaVMO9JzGYWrXXxMuPcLrg==
X-Google-Smtp-Source: AKy350aVJ1mXKKfyEu46a9wspZcQZ8rbSmzyKZmaWwR/O/ykquxi4Tr18FK9dlzmepc3IaBKQnnCSlomXWWzUFOytOE=
X-Received: by 2002:a05:6902:1209:b0:b76:3b21:b1dc with SMTP id
 s9-20020a056902120900b00b763b21b1dcmr7260067ybu.0.1679842120821; Sun, 26 Mar
 2023 07:48:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230322041054.1856718-1-windhl@126.com>
In-Reply-To: <20230322041054.1856718-1-windhl@126.com>
From: Guenter Roeck <groeck@google.com>
Date: Sun, 26 Mar 2023 07:48:29 -0700
Message-ID: <CABXOdTf54ZB1VsCede_=ESfKteAsi7+9EnAv2kpXjx=t_4wTtg@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Add missing fwnode_handle_put()
To: Liang He <windhl@126.com>
Cc: pmalani@chromium.org, bleung@chromium.org, groeck@chromium.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2023 at 9:11=E2=80=AFPM Liang He <windhl@126.com> wrote:
>
> In cros_typec_init_ports(), we should add fwnode_handle_put()
> when break out of the iteration device_for_each_child_node()
> as it will automatically increase and decrease the refcounter.
>
> Fixes: fdc6b21e2444 ("platform/chrome: Add Type C connector class driver"=
)
> Signed-off-by: Liang He <windhl@126.com>


Reviewed-by: Guenter Roeck <groeck@chromium.org>

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
