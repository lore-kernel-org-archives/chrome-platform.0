Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432E1283FCF
	for <chrome-platform@lists.linux.dev>; Mon,  2 Mar 2026 11:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772451086; cv=pass; b=bKu0V+DFNoxa9wpGLsr34ML4W44mG1RKXguAmZFWIiQoKpeKm54ajy+IJGoCIWymPVQriUF8hMMde+qUZ1BAFiyovv3sV0+0odKqUZKNbFjh7R49itK1LTTpyh9N+MHy2MrLtA/MhGaSuaAKyOTVzUWhv6lJBjKF6bSe8tK4Kag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772451086; c=relaxed/simple;
	bh=MIrebT36/abwugfBFswhZDckaWH+gbdfDnt3JmA9oBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tLLxaGPj6vNLwG+h9hni9phcKas58of2kbWOxVxh1sYyZPq1vDgKEk8v4oIbN4P2+z9tz77r+QX8oZOp8+YM6olyeQBGYbogiN164nDx0bLfOIbX9vSSbpvzSGO7hfESLpbKyYa7H7RyP9I2D50J4anoHwyOfXA/axitPVuv788=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cRKL2UdD; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cRKL2UdD"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1270fc2bdf2so16428c88.0
        for <chrome-platform@lists.linux.dev>; Mon, 02 Mar 2026 03:31:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772451083; cv=none;
        d=google.com; s=arc-20240605;
        b=T9og07hjI000B/JDXllB1HPJ0rjsPeFeEhMKSXu0jyH+UOcW2w08siZjHF9pqdz3Mo
         0nXqBTrjD0ryfRoDize7glur3xYuAcTf6K7B6MhRhIK3gmzqQEmqb1BH8h1PgojQK1kf
         VJH2XlAiNQUBJ9/vma967oPQgIaIVh9JAX0w9iKWRveL3ORddAM0J4zqoxB43hgINmt+
         GE9cM1eQJibbzGXP74qYRkojzu1LvM2jCRANeW2R0GtOGINc9ogM0PjCz0N8dVbWqICK
         MkJsG/crZxevxHfUpGULaYnxpkvILps85864P7c2XI3MbpMbAmEqEl/krCa8lANlQZcK
         AWIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hRcH+v7tmIyTZLn4oUBFcSFT1/NFdo0CrZxQPruKMXE=;
        fh=ssPTphfIw0oY9ruEgf2K7WYpKTf5T8UuUg+cF+Bc/lQ=;
        b=cCXw74oOXOw9S7N+Po8fYYwWdr9MastwKOmgBd3U5giB8ySTbMA1zIw4FCjliEP8kl
         L3IL76nQpWw8tVNVuXw4r2Z+SFxOCjaxdGg6nq1kPnb8Q44lifaZ+Sp6tgyfZkQeUALY
         SKCJBhs6dX1KGtnBKo91tgiFhl2plYhl5yUJwq76We/pRd9/xyaUPM99Sm0u+APq9LX/
         AhI70mo0IsHxdLv3hCzRJu1eQ2B/n2Ko7ku6OkP7aNKXTBXORmpyt8zkiwvJ5oZY7iYW
         dUd7CRPZKz7c5bOKFgbf1Z4v2FihLpP9KqIeAV9kfMSwYIiaaYaSpWYTtV98fjkT3Qh3
         bb4g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772451083; x=1773055883; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRcH+v7tmIyTZLn4oUBFcSFT1/NFdo0CrZxQPruKMXE=;
        b=cRKL2UdDg3z40JetsZYsJ9i9H7et9FPz49wvfnyzXh3oORTsIRXt/cQCfj3uwmOavg
         AK1qAXzXNHqjE0590wX/zHEuibEgFlxb18BKRDgijZ/JeLRBl9j9Q2MMUa5V8zibFA8U
         M6cKUF4TtG13eQF/zrY+E+EhDzXCk9cNoOizhEl/i/VL5o1KaNjkG6wfi0WcI5HomzYb
         p/fG2g2Q2DWOcr65ZzTnmCde3urDG6lXSHLHSwFwiM39L+Y0ju2YcCSsnnU+AjF4ZYuA
         dJ9Ldxmk4jLppPFBsOPM1w6L5KgycKUfcLlzk4seU8YEUbUuyKrHeSvkjrJMVL5cGLmH
         rNDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772451083; x=1773055883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hRcH+v7tmIyTZLn4oUBFcSFT1/NFdo0CrZxQPruKMXE=;
        b=nwxs2wUt/rsYHcU/Mkp1E5ezpqqRaWiSCildUkvgdCde2A/UVkvyesDfNgaDwwkR7o
         /XVa2PZdXrUF2Q0Darxa6sm/SYMITcNlvxltWqFVuTIXjpfLrEmmYQG12umWvXSzJQe/
         TPSQofmpDVuO5yt/SUnE0nrdL14UfMpIzNQ30OFG9RhjFYP6NN7m69p9CJecTLQuBpK5
         ofq+f0Y44FrLQEBqd0zp0R6HnG0F/m+sHEleyQI65cnTksT4NtsGE9MOmILYbTOtTOP5
         97IX8CeYFeW1J2GUq8mFtWwRjzOudxLrYYFQV0xgb7+tfREDGm520Q2OsCZhrYay7WR0
         EylQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1/aT4/bsY4mzejCXp5BP8hgDlpZ7N1RFz9LfPmzGqy9aIDaNgqJNyx6yPVlpoabtfq5REiNp+/aiANR68kTI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxxP6ZkQepvTlGYwzOpHNA1p/bSr3jaUwOvM1L9EsC4uBMvUGxW
	YXqmOeK7jvEc3oPB2invRaJQzFAfsu+1/iqlQqveIwQXsMoJ7uITPOtFHCX9538YlvsvhV85JJh
	Po5peFZ6e3+6DczoY7l2j8VgmdYajPRL+BRqI94b/
X-Gm-Gg: ATEYQzymT0gjUd9XvPM+NL8XgxBdz9VJQ1PlrV1bH9M+JmKNfmoZy1FeLS7bSdf1yNo
	NkRG6D6QiXAnoubx/xyGKtv7HikUvNXubmR9RVH0KMo/aBTleKruBKftvw5GlNZSm3OvZ/o0UrN
	ZILJ8K0DBxtbrTCo3ifHP2x1Ncn5sfgUugVpBEoDv1taW7zPuAV9mQMT0roRzgkXB4KQG13MDKo
	6JrmnL7Uj5EVdyCmKK4atLy5LgXfE9qDvERodh1J4047bG1vVJx8DtVGLEMQumPwkuxARolYACX
	cAnAGHOM3GJSzNiZec9Ggc3288xoi6Ynw6l8b7UlyBwCvZI=
X-Received: by 2002:a05:701b:4194:20b0:120:5719:1853 with SMTP id
 a92af1059eb24-12796e45d7dmr157828c88.17.1772451082766; Mon, 02 Mar 2026
 03:31:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
 <20241213153543.v5.7.Ic61ced3cdfb5d6776435356061f12307da719829@changeid> <cd1506b7-0438-4505-946e-4fc90961d3e3@gmail.com>
In-Reply-To: <cd1506b7-0438-4505-946e-4fc90961d3e3@gmail.com>
From: Andrei Kuchynski <akuchynski@google.com>
Date: Mon, 2 Mar 2026 12:31:11 +0100
X-Gm-Features: AaiRm53KB1yuktTjhOlTzjSiqZ6UkY3SEYaZLnV06Gs1s3UIAvzs2gJSbxllh2U
Message-ID: <CAD3SCTF7CG342tLe4ShMJHczrMUvnSRTxowt-EsGD1tt2TKmjw@mail.gmail.com>
Subject: Re: [PATCH v5 7/8] platform/chrome: cros_ec_typec: Thunderbolt support
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, heikki.krogerus@linux.intel.com, 
	tzungbi@kernel.org, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, sboyd@kernel.org, pmalani@chromium.org, 
	badhri@google.com, rdbabiera@google.com, dmitry.baryshkov@linaro.org, 
	jthies@google.com, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
	"akuchynski@chromium.org" <akuchynski@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dzmitry,

On Mon, Mar 2, 2026 at 10:36=E2=80=AFAM Dzmitry Sankouski <dsankouski@gmail=
.com> wrote:
>
>
>
> On 12/14/24 2:35 AM, Abhishek Pandit-Subedi wrote:
> > Add support for entering and exiting Thunderbolt alt-mode using AP
> > driven alt-mode.
> >
> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > ---
> >
> (...)
>
> > -     amode =3D typec_port_register_altmode(port->port, &desc);
> > -     typec_altmode_set_drvdata(amode, port);
> > -     amode->ops =3D &port_amode_ops;
>
> The last usage of port_amode_ops is deleted here. Is this a mistake?
> AFAIU from kernel docs, port_amode_ops needed for alternate mode driver
> to send vdm messages to partner. Now, when it's unused, how does
> alternate modes work in this driver?
>

The assignment of the typec_altmode_ops struct pointer is still here;
see the cros_typec_register_thunderbolt / typec_altmode_set_ops
implementation.

> > +             amode =3D cros_typec_register_thunderbolt(port, &desc);

Thanks,
Andrei
