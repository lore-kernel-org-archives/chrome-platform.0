Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F811FBF60
	for <chrome-platform@lists.linux.dev>; Tue, 15 Oct 2024 21:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729027690; cv=none; b=cR66uJY595k74ar4pf8ZYoKG0dlkk+NduC3cSe7P3ZbRELly6o/8Ed9oVVJF4a5mw9Y2zWGPm7srLFg0PEFO38BY8nFs2EKEuF5Mefqaq87MHsSVqn2TefNCsCJIvtBrGY7z+RmECRwZeQbBo48fPLrocDJsfifyyueVpV2xPHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729027690; c=relaxed/simple;
	bh=PN1uaw1Buta/ss6rKDkb3NM7yfqsOKT/gJWdf6hECMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nHS1aYeVM50Fwx/sZA0qh0NFPNOjCkFFJFB+WpqypgaNDQClPE424opaNvB/KsrHsyi0s+kw7eKExux/AvMORDUAzsRiW6W0hr32ESr618hM4m6dPTf+Cg8qShgtfGC/ejXutd+OWQHtdUEz5VcRHNBXvrdLsZttqVhMR81bKXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AGuVgOeY; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AGuVgOeY"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2e2eba31d3aso3286038a91.2
        for <chrome-platform@lists.linux.dev>; Tue, 15 Oct 2024 14:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729027686; x=1729632486; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x/FuWBioRshAGcnxMHj1vI0C//58jkztWOligVGqpoE=;
        b=AGuVgOeYUNHQwZL43ZioqrR+UMZMKYI5lzFHbLd7Trg/EyH9JsOReo9yhBdz+BkZIt
         0Lmqko9J7CfvdfZCX+UvgZ73BPFlacdkzarMKOT8I6k1W5Wl+hoXgMCG5upma1bIXdbP
         SO2R8N48RiZNB2qpmxgIMUAGpKI8kehxT7lJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729027686; x=1729632486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/FuWBioRshAGcnxMHj1vI0C//58jkztWOligVGqpoE=;
        b=KCU3wI0dXmHP1Q5aFWdrVBGG2sCnJE+Iqbf3p9blXQ58G+qMkTpc+qRH4DCUQPZeKy
         /y1ncbZP+jadgZhiGwpuVg5bEjh4UotugbNaazFkwMwRJ+o1mNzdMH2bxHAD0GcJzbC8
         6YZd3XY2G5FwAJRR82MkhNr/zTUeNWeefAO+AKDPUByyTyfJlf7b0RrDbb77oGnj139x
         Zwe8KLzpPJE8AGJs6BjhePCO0zpZMl+kUbNQLafhHM7Z8rPwvIC29ziAjJMljUtIPDO2
         BGrxvYXyu/zykiukdhcuCSUGNIa5BhKq2BOvIPZmZ+J7JV1aNzY7DMfa+++dPKsfKgt+
         zxBA==
X-Forwarded-Encrypted: i=1; AJvYcCUs48FCVe8W6+Wzo+yvtucdFnYW7Mg6YKpaMlP4cPXuKfel4LKkvFf9hC4ZpOC47miLjysRGM+UseK8bdbhGU8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyqPN0UzhakEzqAcZ5iGZoNz9PyDr/bAm5xPjVQBXBvUkHlcIY/
	mq0I/KL0JutryLdVahf5wk7SO2eJnYuOISlCADETdzffMQk4aC63bqon12BvVQ==
X-Google-Smtp-Source: AGHT+IEC5aB06Y9FCs9djswuF6vFc/rQqbSHVZz+GYb9BipyDuIy52J6UOq05rW1pYsLqDgReWWYRw==
X-Received: by 2002:a17:90a:e7cb:b0:2e2:d3a0:4716 with SMTP id 98e67ed59e1d1-2e3ab821db9mr1766034a91.18.1729027686307;
        Tue, 15 Oct 2024 14:28:06 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:eef3:dbf8:fbe3:ab12])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2e392ed13besm2419257a91.17.2024.10.15.14.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 14:28:06 -0700 (PDT)
Date: Tue, 15 Oct 2024 14:28:04 -0700
From: Brian Norris <briannorris@chromium.org>
To: Yuan Can <yuancan@huawei.com>
Cc: tzungbi@kernel.org, jwerner@chromium.org, adurbin@chromium.org,
	furquan@chromium.org, gregkh@linuxfoundation.org,
	rajatja@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH] firmware: google: Unregister driver_info on failure
Message-ID: <Zw7eZG8hx9JRN2HH@google.com>
References: <20241015131344.20272-1-yuancan@huawei.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015131344.20272-1-yuancan@huawei.com>

On Tue, Oct 15, 2024 at 09:13:44PM +0800, Yuan Can wrote:
> When platform_device_register_full() returns error, the gsmi_init() returns
> without unregister gsmi_driver_info, fix by add missing
> platform_driver_unregister() when platform_device_register_full() failed.
> 
> Fixes: 8942b2d5094b ("gsmi: Add GSMI commands to log S0ix info")
> Signed-off-by: Yuan Can <yuancan@huawei.com>

Acked-by: Brian Norris <briannorris@chromium.org>
