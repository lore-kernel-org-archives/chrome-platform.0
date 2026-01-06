Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1367F36C0D0
	for <chrome-platform@lists.linux.dev>; Tue,  6 Jan 2026 17:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767722289; cv=none; b=Z9w8Nv8ubGoWuZkF90RDZhWMRFp0ORRsxkuC4h6JBuM5HkLUFvBTWXojb5RiO84ovUfQYLrTPHMWV477bOf78uwnvg7dDPUy4rVVo+CUUN7oXCh9sGZuz8Yxq4lFSH9K287Osi/Ad9bsuBQ/iA88CKSFyqVIJJpSA1bCtLDpSFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767722289; c=relaxed/simple;
	bh=sYjSxYCu/aeFF2uzL2zupbJaVXhaE7oFYU0EcRvUgUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sBrTG1ypTPMjcFtnF/gbX+3bZy6WcpIJULRD4U2zVOKiTpilg2HRdd2zY55MZUN9coY74kGwnuDxqU8ZZgMzgHplqYg2NM31TgHFBQ7aPAkw/Qb/4rlOIKr3+wwPwQCVDaJiFS4HC4U2iBLbg2AW7SOc8tkX6pMzFneOx8aLtA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RSyOF/C7; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RSyOF/C7"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-34c24f4dfb7so912601a91.0
        for <chrome-platform@lists.linux.dev>; Tue, 06 Jan 2026 09:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767722287; x=1768327087; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjJbFOSftvMLvvpKm9dE/503wIskizyk1YJT+an01s0=;
        b=RSyOF/C7KHAQ3Y1oyqslKo0tudCKvgCrwHt5OUOjnsNHmFTudJrT+UsNY2Y5FLy6OB
         qVyH2CNUqzMJwGlfNg6UpokgOMwDtZ5CEF29JboHaoe+8XtHVMaU3kiVpD8xgGz/MXsp
         G+nBy1tSvReH3bSIKfUG/XP+kruGAr+tPpj/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767722287; x=1768327087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OjJbFOSftvMLvvpKm9dE/503wIskizyk1YJT+an01s0=;
        b=qT+e9SnSJJRGRLgxkgZ+YvvbFCJ960vSWXDK19bYJ4WEVrqpkeYDsAUJvFrTy8mOx+
         81P9Mabgra4Yaufl8qp1Y8osBIdINzdQDOi+ubaGAa/FSu5LZdXiwZTlTfa6h4Z/Fnv6
         0/ST0edbAgFQTWmQRocRnKpPwV87o/DQnv0Fsh2byqHHSnfmk/rw3ibzROGhVGUyimRy
         A/o96rP3F4E5PkKrUr9gIFa4AxJemK7EYStitaeequBuEh2yxRkxg+13iJzkN3+sbe7x
         PguhjS1WCtUie9JdFxNXd9SmX1C3jGV7wLOdLA8fzm45j/6tm+QXuRtcjUcA7l2UoVmX
         z+pA==
X-Forwarded-Encrypted: i=1; AJvYcCU2HEdmEXStlGnpuQ2i41rLK+5w1DS7x482N3f1P72AV8fQ90h7Xm0L5oao/CJuSgUz+0RGqZ0TGBc4UwUmVIU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwsK0gmOHspzqHXCJuidyQE7jmQ7xR2NTUzcFYuL3u/5tIH4Sjj
	Id3RAtMjX88PY1sCKPuljSQtMlz+n2Ysf729N6sLEdmHlLebJaMTq/T+P5FCrJBOgzEn13UimeO
	j23UeglyWefcTsKdGhVK1Y1Ns3SwQFeYXP2UHPtC0
X-Gm-Gg: AY/fxX46PIp2fLMxTHVtxC5B2pGBGzljDnu92HpRxHicW73NZh+APGbbQdksqe3Rf12
	A7WBRcnrc6CNox6VGsHYV2I7mQganEbTBYwLvnHiXJhcnffrF1AHmPhbkEj0SLZLL/LuuNDdbOo
	Oy74fODI0WdcDreQBHVVsLCjnBGH8CtGiTkvgimtzhRPfHRkbCZYG9TOGWrGqhwIkNiMheItxFJ
	Z3PDnKz+AavvrITFw+4420tC4yTnpLPaFW9r7L6ex0xjHC2j6gy7kfJnXRRKQsFGqjy
X-Google-Smtp-Source: AGHT+IFIRJEgsmx5/rj5msO3wTpsUJJNojrdfIWUaCiIVAUq5JqhBwR7TOyl0agmyCarDW4gDk6TOTeJbwUjnfRJVSc=
X-Received: by 2002:a17:90b:58e7:b0:33f:ebc2:643 with SMTP id
 98e67ed59e1d1-34f5f2fb22dmr2880609a91.23.1767722287398; Tue, 06 Jan 2026
 09:58:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251228190604.2484082-1-rdunlap@infradead.org>
In-Reply-To: <20251228190604.2484082-1-rdunlap@infradead.org>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Tue, 6 Jan 2026 09:57:54 -0800
X-Gm-Features: AQt7F2rM3emWWcI2zAAG5vVznCBFxFT_-35xECx7gmaseEheD-WAj_O_CriXAJM
Message-ID: <CANFp7mUKoyhL1Qv6tSucsmy_sd90BXC6QeLDmjdpAnYSZ1nfHA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: ucsi: drop an unused Kconfig symbol
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Pavan Holla <pholla@chromium.org>, 
	=?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jameson Thies <jthies@google.com>, 
	Andrei Kuchynski <akuchynski@chromium.org>, chrome-platform@lists.linux.dev, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 28, 2025 at 11:06=E2=80=AFAM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
> EXTCON_TCSS_CROS_EC isn't used anywhere else in the kernel tree,
> so drop it from this Kconfig file.
>
> (unless it should be EXTCON_USBC_CROS_EC ?)

Yes, it should have been EXTCON_USBC_CROS_EC. This was eventually
deprecated in favor of using the Type-C connector class and the power
supply class.

Devices that support UCSI will not support the extcon driver (i.e. in
firmware) so removing this entirely for this driver is likely a safe
change.

>
> Fixes: f1a2241778d9 ("usb: typec: ucsi: Implement ChromeOS UCSI driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Pavan Holla <pholla@chromium.org>
> Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Cc: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jameson Thies <jthies@google.com>
> Cc: Andrei Kuchynski <akuchynski@chromium.org>
> Cc: chrome-platform@lists.linux.dev
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: linux-usb@vger.kernel.org
>
>  drivers/usb/typec/ucsi/Kconfig |    1 -
>  1 file changed, 1 deletion(-)
>
> --- linux-next-20251219.orig/drivers/usb/typec/ucsi/Kconfig
> +++ linux-next-20251219/drivers/usb/typec/ucsi/Kconfig
> @@ -73,7 +73,6 @@ config CROS_EC_UCSI
>         tristate "UCSI Driver for ChromeOS EC"
>         depends on MFD_CROS_EC_DEV
>         depends on CROS_USBPD_NOTIFY
> -       depends on !EXTCON_TCSS_CROS_EC
>         default MFD_CROS_EC_DEV
>         help
>           This driver enables UCSI support for a ChromeOS EC. The EC is

Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
