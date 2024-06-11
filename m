Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BCE2C694
	for <chrome-platform@lists.linux.dev>; Tue, 11 Jun 2024 16:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718122040; cv=none; b=fQdpAwOJeqyX3/d7ocnFsjcFXdnVYVpYu2gjQ9LPjBfZ7XAgxmhWrYhChlucgcqnxKDJ9PxCqcAW9e1LpuQwIBe4igufsY0H3bN16bZUDXGJNhIv6jZcOc4OuCgHpoGRDAVqUOV5cNpt7BrIKjQkzdeJXD+IUlgnFFaKMhHCeqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718122040; c=relaxed/simple;
	bh=w9TLbRGOTLDPs1VRYx423MA09ZxUMd83hTQNdTrenJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C9AqvkfDofONrS2pSCD31Lmgaa5lcnaZPem8JtVq+jKXmlUSs2v+d9Qdb2PDcyJCQqxjEn6LfT1tECf/cQgC9O4EAQj6sCFU9VPkLpHhdz3KX5M3rQb0qE+OaF9hgimxieuA6cJgrxMQyhnrlTnH/ZNbMSAP0/yC5HRW+94tW7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N0Rxvh/R; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N0Rxvh/R"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-57c8bd6b655so19559a12.0
        for <chrome-platform@lists.linux.dev>; Tue, 11 Jun 2024 09:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718122037; x=1718726837; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0dGijFgD5mEIYGYCFChBjRGXYAEUX/53ap4AChkBkQ=;
        b=N0Rxvh/RhhWVmG7dsRIQtss6PqoyhWIrYp94QW8ITKwS/0DCtzB/67TKUTsaLaQn3b
         L8cyGMK0BY2MxyRQu65PcfC0G7KNDRBrBuQ+Rn8ZvjHd1Aq4cRqGYlww1lI1yi73cIzP
         GirLf6nSG0H9Cm8b3Aa2d+SX8ROScijIXTFI7cznHmWM1y69jgScYXe/IioQQz1w0Mqm
         Pwd55MVSqwZz/GQHJ9YCKTS1GWmIlXKT5izHJyK3XPatdFy2yQW4GVQIYjGrD6mG0aUZ
         lDJ/K0npR6DRxObyVdloLvInvOTvOQ8VgeqsMDbvPhTNAU0cWC+brs7fYokxaXGNbCV7
         pDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718122037; x=1718726837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0dGijFgD5mEIYGYCFChBjRGXYAEUX/53ap4AChkBkQ=;
        b=i5sHv3C50x2HbTubNKpRh76J4gWPf9uGsCC2UYMGtEjIy4Rsj4bJci7/P8CbqyXDOF
         XdOXnYm05rMAJI7ZL68tSabV/cWK5gDxXnb5UlJge+Hemc/T+gJYb9DLAnVTNHqqV/hM
         Y4kk8XsJhpfgRRRpm9rjgCWL6txnXCy3YiB6T2IodQt5PPIc0/mq0rZZjAxJNJw3CuGh
         7xhlmyUTUz7oyGK6ZmrHiqwB+SbXYJWR5MqWjj4elLng/o1YM88gwKHtyMA3vIjkQRSD
         TyxCU7vwc4uDKz1e80TVqXpWsiC15hJmgAO47e/Cr6HGZdlXOEV+Nxn+RMsr9YOE5YLl
         5MFw==
X-Forwarded-Encrypted: i=1; AJvYcCVQmQ/mvcrzrUe7f5Vx/FEW4qCTbWU03DlBigk8pZcy95+wNtrXx5f/+z0+iNL/+dJbVnI4zndGjGbMliEwn0dQz4LStdJGcYqsyT5YdySN
X-Gm-Message-State: AOJu0Yy1gUN2ZnpXknDSeem3Jy+h/HHmWXGa0KGRDesmnCVbpr/zJcba
	g7u/SUdFZ3WJvWHjoiO+nl7J96BjF6kF7bDCejat3tlegwGAxVA1ZtGjQZ9I5VFOXY33JqVsVp2
	tb3DEIVi/nzrDhnq5L8e0f3lzBzwmBj17OyDg
X-Google-Smtp-Source: AGHT+IG3MAiUUhBwVpcVc7zUt2PS8V5nnFBSHN4RuoJojBlKM8EOy+t6gmsIVZdy6htQa4T/BfefPolvHXhQVImxbIg=
X-Received: by 2002:a05:6402:17d0:b0:57c:a4cb:1c5 with SMTP id
 4fb4d7f45d1cf-57ca4cb02c5mr27614a12.7.1718122036516; Tue, 11 Jun 2024
 09:07:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240611113110.16955-1-tzungbi@kernel.org>
In-Reply-To: <20240611113110.16955-1-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 11 Jun 2024 09:07:02 -0700
Message-ID: <CABXOdTdVh4eyEfq+5bfUs45_0Y=ZbVrrnw1i0pbcn2bJ0uazPw@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_debugfs: fix wrong EC message version
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 4:31=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> ec_read_version_supported() uses ec_params_get_cmd_versions_v1 but it
> wrongly uses message version 0.
>
> Fix it.
>
> Cc: stable@vger.kernel.org
> Fixes: e86264595225 ("mfd: cros_ec: add debugfs, console log file")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_debugfs.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform=
/chrome/cros_ec_debugfs.c
> index f0e9efb543df..4525ad1b59f4 100644
> --- a/drivers/platform/chrome/cros_ec_debugfs.c
> +++ b/drivers/platform/chrome/cros_ec_debugfs.c
> @@ -334,6 +334,7 @@ static int ec_read_version_supported(struct cros_ec_d=
ev *ec)
>         if (!msg)
>                 return 0;
>
> +       msg->version =3D 1;
>         msg->command =3D EC_CMD_GET_CMD_VERSIONS + ec->cmd_offset;
>         msg->outsize =3D sizeof(*params);
>         msg->insize =3D sizeof(*response);
> --
> 2.45.2.505.gda0bf45e8d-goog
>
