Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1010275844
	for <chrome-platform@lists.linux.dev>; Thu, 26 Jun 2025 11:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750938111; cv=none; b=RTLGbl8AsqROKFdXKNR6xv3FQl1i4+ykxEjQcf/2hVez9OCVJbBGS3premuGrCkxuPVgDpeM6Ok5pKtCHGD7jMGAaqUmOR50M6Bny2OZJD8cYVNHCJf6F6Vx0VT24wSl5WB+BvlB8LFgro83Kb3y5MGlEEXBDtzsLYm+QeC+3pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750938111; c=relaxed/simple;
	bh=ZplEWNBtHcZ4mdOLvvIwXC2Hmv5WMUfJ3rsoc8VVJnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ukQ2Wc12tJPMkToYKlC+Q3icfNcX/mH2Wrogf3uc9A/A5wfJwasAQ8WKsKXc8ZhGkBDKNdaDLqsoi7kkJRz35FDjRk+e1L7GDyjvyJE4OQQefanV1VIXO2ixiYoi0I0/Fd6KJWhiW6L8hfv22Mbbfp0voMuIX+SdtOh5ozu4Xog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=Wt/rksOq; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="Wt/rksOq"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d6ade159so6349305e9.1
        for <chrome-platform@lists.linux.dev>; Thu, 26 Jun 2025 04:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1750938108; x=1751542908; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ltL0CUXeRmuJ4RejWH7RMJozlI0dKlYGqD8O8bc/Ck=;
        b=Wt/rksOqRGl8h3IRTonu8Gn/OQoNsj6Mm96H6UjIm6HAkPWz2OGz3S3TNf6ht0V7hZ
         m7dL+KBEzpT9K+3q9WIEsJh0bp4aRuT0+5sL8PBD9f5qnqGb8SqWgkrqUeml2hGm0kh6
         puB4aPkfFHDSLTDOX4fn+qLNQA31J+im6nG/YKfcCi1j+WeKYHOK2AHgLNnz6RHNhCrr
         Yb5NM46vyqRW0sHGpuTkSm7LmIz0BUlo3wZYBMbFbW6vaWFwmtQXvcjoxBDWcuJFWE5F
         w0f5qTAOxezVVYxsT/36qVVoAHvG8L3k8rJxpxdFGgi5aq16FJz+OnwytAdBnApkWdvx
         MoVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750938108; x=1751542908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ltL0CUXeRmuJ4RejWH7RMJozlI0dKlYGqD8O8bc/Ck=;
        b=grEisdxIp6d28WmfHwhufHhZsnnPdp51w/LQOuAXaWKQft9cRo5VQrtAe4GlsEKIQB
         AfBKH1sEPaFbJ5JochFVQfmsZj9FYY2f8lhxFzzC0vaJb06DuWpUa8yS+6UBtO9ErqOG
         u5O2H9ZRphB7yQCOiuRcq/Ov986tQb9pTiHOzhIpyB+TwNQVo39OTJAnY4uNeGh158Cx
         SSprx0VYDCZIUVe6pjVIjeuUHEnreY/WuM8ErDBGIUSi7Jz/1rIQSTgcL1W9jc+LCazL
         M0NwHHOdXK+U85VsK3iGuAyUtAi47fvEabx+jyRI9pnVyOWK8Nm4/zYqgIouLcCpz6Gq
         fTXA==
X-Forwarded-Encrypted: i=1; AJvYcCWhpyqWme7Z4coGbsO50s6pnFodiIz0y3Bzrp7eJa5vuzUjrVjbT+FVVoWZg8v5gQKd2caaYuBphNY1GgR6nqE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLm04MaFjZdmNTnddUfS/1z3/Mv9KDrbHuu7d7IVVzH+ATT/pZ
	soqW+6I7qoL/+D45hqTN/60KPoONhCi3feqpZyZTnq8EYeKsoN69Ivw9q/wJ+3EOyQ==
X-Gm-Gg: ASbGncvu7wPE0LsKYUCrtyPeP/5weXasf84AAt8V93pYy4tAdiB7mIhp/J/LP7R1VG1
	aA5HNcbMdW6N2cJzJUNZs7SVkr9ovRLwX+ciWBUp6xsoXqFQhSWE5HG/n22G3JccrBboijBKf2l
	MU7fDGwZA4SEImUNdX+d7JkplZdDjw7HBk91CLrGrSGdKTvajgj3lBX99kKoXQgv9wwjAxPoT5r
	DvTj9qzLxEJRz3ETRZA3evR6tzfl9ppFiF9qsVC4Re7Z7gkA10eOOlZU44xJl6j/hAQTw5/iLTX
	Qt6+iEuw3ASbpJJ38VbXV8AkumXqn3Tp8mGPfp5j1/4TL1LrIHr94BOKsHa3Qnd2BHSNHge7rwi
	fsRSEq9hhMQElE5yqF+UVauR8+xvCm8V450iTgdDOww==
X-Google-Smtp-Source: AGHT+IGQ3HVge8+n1amo8NkGCsTCJQTSNRnL9rshARj8zSdPIXUqTQ6P8JU+3XgaHRsYlz9jWszwXw==
X-Received: by 2002:a05:600c:1f0e:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-45381b0af78mr71483905e9.16.1750938107787;
        Thu, 26 Jun 2025 04:41:47 -0700 (PDT)
Received: from cyber-t14sg4 (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805eeffsm7146276f8f.34.2025.06.26.04.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 04:41:47 -0700 (PDT)
Date: Thu, 26 Jun 2025 13:41:45 +0200
From: Michal Gorlas <michal.gorlas@9elements.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Marcello Sylvester Bauer <marcello.bauer@9elements.com>
Subject: Re: [PATCH v2 2/3] firmware: coreboot: loader for Linux-owned SMI
 handler
Message-ID: <aF0x-d-uBbMQxrxO@cyber-t14sg4>
References: <20250616-coreboot-payload-mm-v2-0-5d679b682e13@9elements.com>
 <20250616-coreboot-payload-mm-v2-2-5d679b682e13@9elements.com>
 <aFuQHqSd9kT87tsF@google.com>
 <aFvq49ODR3XfcwZJ@cyber-t14sg4>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFvq49ODR3XfcwZJ@cyber-t14sg4>

On Wed, Jun 25, 2025 at 02:26:11PM +0200, Michal Gorlas wrote:
> > > +
> > > +	/*
> > > +	 * Gives SMI some time in case it takes longer than expected.
> > > +	 * Only useful on real hardware (tested on RaptorLake), not needed on emulation.
> > > +	 */
> > > +	mdelay(100);
> > 
> > This looks weird. Are there some ways for Linux to be aware of the SMI has
> > completed?
> 
> Not in a straight forward fashion. On Intel SoCs we could read MSR_SMI_COUNT
> [1] before and after sending an SMI, and wait till it increments. I am
> not aware about any unified way that works for AMD SoCs. However, so far
> none of the AMD boards supported by coreboot was tested with MM payload,
> so to make it Intel-only in v3 is not a bad idea.
> 
> [1]: https://elixir.bootlin.com/linux/v6.16-rc3/source/arch/x86/include/asm/msr-index.h#L880

As a follow-up here, making COREBOOT_PAYLOAD_MM dependent on !SMP
resolves the need of acknowledging SMI completion. If SMI takes longer,
Linux is just stalled until SMI handler gives the CPU back to the caller.
I think for this case it could be the way, LinuxBoot is by default
compiled without SMP support anyways when used as coreboot's payload [1],
[2].

[1]: https://github.com/coreboot/coreboot/blob/main/payloads/external/LinuxBoot/x86_64/defconfig
[2]: https://github.com/coreboot/coreboot/blob/main/payloads/external/LinuxBoot/i386/defconfig
