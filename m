Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BC22F39
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jun 2022 11:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65284C34116;
	Wed,  8 Jun 2022 11:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654686484;
	bh=nAbRLFK4360U012nvucyvlqxP543Oerph53JukK7/3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Twd+zXE+e5lzG51zZu+JGVvFxl046d+PgY2ChI6Kia+1wKf2gNrMNqL7DvEFlWV/D
	 GUqVHGV3HSDQcOjFgAMTyHPbhm2SFKfKNTrbMyqERNUFk5x0VAAxa4JsH4737X4mtX
	 YmnnT4oOJJgLkLp+JLuC8CUstRf22ydkBwRVblmYPxDgtHocLv3w/vt+Ob1RXSs6po
	 lG7WRzDvVwjEB4LfXp+p0H3IaqbT7zG11VYyFtCULCHSMghxh+NTS78Cm8MMRp+NZM
	 4N1pMrmD7T+SZjX2kIU62LF+QEPxQQOmS13SGa3pdz9bi6Em1OtDigL8e0l5YVQT3f
	 F69z2h8uZw81w==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/23] platform/chrome: cros_ec: don't allocate `din` and `dout` in cros_ec_register()
Date: Wed,  8 Jun 2022 11:07:24 +0000
Message-Id: <20220608110734.2928245-14-tzungbi@kernel.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220608110734.2928245-1-tzungbi@kernel.org>
References: <20220608110734.2928245-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Don't allocate `din` and `dout` in cros_ec_register() as they will be
allocated soon in cros_ec_query_all().

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
No change from v2.

 drivers/platform/chrome/cros_ec.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index e51a3f2176c7..29d3b544dafb 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -188,14 +188,8 @@ int cros_ec_register(struct cros_ec_device *ec_dev)
 	ec_dev->max_passthru = 0;
 	ec_dev->ec = NULL;
 	ec_dev->pd = NULL;
-
-	ec_dev->din = devm_kzalloc(dev, ec_dev->din_size, GFP_KERNEL);
-	if (!ec_dev->din)
-		return -ENOMEM;
-
-	ec_dev->dout = devm_kzalloc(dev, ec_dev->dout_size, GFP_KERNEL);
-	if (!ec_dev->dout)
-		return -ENOMEM;
+	ec_dev->din = NULL;
+	ec_dev->dout = NULL;
 
 	mutex_init(&ec_dev->lock);
 
-- 
2.36.1.255.ge46751e96f-goog

