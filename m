Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747DA286D72
	for <chrome-platform@lists.linux.dev>; Wed, 28 Jan 2026 02:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769567939; cv=pass; b=KsYe9EsuVEh7SAmr7r+bDXBmVW0w2yR1f2G+MOn8kM9OBJawHnMklZP6/TK9uog4THr4S4BSyVnuLNIbLiPhHFxn4bm0hdBjgZbv3HFoM38cwudh/SDmCYQ4jsvyWEK+R0JkQvGoqIAIipVdzas0KyWqnOB3U+fY6ukzDCsKWBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769567939; c=relaxed/simple;
	bh=XfutyRPSo26y+6VQ+/BQzyRCdlOrZm+qgfu4Kj5O0Qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p72++Is+kvnjLn33N9UmRbF00GG2o3p5/hPbnttrNf2qyPqL1pD740O3BZF46nXEP+00yXeIw6n7+7sCY8waSJHC/xyW5OBLEMTkqPQOWK60DztuFnCM3wUcCKcbZnyA6MEN+6zY1N76KARSWgWf4+3bfbKLajo6JzCdDtN8guk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KEVU2xgS; arc=pass smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KEVU2xgS"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5f52ed75c45so4267251137.2
        for <chrome-platform@lists.linux.dev>; Tue, 27 Jan 2026 18:38:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769567937; cv=none;
        d=google.com; s=arc-20240605;
        b=ACF6Jpa8WlzMNbjiO5E9UrFqOscBSTo3/4wojOjW2dm/Z6nM/+kLhOFqN2Z9yGe6fQ
         pIo8yyrRjD0s6DjY0ixGzwmQ8L09I7PX0tXeVwX76e0V+IQRUYcB/8xV55l5/VjO6D1o
         SAwVM/I0sYkvzjCNMnidYsD9D/nJI7XD++TusUI942nby6BCZJL/O8ZnWx4jQ9HpR072
         ciZFzsziufO7K/ddnKZCAzaYkFD/QJw63WuGf8vtyACVMelH8G93n1oLaO2VSLrVLHYS
         rg9iuW1baOyWUMxiE+9caJgxgUaEuyRDNFSpPzl1oWaFsEAf2GwYzsAh+1JYd6EDzN2h
         bluQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S3CStnAKW7xBbX1ULk1WdA1kSQJXp6KfJsb7rxybdOg=;
        fh=RgEfA/ToOlEOwIE43eDCYnIqloRV6Gwz51bYfwBBo4M=;
        b=fVZybRm+Q0G1hAYa9NbzqkgU84HbtGSL1Wy2dz/+BRreoUaoEemhwavkLHf6FFDkEe
         VEVkLWt1Pn0c4AATuyHWp8iGEkB1C52dR5uOS+9H9u08oQ3WzdJpRr9EW7auNvHecB3L
         XeFPtiLmJkPMrUrXuAklUYvKKGOiKL6IK5p2xSVGHXkCegSPfphSrD9kU4QJDKccOSvM
         3DWRFpiDkItHxOeMb1vbdPB/GNEAk7Qrf1r7CD4pr+c8UmOha7mYCtLzNzTTpLXAi5yM
         05X9QSxfPyCtSnr47HGCsmh/RMiuPnoxyCoJQuHdSBZ4CC86e3BwmsF39jZqfzWet3K2
         LTjQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769567937; x=1770172737; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3CStnAKW7xBbX1ULk1WdA1kSQJXp6KfJsb7rxybdOg=;
        b=KEVU2xgSpAQgXlf7eYUD8uP/akAXFPN3BJkjGrSuINUXzlzG1Jdh1wQ38QmwShfU/V
         hCOTCr5HPiICBkZWnVUs5f/uNSffyeI+7FARHtCxGXu1F9KbhP1JOkWlKxntPmX+rHSQ
         U4y9UvBQnkVvYMnVawnNFESy2wWaLSAbo50UyW+jXQl9lEe6TlFv/YDwzvJf5iA2lxNC
         FcuHwLn7TAS4R5jo+laY4mYm/yqAqd2rzLAkwCm46vLIl5Ilxbb4MSnd0ZQp/SGRXD8+
         HCX2hplpSF9iT4vklPbDVMXkagIRJnwriTf5A9/j2ix600INle5IAOiaKPVQ6MUkakLM
         FzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769567937; x=1770172737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S3CStnAKW7xBbX1ULk1WdA1kSQJXp6KfJsb7rxybdOg=;
        b=JRNebQurj0dvhkbiiwU5zHQ7y8zSjP8VJ5Y3Sr/ePkfQ0vqUyI/I1O6THJaCuXymQk
         /QcPOGU828bsZhSG0+wUxMUi2YTywoohBaOol111mXKhFBi6EiBHWUMEYNfMCJfJDX01
         0dBNILHB+n9lF8BYC5HDgNWHO2+WkUBQ2pzLzwgQyVEye1fxpRCsncdRoqWAzOfwgN/d
         Whf8DC/aULNcibVZF/78cnDrrbiInW+pefhPCimM7G+nhJHaeEwITmcPSEKRK+1NMb7t
         heTtjxq3gU2DCckS/voRPUGrWIt6De78fr/nzhsskp37T5iMSEl/ToEXsr4U64TCkle0
         3X/w==
X-Forwarded-Encrypted: i=1; AJvYcCX68bAlNX/UKIyrB2ZQlgU4A5nyX/zFs8UUKi33gUmfUBn429Z6RYoGzznUna6vfRxtTdIAtkvL9xMV3mC6ad0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzjUJsFI0HsEgBAGnVMlRc8F8v80lf3s9QEdoSMGWSWb0EK73fL
	Kj4OJEr5+FUGauUufS+nBcqEmrG2adEC4W6hv3340Vky3Z3X3dM8GuBzrNDzrgj0d/M16ax/4NA
	/r02lPgEr1rPaxpM0OQ9rk+pqIeyt46ggftexuJtP
X-Gm-Gg: AZuq6aKSq6DB/6fa29uk23TqIaGIhWTwU+ku8ctxOxqrbGfE2PaCJvbCDH3dzp/hF3c
	8KXt9jZCo2O+DWgK3k2jcXxGyP3bmnzVc5PEtNunD4pwJeQEj8UN9O8UebTCP5nRLDkoJWkEf5C
	+5uJ9fL6XMtaUk8+PvGba+fxR7PwyxGnzDSRJAW6ybMS+xiK6PiNwcyGUS9pKsHOm9s8w7qHKnW
	pLkeeR7DYTmkv3Lsc6cjLn2sGPQWKC2GxlwyxVYvwxgT5m670Pk+uIWlB1GX6v6OoixyNwIyQnq
	2lswymSOjlz4FiguzqmOKUbE2TBh
X-Received: by 2002:a05:6102:50a5:b0:5db:c9a7:bdef with SMTP id
 ada2fe7eead31-5f72363b3abmr1646601137.14.1769567937060; Tue, 27 Jan 2026
 18:38:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260127063434.789047-1-gwendal@google.com> <aXh0hEZNk2gmLncI@google.com>
In-Reply-To: <aXh0hEZNk2gmLncI@google.com>
From: Gwendal Grignou <gwendal@google.com>
Date: Tue, 27 Jan 2026 18:38:44 -0800
X-Gm-Features: AZwV_QjANYEQ3c0NtuvcUhhQuwunCpNeYx_p-l0vS54gqm-su5IAoOcxPIptM8M
Message-ID: <CAMHSBOVrrYaB=1nEqZk09VkczCrj=6B-P8Fe29TpPdSDgT2CCQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] platform: chrome: lightbar: Report number of segments
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Gwendal Grignou <gwendal@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 12:17=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> On Mon, Jan 26, 2026 at 10:34:33PM -0800, Gwendal Grignou wrote:
> > Add attribue `num_segments` to return the number of exposed LED segment=
s
> > in the lightbar. It can be smaller than the number of physical leds in
> > the lightbar.
> >
> > Test: Check the attribute is present and returns a value when read.
> >
> > Signed-off-by: Gwendal Grignou <gwendal@google.com>
> > ---
> > Changes in v2:
> > - Put local variables at beginning of num_segments_show()
> > - Cleanup return logic.
> >
> >  drivers/platform/chrome/cros_ec_lightbar.c    | 43 +++++++++++++++++++
> >  .../linux/platform_data/cros_ec_commands.h    | 11 +++++
>
> The patch generally looks good to me.  We have to wait the header change
> landed in firmware.
>
> > +static ssize_t num_segments_show(struct device *dev,
> > +                              struct device_attribute *attr, char *buf=
)
> > +{
> > +     struct ec_params_lightbar *param;
> > +     struct ec_response_lightbar *resp;
> > +     struct cros_ec_command *msg;
> > +     struct cros_ec_dev *ec =3D to_cros_ec_dev(dev);
> > +     uint32_t num =3D 0;
> > +     int ret;
> > +
> > +     ret =3D lb_throttle();
> > +     if (ret)
> > +             return ret;
> > +
> > +     msg =3D alloc_lightbar_cmd_msg(ec);
> > +     if (!msg)
> > +             return -ENOMEM;
> > +
> > +     param =3D (struct ec_params_lightbar *)msg->data;
> > +     param->cmd =3D LIGHTBAR_CMD_GET_PARAMS_V3;
> > +     msg->outsize =3D sizeof(param->cmd);
> > +     msg->result =3D sizeof(resp->get_params_v3);
>              ^^^^^^ insize
> It seems you missed the comment from v1.
You're right, let me sent v3 patches: `msg->result` has been used
incorrectly in this driver. Also, I found a invalid memory access
during testing.
Gwendal
