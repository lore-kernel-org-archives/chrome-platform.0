Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55873F9FB
	for <chrome-platform@lists.linux.dev>; Tue, 11 Jun 2024 16:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718123990; cv=none; b=dqE9m8UoJ4+0olU07Fqot27CduxPThlSE9CIjrZIcN0lapiY/LAVEhmzNMBPgb7n0G8QywNnw5KY35HLMuB/IJppvzJcxGUO6wygdco9xiHqii+pF/i9qfHcycDFEduy4rVcSN3BULjMiecD0hiGvHyOedLdimW6cjtiVqG/MbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718123990; c=relaxed/simple;
	bh=UL9rseWM/2wJ1y912HLiN+L0RKo5rN7xbWCfczHuj8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QvchLGk+LvGKtzqilS/IsgYk50u7w6s0BY9tcgeY0J8GZZ/A3D0MpYy9qIOmqf4ibsrKaCamVXsE1psJ8MT+Fidlpi8DMjka4TAyI921M+W0SXIsWky75+ekHTH/PqxL4FTjQ6J1FoVgMvQuoAtGZie+/3E9GlyCPxKC2LlWGIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=feqIu4pb; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="feqIu4pb"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57a16f4b8bfso20247a12.0
        for <chrome-platform@lists.linux.dev>; Tue, 11 Jun 2024 09:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718123987; x=1718728787; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YprsCB72ySzMMOmcPzLQUUH2eaBt5uWtuMcbSZ2gItE=;
        b=feqIu4pbsU+YqZWA+o5tVWC+LcpB/n87vbCc3NaKcaUbIvZhGwwQ1j3IUDr+4dqD4S
         +gGSd0w/kWIoIMC3JXPp6nQONa6fT+nvJWnY5JqDCjqVstHclN7e3v33B6l7gsViHd04
         KiVj4qsOCVm0IIJsfzjXArkZVb+BNHLrRcSlTL8SBUJKM9+Yx5w20XZS5aRd31bB8RNo
         +NxNxNUg3Nz876xA7m8LAKoDPB+JUYrY19f/ZB+r9J9LTIUENTGLd08nnPkC7hdai52j
         3naJRas/Lgnp0eqOV2A6PTLfBxkJWJlYc5tm1AfEkc8qGvEnpwui50m4Z9EDrjt4y62X
         3nzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718123987; x=1718728787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YprsCB72ySzMMOmcPzLQUUH2eaBt5uWtuMcbSZ2gItE=;
        b=ndUVKbis3C3TfWj/xu9zHlAmqiKiLwnHWarbW5QhaEez8+tgml8Rwg0rfvPHQz7IX7
         gIWeojL0zwBL6N1J5BtRoqFQAedhM7WNVMso/5IaWE/dw4Iq4qambNorqhZVH4+XKaCu
         F50CiiKxPzp6rSPjyuNLeLyOLHYskj168dBwpzp+bTRFAJjm261V+gXwJh3bgJHK2bWg
         kKWEEojVYWpQdJVdkrFyBQL18cgbDL2/MT+bWFrPhPsJquyozEKBrs6IEfz1iKjo9mPQ
         ZAW5hlRyKxMCQYeuemTlgdwgx9csqW5d+T5BtKhglPkmixJTgprBny5miwDfyLptDkcO
         OYcg==
X-Forwarded-Encrypted: i=1; AJvYcCWmLPYxYzMq1WVA1rVFzvRIWaHNyrbe1yuXk78LPxF0/XjJrmsBQ3DgOjMOqAbChhQzNSePkQzlaD2t3UQTONbSRqIHHRtz/RgPOYoSCS4R
X-Gm-Message-State: AOJu0YyOzehnogAdXOg8uXVvhn3/w8fYVWeu1aGqIwWF7RT2aC0xOxSN
	0doaySBDxwtkgCt49kTwWgP/nMPlLhl24uRxeooAttsVQK7rfQi1HV3v4xCBx+qbpP57JeTUDBr
	beSfCtRMmn5YsT2ePkMMzsHsl6G11nbr8vNJy
X-Google-Smtp-Source: AGHT+IFnBSGNnaQYoj6jn6nRCMH5+zTSep4PVKxAM3wCnEoEeg+qdUMP5pmwCB1I60hSVoR7wwOZT85dZ61PPKla+NA=
X-Received: by 2002:a05:6402:40c1:b0:57c:6727:4f8c with SMTP id
 4fb4d7f45d1cf-57c935d8a0emr231767a12.1.1718123986689; Tue, 11 Jun 2024
 09:39:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240611033113.4154548-1-tzungbi@kernel.org>
In-Reply-To: <20240611033113.4154548-1-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 11 Jun 2024 09:39:12 -0700
Message-ID: <CABXOdTefFMW2bmpybi7u_BaTKdcqyFgXfM3aayueUiaDK7QyBQ@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_proto: update Kunit test for get_next_data_v3
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 8:31=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> Since commit 106d67398233 ("platform/chrome: cros_ec_proto: Upgrade
> get_next_event to v3"), (struct cros_ec_device *)->event_data becomes
> struct ec_response_get_next_event_v3.
>
> Update the Kunit test for fixing the following error:
> > Expected mock->msg.insize =3D=3D sizeof(union ec_response_get_next_data=
_v1), but
> >     mock->msg.insize =3D=3D 18 (0x12)
> >     sizeof(union ec_response_get_next_data_v1) =3D=3D 16 (0x10)
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_proto_test.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platf=
orm/chrome/cros_ec_proto_test.c
> index 3960f7c16eb0..7ca9895a0065 100644
> --- a/drivers/platform/chrome/cros_ec_proto_test.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -2060,17 +2060,17 @@ static void cros_ec_proto_test_get_next_event_no_=
mkbp_event(struct kunit *test)
>
>         /* For get_keyboard_state_event(). */
>         {
> -               union ec_response_get_next_data_v1 *data;
> +               union ec_response_get_next_data_v3 *data;
>
>                 mock =3D cros_kunit_ec_xfer_mock_add(test, sizeof(*data))=
;
>                 KUNIT_ASSERT_PTR_NE(test, mock, NULL);
>
> -               data =3D (union ec_response_get_next_data_v1 *)mock->o_da=
ta;
> +               data =3D (union ec_response_get_next_data_v3 *)mock->o_da=
ta;
>                 data->host_event =3D 0xbeef;
>         }
>
>         ret =3D cros_ec_get_next_event(ec_dev, &wake_event, &more_events)=
;
> -       KUNIT_EXPECT_EQ(test, ret, sizeof(union ec_response_get_next_data=
_v1));
> +       KUNIT_EXPECT_EQ(test, ret, sizeof(union ec_response_get_next_data=
_v3));
>
>         KUNIT_EXPECT_EQ(test, ec_dev->event_data.event_type, EC_MKBP_EVEN=
T_KEY_MATRIX);
>         KUNIT_EXPECT_EQ(test, ec_dev->event_data.data.host_event, 0xbeef)=
;
> @@ -2085,7 +2085,7 @@ static void cros_ec_proto_test_get_next_event_no_mk=
bp_event(struct kunit *test)
>
>                 KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
>                 KUNIT_EXPECT_EQ(test, mock->msg.command, EC_CMD_MKBP_STAT=
E);
> -               KUNIT_EXPECT_EQ(test, mock->msg.insize, sizeof(union ec_r=
esponse_get_next_data_v1));
> +               KUNIT_EXPECT_EQ(test, mock->msg.insize, sizeof(union ec_r=
esponse_get_next_data_v3));
>                 KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
>         }
>  }
> --
> 2.45.2.505.gda0bf45e8d-goog
>
