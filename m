Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE5943AA4
	for <chrome-platform@lists.linux.dev>; Wed, 25 Sep 2024 17:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727284435; cv=none; b=UPlLR9aXxBy2hgDGZEZvkYn1PvOTYqO7UbMDM8MbWgE57RNExkn7hUjY/VZr27aOtk6mxipsJMNMLbsp5CibkBlVqWOZyr+VvMlZpMTdttDX+mU1Z31RCO96GNfl/1Nqlvf4cTG1HID0nUwASvAjsyECTmSl+fgsuUzYnoVs8T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727284435; c=relaxed/simple;
	bh=eazsW8ehOZywqFey+Jsuiry/JLzV8qZShMLGcAgepXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ee4XfLdGn8Vq7lvv/3IkRxh94HQKhdTW0cn1R7opUimzBdSlzmlgXwtwO3RzvUBveJsVg8GiWiiYOBoWroR5uCEm4PRCqL9mROWlz1W0sXYMLZRMWQ9pHfdLCLN4ISPClvTRQ6Jb2WudiTLQ1Ir9sAlAHs+20DaZtEYBav7FBfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PdMxXNOd; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PdMxXNOd"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5367ae52a01so100819e87.3
        for <chrome-platform@lists.linux.dev>; Wed, 25 Sep 2024 10:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727284432; x=1727889232; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TUTSdeI7+JosOudQjHg+52ZpkXUi7IWq0P1aLMu3v2c=;
        b=PdMxXNOdVs1J/mpikwAtPoN3YQ4wN0qnbHr9gvTR6bG+qaI+ECiWiApwzHAr3Bhg3U
         dNDACEg8sv+5jXmRkCBoewOqkpkNgJSdZxVsikZe0CfIXu2KZ5xZe19LbdrhMTwj8qsi
         QvpZDkzUKJVP4lgiozCKPFP1f/FTI9sqSOj5hszkvK9FXcnaN4c4qkG2pyWvZxap5eQd
         ewk0p2PYCmHappO03svvGL1UJX4MKyQrFA1ZDQQeNTe5eEGdJai7gwnNVFASlPVYrAnj
         J+rx0m5lVva+HVEn9E9jcIIuE4sXzI8vktS+U3JOIU5+STKBz+MFdoCo/UjssZjtLPb0
         Ahvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727284432; x=1727889232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUTSdeI7+JosOudQjHg+52ZpkXUi7IWq0P1aLMu3v2c=;
        b=Ythdt3cVUVhay4gLZKlnpLwEwa0ZqGOPGf4KzMH7Oi45cw97kMK4J6EPbdJiK/QVAN
         VgLAug0s1pchvB5p+xxokv3JK6GB07+JCrF/EYYqbhSrpq18wafGHOwqY4smhH6nLyha
         70ab+Ui2dpT7bH8R2IulbZZeEr//V2EPrQbf2UnT061tsyUsvRRT61qZjdeDIxYaQlUg
         66qLPDpe/dncJVi+Vhk37PXirQ9J3FraP8Dld+s4L8oL9MTXa4wNfrv43d9UrK1pihMq
         PAjTfuwVhhZ0zyJSptmnZ24BBIXdPesPGoJjCpKtmrQQ17Gu8IYAq6ugvGFsdo6G/XJf
         ypPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA+lwJiAZzT/CuH8HqxuOE1Zc0FCihCU2bUTJNrwVenltyXeinePGIfWYNi99gsWRiijZFFHh6oVUAPF2eyrQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwR2Dm/nnGGGXg6lw2KMZx6QSWTcoyHQj0pApfb5Sy5L46RCDnq
	iDVYgLS2ZHb4y0PQpd9ErEWbC12sAFV5rVIQ1BxPkd/BY1ZLLEHBrD8Lyu2zpbA=
X-Google-Smtp-Source: AGHT+IG4PmHd1hXlytSjkxKrpDsCf4VZ4fji4PJZeek10wMk+0D4DzSIPt8vFZ9pGPQcAUiQ69L38Q==
X-Received: by 2002:a05:6512:b1f:b0:536:7d6b:e2a9 with SMTP id 2adb3069b0e04-5387755e0c6mr2373160e87.47.1727284432097;
        Wed, 25 Sep 2024 10:13:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a85e1284sm578112e87.43.2024.09.25.10.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 10:13:51 -0700 (PDT)
Date: Wed, 25 Sep 2024 20:13:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org, jthies@google.com, 
	pmalani@chromium.org, akuchynski@google.com, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] platform/chrome: cros_ec_typec: Thunderbolt support
Message-ID: <gqceveqpbvmiv3mg5cs3k3qd4rr6fpb3xksvxvdhkugr52paoj@olks6bqjc436>
References: <20240925162513.435177-1-abhishekpandit@chromium.org>
 <20240925092505.7.Ic61ced3cdfb5d6776435356061f12307da719829@changeid>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925092505.7.Ic61ced3cdfb5d6776435356061f12307da719829@changeid>

On Wed, Sep 25, 2024 at 09:25:08AM GMT, Abhishek Pandit-Subedi wrote:
> Add support for entering and exiting Thunderbolt alt-mode using AP
> driven alt-mode.
> 
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> ---
> 
>  drivers/platform/chrome/Makefile              |   1 +
>  drivers/platform/chrome/cros_ec_typec.c       |  29 +--
>  drivers/platform/chrome/cros_typec_altmode.h  |  14 ++
>  .../platform/chrome/cros_typec_thunderbolt.c  | 184 ++++++++++++++++++
>  4 files changed, 216 insertions(+), 12 deletions(-)
>  create mode 100644 drivers/platform/chrome/cros_typec_thunderbolt.c

This patch looks like nearly exact 1:1 copy of the previous one. Please
merge both altmode implementations in the same way as tcpm.c does.

-- 
With best wishes
Dmitry
