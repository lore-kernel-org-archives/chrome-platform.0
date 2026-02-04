Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28821917FB
	for <chrome-platform@lists.linux.dev>; Wed,  4 Feb 2026 03:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770177044; cv=none; b=ieyQAq8R2pyc26vG9rR8lkiKevlpjw/2pPfuBvcFtsnPiwtgeuZoR2L6YiMfwGVHCOOG8PsPrUM1GHNBQqdDqFvlLIWRlIIhgONXVamEeNvMr1hDhfR0Tvr4FqkckXYP4ttuJ986yBUsp+rxn2cVHtQo4vodoyHnFJlMtz9Qa8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770177044; c=relaxed/simple;
	bh=wNDx3ueSsS67Qtsq99nPdnOShsAeDwJ6MDh9qzitsYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bz8TdFxHeMcYcEZkioQV+PcaElBK2zcDpJBkA580aMCJZikjcBx5KqpZUBBXjKqnt/kMAPPKW0LjFxaQrh51F4TblKziQNuEUy4Vy+08TNjb3dN54Jyb96Xb5YVO8yL8VbreGSxRZQkN7fjLjJHpuaBkZVkSAoCy0qEM3DgFkzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PK4ASQ70; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PK4ASQ70"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1248d27f2b9so7919619c88.0
        for <chrome-platform@lists.linux.dev>; Tue, 03 Feb 2026 19:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770177042; x=1770781842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y5JV1ZuKwJQ2SZCKeFKKpYN+BosxusaExClwgnbGOr4=;
        b=PK4ASQ70yX4bKwiD+sOVSYk1OOpu2zv26W8fCzNrRRC5YxgIpeQirwFty0YD7BxiLJ
         3aIjaCTukyWnUj4/JrlanmmR6xJ4JF2QQhmFL5ANJ6i+eq+t5NXmdSHueG8un7Bg9xuS
         aHskSiIj199ra2+ggI93yAWaqL4L0hgotARVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770177042; x=1770781842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5JV1ZuKwJQ2SZCKeFKKpYN+BosxusaExClwgnbGOr4=;
        b=VSMcA437L2R6MSqsGEESdpG7fGPlqCXml5i2ODjD4gnBAUAZSO2X7vLbwA4L5POyOT
         Dpc8c2PpU+bDnbEKLiwdEYEhGYyGWXLNal6krlPKJVNjmQZUqe0u6nKEaGw5ehPiKpug
         hSNQH1HVzz3/w7SDahBs/qaGmqNFlT0Zemlj7i1urBIkwPKLWXG1q+oO5bBSmgClCW1i
         5Y8XyIjdQE3+I+5XKvJHpl82n6EyNdOllIwAMHcWt8t68or+0+GaRsPi15f6BHv0b3sN
         R+8Q1uzzzExC7eu67cBV6h0mqe3b7ZTKUrHzbjr63/MTg2NmiJhBBIN29bmYvLYk8YTW
         QSxg==
X-Gm-Message-State: AOJu0YwdyXti2DAZNOQk3Yc5K5ZYKCIigbrBO+N3+oIb8ljvUFqJpa78
	Gu2LSfHCbc5HsYktiNDP4ffiD2tV0XI4fLQ7mZiTAfP/g8NpWffxl40UjoxOvx9Fqg==
X-Gm-Gg: AZuq6aIv7/43slByYGtD4oY+y5y3tZ17ZKUcc938fWaBoW+PNMDepJ1Vprxdyu+CVy6
	VAq1swqNvYwzww7ZkGWoOJSCOIqiGsb3/MEQ4dKVCoPEiFGl+vGVfpSWh+bG6xwBwIB3ymhNLaN
	aPz/Nk0i1zTZtVgeStacMEfpEUKUddSPu6WP0gzyDDXe4suQndeK3RviHNKLWfSOIfOCj/kKgSe
	J/9VoeJPG1KpO8pv5+KX7A6wzKYGXSlrW6SvcSaJpHeyUW6ERS7VzxmRJVFL/6kfjP0yy4wX2NR
	PsTEVLoE3g3241JdiL1pA17Qa53kAdRgVmyP/lbVGV67+SwGuypXnXQ7d5F+5qBup5GtdCDnkdn
	STOU6FXHb5bnxyYeTWmBoVcaJugkzFwh/7N+ekVVW6VwAi+P+M/gWbcpeoNZqrpdZFT4QX/hks3
	EwJ85chGWUyRZYy4mf6EgBZ+enQ9ouIhBqlHubs/UmGQw=
X-Received: by 2002:a05:7022:68a7:b0:11b:d211:3a64 with SMTP id a92af1059eb24-126f46f9179mr786023c88.0.1770177041874;
        Tue, 03 Feb 2026 19:50:41 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:f344:7386:c61:daf2])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-126f4e04467sm891203c88.2.2026.02.03.19.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 19:50:41 -0800 (PST)
From: Gwendal Grignou <gwendal@chromium.org>
X-Google-Original-From: Gwendal Grignou <gwendal@google.com>
To: tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev,
	Gwendal Grignou <gwendal@google.com>
Subject: [PATCH] platform/chrome: lightbar: Optimize command size
Date: Tue,  3 Feb 2026 19:50:36 -0800
Message-ID: <20260204035036.697955-1-gwendal@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling tracing with:
echo 1 > /sys/kernel/debug/tracing/events/cros_ec/cros_ec_request_start/enable

To monitor the command and response size. The defaults are 194 and 128 respectively:
cros_ec_request_start: version: 0, offset: 0, command: EC_CMD_LIGHTBAR_CMD, outsize: 194, insize: 128

Reduce the sizes to the expected subcommands.

Signed-off-by: Gwendal Grignou <gwendal@google.com>
---
 drivers/platform/chrome/cros_ec_lightbar.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platform/chrome/cros_ec_lightbar.c
index 2d1aa6edda1a..f69f2f6de276 100644
--- a/drivers/platform/chrome/cros_ec_lightbar.c
+++ b/drivers/platform/chrome/cros_ec_lightbar.c
@@ -461,6 +461,8 @@ static ssize_t sequence_store(struct device *dev, struct device_attribute *attr,
 	param = (struct ec_params_lightbar *)msg->data;
 	param->cmd = LIGHTBAR_CMD_SEQ;
 	param->seq.num = num;
+	msg->outsize = offsetof(typeof(*param), seq) + sizeof(param->seq);
+	msg->insize = 0;
 	ret = lb_throttle();
 	if (ret)
 		goto exit;
@@ -516,6 +518,7 @@ static ssize_t program_store(struct device *dev, struct device_attribute *attr,
 	if (ret)
 		goto exit;
 	param = (struct ec_params_lightbar *)msg->data;
+	msg->insize = 0;
 
 	if (lb_version < 3) {
 		dev_info(dev, "Copying %zu byte program to EC", count);
-- 
2.53.0.rc2.204.g2597b5adb4-goog

