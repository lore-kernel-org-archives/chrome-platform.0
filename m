Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9E417D0
	for <chrome-platform@lists.linux.dev>; Wed, 11 Jan 2023 05:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F0AC4339E;
	Wed, 11 Jan 2023 05:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673416670;
	bh=gZJkRd+YwpeXHFlqbFLXdbv2NUdIsovMBCE6wHT9zYc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tBToO+aOq18OuqeYtEvIsF6JLyI6oCXYYUsiIbAYKLHqtLdmZBhIOIChaw+QGQQgE
	 w1Qh8HqXBajqs5fG7d42rUntZmSvFqUrKU+V370V1pyDaG0F8CiQ3likggRX7qf7TN
	 9s+SVqHMke0DPS71fVoDC52Bcu4V8wF+7kyvafL7gssi+u8JfkXTSW0ejYabyiublL
	 5jKBwz67qw2cp/AghCJrf1Pj2mWNXQS3lCwiUbqk/8NNzJdnpEwvqic2BBVrJyIB21
	 JrqfArzStIhM6JOVT4kzoT384IkH1YkB1dpcrzSf4HwGN0WTrq9M4wUH5A9JySoLdW
	 Dt0m0kNFs6t8w==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	Rob Barnes <robbarnes@google.com>
Subject: [PATCH 1/4] platform/chrome: fix kernel-doc warnings for panic notifier
Date: Wed, 11 Jan 2023 13:57:25 +0800
Message-Id: <20230111055728.708990-2-tzungbi@kernel.org>
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

Fix the following kernel-doc warnings:

$ ./scripts/kernel-doc -none drivers/platform/chrome/*
drivers/platform/chrome/cros_ec_debugfs.c:54: warning: Function
parameter or member 'notifier_panic' not described in 'cros_ec_debugfs'

$ ./scripts/kernel-doc -none include/linux/platform_data/cros_ec_proto.h
include/linux/platform_data/cros_ec_proto.h:187: warning: Function
parameter or member 'panic_notifier' not described in 'cros_ec_device'

Cc: Rob Barnes <robbarnes@google.com>
Fixes: d90fa2c64d59 ("platform/chrome: cros_ec: Poll EC log on EC panic")
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_debugfs.c   | 2 ++
 include/linux/platform_data/cros_ec_proto.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform/chrome/cros_ec_debugfs.c
index 34f7b46f8761..a98c529d8c69 100644
--- a/drivers/platform/chrome/cros_ec_debugfs.c
+++ b/drivers/platform/chrome/cros_ec_debugfs.c
@@ -38,6 +38,8 @@ static DECLARE_WAIT_QUEUE_HEAD(cros_ec_debugfs_log_wq);
  * @log_mutex: mutex to protect circular buffer
  * @log_poll_work: recurring task to poll EC for new console log data
  * @panicinfo_blob: panicinfo debugfs blob
+ * @notifier_panic: notifier_block to let kernel to flush buffered log
+ *                  when EC panic
  */
 struct cros_ec_debugfs {
 	struct cros_ec_dev *ec;
diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
index 017d502ed66e..a4a3fec15504 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -140,6 +140,7 @@ struct cros_ec_command {
  *      main EC.
  * @pd: The platform_device used by the mfd driver to interface with the
  *      PD behind an EC.
+ * @panic_notifier: EC panic notifier.
  */
 struct cros_ec_device {
 	/* These are used by other drivers that want to talk to the EC */
-- 
2.39.0.314.g84b9a713c41-goog

