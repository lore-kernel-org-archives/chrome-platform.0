Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C664223CE
	for <chrome-platform@lists.linux.dev>; Mon, 10 Jul 2023 05:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3390CC433C9;
	Mon, 10 Jul 2023 05:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688968399;
	bh=vSHUlZF1cMasn9YRdu77gltzVthY/lO7Soqy2M2BCbo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fgwuJQTMYvxVcvwuRkl9FdjB8DuXSIfnERjeVQPzNMvTHWGDy0KSITDFp9vZZSVWt
	 BT5d7U9DCHpzW20CplUiGePRbY/SJj2ZS6Wxro2pc9BRmUETT8rKT7m2+gDYE6jdip
	 yHi2ahZMt4qDeSRuoeDaNyFQ7KY3RPNuEgoWEz++4LgAoPP95Inj+/zxGHUUtWNO8V
	 RFRu44iA2kCumq1jXXly5EW/rJNxbOE3pESRGjYct89WpOiwnGEBO4HGCjEh7nKb5k
	 MEcMxeVU8CpG/uCKIO0RpnuVR1jqpcKQEF7BiyBK5nJnBZc+SLn0uO0J6kZessZSLJ
	 g7fDSMZvkaxIQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 13126F8370C;
	Mon, 10 Jul 2023 05:53:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] drm: Switch i2c drivers back to use .probe()
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <168896839907.3413.13132149372624191704.git-patchwork-notify@kernel.org>
Date: Mon, 10 Jul 2023 05:53:19 +0000
References: <20230526090709.1517297-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230526090709.1517297-1-u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
Cc: airlied@gmail.com, daniel@ffwll.ch, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 jagan@amarulasolutions.com, bleung@chromium.org, groeck@chromium.org,
 ple@baylibre.com, adrien.grassein@gmail.com, peter.senna@gmail.com,
 martin.donnelly@ge.com, martyn.welch@collabora.co.uk, dianders@chromium.org,
 linux@armlinux.org.uk, stefan@olimex.com, sam@ravnborg.org,
 f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 javierm@redhat.com, alsi@bang-olufsen.dk, ojeda@kernel.org,
 antonio.borneo@foss.st.com, jiasheng@iscas.ac.cn, quic_abhinavk@quicinc.com,
 a.fatoum@pengutronix.de, andriy.shevchenko@linux.intel.com,
 heikki.krogerus@linux.intel.com, Jonathan.Cameron@huawei.com,
 tzimmermann@suse.de, kabel@kernel.org, benjamin.mugnier@foss.st.com,
 cmo@melexis.com, xji@analogixsemi.com, hsinyi@chromium.org, windhl@126.com,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 chrome-platform@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Douglas Anderson <dianders@chromium.org>:

On Fri, 26 May 2023 11:07:09 +0200 you wrote:
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() from
> struct i2c_driver.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> [...]

Here is the summary with links:
  - [v2] drm: Switch i2c drivers back to use .probe()
    https://git.kernel.org/chrome-platform/c/332af828ce78

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


