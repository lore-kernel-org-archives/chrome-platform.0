Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAB71CEAB5
	for <chrome-platform@lists.linux.dev>; Fri,  6 Sep 2024 13:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725630801; cv=none; b=O4WCBuZ6wOJyN1HehcYO+qXLOFy9Xj3t7Zr/5ah9nk/XKUqWalpBEK90ovDzOUmUEThhlZWp8OO/Ebouc7cX/hPsFMqc9hV3tHvFCTbu2raBFlmxBb8CWItRb34Zw65UW3GXDI7H1u7KS8oes+QCRZ9Hw2mdjnKDZdWJH1Yh7H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725630801; c=relaxed/simple;
	bh=Em8bvn/f2H5KfpZ0ThOOeCWybP6uMU6Mon9pWOSdXgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fjGTYeWAWN9+NPv85hCODULgEjRIOgD4+RUlyQj+lXGCUQ9HDTxg0EeB9Zezl6d5wLY+rwanFwjBO/vkNk+F6J+jjy2wbUPOuisWUixdWs7CwACl8gCTyISNCVWnodZ7ePPoQrX5kvolv7vl/dHdmmE0JePHgcYNXpi5g99UX8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ogya3Lch; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ogya3Lch"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5333b2fbedaso3582462e87.0
        for <chrome-platform@lists.linux.dev>; Fri, 06 Sep 2024 06:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725630798; x=1726235598; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiDpLiwQWRQKgEUyDLSR0/UKgRFrC686Eaq4LU0p0Rs=;
        b=ogya3LchoPxWlGU36NCk4I3ywOFFNMV1PHAtXwUaJKLzeqWYcvUluDqloyRxh48IK+
         fcQHHKPQRqi9TzsPMqweFlJCbEDLZ7NgPcNFUl1T5rDyJkwhL+0Arg9xviHrS6lbAwYd
         fq+0VivBPUu67CWfavxow9GBc4tMgB7bXFAGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725630798; x=1726235598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oiDpLiwQWRQKgEUyDLSR0/UKgRFrC686Eaq4LU0p0Rs=;
        b=U4xnrmGTNgsZ3qVYyuphlfX17Y0axk70CTyN62nFFV/fjZytQTPQFip0PBbUoGTgGX
         6D9BZBkuqFB4LngplxBOqibbplOFHsVPsHO5diIhbUbq8HWcnwspoA3zi8gRaAi5GMKL
         ftOVytU3xAy2S4/v+5cSAYHbiwlr4mGI8NveV32OSEMAttwx8/KIlDnLKS7w09F4sNgo
         aJH1MEuZg+g1sS48c5Bk97QmFd3w1+YBaQX4BqQ/CPWC/tL5v7ES37B88sP+RND8dmOp
         7uQdTCwE2SvFUkAQO1ndvFOjH4aqBMLJ08jz9WFp9u/ElAyvMRQM1KTp3Y+b3+N8gnEH
         cWEw==
X-Forwarded-Encrypted: i=1; AJvYcCVru/cuXY+y4QvV6/iHlVvs2uNMGwpYqlrYEpMrCvCJYyQn3JVBauvScfB7xcIDXqPPrZw2jmbqkJC7J3fNDWk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1NvoNA5LtNKiE5tTW+nQJ/NzXkdTkoLD3LB3r+/ukCZmHa4s8
	oxyW5epOi0DShNjgBjTweTrGPlcUEErEdfiiv8zWvIOSVojK8HdO2Q2WnHwMF47vYUuPIwBJWF8
	IPH76CMDjD/sO0t9Ueoe2JES5lu9/STjOnkQ=
X-Google-Smtp-Source: AGHT+IEw61CvBBoRPiccYSMUEy0oGgYCG2GgCkWOPBK65MyPZmUJ6aZypgSS1/nrR6LwN9Rq/SX47iUq960J99ro+zE=
X-Received: by 2002:a05:6512:a92:b0:52f:d15f:d46b with SMTP id
 2adb3069b0e04-536587abfa0mr1738029e87.14.1725630798085; Fri, 06 Sep 2024
 06:53:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240903163033.3170815-1-ukaszb@chromium.org> <20240903163033.3170815-3-ukaszb@chromium.org>
 <ZtrA8y0266RTm5Z3@google.com>
In-Reply-To: <ZtrA8y0266RTm5Z3@google.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Fri, 6 Sep 2024 15:53:06 +0200
Message-ID: <CALwA+NbiW+Gt9fi6Y+_xJFUEQWZFp5cvB5kqw_LVd4Mcf03Xtw@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] platform/chrome: Update EC feature flags
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Pavan Holla <pholla@chromium.org>, 
	linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 10:44=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Tue, Sep 03, 2024 at 04:30:27PM +0000, =C5=81ukasz Bartosik wrote:
> > From: Pavan Holla <pholla@chromium.org>
> >
> > Define EC_FEATURE_UCSI_PPM to enable usage of the cros_ec_ucsi
> > driver. Also, add any feature flags that are implemented by the EC
> > but are missing in the kernel header.
> >
> > Signed-off-by: Pavan Holla <pholla@chromium.org>
>
> Same as previous patch, it needs your S-o-b tag at the end.  See [1].
>
> [1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.ht=
ml#when-to-use-acked-by-cc-and-co-developed-by

I have not added any modifications to this patch. I understand that my
S-o-b tag is not needed in such a case. Is that not correct ?

Thanks,
Lukasz
