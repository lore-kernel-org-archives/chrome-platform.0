Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5B86E60E
	for <chrome-platform@lists.linux.dev>; Mon,  8 Apr 2024 17:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712596341; cv=none; b=DeF0U3O15NbUrlPJz+vzxL9Qxrg4Aq1u5Yc7FPa9TyMg59exbPmrNNmbFXIl2Z91pjB/i1gHkDNGFRf7rBvN88CwMB1SZoDyWZ43QGrk2L3KUQqV+In4eP+GVpBizpXShK03HXfiCi30meBJXp8wsFkWgO0D3OHgFL1TgUk6XAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712596341; c=relaxed/simple;
	bh=oJ9mT+vwINWrYV759TkgfgMbkpyg67bL62cpIdVNlF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MOxEZy+ENGvSKL3mFsYfjwSxiv40L02MQw8DQoXWBdPzhUeEtSPpToWpHgNkot2H+JvBkojtxKVr9+PtZ5w39tSwGlF/9yERtnYipNCnfubEIJxEYP2bx24lU0TyWG1E34VFHcv0rOGnTDfrZsET9eqgBA0ZSc+AZ7OLiq8bq2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ruZfXEx2; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ruZfXEx2"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51381021af1so7543958e87.0
        for <chrome-platform@lists.linux.dev>; Mon, 08 Apr 2024 10:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712596338; x=1713201138; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T8TRMrj5ggtPr7yueS0y7TsmLoLHnTwJgZ1LoVKqCBE=;
        b=ruZfXEx2abUQnRfv1NpIhJ3LpcPkNQqCmPB50Y/m/wGT4vsLjStRD4iEKdAJgG6wuN
         S9HV6TIHJj2kF2BDZ3JHrXt12thZ7fO4cEymOWL8uWpmaLO2SFUZtSZdZVW+szKNYtzK
         wQb2DtXskUKu2CGn7iFxtvgd3jepeid2ckxw8vNJJOyMZYsPv4jxUHNRFnH56232kMVq
         P4zip55dFzaApBF4HcHstKvv81r78CjD+OKvWS43CPpSMnG+2usNkw9kZRiwJJPSodIf
         nyk8XyoBOI8lh4DHyTtRZdk8u2NrVMvw4zI2mSIHQKuZVU+xtz1SVaFT+w2PUFnmttX+
         1IDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712596338; x=1713201138;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T8TRMrj5ggtPr7yueS0y7TsmLoLHnTwJgZ1LoVKqCBE=;
        b=Nm5fRy3O/uGBRu2mdF5gQd92PolpTpxYL/XsuSiF8oMAmKoHBRdfXVGBv2XIIS3zZL
         hYhaP+XIwh4fcSOL11NoLVSVTXEIMhvIHXWO1INKlJdx6DaVHJ+xl5qiaDRz/JnVetCE
         qyQSX6rTLUkvoYoL9zZ1ml6+PvLrWh7fuvAOmWM9jjySfS7cJrtef79lCmZrG9TuMAjg
         AWiQji4T/ykW4DP63UB4PAukthRn5F4iPyW5Onrtpc2B59alMq5l/OWqbQZIkTJGDxTY
         gv5pyqX8nePgZsr9sqSd53E1GpN/9O2ITsK/pDJo75tRrRMZ1mZThGEtgQVGic84q2UP
         7VwA==
X-Forwarded-Encrypted: i=1; AJvYcCXFdcC6LxNKxKyvX94GH1wl6OzKyYWxNnzJXW2KXPpcnEn5NsFIt96FIUTMk7vuchm/Qil2lKno97JtcqSXrdMUUqiR/nmQkm1T47oUjC4D
X-Gm-Message-State: AOJu0YwDUzXu5tf4e4y6yojzw9G4VnkANUhSh0LntCCWAjp6X66PZMOY
	X4aP1rvtl+TLyxC1Kw9+n/4Buhjod90WPS/8yJGW3ncspMAxOSnlBdyhWZ4/Afo=
X-Google-Smtp-Source: AGHT+IHfa69MVbZoX1KR17DtI3oUMVnY5gNXSX0c37nh4zmNkLTwhqWTjIaOwFa2GYGnzTRLv8lHXQ==
X-Received: by 2002:a05:6512:52b:b0:516:c1b9:316b with SMTP id o11-20020a056512052b00b00516c1b9316bmr8096374lfc.15.1712596338037;
        Mon, 08 Apr 2024 10:12:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
        by smtp.gmail.com with ESMTPSA id k6-20020ac257c6000000b00515cfc0e324sm1231930lfo.237.2024.04.08.10.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 10:12:17 -0700 (PDT)
Date: Mon, 8 Apr 2024 20:12:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Guenter Roeck <groeck@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Pavan Holla <pholla@chromium.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v3 2/2] usb: typec: ucsi: Implement ChromeOS UCSI driver
Message-ID: <txdq6cmnep2zokrwykdsnpho3k76pangzxbv7ydxpdnyohczxo@2jc4cyakrmez>
References: <20240403-public-ucsi-h-v3-0-f848e18c8ed2@chromium.org>
 <20240403-public-ucsi-h-v3-2-f848e18c8ed2@chromium.org>
 <3ezjocthsigo3t746slmgzffnmpxw7wwf3s535basiaf2qy6io@7ocxva6ndsbt>
 <2024040449-average-foyer-defa@gregkh>
 <oi3bwdyvyaezpmyxfdtsbiwwprxi2ufc3hlzoz23d5rxdkperl@cxpd7enatg7h>
 <2024040422-ripcord-bladder-bdda@gregkh>
 <CABXOdTeqz5Kza5tYXbCdTyPT66xtezai4C5TFkqmOpQc+1r8Xg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABXOdTeqz5Kza5tYXbCdTyPT66xtezai4C5TFkqmOpQc+1r8Xg@mail.gmail.com>

On Mon, Apr 08, 2024 at 06:04:22AM -0700, Guenter Roeck wrote:
> On Thu, Apr 4, 2024 at 6:30 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> [ ... ]
> 
> > > > > if (WARN_ON_ONCE(val_len > MAX_EC_DATA_SIZE))
> > > > >   return -EINVAL;
> > > >
> > > > So if you trigger this, you just rebooted all boxes that have
> > > > panic-on-warn enabled (hint, the HUGE majority in quantity of Linux
> > > > systems out there.)
> > > >
> > > > So don't do that, just handle it like this.
> > >
> > > Does that mean that we should not use WARN at all? What is the best
> > > current practice for WARN usage?
> >
> > To never use it.  Handle the issue and recover properly.
> >
> > > I'm asking because for me this looks like a perfect usecase. If I were
> > > at the positiion of the driver developer, I'd like to know the whole
> > > path leading to the bad call, not just the fact that the function was
> > > called with the buffer being too big.
> >
> > Then use ftrace if you are a driver developer, don't crash users boxes
> > please.
> >
> > If you REALLY need a traceback, then provide that, but do NOT use WARN()
> > for just normal debugging calls that you want to leave around in the
> > system for users to trip over.
> >
> 
> That is not common practice.
> 
> $ git grep WARN_ON drivers/gpu | wc
>    3004   11999  246545
> $ git grep WARN_ON drivers/net/ | wc
>    3679   14564  308230
> $ git grep WARN_ON drivers/net/wireless | wc
>    1985    8112  166081
> 
> We get hundreds of thousands of reports with warning backtraces from
> Chromebooks in the field _every single day_. Most of those are from
> drm and wireless subsystems. We even had to scale back the percentage
> of reported warning backtraces because the large volume overwhelmed
> the reporting system. When approached about it, developers usually
> respond with "this backtrace is absolutely necessary", but nothing
> ever happens to fix the reported problems. In practice, they are just
> ignored.

That's sad.

> 
> This means that any system using drm or wireless interfaces just can
> not really enable panic-on-warn because that would crash the system
> all the time.

And this is good from my point of view. If I remember correctly,
initially panic-on-warn was added to simplify debugging of the warnings
rather than to disallow using WARN_ON(). The system is not supposed to
continue running after BUG(), so panic/reset on BUG is a safe approach.
But the WARN is different. It means that the system was able to cope
with it. And as such there is no need to panic. Whoever enabled
panic-on-warn is doing a strange thing from my POV.

-- 
With best wishes
Dmitry
