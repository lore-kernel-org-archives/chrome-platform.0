Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937C31C2B
	for <chrome-platform@lists.linux.dev>; Thu, 29 Dec 2022 09:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE32BC433F0;
	Thu, 29 Dec 2022 09:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672307270;
	bh=yKOzOYiAkgTlBnm4w4S1oepMYaDqkAK5zTqORlYJ8do=;
	h=From:To:Cc:Subject:Date:From;
	b=ao8vy62H9gQyUMwLOh3VjAVVUaljFKhz2AYQU9TMRLEd6QhNu6b87txKU/ohneNSF
	 OGvhZ244B6vuf8wu9rDZVtetIrSPIxeGJfi0K/Ox5Lu8Op7U+FhNflK/Ygq/3QvKht
	 RtKJyX3bHZnqHot7s6Bqbr6sxBwsbYOZ7bIOPxRgA0DMQVc7x5EDUpLtNgbw9p+rcX
	 bBRoWEeRvk3YubVzb4O5qKuqjlL+CGXj948AsPiNDYqzR1kk8vbfUI0iBrfpT9GuM1
	 PqSz5SEML2XGhDAxVrCHl9iB1/59KqfRgXGmRDrqYwH02yM+y6RpaV0pzHKCIGrWl1
	 XK13+QsG7rFeA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	robertzieba@google.com,
	markhas@chromium.org,
	bhanumaiya@chromium.org
Subject: [PATCH] platform/chrome: cros_ec_uart: fix race condition
Date: Thu, 29 Dec 2022 17:47:38 +0800
Message-Id: <20221229094738.2304044-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Robert Zieba <robertzieba@google.com>

serdev_device_set_client_ops() is called before `ec_dev` is fully
initialized.  This can result in cros_ec_uart_rx_bytes() being called
while `ec_dev` is still not initialized, resulting in a kernel panic.

Call serdev_device_set_client_ops() after `ec_dev` is initialized.

Fixes: 04a8bdd135cc ("platform/chrome: cros_ec_uart: Add transport layer")
Signed-off-by: Robert Zieba <robertzieba@google.com>
[tzungbi: modified commit message and fixed context conflict.]
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
This is from https://crrev.com/c/3490635.  I just found the patch when
reviewing some downstream patches.

 drivers/platform/chrome/cros_ec_uart.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_uart.c b/drivers/platform/chrome/cros_ec_uart.c
index 0cef2888dffd..6916069f1599 100644
--- a/drivers/platform/chrome/cros_ec_uart.c
+++ b/drivers/platform/chrome/cros_ec_uart.c
@@ -270,7 +270,6 @@ static int cros_ec_uart_probe(struct serdev_device *serdev)
 	}
 
 	serdev_device_set_drvdata(serdev, ec_dev);
-	serdev_device_set_client_ops(serdev, &cros_ec_uart_client_ops);
 	init_waitqueue_head(&ec_uart->response.wait_queue);
 
 	ec_uart->serdev = serdev;
@@ -300,6 +299,8 @@ static int cros_ec_uart_probe(struct serdev_device *serdev)
 			   sizeof(struct ec_response_get_protocol_info);
 	ec_dev->dout_size = sizeof(struct ec_host_request);
 
+	serdev_device_set_client_ops(serdev, &cros_ec_uart_client_ops);
+
 	return cros_ec_register(ec_dev);
 }
 
-- 
2.39.0.314.g84b9a713c41-goog

