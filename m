Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF94643
	for <chrome-platform@lists.linux.dev>; Mon, 21 Mar 2022 07:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D5BC340E8;
	Mon, 21 Mar 2022 07:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647847102;
	bh=Pwp6sQixtqzl3bOa6QAUaAOxQIEUFhK8JMtjcBpVpDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ObaljEBIIt36s6lvN7hITTGlBx6XdVdueWqQ1pdTDqhtiBnreYLviOEp7OAZsyeuQ
	 p5I/Gt9Ee38ymaoYIPT1SaoO2+f1TBcAy9SFKBxaDs5PrmZ8uAi1OW4zZHebbQmXrs
	 CdDiJ1bj3ebW6LVPHL90zh2xEnG41SIGhhKbrIbI8TJ/zzDfkP8Zy4oa9OPdw0qKeg
	 HO8SgYBTrxTc8iz9ABjAwZYZr5aHgQuK2fS55/qtO6/cw2nKoK4+r6RoptXY47pNLa
	 TjXSxXGHdqvOJAwikDYoOgWFvh3LYXn/wvbU3BV5AOf6gq+634JGBh5M/1fSkZtCi/
	 8yS4Y8VeDtDNg==
Date: Mon, 21 Mar 2022 15:18:18 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: bleung@chromium.org, groeck@chromium.org, robh+dt@kernel.org,
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] platform/chrome: cros_kbd_led_backlight: support
 EC PWM backend
Message-ID: <Yjgmut/HndnYsPVE@google.com>
References: <20220314090835.3822093-1-tzungbi@kernel.org>
 <20220314090835.3822093-6-tzungbi@kernel.org>
 <20220318170751.GA687500@roeck-us.net>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318170751.GA687500@roeck-us.net>

On Fri, Mar 18, 2022 at 10:07:51AM -0700, Guenter Roeck wrote:
> On Mon, Mar 14, 2022 at 05:08:35PM +0800, Tzung-Bi Shih wrote:
> > @@ -142,6 +142,12 @@ config CROS_KBD_LED_BACKLIGHT_ACPI
> >  	help
> >  	  ChromeOS keyboard backlight ACPI backend.
> >  
> > +config CROS_KBD_LED_BACKLIGHT_EC_PWM
> > +	tristate "ChromeOS keyboard backlight EC PWM backend"
> 
> This is not a standa-alone module and should therefore be bool,
> not tristate.

Ack.

> > @@ -123,34 +130,122 @@ static const struct keyboard_led_drvdata keyboard_led_drvdata_acpi = {
> >  
> >  #endif /* IS_ENABLED(CONFIG_CROS_KBD_LED_BACKLIGHT_ACPI) */
> >  
> > +#if IS_ENABLED(CONFIG_CROS_KBD_LED_BACKLIGHT_EC_PWM)
> 
> #ifdef (with bool) should do.

Ack.  Will apply the fix for CONFIG_CROS_KBD_LED_BACKLIGHT_ACPI too.
