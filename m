Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889721E47DD
	for <chrome-platform@lists.linux.dev>; Fri, 13 Dec 2024 18:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734112878; cv=none; b=H/zD+zkBax8iiyd6MAEV7MRyYTw3Ku9/adxzyHm7pzHyeBMv2B2FjtrCo2Pjj8Vf4yMW8/EKIkTZKARw2ZJElrHmyjPJtQGJPCVz6UOwS9IUeYkLfPNGgINXqZsMbmMFv9r0/uBlijAvhQ6784qzYT4u3cQo3QrUV/n26Xwrgog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734112878; c=relaxed/simple;
	bh=eGq8X2cQn5Avkj8xSv4CjUXuHP5mxbeSDOJ4KzyQ+Tc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A1KKabvMB+sVlBfTc5/onRCLI7k0bMg57CVp57qUyWW3lTjoJm4Lm4jksx85BenrQUs8fSmMAKxoTe4qqX6QpUz4G44EiZQEZoByykDLZ/p5vMvPP43r/QKHf/AGAre94DVOzxzRpZn1W8SlnI9/gY9h6tgyw3KS2dwtUaiFd4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TAnkZdU4; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TAnkZdU4"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e396c98af22so1426512276.1
        for <chrome-platform@lists.linux.dev>; Fri, 13 Dec 2024 10:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734112875; x=1734717675; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPeH+betN1f6uv0SwXfZrHgC9aEQIrrjFSKIB2w0wUQ=;
        b=TAnkZdU49OazS01IxfcGqduJPZZD4G74rucQtEY3T8Z+mB6REn3hSKL4UIutfv9h8C
         Mz1NQMxdenSr8Guoku+/yIHXpJXl5InqpOaIL7ggH2eKyERTdmk13n/j5ViSVIfojHy4
         fzfJiNi89kx6zANs4IDptL8bCk4VB/bfwOcpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734112875; x=1734717675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPeH+betN1f6uv0SwXfZrHgC9aEQIrrjFSKIB2w0wUQ=;
        b=UH9XqahwbiYAF66pEtLyrWRgqZQsTdT8YLZWQrZc39wWAFWVQ2hZW8MpRazJlvfFMX
         /a+zSuJrYH10+WsB6M7UiEyfwmrnD/xZC8wTYo56gE7c9dAjej7L7IqpsP+I6nUK0SP1
         FQWHsctMhfLQPCRXCnyfz9dP08EPqmq3yuj9//9RiXArT7EO+wA8sTdk97ZA6hkAEcXe
         23km6fdYc9UJUVX+4nFyzDcqt00bjIbnk08PJOHS5g+lb4feAcFC/ODYY++/LBxYnoXI
         lk3bC7njnwefUMhXaYWjL6cQ2ijLw/ZbJLS5I2ZrJiUfH+5adPxYSmpaKCaUZ9BtTSU8
         AjtQ==
X-Gm-Message-State: AOJu0Yy7AAUh36hkH9Z+FNoG0x3TnlskH22KkrVVWFHPcg2DzCoxlotU
	Hwx12VNZudQ4e43hcXQgwliH51dl17vlIAuWZjHFzzr9fr7PBopGJyEObO/7GLZmI7aCe/b2YCx
	qpmWjmT+pd4VeMiq4gRpJU1LoT9QcijUCtmpB
X-Gm-Gg: ASbGnctveT098RVtLUp3H3Yz0sbcJJJkj7ixPs6AyCxNH2ajBg+jCYZUYIRY8kMhUSC
	hsA4TSwyDxYivmkK2rnd+49YHtqMZtl0v7x8fZQ==
X-Google-Smtp-Source: AGHT+IESL/tWUgNpSAQzrl87j2eCkOc09/+to8cMqhW7uI835WQ1LUGaxeGORtfqmEOGd/ePuPsgZvrU3N3ocWweWvc=
X-Received: by 2002:a05:6902:2292:b0:e30:b98e:b111 with SMTP id
 3f1490d57ef6-e434aa0e976mr2988627276.17.1734112875416; Fri, 13 Dec 2024
 10:01:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241206233830.2401638-1-abhishekpandit@chromium.org>
 <20241206153813.v4.4.I083bf9188947be8cb7460211cfdf3233370a28f6@changeid> <CAE-0n52AG8henLkzAyO112pBmNAskcC0SXKFNCyQQ3MG01xkGg@mail.gmail.com>
In-Reply-To: <CAE-0n52AG8henLkzAyO112pBmNAskcC0SXKFNCyQQ3MG01xkGg@mail.gmail.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Fri, 13 Dec 2024 10:01:04 -0800
Message-ID: <CANFp7mXCChVFaQHiW_RCu_97BnPHc5qHs=E6WcGRGLUEniZieA@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] platform/chrome: cros_ec_typec: Update partner
 altmode active
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, heikki.krogerus@linux.intel.com, 
	linux-usb@vger.kernel.org, tzungbi@kernel.org, akuchynski@google.com, 
	pmalani@chromium.org, jthies@google.com, dmitry.baryshkov@linaro.org, 
	badhri@google.com, rdbabiera@google.com, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 3:32=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> Quoting Abhishek Pandit-Subedi (2024-12-06 15:38:15)
> > diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform=
/chrome/cros_ec_typec.c
> > index c7781aea0b88..e3eabe5e42ac 100644
> > --- a/drivers/platform/chrome/cros_ec_typec.c
> > +++ b/drivers/platform/chrome/cros_ec_typec.c
> > @@ -676,6 +677,16 @@ static int cros_typec_configure_mux(struct cros_ty=
pec_data *typec, int port_num,
> >                         port->mux_flags);
> >         }
> >
> > +       /* Iterate all partner alt-modes and set the active alternate m=
ode. */
> > +       list_for_each_entry_safe(node, n, &port->partner_mode_list, lis=
t) {
>
> This can just be list_for_each_entry() because the list isn't changing
> during iteration.
Done

>
> > +               if (port->state.alt !=3D NULL &&
> > +                   node->amode->svid =3D=3D port->state.alt->svid) {
> > +                       typec_altmode_update_active(node->amode, true);
> > +               } else {
> > +                       typec_altmode_update_active(node->amode, false)=
;
> > +               }
>
> It could also be shorter:
>
>         list_for_each_entry(node, &port->partner_mode_list, list) {
>                 typec_altmode_update_active(node->amode,
>                         port->state.alt && node->amode->svid =3D=3D port-=
>state.alt->svid);
>         }
Done

>
> As far as I can tell, cros_typec_configure_mux() is called when the HPD
> state changes. We'll iterate through here unnecessarily in that case.
> Can that be avoided somehow?
Writing the same value to `typec_altmode_update_active` is a no-op.
I'd prefer to leave this code as-is since it's quite simple (having to
determine HPD vs non-HPD, whether DP is currently active, etc. is
going to be more work than it saves from not calling this loop).

>
> > +
> >  mux_ack:
> >         if (!typec->needs_mux_ack)
> >                 return ret;
