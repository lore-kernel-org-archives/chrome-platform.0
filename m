Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D596D83CAB
	for <chrome-platform@lists.linux.dev>; Thu,  8 Feb 2024 18:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707416075; cv=none; b=WArU4UorABXvJhGddcmzyINdoNyDSyogEDNdG5M6/Nn6EwT4Rawx+ydqN9ZVYzSdZFtXIYLP7vgNxedwyWdUhxE5yLSmHP+tDQ5dgzMPCtNIymbN1wqvFsVbfvmXb/spbDDEK+9oftUbCJjflqwM2Ks1xmh9+mVqIpUemgx1o3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707416075; c=relaxed/simple;
	bh=raktRbRT/30YboSLtBUFxeNmuuB0czI5c0h//xAnajU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pbHNfVL6GJKUQVn/jG3YrnFWD+HSuBaaCKED79xOGCpDjw0dvRUqcquRJPTVJYkD1Y+Xf4jIGxVgZLeShhgCU2hjDgrjmHQrhB5k3cQKMqwOrmuMDNn9JqWZV8b7egXLmLwvS5bfzELztWmI6XjcbrmlNKHYdwCV7LVpKyVLI9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SfjSHWY3; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SfjSHWY3"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6e2bb7dc4dfso26901a34.3
        for <chrome-platform@lists.linux.dev>; Thu, 08 Feb 2024 10:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707416073; x=1708020873; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XP2DrPejZ4y9GWeuess5B/7wBkV0f7f91rTBUzRBkq8=;
        b=SfjSHWY34YfyjFEYmbV1eLq6l1pGkrD0Zv9+6mo4h4qR9sDt9Tswcu74PB4vX67ZLm
         lS/KzlEnMQXfcC8wszZIQRWN3sSVAD7rsFmhsiT6TthEj0Ec8eIUkQ+RVsZO+GxKWUcZ
         9AaIvOLuNCr3ypaD4LaijVstVc9Ffzz49fjfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707416073; x=1708020873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XP2DrPejZ4y9GWeuess5B/7wBkV0f7f91rTBUzRBkq8=;
        b=WsnN/VFI0vFcIfBylDP17+pAQo5A+lo5DRuGOQq+YwiY/LGvB8mUunHutvIQUUAn5l
         CjEukF73sLCU3xeeHg5BL3JHU2rI/twcZGrL52Cz5Q7qoSJBrZ66nYYTXpb8ZrSsCagn
         saUFczFKnZoNuGGzqjzPP3ONuhaYRj6TfMl6HBzHB3m/ht81Echskqhg0BklGtUgCrBM
         CcZZI7npXzmbPUSNQX2m/b8Ls6BU2XuSVppD/CIfvB9d7S/IwUupCQsxt/3P3bXQ9EsM
         qN/QxA+swk3DqyWljc8sA/5ryAf4SSrrlWwtQ5Qj06QtNX0gnef8jdjPNDOVsILYnwJg
         UBqQ==
X-Gm-Message-State: AOJu0YxNm772psWZmeVXhtQ7N9D1JFHyAw4DV2jvGQ8sVm4SCjUtqe0a
	0kq7Du7n8YGUWrt02LjKz9rbUS76vjOiUYGKLwyrLN2YkTo33e6UaR70HiU583Na61sMS7H7VG+
	W2M+1IcUigoayLQauAVJ39FraeTD9lefCsXNU
X-Google-Smtp-Source: AGHT+IH+qDHRnUdLJutzlN4b7pMy+thkGoe7hkl8pgXZ0zfa7tKazwCMgVBQmcEjJITTaGbfbAm+SCOgcOTd2UDmzy0=
X-Received: by 2002:a05:6830:1248:b0:6e1:d90:c429 with SMTP id
 s8-20020a056830124800b006e10d90c429mr323749otp.7.1707416072966; Thu, 08 Feb
 2024 10:14:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240207145851.1603237-1-heikki.krogerus@linux.intel.com> <20240207145851.1603237-3-heikki.krogerus@linux.intel.com>
In-Reply-To: <20240207145851.1603237-3-heikki.krogerus@linux.intel.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 8 Feb 2024 10:14:21 -0800
Message-ID: <CACeCKaffZBPA0Q_Bqs1hjKJB4HCj=VKrqO21dXj4AF5C5VwtVQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/chrome: cros_ec_typec: Make sure the USB
 role switch has PLD
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	Emilie Roberts <hadrosaur@google.com>, "Nyman, Mathias" <mathias.nyman@intel.com>, 
	"Regupathy, Rajaram" <rajaram.regupathy@intel.com>, 
	"Radjacoumar, Shyam Sundar" <ssradjacoumar@google.com>, Samuel Jacob <samjaco@google.com>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Uday Bhat <uday.m.bhat@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heikki,

On Wed, Feb 7, 2024 at 6:59=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> The USB role switch does not always have the _PLD (Physical
> Location of Device) in ACPI tables. If it's missing,
> assigning the PLD hash of the port to the switch. That
> should guarantee that the USB Type-C port mapping code is
> always able to find the connection between the two (the port
> and the switch).
>
> Tested-by: Uday Bhat <uday.m.bhat@intel.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/platform/chrome/cros_ec_typec.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index 2b2f14a1b711..5c14e8db08b5 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -28,6 +28,7 @@ static int cros_typec_parse_port_props(struct typec_cap=
ability *cap,
>                                        struct fwnode_handle *fwnode,
>                                        struct device *dev)
>  {
> +       struct fwnode_handle *sw_fwnode;
>         const char *buf;
>         int ret;
>
> @@ -66,6 +67,16 @@ static int cros_typec_parse_port_props(struct typec_ca=
pability *cap,
>                 cap->prefer_role =3D ret;
>         }
>
> +       /* Assing the USB role switch the correct pld_crc if it's missing=
. */
> +       sw_fwnode =3D fwnode_find_reference(fwnode, "usb-role-switch", 0)=
;
> +       if (!IS_ERR_OR_NULL(sw_fwnode)) {
> +               struct acpi_device *adev =3D to_acpi_device_node(sw_fwnod=
e);
> +
> +               if (adev && !adev->pld_crc)
> +                       adev->pld_crc =3D to_acpi_device_node(fwnode)->pl=
d_crc;
> +               fwnode_handle_put(sw_fwnode);
Can this be in common Type-C code (maybe typec_register_port())?
It doesn't strike me as ChromeOS specific, but perhaps I am missing somethi=
ng.

Thanks,
