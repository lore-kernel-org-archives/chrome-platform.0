Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A123BE178
	for <chrome-platform@lists.linux.dev>; Wed, 15 Jul 2026 07:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784099750; cv=none; b=ntdQdDcsYEfZQiwEmbMvXsGTpcokzVBtJ4UID52mgzd7We1TC6//5clfpk9Mz9a9kAMcSIyz7GFNU/5THZfB7z4cjDLl9XjU1tGeyJ212Gwdfb5s3G5gjcLoFCEBxsK+BjY8gTK7hj//gnvOFmdmx4Dzoe1SQ60KNDGNt2m3Q3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784099750; c=relaxed/simple;
	bh=Ts18MJVf4TykJCfSaevGrvvJnE1dneWJzrXvVC9h2pA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fh2XGfaaXwlvYO75DKHBoB23gxWUYzTInWGittq6Tyts6jBepJjvOcHAHJygQJQazN3IzZ/Sr3CfYinge1nfuUIrSh0Y0TxHVs4Oxsu8oMxfBiErxzzTJMg+MnoyWCwWfyvrXKReMbENuax7MW/s18pb8fqeqLtXS1yySDWDjRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MH428jxY; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MH428jxY"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8ef7b7651ecso2859086d6.1
        for <chrome-platform@lists.linux.dev>; Wed, 15 Jul 2026 00:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784099744; x=1784704544; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bS8qU6xs3YQyAM6ffRMh+TPhsxeXbEXjirRljiX/JCc=;
        b=MH428jxYRvv5Z0fmEQgW4eObAlwcgzV0agh+DYKXyV5qGTNNLI3ORNZTxYlPtiMFE+
         +K3z/1Dy47D0cuOwrgMsxKXVGN2ZAEX2eWXhtLQ0U+7NdV7HHN+MXmpVgqSLxGSWqdsI
         bT7pI/vIGehdAI09+TjX/TbWYOFN47/oZ/XAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784099744; x=1784704544;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bS8qU6xs3YQyAM6ffRMh+TPhsxeXbEXjirRljiX/JCc=;
        b=ocJ9xxlaIqqxq5H31UAZvjXCY7PMJcWJfDTFiCP+5IeAOg7kYWyl3h73kEQf7+fTG+
         M+YUAsghRSP/TScP0VfOxXInqZ1fxXNvTgFSXneOHDdIdKXGF9H3k+DTTT4f6SqOMWHk
         B/GdzuvFfzAoR3mSQWfK7IP4iwgkeElh3+WhPwdW3f7cFid0QJ+hoJl3BNoMpd3UqXNd
         QmJgvh41hB//OnDTHdVBxU5O0uqNKy4cGIk6YDlxPRvI/73F7K90XIAnVLC2VIBgIvc6
         oLhUKnsikp/bU4lLRB9+LV1MWrT5D9hTmx9ra+G1FLY/2SVjJz9Rsp4jempwbPd1aiPh
         xBHg==
X-Forwarded-Encrypted: i=1; AHgh+RqH2Ql2KsTdiPG7R1Z/nfPOppGxcUiQeC7c8zGFYB9KTA4CqbGQ2j1PSGlkXEh1+gZziZJdKYw94Jl0HjoJO4c=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUUTZLgg63tdeqv4PDu7u6cPWnTubN7CUzEeHAXFM0lIHp9dxj
	lV1jDVNeXrv5HyXyZWmd4cgHFhSUCL1dOyIITrN7iRElDjNX2M8XkL4RHRwNQhnsP/WP2P10PQT
	rJZX0FA==
X-Gm-Gg: AfdE7clrbQWl4MEdIYohZ//ZE3TEUC7DRDonfWaNV6tgZixE5SMaurithrhDQVw4K//
	5epxxAfQ48ZWEKitqBpS12tEIadNHQfmZh6OVfX2Pb/xSbhV3M26fEViPv4igJQcs6DlXVdyjVu
	5F/p523gH6DuJQ4Qtmmpzn7jmOT1Y6fh9M2aQ0tt75h5EJCN8Os0FUhzS98gVUscoPlZdZGQFOR
	zk25+bqKujsT534vSl5zJog9qqMwJNcQvrelTUGry67EhMGXmAWisRy7LxvmDuF+ytQOCBsiUt6
	ZsYFYJk77Eef2HPRP3YLH5zF43y88gF7MfGoJFLIbT5su+9jrWRTPPRA/hcs4MpjbPRVHO0QfrS
	rU9JFDMyhClohGU4fcTXK8GP8SRTqoqFTaxB5W7hOQbOXYDNPBWUmZkp+EmJ1zBmdkIo2l1BIlp
	la08KlDK5d+Zpkqy/l/X7tMKk4MsDiL2c7BPAUFo3ApWXQex6+I1p2jl+ukSwm1w==
X-Received: by 2002:a05:622a:1f88:b0:51c:fdd:f040 with SMTP id d75a77b69052e-51cbf8df184mr163998731cf.21.1784099744378;
        Wed, 15 Jul 2026 00:15:44 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51ec9fef211sm1044041cf.0.2026.07.15.00.15.40
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 00:15:41 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51c15a5b265so98791cf.0
        for <chrome-platform@lists.linux.dev>; Wed, 15 Jul 2026 00:15:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpP2hJaNJ5tZnWAJA2+lJRKUykkfexFmp+CruHaH3rmoYdVeoa0lFsgRby7G5KIgtJCeuqirV94InU10SZVZDY=@lists.linux.dev
X-Received: by 2002:a05:622a:448:b0:51c:ca9:3d17 with SMTP id
 d75a77b69052e-51d7bdcb639mr23603701cf.12.1784099739219; Wed, 15 Jul 2026
 00:15:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715024454.4127571-1-tzungbi@kernel.org>
In-Reply-To: <20260715024454.4127571-1-tzungbi@kernel.org>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 15 Jul 2026 16:15:22 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D5C+TSro3Up3rU-wAmbEnQ0+Vkj6wNCDZUZvcnCNG2aA@mail.gmail.com>
X-Gm-Features: AUfX_mwDewb6l2xSJaF0LGFnkN6ZDRNauyF2tKYmG7CLJXf-LrLP9850GobG64I
Message-ID: <CAAFQd5D5C+TSro3Up3rU-wAmbEnQ0+Vkj6wNCDZUZvcnCNG2aA@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: sensorhub: Fix dropped timestamp
 events and log spam
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Bryam Vargas <hexlabsecurity@proton.me>, 
	chrome-platform@lists.linux.dev, suleiman@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 11:45=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> Commit 833740a2333c ("platform/chrome: sensorhub: Bound the EC-reported
> sensor number") evaluated the `sensor_num` against the bounds limit even
> for timestamp events.  A timestamp event typically has a `sensor_num` of
> 0xff [1], causing the driver to flag it as invalid and skip to the next
> event.
>
> As a result, we'd see a flooding of "Invalid sensor number 255 from EC"
> warning logs and these timestamp events were being dropped.
>
> Move the bounds-check into cros_ec_sensor_ring_process_event() and
> evaluate it only after standalone timestamp events have already been
> processed and returned early.
>
> [1] https://crrev.com/219ca6ef82ba266da788b673ee4ad50bd3ea1285/common/mot=
ion_sense_fifo.c#427
>
> Fixes: 833740a2333c ("platform/chrome: sensorhub: Bound the EC-reported s=
ensor number")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> Bryam: sorry for reverting the decision (moving back the check to
> cros_ec_sensor_ring_process_event()).  I realized we need to prevent
> dropping timestamp events and flooding the logs.
> ---
> v2:
> - Move the check to cros_ec_sensor_ring_process_event().
> - Return earlier for standalone timestamp events.
>
> v1: https://lore.kernel.org/all/20260714065202.3248017-1-tzungbi@kernel.o=
rg
> ---
>  .../platform/chrome/cros_ec_sensorhub_ring.c  | 27 ++++++++++---------
>  1 file changed, 15 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/p=
latform/chrome/cros_ec_sensorhub_ring.c
> index 92941924c347..d92b60213720 100644
> --- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> +++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> @@ -475,6 +475,21 @@ cros_ec_sensor_ring_process_event(struct cros_ec_sen=
sorhub *sensorhub,
>                                                   fifo_timestamp,
>                                                   *current_timestamp,
>                                                   now);
> +
> +               /*
> +                * A standalone timestamp event typically has a sensor_nu=
m of
> +                * 0xff.  Return early here to prevent it from hitting th=
e
> +                * bounds check below and spamming the logs.
> +                */
> +               return false;
> +       }
> +
> +       /* Skip event if sensor_num from EC is out of bounds. */
> +       if (in->sensor_num >=3D sensorhub->sensor_num) {
> +               dev_warn_ratelimited(sensorhub->dev,
> +                                    "Invalid sensor number %u from EC\n"=
,
> +                                    in->sensor_num);
> +               return false;
>         }
>
>         if (in->flags & MOTIONSENSE_SENSOR_FLAG_ODR) {
> @@ -502,10 +517,6 @@ cros_ec_sensor_ring_process_event(struct cros_ec_sen=
sorhub *sensorhub,
>                 return true;
>         }
>
> -       if (in->flags & MOTIONSENSE_SENSOR_FLAG_TIMESTAMP)
> -               /* If we just have a timestamp, skip this entry. */
> -               return false;
> -

Isn't this still needed for the case of
MOTIONSENSE_SENSOR_FLAG_TIMESTAMP and (MOTIONSENSE_SENSOR_FLAG_ODR
and/or MOTIONSENSE_SENSOR_FLAG_FLUSH)?

>         /* Regular sample */
>         out->sensor_id =3D in->sensor_num;
>         trace_cros_ec_sensorhub_data(in->sensor_num,
> @@ -897,14 +908,6 @@ static void cros_ec_sensorhub_ring_handler(struct cr=
os_ec_sensorhub *sensorhub)
>
>                 for (in =3D sensorhub->resp->fifo_read.data, j =3D 0;
>                      j < number_data; j++, in++) {
> -                       /* Skip event if sensor_num from EC is out of bou=
nds. */
> -                       if (in->sensor_num >=3D sensorhub->sensor_num) {
> -                               dev_warn_ratelimited(sensorhub->dev,
> -                                                    "Invalid sensor numb=
er %u from EC\n",
> -                                                    in->sensor_num);
> -                               continue;
> -                       }
> -
>                         if (cros_ec_sensor_ring_process_event(
>                                                 sensorhub, fifo_info,
>                                                 fifo_timestamp,
> --
> 2.55.0.229.g6434b31f56-goog
>

Best,
Tomasz
