Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFC342F6FE
	for <chrome-platform@lists.linux.dev>; Wed, 15 Jul 2026 09:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784107882; cv=none; b=YVGbW1ad8w195SwLx2QzrFbo6Pu28FA32oAJqUFN8pmSw4lUVlw38wOHzFXIjyiAt0GK+dBXUGYSjHk1yBBglihBGFzXVbljdCEqU5fqKy29t+92TkhM0TPHE8Q6YFqQgI5Qgtlg9yMxCaDp1iMX4lp43kkFSudS0hgDc/8ig4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784107882; c=relaxed/simple;
	bh=DeodiWAHe4W6tqlNBRSIjuazNMvzpqdIpwvPWNBbSkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qr1PJ6UJ9MpKTfFWAQOYoKdbF+CL0DJnSqzGYtlwxISMyw87BucDIehbFt5UUQyuxXyaaX+cYe0mbCNy8hrVuLN2juiqrwhiqjR6W7tnZHCZPb/OSO1H+wr+wWOQFci7ArtRo/CJmpu2FTm1AoyeMsvhJQ4p27UWvy+BbS2WztA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iCYSJKr0; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iCYSJKr0"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e65e18969so142986085a.1
        for <chrome-platform@lists.linux.dev>; Wed, 15 Jul 2026 02:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784107877; x=1784712677; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N0FASQpuuna+gF74hJSPXN8zndqXCfuXMIZX7db73d4=;
        b=iCYSJKr0AeC5fRMbTp3Cul6K8zgYotjEtz6WBtHmtx7I/jr/8tgGX+JkAoxaVmteCd
         rzB/V0hFyUuHiYjtBZsp+RyY49rBan/dc2F9Iiwp3E/vJS+LizBymeHsrhLniHP0BQlH
         wcm+E+Xtz7YSTzmLAb2lAtkNnXC8CK3rjQ5NY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784107877; x=1784712677;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0FASQpuuna+gF74hJSPXN8zndqXCfuXMIZX7db73d4=;
        b=obU56+KyBFVm9/pYVetKXWaf0mGBB4XTxc3EB9tT2gbjQW3D5YVcZ14maaqnwnn9Hw
         uvc48f61qmRgoZkFwGm6rX7qzFJwa/Lw6BrIfhzXCtNHKMknk1jJOTqUC7mhRPEjfAp1
         FhT+QHlNSSdpkU1J9+wnmCowC+u9YkVkSsRd/ADWsaO50kYASp/4anAMfLNcnHmg5AQV
         vDkdelt8qw+fLocAuacm4ZF2akPYn1sJqFT8IKHgNkAE0RuoNav3Kstvd/ITacUq7dQK
         9pxG2LSRMllGuouNu400Zz17js+iw4LkJgdzME1k8SXzxfr1i1fapM+4XmN2ic+dAYFu
         +Eyg==
X-Forwarded-Encrypted: i=1; AHgh+RoFl5/hVO6PbdsYv0BhQVooL1P2skT45bsoP4cp1BysPaP5g3QJZPY/RFSQtlefy6Kqq31LVFS+pd54fsu+TwM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMq35i5KXlYniM0mHpoMOYbl9OKcMLSDf5dZ9aV1x5bMZ0RiH+
	lLFWTN0mbbKRgtWBsMv3MeB0hD86DT0W5fchpkKrW43FM6M7BZWUsVybiA4+CVfHQnsf9Yi52Jw
	3Z3EH/A==
X-Gm-Gg: AfdE7ckwvHCykyoA/hKyjOY6YeyUv0vZsZ84NmuF1aVqm7lBs9pSOiVNc44g76ZjJx9
	b6HhEaTrIbtb0hcywUKBaachdg6xtDJadXDS4s5H9HKWyLNSKXCzUBvXW05xzg68EDcPF69hpS0
	lGbruKxR58yhITgvMXGj2/SpWFVOMF7va0MbbWHAJGbtvOwZuUaSYnhPWV1cz3Id10hnaAk2/+L
	DShqLmSn/OD7yiUmehGsfZQ4KbaJhCvyEBqMj7muVux4jtLEveaMevOV/JXJ8WOEbng1DMRZMn9
	dUFwAcQhfG9R47R4mr10c5opAWQdGZzmpGhoP1APTGj/nf+EmIwAK6oSz4/YBglDh2Z4g/Tga0T
	T3UvLkZNDgRZ1h1jwnn5hEFXuh5S5zcyOZQkMik9L81vg8vVctOM3rieG3DqJtr+jPJyFfpvs6u
	k+1sMGN0S9RiQfUkJ8XmKe+D7Sq/z12ic5IpG+egSveBhktMTvEU0=
X-Received: by 2002:a05:620a:718a:b0:930:7720:f3c5 with SMTP id af79cd13be357-9307720f3dcmr643154085a.31.1784107876613;
        Wed, 15 Jul 2026 02:31:16 -0700 (PDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5b4b38dsm1844703885a.10.2026.07.15.02.31.13
        for <chrome-platform@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 02:31:14 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51c01c79467so117561cf.0
        for <chrome-platform@lists.linux.dev>; Wed, 15 Jul 2026 02:31:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqTRKrK4B5L1Jlfmjwn4xEK0i8g/Vsr3Sj/QD7qDqh+5krQoack69WyMwTVrMS+eMfJoj2iuhmtapChGv6B2kc=@lists.linux.dev
X-Received: by 2002:a05:622a:4010:b0:517:5ac7:332e with SMTP id
 d75a77b69052e-51d7bc5040emr24283111cf.6.1784107872862; Wed, 15 Jul 2026
 02:31:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715024454.4127571-1-tzungbi@kernel.org> <CAAFQd5D5C+TSro3Up3rU-wAmbEnQ0+Vkj6wNCDZUZvcnCNG2aA@mail.gmail.com>
 <aldStRgbO_1ZhScD@google.com>
In-Reply-To: <aldStRgbO_1ZhScD@google.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 15 Jul 2026 18:30:56 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CEyAUmidH8CPo2YDXjnXmopAQBu9iXAhajrmWz3Cjnwg@mail.gmail.com>
X-Gm-Features: AUfX_mx__JcODGYoQ59LK8AMkpAn2RUCOlw1DFko6BtqbaM_pQxLx-pe702HKyA
Message-ID: <CAAFQd5CEyAUmidH8CPo2YDXjnXmopAQBu9iXAhajrmWz3Cjnwg@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: sensorhub: Fix dropped timestamp
 events and log spam
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Bryam Vargas <hexlabsecurity@proton.me>, 
	chrome-platform@lists.linux.dev, suleiman@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 6:28=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Wed, Jul 15, 2026 at 04:15:22PM +0900, Tomasz Figa wrote:
> > On Wed, Jul 15, 2026 at 11:45=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.=
org> wrote:
> > >
> > > Commit 833740a2333c ("platform/chrome: sensorhub: Bound the EC-report=
ed
> > > sensor number") evaluated the `sensor_num` against the bounds limit e=
ven
> > > for timestamp events.  A timestamp event typically has a `sensor_num`=
 of
> > > 0xff [1], causing the driver to flag it as invalid and skip to the ne=
xt
> > > event.
> > >
> > > As a result, we'd see a flooding of "Invalid sensor number 255 from E=
C"
> > > warning logs and these timestamp events were being dropped.
> > >
> > > Move the bounds-check into cros_ec_sensor_ring_process_event() and
> > > evaluate it only after standalone timestamp events have already been
> > > processed and returned early.
> > >
> > > [1] https://crrev.com/219ca6ef82ba266da788b673ee4ad50bd3ea1285/common=
/motion_sense_fifo.c#427
> > >
> > > Fixes: 833740a2333c ("platform/chrome: sensorhub: Bound the EC-report=
ed sensor number")
> > > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> > > ---
> > > Bryam: sorry for reverting the decision (moving back the check to
> > > cros_ec_sensor_ring_process_event()).  I realized we need to prevent
> > > dropping timestamp events and flooding the logs.
> > > ---
> > > v2:
> > > - Move the check to cros_ec_sensor_ring_process_event().
> > > - Return earlier for standalone timestamp events.
> > >
> > > v1: https://lore.kernel.org/all/20260714065202.3248017-1-tzungbi@kern=
el.org
> > > ---
> > >  .../platform/chrome/cros_ec_sensorhub_ring.c  | 27 ++++++++++-------=
--
> > >  1 file changed, 15 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drive=
rs/platform/chrome/cros_ec_sensorhub_ring.c
> > > index 92941924c347..d92b60213720 100644
> > > --- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> > > +++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> > > @@ -475,6 +475,21 @@ cros_ec_sensor_ring_process_event(struct cros_ec=
_sensorhub *sensorhub,
> > >                                                   fifo_timestamp,
> > >                                                   *current_timestamp,
> > >                                                   now);
> > > +
> > > +               /*
> > > +                * A standalone timestamp event typically has a senso=
r_num of
> > > +                * 0xff.  Return early here to prevent it from hittin=
g the
> > > +                * bounds check below and spamming the logs.
> > > +                */
> > > +               return false;
> > > +       }
> > > +
> > > +       /* Skip event if sensor_num from EC is out of bounds. */
> > > +       if (in->sensor_num >=3D sensorhub->sensor_num) {
> > > +               dev_warn_ratelimited(sensorhub->dev,
> > > +                                    "Invalid sensor number %u from E=
C\n",
> > > +                                    in->sensor_num);
> > > +               return false;
> > >         }
> > >
> > >         if (in->flags & MOTIONSENSE_SENSOR_FLAG_ODR) {
> > > @@ -502,10 +517,6 @@ cros_ec_sensor_ring_process_event(struct cros_ec=
_sensorhub *sensorhub,
> > >                 return true;
> > >         }
> > >
> > > -       if (in->flags & MOTIONSENSE_SENSOR_FLAG_TIMESTAMP)
> > > -               /* If we just have a timestamp, skip this entry. */
> > > -               return false;
> > > -
> >
> > Isn't this still needed for the case of
> > MOTIONSENSE_SENSOR_FLAG_TIMESTAMP and (MOTIONSENSE_SENSOR_FLAG_ODR
> > and/or MOTIONSENSE_SENSOR_FLAG_FLUSH)?
>
> The block serves for standalone MOTIONSENSE_SENSOR_FLAG_TIMESTAMP events.
> If the flags contains ODR or FLUSH, it returns in other branches.
>
> After applying the patch, the flow of cros_ec_sensor_ring_process_event()
> looks like:
>
>   If TIMESTAMP but (!ODR and !FLUSH):
>      ...
>      return   <--- The patch merges the block and returns early.
>
>   Check bounds for sensor_num
>
>   If ODR:
>      ...
>      return
>
>   If FLUSH:
>      ...
>      return

Ah, right, I didn't notice that those blocks already returned. Sorry
for the noise.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best,
Tomasz
