Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D253B2D38
	for <chrome-platform@lists.linux.dev>; Mon, 15 Jun 2026 06:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781505132; cv=none; b=CDOZdSkUbZh+uQUXHxEuJ671S3X2/SC6jH7HGsyWHvrZ7GE6l5TcZdqpwEEb/N/SuygUeMZw+1uvBrWW3HHt89wbJP3aqIW9pzZD3SAJyOMB+TfkLvhYxAMR0kdz1Vx0p2QHpptUpGB4NuoiKglEJ2EBQgKnbB1zLD6dUG6nV8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781505132; c=relaxed/simple;
	bh=x/HdhKvwF8D8c0nKeHfZDMvBouPETNuUz6C+RxKWOsM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R1zm8Qok15Yv/+j+qsnkbX4ToMDfDwbDtu1zzpIXlV0zHw86u10XCaBm/ObhEBiSVHC2uVkTgAz+CKBR9o7/Avxx2/Aj+K6HvVmu+AZ6egyOSEzzkclPU2yN8zHnq6BG//UknIa7cUZpt6dqKa634bX+ZH4OA9LtIyIMWdqj9TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAAndchnnC9qOXGTEw--.34120S2;
	Mon, 15 Jun 2026 14:32:07 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: pengpeng@iscas.ac.cn
Subject: [PATCH] platform/chrome: cros_ec_debugfs: unregister panic notifier on remove
Date: Mon, 15 Jun 2026 14:32:00 +0800
Message-ID: <20260615063200.43185-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAndchnnC9qOXGTEw--.34120S2
X-Coremail-Antispam: 1UD129KBjvJXoW7try7ZrW8WrykWw45Xr1fWFg_yoW8JFyfpa
	ykWa13Gw4jka15GrW5Ga1UuFyfC3s3Xry7XryUua45Z3s8try3tryvyay5trW8tryIqw12
	vrs5ta48G3W7XF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUDpnQUUU
	UU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

cros_ec_debugfs_probe() registers a panic notifier whose callback
recovers struct cros_ec_debugfs with container_of() and can schedule or
flush the console log work.

cros_ec_debugfs_remove() removes debugfs state and cleans up the console
log buffer, but it leaves the notifier registered.  A later panic
notification can therefore call back into freed debugfs state.

Unregister the panic notifier before tearing down the debugfs and log
state.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/platform/chrome/cros_ec_debugfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform/chrome/cros_ec_debugfs.c
index d10f9561990c..a19de7d418fe 100644
--- a/drivers/platform/chrome/cros_ec_debugfs.c
+++ b/drivers/platform/chrome/cros_ec_debugfs.c
@@ -530,6 +530,8 @@ static void cros_ec_debugfs_remove(struct platform_device *pd)
 {
 	struct cros_ec_dev *ec = dev_get_drvdata(pd->dev.parent);
 
+	blocking_notifier_chain_unregister(&ec->ec_dev->panic_notifier,
+					   &ec->debug_info->notifier_panic);
 	debugfs_remove_recursive(ec->debug_info->dir);
 	cros_ec_cleanup_console_log(ec->debug_info);
 }
-- 
2.50.1 (Apple Git-155)

