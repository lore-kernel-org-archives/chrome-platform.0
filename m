Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3AD110E8
	for <chrome-platform@lists.linux.dev>; Tue, 17 May 2022 09:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=KEpTTAEC9xfg+HRhDO
	p/Qpj2o7vJYyBbGM+BScxTLJY=; b=e4PqQu2T7ZY9F0k/gJYwdtr1BVuwA0iqS3
	snAQ7SgDPMMANONxOxIb27SvjnwnYPCxaC280PloajwBrIIxS39BHmWLjxbJPDfF
	ry3E+6lN0/nGtC12z6CMjw4eujlY+EmUCGcVnL3fNOMQSrEd0RtxUYvpOPqewHx/
	7bjUYz/og=
Received: from localhost.localdomain (unknown [202.112.113.212])
	by smtp7 (Coremail) with SMTP id C8CowADnlLkOcYNigRf3Cw--.43433S4;
	Tue, 17 May 2022 17:55:38 +0800 (CST)
From: Yuanjun Gong <ruc_gongyuanjun@163.com>
To: Yuanjun Gong <ruc_gongyuanjun@163.com>,
	Benson Leung <bleung@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 1/1] platform/chrome: check *dest of memcpy
Date: Tue, 17 May 2022 17:55:21 +0800
Message-Id: <20220517095521.6897-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:C8CowADnlLkOcYNigRf3Cw--.43433S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw15KF4UJw4DuFWUXrykuFg_yoW8XrWxpF
	Z5ur17Ca10ka18Kw4Utay293W3Xw18tr97u3yxua4rXws8JasxAryFya4rCF1vyryxJ34Y
	yryktF1rWa1xZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRKii-UUUUU=
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/1tbiJw0E5V5vB8SlZwABs6
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

From: Gong Yuanjun <ruc_gongyuanjun@163.com>

In regulator/cros-ec-regulator.c, cros_ec_cmd is sometimes called
with *indata set to NULL.

static int cros_ec_regulator_enable(struct regulator_dev *dev){
...
     cros_ec_cmd(data->ec_dev, 0, EC_CMD_REGULATOR_ENABLE, &cmd,
			  sizeof(cmd), NULL, 0)
...}

Don't do memcpy if indata is NULL.

Signed-off-by: Gong Yuanjun <ruc_gongyuanjun@163.com>
---
 drivers/platform/chrome/cros_ec_proto.c | 2 +-
 drivers/regulator/cros-ec-regulator.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index c4caf2e2de82..da175c57cff7 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -938,7 +938,7 @@ int cros_ec_command(struct cros_ec_device *ec_dev,
 	if (ret < 0)
 		goto error;
 
-	if (insize)
+	if (indata && insize)
 		memcpy(indata, msg->data, insize);
 error:
 	kfree(msg);
diff --git a/drivers/regulator/cros-ec-regulator.c b/drivers/regulator/cros-ec-regulator.c
index c4754f3cf233..1c7ff085e492 100644
--- a/drivers/regulator/cros-ec-regulator.c
+++ b/drivers/regulator/cros-ec-regulator.c
@@ -44,7 +44,7 @@ static int cros_ec_cmd(struct cros_ec_device *ec, u32 version, u32 command,
 	if (ret < 0)
 		goto cleanup;
 
-	if (insize)
+	if (indata && insize)
 		memcpy(indata, msg->data, insize);
 
 cleanup:
-- 
2.17.1

