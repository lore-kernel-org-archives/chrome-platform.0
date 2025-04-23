Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F0338382
	for <chrome-platform@lists.linux.dev>; Wed, 23 Apr 2025 22:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745445918; cv=none; b=JFDqtQsD6O/Pl9WnKKbZhPcTRm9Ioj7huZ8Cwu+qZm22Mz/sJZjmdiyIP4iuYt5U4dDc9uUZFJz8rNkx9CsGX9a0b2uuwshoebWiqlsF+nXqic2pRSJD+0HXD2pqd5Q3Gcs4/VHS6Ucg3yboC5lGkXSAaUzGK2GixO9zRjPkrOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745445918; c=relaxed/simple;
	bh=0RgWlD++dai0ShsK29FeHW5kZU0mhofgjOIuyR4gaas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dl5t4qSPPh0C9vyNoQe0d1UH14woe6lMWczBeFcNHCTKtVEuHzGQCeLWdUqbKuhXLz9c5ZxNquD1m84fhiIp/J7ceTCK2eOHj4Pf9NgbNS6hM1Nhd1CyyQNRLrX0Dp9eSEWSi3wZMWtAXpLrGCGb3lBBjrIZYYPKq8IZSs/9iGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FCQwXspF; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FCQwXspF"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5241abb9761so165953e0c.1
        for <chrome-platform@lists.linux.dev>; Wed, 23 Apr 2025 15:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745445915; x=1746050715; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPRkZJ58BSq7sWIenQSBLWI6JDYVj/zzAhaRJ7wMxFY=;
        b=FCQwXspFevrEi7UPdsVLAM77H1DegWl4FfYCdBMybW4aakkN4JhnmnaqXzT7HnI4MB
         80yoYGzBiXYBfUIkplWFZlPptoKTnNHcrcjb/AfmQsT1sFItDTZjePiZC/QD3423pPh8
         TmuBuWfgnryxtklJv4FN3Y4bnKHVHrEbz5ob8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745445915; x=1746050715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPRkZJ58BSq7sWIenQSBLWI6JDYVj/zzAhaRJ7wMxFY=;
        b=irbdSqeSGAPJ4PYAvAR4RS5k8eoq62i+YhGGCqCv0J3vyO3qdyn/PRfrdLfk2M7BzH
         ruGuVWvjVsSF2XTnyrktykHF9HG7tuKMgnAvTJ4EvJv2diMUv5MVAOxRHOtBJeIvO5uZ
         /H/9Bg1lZl+PrCTKeRH6TgyjuC0EeVAIQaOwtgZ0CFcWu4EddMv0zhUwr8kd+jr9TI/k
         LKvHNhogSK7eZT9Rp8PCZruW9and8QohYgTQNQONlO7BkXLDQ3BCePjONYGedW7XnLXY
         rSNio9hUMch3Bd2Bwp1BwsBW81wC06/TVi8qS/Itktr5BTPHUm0fkLnpr3W4Ajo2D1+j
         Yh+g==
X-Forwarded-Encrypted: i=1; AJvYcCWo3GAtg8bD1yrFLgxCD6yYux3THPT2C5lyhIeEqVuRaCd3EmIKA177q5LI2RRxOK00/VhA+eRMV0gv2h26fr8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxIkkqXGLIeDWkjWn+IGhsSuuTbNsyjRrfYB8kC+jY3AOhOe1rq
	cLJpNcwECFrzesux5ADUfiKcPJOzuIFmlHdT2EA1rRUjnaJsAWNFKjBp1G/ZVDq5W8MhWtuAqci
	jrgIH6yeg17Om4ka0kDHcULgB8uBIlPHrpIGPgAt65l/q8zx47Q==
X-Gm-Gg: ASbGncshqV50sB13fa5E1scqvOzkLtUbVgecHm5fd4iuBCmt4/X9OYsAPPOxH+BXBAc
	KCywRctdpzImAemL7+zAmUM3TqKTw4ohjOnlwxg0smN5q7zF+cd9pWF/fATDyIZv1iiQkMOhu6T
	WGNwiqnjl0qfAOmNQS3G65rXzogHeZVrnkd0a5IFlJ9+u26oc=
X-Google-Smtp-Source: AGHT+IHACjkHF1JhmqKNvkCjrjFp5IlPqI32PqceAcktEz1uSgkBIbcq3PdfCz48LI4RIIb6CZzBwhSupJSUIeB85DI=
X-Received: by 2002:a05:6122:d85:b0:520:61ee:c814 with SMTP id
 71dfb90a1353d-52a78248971mr404779e0c.1.1745445914934; Wed, 23 Apr 2025
 15:05:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPUE2uuY=BaPFro5cQSmQg4JS1Z5J5aBL7XvqqAo-X=LR4be3Q@mail.gmail.com>
 <20250408155619.2169189-1-gwendal@chromium.org> <20250412114256.41602d67@jic23-huawei>
In-Reply-To: <20250412114256.41602d67@jic23-huawei>
From: Gwendal Grignou <gwendal@chromium.org>
Date: Wed, 23 Apr 2025 15:05:03 -0700
X-Gm-Features: ATxdqUH9kIEs8tPt571DX3_0lEEpV2Ju8NJAKkecugPLh4XsF0QtpQ2-sXXLlPQ
Message-ID: <CAPUE2ut-2Cp9pt_MkhnmrM3R4Lb-3d__3RyJzhQ+xYnoyUpgkw@mail.gmail.com>
Subject: Re: [PATCH v3] iio: cros_ec_sensors: Flush when changing the FIFO timeout
To: Jonathan Cameron <jic23@kernel.org>
Cc: tzungbi@kernel.org, linux-iio@vger.kernel.org, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 3:43=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Tue,  8 Apr 2025 08:56:19 -0700
> Gwendal Grignou <gwendal@chromium.org> wrote:
>
> > |hwfifo_timeout| is used by the EC firmware only when new samples are
> > available.
> > When the timeout changes, espcially when the new timeout is shorter tha=
n
> > the current one, send the samples waiting in the FIFO to the host.
> > Inline the call to transmit |hwfifo_timeout| value to the firmware.
> >
> > Now flush when a sensor is suspended (ODR set to 0) as well.
> >
> > Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
> Firstly.  Don't send a new version in reply to an old one.
> In general the reasons for this are:
> 1 - it can get very confusing if a thread gets deeply nested.
> 2 - at least some well known kernel folk start at their most recent email=
s
>     and work backwards when looking for what to review.  They will probab=
ly
>     never get to your thread!
>
> There may be other parts of the kernel that prefer this style, but most
> do not and I've never had anyone 'ask' for it (as opposed to not object).
Point taken. Applied all the comments in v4.

Thanks,
Gwendal.
>
> Various minor comments inline.
>
> Thanks,
> Jonathan
>
> > ---
> > Changes in v3:
> > - Fix error detection when setting the sensor frequency
> >
> > Changes in v2:
> > - Fix sysfs attribute in commit message
> > - Indicated the function to send the content of the attribute is now
> >   inline.
> > - Improve error detection when setting the sensor frequency and flusing
> >   the FIFO.
> >  .../cros_ec_sensors/cros_ec_sensors_core.c    | 50 ++++++++++++-------
> >  1 file changed, 33 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c =
b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> > index b1abd6e16c4ba..67ffe88df7b23 100644
> > --- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> > +++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors_core.c
> > @@ -103,22 +103,6 @@ static void get_default_min_max_freq(enum motionse=
nsor_type type,
> >       }
> >  }
> >
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
> Maybe use cleanup.h and
>         guard(mutex)(&st->cmd_lock);
> mostly because it simplifies code and...
> > +     st->param.cmd =3D MOTIONSENSE_CMD_EC_RATE;
> > +     st->param.ec_rate.data =3D min(U16_MAX, latency);
> > +     ret =3D cros_ec_motion_send_host_cmd(st, 0);
> > +     mutex_unlock(&st->cmd_lock);
>
> I'm not sure why you unlock briefly here?
We don't have to; the intent was to let another command waiting go
through since flush can be sent at anytime. But all in all it does not
improve multi-tasking, so removed.
>
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     /*
> > +      * Flush samples currently in the FIFO, especially when the new l=
atency
> > +      * is shorter than the old one: new timeout value is only conside=
red when
> > +      * there is a new sample available. It can take a while for a slo=
w
> > +      * sensor.
> > +      */
> > +     mutex_lock(&st->cmd_lock);
> > +     st->param.cmd =3D MOTIONSENSE_CMD_FIFO_FLUSH;
> > +     ret =3D cros_ec_motion_send_host_cmd(st, 0);
> > +     mutex_unlock(&st->cmd_lock);
> >       if (ret < 0)
> >               return ret;
> >
> > @@ -764,6 +766,8 @@ EXPORT_SYMBOL_GPL(cros_ec_sensors_capture);
> >   * @mask:    specifies which values to be requested
> >   *
> >   * Return:   the type of value returned by the device
> > + *
> > + * cmd_lock mutex held.
>
> Maybe true, but has that changed in a fashion that means this should
> be in this fix patch rather than a follow up improving documentation?
Removed for now.
>
> >   */
> >  int cros_ec_sensors_core_read(struct cros_ec_sensors_core_state *st,
> >                         struct iio_chan_spec const *chan,
> > @@ -836,6 +840,8 @@ EXPORT_SYMBOL_GPL(cros_ec_sensors_core_read_avail);
> >   * @mask:    specifies which values to write
> >   *
> >   * Return:   the type of value returned by the device
> > + *
> > + * cmd_lock mutex held.
> As above.
Removed for now.
>
> >   */
> >  int cros_ec_sensors_core_write(struct cros_ec_sensors_core_state *st,
> >                              struct iio_chan_spec const *chan,
> > @@ -853,6 +859,16 @@ int cros_ec_sensors_core_write(struct cros_ec_sens=
ors_core_state *st,
> >               st->param.sensor_odr.roundup =3D 1;
> >
> >               ret =3D cros_ec_motion_send_host_cmd(st, 0);
> I'd rather see
>                 if (ret)
>                         break;
> given local style.
Done.
>
> Ideal would actually be to make this whole function do direct returns on =
error
> as that is easier to follow in cases like this where there is no cleanup.
> However that change doesn't belong in a fix. Something for another day!
>
> > +
> > +             /* Flush the FIFO in case we are stopping a sensor.
> Comment syntax slightly wrong.
>
>                 /*
>                  * Flush the FIFO
>
> > +              * If the FIFO has just been emptied, pending samples wil=
l be
> > +              * stuck until new samples are available. It will not hap=
pen
> > +              * when all the sensors are stopped.
> > +              */
> > +             if (ret =3D=3D 0 && frequency =3D=3D 0) {
>
> With the break above, only need to check frequency here.
>
> > +                     st->param.cmd =3D MOTIONSENSE_CMD_FIFO_FLUSH;
> > +                     ret =3D cros_ec_motion_send_host_cmd(st, 0);
> > +             }
> >               break;
> >       default:
> >               ret =3D -EINVAL;
>
