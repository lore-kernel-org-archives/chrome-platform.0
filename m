Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC0813AA26
	for <chrome-platform@lists.linux.dev>; Mon, 29 Jul 2024 11:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722254244; cv=none; b=PqSEN7OdP5Wf0Mfkml/JePKfJAvKONuC6/HeMpb6rYhrqRVyq0U1MjjWRqlxXSCGprcbQipiPE5AlpjKYJd7U1iQ2SSNMh22F01XcqjBCVTaP061szTIPuGjkA5pLO1bag96j5SdQdnLZKJR0KpOMkV6v3S3MUpxCUDYrCpvaOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722254244; c=relaxed/simple;
	bh=x3XhPLsCtjDy70nhvPuPtYCSM145dpQSHE7ynV+IkpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jl1MZlfkSPkUnjnyjNyvXThH1b5e8bNQ9yLg6E3GUWJ5Iu6Yj7sjVhlf9MBJCuusUKfIWQLzhyA8FRwFZx93zEbARHe1dhf6vZxSu/UaOK6q7twMFyHLIOc/zcRIOsOKoxR6HeQeQMaq5575K6+ZmYKJllPkliq5iLmyJGYvrFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LS5T0pjM; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LS5T0pjM"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5a18a5dbb23so10819a12.1
        for <chrome-platform@lists.linux.dev>; Mon, 29 Jul 2024 04:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722254241; x=1722859041; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+A9yn1Vu3zA/NqT+R60GqDVDjMj6eEkOom2C/kDD3s=;
        b=LS5T0pjM74I6Wfn2PUUkvVJ92I/mH7P4xdpTg4Q3BspdhrWrORghG9auHA3m4nol5f
         LS+cL6XroPkgyksYEwmZwIGtG7gxknbBOxmhr/nuEubZmQaRvZJt6iw6mQVR0VOsNQFR
         7fSxIZhgaK7xL3kElr3lNVN86WjvGqCopNk2rts/Z2i7HYJoBGeihoAaQGhmG6ZHx1W/
         iWjeIo5KeB8SxR/ZEpmc+Nku6kO7nCqhwC51IC+Qkh7srn12vFsnBdEhlws9ZwchPDZJ
         +MOcieng7ugoghaVKbFpL4L+rDopBzVZMPMTMusktBpAtKwWyQma2Gmg+h3+f5QWND3/
         XdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722254241; x=1722859041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+A9yn1Vu3zA/NqT+R60GqDVDjMj6eEkOom2C/kDD3s=;
        b=KtrLqoxcKYbKLOFMrb3AttDIAxbbKPqgA0dlRdg4PP0Ipk3ne57vVhe5pPLyabH9Xp
         /ffs8HW6DdybmXNqrL6AAt7+yI8vl2krDrDS0aPiqaVlyQjk5Bzsr/V5ma+k28CO1hdu
         sV1/oNHIBRvEnmDHlCygrR51FLDEPGRzfc/EE/juEH3e483DHJykV/pKHuj2VBDgfsY/
         jFxGXmUBbImXdqTuUpQivOHHWPhIMugsZXnHzKhZQFp4Y+MxVPYiPVj4JJbdVEqEly12
         x/GgCrduKOUZNm2C5M2wbNW3Jr/9F2THxNXZWbLHHhEjktcfUgLwQa99ikzojdht6WYl
         R3ZA==
X-Forwarded-Encrypted: i=1; AJvYcCW+K7U2gsvZb7cwThkdTfy4woHJj7kt+lLaXkLoxm3ga46CyJyQghhUfqnQmJUOSV2SjtCOqTX5KmiewEfNIu+fgdAdTJk6XkPqHEsYrQ8o
X-Gm-Message-State: AOJu0Yz6qxeVwjV5dIQVefzFaXEF8OIJbjaIsjpDtXnzpUiTWVj0jShb
	waJxn2n+YmP8TBY/3kroP/pkQEm04N+BfoD7QTrifhW2c0dn1Kf8oxCkme55pSGkOkGw4kkksKf
	HkcZdgADs2FTIRYVxqBLZTS3ThZRfvJjZ2LUv
X-Google-Smtp-Source: AGHT+IFGfho3sbTHKT0xwhEjvTYuUpNnNy70RSsdxIvCATXOU/6B+Ko3DwMfC7CFyPef0u/zrB+lS4UagH+FLbCyDvg=
X-Received: by 2002:a05:6402:3585:b0:5a0:d4ce:59a6 with SMTP id
 4fb4d7f45d1cf-5affc67d570mr338128a12.2.1722254240674; Mon, 29 Jul 2024
 04:57:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240725175714.1769080-1-patrykd@google.com> <ZqcQ3rjY6Wu4lU6t@google.com>
In-Reply-To: <ZqcQ3rjY6Wu4lU6t@google.com>
From: Patryk Duda <patrykd@google.com>
Date: Mon, 29 Jul 2024 13:57:09 +0200
Message-ID: <CAMxeMi3864MhJvaH16mw5hHKzYnoRWpZWnxJJuWm9bSKiTojWQ@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_proto: Lock device when updating
 MKBP version
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 5:47=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Thu, Jul 25, 2024 at 05:57:13PM +0000, Patryk Duda wrote:
> > The cros_ec_get_host_command_version_mask() function requires that the
> > caller must have ec_dev->lock mutex before calling it. This requirement
> > was not met and as a result it was possible that two commands were sent
> > to the device at the same time.
>
> To clarify:
> - What would happen if multiple cros_ec_get_host_command_version_mask() c=
alls
>   at the same time?
In the best case, MCU will receive both commands glued together and
will ignore them.
It will result in a timeout in the kernel. In the worst case, request
and/or response buffers will be
corrupted.

> - What are the callees?  I'm trying to understand the source of paralleli=
sm.
This is a race between interrupt handling and ioctl call from userspace

Handling interrupt path
cros_ec_irq_thread()
cros_ec_handle_event()
cros_ec_get_next_event() - Queries host command version without taking
ec_dev->lock mutex first
cros_ec_get_host_command_version_mask()
cros_ec_send_command()
cros_ec_xfer_command()
cros_ec_uart_pkt_xfer()

Command from userspace
cros_ec_chardev_ioctl()
cros_ec_chardev_ioctl_xcmd()
cros_ec_cmd_xfer() - Locks ec_dev->lock mutex before sending command
cros_ec_send_command()
cros_ec_xfer_command()
cros_ec_uart_pkt_xfer()

>
> Also, the patch also needs an unlock at [1].
>
> [1]: https://elixir.bootlin.com/linux/v6.10/source/drivers/platform/chrom=
e/cros_ec_proto.c#L819

Yeah. I'll fix it in v2

>
> > The problem was observed while using UART backend which doesn't use any
> > additional locks, unlike SPI backend which locks the controller until
> > response is received.
>
> Is it a general issue if multiple commands send to EC at a time?  If yes,=
 it
> should serialize that in the UART transportation.

Host Commands only support one command at a time. It's enforced by 'lock' m=
utex
from cros_ec_device structure. We just need to use it properly.
