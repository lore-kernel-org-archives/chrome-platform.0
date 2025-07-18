Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A482E7629
	for <chrome-platform@lists.linux.dev>; Fri, 18 Jul 2025 17:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752860300; cv=none; b=eRCpkEhX731uGrk7ucxYkU9hl2iCnbZc4VutXflpvN2hdvWxVZMitFX9ivcN3FbyNU9LivMzDzbiFkLvjvzbvgF89NM+o0O4va8x+f4vPRSuFMg+cVz/xgi0FW2YrnU6DR+taQjRSR2auXYXcqpeHbgqn5hrizU4CfdLYfhyNVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752860300; c=relaxed/simple;
	bh=BBrByI1Mib4r2lHIK2Xlx/roasq9l2jl/ntYEFcA3TI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDotqp2MbbhSWNygK7DPyO2jDB9G4PU19KGNBWxhf+qDDxbl9l9gbnKdN9kcSCYVUgTQN2u7R3K1/3Hsrz0+8C612K60TB368lyGTH/VQApxHYfGeg4+BsuNLvB1KVpvxHNBF3ZPn0oRbZ/n/UMmnDi1sTOhZhL7d9Rhv0+E3Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SArCBtkN; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SArCBtkN"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-73972a54919so2455527b3a.3
        for <chrome-platform@lists.linux.dev>; Fri, 18 Jul 2025 10:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752860298; x=1753465098; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GRxtHwjL+3PAWWyF1a/7oZRVkK0KVn9KJJvGvId1t8Y=;
        b=SArCBtkN6byNNaOq+A3yzMRW7vFYA9WNKOMP6wZRYFw+nIPyiNERGhUygkQIJxrp+2
         uQGV6klFB1IcX78iBLwxz/udqXB7YjV7z56hzwlMiMYWuCtLrlrNrpEolG0m1aIFSWoh
         QnNbm8AqaaahtSITy5ylVZ4mT84+Y7irraKXPafyOReWwlvpDHFEt0jd98svmDRuGnVk
         OHeVYLtT9Aqsw0GEKgNVHNqas9xPs8CwenGOlqcPqPuXtJTujYIM/9jilSh7FXXvE9Qg
         fA4bZbreDmdSzCWPnR9/RFQzr97GAtEkz8s2zyVON6QsBbWsrZkZd5h6SMZuv4n0VqfK
         qtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752860298; x=1753465098;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GRxtHwjL+3PAWWyF1a/7oZRVkK0KVn9KJJvGvId1t8Y=;
        b=fb6sQtHGHRpZWIrj52xc5UwHXOsFH7forHrgMY/jBNXkG95e9pzY42oA7pWgXbz8Jx
         No/Ax6INVf6iope1lwaIH8jGJbcw0ZK0IFZ4MgrkmxNvZd4kt8NoIoqUpnDIhoP/VmDK
         8GDzynY0ldcCmD+/XmjBjl36OsZxbBWCgb6NkEQiJ1hezFEijECG723k3XW9upFkXhGo
         +g4gtc6K1u2ffiyBHBXTKsIKyJsxVyIQlxRiLmjVdtddR6a4gm9fHcS5lARo+YQshurf
         f3Fc2sk4V2HxmUeLOWXOBktoVd4iGXFUebOWCKepbCdyv5sNzbfjSqbyedxeTe+ids9H
         HbbA==
X-Forwarded-Encrypted: i=1; AJvYcCU1iPIRMUrHJkF/H/1/BCA+dh0GrDGXoDiudz+qgCyg5p5U/ozSET+SwkOPV0XUx3Wv5d6P5A8+ARYz2KyCxl0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9zoT599jlAucBMZ/oWzkLVZHGFErdIs5tigyVbUmmKannNHZP
	O0kl2idSi16OTlw7GJnffmNhjX66ipEaI+ATMhoAEKNLJCHsvHDfmLc7
X-Gm-Gg: ASbGncs0XR+NwYz6no0DNmpVQbiF1wmi1UX7TUzpSu53vfga8D2wff01yoLCjBDGGlJ
	7Mpx73YlKS4q/hRBW7FtRaygZI5gUnDwv/XQj5A8YTzKR7Nzt24AC6THr5tgXrjjJsqRwl9/mFS
	KwrNYM2hVpfgCHbO+/YJxtI0YRCbwZxTQv/7rm4T4pnbsMX9t1eHkAybVGan5M+s2oL1BcTb+VX
	qEJPaMkKDLXc9wy9V+QGbksX1fxXerfrY9OfzmDIgEoHLY6W/01uHoTh+CM8gtiD+RcHDOVsQ8R
	zcKZmuINyLvHRuVNBOLaGOIMuGudQsuYKhL9ZtXU6z8Jw9stuY61KBrfiTe8Mvm+12ytS8akME8
	O2iWUvmSIHKPg2wqso7Cy5NdFXUfpltgWcZqDIjg3Rj1Luw==
X-Google-Smtp-Source: AGHT+IG9jQJTtmQTkXncQ44ZMFFbqIjAxuSaimpVAcOwrGjlk1NlmL1dUL+MD/xaksVSZRO06M5YnQ==
X-Received: by 2002:a17:90b:2685:b0:311:df4b:4b7a with SMTP id 98e67ed59e1d1-31c9f4b50d3mr17386475a91.29.1752860297736;
        Fri, 18 Jul 2025 10:38:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cb5c5da0csm3228067a91.25.2025.07.18.10.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 10:38:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 18 Jul 2025 10:38:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sung-Chi Li <lschyi@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	Sung-Chi Li <lschyi@google.com>
Subject: Re: [PATCH v6 2/2] hwmon: (cros_ec) register fans into thermal
 framework cooling devices
Message-ID: <357c26e4-8ec4-4d52-873f-300eb20aa356@roeck-us.net>
References: <20250718-cros_ec_fan-v6-0-8df018396b56@chromium.org>
 <20250718-cros_ec_fan-v6-2-8df018396b56@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250718-cros_ec_fan-v6-2-8df018396b56@chromium.org>

On Fri, Jul 18, 2025 at 03:08:30PM +0800, Sung-Chi Li wrote:
> From: Sung-Chi Li <lschyi@chromium.org>
> 
> Register fans connected under EC as thermal cooling devices as well, so
> these fans can then work with the thermal framework.
> 
> During the driver probing phase, we will also try to register each fan
> as a thermal cooling device based on previous probe result (whether the
> there are fans connected on that channel, and whether EC supports fan
> control). The basic get max state, get current state, and set current
> state methods are then implemented as well.
> 
> Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> Acked-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Thanks,
Guenter
