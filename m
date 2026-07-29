Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF17C43B6DD
	for <chrome-platform@lists.linux.dev>; Wed, 29 Jul 2026 10:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785321152; cv=none; b=G9CrLGEbgCc9kOdH8QAMK0fEDHtryt9bcjdkYXSRioZOirwrQOIAHuhZzow4sah/jYrJh996d4cO+9GrtdKdA8Nj0kwymHcbtYagOOb4j+Uyf8Q0Ci0LHhsSIcnlPdSKXQU2RH7Ok3rBHxhO45udfch9UKJX+/VtokVud0sndJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785321152; c=relaxed/simple;
	bh=3p/B16U9HQC6qiFtB8Qqj4cfrqEWM33Hgt2/5yEJkKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UaKxgGrQT7BJoJEYwsasHxjLs+m1Mx4EZbRC+fwYD9PnxznwhtZPwjVUGGXtJADgL/NUUsZF8c64cLGvgNK4uIT9/pAEjnuUmBBS/XKSnH3Q02KtirXqhI1+xFBMEvCKK0b8x8UhYlvMZ+4CDRlfyDdeHZaG9LY9QuOPaf4aWe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=apdLFvGH; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="apdLFvGH"
Received: from LAPTOP-99KJFSET (unknown [36.153.54.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 480465fcb;
	Wed, 29 Jul 2026 18:32:19 +0800 (GMT+08:00)
From: Hongyan Xu <getshell@seu.edu.cn>
To: bleung@chromium.org,
	tzungbi@kernel.org
Cc: groeck@chromium.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn
Subject: [PATCH v2 2/2] platform/chrome: cros_ec_debugfs: unregister panic notifier
Date: Wed, 29 Jul 2026 18:32:17 +0800
Message-ID: <f3ab74ef8034be63bb45a325f3d54656d658817f.1785320940.git.getshell@seu.edu.cn>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <c00974953a1b952f51f0f021d7f9fad134159909.1785320940.git.getshell@seu.edu.cn>
References: <c00974953a1b952f51f0f021d7f9fad134159909.1785320940.git.getshell@seu.edu.cn>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fad6eadf203a1kunm4196f578117520
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCH05NVkwYTR5ISE0eSk1JTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKTkhVTk9VSktKWVdZFhoPEhUdFFlBWU9LSFVKS0hKTk
	xOVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=apdLFvGHl+CRiZ4yISht/BZnTeaZ25jHcoV29JxCya/dyrubWoH2wHAePomRnLV0ujJhzLJuWAiLkWBFCa5USPQbBRe8syxZQBl8aoda4PUVqwfX6Lc1JmUa6rWa8CVoCt342LHxlLzKCuZIhN0sH9iJ4bpnxVrdvPPOzkYSPDU=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=8flbC8LkR5tyGl2ccoWtMQtbyedHjLCbaY/d8nBVjjE=;
	h=date:mime-version:subject:message-id:from;

cros_ec_debugfs_probe() registers notifier_panic with the EC panic
notifier chain. The remove path tears down debugfs and the console log,
but leaves the notifier registered. A later panic notification can call
back into the removed instance and queue work that accesses released
data.

Unregister the panic notifier before tearing down the debugfs and
console log state.

This issue was found by a static analysis tool.

Fixes: d90fa2c64d59 ("platform/chrome: cros_ec: Poll EC log on EC panic")
Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
---
Changes in v2:
- Split the panic notifier unregister change into a separate patch.

Link to v1: https://lore.kernel.org/r/20260728123423.781-3-getshell@seu.edu.cn

 drivers/platform/chrome/cros_ec_debugfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform/chrome/cros_ec_debugfs.c
index a781bb5..7ca5114 100644
--- a/drivers/platform/chrome/cros_ec_debugfs.c
+++ b/drivers/platform/chrome/cros_ec_debugfs.c
@@ -544,6 +544,8 @@ static void cros_ec_debugfs_remove(struct platform_device *pd)
 {
 	struct cros_ec_dev *ec = dev_get_drvdata(pd->dev.parent);
 
+	blocking_notifier_chain_unregister(&ec->ec_dev->panic_notifier,
+					   &ec->debug_info->notifier_panic);
 	debugfs_remove_recursive(ec->debug_info->dir);
 	cros_ec_cleanup_console_log(ec->debug_info);
 }
-- 
2.50.1.windows.1
