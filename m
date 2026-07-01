Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0876736213D
	for <chrome-platform@lists.linux.dev>; Wed,  1 Jul 2026 07:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782890466; cv=none; b=FkXKoNUK5He1Fc07EhhABGKP6k9xzhxfo/n/Il2b5U8o/mRIFoirnf4NX7X4UdPHBLfGywBVIwKsGV63el7wJLFu/6PqtpciUFARg3b88+adEffR0lFPOMCbQXwzK22A9ATd6p/XbE9VtG0JNa6dyyBQBuhZ9oTgrC510z7oI2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782890466; c=relaxed/simple;
	bh=W1QYZgvHMmZEEf+ItAaO/ZyVo+mc5W7D44Zvo+uW7xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LIizhkXJSbYDSe+NA2dz51ZGq3WqSlcOZazqUsu3D1HyhtqkbPnti5C/Lmxk2Xp5r/9YlPhflTNYN1zNPSCFE+UbleKWgAuMGAAVmxRAdaL2Kx+B5oDNPaO8AN/235e3RbCziKIxsncFjV/ameW0Ytp4ofjBjZ12jpZLjF6HJ6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=S1cnaju1; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S1cnaju1"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-92b21f65b60so129913685a.1
        for <chrome-platform@lists.linux.dev>; Wed, 01 Jul 2026 00:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782890464; x=1783495264; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxtJSXEBg59t1yDSTVQFD26bxCNMBASOW7RR7Tr3TMQ=;
        b=S1cnaju1gFs+GXGOTfJpldpC7bIgusAlM5i51GvY8PVbEBZkz+UrilP2g4cPwf+ShM
         ivdRFbKI+sCdMcCvjnPEl1uYzbHMK0kGuikSIfvc/NXN1+8h21syPZJIk326v1eVDvhX
         LsOgmovqX0MzY2dx8met4k87Z5G+BLBAGL46M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782890464; x=1783495264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qxtJSXEBg59t1yDSTVQFD26bxCNMBASOW7RR7Tr3TMQ=;
        b=gMX81JInNkbikyrip0ZJtNSKP8Dic+2k0gXrQgx29Bdl5Fgsctov9WG7rj3JtFmlwo
         BMg2fGyhYBw45qWYEAupUDXemm10stO80XuyfVXsUjg/Z9xiOLMtu5zVNoZVxtQN/NDd
         3yb/si1fLcZMtmRbf9REmaf29LLeH7/RF4PV3BA3mMvThgXAYgMXDyij8gMVjMaw2EYu
         +xaICLwE6uAl2Uk2sB7YTws2u+F0BiYUlAL8is+nyg5DWlG05VmNDOJcTF6QhkOvZqln
         DpQktvtZTyhrOdiKWSW0PdS6H/ot2H5aRjmaHZX5fE3eJ2gq7zO/SNAvCaYBvEI9HNc5
         pAzA==
X-Forwarded-Encrypted: i=1; AFNElJ//uKBWRrB3zAxkW0WcPm+LIiGVKHIONzGjDB0v77DYVE9bA7LM2j92j6I+3C4gLxfpONOH2vr1fL8yndTlbCU=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywh/gNKKXQiQmfzAFiGoLxURhMi2L48n79l/Fy+XYb7DppB21L0
	xQ14i4HzgZLkHEz+gppYRHEMSP1IDjumZs5bhcyeGKRCbWBTO2lTSgYl3YJnXtqG99bw/XemDLp
	WhsCFSQ==
X-Gm-Gg: AfdE7cmW9dGOyrf/oNE22uWiL019DFKhd0YNZZ04ULsmOr/uPq7lqRIxhpyCHvpiWPl
	blxRX/ttqSAUMDRHQVeKYP+0fDLIZCNlqMkhyXXvCaLXbPJ9GczAgkgsngYgVYBnvgudo2MARtm
	A5s41tRrx6m5GbyHlr03bp7Iwhx7FfG5bOUpSrq2EvOKBaKZ9KZGe6WsOqK6lu8etQs/qRPCwzx
	1f8Uq/PDNe/bG8GCh7ioalHN+kBLEH2DI9akKjMXA+U38Cizwnh+13mlbgkKMZpktfS9es6qYJT
	myah3ovvRD1Qreb7yaIA7kk/nNpvyOXE24vqSZdSWjFfAskVcIi1u4lEHUN7nAHcte9+jQico6e
	WBuQQe+oQ989wXS3TOrcAXfUjLc2ae1DSJn26inDAH4yV8Tlg4G95YV1dXa7aDEsfcI36YBuIcv
	g+2nzErF/FMfAfSmMUb8tz6TMYdT8a6qGF7kYHXQRM0/cSbPiFo50=
X-Received: by 2002:a05:620a:4149:b0:91e:df9f:7804 with SMTP id af79cd13be357-92e698364d6mr695053385a.38.1782890463736;
        Wed, 01 Jul 2026 00:21:03 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e62371ba1sm493839485a.42.2026.07.01.00.21.02
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 00:21:03 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c10e86e52so135761cf.1
        for <chrome-platform@lists.linux.dev>; Wed, 01 Jul 2026 00:21:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8rRdYs5NmHLmJk9mnK244lB+MF7dT2KdZsO3EKJKhIQN0Ix/18gty6JCvdtOvs8nE2/Kd1DMKF7YDyXfeAdeA=@lists.linux.dev
X-Received: by 2002:a05:622a:1313:b0:51c:97f:83a6 with SMTP id
 d75a77b69052e-51c24a9ffbdmr3434201cf.17.1782890461579; Wed, 01 Jul 2026
 00:21:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260629092414.3028387-1-tzungbi@kernel.org>
In-Reply-To: <20260629092414.3028387-1-tzungbi@kernel.org>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 1 Jul 2026 16:20:44 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D7MqL-dK8Q12f6fsXz1tWmuXSA81XPMMqjKG==taxzOA@mail.gmail.com>
X-Gm-Features: AVVi8CfGLT2uPnmHoT8zXBwVu-nm9TQcEH8fKLZpwP0RHBR28Zf-Rzdxiz8JUyA
Message-ID: <CAAFQd5D7MqL-dK8Q12f6fsXz1tWmuXSA81XPMMqjKG==taxzOA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: sensorhub: Fix memory overread in ring handler
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev, 
	suleiman@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tzung-Bi,


On Mon, Jun 29, 2026 at 6:24=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> `max_response` and `sensor_num` are read from different EC commands:
>
> - `max_response` is from cros_ec_get_proto_info().
>     ec_dev->max_response =3D info->max_response_packet_size -
>                                     sizeof(struct ec_host_response);
>
> - `sensor_num` is from cros_ec_get_sensor_count().
>     sensor_num =3D cros_ec_get_sensor_count(ec);
>
> With a malfunctioning EC firmware, it is possible that the `msg->insize`
> (i.e., `fifo_info_length` in the context) could be clamped in
> cros_ec_cmd_xfer() because `msg->insize` is greater than `max_response`.
>
>     int fifo_info_length =3D
>             sizeof(struct ec_response_motion_sense_fifo_info) +
>             sizeof(u16) * sensorhub->sensor_num;
>
> This means the number of read bytes could be less than expected.  As a
> result, the subsequent memcpy() in cros_ec_sensorhub_ring_handler()
> overreads the `resp->fifo_info` buffer.
>
> Check the return value of cros_ec_cmd_xfer_status() and clamp the length
> passed to memcpy() to the actual number of bytes read.
>
> Fixes: 145d59baff59 ("platform/chrome: cros_ec_sensorhub: Add FIFO suppor=
t")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  drivers/platform/chrome/cros_ec_sensorhub_ring.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

Thanks for the patch. Please see my comments inline.

>
> diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/p=
latform/chrome/cros_ec_sensorhub_ring.c
> index 64e9615ed6f4..4b4adc38485c 100644
> --- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> +++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> @@ -825,11 +825,19 @@ static void cros_ec_sensorhub_ring_handler(struct c=
ros_ec_sensorhub *sensorhub)
>                 sensorhub->msg->outsize =3D 1;
>                 sensorhub->msg->insize =3D fifo_info_length;
>
> -               if (cros_ec_cmd_xfer_status(ec->ec_dev, sensorhub->msg) <=
 0)
> +               ret =3D cros_ec_cmd_xfer_status(ec->ec_dev, sensorhub->ms=
g);
> +               if (ret < 0)

I think it would be much safer to just error out if ret !=3D fifo_info_leng=
th:
 - The data read here is used later in the code. Filling the array
with zeroes would cause the code to act on some data that doesn't
match the real hardware state, potentially leading to other buggy
behaviors,
 - We silently mask bad EC behavior.

We should probably also add a rate-limited print here to leave a trace
in the logs.

Best,
Tomasz

>                         goto error;
>
>                 memcpy(fifo_info, &sensorhub->resp->fifo_info,
> -                      fifo_info_length);
> +                      min(fifo_info_length, ret));
> +
> +               if (ret < fifo_info_length) {
> +                       dev_info_ratelimited(sensorhub->dev,
> +                                            "Read less FIFO info: size %=
d - expected %d\n",
> +                                            ret, fifo_info_length);
> +                       memset((u8 *)fifo_info + ret, 0, fifo_info_length=
 - ret);
> +               }
>
>                 /*
>                  * Update collection time, will not be as precise as the
> --
> 2.55.0.rc0.799.gd6f94ed593-goog
>
