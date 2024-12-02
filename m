Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B121F943E
	for <chrome-platform@lists.linux.dev>; Mon,  2 Dec 2024 09:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733130975; cv=none; b=HTKH1R4gWNAHrWziSk4bwBgcqkMzZVHiepckLiX7rfDOWYk1Hoh5eaIZOK4RpSIUmOOH1vvnRxQaTrw1D5Xj6DHJz2d1K2W8VFo5t6GLn294RPjHDKXxvIKlZ615in2pBxdZmm7yT/0sQk1cA167h6DH3x2c/SIfX8lroAhN56k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733130975; c=relaxed/simple;
	bh=5WrUnJEqQiuUuTJ+OJiQnCJ7THQ+A+DF5medutrEQfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qpIiqZxaIT7cw+q4cgYi9Ab89vf0T0+gxikX7S/leXVLO5CUoNE/MkN+tGMMsa+01dU2RJVKa7GPOCYo24L5UtO9L44qHBdpB3LsTeRtjdz/L9RpjTgDvk5IzcXqXRen4Z55NPIrybYgbtod01rDUy573QIs4knqupyWJP5NTRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xpiWnpfN; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xpiWnpfN"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ef66a7ac14so20457137b3.0
        for <chrome-platform@lists.linux.dev>; Mon, 02 Dec 2024 01:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733130972; x=1733735772; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1eG6H9xL8sk/1S7A6iBU9/Voo1x3apTymTAnplNQbuo=;
        b=xpiWnpfNSOImiqHl97AvBjzdWciJur/LAshC2s/hjeSquL1oOFkv1UoBGKoMqgBEpD
         zWZQ0XcvJWTRvWgLIbhjtRwt3Ze1NptqPYojBFnPoJ6Xi3/4maqoYBQiaJWcgeEzr+Pe
         c7XmoWg+xvo298AWID9VsMZKLwPcESauVu8c91DllUtucmH6u7Clgay3WTuMY1AYRw9V
         z75WPhfimnpkgzoBN+qKW5qseDAMdRovexXHVcDFwBXwsPBLG4UPZt2NsJHufWP06gey
         D+fA3AvoQw5UVVAXqOxGJ4HLsaEbfFCKJhKBIhz0Xp/2CJJYzb5aW5SW9Dwu1CRGEBLh
         t/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733130972; x=1733735772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1eG6H9xL8sk/1S7A6iBU9/Voo1x3apTymTAnplNQbuo=;
        b=d9gPtCs3N8azCyCB+uc6AOa/Qel/uso41J8UyxOQ1enmqWJZwsZwWmhpdiBnZXIo6+
         Ku6LoJbkIRKyDoeCemj/g0YXMgHCxHmLwYOm/t0qEe0BnNORUsolrFmN5yeIX6kJHheq
         Ug0zpkzcZ6WzvXbPFbAGT9zVfM1CbJTeZgbDpHLeF+IsxN/MGZhu7sFUrL3uYBX8EV1F
         Yn0tZXGvBmkNRXbIQU43lw0WdQl2w4XWzxpAmStKsL7V5jh9tdaJ2kTx+LUOZRXLZxnJ
         J1qcr812mKHY4/q60RTl9QiTp/3AV5ZPVJSKefshXoXVkPEMnjLsb70vSHKgaoPtlxmN
         Dnhw==
X-Forwarded-Encrypted: i=1; AJvYcCXl1Ap6j0vRJoSteFbOTemMb5riMMde1D+MgJxOhuNM82IMdt0XbEceuHzMO/T7F3hwF3FEx/nlbJ8X4ycOlqA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOe+gEdXJsiyBHPwhWO5QTtxCFlBMnAZI08P3pDsvYoc5HF1HQ
	AyBEzOmCyXvSPReOMwxCLmmD6RLexxRhVlaXjIGaE4nEmZhuq/eSSLBlbr2gRfBdr5dLunUiU/H
	3RvEt/k/3roFeLSABwX1qBhoxmyQ/9C62RNG1
X-Gm-Gg: ASbGncssmYiNHAbXIsCiqEjdVQXssUC95+62+a/exCjRChGErFlOACD1vpcrS6rLssE
	EVZQksO9JFp0tXgb0WV+lnxA1phNiDg==
X-Google-Smtp-Source: AGHT+IGLfK90CGrw+U7d4tyOPXLmg+EKv1CY3vyA/Q00bc/KKdGdeAKIVU8n+M6Hhwa6n30VmDCqUxFawN0x4JzUV9Q=
X-Received: by 2002:a05:690c:3505:b0:6db:e1e0:bf6a with SMTP id
 00721157ae682-6ef4a0dfcb2mr152707887b3.7.1733130972344; Mon, 02 Dec 2024
 01:16:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241125184446.1040187-1-dawidn@google.com> <Z0fxrDTuCIeCDTiV@google.com>
In-Reply-To: <Z0fxrDTuCIeCDTiV@google.com>
From: =?UTF-8?Q?Dawid_Nied=C5=BAwiecki?= <dawidn@google.com>
Date: Mon, 2 Dec 2024 10:16:01 +0100
Message-ID: <CAJ_BA_BvGPfAghiQo8uQSAhdqG3NiWXbO7c-Q_x6cvUUukrzsA@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform/chrome: cros_ec: jump to RW before probing
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, chromeos-krk-upstreaming@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 5:29=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Mon, Nov 25, 2024 at 06:44:45PM +0000, Dawid Niedzwiecki wrote:
> > To avoid such problems, send the RWSIG continue command first, which
> > skips waiting for the jump to RW. Send the command more times, to make
> > sure EC is ready in RW before the start of the actual probing process. =
If
> > a EC device doesn't support the RWSIG, it will respond with invalid
> > command error code and probing will continue as usual.
>
> I'm wondering should it only send RWSIG_ACTION_CONTINUE if EC_CMD_GET_VER=
SION
> shows the FW is still in RO.

In theory yes, but in practice it is not necessary. If FW is in RW, it
will return
EC_RES_INVALID_COMMAND (the same case as RWSIG is not supported), so
the job is done.
EC_CMD_GET_VERSION + potentially RWSIG_ACTION_CONTINUE sequence is longer.
Additionally, EC_CMD_GET_VERSION requires bigger buffers to store
versions strings.

>
> Curious about: who (in which use case) is responsible for sending
> RWSIG_ACTION_ABORT if it wants the EC stays in RO?

Currently, it is done by flashrom
https://source.chromium.org/chromiumos/chromiumos/codesearch/+/01195dd492ea=
196cdc60e467a896369e30e90c5b:src/third_party/flashrom/cros_ec.c;l=3D480

>
> > diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrom=
e/cros_ec.c
> [...]
> > @@ -204,6 +204,11 @@ int cros_ec_register(struct cros_ec_device *ec_dev=
)
> >       mutex_init(&ec_dev->lock);
> >       lockdep_set_class(&ec_dev->lock, &ec_dev->lockdep_key);
> >
> > +     /* Send RWSIG continue to jump to RW for devices using RWSIG. */
> > +     err =3D cros_ec_rwsig_continue(ec_dev);
> > +     if (err)
> > +             dev_warn(dev, "Failed to continue RWSIG: %d\n", err);
>
> Too verbose, use dev_info() instead.

I will change that.

>
> > diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform=
/chrome/cros_ec_proto.c
> [...]
> > +int cros_ec_rwsig_continue(struct cros_ec_device *ec_dev)
> > +{
> [...]
> > +     for (int i =3D 0; i < RWSIG_CONTINUE_RETRIES; i++) {
> > +             ret =3D cros_ec_send_command(ec_dev, msg);
> > +
> > +             if (ret < 0)
> > +                     error_count++;
>
> Should it just return the error if the transmission fails?

The transmission failure is kind of expected here. It is possible that
FPMCU is not ready, when AP
starts sending commands. That's why the retry (which is removed in
PATCH 2/2) was added in the
cros_ec_get_proto_info function.

>
> > +             else if (msg->result =3D=3D EC_RES_INVALID_COMMAND)
> > +                     /*
> > +                      * If EC_RES_INVALID_COMMAND is retured, it means=
 RWSIG
> > +                      * is not supported or EC is already in RW, so th=
ere is
> > +                      * nothing left to do.
> > +                      */
> > +                     break;
> > +             else if (msg->result !=3D EC_RES_SUCCESS)
> > +                     /* Unexpected command error. */
> > +                     error_count++;
>
> Same as `ret < 0`, should it just return if any unexpected errors?

It should return here. It is unexpected that the command itself
returns error, we should return
in this case. I will change that.

>
> > +             else
> > +                     /*
> > +                      * The EC_CMD_RWSIG_ACTION succeed. Send the comm=
and
> > +                      * more times, to make sure EC is in RW. A follow=
ing
> > +                      * command can timeout, because EC may need some =
time to
> > +                      * initialize after jump to RW.
> > +                      */
> > +                     error_count =3D 0;
> > +
> > +             if (error_count >=3D RWSIG_CONTINUE_MAX_ERRORS_IN_ROW)
> > +                     break;
>
> It could return 0 if `error_count >=3D RWSIG_CONTINUE_MAX_ERRORS_IN_ROW`.

True. I will fix that.

>
> > +
> > +             if (ret !=3D -ETIMEDOUT)
> > +                     usleep_range(90000, 100000);
> > +     }
> > +
> > +     kfree(msg);
> > +
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL(cros_ec_rwsig_continue);
