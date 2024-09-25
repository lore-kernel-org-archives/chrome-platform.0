Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACD31369BC
	for <chrome-platform@lists.linux.dev>; Wed, 25 Sep 2024 18:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727289783; cv=none; b=p1fK5x6x+7v4TLo5Ov/L/J625yTp+PIkrBOjORMkQts5x41G9E2ngI22+wGrBBAhnI18/t27leS/QpH2iGrZw1ptvcvC62eBHNGiIs24RHCKzKSc3lxNBLJAZGOb4B3PxK1PjlRIMe0kDRKExpJOZ+18ovrLdHg/0gVBjstsOyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727289783; c=relaxed/simple;
	bh=EUdOiQG2OleCZQP67Et5LONF0k8kIVl/hMckbwTeXrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n00ooi5NKGoMONYjzA3Lymy19KuLKiPNYtvXUHTzB/2eUbpM3HOKyVDNOpVFknFONkTu8WQQmymDt+0heGTwwLs2qld0DZd/xSwZpOemlZJ7Mnx4dYLSn/kwS4PYwajogkdbnSTDWdxGaGC1sP1o4z/weWyWYYvEiPfkO4KOOUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CoyG1apt; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CoyG1apt"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6ddca648c26so8996877b3.1
        for <chrome-platform@lists.linux.dev>; Wed, 25 Sep 2024 11:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727289780; x=1727894580; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kib0b2E/kIKMUjGNhfGZOFLj7ugQLddvx77Aw1BvvlE=;
        b=CoyG1aptHfOaMeVqAMFGjNCyjdwW3BLMutmb/KJiJ3xScqYIvxU9Elm5EKS+gXA5+G
         QSDwJjCO/zk2C0+7IzQgt9bGj5BtnFmoC6p+KusN0XGLFsNHeOffkc3NAmj21lnMvBG1
         6e9A2s5jaJO+N1qED2qKbIWLyt9Mem3FEZICM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727289780; x=1727894580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kib0b2E/kIKMUjGNhfGZOFLj7ugQLddvx77Aw1BvvlE=;
        b=IaQfjLlcNpFGz4S9KDpBsdcGEhZITZcddWioBzZCoENbc153XqXwW8xZSlJgh2SIIH
         HnEpnvWxei5g1plN9WFr5uJFh/BPIxJWmrv0pof83jPgnXacz8M5cRmonsjnQNg9aHgj
         lVbcNNxZhVQFUbXplwfNHChK0PFBaDmBcPrRKWbsgBHzl6uthvlJEHNufFh1TSeiKPh8
         m2vlsYTUMrdtnVNj2aVEDEa+M31SEtKLc5IwrW4X4wooTWfZdAT8BHuEygr3ikOc3kn6
         JWkIw5rJAFEgnIXgHKpu+FZQyIRWk0rmhKxP1XiikYyEQ33rlSGlI0flqyFJrNHWKHnl
         XMUg==
X-Forwarded-Encrypted: i=1; AJvYcCU2KSTxFYs0lQipZahVtwoJvI+5QRcFSdcH28ZcRsSR2O9TVOC93W2ow1vmxHSWonM0S/7uXUOktryd9OUdIoc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxdsOp8Pr1oViNawpngeE+YNLxG/w8PzrcHvsIESMihxhLXZviy
	TqmAyUQk9w3c96XLNCvhW5ToNIZ9Q+ogMVIvAGQmBJjDc0D+fKfxyd9SIX6Mg+wLfH7rvcAft/y
	VTqcY2K+qLtrfl/gg0dNUORkBRfHKBkC4mvoQ
X-Google-Smtp-Source: AGHT+IF/4YIMeETijQEpwOlOjqS/jrOYf+dKzGmAK1z8lWNh0ngpaNQJlCJQ4fw4U65Ebgc8guTM1aUNL05svIWGyWA=
X-Received: by 2002:a05:690c:700e:b0:6e2:1c94:41f8 with SMTP id
 00721157ae682-6e22edc2088mr7126377b3.10.1727289780117; Wed, 25 Sep 2024
 11:43:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925162513.435177-1-abhishekpandit@chromium.org>
 <20240925092505.7.Ic61ced3cdfb5d6776435356061f12307da719829@changeid> <gqceveqpbvmiv3mg5cs3k3qd4rr6fpb3xksvxvdhkugr52paoj@olks6bqjc436>
In-Reply-To: <gqceveqpbvmiv3mg5cs3k3qd4rr6fpb3xksvxvdhkugr52paoj@olks6bqjc436>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Wed, 25 Sep 2024 11:42:46 -0700
Message-ID: <CANFp7mX0=9qHb8_UotKjDo8rGemA7L+NGp3J+qSzBg_9Pp2CTw@mail.gmail.com>
Subject: Re: [PATCH 7/8] platform/chrome: cros_ec_typec: Thunderbolt support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org, jthies@google.com, 
	pmalani@chromium.org, akuchynski@google.com, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 10:13=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, Sep 25, 2024 at 09:25:08AM GMT, Abhishek Pandit-Subedi wrote:
> > Add support for entering and exiting Thunderbolt alt-mode using AP
> > driven alt-mode.
> >
> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > ---
> >
> >  drivers/platform/chrome/Makefile              |   1 +
> >  drivers/platform/chrome/cros_ec_typec.c       |  29 +--
> >  drivers/platform/chrome/cros_typec_altmode.h  |  14 ++
> >  .../platform/chrome/cros_typec_thunderbolt.c  | 184 ++++++++++++++++++
> >  4 files changed, 216 insertions(+), 12 deletions(-)
> >  create mode 100644 drivers/platform/chrome/cros_typec_thunderbolt.c
>
> This patch looks like nearly exact 1:1 copy of the previous one. Please
> merge both altmode implementations in the same way as tcpm.c does.

It's easier for tcpm.c to have a merged implementation because it
simply forwards VDMs to the internal state machine to handle without
doing anything with them. Our implementation is closer to
ucsi/displayport.c which needs to maintain an internal state machine
for DP and TBT VDMs and respond differently.

I can merge the two but I'd like to understand intent (reduce code
duplication? reduce the number of files?). As it is, keeping the files
separate makes it easier to understand how each alt-mode operates in
my opinion.

>
> --
> With best wishes
> Dmitry
