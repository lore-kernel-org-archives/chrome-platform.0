Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E989F15B3
	for <chrome-platform@lists.linux.dev>; Thu,  5 Oct 2023 02:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MypF1jzw"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-419886c7474so103921cf.1
        for <chrome-platform@lists.linux.dev>; Wed, 04 Oct 2023 19:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696472096; x=1697076896; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfyRN8nZmW2sjAws2eXNW4PftyRX99xAvs+dowXVXT8=;
        b=MypF1jzwkF6EuW9kT58CJE5Lvz+zMcG8b8emXnNAqSrPi4mJGAF8dGiDbBaWvJ23ni
         TfzuqBveVfN/VnUeYvnF7HKM/l44ZdnpVNORQ/AJlbMziYuHM4m8TlQGkzUe1pllF7L5
         BcsFnEmbMIdxkyFKua0SGbTkDSQTeGvrrGmyU11RsyBiXkFdUBy9z2d+kW/FzJzf3SZQ
         IVCId6xuGGVbs3hVI+RTsnX3ISZ30VnxaBSlIPHVgTLUfuSaRarFMTLKDosc09HAeMl+
         sE53mwp9MciVEW5c5Rs8wl5TFhmwst5ncuA57QlDWn/eyPiXY1RXQTDaeYWzseoyN7ZM
         UYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696472096; x=1697076896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BfyRN8nZmW2sjAws2eXNW4PftyRX99xAvs+dowXVXT8=;
        b=SIgufEcWtEeO8t5D49rYrFoMHuUhhkyUCdgbyYV86ph67iX8/kv4bAIR9PhQK0Ne3A
         ubLukLEkSiwL6oJqUurmSOzD6Xndrr/AAgjzUZo4vFVkN/NSkOtF6XK2tEvt1kel3vN6
         cv84e7I1lAPbLmi2FpiC3Paoy67sEgm4aQ7PXK183AXaHDzW4XdQFGZO3RrgH0svIN0P
         m9jc2uVEmMmaHx/IgKC9CdbmQko5b/S3lKBUFhG2gqWcQXeInKdXyai3rwX7Qhq4QTdH
         Js5Xd+1uNcfpNFbWZVA0wZ5cctI+oy0mrlTZhLbxcGqFj0XOpzMwqQb3NZHGWBOaRY11
         BxUg==
X-Gm-Message-State: AOJu0YzZ36ue+BxXbftN+IAMGH+hxZjW0r+G1V0GhcsRMoTWtmupiE6I
	7El3TwgebOP9/rQuHiOhss/kl0oi+xiw17xjiCUyGMPeZHfWUI7UCtA=
X-Google-Smtp-Source: AGHT+IG2vZpqPXZsxn0uxp28c/5ZBYtki7SWmfEmcNLRYyxAqm1O8AtH2No7bQzglr41ekxPM/pnaZNiCE5M5NK1jg4=
X-Received: by 2002:a05:622a:11:b0:403:aa88:cf7e with SMTP id
 x17-20020a05622a001100b00403aa88cf7emr82482qtw.29.1696472095703; Wed, 04 Oct
 2023 19:14:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231003080504.4011337-1-tzungbi@kernel.org>
In-Reply-To: <20231003080504.4011337-1-tzungbi@kernel.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 4 Oct 2023 19:14:44 -0700
Message-ID: <CABXOdTfvbODzLVFHQjGMLeWMG8EKYUmVy-mWm+TAKRZR_=4i5w@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: kunit: initialize lock for fake ec_dev
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 3, 2023 at 1:05=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> w=
rote:
>
> cros_ec_cmd_xfer() uses ec_dev->lock.  Initialize it.
>
> Otherwise, dmesg shows the following:
> > DEBUG_LOCKS_WARN_ON(lock->magic !=3D lock)
> > ...
> > Call Trace:
> >  ? __mutex_lock
> >  ? __warn
> >  ? __mutex_lock
> >  ...
> >  ? cros_ec_cmd_xfer
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_proto_test.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platf=
orm/chrome/cros_ec_proto_test.c
> index 28f722396fc1..b6169d6f2467 100644
> --- a/drivers/platform/chrome/cros_ec_proto_test.c
> +++ b/drivers/platform/chrome/cros_ec_proto_test.c
> @@ -2668,6 +2668,7 @@ static int cros_ec_proto_test_init(struct kunit *te=
st)
>         ec_dev->dev->release =3D cros_ec_proto_test_release;
>         ec_dev->cmd_xfer =3D cros_kunit_ec_xfer_mock;
>         ec_dev->pkt_xfer =3D cros_kunit_ec_xfer_mock;
> +       mutex_init(&ec_dev->lock);
>
>         priv->msg =3D (struct cros_ec_command *)priv->_msg;
>
> --
> 2.42.0.582.g8ccd20d70d-goog
>
