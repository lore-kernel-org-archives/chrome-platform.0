Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FC2190470
	for <chrome-platform@lists.linux.dev>; Mon, 20 Jan 2025 09:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737364612; cv=none; b=KVKX/6S4Dss5IsUkcPcG5/8dDabbppnEwrLK7EBalssc/LNnn6Qqk3esTugN/z3YnFrXgKr7TrpXwz5CrP/Qt1D5o1YF+cQlABnKBlvpGx5BHlcBcCllwg7cG7u2hwfaJykfImyKGxIuli/aMtrIrbcGBbFD9VTX3Xu1an51ECA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737364612; c=relaxed/simple;
	bh=sYOPK5n0Y8mPKJ42apx1GpzU8l3v2hgaZerBeQUeFAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HKZV4jooYYGV0hK5Nsw32XC7KGe3/oheVyR0bspYAExsvxHF/vtZj5n93veM0AMF+OZy8YzvZbR0b4Y5r6IOEKfnqfoz0+pEm9ST1Wrj1I6es/Teg4QeGUAPB/Dve1tq3eo7NyQZIlnIqnA/b8DcSLgd/IrFxK914HyGurNHvuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TsTfapK8; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TsTfapK8"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso4216205e87.2
        for <chrome-platform@lists.linux.dev>; Mon, 20 Jan 2025 01:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737364607; x=1737969407; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0mGuVToP5GgJ7674F4ibSkeejzkyIQRftxnK/ZUBoic=;
        b=TsTfapK8qhrIfPTU2lNfXT/xGYxUsJh9WxXlhJSGxIQrZFk+zD5OOJbAvq4uaSSZwK
         naSLsz/JUeYYdwu8qjdLsV9PwFs8wcQKWJ6quM9p+TTBn4B3ta7fDfNVh75seKLgl9mF
         EddXldnr8U7hPUswUdF8pHTsdXwg5D6WtXfgz1vW9FWGoQtTJeyf7e8gAA6HfBJMO5Ht
         2AlHPUh3QbI28JIWTjggnufgN0rGV9UUAdvUmwX+KZQO3ml9Zyep50kg5tWyI2DA2hoi
         aFl6IGmFCacEzG441lHqCX6h9UWr+leqR24P3wMX5SbJ2uXPQzQnRs3gm4iTg39xWzXd
         Opvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737364607; x=1737969407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mGuVToP5GgJ7674F4ibSkeejzkyIQRftxnK/ZUBoic=;
        b=N8VDZAr/qEwOVNiNhGXRpkzNBYs+kEH8NwFgrQpuUT0/bgM7+loFxhJaphuhgeBAUs
         o20VgVc/wiNxFJU624g0v9p+PubAZaMQViqnHsmn3jW/u7bHqdVJZKGsekFc293rv13n
         T/70L+eOm2U2L5D3lvm0P8Jpm1FX7D8qcJAzJM+9Ug3c6Ib6an06k1RwczV1Sh2YXR1N
         tduLbvN3QqigERmrDhq5uAD8M1Kb4hUvN8ItyUDXEiZS41UFg1pXciN1xZv9YVzVWVLY
         bmH4v9cmOaPeOFgL8Yb2QjJrhBDX4GMOiB7MQBK7wbVGq87s1Xaf5P/NH28Nmc48H94H
         8u2A==
X-Forwarded-Encrypted: i=1; AJvYcCUxgvYissmOCRA++ovmDl0k+UrDnUeCVoxuh39WHO6BVLi2ZPU33d+/l8HuNJouB+PLzGBYdMMwjvpOa1mqsFE=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywe9/foqnRYUZVy68MLltgHd2r0BcwEtWlljSZFtmr+invQRDvq
	rFgjWkHfBqiHVj1a4vTo0czZlfIW5O4HnTLOEnz9p0y5wvxeJqLIud/eAM1165A=
X-Gm-Gg: ASbGncs8JICOM6ZYftt84Lqzb21QzTBVHYh5PjqBmvpF5xEViKw6pW/srX9nNx4KAuU
	Q+u2o1gNMh/XtuRuMwRZBAAZmmLmT2GyXl8jgnswTRLxc93f3JQeCyzka8rPcLwdLaI+PXoB2gq
	TjXOtQl3LjKRkUcNPV+yDy/mDCw4mor7DfTK+RKPgs/l6foe4kxQXPBDd7CdF+lMnPr937vkjvU
	zYtNQW73tRSwPSF3jXSEttTJcpA4DHHTlN95Gia33Kg8qPavtD0EBSDMsWmWsHsbAwqxd9Liivu
	Yg==
X-Google-Smtp-Source: AGHT+IEPqjTMZr9kF5L4Q9EICOFU0VTJqKLJSHILO6JoUiQm8KOXLZzkt7cXnID/70dql3+8kTYIxg==
X-Received: by 2002:ac2:528a:0:b0:53f:6c6a:f99f with SMTP id 2adb3069b0e04-5439c21f277mr3124071e87.8.1737364607280;
        Mon, 20 Jan 2025 01:16:47 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af729ccsm1223639e87.188.2025.01.20.01.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:16:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 Jan 2025 11:16:43 +0200
Subject: [PATCH v2 1/3] usb: typec: ucsi: return CCI and message from
 sync_control callback
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-ucsi-merge-commands-v2-1-462a1ec22ecc@linaro.org>
References: <20250120-ucsi-merge-commands-v2-0-462a1ec22ecc@linaro.org>
In-Reply-To: <20250120-ucsi-merge-commands-v2-0-462a1ec22ecc@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
 =?utf-8?q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6611;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=sYOPK5n0Y8mPKJ42apx1GpzU8l3v2hgaZerBeQUeFAQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnjhR7CHqMGxYwPKr+Wqe3YuDg6fGoumP4Bin+y
 2+vSRsDLUOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ44UewAKCRCLPIo+Aiko
 1dLVB/9C1mWAa1lMJAfYX8Ho/+mXiOg1gDWhkpLtqojW6w8lHhDkzh6ABJe1hRpTeGaeYzLB432
 Y7+EGG8zcIMz/mWatzH2Bu+l/TLgeqtEFhRQKcqTuam6ItOTCerZmHp23e86bzmNOzKyDhxSKxo
 WCU8pQmFoKWkGUQYCRrJ0PS0skrel3rYBW6ZlCRuhlWkfNKnURacAnceFA6xFjglc146yWnoUhp
 cSjYCpayEnMBb8TKMyNteFhzPaGF3l0lTi65TxqxikvrYjyz2W5yWdyz3Gz+kx+GpLTWyU2khJO
 tG1pG9pgJnSiUPh/Ye2+kscyCofC77sSobyc2Sn5dfMiymyY
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Some of the drivers emulate or handle some of the commands in the
platform-specific way. The code ends up being split between several
callbacks, which complicates emulation.

In preparation to reworking such drivers, move read_cci() and
read_message_in() calls into ucsi_sync_control_common().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c |  5 +++--
 drivers/usb/typec/ucsi/ucsi.c         | 19 +++++++++++--------
 drivers/usb/typec/ucsi/ucsi.h         |  6 ++++--
 drivers/usb/typec/ucsi/ucsi_acpi.c    |  5 +++--
 drivers/usb/typec/ucsi/ucsi_ccg.c     |  5 +++--
 5 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index c605c8616726874434d5812731420fbc6f12790e..744f0709a40eddeed17f23e986f60e9f985381fd 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -105,12 +105,13 @@ static int cros_ucsi_async_control(struct ucsi *ucsi, u64 cmd)
 	return 0;
 }
 
-static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
+static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd, u32 *cci,
+				  void *data, size_t size)
 {
 	struct cros_ucsi_data *udata = ucsi_get_drvdata(ucsi);
 	int ret;
 
-	ret = ucsi_sync_control_common(ucsi, cmd);
+	ret = ucsi_sync_control_common(ucsi, cmd, cci, data, size);
 	switch (ret) {
 	case -EBUSY:
 		/* EC may return -EBUSY if CCI.busy is set.
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index fcf499cc9458c0d12015a7e36e5f1ac448c3a431..559390a07a4e427c9b520dffaac905277d071638 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -55,7 +55,8 @@ void ucsi_notify_common(struct ucsi *ucsi, u32 cci)
 }
 EXPORT_SYMBOL_GPL(ucsi_notify_common);
 
-int ucsi_sync_control_common(struct ucsi *ucsi, u64 command)
+int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
+			     void *data, size_t size)
 {
 	bool ack = UCSI_COMMAND(command) == UCSI_ACK_CC_CI;
 	int ret;
@@ -80,6 +81,13 @@ int ucsi_sync_control_common(struct ucsi *ucsi, u64 command)
 	else
 		clear_bit(COMMAND_PENDING, &ucsi->flags);
 
+	if (!ret && cci)
+		ret = ucsi->ops->read_cci(ucsi, cci);
+
+	if (!ret && data &&
+	    (*cci & UCSI_CCI_COMMAND_COMPLETE))
+		ret = ucsi->ops->read_message_in(ucsi, data, size);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(ucsi_sync_control_common);
@@ -95,7 +103,7 @@ static int ucsi_acknowledge(struct ucsi *ucsi, bool conn_ack)
 		ctrl |= UCSI_ACK_CONNECTOR_CHANGE;
 	}
 
-	return ucsi->ops->sync_control(ucsi, ctrl);
+	return ucsi->ops->sync_control(ucsi, ctrl, NULL, NULL, 0);
 }
 
 static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
@@ -108,9 +116,7 @@ static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
 	if (size > UCSI_MAX_DATA_LENGTH(ucsi))
 		return -EINVAL;
 
-	ret = ucsi->ops->sync_control(ucsi, command);
-	if (ucsi->ops->read_cci(ucsi, cci))
-		return -EIO;
+	ret = ucsi->ops->sync_control(ucsi, command, cci, data, size);
 
 	if (*cci & UCSI_CCI_BUSY)
 		return ucsi_run_command(ucsi, UCSI_CANCEL, cci, NULL, 0, false) ?: -EBUSY;
@@ -127,9 +133,6 @@ static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
 	else
 		err = 0;
 
-	if (!err && data && UCSI_CCI_LENGTH(*cci))
-		err = ucsi->ops->read_message_in(ucsi, data, size);
-
 	/*
 	 * Don't ACK connection change if there was an error.
 	 */
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 5ff369c24a2fc445e8559201d563c31d83b2c876..9ffc8debd7d77d118db042f2749cf429a848f8df 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -76,7 +76,8 @@ struct ucsi_operations {
 	int (*read_version)(struct ucsi *ucsi, u16 *version);
 	int (*read_cci)(struct ucsi *ucsi, u32 *cci);
 	int (*read_message_in)(struct ucsi *ucsi, void *val, size_t val_len);
-	int (*sync_control)(struct ucsi *ucsi, u64 command);
+	int (*sync_control)(struct ucsi *ucsi, u64 command, u32 *cci,
+			    void *data, size_t size);
 	int (*async_control)(struct ucsi *ucsi, u64 command);
 	bool (*update_altmodes)(struct ucsi *ucsi, struct ucsi_altmode *orig,
 				struct ucsi_altmode *updated);
@@ -528,7 +529,8 @@ void ucsi_altmode_update_active(struct ucsi_connector *con);
 int ucsi_resume(struct ucsi *ucsi);
 
 void ucsi_notify_common(struct ucsi *ucsi, u32 cci);
-int ucsi_sync_control_common(struct ucsi *ucsi, u64 command);
+int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
+			     void *data, size_t size);
 
 #if IS_ENABLED(CONFIG_POWER_SUPPLY)
 int ucsi_register_port_psy(struct ucsi_connector *con);
diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 5c55155519634d95b6e544632f869c2867093617..8b02082201ec5b85031472563b8b8d1eea6134de 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -122,12 +122,13 @@ static int ucsi_gram_read_message_in(struct ucsi *ucsi, void *val, size_t val_le
 	return ret;
 }
 
-static int ucsi_gram_sync_control(struct ucsi *ucsi, u64 command)
+static int ucsi_gram_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
+				  void *data, size_t size)
 {
 	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
 	int ret;
 
-	ret = ucsi_sync_control_common(ucsi, command);
+	ret = ucsi_sync_control_common(ucsi, command, cci, data, size);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 740171f24ef9fae9abdb52d7995abe692e0a7623..02ac04a52239327475a3590734b77f3ac74bb589 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -628,7 +628,8 @@ static int ucsi_ccg_async_control(struct ucsi *ucsi, u64 command)
 	return ccg_write(uc, reg, (u8 *)&command, sizeof(command));
 }
 
-static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command)
+static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
+				 void *data, size_t size)
 {
 	struct ucsi_ccg *uc = ucsi_get_drvdata(ucsi);
 	struct ucsi_connector *con;
@@ -652,7 +653,7 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command)
 		ucsi_ccg_update_set_new_cam_cmd(uc, con, &command);
 	}
 
-	ret = ucsi_sync_control_common(ucsi, command);
+	ret = ucsi_sync_control_common(ucsi, command, cci, data, size);
 
 err_put:
 	pm_runtime_put_sync(uc->dev);

-- 
2.39.5

