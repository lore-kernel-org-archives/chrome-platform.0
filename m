Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A9F20E015
	for <chrome-platform@lists.linux.dev>; Fri, 10 Jan 2025 13:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736516330; cv=none; b=DXiURFk93qkZP0ICGFs6g91IST/VEAGDj5dRwdNk2TcTyOmx9UqVwfHrTsJLzXZ6c5xXtifl8s2LpPJqpAxH+651QboGI0uf7UFibpvmrSs//UL1RwdtPkJJ288TDo7dcZGeZ50HK5S0VGsvzOXsCngKcbjd5wQFvZohWKHXcpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736516330; c=relaxed/simple;
	bh=kN+WuQ1KirTcQd2+CHFeW1/BZLYiEtMO99Yf7IHOlOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m+By4q5EadmjsXpDoPlyAcKX2mJ5KDg3HDZEnJSvRXx8M09FtAHRfpLNTxx3+thi/3cD8fSp6gDMiVqQSUCnR2x1RGrhAe3dNUYWyk2Bqg+2pnd5QpuddvPH1OV1C2XEstePmhpg2upomuDAgxinNpjqjLWkACUKK5WQVGQE4oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cXUDpjWp; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cXUDpjWp"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-304d760f12aso15999561fa.2
        for <chrome-platform@lists.linux.dev>; Fri, 10 Jan 2025 05:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736516326; x=1737121126; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5cXYftIzA3LR59j0OW9GtyfPyeBfGN77X8ReQ1YGEo=;
        b=cXUDpjWpFD6Q/XUGaF+ZKt19aazQvXUaEoXtJhIoqZnlFtJrwxxYGnlokuviBu2wtR
         mHaS5+A4fnlLykkunU0aCe9GuhX2vuqIYprnEUNfIpOYwoHB1eRnZWx+iswIrgfotuEp
         WN6xaevLBXs8weqsCjUVtFpIByVshVR1v+Skc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736516326; x=1737121126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S5cXYftIzA3LR59j0OW9GtyfPyeBfGN77X8ReQ1YGEo=;
        b=Xuy2pxXpaXxkBDMrgo66ww2eNABVSvIty2C82zROjpGwtxIOpEEci5MxVIw6YU4Dng
         S1jCzZm7e4MEVybfuZ2YdQXU/bAV93PaDK3xR9RrajQbJDBY5HwM1Mf0NL6zarUx2yHC
         E+jPxtE6Z/PAiDxE+qtBuw66LyU+LNW9lJ+zAx9Z9JyJRrPYw0y5l2rPnW70DREuMdpl
         DsJkxCQnVKOvxspf53kTmRyplk0g7rRhNYp+OZLqme8iOCbUG6ZbNNvwEQmtJVRGTQLM
         vO9LsckHI2Zu4ugI78vHw0HySa8n8TRhBDx/jJmhiEtJEpJnHgCgR+kwxBCOImLGCggp
         B7XA==
X-Forwarded-Encrypted: i=1; AJvYcCX1Uz3L6ULI6hF1+e7WsvKcJ1QKDlKUtIbeNQpm7cOeXdxLV9LYzoRblNo9dBUwQG/kVaHfPrSoDaZZujgDiGE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRZofEgwS0c0YpuM0+FvyNOCUBgdLppNpT7h2BHo35kNKgndj+
	wOweQxprWI9npzwPVjFy2Ub0u3OZYvvgwGYGKdBMxobsk3Gtsd4lV1R97Yp0Lj34+ff4JWP8FHj
	M4dsfqOy3kMSYBG2vZ8gXUUI7IgxqcHVjRMw=
X-Gm-Gg: ASbGnctAH5RQ3VKAw51Wn0Ipd+8I0mgyNcn1MqweDUWE79oOIsH1LoGUgg9Ef6CbtCF
	iEH/lKq5hHnWrUCOKIM4v4zG7cyaBs1HhFleEBr9DEWi0yMvij7fx6JHWmWpz0ZTr2w==
X-Google-Smtp-Source: AGHT+IFF38QmzS4pEVqCimgSIZIkXRq8eu/nT2W6LM2igiQVDj3QPJ5vo24IGYrg5bdav5BTck58zcB/CBoEqnqUAFk=
X-Received: by 2002:a05:651c:4cb:b0:2fb:8c9a:fe3f with SMTP id
 38308e7fff4ca-305f459ab0amr35286421fa.22.1736516326542; Fri, 10 Jan 2025
 05:38:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250109220655.1677506-1-swboyd@chromium.org>
In-Reply-To: <20250109220655.1677506-1-swboyd@chromium.org>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Fri, 10 Jan 2025 14:38:35 +0100
X-Gm-Features: AbW1kvbiLLF3eaxCs4xeh2uP83vaTT3dtcz4ROlR3rUjheFEVYbLypYFKgr5nMk
Message-ID: <CALwA+NbCOEupuhqPqxQRjM7MChyzaDTMUcXSg-xcGiAZbGeecg@mail.gmail.com>
Subject: Re: [PATCH 0/2] usb: typec: cros-ec-ucsi: A couple small cleanups
To: Stephen Boyd <swboyd@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, Benson Leung <bleung@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org, 
	Pavan Holla <pholla@chromium.org>, Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 11:06=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> A couple small cleanups to the cros-ec-ucsi driver that was recently
> introduced. Patches on top of next-20250109.
>
> Stephen Boyd (2):
>   usb: typec: cros-ec-ucsi: Add newlines to printk messages
>   usb: typec: cros-ec-ucsi: Mark cros_ucsi_ops static/const
>
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 30 ++++++++++++---------------
>  1 file changed, 13 insertions(+), 17 deletions(-)
>

Thank you Stephen for the updates.

Regards,
=C5=81ukasz

>
> base-commit: 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
> --
> https://chromeos.dev
>
