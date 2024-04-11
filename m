Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15006320A
	for <chrome-platform@lists.linux.dev>; Thu, 11 Apr 2024 02:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712802382; cv=none; b=IT4eiPWSjaB5SrrWrqPldMkl4Ug6UjlW7KbXyCfRoKhwrl18m9remlPb+PhP8t+HS5i6tl1UoyIjmh1Nqiq9bQ8T8w0b8ZOTsiepkqDQZK1syrbQs4gagm2ZWHqiWi1JnYCRVAujURVqLF4wjEk1lPaTF81gT+L1f2yzQ1f3jBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712802382; c=relaxed/simple;
	bh=UXJSmZxNI75aHxqgtrGql6qZ0waGZlG3tYEnH0qUS7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VE57bJcRh6DAQ8Q3ajJy+XjVyF0CZmVGl8BkcusaiPICJq43BxF/9smYy7FsKITZg3HhjSXi0Zbw28qZ0VSutaMhpUyhrMRj58Tnl4nMZ/y8a4gALYBNXTw1tbGFqWXrpAptQQEPH4VMqNYG6f6gZNuoKSdSFcmSgjd4aTU2vqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YhyePxjA; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YhyePxjA"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-434b5abbb0dso103301cf.0
        for <chrome-platform@lists.linux.dev>; Wed, 10 Apr 2024 19:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712802380; x=1713407180; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXJSmZxNI75aHxqgtrGql6qZ0waGZlG3tYEnH0qUS7Q=;
        b=YhyePxjABjesH+z97vLxADMRoC+A+7mBmdSTELjrIkzjy5srek+wlhzHWi1cUfn9qq
         VMU3+v4Rzs8QVqF1kppQr5sqWu6TdRCv0DoyYiVAKE5RPCLbocwH3ZzDOuWHNrZnd91V
         uJcOisKepf5HNDgAUXg2/Er0kPPcCVOFGS0OPbpCGPl07IKwfTZwDLceREQqPVXTt4NP
         ObvpHUwLn6xhMJGB58EYiRjWf1+4ybEvD1BWu9WxqkH6swS/1mAygr7MhVLrmJA/46ka
         ecuGQitdA5cTJHxaJxsVlQf4oVZBb0yNJTx3EyhuO+6FAEM+gKabYGoa2jaskp4HlrRk
         0zHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712802380; x=1713407180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXJSmZxNI75aHxqgtrGql6qZ0waGZlG3tYEnH0qUS7Q=;
        b=IXAaHU7Yes9YwARKuGz3cYSTcjCG5lm3anUYspO0+5D1rW2yV+1ALSCVJbRMtkQHbE
         xkFnCIknJymBh2NeAOS7kcvzCV6eTalNxqpqeNEaEKPsujWrLm9i8u+8QGhlnLab2/UA
         fh81gDAQaxszt/maNQtLOyhZmx5q/pUIWWOYo1oHRdFKRrpOSFxgR6cK1habJU37oV38
         F0X7cCLGr5SCnFo/CW8BQC5CHIOzMztLqvZOoRvVwOrxh/FHQfWhtTcsBkcDLs/2L1dE
         U+bVZe9YviXQfZB+zt09sGkd61zu7Yb65Y7fnbGQ+fijvw+CAYyxm6U3pLagI8/vP2Rq
         4YDw==
X-Forwarded-Encrypted: i=1; AJvYcCUOeNUW+IT9YLkv0Mk7fTsueoJtuccCvV3w6fMNaUQ0rJyQTkeBN0SebwXmSvMCDI2R47CxRTxB7YyaXOXJagYRhSMlAqAaXn9BfOWosj4s
X-Gm-Message-State: AOJu0YwrTCh3wS4Ja7qY4lB7wGBA5Oo73RA4KvJJ7/FnGci4SWKXnFfY
	1TCxaUvxIYLagbDuR20QElpeQeXcBM6dA20C8i6fGDUiaZEMZZq4jFE8hl7GiLSf64tps3GaNHs
	VhWJXmb3oOt0Kc2RuXtm+q3L5nemgmzcS1/VZ
X-Google-Smtp-Source: AGHT+IFPg5vORmoeTvYI/uTQ7j/zK/tZPyZEFI/0EvsxjhZAYdby9Des1k8yuS9qmNN9z2fJqX/gxMcyeTA58eMTClQ=
X-Received: by 2002:a05:622a:4c8d:b0:434:ec62:970c with SMTP id
 ez13-20020a05622a4c8d00b00434ec62970cmr131218qtb.12.1712802379873; Wed, 10
 Apr 2024 19:26:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240410182618.169042-2-noah@noahloomans.com> <CABXOdTe02ALsv6sghnhWMkn7-7kidXhjvWzpDn7dGh4zKEkO8g@mail.gmail.com>
 <D0GS8UL1WKI5.1PLEUUWOD7B8@noahloomans.com> <ZhdIc3vt3DFvT066@google.com>
In-Reply-To: <ZhdIc3vt3DFvT066@google.com>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 10 Apr 2024 19:26:07 -0700
Message-ID: <CABXOdTetbKE_VWQsK4K6PB4Lm456BO7FfWyHtBBMhP77+QhzPw@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_uart: properly fix race condition
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Noah Loomans <noah@noahloomans.com>, Bhanu Prakash Maiya <bhanumaiya@chromium.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Robert Zieba <robertzieba@google.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2024 at 7:18=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Thu, Apr 11, 2024 at 12:06:33AM +0200, Noah Loomans wrote:
> > On 2024-04-10 at 21:48 UTC+02, Guenter Roeck wrote:
> > > On Wed, Apr 10, 2024 at 11:29=E2=80=AFAM Noah Loomans <noah@noahlooma=
ns.com> wrote:
> > > > This is my first time contributing to Linux, I hope this is a good
> > > > patch. Feedback on how to improve is welcome!
> > >
> > > The commit message is a bit long, but the patch itself looks good to =
me.
> >
> > Hmm yeah it's a bit on a long side. I'm not sure what could be removed
> > though, it all seems relevant for understanding the bug and the fix.
>
> Applied with shortening the message slightly.

We might also consider applying the patch to all ChromeOS branches
directly (not waiting for upstream); we do see a number of crashes
because of it.

Guenter
