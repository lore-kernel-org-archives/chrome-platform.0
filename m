Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352981459F8
	for <chrome-platform@lists.linux.dev>; Thu, 13 Jun 2024 14:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718287384; cv=none; b=o07Mn2zwtWZF31MNPHimwn6G7BOY8JhEbxIpRUxM/Urf+J0G75FMLqLF8AbPik7ZMDxmRWEZCN2uljq/PTp63GqHTW/vJ807/no73p6NGY1iX1BsKCxZLtTvwaPkow62dpQZaAAWVztEzv/DQLIQYSD1xF3xk+Ois7H9M4mYLCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718287384; c=relaxed/simple;
	bh=1wx770iYfJxVeyB/o0cEcpJdRc6wURsrq5BJtNrgFUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eTlX94AGHEPdrM09QVZPVCzj1SjMV/yWBuUgyi7ksujcenbrmKgGxHSwjoCARV20YVNB5LMfPGPI4ijySHG9fgz9HHQrWzF9zFwfdoMyaQ5gPR5qWne2DFW+Og7vQjSRkRTA7PwFJrJ7KiQYMd2+rRTW8R37KVkqIqKKMWDreWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uyJ10Svd; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uyJ10Svd"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57c5ec83886so13118a12.1
        for <chrome-platform@lists.linux.dev>; Thu, 13 Jun 2024 07:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718287381; x=1718892181; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAfB75h0kuFNnnSc8B1rhVQt/y/45xq3MCcns9r1vWo=;
        b=uyJ10SvdG4OVonbqzlSUa0tVULiggHcOYQ+dqIYL9g4ZuLeLNR3sF8pb2OabQ6+uEt
         RwJK1tQ4ExqLKq59hwvW0H3qBz5jRPRWcGnUVBk0TM/acRR3MGDSidji0uSTzm8h6/lp
         NVWxgDfWqUD5/BEczIwjLbhlrAu2qm8ASVuY1eC6e/b2vfN6jM6oX86LeZnliVibwQyV
         Bq7HM/iu99ntMm5Lolbp41X0A4x+sDxzXKl7GzwKe1jeu4jzB15oI56Y1BmvIbnUtTU6
         s6V2rtl9A9ifoRLoKV3de5uOwm3f1t8wBmGB9//9dwDC+YPXp0QlGFaxvfMscBMjDBkj
         M0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718287381; x=1718892181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAfB75h0kuFNnnSc8B1rhVQt/y/45xq3MCcns9r1vWo=;
        b=b8B+0ElQj5dYKhWO8CFPoigjcDGW3YcDE6aSbcEQ4Lz9bI0gvaf0ytSXb5w5BhV6Zz
         vBzB9O6qQdbLOAOhFR/fGgQkHCtTkDbLeCgEVd1tEvgf945SINMh9shvnUKQXFAjTT4c
         s/zQm19LVuyruO6ChVk0sv6PjZTiQ611EYbuhbYjqEWGR+YD1qsHVOnGykPMdcoWBDjw
         qqdIzvsMqAlMwq+21bJh+qI1hJMqKL+TAatKca5iyzY9Db6q9C9phLgbnqg5wR036HMN
         RqTpTebdufBHmdfnN25/72J/TtXOdedKXOP+VFVWdkNAOkEwMDzMXw/GJqbjSg7MJURz
         GGXg==
X-Forwarded-Encrypted: i=1; AJvYcCWIM42gsLuSQUzFFk/a8c/UDB7FKhsQo0vQagMLryNe5ERQZj2LOjee4HAi3PJWd5Gtfzyas8i7kPsSkQhp62HC4xP0dz5etqxRM2Zwy3Z1
X-Gm-Message-State: AOJu0Yxf4tlikqt1vlYp+r3us+W7REqGxIXK+cff61T9Tc2Jk537qNjq
	JQYUOxq3ZrhXeOapfsc0jEbep3NJTAcYu/qlOgdSaOa+QKYblfwcYuzrWYX8oIyIkvf/De4wHaK
	VLie0JvNgwbB4AL+qyJhXWlUWrSKAsiLZXp15
X-Google-Smtp-Source: AGHT+IH0NnlPmn5HlqCKL6WJ0KQphhB9Nf2R+bPra/NjP86oZDQMsRCEH2X8d9emIYgu9fIz8hVm2OJD4zGwQrasNjU=
X-Received: by 2002:a05:6402:51ce:b0:57c:b799:2537 with SMTP id
 4fb4d7f45d1cf-57cb79928eemr148226a12.3.1718287380997; Thu, 13 Jun 2024
 07:03:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <e0b43fb5-ecc8-4fb4-9b76-c06dea8cc4c4@moroto.mountain>
In-Reply-To: <e0b43fb5-ecc8-4fb4-9b76-c06dea8cc4c4@moroto.mountain>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 13 Jun 2024 07:02:46 -0700
Message-ID: <CABXOdTcvie8ZBX8aFLve_7Lbh2SD0XPWxVn0nneOz8LJQEE79Q@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: Fix error code in cros_ec_lpc_mec_read_bytes()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Ben Walsh <ben@jubnut.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 6:55=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> We changed these functions to returning negative error codes, but this
> first error path was accidentally overlooked.  It leads to a Smatch
> warning:
>
>     drivers/platform/chrome/cros_ec_lpc.c:181 ec_response_timed_out()
>     error: uninitialized symbol 'data'.
>
> Fix this by returning the error code instead of success.
>
> Fixes: 68dbac0a58ef ("platform/chrome: cros_ec_lpc: MEC access can return=
 error code")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_lpc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chr=
ome/cros_ec_lpc.c
> index ebe9fb143840..f0470248b109 100644
> --- a/drivers/platform/chrome/cros_ec_lpc.c
> +++ b/drivers/platform/chrome/cros_ec_lpc.c
> @@ -139,7 +139,7 @@ static int cros_ec_lpc_mec_read_bytes(unsigned int of=
fset, unsigned int length,
>         int in_range =3D cros_ec_lpc_mec_in_range(offset, length);
>
>         if (in_range < 0)
> -               return 0;
> +               return in_range;
>
>         return in_range ?
>                 cros_ec_lpc_io_bytes_mec(MEC_IO_READ,
> @@ -158,7 +158,7 @@ static int cros_ec_lpc_mec_write_bytes(unsigned int o=
ffset, unsigned int length,
>         int in_range =3D cros_ec_lpc_mec_in_range(offset, length);
>
>         if (in_range < 0)
> -               return 0;
> +               return in_range;
>
>         return in_range ?
>                 cros_ec_lpc_io_bytes_mec(MEC_IO_WRITE,
> --
> 2.43.0
>
