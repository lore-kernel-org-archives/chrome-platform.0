Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE84E4A33E2
	for <chrome-platform@lists.linux.dev>; Tue,  5 May 2026 17:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778002784; cv=pass; b=iEajM5nrSfYiJG8LS9ns10Q+lqaO47nuS+Ix06eNFsUdQteM2W92wu/mJ1Ew0mWnS5r0Bm/1NoQTXhV508fyoPV6JF9d6OaOColE36+bWNEH7zDr28Zc/cJePGdZG9QbCbR6mywrAc8Jeb4VZKFTcgz/jhpdSVTUQLnFEVmGPvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778002784; c=relaxed/simple;
	bh=ndjRAJm3WzNlqQxhRRMI7QmuE7dHkDlI2JoUdx6DXIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=izZ4hpJHQtdQNhIs1ieU3QKBNRizA59XesScB+1QS+QEqfvcB2X5EPUl9MK+Dh1yfMtYKUOgZvS1kEKbllp9D8IURjOEQCc4yQ29nuIrzhK0UeNiJQArCldKPa6T/r7t0bI03a4JTrgXt/WIY/ZTu0NqRc0uR3DN+exHpfOQ+TE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Us9bpS5V; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Us9bpS5V"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-364ef7a759bso99209a91.1
        for <chrome-platform@lists.linux.dev>; Tue, 05 May 2026 10:39:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778002782; cv=none;
        d=google.com; s=arc-20240605;
        b=C9N0OCQMmSbPvVz9Irf8slVfN45Ez9Bf/tOM6/OrQqRCPB9VuyCFzx82phmh1sjk3R
         zRWDf+N8ir0OGRWlFm0Ulh0NG7PU98+Fb4N9R1BZvWyI3E7SNIMHd0IVphK8GughJX8U
         Z+lfm0zmhhlPtFfCm2QbmYkJERHLJ+61vibLQb2b0F2LKZSql7X7PXDO6uISM1zNrXB4
         jFQgpyZisNNsU2GDZpQgg+YltjTfChDRtqxU8mRrXXBlVYDtc0O/8cfRksk2jKhPqE7E
         p7NYnpZv/Ng4U9vEDrcQVQS5vwXaO4DCsU8ja87mkORvFrNwPLGrtXWr5m1D43dJnyS9
         lCiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AIMU3lf9kc8EsYHBmuDo0jAnXxQba7uzrH34U2ph1no=;
        fh=pJ3lwpIE0QPqfaap0m1Xyhy0XeNkv4vsYeyXufcMjpw=;
        b=brIAwcfkuXZ629Yx5ZwCdhtUxcQ/D0E/t5//wgXvjuBjjEwftxXinA0ak3FpeyNF9Y
         rTLnE1H5dVRDvY0P/Kkk8Zqk2g968+CXwtlREgilCA1qJ4rePzipPysjDeDafygDab4/
         Fa+KDoVT0UZc+KUOdomjG6xZO7tOR4rEfoB9NLj40aErrOyn2Wgd1zsg368cce0xjcqP
         UgwGxr59UzSKLOXS1QxVp0cZ1XP5/XChgKn/vsEkB4EUh76VkXq3M9mWNmXLfhoh/1hn
         hbDmrWQ+jEw6L+7/y4pcXeqhfBns1UA7H1LlKGHGc/zRICzSg99+Qd9j5+nfUpBZ2YTk
         lOxg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778002782; x=1778607582; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIMU3lf9kc8EsYHBmuDo0jAnXxQba7uzrH34U2ph1no=;
        b=Us9bpS5VVHzTAkmKgNrYaKLaovU0HUHTmskkpD/7ZuOCkQw5GqBFWGXnshXuG1gRg5
         8onlBdfGsVmyjxylqX8hVADiyVl3uSPWCdk4k4p/UJm6qRo9FSkuZQ0/PfKfAXz0Y+wc
         zQj5/ORfJYhD4E9cRo93L6FhIG3lq9r4gI0hE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778002782; x=1778607582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AIMU3lf9kc8EsYHBmuDo0jAnXxQba7uzrH34U2ph1no=;
        b=sZOyWH8VmU5ODiPYd5rOuQMxb5IGzTEViwU5f6f6BfCj6gdsvd2WArWiMAop4Uq4Lv
         lv6a3rek012PIpb2vCfmf677zuWZ05C1EhTesSyDScj+LyqW04whhcZerVqPzC5XhxRg
         0O3XufTmTSBGNSwF12fT0RYDAKmnskvqodzEOsXkeSKg6xUjA2B4lfbEauaCovTpa6R1
         W29Gu5DdWTXjKilX84q2idKl863MWSpNAg5kI7OaCs2wBKN8CsXnMupqgYSoi3efB2XY
         yCB0bhz+zLkUB3G0qSzXtzSv6y3hg/25V80zrPb2ePyBAzrnXQ0CChcyaL/qyOrV8EXF
         tfQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/Pw5Vl+kG3hP5icQV/UCMenxWlxUj1BnKOWJzbCpYTryB37VcjQyFXMuMiuG9d8CdxRJgfixh8GvYg5ZtyeE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxc5Z7UHSOgJ3OCEKzNhZ5WhdKtYX+Sr+C9i1Z+QNamQWrHRVeG
	7IcmzuFcsBLsFxUw7u9a2j27GlTZLs1ECGCW/pKhZQU49jolsQtxLwEZjBdtaxfWp3SRGkhxdAf
	1DP/5moXpwqVVP9Chldbtu7NwxD1oG0Ywbw69Rc0L
X-Gm-Gg: AeBDiesjCIxnF8zPifBfuqa+7rT6mmExY6p6Gvh7QZG8dtSFdiVvvOkmNzx4/+A470k
	PYgH7j9/z+EyfneLnCAy421vW0IQWLm1Nz1N0BOvW+CuyPSa6kHz8TvsTiGyQ3y6n5f9vkneqNl
	Eo/cT8wNboxJWrWOPnumUgfxk8zdDqjge6N6jsOrOrAzDGh09fBBO1eWtAJtBbMaVQduwb6euHg
	Z3SCM56Q/aver8VC7KcD+/CT0kw/NSttlZz0sHlyx7r9IAf12vS+XpnXGJdWjrvHCODQvBUdQIQ
	KPn0OBH6NkPZHVFQMcBtE/AMf2dNQ6BzDfx11m2HmtDtPkMYvD0WAOn5zJE=
X-Received: by 2002:a17:90b:3e89:b0:35a:10b6:1208 with SMTP id
 98e67ed59e1d1-365728811fcmr3768761a91.14.1778002782151; Tue, 05 May 2026
 10:39:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260505053403.3335740-1-tzungbi@kernel.org>
In-Reply-To: <20260505053403.3335740-1-tzungbi@kernel.org>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Tue, 5 May 2026 10:39:30 -0700
X-Gm-Features: AVHnY4L5fAq0tv1FZEX3wyukvmRw8Qh8kutB15RbJtcaQeRmgpHJfLeGTjyl_8A
Message-ID: <CANFp7mX51VHCvcEhKnydWOTpa2havzCwVAvAESo2L2k8EP+7oQ@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Init mutex in Thunderbolt registration
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Jameson Thies <jthies@google.com>, 
	Andrei Kuchynski <akuchynski@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 10:34=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> cros_typec_register_thunderbolt() missed initializing the `adata->lock`
> mutex.  This leads to a NULL dereference when the mutex is later
> acquired (e.g. in cros_typec_altmode_work()).
>
> Initialize the mutex in cros_typec_register_thunderbolt() to fix the
> issue.
>
> Cc: stable@vger.kernel.org
> Fixes: 3b00be26b16a ("platform/chrome: cros_ec_typec: Thunderbolt support=
")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  drivers/platform/chrome/cros_typec_altmode.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platf=
orm/chrome/cros_typec_altmode.c
> index 557340b53af0..66c546bf89b5 100644
> --- a/drivers/platform/chrome/cros_typec_altmode.c
> +++ b/drivers/platform/chrome/cros_typec_altmode.c
> @@ -359,6 +359,7 @@ cros_typec_register_thunderbolt(struct cros_typec_por=
t *port,
>         }
>
>         INIT_WORK(&adata->work, cros_typec_altmode_work);
> +       mutex_init(&adata->lock);
>         adata->alt =3D alt;
>         adata->port =3D port;
>         adata->ap_mode_entry =3D true;
> --
> 2.54.0.545.g6539524ca2-goog
>

Thanks for the fix.

Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
