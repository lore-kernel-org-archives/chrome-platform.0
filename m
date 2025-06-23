Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D012527A12D
	for <chrome-platform@lists.linux.dev>; Mon, 23 Jun 2025 18:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750704715; cv=none; b=aHv1S6PtVA8y9+S+FhcI8OpIOcC/j21Je4YD8XrAmqGnjRmRkXT44MZmAkbTMnWxTCgB243AAbS+tMwPjDGT3kF9wevghZtBRQgXvE+5hKYVZQEfbYCrpLHXRlTxBYVT3bYmeVApnxZjORWXDo4v96GSOauC3lEb3yYU375RuXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750704715; c=relaxed/simple;
	bh=dAGcpPn9BKdjZg6u5r0ynv05efA6L8kLk1089lC0m7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UzHKPTHWXNO0aT8Yf8OB+5CHjd9D50UqkyTMFcmQUwwZTMVFoneQ7dRO9D2q0Awvaz+oI0UvhlR4GFqFbPS+Posc+y6JnBbpk3sjQAGfH6gEOKSMUOUTQmtXbADMd2l+C6kiBhCtPspJZF/eIhjJngKsLuODLfeB0kT2BILdhWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WlW5Imlc; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WlW5Imlc"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-532de49b7e2so120770e0c.0
        for <chrome-platform@lists.linux.dev>; Mon, 23 Jun 2025 11:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750704712; x=1751309512; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUA0XE0sgECf7mZrc3TcVnQkYoYJalGvBUM1bDhYGOE=;
        b=WlW5Imlc5qC1fI78xN8yF9q4z15sw48nxMxugU1MXCXSL/T9p2UFuude4YD0fl1Mrz
         GuFvitMaDHh0FtBwEgeKeMNOS0RMMspTGK5pR38GMo0c+TVCUShITU2VQNqVO+IpqxEX
         qFFbfTzA/icG4i5T9HGPCTzT8uiYcVWw8HuZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750704712; x=1751309512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xUA0XE0sgECf7mZrc3TcVnQkYoYJalGvBUM1bDhYGOE=;
        b=Brq/OMGc/4kLj4s5cqqhpCqRv0FruMH0m6jPk0j610lt5JBvuhhW+PIw52D9XZTUe5
         c+0Ei2RwbxcMWc+V565OEJ5cXrNLzywUxeku29kB8KOpP3X1pHHNRFlhxhYv589U0Am6
         c0YAEGVdPjkNadA+cD3RlbE/KWKLOnhT/KpS2iy9jouv5hOICNWxFz4fRu7kA7SKJ2og
         Hf9NXAQ7n8Bn70EAXbjjOEW0EvwTgAksA1+ZmuxPmROYrfAib4AAqRgrAPaStSxNnnZa
         P/GmQeWzcEyIHoW3cZb4AtRhdwQnMP7cOx5CJZ7hDIaZr5sEB6q/2ehEAIkm639B+Y4+
         c1+g==
X-Forwarded-Encrypted: i=1; AJvYcCUboYFBKgzOR8o267DgIzYYrZWFKTo+yhg9DKHeaxtV14Wu5zinceZ+QnxQ9uBiLHvJvgoZXPQhFyWnBzlf0B4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2K2KVmQ9I54lwqCGz1BaXrz/RRQveXrw9/YzZZqq6o+u3fmwo
	RGL9t93HbbGhdpUJ9DsdBXb6pjKb4KfRKI/ikB6D/yWK4QXMaQ8hv1dfLBeukrfnVeuIsFNdfCb
	glyLOFx2dWfVu8Po29SA5VwxogR501p6mnr08PP/6
X-Gm-Gg: ASbGncuiRBgTbjRYS6ajicl/kka35dsLmiRR+7V3cwR/qCFRVBvRiO/Ej/1tRySxV7a
	WJMq4XL9+jMQzqcwQEjtRJyK5D3/t7MdQU07oMqxuXM9k2LQDpD9cTihZtBckp0Cjoly6/+1MCo
	Y254PF5SqAbk97gvRoi3rXHodCL3kAl7UjQHF7lrm60n6hoiK7ySZBPcFUf+IKollRC6Mg+g==
X-Google-Smtp-Source: AGHT+IGi/fuIUaK0ZImUSVjqylNlJmhkZ9ZsBCULM+hKWJwO0aXvyHRZTh7gsKJxRpUEOckagu4tpk8+P+gUDmI92cM=
X-Received: by 2002:a05:6122:1314:b0:531:4708:3d45 with SMTP id
 71dfb90a1353d-531ad8c17ccmr7898482e0c.10.1750704711675; Mon, 23 Jun 2025
 11:51:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250623184817.220409-1-gwendal@google.com>
In-Reply-To: <20250623184817.220409-1-gwendal@google.com>
From: Gwendal Grignou <gwendal@chromium.org>
Date: Mon, 23 Jun 2025 11:51:40 -0700
X-Gm-Features: AX0GCFsHHGcCYlrXcTLSutu8zYA1Th_N_SV58RXlPzvwbDsi_T3ZtfdAg-9oCzQ
Message-ID: <CAPUE2uux+FATvm44RAzQe50h3orztARe3XSZkjqfNMp68d2B=g@mail.gmail.com>
Subject: Re: [PATCH] drivers: iio: cros_ec_sensors: Flush changing the FIFO timeout
To: jic23@kernel.org
Cc: tzungbi@kernel.org, chrome-platform@lists.linux.dev, 
	linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ignore this patch, I sent the wrong file.

Gwendal.

On Mon, Jun 23, 2025 at 11:48=E2=80=AFAM Gwendal Grignou <gwendal@chromium.=
org> wrote:
>
> From: Gwendal Grignou <gwendal@chromium.org>
>
> fifo_timeout is used by the EC firmware only when a new sample is
> available.
> When the timeout changes, espcially when the new timeout is shorter than
> the current one, we need to send the samples waiting in the FIFO.
>
> Change-Id: Iec40367472bd301123c22e38d0ad8aca4ed41379
> ---
>  .../cros_ec_sensors/cros_ec_sensors_core.c    | 51 ++++++++++++-------
>  1 file changed, 33 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c b/=
drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> index bd8483866d046..339faee6ab44b 100644
> --- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> +++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> @@ -105,22 +105,6 @@ static void get_default_min_max_freq(enum motionsens=
or_type type,
>         }
>  }
>
> -static int cros_ec_sensor_set_ec_rate(struct cros_ec_sensors_core_state =
*st,
> -                                     int rate)
> -{
> -       int ret;
> -
> -       if (rate > U16_MAX)
> -               rate =3D U16_MAX;
> -
> -       mutex_lock(&st->cmd_lock);
> -       st->param.cmd =3D MOTIONSENSE_CMD_EC_RATE;
> -       st->param.ec_rate.data =3D rate;
> -       ret =3D cros_ec_motion_send_host_cmd(st, 0);
> -       mutex_unlock(&st->cmd_lock);
> -       return ret;
> -}
> -
>  static ssize_t cros_ec_sensor_set_report_latency(struct device *dev,
>                                                  struct device_attribute =
*attr,
>                                                  const char *buf, size_t =
len)
> @@ -136,7 +120,25 @@ static ssize_t cros_ec_sensor_set_report_latency(str=
uct device *dev,
>
>         /* EC rate is in ms. */
>         latency =3D integer * 1000 + fract / 1000;
> -       ret =3D cros_ec_sensor_set_ec_rate(st, latency);
> +
> +       mutex_lock(&st->cmd_lock);
> +       st->param.cmd =3D MOTIONSENSE_CMD_EC_RATE;
> +       st->param.ec_rate.data =3D min(U16_MAX, latency);
> +       ret =3D cros_ec_motion_send_host_cmd(st, 0);
> +       mutex_unlock(&st->cmd_lock);
> +       if (ret < 0)
> +               return ret;
> +
> +       /*
> +        * Flush samples currently in the FIFO, expecially when the new l=
atency
> +        * is shorter than the old one: new timeout value is only conside=
red when
> +        * there is a new sample available. It can take a while for a slo=
w
> +        * sensor.
> +        */
> +       mutex_lock(&st->cmd_lock);
> +       st->param.cmd =3D MOTIONSENSE_CMD_FIFO_FLUSH;
> +       ret =3D cros_ec_motion_send_host_cmd(st, 0);
> +       mutex_unlock(&st->cmd_lock);
>         if (ret < 0)
>                 return ret;
>
> @@ -154,7 +156,6 @@ static ssize_t cros_ec_sensor_get_report_latency(stru=
ct device *dev,
>         mutex_lock(&st->cmd_lock);
>         st->param.cmd =3D MOTIONSENSE_CMD_EC_RATE;
>         st->param.ec_rate.data =3D EC_MOTION_SENSE_NO_VALUE;
> -
>         ret =3D cros_ec_motion_send_host_cmd(st, 0);
>         latency =3D st->resp->ec_rate.ret;
>         mutex_unlock(&st->cmd_lock);
> @@ -769,6 +770,8 @@ EXPORT_SYMBOL_GPL(cros_ec_sensors_capture);
>   * @mask:      specifies which values to be requested
>   *
>   * Return:     the type of value returned by the device
> + *
> + * cmd_lock mutex held.
>   */
>  int cros_ec_sensors_core_read(struct cros_ec_sensors_core_state *st,
>                           struct iio_chan_spec const *chan,
> @@ -841,6 +844,8 @@ EXPORT_SYMBOL_GPL(cros_ec_sensors_core_read_avail);
>   * @mask:      specifies which values to write
>   *
>   * Return:     the type of value returned by the device
> + *
> + * cmd_lock mutex held.
>   */
>  int cros_ec_sensors_core_write(struct cros_ec_sensors_core_state *st,
>                                struct iio_chan_spec const *chan,
> @@ -858,6 +863,16 @@ int cros_ec_sensors_core_write(struct cros_ec_sensor=
s_core_state *st,
>                 st->param.sensor_odr.roundup =3D 1;
>
>                 ret =3D cros_ec_motion_send_host_cmd(st, 0);
> +
> +               /* Flush the FIFO in case we are stopping a sensor.
> +                * If the FIFO has just been emptied, pending samples wil=
l be
> +                * stuck until new samples are available. It will not hap=
pen
> +                * when all the sensors are stopped.
> +                */
> +               if (frequency =3D=3D 0) {
> +                       st->param.cmd =3D MOTIONSENSE_CMD_FIFO_FLUSH;
> +                       cros_ec_motion_send_host_cmd(st, 0);
> +               }
>                 break;
>         default:
>                 ret =3D -EINVAL;
> --
> 2.49.0.472.ge94155a9ec-goog
>
