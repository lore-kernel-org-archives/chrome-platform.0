Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8C228FB
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jun 2022 14:42:04 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id gl15so21791167ejb.4
        for <chrome-platform@lists.linux.dev>; Tue, 07 Jun 2022 07:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tUW9diLTesI3roFry1o64Px5gNXnYkvb4K3Brj/FaUM=;
        b=bA8OX150j85ClhlKoLu/Q6RRRIfNsRqHm+iwi9htMQONv9TwxbRHzCvQxXKghpfdG7
         sVygQMXAJOQvnDTit6sHGOIsiCxOWZSvY4QW05XrpsUypxslSAGwPgUzNdiARBbQDSUK
         6bdi/WtcOPqcUV3Yt3VMxolq4lWl35bhWxxTd5uS7qZXRUz7dl5MhmMJFesKyJBL5jW6
         SzH6TqqKqzoS0pplV5LjhN2AaH9vLSRhQnvUwFhgM3a7xecy9K6fPX7bq2UngCsmt8Zu
         Mh5VMm//VFU2Bf2gqIN3z0qg+y086l7hfx1jeewU6MrME+0LpHjE9wR6h6aSv4Kq8oKI
         yoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tUW9diLTesI3roFry1o64Px5gNXnYkvb4K3Brj/FaUM=;
        b=Vijm0QQXNYkNnZJ6E6a0TqmorIi1GzPcZGa1lvBnEwZB6vydpsMb8px6W7/a2Fc7KB
         Q/Jdav1JFcSkhkwhyS4OA/bIuTg1LLGM8UCFQYRFs9hnkFDrx8IPiXh5KPFoPyRjNVUB
         giajho9t2z36Epwut5YugHK9vF+tc/Wh1M/wOIpZIRxobhABNdaUkeC1vHO0FbVsJUl4
         mT993AoRaXYkd3o8MNUQmQ9X0Bq8Y5VZn3DCRDl5y4uTobuzDW+yx4I+PxLDyIQ4QQv0
         gvyw9ojuUgLXt9pMDDJw3bE9uIFGR5jvtaQv3b1f0XS6mMq5qBIs/eHaFRKgG0u69+CO
         cfMA==
X-Gm-Message-State: AOAM530TGU/Y/uEXTtFj80f5zoGXVSjQ0c/1HkYxMg2sSoZ34X3DbklP
	ZMnvAelHz1tGPw85iSThJf3YE9yB52BNOJhhOoKV1w==
X-Google-Smtp-Source: ABdhPJx43dr01Y8Sr37Uf1HprEWxa+wFWjlbIRhi3oGCU79pp1EpiHwIhDXUEFTRNbQieHln3EPD7tSQ3i0LN75Q3NM=
X-Received: by 2002:a17:907:1ca8:b0:70c:68ce:dade with SMTP id
 nb40-20020a1709071ca800b0070c68cedademr24194819ejc.723.1654612923085; Tue, 07
 Jun 2022 07:42:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220606201825.763788-1-pmalani@chromium.org> <20220606201825.763788-4-pmalani@chromium.org>
In-Reply-To: <20220606201825.763788-4-pmalani@chromium.org>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 7 Jun 2022 07:41:51 -0700
Message-ID: <CABXOdTeQKPXs5GqGUDusp5S_w0W_Ewzfgge2+_H0nYmUQw3XVw@mail.gmail.com>
Subject: Re: [PATCH 3/3] platform/chrome: cros_ec_proto: Update size arg types
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Benson Leung <bleung@chromium.org>, 
	Stephen Boyd <swboyd@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Enric Balletbo i Serra <enric.balletbo@collabora.com>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Brian Norris <briannorris@chromium.org>, 
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 6, 2022 at 1:20 PM Prashant Malani <pmalani@chromium.org> wrote:
>
> cros_ec_cmd() takes 2 size arguments. Update them to be of the more
> appropriate type size_t.
>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_proto.c     | 4 ++--
>  include/linux/platform_data/cros_ec_proto.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index b6bea183ee28..cefabfe45551 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -958,9 +958,9 @@ int cros_ec_cmd(struct cros_ec_device *ec_dev,
>                 unsigned int version,
>                 int command,
>                 void *outdata,
> -               int outsize,
> +               size_t outsize,
>                 void *indata,
> -               int insize)
> +               size_t insize)
>  {
>         struct cros_ec_command *msg;
>         int ret;
> diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
> index 816da4eef3e5..85e29300f63d 100644
> --- a/include/linux/platform_data/cros_ec_proto.h
> +++ b/include/linux/platform_data/cros_ec_proto.h
> @@ -232,7 +232,7 @@ bool cros_ec_check_features(struct cros_ec_dev *ec, int feature);
>  int cros_ec_get_sensor_count(struct cros_ec_dev *ec);
>
>  int cros_ec_cmd(struct cros_ec_device *ec_dev, unsigned int version, int command, void *outdata,
> -                   int outsize, void *indata, int insize);
> +                   size_t outsize, void *indata, size_t insize);
>
>  /**
>   * cros_ec_get_time_ns() - Return time in ns.
> --
> 2.36.1.255.ge46751e96f-goog
>
