Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8897D39C632
	for <chrome-platform@lists.linux.dev>; Wed, 29 Jul 2026 10:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785321146; cv=none; b=IGHpP5gRm0royeQoYgiavpEDiHZZzWUelGsQ4XhOx6DggQfcyWDa0RC0nKEFEwoOd7RqHHhrARYRPRAOHRbHnSq7eOBJZvaMHFx3NMiNj44t2PQr0Mj1+HeU1tuf/zPUMYuiL8v6skUtT+nW2u9xVwuvfQHhPzs4e8Qe/c+NWMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785321146; c=relaxed/simple;
	bh=T/G55Gfem0/LxrV7UriSBprfjNNc5ZAgPi4P3yzi6Tc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RFEHlSc5Sj/pqOL42qKAj+qtDLxyXyz/mySz31UXuVpnFyNlQAEQUC98fuNN8WhzgyWTH0DDM/8IelD6aWWcO7ZvvOSEN0t1aav1o0jL009YwBEYtKAkIz4M5Jpsxxev77+kjNhhNpfG9EzWvanFGvpfVYu5t85acbZGEtODDSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=goTb3sny; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="goTb3sny"
Received: from LAPTOP-99KJFSET (unknown [36.153.54.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 480465fca;
	Wed, 29 Jul 2026 18:32:18 +0800 (GMT+08:00)
From: Hongyan Xu <getshell@seu.edu.cn>
To: bleung@chromium.org,
	tzungbi@kernel.org
Cc: groeck@chromium.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn
Subject: [PATCH v2 1/2] platform/chrome: cros_ec_debugfs: clean up console log on probe failure
Date: Wed, 29 Jul 2026 18:32:16 +0800
Message-ID: <c00974953a1b952f51f0f021d7f9fad134159909.1785320940.git.getshell@seu.edu.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fad6ea92e03a1kunm4196f57811751c
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGENOVk1MGR0fGR8ZSUpNSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKTkhVTk9VSktKWVdZFhoPEhUdFFlBWU9LSFVKS0hKTk
	xOVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=goTb3sny9lKFtl4LW8Q0rMbtNNrgBvX10+iYtoIdDGDpA2OgRWI6A4csECUCUXz5rL/JWHCeIWP912Vzjo7fwSjkXMV3A1E4F8i9DXgw1Tq0xV+yrrpWn5BTwbBabwVehJ9SH0I6xNF4+W4Yy1SN2w44c0bedx1laPJKgGMqVdY=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=l123yFOhaKH5KK/n01rBHhx+pjOqlg6BYvnViNMG9MU=;
	h=date:mime-version:subject:message-id:from;

cros_ec_create_console_log() starts log_poll_work when console logging is
supported. If the following panic notifier registration fails, probe
removes the debugfs entries but leaves the delayed work scheduled. The
work can then access devm-managed data after the failed probe tears it
down.

Add a dedicated error label for failures after successful console log
setup. Earlier failures keep using the existing debugfs-only cleanup
path.

This issue was found by a static analysis tool.

Fixes: d90fa2c64d59 ("platform/chrome: cros_ec: Poll EC log on EC panic")
Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
---
Changes in v2:
- Split the console log probe cleanup into a separate patch.
- Add a dedicated cleanup_console_log error label.

Link to v1: https://lore.kernel.org/r/20260728123423.781-3-getshell@seu.edu.cn

 drivers/platform/chrome/cros_ec_debugfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform/chrome/cros_ec_debugfs.c
index 92ac9a2..a781bb5 100644
--- a/drivers/platform/chrome/cros_ec_debugfs.c
+++ b/drivers/platform/chrome/cros_ec_debugfs.c
@@ -525,7 +525,7 @@ static int cros_ec_debugfs_probe(struct platform_device *pd)
 	ret = blocking_notifier_chain_register(&ec->ec_dev->panic_notifier,
 					       &debug_info->notifier_panic);
 	if (ret)
-		goto remove_debugfs;
+		goto cleanup_console_log;
 
 	ec->debug_info = debug_info;
 
@@ -533,6 +533,8 @@ static int cros_ec_debugfs_probe(struct platform_device *pd)
 
 	return 0;
 
+cleanup_console_log:
+	cros_ec_cleanup_console_log(debug_info);
 remove_debugfs:
 	debugfs_remove_recursive(debug_info->dir);
 	return ret;
-- 
2.50.1.windows.1
