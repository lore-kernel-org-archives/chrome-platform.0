Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509A214A4F0
	for <chrome-platform@lists.linux.dev>; Wed, 25 Sep 2024 21:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727299229; cv=none; b=PIAMsRniv7a9bGbiW22Bluu/HETtsI2whMILyYWtr9FbxaK+pLJMlkZzLAKDKuWt86gxHhnn280RzA+wU5BN9A5prkwBo0+nON8CcKOwDPsxlaDz2CT6S8uvpYBhISzYkERqZrkaBivS7ex3daJKxGF23GOymkJY+QjbskGhVE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727299229; c=relaxed/simple;
	bh=Qhca8aXwASzA52qlSc2EwlB3ylWt+AImaIw3ntnxQ4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o933XWTzFF2/R4KR/BaF5MNQAJoBfsU1FI3qO8vCJTZ2cxfUg0jjUoxQby8nz9Np5/riKakfooWFHAQf2Wwn74uEio4K25MVtIFUshp6gvwoptshRiMsNw6Z7Bi+1sN6mvh37CQKsDg0Zn8OguTEempJW/ut7swrrGFaWTg4loI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wx5gx81h; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wx5gx81h"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53568ffc525so416118e87.0
        for <chrome-platform@lists.linux.dev>; Wed, 25 Sep 2024 14:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727299225; x=1727904025; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5ikqskVacaiYlGqYTtdMd9WM+WdS9gWd86sHASES6xw=;
        b=wx5gx81hHeXvbeMuL6mTzRNob2L6l5bjmp0VjmeTgFJ8iTs4F6nB3eAzwAfxl/k/r/
         DAT1zF1GZ3kMBHJ48UTSYi/QZng6VTXXZLFJ9uO6ODCjWBacUiUDLxgyuI4SrAEew5NA
         H2uOP1Uy+FPQS5SM+0WJbqFYCRLL48ywg4m0ND5mriZWFviVkTTYz4Ugr/Xh1OP2Z2ui
         e/ZX509/JBiKa0NzzY6MMmvY47H7yzY7O/8kqPQvecURPefTpGIlugzmazCTbT10BjZz
         79vQDu/KbP5w/FIyJpZIDfWXwT4epUmsOJ7SqekxuSikH4oj6etkCGA2u4fGGVaPppul
         EcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727299225; x=1727904025;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ikqskVacaiYlGqYTtdMd9WM+WdS9gWd86sHASES6xw=;
        b=Hoz1h4Urkqk42QLiI5R24o7r5VpdDTqvH1zHuFi68ykhSyXbVCUbYdm943Mx7+m9Qh
         l6jJ8UbQft/zTOwsZQbgqjK+ebHnAVGTzOvHV2P9+s4JCog+rtzblJtdiPydLw5Hz7pt
         Av1WSdMDQjGmRb4Q4c7L5uLMYs6mYBHpbMiLcEfMea6pMzexLi+SuRAWFMKE8BUMBpAP
         4DPhofTpOgSHbnYQPDv4csLFl9wGlZWLK9g6WbJaZw33Y3x7RDYanGRsvDnPft86UBx0
         YuyFx41JYqI+sicRsz6zZG3EXMZ+Eza5efaetbIX9VRvU3HuXbtD5kKHF78pKTgLfh82
         FbgA==
X-Forwarded-Encrypted: i=1; AJvYcCXtW1mFYMObiWZs5CuZnUJQMWqCe+UJdXSR4CSHGOn5QrpJlru0x23auUdLSH99XBxeyOx+pxLYSJyNvrTqyME=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUVmFYf+mWtsDWoutGtRU/ALeJRkBLJgPVJOzygU4kopA0aDad
	uN/kHblCc+pJ4P+zZSfJg9YlNzN38zvSqpItGQo/3jYJgDBp5sv9y9Y2tssMBW0=
X-Google-Smtp-Source: AGHT+IFIwZzp5H6Akje3OgBbwgOTHgQxfddQGj0pEjO8YqbK94y5DOh3cQpldsUfZpC4ahcgtm8E8Q==
X-Received: by 2002:a05:6512:3083:b0:530:ea60:7e07 with SMTP id 2adb3069b0e04-53877568f5cmr2200879e87.58.1727299225256;
        Wed, 25 Sep 2024 14:20:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a864d56fsm616189e87.250.2024.09.25.14.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 14:20:24 -0700 (PDT)
Date: Thu, 26 Sep 2024 00:20:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org, jthies@google.com, 
	pmalani@chromium.org, akuchynski@google.com, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] platform/chrome: cros_ec_typec: Thunderbolt support
Message-ID: <pl6xv55ohx3jprgc67umftjrwzlvass75d2pqzzdnktvt3njxh@gbujd5qf3tpz>
References: <20240925162513.435177-1-abhishekpandit@chromium.org>
 <20240925092505.7.Ic61ced3cdfb5d6776435356061f12307da719829@changeid>
 <gqceveqpbvmiv3mg5cs3k3qd4rr6fpb3xksvxvdhkugr52paoj@olks6bqjc436>
 <CANFp7mX0=9qHb8_UotKjDo8rGemA7L+NGp3J+qSzBg_9Pp2CTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANFp7mX0=9qHb8_UotKjDo8rGemA7L+NGp3J+qSzBg_9Pp2CTw@mail.gmail.com>

On Wed, Sep 25, 2024 at 11:42:46AM GMT, Abhishek Pandit-Subedi wrote:
> On Wed, Sep 25, 2024 at 10:13 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Wed, Sep 25, 2024 at 09:25:08AM GMT, Abhishek Pandit-Subedi wrote:
> > > Add support for entering and exiting Thunderbolt alt-mode using AP
> > > driven alt-mode.
> > >
> > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > > ---
> > >
> > >  drivers/platform/chrome/Makefile              |   1 +
> > >  drivers/platform/chrome/cros_ec_typec.c       |  29 +--
> > >  drivers/platform/chrome/cros_typec_altmode.h  |  14 ++
> > >  .../platform/chrome/cros_typec_thunderbolt.c  | 184 ++++++++++++++++++
> > >  4 files changed, 216 insertions(+), 12 deletions(-)
> > >  create mode 100644 drivers/platform/chrome/cros_typec_thunderbolt.c
> >
> > This patch looks like nearly exact 1:1 copy of the previous one. Please
> > merge both altmode implementations in the same way as tcpm.c does.
> 
> It's easier for tcpm.c to have a merged implementation because it
> simply forwards VDMs to the internal state machine to handle without
> doing anything with them. Our implementation is closer to
> ucsi/displayport.c which needs to maintain an internal state machine
> for DP and TBT VDMs and respond differently.
> 
> I can merge the two but I'd like to understand intent (reduce code
> duplication? reduce the number of files?). As it is, keeping the files
> separate makes it easier to understand how each alt-mode operates in
> my opinion.

Separate common code and AltMode-specific code. This way we reduce a
risk of errors fixed in only one of two drivers and at the same time the
driver clearly separates common vs specific code paths (e.g. VDM
handling is mode-specific, while the rest of the code is common).

> 
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
