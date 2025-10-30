Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D797432E699
	for <chrome-platform@lists.linux.dev>; Thu, 30 Oct 2025 13:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761830634; cv=none; b=r2/OGOvahKuj1ic6ZF9WgP2Wd3OoC/+g92OUT9kOT8f8h8uqleabRC/y9578s4Zmx+RTLdh2+r3+HTJP57Jcl57wmEDx/u8qnVaPKrT7uq2UG4EKhNy6UKCp15gNu6uLzCHIkCtyA6DMAkSRB9CpF32oU8uSeNPIOk9XoielJ18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761830634; c=relaxed/simple;
	bh=FgE5WiJ8IHbwreJzl7GefWLHITMyWjRwgsHmbfomSag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oKtEmkJO0p3SJQnJjFwKL9GhNyYJ1J4UvAUKDKbfZ3bZeXYmPLdfzA0rwDOJq1iY3NIJMTHN9rrs4zDjgLp2LtdUcV6rRT0Qu/FO4nsogmElJWXP0Rpg+jFWmIxMpEXrQ1R0aHoEiIf4Kph3PdEvyzD1DXPyyhMXD+bs8uVaIY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhhWlHGE; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhhWlHGE"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4eb9fa69fb8so12622471cf.1
        for <chrome-platform@lists.linux.dev>; Thu, 30 Oct 2025 06:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761830632; x=1762435432; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eRVxqyYvS81StttYLRvMy97wGwnAqgu36t0qY6Aptgk=;
        b=fhhWlHGEO+1hSaV5aJmCX6hBP4Hk1guWH1iJnjt2iCbBWkSn5J7/gLpZq2qxlrv+tm
         wknybswDuI9aWDPwRsJK95om1y9ypZr2nEMQd7AR576TE+xQiNpsYB0t1bxmsm4oJZ21
         B1kC5IL5KxxklBl4oVBTjBdxM7xRYDG58zepCHmoV9mrIiQnMezdIfi68hf1/PES7Smx
         PujNBp/DKIFB6H2oa5Rr5BUjcNhbynkJ1f1Q8AGb/od9BUmmfXD6gLD7ryw8gBsWe3TJ
         MRhQ1MWuyrYzkQGZQWL7ino88alXeJM5KO3YkyYmAWHvzz7OARNnsUhBs5fWWr9k/ycM
         4CDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761830632; x=1762435432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eRVxqyYvS81StttYLRvMy97wGwnAqgu36t0qY6Aptgk=;
        b=n+dLHQpNcck57c9cIWwf/tV8cMqTU6aJr5p3myWAty7AAEmaXEHKs3gm5Sz8jHWyes
         e6Ac0JEBjlFFtGSZZZv/GjLbGxW/f1Sxu2foxdAuOviWmENafKdOotLhK07uVmHmR7QN
         8UJot0KyZpWEUouByF4kqH6pznM8vL7c3I32s4YsqBKAIUjX22OXtWsMOvm//JNuiej/
         rfL0AZjf5r6v7AcLUbAT7zOsqLXukJHYBScepPLJn+H4k98B/BKQ8bryO1vesvoFu+z7
         gEzUjFOutoSdU7gwwvEVSRLT+Z24zFS3lhUWSNZuzXNAf9lA2DYbbh0XJk9ky1rmsJBF
         2/9Q==
X-Gm-Message-State: AOJu0YwV5EpecFiWXySiuR/GTR5b91hHvheXxV+oIZjOYaXSxaVp6o5K
	eIbN4BUEmofzUhY4TwDYtfVYZ79FwHdTL4tz4MBrX00BFuyLQPyCP2DB
X-Gm-Gg: ASbGncv4kfrT8nw0oim0OTLVeUGsZXl9+46I4g/Mds3TpKF0Ir/Y5q6xggneIl+EwR2
	TXjGRcUaMb/ZKukr/XINHnj8qR5rD56i20KsA2LzO9DxdzFJZseHzZ8io0wdxybD4w+s5lZVYvL
	rb0QIwjIQ6er5WH1pFUkHIJK1YUCA7BGE2EjIDyYfE7ewQp41AK/9MjmpgVkzTWA2Uw4FlXruQF
	dkizV+rTVa4s6jvHg7Jnx7vKYOCQFpVBh2p5nD3yOPw2/+FtJU4WVzRd47S3XW1jVTuKKLcVj8+
	H7QbpO+3iQeohIAXjQRnMi5JNTUb0jz0Pvi7+ZlR3cbCMhLD6yIQRU6p9ucfur01ixlqpwRNJy6
	nHpk4Y2l1pWmdY70SmjIzl7E2IDkQ9esRUxUOXrD9l1++JkRloJPmEkZzeM2et0wfafAJa+RpKT
	ONzNM4LPVfheKEzxPaTmRBaQ==
X-Google-Smtp-Source: AGHT+IFscXJpdlCTxUmH19tcqISM366o7hFmwLuDaT+vypmSgu6IsKCqKIeWKa5nG/GQ0W/P+3pf6Q==
X-Received: by 2002:ac8:5e13:0:b0:4b3:3b2:2b4b with SMTP id d75a77b69052e-4ed15a23867mr72684561cf.0.1761830627001;
        Thu, 30 Oct 2025 06:23:47 -0700 (PDT)
Received: from [10.174.68.124] ([216.11.121.174])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eba37b96d0sm111387781cf.6.2025.10.30.06.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 06:23:46 -0700 (PDT)
Message-ID: <df04d358-f144-47a8-930f-47ccf7cb105a@gmail.com>
Date: Thu, 30 Oct 2025 09:23:45 -0400
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/chrome: cros_ec_lightbar: Check if ec supports
 suspend commands
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
References: <20251023234239.23882-2-bradynorander@gmail.com>
 <aP7s2ib_nUIZ3X5O@google.com>
Content-Language: en-US
From: Brady Norander <bradynorander@gmail.com>
In-Reply-To: <aP7s2ib_nUIZ3X5O@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/25 23:54, Tzung-Bi Shih wrote:
> On Thu, Oct 23, 2025 at 07:42:40PM -0400, Brady Norander wrote:
>> @@ -550,7 +557,7 @@ static int cros_ec_lightbar_probe(struct platform_device *pd)
>>   		return -ENODEV;
>>   
>>   	/* Take control of the lightbar from the EC. */
>> -	lb_manual_suspend_ctrl(ec_dev, 1);
>> +	has_manual_suspend = (lb_manual_suspend_ctrl(ec_dev, 1) >= 0);
> 
> The driver doesn't emit an error if lb_manual_suspend_ctrl() returns an
> error in the first place.  However, I think `has_manual_suspend` should
> only check for -22.  E.g.:
> 
> has_manual_suspend = lb_manual_suspend_ctrl(...) != -EINVAL;

Thanks for the review.
I originally decided to catch all errors to be on the safe side. After 
thinking about it some more, I agree that it should only check for
-EINVAL. Will send a v2.
