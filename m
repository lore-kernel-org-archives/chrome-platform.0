Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DE328E01
	for <chrome-platform@lists.linux.dev>; Thu, 18 Jan 2024 23:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705621463; cv=none; b=mog+hcJ/TxzMU0C8Vv2znWJ/wKhMqOAwcD6/okgOBGfjodiuKmdwec2zYBqa7XNtm0IWu2Bb7Y5oaEnJPfct15K3vTlo0odPLycImLJRRr9OswOM0lePrJhtQqtUcKf4uH8C4rQ8J/tynz0JiaqrlfOo9Z5/ff87nTInCTtf9yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705621463; c=relaxed/simple;
	bh=7ZgPhNITkfgbDK68em6bRmyJKs8QJgGsG7pSQQQNzj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qko1PoHMdQDLxN7WQxIotVPi9Q04xYMs+4oOckiLWKHQ9u/gopSXdl5Z57EtseCXzefJhwfOBCLwAqZ651O0yIs8YPoYwnnaziUhjB4zz1XMHCP5NObO2LDbzTSdh0CuZgT1NEr0Lz5yrZAO8DAum4Yc8pZX1+QKko98cLrZ3RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EseQWjVk; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EseQWjVk"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so160398a12.1
        for <chrome-platform@lists.linux.dev>; Thu, 18 Jan 2024 15:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705621461; x=1706226261; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lACEUpNy9A2kCgeWPShuuF2qxk8Eoy5GtulP85mIp+w=;
        b=EseQWjVkv4tU0EqOnXdp81o9U+kGZnxNMu1tszimAcRgx7wA7kbZLPvPy/ByNyPebA
         E7nHbiRJLtJkymexFwYFcFAjpVdd4mTJn2c6IXNK8c5txBFtD+OUk/gy+/q22a/WNOw8
         7HctUwBOJLzrYjIuLrtpKliH7Zq7InbxdNIlXvEilhVleurktItxe97fvx3PoE0Z6UuZ
         t+pw3pg+IlF3ha3rjUCwVJpn7D0i+BDZRCs/y1Qt4YuL1hj852FbAzcacYJzrWztVc1a
         1d6TqPvdZiixTn445F2F3kd1jB8o47wErG9ap/UanTRlaLm1gw84l9IM61Rd0vwMv7BZ
         EQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705621461; x=1706226261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lACEUpNy9A2kCgeWPShuuF2qxk8Eoy5GtulP85mIp+w=;
        b=NUTR9xjdqVP2GXSuc0jfA87COQZeq1ANm4e7uCHCRpja9VF+5S8jF1Ah3Rxg+IQ2RY
         R9qW0g3ZMnAk+7iXxGz00rsa7BXtEry5trIjI6n7pLVxHiAE6EwOOUrunqjXpEtb8WGI
         xw5U4lspdnxrpiMyYfwNYixiuC3klEPKR48nwLQcMM+9vEHQqKboZVBU/bh3mwBTTi19
         IQwSnAjDuKkpOik5CFC6uL2ty95Eiu+LIMeFMnfBGtjcUnJoIpMPTP+6O8vYBL5493qP
         D9goPbD6IYABgG77IR+oS2k7YFItyEBCwgoau3CxK/ob1se8aYP5VOcNUuwbCC/DJ3zU
         nCbw==
X-Gm-Message-State: AOJu0Yzb/DCGrkDfyifW13Q7LGFCCYx14jkkyMlQyIlxLr8Fliy+WrYl
	2pMaYWCgiLhaGQuo48ZoYj2NojE3qDHut3SGCqp72WEgYIzSj/cb6s9uUGoS
X-Google-Smtp-Source: AGHT+IHXJ7ppLDLXd2sOeyEQK/6dSiGQuHOEUdpeiegA8mJM/QX/+xlpuCVLDldQjd+BFQ+vpTJpJQ==
X-Received: by 2002:a05:6a20:7292:b0:19a:411a:89bb with SMTP id o18-20020a056a20729200b0019a411a89bbmr2002708pzk.50.1705621461696;
        Thu, 18 Jan 2024 15:44:21 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k38-20020a635626000000b005c661a432d7sm2112285pgb.75.2024.01.18.15.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 15:44:21 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 18 Jan 2024 15:44:20 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Lukasz Majczak <lma@chromium.org>
Cc: Gwendal Grignou <gwendal@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Radoslaw Biernacki <biernacki@google.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2 2/3] watchdog: Add ChromeOS EC-based watchdog driver
Message-ID: <851f2eae-55d3-4f98-8051-139064630fb6@roeck-us.net>
References: <20240118195325.2964918-1-lma@chromium.org>
 <20240118195325.2964918-3-lma@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240118195325.2964918-3-lma@chromium.org>

On Thu, Jan 18, 2024 at 07:53:23PM +0000, Lukasz Majczak wrote:
> Embedded Controller (EC) present on Chromebook devices
> can be used as a watchdog.
> Implement a driver to support it.
> 
> Signed-off-by: Lukasz Majczak <lma@chromium.org>

Nits:

> +#define CROS_EC_WATCHDOG_DEFAULT_TIME 30 /* seconds */
> +#define DRV_NAME "cros-ec-wdt-drv"

#define<space>NAME<tab>value

please, and "-drv" in the driver name is really unnecessary.

With that changed,

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter
