Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8173A1991D3
	for <chrome-platform@lists.linux.dev>; Thu,  6 Jun 2024 18:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717697114; cv=none; b=VD+ZJIimr9yHU7X1RqYhCMvQ/yc80XST5l3cWGnRr0+fwKRYuO5wjYSqMq7HhWQUOmWxuvlvK3cgPVnYeOfPXe6Xz4W9MC42skAMSNTtHv7fEkVF5dO7nM1wj8ikcp4LvChn4vSyd1OjqzYEskx4wDUpoIRUWcOBVpeAwBzS2q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717697114; c=relaxed/simple;
	bh=M8/CndtovtNZjCnSSKAAn9sDv4W6EwehhscWhv21waI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=f0NqbmjU4iYgt9zgjTNLQ3PmeM1h5y6lVxX12ufy4tQhidcDHwO8QcEQC22SzRluQU/jOvGTJeY8D1h3EXoaZchL6zLh0dRq2Sa6v9uUT6fBawn9GxCngBm0P6z5BR2n6+jWW07LtU+T50jvuj3jAABMoFLYHOXAOMi2MLiW9Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Il8FsvNK; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Il8FsvNK"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-6bfd4b88608so999422a12.1
        for <chrome-platform@lists.linux.dev>; Thu, 06 Jun 2024 11:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717697111; x=1718301911; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qqFGxZu8ztkmGXgHXrrzq8s99pAzOJgpzc98UOmJrt0=;
        b=Il8FsvNKHaAMqrhkcx5qyCuFFfdn9iRLMkUwUD4ZnNCsGS0gsYDXtGDAHCcLMmADpD
         tibluEwz9nU+zYxkIftY/AzzXa1/xGK1681EZFJchK9diY6b+Fo6xmBCIoRcPkFZ85TV
         9gv9mSStJGiHXx4E/Mh4/DEUBYnwe3FUDdA3lS1kj6ACzGgJtA70UoaEdLHdoNcSASB9
         j65y+OnEJqphuuO8eLGFsWUaULQ4x8UNZiRimQ91L5dGbWXUhnuav2mu58Jbmj0Effc7
         EPQ3KevK5RjCQ9+IT3XLyjZQG7z31TAXRpxTxqtS8sqnbrlrCLJERIh8ubcALMZqR5ho
         j3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717697111; x=1718301911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqFGxZu8ztkmGXgHXrrzq8s99pAzOJgpzc98UOmJrt0=;
        b=l3nhAnM6mG006uZk7Q9PMcic7vSSWnQnYmAmrfYaBfnUPCXE6MuKxQjVJ1RxYe09Ad
         Q7A1C1g3qwvhLFJlptjkONimwCweXhOkCXynzFruuKx38kRWsc6bRWrlhiO8tjSv9KiW
         r3XYcwAqOJEELq/uJkRfJ6fTuBlxzelFNTTVtfqRpBpbmtGCkRihEZQn8n43iDfbIy1X
         IOJ2la3K+8cgREV+Yo46e0ZwI9sZNU95nYAH5KAIhXNCTr6xH2WA8ufcJxhk1KB1JSKB
         FR7Z4X5TH2Iyv140hm1jE1U5m1SlKVZXaI5mQ3sP5nJSWP9wUR7tPs1qS+OsU4Sx/VD0
         DSZg==
X-Gm-Message-State: AOJu0YwJDaNfa4DdX0H/7tL2JqGwu/W4QY8pWyeggFfg1gcuBHogoqwl
	/ntB+r5P0hcvEzaoyHu7IP/s9zLsX+hJoOfxxXghCmhyfgOeP71OzEqjKA==
X-Google-Smtp-Source: AGHT+IE5A0nf2n9F8l4i5CYuyQzTnGQSlckHO+heltL9kMPPAQX5ntF7cJsqltDvC68OmQfN/1cHgw==
X-Received: by 2002:a17:90b:4f83:b0:2bd:ad66:5b14 with SMTP id 98e67ed59e1d1-2c2bcc058d6mr260340a91.25.1717697110560;
        Thu, 06 Jun 2024 11:05:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c2806d2936sm3870629a91.53.2024.06.06.11.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 11:05:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH] hwmon: (cros-ec_hwmon) Fix access to restricted __le16
Date: Thu,  6 Jun 2024 11:05:07 -0700
Message-Id: <20240606180507.3332237-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

0-day complains:

drivers-hwmon-cros_ec_hwmon.c:sparse:sparse:cast-to-restricted-__le16

Fix by using a __le16 typed variable as parameter to le16_to_cpu().

Fixes: bc3e45258096 ("hwmon: add ChromeOS EC driver")
Cc: Thomas Weißschuh <linux@weissschuh.net>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/cros_ec_hwmon.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 41f268fa8260..f586987c3502 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -26,12 +26,13 @@ struct cros_ec_hwmon_priv {
 static int cros_ec_hwmon_read_fan_speed(struct cros_ec_device *cros_ec, u8 index, u16 *speed)
 {
 	int ret;
+	__le16 __speed;
 
-	ret = cros_ec_cmd_readmem(cros_ec, EC_MEMMAP_FAN + index * 2, 2, speed);
+	ret = cros_ec_cmd_readmem(cros_ec, EC_MEMMAP_FAN + index * 2, 2, &__speed);
 	if (ret < 0)
 		return ret;
 
-	*speed = le16_to_cpu(*speed);
+	*speed = le16_to_cpu(__speed);
 	return 0;
 }
 
-- 
2.39.2

