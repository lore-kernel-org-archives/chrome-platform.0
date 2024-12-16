Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECDB206F2B
	for <chrome-platform@lists.linux.dev>; Mon, 16 Dec 2024 19:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734378580; cv=none; b=rsqDBRJC63D9P7EQy2IcJsAGqhfdyjZwNHhFRypra99Bp25koMldcEPDG3b9wnogF3vOV6gt0LgvB6U8l69xuf/BklTnjrEP0/48svLCOIxj+PR9eV4Swk6fCLryq4xIpnHzj6uI1vYF9PTtlotlF7BP8ozv8k9ON9I8IOASH3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734378580; c=relaxed/simple;
	bh=yiOfUbb5jpBoALuu9emFj0aPP8HuZJFUHwQAFjsas1o=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f3hEPQlgRL41ckJ/nyxvrvsCBYNwUhpsXx+nJJvKiB+DB101pgvk4EngSqnkEYByep8MC7OBcoPq04Q/M/63HMALxsVFsxLzkGaeQnhvSWbR9RGx4lkviDfykanFn0/mZDV3SQeJYEMYZdD7urub6wj9EP0DDHxHhhUlrgzCIRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YCRjnS4T; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YCRjnS4T"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b6eeff1fdfso341269685a.2
        for <chrome-platform@lists.linux.dev>; Mon, 16 Dec 2024 11:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734378578; x=1734983378; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LNy2uYAQLvX7Yum35lwl6aWibHIIBXzf8t75pVbhXI=;
        b=YCRjnS4TJDILF9/6KksiYd4dg/enT7cuGP7+1CwEK9lyeneVwEaHhy9uOo4PcFdqGs
         G/5WC4oWkNCcJBMxtYbtNUmKu5f4k6050SGjjvIkacNQn1rE+cq5Fp9kBHApq5V0n/z/
         q9xDP3In2uSSBXwpe7dHW2+PJRwyLJMS5Fxus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734378578; x=1734983378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/LNy2uYAQLvX7Yum35lwl6aWibHIIBXzf8t75pVbhXI=;
        b=eyyi4xbbhkN+YimrQm8WsoC8yO/tx5S/KSYtZgP2nxgKCzSsBoKQwAPqTGOhAVK9BF
         hTlvsHnGCVeh9my8INoBedD9Y0Krd297nsn5LlKnwwf3I1yzWEZELq9TXkumJ4+bQNiu
         BofNaeoLgto9ANHSK31vQGd4L22ZJGJBS1fTj13U2zWJs9IDexk5q3Gp8EAEfkquO3KK
         5ebbb+R98USjlqk8jvEhFCq8RsW+xe8ECLCrgLsjrQL0kBfqi5urCktKitycYfQKInvi
         gzeAfnA8RGpPJr2BSf6CgxhNXTUVZfhcISxXgXcu2ChT2dEs7AM0kLEWcAdaPd/Yb/DF
         iOnQ==
X-Gm-Message-State: AOJu0Yz6Cu7UFQM3iEsA6a+WdOrGDuU5ss/1rW0eflhcxni9EkyvbJF5
	JwoGAX40f0SWcPwO+zDfUUln9j3oUGnZ2TsQsQdfusjcW/BWf6ktD8c6hCpDiXSbA2ugd9dfa6n
	4XAoczhKYSxSxWPC4QQMv17lt6opk848fQU/J
X-Gm-Gg: ASbGncuHbvKeaReHP8I53oDf9B1bzXCbn6QSvTxJcUSes4imX8VnC9TIo3hcB2OEWfY
	zPQtN8FzuLZ9laeVfBGqXB7alWYCKHX/uNrSWXYJS1dvTJAcAweC7dBaDVtbsZ0K3yw==
X-Google-Smtp-Source: AGHT+IGohp0hGmz6f/D7NUUpgkTIS1kh1HZGfm7WOqi0KOo6p1jF3/g/6k7Mgcwm72Mk1bPLFZ1ljnrq+DyXufRmGLw=
X-Received: by 2002:a05:620a:370c:b0:7b6:7863:cbc4 with SMTP id
 af79cd13be357-7b6fbee76e4mr1530415685a.18.1734378578189; Mon, 16 Dec 2024
 11:49:38 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Dec 2024 14:49:37 -0500
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CANFp7mV75SpTAyh=A4kZA2=NWi7+ry0+W+a5kpcjLrPwyhJ8UQ@mail.gmail.com>
References: <20241206233830.2401638-1-abhishekpandit@chromium.org>
 <20241206153813.v4.5.I142fc0c09df58689b98f0cebf1c5e48b9d4fa800@changeid>
 <2bfe74d6a29ca13a7f89f116a2f0c6be.sboyd@kernel.org> <CANFp7mV75SpTAyh=A4kZA2=NWi7+ry0+W+a5kpcjLrPwyhJ8UQ@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Mon, 16 Dec 2024 14:49:37 -0500
Message-ID: <CAE-0n50jvejyc1HO62mDBCCoV8eT3uL9sgu2B=ZeSHKxv=w+SA@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] platform/chrome: cros_ec_typec: Displayport support
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: chrome-platform@lists.linux.dev, heikki.krogerus@linux.intel.com, 
	linux-usb@vger.kernel.org, tzungbi@kernel.org, akuchynski@google.com, 
	pmalani@chromium.org, jthies@google.com, dmitry.baryshkov@linaro.org, 
	badhri@google.com, rdbabiera@google.com, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Quoting Abhishek Pandit-Subedi (2024-12-13 10:33:19)
> On Wed, Dec 11, 2024 at 1:58=E2=80=AFPM Stephen Boyd <sboyd@kernel.org> w=
rote:
> >
> > Quoting Abhishek Pandit-Subedi (2024-12-06 15:38:16)
> > > diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/p=
latform/chrome/cros_typec_altmode.c
> > > new file mode 100644
> > > index 000000000000..bb7c7ad2ff6e
> > > --- /dev/null
> > > +++ b/drivers/platform/chrome/cros_typec_altmode.c
> > > @@ -0,0 +1,281 @@
[...]
> > > +struct typec_altmode *
> > > +cros_typec_register_displayport(struct cros_typec_port *port,
> > > +                               struct typec_altmode_desc *desc,
> > > +                               bool ap_mode_entry)
> > > +{
> > > +       struct typec_altmode *alt;
> > > +       struct cros_typec_altmode_data *data;
> > > +
> > > +       alt =3D typec_port_register_altmode(port->port, desc);
> > > +       if (IS_ERR(alt))
> > > +               return alt;
> > > +
> > > +       data =3D devm_kzalloc(&alt->dev, sizeof(*data), GFP_KERNEL);
> > > +       if (!data) {
> > > +               typec_unregister_altmode(alt);
> > > +               return ERR_PTR(-ENOMEM);
> > > +       }
> > > +
> > > +       INIT_WORK(&data->work, cros_typec_altmode_work);
> > > +       mutex_init(&data->lock);
> > > +       data->alt =3D alt;
> > > +       data->port =3D port;
> > > +       data->ap_mode_entry =3D ap_mode_entry;
> > > +       data->sid =3D desc->svid;
> > > +       data->mode =3D desc->mode;
> > > +
> > > +       typec_altmode_set_ops(alt, &cros_typec_altmode_ops);
> > > +       typec_altmode_set_drvdata(alt, data);
> >
> > 'data' is of type struct cros_typec_altmode_data here
> This should have been allocated as cros_typec_dp_data. Missed during a
> previous refactor that changed the type from a union to this format.

It would be good to have the cros_typec_altmode_data member be somewhere
besides the first member of cros_typec_dp_data so that this fails faster
when stashing the pointer into the drvdata and treating it as the wrong
type on the other side.
