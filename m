Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D05017D0
	for <chrome-platform@lists.linux.dev>; Wed, 11 Jan 2023 05:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E123EC433EF;
	Wed, 11 Jan 2023 05:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673416665;
	bh=Mk40skoPR4r+0BN4BOH1ONk8Ia1ocZiHKo+VzEhih2s=;
	h=From:To:Cc:Subject:Date:From;
	b=inE9GSvsyGQogZl8Jrt7Jjz9DkuCyey3LD76Sq2NYe6/XvbXCEsCShnTwR+pwy64Z
	 pIN1m3OkmyET5FcVQ0swV4vcY0y/VWPHvdh7cSw/ZvUlg1Ifm/phlKz5sI51XL/SKw
	 mPU3V4fVu4d6uJG3nls0Uh59P9tBzYBkWGhwlPWzB1NmrigD19WDH9q2HoAbLNl8t6
	 jnvOMiGxxMWosCpW4d/A0WmIGyF7Wx6tRfdLNl+K+WQku0heT0RrOmFBOhTNsHCfEV
	 qzkfZTREeVeswEvGfWLNVeDhglF66orNu6+KU9lpdJNEGyLC7tOML0W5BE34e4EHht
	 AAETxE9vPmlrA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	Rob Barnes <robbarnes@google.com>,
	Evan Green <evgreen@chromium.org>
Subject: [PATCH 0/4] platform/chrome: fix kernel-doc warnings
Date: Wed, 11 Jan 2023 13:57:24 +0800
Message-Id: <20230111055728.708990-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series fixes kernel-doc warnings in various places.

All of them can be squashed into 1 fix actually.  However, I think it would
be more clear to separate the first 2 commits as the patches introduced
the warnings are quite new.

For the 3rd patch, I am not sure if it makes sense to have the Fixes tag.
It is a little bit old (~2019).

Tzung-Bi Shih (4):
  platform/chrome: fix kernel-doc warnings for panic notifier
  platform/chrome: fix kernel-doc warning for suspend_timeout_ms
  platform/chrome: fix kernel-doc warning for last_resume_result
  platform/chrome: fix kernel-doc warnings for cros_ec_command

 drivers/platform/chrome/cros_ec_debugfs.c      |  2 ++
 include/linux/platform_data/cros_ec_commands.h |  6 +++---
 include/linux/platform_data/cros_ec_proto.h    | 10 ++++++++++
 3 files changed, 15 insertions(+), 3 deletions(-)

Cc: Rob Barnes <robbarnes@google.com>
Cc: Evan Green <evgreen@chromium.org>

-- 
2.39.0.314.g84b9a713c41-goog

