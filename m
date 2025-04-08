Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4749218AD4
	for <chrome-platform@lists.linux.dev>; Tue,  8 Apr 2025 05:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744091462; cv=none; b=daVgR0c+bNJ4cSkB3khZv41SQlFcSbExXWeDkO4xhLIBLcHJ9MpT/jqRnX89vjF37BYLiaJsS0BBVYcRVXC8E6lTsNZvOikeVIVCUfoFXLCibe3imXt6YsMCk9wWwX+6DCOlTOtqsYtLBt6frRSHkZpEmItKQVBNN6Z/tS8FhkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744091462; c=relaxed/simple;
	bh=cTBS4EITLH/RKTsefjWnrcJeZlWKccC9lxnNUiQXvQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kwyu9g9BSeScZ/XRH1LXzuUWAi5nYksmYj6ctN3zFHVCWRtkSFeHzk6yk8vs8rFMvPlpfpLGWopBZQmHSQueWdDA97lntKNE/H5I6TwIrbbR/bC58Bjybbr87huzKANpui+h+6DG4Do6QgsGDj8Wl5bmtLZTDvFpdYWfJhfN8ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B+T0QhjL; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B+T0QhjL"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5259331b31eso2415529e0c.0
        for <chrome-platform@lists.linux.dev>; Mon, 07 Apr 2025 22:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744091459; x=1744696259; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFD2PpKOKkhNcofkMXws158Oc7eyZufKfu/WKUdKoaI=;
        b=B+T0QhjLsVE4ege0HbnmDvBCN2+dMi8FGnTOHykbGyjWsdXwmXj/78ueuQC3zU/vxi
         PIj/rAfoHLYRZWl5WV7Vjr8q9KP/F350immRE/JQKcjPwxKQsrUMnbI2aENk/F2SeFxZ
         +qmlueVN8JZ91UjBkc4IIQ/nhZKZqlEPC/W5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744091459; x=1744696259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFD2PpKOKkhNcofkMXws158Oc7eyZufKfu/WKUdKoaI=;
        b=LS4n5XM0f2ZZvrLTQE9I3cbOTkjQnx48Jr7lRh2QuhsijmjObkvqg+h7ilpTt1S8o9
         33o5Lq0F4Sck3nr0/fIpTspmLBv2b8bTBK6q+wJBj5PfVESo2In8fp+5zB/YSLzXxB19
         PxMsuAeujnJup/q0EmcvJEzSY2PlDmZ3x4x09nVI74TkvH8URatRBg+4pBAV1u0dbN8Y
         M7KzYwXsjIVHxDCfkgwj9HeUXkLa+JxcMduDWtGavI4gLkcmFhHqJLR0O3EyGvfv8ioq
         SrA5D5LyVacwQ9K4Tfl1DxrWFUa+a/Oxic9dq+kO9TpiPW6I+DaATx2mGjR9sfDWui2z
         W2Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVN3jHvAsF/tb7tqjZRfJeCCcW/N5jKdAHqZ3l1SgsS9nWfunxrRURzB8lkDse+mqh5rOqD/KAw4ZN+p9undiw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYbYYP8NAnV4XuNrg8FKEgIj3EZe05y7I4dJbBG7D4OroBfE04
	eZ+YYn/m9uXgrk02/JWiZQrEk1WBx7bUYr0AxFltHmc2CZ8z+nleJ5VAVLOyIXksf7VgIAwwQQF
	yeQuiACyEGrARrz3OGNleE7k87Z55ruGVaPfwclEWPEfW0EEcjw==
X-Gm-Gg: ASbGncuh6rmTECRRzbdpZtC3Or+ezq+JDdrktpRwyUl3FwQ9IjFosQ0xYyxptbThP01
	b38pxkoUC/tCrNBWjhNFK/PWzkZzptpW0K2jx1+fWUneiBOy10CIAhiBQ5E4RBCI/sJHhqnxgq2
	JCu+tj5Bm2QiYLV1BoVe2SbqpyigRZGOStuVrWWMqM/5S05+0ElUgfVWStC+Q=
X-Google-Smtp-Source: AGHT+IFsFaGuDyfD68CP+ZNLD9shyFqBd9AQJ3vcfkck4zR+gGjbycYTOgcXunEXfd4yoTUnoVMXRqcggR5mLBu+yvk=
X-Received: by 2002:a05:6122:32cf:b0:519:fcf2:ef51 with SMTP id
 71dfb90a1353d-52765c8dffcmr10352098e0c.5.1744091459553; Mon, 07 Apr 2025
 22:50:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250331164832.4039379-1-gwendal@chromium.org> <Z-0DleD6CRIsz3mY@google.com>
In-Reply-To: <Z-0DleD6CRIsz3mY@google.com>
From: Gwendal Grignou <gwendal@chromium.org>
Date: Mon, 7 Apr 2025 22:50:47 -0700
X-Gm-Features: ATxdqUHWPQg6Apyn0wZxPwlmra2iHZM1bBqQ-DWkID63MHsvM5z45gsmlO6U0Ew
Message-ID: <CAPUE2uuY=BaPFro5cQSmQg4JS1Z5J5aBL7XvqqAo-X=LR4be3Q@mail.gmail.com>
Subject: Re: [PATCH] drivers: iio: cros_ec_sensors: Flush changing the FIFO timeout
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 2:30=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> w=
rote:
>
> On Mon, Mar 31, 2025 at 09:48:32AM -0700, Gwendal Grignou wrote:
> > fifo_timeout is used by the EC firmware only when a new sample is
> > available.
>
> I guess you mean: "FIFO timeout".  There is no specific symbol called
> `fifo_timeout`.
I mean sysfs attribute `hwfifo_timeout`: its value is only used when
samples are flowing from the sensors.
>
> > ---
>
> "drivers: " in the patch's title prefix can be dropped.
Done.
>
> > -static int cros_ec_sensor_set_ec_rate(struct cros_ec_sensors_core_stat=
e *st,
> > -                                   int rate)
> > -{
> > -     int ret;
> > -
> > -     if (rate > U16_MAX)
> > -             rate =3D U16_MAX;
> > -
> > -     mutex_lock(&st->cmd_lock);
> > -     st->param.cmd =3D MOTIONSENSE_CMD_EC_RATE;
> > -     st->param.ec_rate.data =3D rate;
> > -     ret =3D cros_ec_motion_send_host_cmd(st, 0);
> > -     mutex_unlock(&st->cmd_lock);
> > -     return ret;
> > -}
> > -
> >  static ssize_t cros_ec_sensor_set_report_latency(struct device *dev,
> >                                                struct device_attribute =
*attr,
> >                                                const char *buf, size_t =
len)
> > @@ -134,7 +118,25 @@ static ssize_t cros_ec_sensor_set_report_latency(s=
truct device *dev,
> >
> >       /* EC rate is in ms. */
> >       latency =3D integer * 1000 + fract / 1000;
> > -     ret =3D cros_ec_sensor_set_ec_rate(st, latency);
> > +
> > +     mutex_lock(&st->cmd_lock);
> > +     st->param.cmd =3D MOTIONSENSE_CMD_EC_RATE;
> > +     st->param.ec_rate.data =3D min(U16_MAX, latency);
> > +     ret =3D cros_ec_motion_send_host_cmd(st, 0);
> > +     mutex_unlock(&st->cmd_lock);
> > +     if (ret < 0)
> > +             return ret;
>
> It isn't obvious (at least irrelevant to the commit message) that
> cros_ec_sensor_set_ec_rate() becomes inline here.
I changed it to be consistent with the flush being inline, and the
function used only once. Fixed in commit message..
>
> > @@ -152,7 +154,6 @@ static ssize_t cros_ec_sensor_get_report_latency(st=
ruct device *dev,
> >       mutex_lock(&st->cmd_lock);
> >       st->param.cmd =3D MOTIONSENSE_CMD_EC_RATE;
> >       st->param.ec_rate.data =3D EC_MOTION_SENSE_NO_VALUE;
> > -
> >       ret =3D cros_ec_motion_send_host_cmd(st, 0);
> >       latency =3D st->resp->ec_rate.ret;
> >       mutex_unlock(&st->cmd_lock);
>
> Unwanted change.
Removed.
>
> > @@ -853,6 +858,16 @@ int cros_ec_sensors_core_write(struct cros_ec_sens=
ors_core_state *st,
> >               st->param.sensor_odr.roundup =3D 1;
> >
> >               ret =3D cros_ec_motion_send_host_cmd(st, 0);
> > +
> > +             /* Flush the FIFO in case we are stopping a sensor.
> > +              * If the FIFO has just been emptied, pending samples wil=
l be
> > +              * stuck until new samples are available. It will not hap=
pen
> > +              * when all the sensors are stopped.
> > +              */
> > +             if (frequency =3D=3D 0) {
> > +                     st->param.cmd =3D MOTIONSENSE_CMD_FIFO_FLUSH;
> > +                     cros_ec_motion_send_host_cmd(st, 0);
>
> Wouldn't it want to check `ret` from previous cros_ec_motion_send_host_cm=
d()
> and override `ret` by the latest call?
Done.
