Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0D72564
	for <chrome-platform@lists.linux.dev>; Mon,  9 Jan 2023 08:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81248C433D2;
	Mon,  9 Jan 2023 08:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673252166;
	bh=WfMzB2hxVN9jcuxaN+m/VJovl2M9TfVqZdfDV67Ju58=;
	h=From:To:Cc:Subject:Date:From;
	b=SGsjV58+OQXD/1s3lTUVqJozi2RqIgDpJEMgJkYUe9QVyOrrBV/nNCAy0HLgle4Ia
	 IistMjxl2jALQVPLtJsGM5a/IJYn0Rzjxc0X4gxQi4odlYxS+4m8T7kJ/IK/jUULQE
	 mdb8vW6ewDUdov91/jJ/WrNVqmlCz+7O8bvrBLdZUIlTbNxlNo9/BuJAc7CONYfa9Q
	 F9ZHEtUmJI0ExqqvvU2sbSMPX4BX9EAC8OXBb9lgTbyqY56LRejX9NF0DzzO9fmrJl
	 I9xZqNw3cU0iX/+dgiizKj36l8az0ONdZMeH0ZAE93FSA3dh0vs3BjDi/UE9elc3Hz
	 9GA2LZYtgt2Sw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	markhas@chromium.org,
	bhanumaiya@chromium.org,
	error27@gmail.com
Subject: [PATCH] platform/chrome: cros_ec_uart: fix negative type promoted to high
Date: Mon,  9 Jan 2023 16:15:54 +0800
Message-Id: <20230109081554.3792547-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

serdev_device_write_buf() returns negative numbers on errors.  When
the return value compares to unsigned integer `len`, it promotes to
quite large positive number.

Fix it.

Fixes: 04a8bdd135cc ("platform/chrome: cros_ec_uart: Add transport layer")
Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Reported in https://lore.kernel.org/chrome-platform/Y7fhw4S7Tb0GcHMF@kili/T/#u.

 drivers/platform/chrome/cros_ec_uart.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_uart.c b/drivers/platform/chrome/cros_ec_uart.c
index 6916069f1599..788246559bbb 100644
--- a/drivers/platform/chrome/cros_ec_uart.c
+++ b/drivers/platform/chrome/cros_ec_uart.c
@@ -149,9 +149,10 @@ static int cros_ec_uart_pkt_xfer(struct cros_ec_device *ec_dev,
 	resp->status = 0;
 
 	ret = serdev_device_write_buf(serdev, ec_dev->dout, len);
-	if (ret < len) {
+	if (ret < 0 || ret < len) {
 		dev_err(ec_dev->dev, "Unable to write data\n");
-		ret = -EIO;
+		if (ret >= 0)
+			ret = -EIO;
 		goto exit;
 	}
 
-- 
2.39.0.314.g84b9a713c41-goog

