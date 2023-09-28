Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E61317F5
	for <chrome-platform@lists.linux.dev>; Thu, 28 Sep 2023 10:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695897732; x=1727433732;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=9oxlsXCCZ6M/NYmIyaV+iJn7sI4ohp3KeFmTH1hZjQo=;
  b=Ozp60IaxlaEmTuUqK3ZPJbQsJYMQ/dseRipECRxLMazRv5Gy2J55n14B
   lfbBEsrix7tiXcIhjpOCepQnZ+rBiXJl1iheIIKHOQavOazqNxJftaUsg
   OePaOqJupR/Tz87voqGF5bJGJpmeCnOyi5Kz0dZUfbvoSgjV9C6p4P3op
   Esp2Wm94MyYSdAiU5K2qgNHBcRyfbtC3ZCDyYIf4OawQ9/i2bdDhk+3TP
   l55wwhITsscK9mJECm0yHFHR6deG3T+0BQ0xvRmo2B8eSUOEzgw2rnFA0
   sJdsQq6ufSkFylcCqPEarRpW2Fc3KHZvQSilotOUpkQgv9OLwWMVnZMDD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="367089237"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="367089237"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 03:42:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="873255139"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="873255139"
Received: from bvardirx-mobl1.ger.corp.intel.com (HELO localhost) ([10.249.33.27])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 03:41:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Prashant Malani <pmalani@chromium.org>, Guenter Roeck <groeck@chromium.org>, Brian Norris <briannorris@chromium.org>, Zhengkang Huang <zkhuang@hust.edu.cn>, Dongliang Mu <dzm91@hust.edu.cn>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>, Gerd Haeussler <gerd.haeussler.ext@siemens.com>, Xing Tong Wu <xingtong.wu@siemens.com>, Tobias Schaffner <tobias.schaffner@siemens.com>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
In-Reply-To: <20230927081040.2198742-1-u.kleine-koenig@pengutronix.de>
References: <20230927081040.2198742-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 00/27] platform: Convert to platform remove callback returning void
Message-Id: <169589741739.3956.3954826044149691546.b4-ty@linux.intel.com>
Date: Thu, 28 Sep 2023 13:36:57 +0300
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 27 Sep 2023 10:10:13 +0200, Uwe Kleine-König wrote:

> this series converts all platform drivers below drivers/platform to use
> .remove_new(). The motivation is to get rid of an integer return code
> that is (mostly) ignored by the platform driver core and error prone on
> the driver side.
> 
> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

Once I've run some tests on the review-ilpo branch the patches
there will be added to the platform-drivers-x86/for-next branch
and eventually will be included in the pdx86 pull-request to
Linus for the next merge-window.

The list of commits applied:
[14/27] platform/mellanox: mlxbf-bootctl: Convert to platform remove callback returning void
        commit: a6cff4212984010c119263593c0a249e15ad5caf
[15/27] platform/mellanox: mlxbf-tmfifo: Convert to platform remove callback returning void
        commit: db971cf26014948d642522dae9a01968d009751c
[16/27] platform/mellanox: mlxreg-hotplug: Convert to platform remove callback returning void
        commit: a62507eb57124f4889b97de9917a164bf3109aa6
[17/27] platform/mellanox: mlxreg-io: Convert to platform remove callback returning void
        commit: e0489bb002ff581f9439de2d22b49e140e73e6b4
[18/27] platform/mellanox: mlxreg-lc: Convert to platform remove callback returning void
        commit: cfae9860ca990c5a642da85e01e0eb2e7dd9db35
[19/27] platform/mellanox: nvsw-sn2201: Convert to platform remove callback returning void
        commit: 61e2e9ee39d921756050dafeb91537284139f611
[20/27] platform/x86/intel: bytcrc_pwrsrc: Convert to platform remove callback returning void
        commit: 3e29812e6e172ba772761e6995753b729e8a6f77
[21/27] platform/x86: mlx-platform: Convert to platform remove callback returning void
        commit: 1348317db770681cde4c6ac04afd75a1b0a99098
[22/27] platform/x86: sel3350-platform: Convert to platform remove callback returning void
        commit: 9e6b44d43e31160bfba568244c785f439ac33d0e
[23/27] platform/x86/siemens: simatic-ipc-batt: Simplify simatic_ipc_batt_remove()
        commit: 0580422560e2b93fe2e343d8438823824729a574
[24/27] platform/x86/siemens: simatic-ipc-batt: Convert to platform remove callback returning void
        commit: 2f46e417384e0412c5e239fe6a84ace7d955b33e
[25/27] platform/x86/siemens: simatic-ipc-batt-apollolake: Convert to platform remove callback returning void
        commit: e139d97f049a8d924f91700a9a5f28c8bfe676d3
[26/27] platform/x86/siemens: simatic-ipc-batt-elkhartlake: Convert to platform remove callback returning void
        commit: 0d643dcd78423afad7204a280dc25dc67bcd85c0
[27/27] platform/x86/siemens: simatic-ipc-batt-f7188x: Convert to platform remove callback returning void
        commit: 49d371ab9d2c850867332b469fa6b3a2d5cf338c

--
 i.
