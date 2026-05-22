Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E0841B343
	for <chrome-platform@lists.linux.dev>; Fri, 22 May 2026 15:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779464706; cv=none; b=NHMIK0Bj7DbTT3i1oyZ/g+zYU1s+wBMbKaYFPrmKeEDeV3+PoLIISTwoiCwNHGuzglT7AeYSE0vUu8wKgM3a848LVS1haKwhyHbTAFuWfqt8byqEqxbGjuR7une5eCUsh+YwrWdXUvSSttRnYxlwUQoLEcUZ/i93yaqRBGFT1Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779464706; c=relaxed/simple;
	bh=eyYt1g/Y58tXmMeO8f3HJ9YXJ3oT3Rw0BmK7dmkQ8PY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MbhirOYPCzr4iwZzLFsZxC1lqNAmkdDZoggxhzjThjnquZdxHH3HxDAP/Jmqmz4ECIYQnU9bAUyxDO3CuDGELTo2CpGk6X2zVW/ncUMC+1X8OdI3IbG/K9zMpzlPjHB4c3pzrXs9fhVecB/d+Wfsdpv/df2gZcjbecjbXZZptd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dh16jxZD; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dh16jxZD"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bd124546379so1198022066b.3
        for <chrome-platform@lists.linux.dev>; Fri, 22 May 2026 08:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779464702; x=1780069502; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sn9ZWX/LHdvsmMbuXtFnELWJ9oecMT6d7N6qyRp7Au0=;
        b=dh16jxZDMa+fH/+pL044v/auZmEAA4cVCIZWyTPPIapMqe5N5F30aZYJVtBH1ZtCbH
         xBYftGr8yg2MoUoJUsm/Si+rb943NxwVrL/VXw8pC0T6SyxYUR7GPgd6fleRfsnX1TZ8
         PISCr8c4vekeYL9KaI+ImSS7MU4Rj75czPKNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779464702; x=1780069502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sn9ZWX/LHdvsmMbuXtFnELWJ9oecMT6d7N6qyRp7Au0=;
        b=M6lJiOrw+xzM5+pFoz1Rc6a5o0O3Z9e9lJmlSKQVmWEKCFF5Bp7av7BbDUz21A7wI6
         Oesvsx4oAeahb0FIy7l+fwzkhhBNltN5Vj67BfyLqhOTiF4e7BdiAocV6LdR0+OTT/Yw
         ujU2+aooaQUMGTnUsJA3/uCknFHV443ZxvwnMzxXoUO3Z7UooYqHQqRtkMkeUHqA40bN
         e82ZnLsiKpwdXSPMRUtpA1qfB27+F/b28wLkoE9ZnFHInI1V3TRokvIUCia4dczZNggo
         4GZ+hftCyCPu5PzjhEfKa2ZU4F1h4x4MpgcA/TsFraf8F8AJ1JyCo1mvRxP+dXxhuYTL
         ZR+w==
X-Forwarded-Encrypted: i=1; AFNElJ9TzgIxmWFFMGs12/mdHI8LrO5yfXAI7Ks6dXAAJucxq0KhhyRLhOQcUw39xpWtyHeN0IpOdivc4NSlHWCiGd0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLqS1YEPdHpvKztKE0Dqj+EDtkay5Pd7xOchNAsL5631d1td+t
	3rBiKSWAbIhcBb/duAH4Cd7I95cY52A68tX+kKtXQF6UpE3Pqt49rDPGb+jeFQuMdw==
X-Gm-Gg: Acq92OHFJPrn9WpZXQ+R6sjsQxkAndB/zfZZVoe0DbquEcinzGND55ZaSGWrWmy7Yor
	sz49faruRtj6S1cv6RqyunTkK3c5pWy+njdqjUqjVLfKi0/KjozOJe1Aku9MQkpVMuCFIUFCRpQ
	3+WVok/0cFholKe2vm4d/6d2CH2nGqxb7aNlkNNxHoheSAP556crM/QmMIAwZ96O19CWggtYWTV
	RetWOBz/CQLuSca0PcY4u9ZTOxLWtWZ6PeCfXoebzLGJ52ne1CmAJpwWgo+wVC6IweIg46XyE0P
	8OOhqhhDPn1bYV+rDV77yFwmM2hKT7BQCGj8o1lZ9eLredid5Y325F1jzjUxFpkclJrdTzOYOoC
	OTR0c4GokobcrmQh2r1GtKzcds7XCTuqNkVdnxNMRiL38x96EUDY/ddgUzyHCbBxUVwCwqGLadu
	P6cUfTIcABTndQxaALWm6ows5eSY3bkpQ35mfFpZa+3tX18hO3cJ0Mj+X1UGOwYOZNzeAkmWBK2
	NKShIt2g7vVxyn9IpXA
X-Received: by 2002:a17:907:b80c:b0:bde:137a:45a8 with SMTP id a640c23a62f3a-bde137a477fmr90203466b.39.1779464701838;
        Fri, 22 May 2026 08:45:01 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (208.220.32.34.bc.googleusercontent.com. [34.32.220.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc62d635bsm68907266b.47.2026.05.22.08.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 08:45:01 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH] mfd: cros_ec: Read EC features during probe to catch transfer error
Date: Fri, 22 May 2026 15:44:56 +0000
Message-ID: <20260522154456.1448170-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cros_ec_check_features() does not return an error if the underlying
EC_CMD_GET_FEATURES command fails. Consequently, when the Fingerprint
device fails to respond, the probe function ignores the failure and falls
back to installing it as 'cros_ec' device instead of 'cros_fp'.
This leads to a sysfs duplicate filename collision later when the real
'cros_ec' device attempts to register:

  cros-ec-spi spi5.0: EC failed to respond in time
  cros-ec-dev.19.auto: cannot get EC features: -110
  sysfs : cannot create duplicate filename '/class/chromeos/cros_ec'
        : sysfs_do_create_link_sd+0x94/0xdc
        : ec_device_probe+0x150/0x4f0

Fix this by extracting the feature reading logic into a new helper function
cros_ec_read_features() and calling it during ec_device_probe().
If the transfer fails, abort the broken device initialization.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/mfd/cros_ec_dev.c                   |  4 +++
 drivers/platform/chrome/cros_ec_proto.c     | 30 +++++++++++++++------
 include/linux/platform_data/cros_ec_proto.h |  2 ++
 3 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 39430dd44e30c..7810b1c871849 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -203,6 +203,10 @@ static int ec_device_probe(struct platform_device *pdev)
 	ec->features.flags[1] = -1U; /* Not cached yet */
 	device_initialize(&ec->class_dev);
 
+	retval = cros_ec_read_features(ec);
+	if (retval < 0)
+		return retval;
+
 	for (i = 0; i < ARRAY_SIZE(cros_mcu_devices); i++) {
 		/*
 		 * Check whether this is actually a dedicated MCU rather
diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 1d8d9168ec1aa..724d1313f6b21 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -946,6 +946,27 @@ u32 cros_ec_get_host_event(struct cros_ec_device *ec_dev)
 }
 EXPORT_SYMBOL(cros_ec_get_host_event);
 
+/**
+ * cros_ec_read_features() - Read EC features
+ *
+ * @ec: EC device.
+ *
+ * Return: >= 0 on success, negative error number on failure.
+ */
+int cros_ec_read_features(struct cros_ec_dev *ec)
+{
+	int ret = cros_ec_cmd(ec->ec_dev, 0, EC_CMD_GET_FEATURES + ec->cmd_offset,
+			      NULL, 0, &ec->features, sizeof(ec->features));
+
+	if (ret < 0) {
+		dev_warn(ec->dev, "cannot get EC features: %d\n", ret);
+		memset(&ec->features, 0, sizeof(ec->features));
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cros_ec_read_features);
+
 /**
  * cros_ec_check_features() - Test for the presence of EC features
  *
@@ -960,17 +981,10 @@ EXPORT_SYMBOL(cros_ec_get_host_event);
 bool cros_ec_check_features(struct cros_ec_dev *ec, int feature)
 {
 	struct ec_response_get_features *features = &ec->features;
-	int ret;
 
 	if (features->flags[0] == -1U && features->flags[1] == -1U) {
 		/* features bitmap not read yet */
-		ret = cros_ec_cmd(ec->ec_dev, 0, EC_CMD_GET_FEATURES + ec->cmd_offset,
-				  NULL, 0, features, sizeof(*features));
-		if (ret < 0) {
-			dev_warn(ec->dev, "cannot get EC features: %d\n", ret);
-			memset(features, 0, sizeof(*features));
-		}
-
+		cros_ec_read_features(ec);
 		dev_dbg(ec->dev, "EC features %08x %08x\n",
 			features->flags[0], features->flags[1]);
 	}
diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
index 6ed1c4c5ce2ef..a1ccecf5e1f83 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -271,6 +271,8 @@ int cros_ec_get_next_event(struct cros_ec_device *ec_dev,
 
 u32 cros_ec_get_host_event(struct cros_ec_device *ec_dev);
 
+int cros_ec_read_features(struct cros_ec_dev *ec);
+
 bool cros_ec_check_features(struct cros_ec_dev *ec, int feature);
 
 int cros_ec_get_sensor_count(struct cros_ec_dev *ec);
-- 
2.54.0.746.g67dd491aae-goog

