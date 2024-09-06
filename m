Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6151C86E4
	for <chrome-platform@lists.linux.dev>; Fri,  6 Sep 2024 15:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725635968; cv=none; b=fh5KteP1hunzJeniXT90+QK7Unk2tu3GRyDdXEL/tpEXPvg/gZgcbHyNi4hsd7b/3yf4fl45/x4oLL0ruNm8tLBGiJDporjTjsrr6sNPJ2ZxIBpILGQMDKPe2rHyEA/+OP94IumpqxqfgZZIAiNbFjWxfR6SyfVrY8naZAblu0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725635968; c=relaxed/simple;
	bh=OSOuZkL/X/mNYuXEJFd7gBdX1eJI67yAbSVWtX/fPfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UAp3yVvkqog109kiXy1RxDeEkhDIkNGqCvKFqpFamrCll7de5axnP+bTH8DeGU+Jl3mZNPoRxkuAC9H11n62mMiPjIM55uIbcC7aImfFIWd4rIUXN6kLMwMzNgZEUfaZVgz8eYdkxWB99M8w+EAi1R0MywpJAzqb7T69Yv+t824=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RAZBXAjU; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RAZBXAjU"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53653ee23adso2055506e87.3
        for <chrome-platform@lists.linux.dev>; Fri, 06 Sep 2024 08:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725635965; x=1726240765; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=noleaBBmcHPsgizwxXud/rVIz/5Px6kF4LobwcN7U0c=;
        b=RAZBXAjUvYyGrBigdGCXWx6MF/4RmcAAIlX+mWPZGZNNR2vO9yRvzz9SA7MpKYDlu6
         yBcAJ6Dsrbwk4fD45bdZFVUQXa9bvOCEQkRlstE9l8cGlpXd6dxmwpfdxoaJXbB8WaB7
         gdLUBH6jgOPKykzWgVe5VVq7AV01YyG0IFx7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725635965; x=1726240765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=noleaBBmcHPsgizwxXud/rVIz/5Px6kF4LobwcN7U0c=;
        b=crskgFgZP9n+p0CGJQH5QWrgmpi7Sz9GeC/6nWi2hFSdVDII4YiIbnnSOMi3nxu2Eb
         oopChdXWpcNtCKvQAj9tRo9Iz5x9Pnqu7rebMOIuXcs8/azmEvhNw5AoDHpF3lYSxcK2
         COwTwOavTvUjoLWhs2g3vHOPigvrX2/UffG4O3sqI/f0S3dS3JjLGtXVUqDhEnx6d/SM
         E2Ro/Jakxm6LRDAUUJt3z4jUn/VvRD65wqE9i83LpEZD8oUPz3Q86+UAMsRLw6OaANX5
         A4E6McBIMpVF9rrQdCFZMhLqqzFi4OKJxFlPODVgs27eRftSgm6EsD24dBEhiCxxGqT1
         aO/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrd8hSASunuqHyT7bxOelOITqMbUkSvgy5EazmdYLNhngMg66eOBNS+LRHREL74PSmJ+cPNnFRHnDugAVlSMM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxlpdW4nGuxPaSkJ75NxSmkYEoNj+RvDQ7BYCF09qkw2855bJS
	n807XzFsHAXwjYfJH8ShNFTr4P/y/D+siJnmXZDSOp00Uzj+i6HemydY/uBYEbALQSfkkcQM1I2
	J9nJWnprWgowd5x+pLevxNR7TTtCvDp1j0uA=
X-Google-Smtp-Source: AGHT+IFVAM63Bs3VAvkqUDPEevU3qk7fsjHoPUg2mzp90Yr8MmCSObJgVxVt+3ywvZD2kgDj118t+VIs4MviiAaHop8=
X-Received: by 2002:a05:6512:110f:b0:530:daaa:271c with SMTP id
 2adb3069b0e04-536587b3427mr2273671e87.16.1725635964384; Fri, 06 Sep 2024
 08:19:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240903163033.3170815-1-ukaszb@chromium.org> <20240903163033.3170815-4-ukaszb@chromium.org>
 <ZtsPdWRHkHWufsVh@kuha.fi.intel.com>
In-Reply-To: <ZtsPdWRHkHWufsVh@kuha.fi.intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Fri, 6 Sep 2024 17:19:13 +0200
Message-ID: <CALwA+NY0LOhCNHidMfr4x0=4VOgGUODE1EU8up4BddretwLLxA@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Pavan Holla <pholla@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 4:20=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi,
>
> Sorry to go back on this, but I noticed something..
>
> On Tue, Sep 03, 2024 at 04:30:28PM +0000, =C5=81ukasz Bartosik wrote:
> > +static int cros_ucsi_async_control(struct ucsi *ucsi, u64 cmd)
> > +{
> > +     struct cros_ucsi_data *udata =3D ucsi_get_drvdata(ucsi);
> > +     struct ec_params_ucsi_ppm_set *req;
> > +     size_t req_len;
> > +     int ret;
> > +
> > +     req_len =3D sizeof(struct ec_params_ucsi_ppm_set) + sizeof(cmd);
> > +     req =3D kzalloc(req_len, GFP_KERNEL);
> > +     if (!req)
> > +             return -ENOMEM;
>
> Where is the memory for req released?
>
> First I though that cros_ec_cmd() does it, but it's actually
> allocating it's own cros_ec_command, and then releasing that in the
> end, so I just got confused about it.
>
> Is this a memory leak, or am I missing something?
>

Yes, you are right this is a memory leak.
Thanks for catching this. I will fix it in the next version.

Regards,
Lukasz

> > +
> > +     req->offset =3D UCSI_CONTROL;
> > +     memcpy(req->data, &cmd, sizeof(cmd));
> > +     ret =3D cros_ec_cmd(udata->ec, 0, EC_CMD_UCSI_PPM_SET,
> > +                       req, req_len, NULL, 0);
> > +     if (ret < 0) {
> > +             dev_warn(udata->dev, "Failed to send EC message UCSI_PPM_=
SET: error=3D%d", ret);
> > +             return ret;
> > +     }
> > +     return 0;
> > +}
>
> thanks,
>
> --
> heikki
