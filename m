Received: from m126.mail.126.com (m126.mail.126.com [220.181.12.35])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE02E7C
	for <chrome-platform@lists.linux.dev>; Wed, 22 Mar 2023 04:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=jW6J/
	vaq8Ojrol/r9UAC7vnQv6GAX+n/ZrqZoBJnZvk=; b=qHHmstVQZpI8wiJD2Li/F
	Pph0bjmVQXz/epLTdiga+FPLI6Z0dg0sGGkFr33M4/ryyT1fedfy4FLqI56Xjvjf
	y91CXrBoDc3FuHuCvVn+DvvprdcLEAF9jacdTWyE57CpX+xnvQc1BYXazZ1nlMU1
	Oeq0RFp6PiJNwr4+W1fCEI=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by zwqz-smtp-mta-g0-1 (Coremail) with SMTP id _____wDHzxc7gRpki+qbAQ--.8048S2;
	Wed, 22 Mar 2023 12:17:00 +0800 (CST)
From: Liang He <windhl@126.com>
To: pmalani@chromium.org,
	bleung@chromium.org,
	chrome-platform@lists.linux.dev,
	windhl@126.com
Subject: [PATCH] platform/chrome: cros_typec_switch: Add missing fwnode_handle_put()
Date: Wed, 22 Mar 2023 12:16:57 +0800
Message-Id: <20230322041657.1857001-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHzxc7gRpki+qbAQ--.8048S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr1kuF4kWF1kGr13Zr4ruFg_yoWfuwb_Ww
	40gF4UJrn7AFn8Kr1IyF1fWr1xKr1rXF15uF1Sva42v343Z347Xr1qvFyUur92kF15tFyq
	ga9rJ3yIv3WYvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRt5rc7UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGg46F1-HarSg0AAAsP

In cros_typec_register_switches(), we should add fwnode_handle_put()
when break out of the iteration device_for_each_child_node()
as it will automatically increase and decrease the refcounter.

Fixes: affc804c44c8 ("platform/chrome: cros_typec_switch: Add switch driver")
Signed-off-by: Liang He <windhl@126.com>
---
 drivers/platform/chrome/cros_typec_switch.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
index a26219e97c93..26af51952f7f 100644
--- a/drivers/platform/chrome/cros_typec_switch.c
+++ b/drivers/platform/chrome/cros_typec_switch.c
@@ -268,6 +268,7 @@ static int cros_typec_register_switches(struct cros_typec_switch_data *sdata)
 
 	return 0;
 err_switch:
+	fwnode_handle_put(fwnode);
 	cros_typec_unregister_switches(sdata);
 	return ret;
 }
-- 
2.25.1

