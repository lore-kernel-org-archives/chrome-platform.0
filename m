Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66FC60DE4
	for <chrome-platform@lists.linux.dev>; Sat, 27 Jan 2024 16:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706372463; cv=none; b=pNKEKOhc7fNQFpgZRaO8PjPQ5zbWAU5xrBDYDCYgntW9/Hho6man8rAdvO5qB5nw6LhVD1/6bPe19yfh6Lm9c4VQKnHp7a5HRS6PZys3E5hBXixENp+5wk6umFSiULQULc4SXOwe4FoizGiEJSwQsKr+3D6GMXYAFIZYEVIbKvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706372463; c=relaxed/simple;
	bh=iFbT8NHMRxra73mtvqFlKRnzUGWo0ySIB+769BYYeu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWzUf+jOswhhu0mcnU8MfaIUiSG0P294H0EsXix5pZm4D2yco7yLXOLlilGuzKOIVXqladsBR1INvVKaMfaMUr1IGvwcw0FETDoI41J/wau79jQnf2hs1ahuIaEccFkyySgOKpH6hDxuBRM1e9iBti7ldS10s5yUfndaqOXe/28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vvl84uuZ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vvl84uuZ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d746ce7d13so13246645ad.0
        for <chrome-platform@lists.linux.dev>; Sat, 27 Jan 2024 08:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706372461; x=1706977261; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=icnXN0V8tv2OBqSXsA4+SZWf8bHAQn0oQ3LlvvUMVcU=;
        b=Vvl84uuZX2Gvctv53gdG9AUQs+q2d6BIRcyJ78cUZfehZ4hBSQov/woeJJ7z62V44+
         qonbucjDFbJw1gI1ksrpOxMpbc80WI8JgmsSaOHqglRH8IKlxxVOvtIoadvZu9eBtcZo
         suHhh1sqBB5VHTzGiNVxcTaoIkdFjMDU+KbjRAR+38zEdyZ5mzdkourQ3b5a0EFRD8Q6
         +UYiSxyIogMPsBwmUg2Syu0jaAsmN5ExyXiz9j+i33LEh1tIK7VBe7kGtZtpFUFemFuw
         xb4xsJC0kMsZoHwgzHHdpQ0eP8Y2Fged+HAdDk1uUPLHaXsYPtzVvtMLGWPvDdqVipTq
         iPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706372461; x=1706977261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icnXN0V8tv2OBqSXsA4+SZWf8bHAQn0oQ3LlvvUMVcU=;
        b=plHjFTualdaw4hGzHb026bNSPMoV8WnGHrS2ILOFLS6I8D3eilf55WQLEYSBFu4+SV
         DQbTH90kTmz22s8uhzw8SwaHaK+VTqicW6DPLtjB6/FppdA9zm2V5OvaucsW0e+g2y7u
         T/412hxUfuIYpdmCEJkO8KxpgRpMFnPF/pIdjMTWUl+QL+TzT6vynnwvKRj7k3CKndrE
         9M0FjVStuZuqPBJS04VHSlExqDhsFlT4MEYfZv4295R2ZWht0uycUkE+w8nh16SXYJt5
         boCV+GSw7i7C9ygk3eMBSXWyCQbiggzoGbDIHfnRJhcxGmOrWWSNxLXfc0P9GPOVcytF
         cicQ==
X-Gm-Message-State: AOJu0YwvxXGwUTqzyJ9Uw9xfTFOkpeeuBXJnemJdspoR01vPHpANz9Yw
	Y0Z3p6hGVXrLzMdKuhPK1xXeqF3UAhWnJ0gH920OxCgEtXwPL5vj
X-Google-Smtp-Source: AGHT+IEzpH2s+FyYQuJQvz8JnKB4KGeivzR2vLXk5na6VyCf61mfIusC1vv98wNn2kkP2u7K1nLGsg==
X-Received: by 2002:a17:902:ea01:b0:1d8:c8e8:11e1 with SMTP id s1-20020a170902ea0100b001d8c8e811e1mr288397plg.111.1706372461097;
        Sat, 27 Jan 2024 08:21:01 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j4-20020a170902c3c400b001d717e64f0esm2632893plj.87.2024.01.27.08.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 08:21:00 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 27 Jan 2024 08:20:59 -0800
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
Subject: Re: [PATCH v4 2/3] watchdog: Add ChromeOS EC-based watchdog driver
Message-ID: <1a9330f5-a469-4a46-8dc7-a15b274ff99d@roeck-us.net>
References: <20240126095721.782782-1-lma@chromium.org>
 <20240126095721.782782-3-lma@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240126095721.782782-3-lma@chromium.org>

On Fri, Jan 26, 2024 at 09:57:20AM +0000, Lukasz Majczak wrote:
> Embedded Controller (EC) present on Chromebook devices
> can be used as a watchdog.
> Implement a driver to support it.
> 
> Signed-off-by: Lukasz Majczak <lma@chromium.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Note that this should have been patch 2/2 (since the last patch
of the series has beel applied and is no longer part of the series).

Thanks,
Guenter
