Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE36C4279E9
	for <chrome-platform@lists.linux.dev>; Tue, 28 Jul 2026 12:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785242073; cv=none; b=b5vs2NbGvft3aAjqF7PY/DFK8z5BKlv3TLsyeVuUFeCwzkBL+PQz6R2O8FSjpoznwrKWb5+cnKg+6KO2aAGhkwK99wUM5FIOVkuEcItXpwLl3dS1Ms9GPq+79Epjoit0mZc7CrXi73Q/Ldhi1xHnIgWI9ZuWHNn36cceLvmT8OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785242073; c=relaxed/simple;
	bh=htDpTgzApN0KcVwKIBV5f4H5ahf07fFYbYFAntTuWio=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lxV9bdkjpO9SYGGlg5kuRGf5OQsIFeoXA3nQrHboWgfL7cmdvF7H60b7qrpdDc49S/FUaRXHnDDe1X6Kxg7AcQxycLla3kCWpDYbEif7BDFLkTl4LPEMqJA2CXk5pjxbqc41R487XKbgn3NXmondbxidM4PS0HnW0t16USyEaHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=MZa3Mf+a; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="MZa3Mf+a"
Received: from LAPTOP-99KJFSET (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 47e10a90a;
	Tue, 28 Jul 2026 20:34:26 +0800 (GMT+08:00)
From: Hongyan Xu <getshell@seu.edu.cn>
To: bleung@chromium.org,
	tzungbi@kernel.org
Cc: Hongyan Xu <getshell@seu.edu.cn>,
	groeck@chromium.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn
Subject: [PATCH] platform/chrome: cros_ec_debugfs: unregister panic notifier
Date: Tue, 28 Jul 2026 20:33:37 +0800
Message-ID: <20260728123423.781-3-getshell@seu.edu.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fa8b81f1503a1kunm4c64fbaeeecf0
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHkseVkhOTk1KS08fH0sfQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktJSE
	5DQ1VKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=MZa3Mf+a8vyCQepXTCA8PSGyuXpNr3y16rUXJlaLZFs7Wd6t/O6O95WWoe1s1DQXA+LAj2PSUggRc2BgDDUKx7fsZrX8RqdHesvihVJ81eYyIm+pzEt8xKqlbLKUB6UuaUIeXu0zdlfjndFRvRVjsHi059boYHf/FYjKc+dgUiM=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=8ItZWwmcNMbf6/znp6fsrEvBd0tgSjfbDcAYwJJ4a3U=;
	h=date:mime-version:subject:message-id:from;

cros_ec_debugfs_probe() registers debug_info->notifier_panic with the EC
panic notifier chain. The remove path tears down debugfs and cancels the
console log work, but leaves the notifier on the chain. A later panic
notification can call back into a removed driver instance and reschedule
the delayed work.

Unregister the notifier before tearing down debugfs state. Also run the
console-log cleanup in the probe error path.

This issue was found by a static analysis tool.

Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
---
 drivers/platform/chrome/cros_ec_debugfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform/chrome/cros_ec_debugfs.c
index 92ac9a2f9..6f93aedbd 100644
--- a/drivers/platform/chrome/cros_ec_debugfs.c
+++ b/drivers/platform/chrome/cros_ec_debugfs.c
@@ -534,6 +534,7 @@ static int cros_ec_debugfs_probe(struct platform_device *pd)
 	return 0;
 
 remove_debugfs:
+	cros_ec_cleanup_console_log(debug_info);
 	debugfs_remove_recursive(debug_info->dir);
 	return ret;
 }
@@ -542,6 +543,8 @@ static void cros_ec_debugfs_remove(struct platform_device *pd)
 {
 	struct cros_ec_dev *ec = dev_get_drvdata(pd->dev.parent);
 
+	blocking_notifier_chain_unregister(&ec->ec_dev->panic_notifier,
+					   &ec->debug_info->notifier_panic);
 	debugfs_remove_recursive(ec->debug_info->dir);
 	cros_ec_cleanup_console_log(ec->debug_info);
 }
-- 
2.50.1.windows.1
