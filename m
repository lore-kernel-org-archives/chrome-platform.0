Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CF9226869
	for <chrome-platform@lists.linux.dev>; Tue, 10 Dec 2024 20:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733862334; cv=none; b=rp45e5TdV4v1AdBP18Ic4iNqa9yUw5cizdJ51JiObyqRbCD3aAU0CPftstMY/MwwAXdqFWmK+Y3mMWVdL+JXyWmqzljOLs0MBMDwDwLjz3Bf9s3JOT0Zq/OehKK9Azec2K6+4l1pD13yfyxI8A2NkQ/lHg4TL+DvDXFJsDeWPTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733862334; c=relaxed/simple;
	bh=Eftfg8/Dg5TvjrjAPiWy1krsu696melQ99u5UYTA1dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CEO9s9FDobw8d2Wb3r9MHNnkxvCdKyTz4wMcOjdrN5VR5BhbZSZqdbO3PGPA6gZufkEXDKctWcOrh3oG1u0WmcpwhdXBYhQGLcyfNPBohwokjF86MZ6ZuLnShhKARG8hunUavc8qpDf4IY73LOuqN1kemxHrhQO2Kf7vvKYRuso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M8i6tc66; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M8i6tc66"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54025432becso1398887e87.1
        for <chrome-platform@lists.linux.dev>; Tue, 10 Dec 2024 12:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733862331; x=1734467131; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AbCufamCvcmoTO2tkUzwZ6hlFtoLOKL9jj6eQkqSANQ=;
        b=M8i6tc66lgJVctau6sGdNHw89idq8o5F/XzrYP8Hpg/+LO7iYwK2ykIhWk4b0oOBGU
         JDR3cOaHyHNl/7Et/gLz7wMPsVw02+fo/hRbL/m3+/XQp5rHen22y1lqgRHHBkcwDc/f
         i721sRKp1R7lVG9RaGdNQ4qRjqsN6FZWYasTCatN7cUa85bi8uz55gxCXyGBgX/Fe2Mb
         dpldvJL1Vl3bRXT4awKKOqMQ/243X2nxstXSilv08uC+Z+Xbu6zu3pgLQGSAyJFxKyX+
         o/5X/3/ouEo8r9X6edUYwg3VpDko4znRkPLLmDN8SqeR4U2VDk47Xgk0eRcJwFaMZ0Hv
         aUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733862331; x=1734467131;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AbCufamCvcmoTO2tkUzwZ6hlFtoLOKL9jj6eQkqSANQ=;
        b=CPJsAu5BTnQHj2kQYVbOK9D69qGQ69Agd15VxVkFDmE5luPy44mswK9DSBJ4W9s1l9
         lBkaYpYnrbKBdtZ1D5KGDqS9LC2Ffzy8QgBgpmld8RBOO2Cw6E5oTSyIhSAFq1WmKkzp
         RZaCowRveRQQV3hXPZ1utBJ1dK6YAlChs1gFq0yXglTXzf75yQFkbquE8Fr6YGE5OUDh
         A+kgCUZQuAZX9wrTBkpNcdn3/e5GAiGHq8j0MwLJ4sZOWscbpkbNcX6UvbXERVXD7qh7
         WlWFIaX/CbIMdfRHMzko2x2I4mu9eTVSiwqr+1NzsX2a5Ep7xhoo6q8Dth67nbfUXoOR
         fnWg==
X-Forwarded-Encrypted: i=1; AJvYcCXYEsbn7BsTPlOKKUddYrZ9o8EW3K/OSy9EOoeIhrmgk+/B/tq35M2x5hX5X7Nahlner1DQUSjj8si3R+HTMXM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxG/dsvTDg95wODHm4VLnwQq87UShXv7lRY0zdYLfp0RS7fEKoS
	8p820NNxDkTmJu1qE2bRkpIBJudLt8r/IjaVV52TA5qm9qYZffBfVEbZ+hevQTg=
X-Gm-Gg: ASbGncuyUlcK7E/e8/ilhsgGtC3YqYgnAjuWsVVd58vTHcqx/zGwd+NktFzUL7kzWhB
	OvqSRCiADFBSzgnuAY1BDgaAZeSyKcsaViUNtBik5qiYQ7DBzxGi5xWatkme1Ii+fha0LDFEKFy
	vEcnZGmi3bnVLy/mkFN+/XYlh8b2B+T+DGMh97z9cRzvCWkC3DCmIOGDkbRJFblWhYQXzLLuveG
	zyek5MA3SgoHGn6BtijwXcXGEqFYnH6mTOWXhBi5BVmoA6kpeZoWXpYFVLEK31GBdhmPfd8CIz9
	lVYlJoS2KjyJbIBQojsorO1Jbr5Km+7JuA==
X-Google-Smtp-Source: AGHT+IE/6a9XGLsme7DQ7TSb4ZPIQEmSjWQFXWPgunivnIT1TRtOnxsoic/g6XxGYnyN7DNbPOeIIQ==
X-Received: by 2002:a05:6512:3194:b0:540:1b2d:8ee6 with SMTP id 2adb3069b0e04-5402a5d6aa3mr61232e87.7.1733862330891;
        Tue, 10 Dec 2024 12:25:30 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401ea77d14sm783579e87.113.2024.12.10.12.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 12:25:29 -0800 (PST)
Date: Tue, 10 Dec 2024 22:25:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v11 2/2] usb: typec: ucsi: Implement ChromeOS UCSI driver
Message-ID: <vgywywt6zixcp7mydb6lwixhvtjg7fkv4v3ttac6jjd5ikwphv@vfuy3oo4nsqa>
References: <20241210144527.1657888-1-ukaszb@chromium.org>
 <20241210144527.1657888-3-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241210144527.1657888-3-ukaszb@chromium.org>

On Tue, Dec 10, 2024 at 02:45:27PM +0000, Łukasz Bartosik wrote:
> From: Pavan Holla <pholla@chromium.org>
> 
> Implementation of a UCSI transport driver for ChromeOS.
> This driver will be loaded if the ChromeOS EC implements a PPM.
> 
> Signed-off-by: Pavan Holla <pholla@chromium.org>
> Co-developed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Co-developed-by: Łukasz Bartosik <ukaszb@chromium.org>
> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
> ---
>  MAINTAINERS                           |   7 +
>  drivers/usb/typec/ucsi/Kconfig        |  13 +
>  drivers/usb/typec/ucsi/Makefile       |   1 +
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 337 ++++++++++++++++++++++++++
>  4 files changed, 358 insertions(+)
>  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
