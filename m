Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5066F25761
	for <chrome-platform@lists.linux.dev>; Thu, 28 Nov 2024 15:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732808267; cv=none; b=ZEq7p2TLM+AmU6mwfUgw0I8fwKAyrjzu8Gnfgt7LE3asclt8xEYtMq9vPI+Oau0yht5bKL0gS6KoVY8mG8H4QmNwxkxNNzpLsf8gk/BSFYHb1UBZGgb33quv7OPHg1wW3Be51x42eNbMBNZpyByNlUgnC85Pmiwf5S2Gtv8ngxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732808267; c=relaxed/simple;
	bh=Ds5+8kfZBfCZhW5WDb8ROSMmQ2iK1zqD8lS3wKlRuKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QcOKOH0/NkC4qoMFmJrck50PY1iTWQozFClu6ctTj3v3SgAykJnrr6hc0xTS3P6aQEJapBPQuDbgStq2WJnBb044DgjcpWVJ68g0eqccHLerHLZLMh9ddAbx2YNfx6cpk0NqtHAlX7LIAQ9R6c5D8Yi235FmQnxdMw5eVXwMnpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lscaeMYT; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lscaeMYT"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ffc80318c9so10477601fa.2
        for <chrome-platform@lists.linux.dev>; Thu, 28 Nov 2024 07:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732808264; x=1733413064; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r78PsilYOIB1YzcxsIaBFcuZtovHA+J7gqslFteSS5k=;
        b=lscaeMYTnQ5r1fL9YD3QfYdW7fPAjqrVa0zJHbUfxW+pG+67R5YfQiEuw+yPw520y5
         C3byEMOBJDHtoak5ifWU4XuRJgcV78fXa07nEVwKMZhHo8XJcDPhjN+vYD2IDhvs5Atb
         jMOIpJcCmFE5EvjuxvpmZ6BEcE7Yx7jG9EuRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732808264; x=1733413064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r78PsilYOIB1YzcxsIaBFcuZtovHA+J7gqslFteSS5k=;
        b=wDRXnpv+a8R0NVc1H0iOOQoMFbRriwEgMGPJxrraiWfkydC5XOmUBUb4lLsO9ngSfu
         NpfNioGs2NVPWVmqwMJ739E6kq7WzR6BMj/ctWHqDgBnu/D9NZXXD7E/NtHt+Mvu9J6X
         rQPF7dd+qO+MXNL3yQBYa716o82pVQeugbfpsjUFH/YuoxhYpWt/IF2cs+h21L96SJGm
         6zjNzdDZqpkYZAB3e/Lj6SY0OX5/CMs1LcexqkQM1kDq6O9fLXgcCKoNOL9JQbb3qNRr
         U7TqfEwbMr7YDgvoXZCAPxVAG1Fo4epPQ8wg17K3tTUgog+ezWRX1+RHVrahi26fzgp7
         tIVA==
X-Forwarded-Encrypted: i=1; AJvYcCXamJgPDCesFP+MkWHQ/WqrXbbAmdC3RbuSbFSP3EEU7g8io2uCMWN9XFLrEfoY/TE6aEnieRtzyEn7eGafFlg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyarN343EX7cnn8M7LJDUjmpV+elxuTnhLnq0QIYqGl5FpD2COr
	n4klSdNrYvleIR3hp00bJLcbvHqe/y/pgNZDsNrt1TvvAUio8pwgSt7sYu5NEefMjwM9XyX+yJp
	5F1/VpEjzhtKgRxCEg1TwngNZzmrC6QryAi8=
X-Gm-Gg: ASbGnct3Bm6MPZm/XsXilfycURDjz+wTF7h3jGRgzmKyl1ZILOP2uV1GvXaFLk1uz9d
	WV2VY6mlzj9lKCbZUjPfMwyb9ezZsvBMam7hoc/tx56D9x/0X9CmlZLbrBMo=
X-Google-Smtp-Source: AGHT+IG/BN3Wxw36KeRPzELv5MqmN5fBKrc4T+6LKYJV6nZNW2sf/GbStGemSn/5lzxJIfPK2YT+zFybW90qNdWcttg=
X-Received: by 2002:a05:651c:1541:b0:2ff:cb09:ccbb with SMTP id
 38308e7fff4ca-2ffd6069466mr35010041fa.10.1732808264566; Thu, 28 Nov 2024
 07:37:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241115155234.1587589-1-ukaszb@chromium.org> <20241115155234.1587589-3-ukaszb@chromium.org>
 <Z0iCP_2RM-c_yvU1@kuha.fi.intel.com>
In-Reply-To: <Z0iCP_2RM-c_yvU1@kuha.fi.intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Thu, 28 Nov 2024 16:37:33 +0100
Message-ID: <CALwA+NYEa8OHt=Nodh5TTfFQkXsqnO7yxUm=UEes+CmNGTGP4Q@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 3:46=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi =C5=81ukasz,
>
> This LGTM, but since you'll send one more version in any case..
>
> > +/*
> > + * Maximum time in miliseconds the cros_ec_ucsi driver
> > + * will wait for a response to a command or and ack.
> > + */
> > +#define WRITE_TMO_MS         5000
>
> s/miliseconds/milliseconds/
>

Thank you Heikki.
I will fix it.

Regards,
Lukasz

> thanks,
>
> --
> heikki
