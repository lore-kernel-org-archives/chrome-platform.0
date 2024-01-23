Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406F24EB39
	for <chrome-platform@lists.linux.dev>; Tue, 23 Jan 2024 22:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706047578; cv=none; b=j2l0pNYsPVp2bwm2w3/ZKpuBzjE6K2uJuA8nKSmVKIzpqwOPJqyF9BDqoZvGYrfvr8k5EwBdoftxE0CNBlRjScyXzQLLNOUQYFPGQGbStg0YgySBKnUI7hZyGNspzY/S2WNswVrD3MzCx6TNtV4ZMRC+c5aYACU5EatNN1cdnhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706047578; c=relaxed/simple;
	bh=meSKnuOdhgy7gcRPOlUjLkTPmz4xSbL8Ff1ES37ltmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uiNOKfoB7ltHuAuqYG42Rp9ADpAGgC5+ILL4b8GCF62JiZKXMx0SpYJJwat2wakfM77HZX8pI2LIYVBXH+yXrkxVB3SkHQytlERnVpodh1zG+bV1vOXkMUr75jyv0pMNsWJam6wKdeJuYEn2YiUApOZFnS4sDh91eZwqRpF6yIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ntftxQ+m; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ntftxQ+m"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6dd87e7c355so276167b3a.0
        for <chrome-platform@lists.linux.dev>; Tue, 23 Jan 2024 14:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706047576; x=1706652376; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vq5AuVtFfbnm7KmCdFym6eR8lK3cF/V0+/5wIAUspAY=;
        b=ntftxQ+m6xP8IAvLzY60y1LRoRDKthCyMlKwvi+Bl1s24yat+w2y2eb8KXJPuvnRZ+
         rPLZ/wFK+TKlTxLC0Js5ZeJosGuyRf7ytLLjdtOkE5LYEYctotcp9JSWEKhRM5XvIAEJ
         SKyPhbtsY7I9tqOThP/hYeqynVBxJsFe1QYB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706047576; x=1706652376;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vq5AuVtFfbnm7KmCdFym6eR8lK3cF/V0+/5wIAUspAY=;
        b=joDksb1wlx2fVbc1FN9LCFvDV0Ta12n1EmkuG3OI5c2Ji86RqEoHXTnbImO2nlZMWP
         nQNO4hZ1oRn3hy3sm53p876uYH7aG7LlLKftX3p99Un215YDvYoWcoMGPwlCt0VZpz0o
         5hSw46BpAANMbgqkyXoH0hXXO5i6LWLJXgSDFAHjKg8NYOMYmZqUK5yPEW+R4k5y5Z7f
         EjmBb48HBGx7GuRPH4PFjtV+hHAi5AOibAyfKCZW8BkesjKkW31symBNvBQhLMkl1BLI
         kUxhnAvpCLRTYHyDCws2WDqdbJeVsfPW80EUyh7LFtKh3coxYmmGv7RCCFAzNJavgKUU
         sTPw==
X-Gm-Message-State: AOJu0YzpxVyjy+J/D3oF8DBta+/SVVGH3YRJAPo/xd6/3BkiXi1snzyr
	/9xBYaizWASmMpkFxUDue7uVSkleHZSyysvjB9BW9w3cg0Ma0BgmEVbrEJTYLw==
X-Google-Smtp-Source: AGHT+IEdVicNP58IhFXYtzEbHaHvo9B2Vu+JPgRZ94CmAr/MeKEbwhzMtBto0WE4UQD2qQdKhczlCw==
X-Received: by 2002:a05:6a00:99d:b0:6db:c9d2:12de with SMTP id u29-20020a056a00099d00b006dbc9d212demr4353111pfg.49.1706047576571;
        Tue, 23 Jan 2024 14:06:16 -0800 (PST)
Received: from localhost ([2620:15c:9d:2:81da:d4e1:ee51:c4d6])
        by smtp.gmail.com with UTF8SMTPSA id m6-20020a62f206000000b006dd897cd81csm95631pfh.53.2024.01.23.14.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 14:06:16 -0800 (PST)
Date: Tue, 23 Jan 2024 14:06:14 -0800
From: Brian Norris <briannorris@chromium.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>, kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	chrome-platform@lists.linux.dev,
	Abhijit Gangurde <abhijit.gangurde@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] firmware: coreboot: Generate aliases for coreboot
 modules
Message-ID: <ZbA4VthTMPT7BSRo@google.com>
References: <20240112131857.900734-1-nfraprado@collabora.com>
 <20240112131857.900734-3-nfraprado@collabora.com>
 <ZaQVScQ2AYquG-Zr@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZaQVScQ2AYquG-Zr@smile.fi.intel.com>

On Sun, Jan 14, 2024 at 07:09:29PM +0200, Andy Shevchenko wrote:
> On Fri, Jan 12, 2024 at 10:18:31AM -0300, Nícolas F. R. A. Prado wrote:
> > Generate aliases for coreboot modules to allow automatic module probing.
> 
> ...
> 
> > (no changes since v1)
> 
> Same Q as per v1.

I don't have v1 in my inbox, and this wasn't addressed in v3 either. But
copy/pasted off the archives:

"Don't you want to have a driver data or so associated with this?"

These drivers are super simple, and I doubt they will end up with
multiple tags per driver, so it seems unlikely we'd ever need it.
Additionally, struct coreboot_device already includes the tag
information, so anything that could be included in driver data could be
parsed out by the driver at probe time, if absolutely needed.

Brian
