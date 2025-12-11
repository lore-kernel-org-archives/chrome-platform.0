Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F9A26A1AF
	for <chrome-platform@lists.linux.dev>; Thu, 11 Dec 2025 13:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765459761; cv=none; b=WWIGsRq9HYhmbk1fuPK0pgbClcT9Rsc8ECOTGAU+uorFL8miaKOOtUQ38DtDp0nstI/4g9C52FRON2SJdW1ibcPjr/W0PKvvF/xpK2UQcYjB+dwuPA/nKJwEGCWdEd4ybrxq/XNA9SalrbMtsKD24wX3g3/Mk9Xq0cczTft0IE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765459761; c=relaxed/simple;
	bh=ojJInOep1VLoL9h+fD5rBM8sQU+rlkYFjbP0Rr11rb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GG/QHihrY3kZonHCURmyPRiwuzHWdBUze2+Up4eNWf/TV+T5mLCesy7x/v6v0E6kpzxsg2lu4ghzuMVZRqV4PyCjJVZ9fIsQvN8XrbsdulL0NFa7KIuDYaDxr1PBqlFX9G1kt8Qi+Zxcq/NJ+Xu+a9Tdr0S4JzCRcA4/bdMjBhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Wdj6Ur8d; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Wdj6Ur8d"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-640c1fda178so189600a12.1
        for <chrome-platform@lists.linux.dev>; Thu, 11 Dec 2025 05:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765459758; x=1766064558; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=40J2ufHoRtplJjSJlhlkCbvquopI47IOlsToESLd6RQ=;
        b=Wdj6Ur8dDv/Zl/hTHWOwBddmrI8diRNJDjHaw5l0hf9od+awayUcyu7fDsJSq6TsxN
         1DaNPaV+bLkpi2EQh2HeuAbCny0w/uzm8ZpTNoN+gOd/7yJQJI699K5W8M5RPaIKE+Mv
         tXcHk2gqEOc/qQZEM2lp7i85w8o06VphIRCN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765459758; x=1766064558;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40J2ufHoRtplJjSJlhlkCbvquopI47IOlsToESLd6RQ=;
        b=wOBXC8WHBTkehEmnspccCZDoMD2csZclsYXm1Vm4z/tRlHA8KfeJktKlweTEc1/svr
         j7e/mAAmqNjbahfvkm9CKLk/MeX16BRbOyryapng18zW6N3NxFfMKL9uBBo2ocwtiijj
         Q/TQcmqQIDajPANyg3QF5n2UuVvp5yXJeGFDNkwRHwjgOGKvpzpOPsAlRFym3fBOByjm
         4xc/heEr/pXKBr6lPtizj6++2UfXyURA9layiBCiJwlHjWgBO0FVE+wKj6apqp3ua1Ac
         DB4who81wv/xjAaXhzonmk0hCnriG5nYya2FHbMimBh6O8UbIyDPfRlPtiSeQSm80HSY
         y1Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUS0wbxMeTHYLUC1kRyeuauo+hBDAX4dA3fNhLNmzcEuhBEkEUyplsgNBRhe+L8gRmeWxuyiVr0uooMRpdZ0kw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyzPsK8FwBxFL50x//0pQK1RVYbQH4DcLXf8jpzG5k6jmKuIKHT
	hfmd5tPMI0PQw/ulK/cuKK+bRWz5lAcJQCZbfGkaUvOCY/5wqzfzRub+GRE0E/Lg5phMygEGXVh
	8+G8osuwIhZFFqznaLg74H4SLoY3FXr7dGPet5LpT
X-Gm-Gg: AY/fxX4VBkRn1K1gqxkHzi6ATeXx/8aBj4oCayRBLfp43NrDhSpF9UVdEb/ONEqnqDF
	GR07MoXetPXxtY3Vdcj+MaMlu+DYh9kZ43Z8D9YZ77T6P/mTOMnlsMaLhVt5rWzU7g3Ln2mXm4s
	yPZZwvQtPchgRMvvGoLvQEvgeyoy3QZwIxlvUbCX361iaSYqZRGctXR6lx6BrS3vmVLd/ayb5Yu
	si5gCl7EwXfwXf4rPzhBR+1/7byb1FPSwrn2w/A7mz09THHqlJ6Xpb3U/6HdSYJgIVnvA==
X-Google-Smtp-Source: AGHT+IFOJf7KsX1gencvXlznomNuZ47WJRKUVY0snnRl9GGqsPTHs1K0HSR+8cnk6z5dt0Wl//1dZqiYxyZLB7dcvGM=
X-Received: by 2002:a05:6402:50cb:b0:641:1cd6:fee9 with SMTP id
 4fb4d7f45d1cf-6496cb6b810mr5048329a12.1.1765459758184; Thu, 11 Dec 2025
 05:29:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251209154706.529784-1-fabiobaltieri@chromium.org> <20251209154706.529784-2-fabiobaltieri@chromium.org>
In-Reply-To: <20251209154706.529784-2-fabiobaltieri@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 11 Dec 2025 06:29:04 -0700
X-Gm-Features: AQt7F2q39jfzfQcSjoh2PhZIB0p10Hq4RkLwBSMZXGJoO0Utb3wqUiNtN-ClMDg
Message-ID: <CAFLszThG_iHbm3A=X585_SVpLgWVqoAC9j_qJAG4yrJxfkG5Cg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] Input: cros_ec_keyb: clarify key event error message
To: Fabio Baltieri <fabiobaltieri@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.orga
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Dec 2025 at 08:47, Fabio Baltieri <fabiobaltieri@chromium.org> wrote:
>
> Reword one of the key event error messages to clarify its meaning: it's
> not necessarily an incomplete message, more of a mismatch length.
> Clarify that and log the expected and received length too.
>
> Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> ---
>  drivers/input/keyboard/cros_ec_keyb.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Simon Glass <simon.glass@canonical.com>


>
> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> index 1c6b0461dc35..2822c592880b 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -269,7 +269,8 @@ static int cros_ec_keyb_work(struct notifier_block *nb,
>
>                 if (ckdev->ec->event_size != ckdev->cols) {
>                         dev_err(ckdev->dev,
> -                               "Discarded incomplete key matrix event.\n");
> +                               "Discarded key matrix event, unexpected length: %d != %d\n",
> +                               ckdev->ec->event_size, ckdev->cols);
>                         return NOTIFY_OK;
>                 }
>
> --
> 2.52.0.223.gf5cc29aaa4-goog
>
