Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B71288C9B
	for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 19:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750102987; cv=none; b=j4az5ZUFQTpyed651bwd9G8ZyQgcqyuSYr2D3KSgMdEol3c3tEILabW9hwJuooy0xvKgboyof6PtFfb8bXKEGdPhMQAHeMH/SlcjNWirQwOQ6FXVXnPXWGAmI+v07f7SqJWGZMwL3AaU57OYvd3rc0e+SW2QLwX+ScWNnA45/+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750102987; c=relaxed/simple;
	bh=4GXtdJIt4heRHXVxGyZI7LVV8sINiu3XKNwn1Nmm8ac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BxBw1P+8wTa5iCZWdFXeUBsR6bqceQSkfyoiVhm1gEKN4FKuJePDQlWoYkoWBkfZ1FeLum8bWsdlHHPrQwR7joi2SjdOd13cOKFGFYUAgt+RTjLi7dfgz7yC4VZHqAxzB7TQGv7epPguoPpdWTFExt+FdqeK2A1FSdhyB4ZlVn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FwLQ1+lZ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FwLQ1+lZ"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-747fc7506d4so4138991b3a.0
        for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 12:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750102985; x=1750707785; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wt5vEBoX/7CZPzuyH4aIpdA7WQr2k5uAvo+zHY/RWMw=;
        b=FwLQ1+lZvb091Ct/A43xvIzFizEFisvBpPkrUgnBJMN4fAmwDHAFaRceN2yzE5LDV0
         6T7TxMDkIsTyvpQxznA6mKXuOhpk8C8okHgbCrTeqDp1OuUvE0BkEHrr0lrbXUeWDCFi
         +1kzh9xeLyxD9T9VjPCfERb5pujDfelMQ4kSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750102985; x=1750707785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wt5vEBoX/7CZPzuyH4aIpdA7WQr2k5uAvo+zHY/RWMw=;
        b=ptGRXtmXndL9ZUSSx5SYGy7/HgyIYXImRFpWXTINQVcVulv19yY94FwuJPLm/1OqZf
         KBruKRxnbFPfs1d0rmCp3h4sQ0+G1su5MHDIjHu/KrQQqMcyjwvPYrr4Y0L2VP1LvqFq
         dVP2O2lY9E6OalQ3/mKUSpALgQAo4KX/lLmCSdoxIHBV7gA3I6wk6j9DQjjZpkRRZDti
         jS+vUT9DiSh/aXSZcJUJMiFyEw63f4HEYh0u9+VgFO+ohEQuhc/46wFBxxWQMuaHaiPo
         Bon4B1EBYrNkwXfXqeWgYDz18phfOazmXRPvNxuaxkbmzq+2PVEAEwU/31wvVMzntuqz
         HH3w==
X-Forwarded-Encrypted: i=1; AJvYcCW1jC83Ex2CT9ggaWTh5QM/Zi/wvhEUAREP80LrqqkJAL1xlui+dVu1DjiOS34sGsXGE+wdbcyoJJgkZBrfmKw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwM8qIU1RPbWElA9aSkA5jzkeDhZkxWlYX5Qz4iQWPc7TKYSsNb
	KY9+sb+gMIGpn4QFtNNm9gDLIUFJ0L+O2g01f92pVZnU/t7uIaONihaMSyW3LTuZfI+/FPi+Jsa
	WmMxflfoPFXI/Wd1tYVoNc24y8yfAoERTDfZrneqa
X-Gm-Gg: ASbGncsHa+QZZ6NHcvNkmzzJYDtGEtLuhW3DzMIJpZc2vzVlO9hiBB/nzyrq8y9pYX0
	aHs9Noom5yuUPKC1CzXnS9W0U8vNFJEdbLWl/J5PRyHfQvjbro+ZPZoQFIJoJ3CilEFchnDjvOG
	d/o+mPCfQouoplHSCBdz3TGmmyk7DD+okbenG5W4JcRA==
X-Google-Smtp-Source: AGHT+IHg3+dqJWa4H+fZqAabDzILCcABfw73ZiZnurFMysI5YMbqJFlOWJudAKNQbZsNaHnRlMJ68o95/n7AayxSldk=
X-Received: by 2002:a05:6a00:3a04:b0:736:d297:164 with SMTP id
 d2e1a72fcca58-7489cf6aad9mr14779236b3a.1.1750102984856; Mon, 16 Jun 2025
 12:43:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250616133147.1835939-1-akuchynski@chromium.org>
 <20250616133147.1835939-7-akuchynski@chromium.org> <2025061623-ammonium-outskirts-e89e@gregkh>
In-Reply-To: <2025061623-ammonium-outskirts-e89e@gregkh>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Mon, 16 Jun 2025 21:42:53 +0200
X-Gm-Features: AX0GCFtdGIjZUFsa_hlqAkw8MFj1EgMmaIch8V2HBLolVrJ7BiBJkQmysNKbhAw
Message-ID: <CAMMMRMebxSLorxTRzre6MDEn0bdC3hrNVQzZyf0NH=TNUk+YGw@mail.gmail.com>
Subject: Re: [PATCH 06/10] Revert "usb: typec: displayport: Receive DP Status
 Update NAK request exit dp altmode"
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Pooja Katiyar <pooja.katiyar@intel.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, RD Babiera <rdbabiera@google.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 4:15=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jun 16, 2025 at 01:31:43PM +0000, Andrei Kuchynski wrote:
> > This reverts commit b4b38ffb38c91afd4dc387608db26f6fc34ed40b.
> >
> > The commit introduced a deadlock with the cros_ec_typec driver.
> > The deadlock occurs due to a recursive lock acquisition of
> > `cros_typec_altmode_work::mutex`.
> > The call chain is as follows:
> > 1. cros_typec_altmode_work() acquires the mutex
> > 2. typec_altmode_vdm() -> dp_altmode_vdm() ->
> > 3. typec_altmode_exit() -> cros_typec_altmode_exit()
> > 4. cros_typec_altmode_exit() attempts to acquire the mutex again
> >
> > This revert is considered safe as no other known driver sends back
> > DP_CMD_STATUS_UPDATE command with the NAK flag.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  drivers/usb/typec/altmodes/displayport.c | 4 ----
> >  1 file changed, 4 deletions(-)
>
> Why isn't this being sent as a separate patch for 6.16-final?  And why
> not put a fixes: line?
>

Hi Greg,

The issue will emerge only after this series is applied, so 6.16
remains secure as this code is not executable.
I will submit it as a separate patch, with the relevant tags included.

Thanks,
Andrei
