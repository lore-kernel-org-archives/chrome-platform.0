Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A53849C
	for <chrome-platform@lists.linux.dev>; Wed, 26 Jul 2023 08:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690361949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xeRT9Jy7eVenEoTjFFWWmP+a03yBpOH5hVPtQnivUcw=;
	b=BDIziQgMaK/eAdvuhO1U2bccgN4KQxLMHSCfap1o19FLI80fU1BJGRU2m1YFt+n+wqu/qZ
	btvGecQvbj+JH3rsKFoPA30/aPLvrXXSPwnEpGItVpKqpavWYfVvR1iT4vZ75ZfgKXiC0/
	VN2eJn66de27td/qh2IUl2VsBudLIig=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-HdtfQdAFNCK7bmOh3lau2A-1; Wed, 26 Jul 2023 04:59:06 -0400
X-MC-Unique: HdtfQdAFNCK7bmOh3lau2A-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-989249538a1so428215566b.1
        for <chrome-platform@lists.linux.dev>; Wed, 26 Jul 2023 01:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690361945; x=1690966745;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xeRT9Jy7eVenEoTjFFWWmP+a03yBpOH5hVPtQnivUcw=;
        b=RTXOthxK3H4MY7O59svpxKNKX+BftKVe0DEzNNx/f1+MvwM830E35jfFBC22qSBqYX
         mB2SPouueBsVPWDfxRrH6t/Cx+AoWIgJDHuocbtgLvZG/w+xXZkcVwQ/UDIEulY4A78l
         G0HItXupVW3W22lYndes8qt0aGtlwxwkNwB0PIn9huXKh/HA8G3FtjkLSLmy+IGmi20A
         npvYYjP6GolNTIWh5ghTjTlTbSI/zuxnV1IifyD4O5xh3Hx+qCVmoG7/Hw7wEM+N11EI
         omJn/uNYdKm1xNhLryXPhUuZWveZUmPIj8Oq3ykmzrO8zELV2Z/KWeCBj3bR1VGnk5hM
         Mgog==
X-Gm-Message-State: ABy/qLaJEdbXYJdfWBhoqgYMPrHCfqw8OrlQxT5cVavYHqaFo/p7xGyJ
	Ldv++VJB/5/a55Pqxot4ZokDeQscNEyfeg2azQKGMwY8EeAsSCnoO2ti55HfAhnDrhcyIe1BjLt
	PlfU9S48YR5CwQ+oR2OTqSyS4QCIn
X-Received: by 2002:a17:906:3098:b0:99b:b3a1:437b with SMTP id 24-20020a170906309800b0099bb3a1437bmr1128248ejv.40.1690361945545;
        Wed, 26 Jul 2023 01:59:05 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGce74iNdoqahohZBou7UapwNEzH+hZVT14Xqe7CfDrQV51dAMGR6N625plRzskQ5Ljavku+Q==
X-Received: by 2002:a17:906:3098:b0:99b:b3a1:437b with SMTP id 24-20020a170906309800b0099bb3a1437bmr1128238ejv.40.1690361945266;
        Wed, 26 Jul 2023 01:59:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a18-20020a1709065f9200b0096f6a131b9fsm9234448eju.23.2023.07.26.01.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 01:59:04 -0700 (PDT)
Message-ID: <4ef7791f-57f3-c27f-f414-9a39e014b86e@redhat.com>
Date: Wed, 26 Jul 2023 10:59:03 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] platform: Explicitly include correct DT includes
To: Rob Herring <robh@kernel.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Mark Gross <markgross@kernel.org>,
 Vadim Pasternak <vadimp@nvidia.com>
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20230714174909.4062739-1-robh@kernel.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230714174909.4062739-1-robh@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/14/23 19:49, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
>  drivers/platform/chrome/cros_ec.c          | 1 +
>  drivers/platform/mellanox/mlxreg-hotplug.c | 1 -
>  drivers/platform/mellanox/mlxreg-io.c      | 1 -
>  3 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
> index 8b7949220382..5d36fbc75e1b 100644
> --- a/drivers/platform/chrome/cros_ec.c
> +++ b/drivers/platform/chrome/cros_ec.c
> @@ -12,6 +12,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/slab.h>
> diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
> index b7dcc64cd238..6ddfea0d4c5b 100644
> --- a/drivers/platform/mellanox/mlxreg-hotplug.c
> +++ b/drivers/platform/mellanox/mlxreg-hotplug.c
> @@ -12,7 +12,6 @@
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_data/mlxreg.h>
>  #include <linux/platform_device.h>
>  #include <linux/spinlock.h>
> diff --git a/drivers/platform/mellanox/mlxreg-io.c b/drivers/platform/mellanox/mlxreg-io.c
> index ddc08abf398c..83ba037408cd 100644
> --- a/drivers/platform/mellanox/mlxreg-io.c
> +++ b/drivers/platform/mellanox/mlxreg-io.c
> @@ -11,7 +11,6 @@
>  #include <linux/hwmon.h>
>  #include <linux/hwmon-sysfs.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_data/mlxreg.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>

