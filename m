Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4855A40BE3
	for <chrome-platform@lists.linux.dev>; Sat, 29 Jun 2024 14:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719671445; cv=none; b=SEFkb/gdeYaeGHlhjCJQ5dJMZjDyw1wxtFPJxlVYOsqBHMsqLfSWwc/LF2FS6jRmmUP41P5wub2IqFqHiBsOtfxnAmPyAqj5VyZx2tSCy2CGWYO2iRIgCYM/ZNrPBrrCXds2AwJWi8EnGRTKcTFOkpsExUgWNrsFw9pkvxtASzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719671445; c=relaxed/simple;
	bh=6GbLi1JD0DeqwbARIUWnsx6f1P44NPHpbsq6lRJDRm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=up8ZIN0nt1QYRVI4ThhrsgPeNI6au+ynW/qbE0LP2WJD8UcFC91E19FGWY6G6WVW6xxP5784lCZ9vbcCnEz0KgJHGJeVOVuBkaP2E9/gpJwDA8jiBa4RfYpRhaKuVmncYe39P6dFcy3UVElIGJasdE81Sv3XDEIKG19Que7tWXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3O9IHcWx; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3O9IHcWx"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57d00a51b71so4944a12.0
        for <chrome-platform@lists.linux.dev>; Sat, 29 Jun 2024 07:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719671443; x=1720276243; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrud1JhfOlUfYB81S7Syr/8uTZeCdrf+FlsoxmK/I4o=;
        b=3O9IHcWxIDEqV68c5n1SBDQnnZpeu/o3VFwYYyjKLDSBW38Mc0Mwsqe3Y3nxEQWraI
         h9a8CZBdMIY42pC5vpdL4BDqJ0JLXTPWWArktf3LFQoByByeifasRbsKa2iPgVGKMe4c
         MO4rnvGVpwa8wKU5cRBQAoHneXksr8O0vezSGfpjlh865M1wnkg+lPL4FNPkoKmIDJyV
         y1catOstDDgy6Uk4/Xeyu5HM5ZgLLhfZwbeaakPi4lOFd9BrfAVFHjB01jDjly6L+hrI
         u9rB93IgUzzPBZVSPT+VQ22CpfZhl8vKBzzNFYcb36PicWfNU5LB6C6lkdemUXUaa2fx
         cNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719671443; x=1720276243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrud1JhfOlUfYB81S7Syr/8uTZeCdrf+FlsoxmK/I4o=;
        b=tvbtG9g/1qcF6/+nES3y42oYVZvQurjBt+XXXllt0wf9Woam05+eFpcyrzhWtj2LlV
         vLUrxfmKjNicz6jpmfCh+QPUQDJJyptxXYMglIIUuSr0oJ5ORhW1pikPOKYsTg7By9Td
         ylZljo3o7TAxEXyLo5MyY1oQJzhMUgFg6AdUGupr7NfEFc0ybltCCHgzjxtEcwAsfOSH
         jM7jsaNq8zQ+9QORWh2OUd9dbI1QsDmt1j/K9nV52mTZx3ulEY246YRHAVvdjERpKy0U
         jF6sYrOqYexioeO+iIiO34g8ydAQEaz4IrrkhPHduaesKQu1GH1L5FbWmzKht9hByleu
         mjwQ==
X-Gm-Message-State: AOJu0YyNkoZeuCmqurKVq28CmXqZTrzqPRob1GSGnO22RDkKCbwshcnt
	zO+DIUBlvPePSvasv9zVp0yGgc7P3EIvuP6lCTB/IGLyZhsGry3D9EX5ojMLv/3TRyYtl1Basb5
	hQmtFc9KskA+r61+6e3ympJDz5pFSC41yldOq
X-Google-Smtp-Source: AGHT+IF6Ig144tkRe+lYrfurwiAb/HGvUlbkbhXr2qYEad3JtuJTL7bhoRuypkZ9VxzjKILvi3jchWLefZw/5jHXLgc=
X-Received: by 2002:a50:8ad0:0:b0:57d:44ab:ecff with SMTP id
 4fb4d7f45d1cf-5872f6702a3mr120663a12.2.1719671442396; Sat, 29 Jun 2024
 07:30:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a9623e7e-ce3a-434c-a904-39c6934c2ff5@web.de>
In-Reply-To: <a9623e7e-ce3a-434c-a904-39c6934c2ff5@web.de>
From: Guenter Roeck <groeck@google.com>
Date: Sat, 29 Jun 2024 07:30:28 -0700
Message-ID: <CABXOdTc6G9E2SdyP+27Gp3HsxfKqKOPmqkYG2x6Avg5bzCNNdA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Use common error handling
 code in cros_typec_init_ports()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: chrome-platform@lists.linux.dev, kernel-janitors@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>, =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <groeck@chromium.org>, 
	Prashant Malani <pmalani@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 29, 2024 at 6:33=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 29 Jun 2024 15:17:44 +0200
>
> Add a jump target so that a bit of exception handling can be better reuse=
d
> at the end of this function implementation.
>

I see no value in this patch.

Guenter

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/platform/chrome/cros_ec_typec.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index 4d305876ec08..aff744a0b38f 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -348,15 +348,13 @@ static int cros_typec_init_ports(struct cros_typec_=
data *typec)
>         port_prop =3D dev->of_node ? "reg" : "port-number";
>         device_for_each_child_node(dev, fwnode) {
>                 if (fwnode_property_read_u32(fwnode, port_prop, &port_num=
)) {
> -                       ret =3D -EINVAL;
>                         dev_err(dev, "No port-number for port, aborting.\=
n");
> -                       goto unregister_ports;
> +                       goto e_inval;
>                 }
>
>                 if (port_num >=3D typec->num_ports) {
>                         dev_err(dev, "Invalid port number.\n");
> -                       ret =3D -EINVAL;
> -                       goto unregister_ports;
> +                       goto e_inval;
>                 }
>
>                 dev_dbg(dev, "Registering port %d\n", port_num);
> @@ -408,6 +406,8 @@ static int cros_typec_init_ports(struct cros_typec_da=
ta *typec)
>
>         return 0;
>
> +e_inval:
> +       ret =3D -EINVAL;
>  unregister_ports:
>         cros_unregister_ports(typec);
>         return ret;
> --
> 2.45.2
>
