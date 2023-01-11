Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94AB17D0
	for <chrome-platform@lists.linux.dev>; Wed, 11 Jan 2023 05:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B780DC433EF;
	Wed, 11 Jan 2023 05:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673416671;
	bh=21dMGHoId7gi9efAX9NuJf+S3vLBcVm9tLrr+orU57I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hmpG4mycjXsWItX4LQ2qGMziie4f25zWYzNKaysLcRTGbGKpNQj6FMmby6rCTNFDT
	 erxL8BgnVSRsw2OWPw86K0xEC4y+SGx+jE7nWpxLwgaP3D+A8uoi3vmafwruKtFeyb
	 5VXhyBHPfRhq+BPUIk8wbOhjxYqhOW2hrqxUvs1ZYAUHRkujO/5dxPGPnEpOUbvLe+
	 qc5k1RifWni86Epmpc3SLU9mAhJV6z2fn78yuKT5Lcp64/SYId8fMV3VErKJtTsQJs
	 dw1OhkaF2Lv5/kB/eBPx1FIHPhubmV+MYVS2o1639UUlRSyirFetpidiz0J2C6djR9
	 DAIaAM639DESA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	Evan Green <evgreen@chromium.org>
Subject: [PATCH 2/4] platform/chrome: fix kernel-doc warning for suspend_timeout_ms
Date: Wed, 11 Jan 2023 13:57:26 +0800
Message-Id: <20230111055728.708990-3-tzungbi@kernel.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230111055728.708990-1-tzungbi@kernel.org>
References: <20230111055728.708990-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following kernel-doc warning:

$ ./scripts/kernel-doc -none include/linux/platform_data/cros_ec_proto.h
include/linux/platform_data/cros_ec_proto.h:187: warning: Function
parameter or member 'suspend_timeout_ms' not described in 'cros_ec_device'

Cc: Evan Green <evgreen@chromium.org>
Fixes: e8bf17d58a4d ("platform/chrome: cros_ec: Expose suspend_timeout_ms in debugfs")
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 include/linux/platform_data/cros_ec_proto.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
index a4a3fec15504..805dcb19a36d 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -131,6 +131,11 @@ struct cros_ec_command {
  * @event_data: Raw payload transferred with the MKBP event.
  * @event_size: Size in bytes of the event data.
  * @host_event_wake_mask: Mask of host events that cause wake from suspend.
+ * @suspend_timeout_ms: The timeout in milliseconds between when sleep event
+ *                      is received and when the EC will declare sleep
+ *                      transition failure if the sleep signal is not
+ *                      asserted.  See also struct
+ *                      ec_params_host_sleep_event_v1 in cros_ec_commands.h.
  * @last_event_time: exact time from the hard irq when we got notified of
  *     a new event.
  * @notifier_ready: The notifier_block to let the kernel re-query EC
-- 
2.39.0.314.g84b9a713c41-goog

