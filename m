Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2ED8F4A
	for <chrome-platform@lists.linux.dev>; Wed, 22 Mar 2023 16:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679502490; x=1711038490;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=KfUvgiz4DVLzFaYO7oEOLPOOhMl2JyBbYso8oKRbz/4=;
  b=BmD8tCRaRZpZ/Kdpt6o8HriN434haTyWiJtpvtw3hoTNa3pS2V6r8eyp
   iWocqFWSGSK8IXOOk+qevIf4YHmkdHo55Ptn8/4MkvnJdL3r2xdpydXJ9
   1M7Vw8JLqctqoOswdEw9Z3VdUUTs4AL4dHptPND7TMJFxBdLUUrA/luQO
   GJB1Rv9RDIfYcBFdCl07937y65CceZtts4jh1yucL4kgnJ5FBn0sWZUVQ
   AxIVQfbyXa54sWMjgYfVyFqeHechfdEXupJNEhVPbod58YmTwPQV78Dt3
   fZxzEVYqQ2B5kxa4IzTYPT47vX7eQP4P/ybS7Jfbnbg88TGqBl4wAJfB7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="339300030"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="339300030"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 09:28:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="771102926"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="771102926"
Received: from jprokopo-mobl2.ger.corp.intel.com (HELO localhost) ([10.252.61.221])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 09:27:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Pin-yen Lin
 <treapking@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Scally
 <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Prashant Malani <pmalani@chromium.org>, Benson Leung
 <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Xin Ji
 <xji@analogixsemi.com>, linux-kernel@vger.kernel.org, Thomas Zimmermann
 <tzimmermann@suse.de>, linux-acpi@vger.kernel.org, Javier Martinez
 Canillas <javierm@redhat.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Lyude Paul <lyude@redhat.com>, =?utf-8?Q?N=C3=ADco?=
 =?utf-8?Q?las_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, Allen
 Chen <allen.chen@ite.com.tw>,
 dri-devel@lists.freedesktop.org, Marek
 Vasut <marex@denx.de>, Stephen Boyd <swboyd@chromium.org>,
 chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, Andi Shyti
 <andi.shyti@linux.intel.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Douglas Anderson <dianders@chromium.org>,
 Imre Deak <imre.deak@intel.com>, Linus Walleij <linus.walleij@linaro.org>,
 YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH v14 03/10] drm/display: Add Type-C switch helpers
In-Reply-To: <ZBrgD61p/p17IOJL@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230322104639.221402-1-treapking@chromium.org>
 <20230322104639.221402-4-treapking@chromium.org>
 <ZBrgD61p/p17IOJL@smile.fi.intel.com>
Date: Wed, 22 Mar 2023 18:27:56 +0200
Message-ID: <87edpg7nub.fsf@intel.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 22 Mar 2023, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> On Wed, Mar 22, 2023 at 06:46:32PM +0800, Pin-yen Lin wrote:
>> +#ifdef CONFIG_DRM_DISPLAY_DP_TYPEC_HELPER
>
> Ah, maybe this should use IS_REACHABLE() ?

Personally, I think IS_REACHABLE() is a build-time band-aid solution to
a problem that should be solved in Kconfig. :p

I think it always means there's a configuration combo that shouldn't
exist, and it's a surprise to the user when they've configured
something, Kconfig has deemed it a valid configuration, but they don't
get the feature they want.

As a user, how would they even debug that case? Double check configs,
don't see anything wrong.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
