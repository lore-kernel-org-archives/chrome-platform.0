Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706A420E32A
	for <chrome-platform@lists.linux.dev>; Fri, 10 Jan 2025 13:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736516875; cv=none; b=comk1pIWmutdV91D/X8GF0QSKV/pEAmXRos5ITaLYU8gn9IX1ddsc7XQrTvwcUVlqhBcRX+vO9inj5L0oLT6f1rY48Dww8JBM8aT8eMUYCSe1WAnwJFeDLL/icOFJexHVoTCNAjCNqWhnBVedL7vonBnPtxsqb6jXMJXIT4iL8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736516875; c=relaxed/simple;
	bh=aDTw+7KqPH57qr+Z1WA9s91f21YqkgHFyt/CjUdJlX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iFVlydgH4yPbWUX65VEHZert8hkN6mHMNACdnAWbxdqcs2LreXU37kF7ViJNP/XiQ5VIKDB97Fqkbb56okrAlfMiYww8donRRRM1x39kDqrM2iy9CzOlQR/Hs6R+a1Mt5U2te0U+0XelYKpVWYrl5dNdnrJcSFzpzPvUgjOb7go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DXGkOof3; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DXGkOof3"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-305f529a987so14639641fa.2
        for <chrome-platform@lists.linux.dev>; Fri, 10 Jan 2025 05:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736516871; x=1737121671; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gr2wfavfSfNnPmYAAFKmMn2ii0c2pxJsS7pMf0bJLM4=;
        b=DXGkOof3aOxzd9D7Cdp0fO/FAjv+5hLH5vGWa8Op/CKL0z5koCJ100HJcP5cSt8DCc
         8LFpygDBzcH6nkqpl1uRqIVwfWvRylhK+lvdG6n1Uy3yj440p9gVTrSnug1MSYW6LD47
         AK5SJbOJrhrJ23O6bmAmGPk18fJL3bITcdNWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736516871; x=1737121671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gr2wfavfSfNnPmYAAFKmMn2ii0c2pxJsS7pMf0bJLM4=;
        b=qKIScG/3cquB6uWfTgiBKNvX49I7U6WefVTfyqe3G9indbtqjlracn1uZWjMWxrJTB
         ftzDpvAIqqUXeARfpZ/Zt9qxKOGJHDia/ARvXbHTVaIerbijwgZftEKoeLO5gSmRx5Mx
         /F0P5MoHCOOlqvf3VWrMHklepxfNmaB41yad0+X2TKnPMtIwF4PzezXA+K4XRE54z7Jh
         cH2iGaM5SpxMqg9n6lJ4t/yycOaT2ApxVN/3J0Ka2ZEplc4BL1XU2BDMbV+a/rGc4vkm
         f4nCVJSf0edVR8521OoeJ6S7FPwGp8ZCH35JGoC3Z1TimcGqiy/T/zZF9ebAB0P6B3la
         oWKg==
X-Forwarded-Encrypted: i=1; AJvYcCWuY+BhRxrRwxYNR7oeixNNOHrx6hN6Hk3Bh1B10CXGY5m/s2JontCYne4FrUxAKCgzwkDRUhgV9gEp87rOPhM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwY+xREMQ8T81Erx6z6+tieHjw2uyn5ytdV+zxdH4JF70xi9Jlc
	/vHdbzmGDvbqbDR0G8ulZiyKkJnJQf/ctQ9YhOMlENCeYqT8ediFoFY0PLZLdSqPON/zcussGUK
	R7zch8PuTx4zIkHXwJ/52V/eeFcqS7tim9oU=
X-Gm-Gg: ASbGncv3+GYM629tKe5QKF28Md0beD/Hd8B+oUXU7wkPqEaA/SdO8KgZXnCSGZXRrs2
	J1TBdIEREPtJLdQR/c7mx3Lc2eCigW2wJt5udtTP07F/fvFrsbif629GnWAjcj8AEBw==
X-Google-Smtp-Source: AGHT+IF3H5SI1TKiLAmal+ispYzXyWV8+NPtp22j5q1S/ciVF9AwBNTgh6t4GFtuhi8cw28f+2A0Awxcjjra529Z1e8=
X-Received: by 2002:a2e:a98f:0:b0:304:4cac:d8ef with SMTP id
 38308e7fff4ca-305f455e963mr33126731fa.7.1736516871581; Fri, 10 Jan 2025
 05:47:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250109220655.1677506-1-swboyd@chromium.org> <20250109220655.1677506-3-swboyd@chromium.org>
In-Reply-To: <20250109220655.1677506-3-swboyd@chromium.org>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Fri, 10 Jan 2025 14:47:39 +0100
X-Gm-Features: AbW1kvbx6mEflbFtCpHpxeCzWFCNH6Kt4EYxLetWYdg4-wwJH_evg1qw966XxCg
Message-ID: <CALwA+NYD_0JqAByT73j2_nW3jJfb1RdBdSnQ-xAQV8HYf=LGSg@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: typec: cros-ec-ucsi: Mark cros_ucsi_ops static/const
To: Stephen Boyd <swboyd@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, Benson Leung <bleung@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org, 
	Pavan Holla <pholla@chromium.org>, Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 11:07=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> This structure isn't used outside this file and can be marked const so
> that it gets moved to read-only memory.
>
> Cc: Pavan Holla <pholla@chromium.org>
> Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Cc: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>

> ---
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/uc=
si/cros_ec_ucsi.c
> index 75646a8d55be..c605c8616726 100644
> --- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> @@ -133,7 +133,7 @@ static int cros_ucsi_sync_control(struct ucsi *ucsi, =
u64 cmd)
>         return ret;
>  }
>
> -struct ucsi_operations cros_ucsi_ops =3D {
> +static const struct ucsi_operations cros_ucsi_ops =3D {
>         .read_version =3D cros_ucsi_read_version,
>         .read_cci =3D cros_ucsi_read_cci,
>         .read_message_in =3D cros_ucsi_read_message_in,
> --
> https://chromeos.dev
>
