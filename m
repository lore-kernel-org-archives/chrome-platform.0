Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606A342B319
	for <chrome-platform@lists.linux.dev>; Thu,  2 Jul 2026 08:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981320; cv=none; b=mmLsOj0uZ1I45jIkUJUDcCrmF0+7xMmBhf8Wy+vz72Xf+Jex+TxNq7oxl36iNMj+tt+zIHCaRmNOQXCOxPgb+r7Oe6HATLx2C+aQsUJhpEL1MFF1h4aI2TVddbH7lPaEHPB1K/JE3NKNTCFyFyCNAZVoDHlro0hE+4GYndCy6A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981320; c=relaxed/simple;
	bh=NdvyTYdNHLgcNjTk5j1ACKEFmS9o70qDr/uFJ6O6xDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ptki/+fpVJmwzQR2xNKIaI0bzHfEqvwAwcA3VDzdDsaf6fCvkJnmQczSp6x4VV/jG6MLO5iXcD3kXo7oEs+Prw9KZ3EAU+jLXvuICdl/a+uBHmOHxlXLdFSC2Ec6lydiNE+rV2A8x5Yqvc8g6uNmUK/UPUS2/Iu+jJJAK/z1mCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Crdpa0vJ; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Crdpa0vJ"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92e55b62640so80330585a.0
        for <chrome-platform@lists.linux.dev>; Thu, 02 Jul 2026 01:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782981317; x=1783586117; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOEMsoW2iz8lvTp6RKPkUuo6+DJEsCgYiwSpMmr9mp4=;
        b=Crdpa0vJ1jqW2Lq1lNj7lfd96pW8csWu3M4pM4vZ7lrQAb2PfJ8iu4JcyxG6synLkD
         qVUToGB1sOdAVGsRXNzR6tVE0vF9lpTF9MSi0wYxHSzPbC3wDb/Gn0iKGzdFW8SYRFIZ
         Np/ieVg+ehltLsSh/nRumdvwNTdLiRvp12UpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782981317; x=1783586117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zOEMsoW2iz8lvTp6RKPkUuo6+DJEsCgYiwSpMmr9mp4=;
        b=ihuekW4+BD8/y7JIvdLSgWi3B0uPPJkjZtFjlLznK8edB15UUnL/tDQ9PX1ni4d7IT
         HERTJMV/z/wL++cnwqXZ43JqquNea4nkPsIKwXhIw0sjjv1eTgnGeeWj8q7xyPz8Erx3
         3T+KFWg5a/tqoyHIXf6aPCwDm4dl+3nr9+8GI0VSsFwOUuWDCSuH7MpXKxdZt4xMhZWp
         BfHVV83/ToRs6l6ICvo8igToCQn/GK6yznib8phMZX3THzEKuvoGfrs+2S7NCllWxQql
         KP78bsPU7zWJW5j8LnYff6VVMh6C3Im7rIgyECIWNmheJZc4HiFU/xO7H+RtTAWKxCzS
         fXPw==
X-Forwarded-Encrypted: i=1; AFNElJ8oNCPykiYn3rau950WMn0S/3YneDSdn81chKJpZO6VAZIBmi0yz/5ZvQg5HqL89dKpvC4sedYshqY5mnijq10=@lists.linux.dev
X-Gm-Message-State: AOJu0YwgWUpI1d6gP06s1AF7Vwnh7/+DYt99nO2htzCjnKiQebPgZDaE
	f5CAoNamA6I56uOdBVXrHIrvYO0cfao7kffT2ZLaeicjPHNExbQzLFIGroexoW5jsw79bZdX2ZY
	LCEpIsg==
X-Gm-Gg: AfdE7cljzELirWwu124fbPiE+24WlrH26ydPw4KhOJ2vySJlYZBAepLEPpz6WE3KSdm
	dw5pNTmwZqk8ac4Gr3sxFtaitjKr5234w/fcKA3pX2aqx6G0aMHfjSpOnQVydhGh7IdN/kZm20T
	JDsgz0a+rTFA159g3I/d1zGn+SotfDramFcIv1wlM3LC/3iqyM2ljquJdTFyw1KacAcn3jMzVZE
	qoK0xbJVQq9Or7dG2NjsP5HLI82/o99i5w07ke85YBVYTbAuxFpoENLb9k+W4TXVqQZ0QIarE/p
	UKDU0ds1SH9OCrbi7MnoMlKnAscs1sCyF/UuZHX7J+Vwzd8hP8/cxfOX7iUD/X7NpSriCi7d+3T
	pldBGBUd+IOdbRm4UjwVC7yyuubj8Wb7PW/jGJKo1cC8BdposaUY+oK2cb7JR9BfSBvakizsROq
	OLU6behdQHMlGTxFo9c85I6RJZJ+ItYoDvuKJTYto5xfKFfpk=
X-Received: by 2002:a05:620a:460d:b0:92e:54ad:3d9e with SMTP id af79cd13be357-92e7850723emr727890285a.67.1782981317183;
        Thu, 02 Jul 2026 01:35:17 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e80161816sm163932385a.22.2026.07.02.01.35.15
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 01:35:15 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51c15a5b265so503001cf.0
        for <chrome-platform@lists.linux.dev>; Thu, 02 Jul 2026 01:35:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9X6S/RfO9bcCCobwQHCFoYMt6pcZjC9Ly6MHuJJShAbzcIzTyK5SEnNLw/4KudM3OmA5sMqY5zoQhHFyhb4+U=@lists.linux.dev
X-Received: by 2002:a05:622a:16:b0:516:3f51:81cb with SMTP id
 d75a77b69052e-51c32a7f450mr3567961cf.13.1782981314795; Thu, 02 Jul 2026
 01:35:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260702082745.1014968-1-tzungbi@kernel.org>
In-Reply-To: <20260702082745.1014968-1-tzungbi@kernel.org>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 2 Jul 2026 17:34:58 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AD4zDKMFmScydk_LmPgKWuSrpkr7Vm-VCccM0O2VUNJA@mail.gmail.com>
X-Gm-Features: AVVi8CdukCCH6OaT5vL_J5eJxbY7GriOz1jtl_eNJ3YKRsezn0Rb_JSmAaO2ZW8
Message-ID: <CAAFQd5AD4zDKMFmScydk_LmPgKWuSrpkr7Vm-VCccM0O2VUNJA@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: sensorhub: Fix memory overread in
 ring handler
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev, 
	suleiman@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 5:28=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> w=
rote:
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
> Check the return value of cros_ec_cmd_xfer_status() and abort if the
> number of bytes read does not match the expected length.
>
> Fixes: 145d59baff59 ("platform/chrome: cros_ec_sensorhub: Add FIFO suppor=
t")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> v2:
> - Abort if the number of bytes read doesn't match the expected length.

Thanks!

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best,
Tomasz

>
> v1: https://lore.kernel.org/all/20260629092414.3028387-1-tzungbi@kernel.o=
rg
> ---
>  drivers/platform/chrome/cros_ec_sensorhub_ring.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/p=
latform/chrome/cros_ec_sensorhub_ring.c
> index a10579144c34..988ecef93342 100644
> --- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> +++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> @@ -825,8 +825,15 @@ static void cros_ec_sensorhub_ring_handler(struct cr=
os_ec_sensorhub *sensorhub)
>                 sensorhub->msg->outsize =3D 1;
>                 sensorhub->msg->insize =3D fifo_info_length;
>
> -               if (cros_ec_cmd_xfer_status(ec->ec_dev, sensorhub->msg) <=
 0)
> +               ret =3D cros_ec_cmd_xfer_status(ec->ec_dev, sensorhub->ms=
g);
> +               if (ret < 0)
> +                       goto error;
> +               if (ret !=3D fifo_info_length) {
> +                       dev_warn_ratelimited(sensorhub->dev,
> +                                            "Mismatch read length: size =
%d - expected %d\n",
> +                                            ret, fifo_info_length);
>                         goto error;
> +               }
>
>                 memcpy(fifo_info, &sensorhub->resp->fifo_info,
>                        fifo_info_length);
> --
> 2.55.0.rc0.799.gd6f94ed593-goog
>
