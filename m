Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4C826CE2F
	for <chrome-platform@lists.linux.dev>; Fri, 31 Oct 2025 03:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761882014; cv=none; b=aLV9y3sRzRam3mGlSkY9bjbiQInp2pmhiLW8+KHwuvVEkXb0ZG9L3D31znKInZruPfW4/cqHPUNFFQVp5IGUVm3fnJ8SSOJKlUi3dD6tlkVWNNWfc5W5eS9APS0b9DqoBqMB2w9Cxp9gylxIMM5/Phz/yhrNLnUewX4Gb6N+A1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761882014; c=relaxed/simple;
	bh=gM5RhFkMrkwoG9YlIZTloFXNDXUz7Gvbvy7NTpm6vZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hs+pfJWRMAAqy6dgvcEDBPPeVTPw+6mt2D6sDuqH8ZJMftvF+wW3+JWFMKne6yuEebIK9rxVTkC/AVWY8KbOLZq2DgW2SZT96QAWA/DRvUqxkrfdzmdMmafstIo2n2Z42vhxEZq2HgtfMQM5uIqwWGEX0dtF7JiKgqcknuwxH/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XMUnyJqt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XMUnyJqt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C667DC116B1;
	Fri, 31 Oct 2025 03:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761882010;
	bh=gM5RhFkMrkwoG9YlIZTloFXNDXUz7Gvbvy7NTpm6vZ0=;
	h=From:To:Cc:Subject:Date:From;
	b=XMUnyJqt3B1e6Dt+euA85LuqzoX+pH5WWfERuNsXe7OMXNm1yqsKkywWkaMIq8laW
	 qdsiWa5rNGyrdVv8Xe0Fuytn2GKVIK8LlItBIDpHnZ9+qK4FYYRX/dFIL5+NAqo7g4
	 D8B8qcrvn0iu5LnoFqTT/Brnee8FWIdJjWvxFdujP5zDxWhU0+CCTC66Zk5XCrMjaz
	 yWYdWcDjVmPpmrXiWOMBIbe6J6tspa62ynlgCM7qC4aY8fNg3vtAD8N9EmekU6QW/l
	 y/Ts6WV8rAOZslfCJDaH4wngIf1ZrtPKPbqBNsb5VxYNax83Nlnrzr82RCIba1br9O
	 x4qYwenQrK3mg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>
Cc: Gwendal Grignou <gwendal@chromium.org>,
	chrome-platform@lists.linux.dev,
	tzungbi@kernel.org
Subject: [PATCH] platform/chrome: cros_ec_ishtp: Fix UAF after unbinding driver
Date: Fri, 31 Oct 2025 03:39:00 +0000
Message-ID: <20251031033900.3577394-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.2.997.g839fc31de9-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After unbinding the driver, another kthread `cros_ec_console_log_work`
is still accessing the device, resulting an UAF and crash.

The driver doesn't unregister the EC device in .remove() which should
shutdown sub-devices synchronously.  Fix it.

Fixes: 26a14267aff2 ("platform/chrome: Add ChromeOS EC ISHTP driver")
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec_ishtp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_ishtp.c b/drivers/platform/chrome/cros_ec_ishtp.c
index 4e74e702c5a2..3766cef81fe8 100644
--- a/drivers/platform/chrome/cros_ec_ishtp.c
+++ b/drivers/platform/chrome/cros_ec_ishtp.c
@@ -667,6 +667,7 @@ static void cros_ec_ishtp_remove(struct ishtp_cl_device *cl_device)
 
 	cancel_work_sync(&client_data->work_ishtp_reset);
 	cancel_work_sync(&client_data->work_ec_evt);
+	cros_ec_unregister(client_data->ec_dev);
 	cros_ish_deinit(cros_ish_cl);
 	ishtp_put_device(cl_device);
 }
-- 
2.51.2.997.g839fc31de9-goog

