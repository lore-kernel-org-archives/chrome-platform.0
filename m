Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3247F74BF5
	for <chrome-platform@lists.linux.dev>; Mon,  8 Apr 2024 13:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712581479; cv=none; b=cmuWS8o16TFGv1ov2oRD1b1sin9pw/s6b+YO9RU3nhyVaOsKNd57o9HwoD1YuP/Pe1+QX8k36OiKopwHIpesyuY/JLzufEHAG0BXcMPy6gPSudEkHjljH+PNua3dHnx1SFBzDuYcheVUY0I5iwku2zI9Mz2wrAtR88QP2OiDwOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712581479; c=relaxed/simple;
	bh=7bpRSGGPDQCS7wFqBB78vDQoO6pcgett9EASBZ5btWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kreP4RidDVCafM9ON+lTX0bKbHmRKGg4K8B/LbDCemu8J0gEf9f2nJbDR/Hqj0Z9R0dnNY7Gw8p6HzMqH6LIfxejjfl0HHYIj9wA14KIsswvcqvKSvebWSEde1E7uuviajZi1plsS2CSz0AbviVlJOvLg2uojKVGmYlxrb0x1mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O+pjL4yq; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O+pjL4yq"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-43477091797so344161cf.1
        for <chrome-platform@lists.linux.dev>; Mon, 08 Apr 2024 06:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712581477; x=1713186277; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVioy9EMNQnc5SXcQapeY7Z9K+iAa8Z5L7a/jg+l4cY=;
        b=O+pjL4yqKuxBFDVADx7BiiPxAWDe247JfUmwsRqZNjqmLm74310HIZmcJEeVzPiL6K
         TTFk8O3rvG1LeMzKTAuZxGl6tjcavOH9Ae6VxBWclmjr3jIBZffZrTRrQXO2SqIbEoHv
         ZUPYFR3KcyxL2a8Loq/Pk2FnG1uof6kVjKqavGdilP6TDCPEKAoMuG1rL4tK2naDqQkv
         QvhfpgNrhDCVYmYsKfOxurLC+KyC1xmbOllDJX3lIFQ5TLI+nHNLfoKZq04MszjvZzQ4
         QKRUB2VnbIIaMcAXOJMoI3D2+ZJcDKP3/T+9iycOU8WNM9FxzFHKe4nsKDm1G+JDwYhl
         h5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712581477; x=1713186277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TVioy9EMNQnc5SXcQapeY7Z9K+iAa8Z5L7a/jg+l4cY=;
        b=jV2eBMWbi+bM2qC1FShN0/q3bZNTmmnYFQmIGtknZgmRBeZrFXh6vfrdWVuw3Gw8v0
         g13T9hF8pMOo1QM0yJZecqlVEpBhcbwNSZ5LR1mah+xMHHzsHF7VRnTB5VdnJeMtmiJN
         gNDUBE2jNfa82OHtZdqODgYU4j5qSwPVVTdMW4can9nUPd7m44nOzhgV6NxtpudKc66c
         Hri6bfH9x3n9iDAn90Ju6zDzLBuiBsOtmNXKQSVbczeGWmg53piZJa+6qy3cuHLSgEgu
         6RGvW42aDCo6isWRIK93WoPRtIl0VZkJpp2FMFP6nlabvIm/gOubAZRBrz9pM6yrmZOl
         cajw==
X-Forwarded-Encrypted: i=1; AJvYcCVD+2J8UUz/9IwBHwd05iqVYJ4v9XHLFwgrCnphkbW+c88zL6e1fQiRUuciVOfxHibqWMsMNuF5Y2h4iw1tPxJfzKguC5aqFRjlf3jXGciZ
X-Gm-Message-State: AOJu0YwOyLn5SCjA67FQeisp3Xl+Kq4JUQYQxZARi2C/lBqy4gKyb3yK
	S1wmFirDt/Xvb95WV4IxKrIPpKSF/xIuoZVrZS0EF4ZPoZchzg3EgrURsC53cZfD0WHWEz8+Wcv
	KL0RvHtXer2j/paQ5No2OzKVV11GEEZrW+zzj
X-Google-Smtp-Source: AGHT+IFZaV9W1guyCiCFvlxL0Tuf2HLr1fiYCHIb/nvtokprZt499aOhX2wlCRAmDZ6qHpx8t/vS6dcU4G703dCeYVM=
X-Received: by 2002:a05:622a:4812:b0:434:7bb9:f231 with SMTP id
 fb18-20020a05622a481200b004347bb9f231mr343464qtb.12.1712581476934; Mon, 08
 Apr 2024 06:04:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240403-public-ucsi-h-v3-0-f848e18c8ed2@chromium.org>
 <20240403-public-ucsi-h-v3-2-f848e18c8ed2@chromium.org> <3ezjocthsigo3t746slmgzffnmpxw7wwf3s535basiaf2qy6io@7ocxva6ndsbt>
 <2024040449-average-foyer-defa@gregkh> <oi3bwdyvyaezpmyxfdtsbiwwprxi2ufc3hlzoz23d5rxdkperl@cxpd7enatg7h>
 <2024040422-ripcord-bladder-bdda@gregkh>
In-Reply-To: <2024040422-ripcord-bladder-bdda@gregkh>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 8 Apr 2024 06:04:22 -0700
Message-ID: <CABXOdTeqz5Kza5tYXbCdTyPT66xtezai4C5TFkqmOpQc+1r8Xg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Pavan Holla <pholla@chromium.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2024 at 6:30=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
[ ... ]

> > > > if (WARN_ON_ONCE(val_len > MAX_EC_DATA_SIZE))
> > > >   return -EINVAL;
> > >
> > > So if you trigger this, you just rebooted all boxes that have
> > > panic-on-warn enabled (hint, the HUGE majority in quantity of Linux
> > > systems out there.)
> > >
> > > So don't do that, just handle it like this.
> >
> > Does that mean that we should not use WARN at all? What is the best
> > current practice for WARN usage?
>
> To never use it.  Handle the issue and recover properly.
>
> > I'm asking because for me this looks like a perfect usecase. If I were
> > at the positiion of the driver developer, I'd like to know the whole
> > path leading to the bad call, not just the fact that the function was
> > called with the buffer being too big.
>
> Then use ftrace if you are a driver developer, don't crash users boxes
> please.
>
> If you REALLY need a traceback, then provide that, but do NOT use WARN()
> for just normal debugging calls that you want to leave around in the
> system for users to trip over.
>

That is not common practice.

$ git grep WARN_ON drivers/gpu | wc
   3004   11999  246545
$ git grep WARN_ON drivers/net/ | wc
   3679   14564  308230
$ git grep WARN_ON drivers/net/wireless | wc
   1985    8112  166081

We get hundreds of thousands of reports with warning backtraces from
Chromebooks in the field _every single day_. Most of those are from
drm and wireless subsystems. We even had to scale back the percentage
of reported warning backtraces because the large volume overwhelmed
the reporting system. When approached about it, developers usually
respond with "this backtrace is absolutely necessary", but nothing
ever happens to fix the reported problems. In practice, they are just
ignored.

This means that any system using drm or wireless interfaces just can
not really enable panic-on-warn because that would crash the system
all the time.

Guenter
