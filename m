Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1787217D0
	for <chrome-platform@lists.linux.dev>; Wed, 11 Jan 2023 05:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0364DC433F0;
	Wed, 11 Jan 2023 05:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673416672;
	bh=b5DLEJVqYwKoFXxvAyztyTc02fDB5soZPzUlX9HIQmw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nTOSAz+N/h/noLFQcybAun3dU9MjN0W+ukDMHIng9I0Vch5j9+1iO9FVhgVTOMew0
	 4pyTjP341Dy29F03fG8mMvuunTqsHpwmpz2FtuTTggBDUctaCDI7s6Cm0sGO2TgkgO
	 xzOwwhSd9UNcjc9vgKY+MhnpaH9BXJkWb9a7FlxROb3Etpv9kkrQVx2Zv27zq8ajyU
	 42PgzJABq0LRuVGfcKQLe+n+HLgoGF6FR0C/irtJcA99Kp/S0w8dqbLrT5gOrBPiB+
	 zLIXfnaE/VrrRzjr/1YrxTLo2nbw+n58LLwa9MfeFE0PJzr2a3QBMKY7UTdiB48DrI
	 vW9AFjxVTPKQA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	Evan Green <evgreen@chromium.org>
Subject: [PATCH 3/4] platform/chrome: fix kernel-doc warning for last_resume_result
Date: Wed, 11 Jan 2023 13:57:27 +0800
Message-Id: <20230111055728.708990-4-tzungbi@kernel.org>
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
parameter or member 'last_resume_result' not described in 'cros_ec_device'

Cc: Evan Green <evgreen@chromium.org>
Fixes: 8c3166e17cf1 ("mfd / platform: cros_ec_debugfs: Expose resume result via debugfs")
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 include/linux/platform_data/cros_ec_proto.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
index 805dcb19a36d..4865c54d4af1 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -136,6 +136,10 @@ struct cros_ec_command {
  *                      transition failure if the sleep signal is not
  *                      asserted.  See also struct
  *                      ec_params_host_sleep_event_v1 in cros_ec_commands.h.
+ * @last_resume_result: The number of sleep power signal transitions that
+ *                      occurred since the suspend message. The high bit
+ *                      indicates a timeout occurred.  See also struct
+ *                      ec_response_host_sleep_event_v1 in cros_ec_commands.h.
  * @last_event_time: exact time from the hard irq when we got notified of
  *     a new event.
  * @notifier_ready: The notifier_block to let the kernel re-query EC
-- 
2.39.0.314.g84b9a713c41-goog

