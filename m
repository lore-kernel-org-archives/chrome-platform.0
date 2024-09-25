Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3818F73452
	for <chrome-platform@lists.linux.dev>; Wed, 25 Sep 2024 17:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727284328; cv=none; b=HsQh0Q7YCiICDT+d0ngwj4ZiCZxSAMZbeHBaeJucijST7RqhF5GzQ87hurDh6oNKxHXh2Veh3fjPPhVx/oKbdZwbRvoeTsN0hrmP/tINUEFiu8AYOxN1/FQ85xQsbqFNA6PBOW6DsdugGQz9hMpJ2r7fzbG8YHatbk+oRwHvJ64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727284328; c=relaxed/simple;
	bh=bIoWbL8+cQIvftkQhhhS5aGeLo30gcPHnKNxeaE3haM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WULN2vY7aM3lhbEVhRb8Eg1MiULpICJu6e11MFgiFrM13P/GD0Cn5qZp01mtXEp6tED/jeniWxTmjrFpL9gVwLlgDjWr3mRRuY+NZa3dNS3VnZ+dFIwsQz1tAKJ6+l94Sa6UsLYsYDnS0gKXwrcg5MHUR5tb3y449h0dzdQXsiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=njqGYWHw; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="njqGYWHw"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so137206e87.0
        for <chrome-platform@lists.linux.dev>; Wed, 25 Sep 2024 10:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727284325; x=1727889125; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s4Z/qrw/8ifzhH4AWTm4LO9RxwBj17vLbr7zbvp6uIk=;
        b=njqGYWHwIHPsG8xBLVm5/3pL/TmrteXfxz5wSOhSwhJ0mugjVJm/qoTaHuWc8I7DsL
         wJFcMgs2u/pjTYAqcH162E4TPQcEBUwaBKPnBr1baeTm/ddVo6O8RRBBc8VAiTeooEYv
         NiZ4NU/aE0NZgnHnr737uCrGMvzE9LswT4IBb1wCS/zQSQH2GfP425v9UJ8CdXxPvOnQ
         zyYwe450JZ4nPI6ofCdJC3SGIFyNcMYQl48ujUSmELjTcR9b/5mTvODgQaUJVuXrfBAY
         sCzBVQ3cTjvhrZtvmEao76Mob5LBwvQCMR8WwT3ml+P54YSPDUoqeXEPzziNceoyYz8s
         tggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727284325; x=1727889125;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4Z/qrw/8ifzhH4AWTm4LO9RxwBj17vLbr7zbvp6uIk=;
        b=ml/XB1q2T9xsXHgZ8o1TqeD1ML0zsM5weyBxrO54artVkbbSnwX0c7soTMpg3CfY0l
         5GziHqURwwMiWoz9FB/Pwzxx5lT42bHQbZSNrBxQ4XYH2yVfzbVwY3J9v3OLutFzO+Er
         33D64sy27vdHQwT2ftCB+M3Z1bsBA86+m2adIODsPQtCbv1wAFdMQ2d9Vytm6rT+e/fX
         7x3658xJgzOzpNmqScOfRF+XwTbFwHvg7tnZ+yqP7NpArww/VmXd11bL7liuozE0YElN
         8pUZ/soL0VxqG6MG1tXkhxbxEhTsNYZGOgw1zBbojwmXd49y0fH+QnYSLAsRCF7lU1T9
         3zPA==
X-Forwarded-Encrypted: i=1; AJvYcCWx5z8MEKNEY33xKMeW5vSI+HXN2lNZ7D4vQy9GgrOgMWHXXNeVDECsBFwYOyYbe2p9Do2w0Lf6fRShp4XYMZg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtGceH83pnXvjO8rngDqv5gX2oBivarEFz12YJwgbG/uXiw7p7
	/VdDag2qLy53PObHY/6of6K3Fsz7AYoqneegBb6OC3zQLZC+nXj+zizYf0wbMl0=
X-Google-Smtp-Source: AGHT+IH88Z9ewx3HV2rusn4TYxo6thy54qxZ0Rzi5KZL1FRdRnJgljKSZzpDn1p7xLduuWwez5myRw==
X-Received: by 2002:a05:6512:3d26:b0:52f:d15f:d46b with SMTP id 2adb3069b0e04-53870498352mr2214537e87.14.1727284324994;
        Wed, 25 Sep 2024 10:12:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a86402adsm572113e87.169.2024.09.25.10.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 10:12:03 -0700 (PDT)
Date: Wed, 25 Sep 2024 20:12:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org, jthies@google.com, 
	pmalani@chromium.org, akuchynski@google.com, Benson Leung <bleung@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/8] Thunderbolt and DP altmode support for cros-ec-typec
Message-ID: <6flxq7m7fdcpajdg5sthar6xlnpn2b3nzzwgp55jlqrjw5ubge@kdym7c2kv5fm>
References: <20240925162513.435177-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925162513.435177-1-abhishekpandit@chromium.org>

On Wed, Sep 25, 2024 at 09:25:01AM GMT, Abhishek Pandit-Subedi wrote:
> 
> Hi Heikki, Tzung-Bi et al,
> 
> This patch series adds support for alternate mode entry for the
> cros-ec-typec driver for Displayport and Thunderbolt.
> 
> Thunderbolt support is added by adapting an RFC Heikki had posted
> previously:
> 
> https://lore.kernel.org/linux-usb/20191230152857.43917-1-heikki.krogerus@linux.intel.com/
> 
> A few comments on the series:
> 
> * The cros-ec interface will not accept any VDOs/VDMs so we simply
>   ignore any configurations we are passed (i.e. DPConfigure). This means
>   the sysfs control of DP lanes won't work.
> * ChromeOS has two modes of operation for alt-modes: entirely EC driven
>   or AP-driven from userspace (via the typec daemon). Thus, we never
>   expect the kernel alt-mode drivers to auto-enter modes.
> 
> This was tested on kernel 6.6 with a ChromeOS Brya device and compile
> tested against linux-usb (with allmodconfig).

Please test on top of the linux-usb or linux-next. 6.6 is nine months
old kernel.

Also for v2 please consider CC'ing both lists for all patches. Otherwise
it's hard to follow the changes.

> 
> Thanks,
> Abhishek
> 
> 
> 

-- 
With best wishes
Dmitry
