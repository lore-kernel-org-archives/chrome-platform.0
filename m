Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7771C4A12
	for <chrome-platform@lists.linux.dev>; Tue, 15 Oct 2024 13:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728998302; cv=none; b=LEsD4V5ivlTuBhtE7JAH4c4DTfXyCmSBjzldCkACLrGUdSuQWd0WI8xdF/khq1R9IH0tItYgsKdCPNzTL60b+8D/aqz9Rt9iKoBs0AHEX+tFNf/U5BFjbl17KiGGm8EHE3IAHAB5xMwALqJEL6QaCi+3f/o+TGLkjBl4mtbfUxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728998302; c=relaxed/simple;
	bh=WvHJKJwG2l8bjr++lb+b8bO//CPnnSNN1iQBeIAJ5oc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d95RQh+Rlu4lREcSbiPqGVK+iyHkXyI9atIBCgIg9KfBecNm4zKI2Kj4Lt/Kbn1PsxPdrp7ev1tiO5QWGYvCpPJCXUYiV7JWcY9IWD4XGAPRHoiCsv3H3LBiRjqZM7ikH56dXoZTdS6n0sXrhyZzLkmRnuc/SbQm3V96gsMqX0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4XSZRH4c6qz1yn4g;
	Tue, 15 Oct 2024 21:18:19 +0800 (CST)
Received: from dggpeml500024.china.huawei.com (unknown [7.185.36.10])
	by mail.maildlp.com (Postfix) with ESMTPS id ED643140134;
	Tue, 15 Oct 2024 21:18:13 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 15 Oct
 2024 21:18:13 +0800
From: Yuan Can <yuancan@huawei.com>
To: <tzungbi@kernel.org>, <briannorris@chromium.org>, <jwerner@chromium.org>,
	<adurbin@chromium.org>, <furquan@chromium.org>, <gregkh@linuxfoundation.org>,
	<rajatja@chromium.org>, <groeck@chromium.org>,
	<chrome-platform@lists.linux.dev>
CC: <yuancan@huawei.com>
Subject: [PATCH] firmware: google: Unregister driver_info on failure
Date: Tue, 15 Oct 2024 21:13:44 +0800
Message-ID: <20241015131344.20272-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500024.china.huawei.com (7.185.36.10)

When platform_device_register_full() returns error, the gsmi_init() returns
without unregister gsmi_driver_info, fix by add missing
platform_driver_unregister() when platform_device_register_full() failed.

Fixes: 8942b2d5094b ("gsmi: Add GSMI commands to log S0ix info")
Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 drivers/firmware/google/gsmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/google/gsmi.c b/drivers/firmware/google/gsmi.c
index d304913314e4..24e666d5c3d1 100644
--- a/drivers/firmware/google/gsmi.c
+++ b/drivers/firmware/google/gsmi.c
@@ -918,7 +918,8 @@ static __init int gsmi_init(void)
 	gsmi_dev.pdev = platform_device_register_full(&gsmi_dev_info);
 	if (IS_ERR(gsmi_dev.pdev)) {
 		printk(KERN_ERR "gsmi: unable to register platform device\n");
-		return PTR_ERR(gsmi_dev.pdev);
+		ret = PTR_ERR(gsmi_dev.pdev);
+		goto out_unregister;
 	}
 
 	/* SMI access needs to be serialized */
@@ -1056,10 +1057,11 @@ static __init int gsmi_init(void)
 	gsmi_buf_free(gsmi_dev.name_buf);
 	kmem_cache_destroy(gsmi_dev.mem_pool);
 	platform_device_unregister(gsmi_dev.pdev);
-	pr_info("gsmi: failed to load: %d\n", ret);
+out_unregister:
 #ifdef CONFIG_PM
 	platform_driver_unregister(&gsmi_driver_info);
 #endif
+	pr_info("gsmi: failed to load: %d\n", ret);
 	return ret;
 }
 
-- 
2.17.1

