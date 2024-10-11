Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2964320B1F3
	for <chrome-platform@lists.linux.dev>; Fri, 11 Oct 2024 09:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728638265; cv=none; b=hpaty7mWx0nKqWgtCR4PUacZ8Wc2YPLJP4C4uYi42JUj49iYJ7EA6crXi50iiMABjVRJKa7qflc3Xu1ahTCQwfAovH6I4pqM9fPgfzmTk86jszn2nM5Jz+gUEC5MXkySTxtCunrVZ3jeFJkpAmbUSs6FqmAx9c/5rV/zt7Ymt30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728638265; c=relaxed/simple;
	bh=V9h6cgSSqmieE+yzxyNDuxnhwPi8c9hh6sKJaUBekAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B4R5RDvRcVRDv1YMWVtfAwACDl5zp8VUI5beomDqO3g7cSD0r9NhuuTJ8CkjpB/duyMFlIScVXsuw2yBGp5KUuOUEpr4WpVbUEVQrJ0UJKbJkkz33vwrDK3fftbl/IuY9ODCA6vvkRt9x+grAFRNqXHizVolnMlzfBQGtoCnc+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LDowcO8F; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LDowcO8F"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5398e58ceebso1682090e87.0
        for <chrome-platform@lists.linux.dev>; Fri, 11 Oct 2024 02:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728638262; x=1729243062; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bvx+E0BfVubWu3gLirJRL/C2ZUBQEvuq00nmWeP4ig=;
        b=LDowcO8FD3UafjNZWlHP6gKT1xtaRGGpqQj8qghBOD1CR9qhb86aLPKrLRqqFNZUoJ
         lSMvk5MzxP9H/vikCSE1Sd+Rm17/2i4rX4jm1KiIMduOD1IPQUNvPQ7EpNDaOSoGEdKY
         8AufbT+zgMtma1XIT2hcHMey0jWsHKLRhMUEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728638262; x=1729243062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5bvx+E0BfVubWu3gLirJRL/C2ZUBQEvuq00nmWeP4ig=;
        b=oGZSpAq9BuD5JWyf8zQtpDSqt6rniwYoMLV25yHfL6djhWD/RMi+fsi0GewOffFpyd
         tPgF0SBGthku7Y7OObvl8gk4Hyii6GIso4FYJYppxMTvE86ztbWL+lJqucLfh7lhYY4/
         eHMI/+ueSa12mu+iCFz7cxaEK/v3EdtQPdxdu4WobplzDktr0M7XwjgJz6h5bDkvioII
         P9dX0yeaDYdR7YFnPgS6FW/c469NvLaCK1cUOSaXG/BGqB8JYEMdZbLenf59vqK5C174
         rYMxaZgfANJdSSW0UhVN32aqZTxhJ1kW6nlhT3kKVm7xUin7iBlqsFIautjwEM1WuV9P
         gcDw==
X-Forwarded-Encrypted: i=1; AJvYcCVFM6oGlnjc1OBpH/WFCNn4ELuN2Bma9SJUOgoXKi1jBmnzXlLgsffMPU7dpDQNPjrjHEhRqqicxLuQUgKlKXo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtymSj4KHabhm0XVaRn+R1hyABCdNlOFDrPipy6lDGSPlEVOVQ
	6r3LxaHRPlFwpchUHoWmr0mhqrOWiukrV6m9A7dZC+1J7ejGUspOIJSUdvy7dJMAVsE2ikzhcKX
	6jd2xCI9zIoKysRdZjudent3qdD4VqyBhQUw=
X-Google-Smtp-Source: AGHT+IGbKIDooOUp44Dp2/Ke0uZ1PFLO3OKJDqp68HHC1zVKST5rQFT5XZOGMNfgKFhE8FDRc1+NwgIMZ6M6pmCv5Yc=
X-Received: by 2002:a05:6512:3e29:b0:537:a82c:42ec with SMTP id
 2adb3069b0e04-539d6c3d692mr655770e87.4.1728638262131; Fri, 11 Oct 2024
 02:17:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240910101527.603452-1-ukaszb@chromium.org> <20240910101527.603452-3-ukaszb@chromium.org>
 <20241011072752.GL661995@google.com>
In-Reply-To: <20241011072752.GL661995@google.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Fri, 11 Oct 2024 11:17:31 +0200
Message-ID: <CALwA+NbX=r964K+zKp0OnYb75W8dP3aMhVZEawbWLzafK3k9eQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/8] platform/chrome: Update EC feature flags
To: Lee Jones <lee@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 9:27=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> On Tue, 10 Sep 2024, =C5=81ukasz Bartosik wrote:
>
> > From: Pavan Holla <pholla@chromium.org>
> >
> > Define EC_FEATURE_UCSI_PPM to enable usage of the cros_ec_ucsi
> > driver. Also, add any feature flags that are implemented by the EC
> > but are missing in the kernel header.
> >
> > Signed-off-by: Pavan Holla <pholla@chromium.org>
> > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > ---
> >  .../linux/platform_data/cros_ec_commands.h    | 32 +++++++++++++++++++
> >  1 file changed, 32 insertions(+)
>
> Looks as though this is only used in the MFD patches which breaks
> without them.  Can I take it without sending out a PR please?
>

Yes please take this patch.

Thank you,
Lukasz

> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
