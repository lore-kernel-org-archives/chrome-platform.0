Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23BA1C04
	for <chrome-platform@lists.linux.dev>; Tue, 18 Oct 2022 23:54:11 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id u71so14740181pgd.2
        for <chrome-platform@lists.linux.dev>; Tue, 18 Oct 2022 16:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d44HchEdwR7h9k5EzO4aimsT++0qdKmEQe35d8c3CvQ=;
        b=KpS1SdjaXEMwyhOhxcJssQBtfHQba78I6I7+bpn9LxAHFWocCtcy7YA273GmqOKN8z
         bmrxzDf9NRyWib2bvXF6Iguk0RcCcNjYBXvyRffIG+yuq/20uJzXxq7U5k33u5smqIan
         2CsZutEf+00brb01b15SAJv/SX7CH0lGUsAIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d44HchEdwR7h9k5EzO4aimsT++0qdKmEQe35d8c3CvQ=;
        b=xnt+EKtW89ia/Yl/xEcGInH62ZSy1qpIUeece19flkAvZ+yyBcaVnoYV0T5GAoiMuM
         23KQogC+4mueF1EzHDA93Mn8UA2lGAZMMTyIK5w/Z+8MIGRlOwa6VML/e8ebFD3vxlMM
         AQxWcomYOTc7uhBhPSVWQ18OJMS/Sv77eED1gYOnWmFRAdkaIat+xmqDr+NFKJ+qLCYm
         ZPXiZ8lqiL6SUMH+1mTFIFS5Ji6gDvzxE0wVmDpl20kNxx+EQHodTYu6H4raWH4FIbjp
         OYHfNgEie0n0DqRCFK06I2CUqTsCau0EYn4uijop+pTG6l4R7rX0kj49+wCxDBlg5bwF
         BDGQ==
X-Gm-Message-State: ACrzQf3rz8Oj2PX23sN8sIKfjSS9DzbXq5DzTe589fInnWnOGZWOdD1D
	TWl7tyGgGENxy7I//rWx08YVVwm7MCOG9g==
X-Google-Smtp-Source: AMsMyM6XanfpWRavEw9YBgGcdQqTNtut+fHMVgxbS3ocGwJJXrNQYwGCK38MXZg/E0l1ijsvG2NJeA==
X-Received: by 2002:a63:8ac3:0:b0:461:ec25:8b89 with SMTP id y186-20020a638ac3000000b00461ec258b89mr4676929pgd.89.1666137250836;
        Tue, 18 Oct 2022 16:54:10 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:c37d:7907:a273:1c56])
        by smtp.gmail.com with UTF8SMTPSA id p65-20020a625b44000000b0053e4296e1d3sm9799231pfb.198.2022.10.18.16.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 16:54:10 -0700 (PDT)
From: Dan Callaghan <dcallagh@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: LKML <linux-kernel@vger.kernel.org>,
	=?UTF-8?q?Sami=20Ky=C3=B6stil=C3=A4?= <skyostil@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dan Callaghan <dcallagh@chromium.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] platform/chrome: cros_hps_i2c: make remove callback return void
Date: Wed, 19 Oct 2022 10:52:37 +1100
Message-Id: <20221018235237.2274969-1-dcallagh@chromium.org>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit ed5c2f5fd10d ("i2c: Make remove callback return void") changed
the return type of the 'remove' callback to void, but this driver was
originally written before that change landed. Update the remove callback
to match.

Fixes: 5f9952548d91 ("platform/chrome: add a driver for HPS")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dan Callaghan <dcallagh@chromium.org>
---
 drivers/platform/chrome/cros_hps_i2c.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_hps_i2c.c b/drivers/platform/chrome/cros_hps_i2c.c
index 92da59d94745..62ccb1acb5de 100644
--- a/drivers/platform/chrome/cros_hps_i2c.c
+++ b/drivers/platform/chrome/cros_hps_i2c.c
@@ -95,7 +95,7 @@ static int hps_i2c_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int hps_i2c_remove(struct i2c_client *client)
+static void hps_i2c_remove(struct i2c_client *client)
 {
 	struct hps_drvdata *hps = i2c_get_clientdata(client);
 
@@ -107,8 +107,6 @@ static int hps_i2c_remove(struct i2c_client *client)
 	 * (i.e. powered on).
 	 */
 	hps_set_power(hps, true);
-
-	return 0;
 }
 
 static int hps_suspend(struct device *dev)

base-commit: c7e2618e12562ba6f9d230d8ed4257dfa94d2d9d
-- 
2.38.0.413.g74048e4d9e-goog

