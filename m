Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDEF42061
	for <chrome-platform@lists.linux.dev>; Thu, 28 Mar 2024 15:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711639949; cv=none; b=WWSh+l0qj1VrCmwYiTXKFUWn/8hlhIWDU/s3wJ/C6xLNsVyKAUyuYwKip3Z+hM3rNtxkPIaIF6vBIEAP07IPZ9sZtt0082bGxDvSo9WIgWiyO1dk1wYwn1HagN+JWm2RWWqtlKF3hFs0CdB3DPSI2BZrr1JxgvkEXPTkfmp4Fz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711639949; c=relaxed/simple;
	bh=MxJfELHb/ZTHQmCUFrKhSwgtmJ0UUkjaK/hhdG86Tbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JeUKLkSlwB3GRFVABvYrNG/nzSbojsQ+pjcMa8awfPFn7Edrnl7EK04V3U6m1IZ/Man9dG/yzOpIdUNdQpYlT74Z7P0qAYfFjLtAMZoGfFiw8dLSvZjA5TAz0Ct+f+3qguD3rL/NXkg6d1crZrDL6d5IKIL2LghjYUvIe+xe9Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ki9ZaMbb; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ki9ZaMbb"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-515a86daf09so1395008e87.3
        for <chrome-platform@lists.linux.dev>; Thu, 28 Mar 2024 08:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711639946; x=1712244746; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lXM/B0D5ELcLLV0Ges/OZ3bWdZ/dJWeP2NzZMjp2T8A=;
        b=ki9ZaMbbGFvwoP4Y3WrzmpuexeIHjJjMSZ2MaBNbfrgmV0nqrhq8Qq2dzyUu3J1Urh
         0Hht7PYafDGYMA0/xAa/lqh6yrGdGydnUp+C4DjmaYPqGrCo9hft0Z0mbV/0upF/+cxV
         zVMXl1cpD8jNK/6cc3STW8kNH3xGqCSO2IQgNlsg7ElhO/SBTp/OSwKea29rKpeJBqE1
         YYu3d7U6ZToIwiu64iKOcv/qxwG12uy2Pm+kqxSV6uAX9ubXU6CxvgnLoT8tNZB7tMBj
         HX2viAzk6Ehu6db1ZqKESOMZDeRLrdHTG1JgjC/yTq3l8k1gxM8Ob5HlyWn4Juory/Md
         oAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711639946; x=1712244746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lXM/B0D5ELcLLV0Ges/OZ3bWdZ/dJWeP2NzZMjp2T8A=;
        b=fjJk6/JGKJPjABfkVdzFajlsZgPNiqT9v8PM/T/LjLLc4Dco0sWMPShEbzqXeHI+WI
         uyEQ4cPv5RDfbKvy3GvMjjQ65xbS/n6L2+V0NyqpmAcg6R3jnp3tuzVezOcwuxrLJdT+
         cJ3KgkIszeZC7VPb9wI5HotZ5JtAA0+YMD2kOsW8b4ba3AhOUIvZ1ou+L9tar+vnkea2
         H5d0z1kzqjrTCD1/8+ug29DcsK6gsoATrtfbBJNTmlV/3983u/p/X2elvfbWA0VBZSgM
         6EWgpPrA0NnxPvBjvw2GhedP+21T8mv0qFtNluB/CTzK3vcaUjdlW6BoeKt6L+yOUpZM
         H/aQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+5aAhoUGphPLeAi8+5z5LuavejzTanQTbnEoDviXe29avPpJYrNcuh31TBJfKvwmC9o1phiAoXsRZxFLkyhP5oSYyvY7qcgbJQLlevaR+
X-Gm-Message-State: AOJu0Yxt8H/jIEL4lXszKIKBReYaLSnWeUX45qXimmKiirE+YWl4Ukn8
	TzfdeNYysN60xq/wyH544jvxYYY9xwwOJYOBW2G/BOYtZEwwup31ZktTM0WFzbQ=
X-Google-Smtp-Source: AGHT+IGjkuFmHs+Dy7UnY42ArmjBqrezgKsmPQ7Wh0/do2fY1/2ILRqdBpaOiiniwgbug+NLTvlShw==
X-Received: by 2002:a05:6512:534:b0:515:a876:68a0 with SMTP id o20-20020a056512053400b00515a87668a0mr2226473lfc.14.1711639945799;
        Thu, 28 Mar 2024 08:32:25 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a00e:a300::227? (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
        by smtp.gmail.com with ESMTPSA id j11-20020ac2550b000000b00515a6e4bdbdsm238086lfk.250.2024.03.28.08.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 08:32:25 -0700 (PDT)
Message-ID: <1b040be3-acd7-40dc-bc9b-24ea6d4b8377@linaro.org>
Date: Thu, 28 Mar 2024 17:32:24 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] platform/chrome: cros_ec_ucsi: Implement UCSI PDC
 driver
To: Pavan Holla <pholla@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Guenter Roeck <groeck@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
 chrome-platform@lists.linux.dev
References: <20240325-public-ucsi-h-v2-0-a6d716968bb1@chromium.org>
 <20240325-public-ucsi-h-v2-3-a6d716968bb1@chromium.org>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240325-public-ucsi-h-v2-3-a6d716968bb1@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/03/2024 01:42, Pavan Holla wrote:
> Implementation of transport driver for UCSI. This driver will be used
> if the ChromeOS EC implements a PPM.
> 
> Signed-off-by: Pavan Holla <pholla@chromium.org>
> ---
>   drivers/platform/chrome/Kconfig                |  14 ++
>   drivers/platform/chrome/Makefile               |   1 +
>   drivers/platform/chrome/cros_ec_ucsi.c         | 247 +++++++++++++++++++++++++
>   include/linux/platform_data/cros_ec_commands.h |  19 ++

While it's fine to use platform/chrome for platform drivers, please 
place drivers which have a subsystem into the subsystem dir. I think we 
don't want to hunt UCSI implementations all over the codebase. Please 
use drivers/usb/typec/ucsi/ location for your driver. This also removes 
a need for a global header.

-- 
With best wishes
Dmitry

