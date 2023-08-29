Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF7614AAF
	for <chrome-platform@lists.linux.dev>; Tue, 29 Aug 2023 20:51:12 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-40a47e8e38dso27061cf.1
        for <chrome-platform@lists.linux.dev>; Tue, 29 Aug 2023 13:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693342271; x=1693947071; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NeQ6PnT2X5OAN+PUcFdr1liTuB+fdgrOrVYsIp5DUEg=;
        b=calglTklaXrFPi2+zRNtMAQeNAcU3mIiveS0Tbg2L7LpTHLk2qHB7P1uhtuijcs65b
         wDHPRESjYyb5iuTXKvrpVcBeDmcmuy/tuHre2j7eMcsnIw8vmCDPydM1Sd4POl2UqMdm
         +KNrUyX2LuUrFpgqxe+idk6th3YKq6t+jDdHV/u260q/F8sYvuRW3RJ+ec++QXZTYs7x
         GU3sAvmZTQOLmicZaSi12tAhisd1hdjFDQss9PNs707Vf8HMyv3aFoH8oGybWW+QI5Bj
         WkZXyJWVZJ08py5gfbB+XIRe9kL1D++jQm1/Gv9q1ylvxHVmezWfszQcXcKzTdlIqOi1
         hFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693342271; x=1693947071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NeQ6PnT2X5OAN+PUcFdr1liTuB+fdgrOrVYsIp5DUEg=;
        b=Ov2XyQ+2QgMIKMWrGQ3OPqpnK0MGJySbgohSMCjuE7UIhyk4jFq3dR8BdjXWImwdW0
         71Ga2jMWPUkCaodMpFcHLvu1B0D/1tgfgcflnq8lnhHDF88wtq8ks2fAK/qwD4nxeoM9
         aY6qmsEketMkS2Z2JfbA5YhoJ8h7h3ub+3VGYvfFlrXb8eqoHLOz+ZYsbrKrROh0y0aW
         +gpOqOS7A/KtElsCFp8U+VeRVVX1lGEpF7lGrJO26NOlYD08xN3RBkIFjvrnBfax9Dnu
         56mhJLj13eeefhUrDzsusH5Ev9bx4JXJ/Wl3vqs+xPC41OJ9uSkhzUaSCxIdEV4cNSqB
         WRJg==
X-Gm-Message-State: AOJu0YzrhZ8KopH5e9ZHNuwn19BgJzJ38XxUGkkBAXUZYvMSU1/tO9A7
	WRAwKK/+gHzMEtMINlnC8Eq081nVdLRWmuX+BdtWjQ==
X-Google-Smtp-Source: AGHT+IHfwvVY+FulDFY6b/mtqjHft/EOuA9DkxgnPhQI6OKdriWUaWzbuOFOUWeZ4mpR5dNcDPzhQcFLTENXWTwM5S0=
X-Received: by 2002:a05:622a:40f:b0:3fa:3c8f:3435 with SMTP id
 n15-20020a05622a040f00b003fa3c8f3435mr316048qtx.27.1693342271616; Tue, 29 Aug
 2023 13:51:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230829030622.1571852-1-tzungbi@kernel.org>
In-Reply-To: <20230829030622.1571852-1-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 29 Aug 2023 13:50:59 -0700
Message-ID: <CABXOdTfSXJdAz83t-Ndu+MMVLr3KoB37HG3e8_82eE-WmSAZgg@mail.gmail.com>
Subject: Re: [PATCH v2] iio: cros_ec: fix an use-after-free in cros_ec_sensors_push_data()
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, jic23@kernel.org, 
	lars@metafoo.de, chrome-platform@lists.linux.dev, gwendal@chromium.org, 
	linux-iio@vger.kernel.org, dianders@chromium.org, swboyd@chromium.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2023 at 8:06=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> cros_ec_sensors_push_data() reads `indio_dev->active_scan_mask` and
> calls iio_push_to_buffers_with_timestamp() without making sure the
> `indio_dev` stays in buffer mode.  There is a race if `indio_dev` exits
> buffer mode right before cros_ec_sensors_push_data() accesses them.
>
> An use-after-free on `indio_dev->active_scan_mask` was observed.  The
> call trace:
> [...]
>  _find_next_bit
>  cros_ec_sensors_push_data
>  cros_ec_sensorhub_event
>  blocking_notifier_call_chain
>  cros_ec_irq_thread
>
> It was caused by a race condition: one thread just freed
> `active_scan_mask` at [1]; while another thread tried to access the
> memory at [2].
>
> Fix it by calling iio_device_claim_buffer_mode() to ensure the
> `indio_dev` can't exit buffer mode during cros_ec_sensors_push_data().
>
> [1]: https://elixir.bootlin.com/linux/v6.5/source/drivers/iio/industriali=
o-buffer.c#L1189
> [2]: https://elixir.bootlin.com/linux/v6.5/source/drivers/iio/common/cros=
_ec_sensors/cros_ec_sensors_core.c#L198
>
> Cc: stable@vger.kernel.org
> Fixes: aa984f1ba4a4 ("iio: cros_ec: Register to cros_ec_sensorhub when EC=
 supports FIFO")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
> Changes from v1(https://patchwork.kernel.org/project/linux-iio/patch/2023=
0828094339.1248472-1-tzungbi@kernel.org/):
> - Use iio_device_{claim|release}_buffer_mode() instead of accessing `mloc=
k`.
>
>  drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/=
drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> index b72d39fc2434..6bfe5d6847e7 100644
> --- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> +++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> @@ -190,8 +190,11 @@ int cros_ec_sensors_push_data(struct iio_dev *indio_=
dev,
>         /*
>          * Ignore samples if the buffer is not set: it is needed if the O=
DR is
>          * set but the buffer is not enabled yet.
> +        *
> +        * Note: iio_device_claim_buffer_mode() returns -EBUSY if the buf=
fer
> +        * is not enabled.
>          */
> -       if (!iio_buffer_enabled(indio_dev))
> +       if (iio_device_claim_buffer_mode(indio_dev) < 0)
>                 return 0;
>
>         out =3D (s16 *)st->samples;
> @@ -210,6 +213,7 @@ int cros_ec_sensors_push_data(struct iio_dev *indio_d=
ev,
>         iio_push_to_buffers_with_timestamp(indio_dev, st->samples,
>                                            timestamp + delta);
>
> +       iio_device_release_buffer_mode(indio_dev);
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(cros_ec_sensors_push_data);
> --
> 2.42.0.rc2.253.gd59a3bf2b4-goog
>
