Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31DB1581F0
	for <chrome-platform@lists.linux.dev>; Thu, 13 Jun 2024 18:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718303692; cv=none; b=df+a4rm5AtKKHNpGK9/S1bORz+M3+EVpIgjpxkjhgyqI77FjYXzjqzC/wMTmOp/g9dpSBaxj5dDU75VK+X2IXL5ilYH5VDs9xv1+rylSXi8xy4DDOmsl/CloQrPy7NePiD1f2hpCFm2V6GDpnc2xs+qFafDquW4S9ou0/Gteu98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718303692; c=relaxed/simple;
	bh=HzYejYuOAn5iwkrueS+PiiRJuMEgvDnHU5MUoSEiTXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQ3ET2dnrcSPTZI8FDV181oFRYix9O/LPn443R65NNBvfrDhTgWKaMq2C7GA9Gs1bV38JdT7wGMzCNMDqa2eNtAYZrMz1cb1mxyEopAaTZd1R56cwyBbAD9+tUCTMF5ydKx59hgjOkh8lljk+iEgHypp4PADyxasDOYTwgHedAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UTNacAgF; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UTNacAgF"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-421798185f0so11925885e9.1
        for <chrome-platform@lists.linux.dev>; Thu, 13 Jun 2024 11:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718303689; x=1718908489; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+98BqI659caT5fQyMNy5nW5CXfFil4jPP9JHzeqpioA=;
        b=UTNacAgFMe9Qa6qVPWcEucFaEK13MB3IWyazXp3dGuxCqpfOucal5zeFFvi/sR8Nn4
         /V//LoK2kGMg3ye/X4hi74mrLtg0dRBR8XcbnNsSXZHVZZgVWG6Ei7xNfBTsAY31f5y2
         csPPOCOBw3PT6P1RVC1EJBGSIAdR1FUEZYFC2UiMmsuYYhuKdanS9yKEqJGZCIF0XVPE
         gvLvrnZw3JS6zk4p9kfz0YBVXLRlakwMYCo8YoAP+vsOW46b8FdJh6su6cvHVKsCVvsw
         FsR1o4incsKLVxliLDSvokekvY4xMrs4DIyoyANAl4BokGGDgLTz28IOCE4S3nYVtv0P
         P1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718303689; x=1718908489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+98BqI659caT5fQyMNy5nW5CXfFil4jPP9JHzeqpioA=;
        b=MyXJ95OOudTfWRNEsLDCIL0G8k39xawQb1o80wLy8NU/bTFVVAc7MC0H1k3q3zEQ0V
         lSMTzypq/6zlmjFf8Q7dRm2iRXh6p707Rm9bb2VWX0nhGkpypELkt4CBgGlVVp6k/Uwf
         F1S93oNsqtNF+w6S8z3bdJ83Mxt76+E6nWKoLQCD6QZNqhwkHQko4ueikMduJtoKJm/v
         a1V1VMDxaPYQI5NXkIBjPQC0UMKpCQdHJbOPb4cftwXrZkwp/LwRwJwtLnp7Pj7cfRrz
         e8LttjeqXk5ynHPMJMWlomjJTdN48r7kOt8LqE/ahvX2l2Euwz0BM2+XEnhF/VixgyE4
         xSPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3jFAHTTkSFgLtzv+lsZ0vBzVTuWx18L3DJGZP6kYmAm5c/CjeHkpd7u774hs4aZFTMRZMgSpM3eIkc716kqAWHhRqKY1ZKTBzlNE7eCQU
X-Gm-Message-State: AOJu0YzUHNTCmV89zM53I3nc0hwESUAfilLmNG57U/l3soXFe6qvqXzy
	/am3bap59LbE06JxUZka16YeGMnsq4NmZeNuwkYwfMMZtPCfCbRB0pbFbIG4yBE=
X-Google-Smtp-Source: AGHT+IH+s7hcDwfwjXdg6cobQ343oD9A/3tP8Z+Ip47trN4be35NWLP4NUKC3Qmn1FTyx++7yP9BQg==
X-Received: by 2002:a05:600c:4c9a:b0:421:7ac9:460c with SMTP id 5b1f17b1804b1-4230484cfc5mr4462905e9.39.1718303688813;
        Thu, 13 Jun 2024 11:34:48 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f6320b11sm33706145e9.29.2024.06.13.11.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 11:34:48 -0700 (PDT)
Date: Thu, 13 Jun 2024 21:34:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ben Walsh <ben@jubnut.com>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: Fix error code in
 cros_ec_lpc_mec_read_bytes()
Message-ID: <68f1d8df-69d2-4246-8c64-4c7cc975feb1@moroto.mountain>
References: <e0b43fb5-ecc8-4fb4-9b76-c06dea8cc4c4@moroto.mountain>
 <87sexgrdk4.fsf@jubnut.com>
 <3226cba0-82c5-47a3-89da-01ffa935a9dc@moroto.mountain>
 <87sexgaemn.fsf@jubnut.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sexgaemn.fsf@jubnut.com>

On Thu, Jun 13, 2024 at 07:20:32PM +0100, Ben Walsh wrote:
> 
> Dan Carpenter <dan.carpenter@linaro.org> writes:
> 
> > On Thu, Jun 13, 2024 at 05:51:39PM +0100, Ben Walsh wrote:
> >> 
> >> Thanks for fixing this! Unfortunately `in_range` returns -EINVAL if
> >> length == 0 (see the definition of `fwk_ec_lpc_mec_in_range`). I'm sure
> >> this broke something in my testing, but I can't find what it was now.
> >
> > I don't think fwk_ec_lpc_mec_in_range() is upstream.  This email is the
> > only reference I can find to it on the internet.
> 
> Sorry, I mean cros_ec_lpc_mec_in_range().
> 
> >  int cros_ec_lpc_mec_in_range(unsigned int offset, unsigned int length)
> >  {
> >  	if (length == 0)
> > -		return -EINVAL;
> > +		return 0;
> >  
> >  	if (WARN_ON(mec_emi_base == 0 || mec_emi_end == 0))
> >  		return -EINVAL;
> >
> > But I don't like how subtle that is.  Probably adding a check for
> > for if (length == 0) to the  to cros_ec_lpc_mec_read_bytes() seems
> > like the best option.  I guess option 2 is the best option.
> 
> Thanks. I'll check out Tzung-Bi's suggestions as well before we decide.

Writing length 0 bytes to cros_ec_lpc_io_bytes_mec() changes the
function to basically this:

	cros_ec_lpc_mec_lock();
	/* Initialize I/O at desired address */
	cros_ec_lpc_mec_emi_write_address(offset, access);
	cros_ec_lpc_mec_unlock();

	return 0;

I was a little concerned about the cros_ec_lpc_mec_emi_write_address()
But I don't know this subsystem at all so it might be fine.

Perhaps the cleanest thing is to delete the length == 0 check in
cros_ec_lpc_mec_in_range() and add one to the start of
cros_ec_lpc_io_bytes_mec().

I think that's a good solution.

regards,
dan carpenter

