Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3C830BF4E
	for <chrome-platform@lists.linux.dev>; Mon,  1 Dec 2025 12:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764591991; cv=none; b=BbRBZQK2R4nYqf/NgfsnDTaGjQj8LyEuNBz3WZNeI5wP+YyTRV3bGNOolOBrTfnC7x9r17gRrLRdAFS4Swbr1lj7OkblBo7GdrRMhNn6Jnkb0Z2CGU3V+0XNTfK3JrXCfqdGQGSUZImWUbn2rxVlE2/Efy8m9qW8I6qsbRspD5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764591991; c=relaxed/simple;
	bh=Aw9cRokS/uZtiRRUzr7HvgFMTdAZMAC2OR3yeCxVV8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lH2NH7yZSfwF24+YMNt7Nlodl6S/S8wcIFGBR1ssVlmwvMNQR1AgKfxN3xX64jSnlbTCAbd9HJs44C0f+majIqrfSPZz/dEh19ZuewOl0S+2lMIpQblbmyRdYvAOYsd+baEcP8oupdo7BMBG+HxdMXlNlE1NKQF9sQjI9JioFb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TakFqFOZ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TakFqFOZ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b737502f77bso567820866b.2
        for <chrome-platform@lists.linux.dev>; Mon, 01 Dec 2025 04:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764591987; x=1765196787; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tm2xzdVNcbrW6Xwd+l1xE/GsVThA2I1Dhuida+Cqw6c=;
        b=TakFqFOZAPLv5/oJv6206nn6dk4vcQyPFQ1pOIGCDrz12KNRhHrPZgqtcUfNLkwHyi
         CExaoyqHfqxL7AfZdDSi2oQ4qBHb1cXFityQN5BgTckwePn92FcZBN+9dOO3wOwRmTph
         2pSTsZkisy95nQTmcauEU+wq9KjfEX/CqlB6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764591987; x=1765196787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tm2xzdVNcbrW6Xwd+l1xE/GsVThA2I1Dhuida+Cqw6c=;
        b=Sy5pma+yIOWov5fIqinAsOD/KGUn/PCM2JavWQrGXgiFuiwlbdOgvE8Am/ylJ570xO
         bN7/Nk5Va++wuMqbd/6Kv+N3hJ+YXi98eMB+KUfNhB7zAwilLolDP5ZDuImNLxZtSbsL
         39sz7ugvV4qtj7mq+Bq82xKzaQomo2DFHeHDsay1VM0y2oQw0aDqC0M+s+cRVtPXfIZo
         GU7MJY6ALIcCJ3y8jvWvLVdOJ762XkLXMqzygS2YWLMHDvpCjgEHXZSzoj4nD2OwAUgb
         Kssubo0UE29sAL+yJvARmae4/SxZ3YayzKCEHjawMsooqjesdrmJAQOpmrJBMQNTUue9
         XNfw==
X-Forwarded-Encrypted: i=1; AJvYcCVy7jB/erKUgLBd/3sHVmA07abPsEVfGGbGXXVIvQrshBv9HwlSfTQT34DPgy2+oxI1bO6xQSwNvLOBlujO2Ps=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlTJixbbE0j7DFOU+y0QhTgggHNGEjKwRusdSlJKQ/NFJ52bNw
	M6wkpd+KQizGJAyTf5aNtJCs0pTvOXTEUHk8M7pweG4N84FK1J6N5rg9ku8gbvn+xQ==
X-Gm-Gg: ASbGncvXEGTu1m807AMsxIQMn9Nf7hAhWI8jfFL7jwzKAHZ4fRIV0BG3GATd9Hv73sA
	uX8njExO0KYgQxnuBbmC4vQQiNvjeoziV7Npe2q6AyDdNIHAciScqm3Pjry+j6ol+lr4YNaDx1U
	Q5VT2b5X+y1raMldVyf4felYi3lC2yxWoAb9GuvHRMWXTGDR3RXXNJFaOe/2xe06EEBmd7HFfFW
	62pCIvJ7O9Yd9+ATRf+alDzwlZzNGuU8/dfJkzcekRFHFQglmiYxzRrk2eDLxnjAnPXkfoebHXX
	PmIOwAt/+9DYkIk6oDvmn9ukKBkixc4e44YuSJZ0IRIOp2O4CYHuKR7hFprR8f8+MoTEwV3MZGu
	+NpjQLX95HgA+F/43m6/Msw/JIJu7Rtk4U3u1ARSkd8pFQkYvpyi4GoW40YQA3M6q55AcAzPzgv
	6abCFJtzxaAcsL7kS+MYNl+UgXXdiVUdrgOtlmlrkPr3Cl0VXCuRoNrIPO7FlqYVqLOpnUD7ErE
	YWiqv79YLE=
X-Google-Smtp-Source: AGHT+IGhiJudIaKRHf4l8rAikemNGaJh4kR2eXwxXLj3hd7r42POxmccuoXvUuS74QXXqJ13JrDiDQ==
X-Received: by 2002:a17:907:7f19:b0:b73:9b49:2dc7 with SMTP id a640c23a62f3a-b76c558f4b0mr2627081066b.52.1764591987274;
        Mon, 01 Dec 2025 04:26:27 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (218.127.147.34.bc.googleusercontent.com. [34.147.127.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f519e331sm1229049266b.24.2025.12.01.04.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:26:26 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Pavan Holla <pholla@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH RFC 7/8] usb: typec: ucsi: Support for Thunderbolt alt mode
Date: Mon,  1 Dec 2025 12:26:03 +0000
Message-ID: <20251201122604.1268071-8-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.158.g65b55ccf14-goog
In-Reply-To: <20251201122604.1268071-1-akuchynski@chromium.org>
References: <20251201122604.1268071-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes it possible to bind a driver to a Thunderbolt
alt mode adapter devices.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/Makefile      |   4 +
 drivers/usb/typec/ucsi/thunderbolt.c | 199 +++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.c        |  17 ++-
 drivers/usb/typec/ucsi/ucsi.h        |  20 +++
 4 files changed, 235 insertions(+), 5 deletions(-)
 create mode 100644 drivers/usb/typec/ucsi/thunderbolt.c

diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
index dbc571763eff..c7e38bf01350 100644
--- a/drivers/usb/typec/ucsi/Makefile
+++ b/drivers/usb/typec/ucsi/Makefile
@@ -17,6 +17,10 @@ ifneq ($(CONFIG_TYPEC_DP_ALTMODE),)
 	typec_ucsi-y			+= displayport.o
 endif
 
+ifneq ($(CONFIG_TYPEC_TBT_ALTMODE),)
+	typec_ucsi-y			+= thunderbolt.o
+endif
+
 obj-$(CONFIG_UCSI_ACPI)			+= ucsi_acpi.o
 obj-$(CONFIG_UCSI_CCG)			+= ucsi_ccg.o
 obj-$(CONFIG_UCSI_STM32G0)		+= ucsi_stm32g0.o
diff --git a/drivers/usb/typec/ucsi/thunderbolt.c b/drivers/usb/typec/ucsi/thunderbolt.c
new file mode 100644
index 000000000000..b48aba30fb9f
--- /dev/null
+++ b/drivers/usb/typec/ucsi/thunderbolt.c
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * UCSI Thunderbolt Alternate Mode Support
+ *
+ * Copyright 2025 Google LLC
+ */
+
+#include <linux/usb/typec_tbt.h>
+#include <linux/usb/pd_vdo.h>
+
+#include "ucsi.h"
+
+struct ucsi_tbt {
+	struct ucsi_connector *con;
+	struct typec_altmode *alt;
+	struct work_struct work;
+
+	int cam;
+	u32 header;
+};
+
+static int ucsi_thunderbolt_send_set_new_cam(struct ucsi_tbt *tbt,
+				const int enter)
+{
+	int ret;
+	const u64 command = UCSI_SET_NEW_CAM |
+				UCSI_CONNECTOR_NUMBER(tbt->con->num) |
+				UCSI_SET_NEW_CAM_SET_ENTER(enter) |
+				UCSI_SET_NEW_CAM_SET_AM(tbt->cam);
+
+	tbt->con->ucsi->message_in_size = 0;
+	ret = ucsi_send_command(tbt->con->ucsi, command);
+
+	return ret < 0 ? ret : 0;
+}
+
+static void ucsi_thunderbolt_work(struct work_struct *work)
+{
+	struct ucsi_tbt *tbt = container_of(work, struct ucsi_tbt, work);
+	const int ret = typec_altmode_vdm(tbt->alt, tbt->header, NULL, 0);
+
+	if (ret)
+		dev_err(&tbt->alt->dev, "VDM 0x%x failed\n", tbt->header);
+}
+
+static int ucsi_thunderbolt_send_vdm(struct ucsi_tbt *tbt,
+					const int cmd, const int cmdt,
+					const int svdm_version)
+{
+	if (svdm_version < 0)
+		return svdm_version;
+
+	tbt->header = VDO(USB_TYPEC_TBT_SID, 1, svdm_version, cmd);
+	tbt->header |= VDO_OPOS(TYPEC_TBT_MODE);
+	tbt->header |= VDO_CMDT(cmdt);
+
+	schedule_work(&tbt->work);
+
+	return 0;
+}
+
+static int ucsi_thunderbolt_enter(struct typec_altmode *alt, u32 *vdo)
+{
+	struct ucsi_tbt *tbt = typec_altmode_get_drvdata(alt);
+	struct ucsi *ucsi = tbt->con->ucsi;
+	int svdm_version;
+	u64 command;
+	u8 cur = 0;
+	int ret = 0;
+
+	if (!ucsi_con_mutex_lock(tbt->con))
+		return -ENOTCONN;
+
+	command = UCSI_GET_CURRENT_CAM | UCSI_CONNECTOR_NUMBER(tbt->con->num);
+	ucsi->message_in_size = 0;
+	ret = ucsi_send_command(ucsi, command);
+	if (ret < 0) {
+		if (tbt->con->ucsi->version > 0x0100)
+			goto err_unlock;
+		cur = 0xff;
+	} else {
+		memcpy(&cur, ucsi->message_in, ucsi->message_in_size);
+	}
+
+	if (cur != 0xff) {
+		ret = tbt->con->port_altmode[cur] == alt ? 0 : -EBUSY;
+	} else {
+		ret = ucsi_thunderbolt_send_set_new_cam(tbt, 1);
+		if (!ret) {
+			svdm_version = typec_altmode_get_svdm_version(alt);
+			ret = ucsi_thunderbolt_send_vdm(tbt, CMD_ENTER_MODE, CMDT_RSP_ACK,
+					svdm_version);
+		}
+	}
+
+err_unlock:
+	ucsi_con_mutex_unlock(tbt->con);
+
+	return ret;
+}
+
+static int ucsi_thunderbolt_exit(struct typec_altmode *alt)
+{
+	struct ucsi_tbt *tbt = typec_altmode_get_drvdata(alt);
+	int svdm_version;
+	int ret;
+
+	if (!ucsi_con_mutex_lock(tbt->con))
+		return -ENOTCONN;
+
+	ret = ucsi_thunderbolt_send_set_new_cam(tbt, 0);
+	if (!ret) {
+		svdm_version = typec_altmode_get_svdm_version(alt);
+		ret = ucsi_thunderbolt_send_vdm(tbt, CMD_EXIT_MODE, CMDT_RSP_ACK,
+					svdm_version);
+	}
+
+	ucsi_con_mutex_unlock(tbt->con);
+
+	return ret;
+}
+
+static int ucsi_thunderbolt_vdm(struct typec_altmode *alt,
+				u32 header, const u32 *data, int count)
+{
+	struct ucsi_tbt *tbt = typec_altmode_get_drvdata(alt);
+	const int cmd_type = PD_VDO_CMDT(header);
+	const int cmd = PD_VDO_CMD(header);
+	int svdm_version;
+
+	if (!ucsi_con_mutex_lock(tbt->con))
+		return -ENOTCONN;
+
+	svdm_version = typec_altmode_get_svdm_version(alt);
+	if (svdm_version < 0) {
+		ucsi_con_mutex_unlock(tbt->con);
+		return svdm_version;
+	}
+
+	switch (cmd_type) {
+	case CMDT_INIT:
+		if (PD_VDO_SVDM_VER(header) < svdm_version) {
+			svdm_version = PD_VDO_SVDM_VER(header);
+			typec_partner_set_svdm_version(tbt->con->partner, svdm_version);
+		}
+		ucsi_thunderbolt_send_vdm(tbt, cmd, CMDT_RSP_ACK, svdm_version);
+		break;
+	default:
+		break;
+	}
+
+	ucsi_con_mutex_unlock(tbt->con);
+
+	return 0;
+}
+
+static const struct typec_altmode_ops ucsi_thunderbolt_ops = {
+	.enter = ucsi_thunderbolt_enter,
+	.exit = ucsi_thunderbolt_exit,
+	.vdm = ucsi_thunderbolt_vdm,
+};
+
+struct typec_altmode *ucsi_register_thunderbolt(struct ucsi_connector *con,
+						bool override, int offset,
+						struct typec_altmode_desc *desc)
+{
+	struct typec_altmode *alt;
+	struct ucsi_tbt *tbt;
+
+	alt = typec_port_register_altmode(con->port, desc);
+	if (IS_ERR(alt) || !override)
+		return alt;
+
+	tbt = devm_kzalloc(&alt->dev, sizeof(*tbt), GFP_KERNEL);
+	if (!tbt) {
+		typec_unregister_altmode(alt);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	tbt->cam = offset;
+	tbt->con = con;
+	tbt->alt = alt;
+	typec_altmode_set_drvdata(alt, tbt);
+	typec_altmode_set_ops(alt, &ucsi_thunderbolt_ops);
+	INIT_WORK(&tbt->work, ucsi_thunderbolt_work);
+
+	return alt;
+}
+
+void ucsi_thunderbolt_remove_partner(struct typec_altmode *alt)
+{
+	struct ucsi_tbt *tbt;
+
+	if (alt) {
+		tbt = typec_altmode_get_drvdata(alt);
+		if (tbt)
+			cancel_work_sync(&tbt->work);
+	}
+}
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 3d4c277bcd49..d2b00b3a8fd1 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_tbt.h>
 
 #include "ucsi.h"
 #include "trace.h"
@@ -442,6 +443,9 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
 				alt = ucsi_register_displayport(con, override,
 								i, desc);
 			break;
+		case USB_TYPEC_TBT_SID:
+			alt = ucsi_register_thunderbolt(con, override, i, desc);
+			break;
 		default:
 			alt = typec_port_register_altmode(con->port, desc);
 			break;
@@ -678,12 +682,15 @@ static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
 	}
 
 	while (adev[i]) {
-		if (recipient == UCSI_RECIPIENT_SOP &&
-		    (adev[i]->svid == USB_TYPEC_DP_SID ||
-			(adev[i]->svid == USB_TYPEC_NVIDIA_VLINK_SID &&
-			adev[i]->vdo != USB_TYPEC_NVIDIA_VLINK_DBG_VDO))) {
+		if (recipient == UCSI_RECIPIENT_SOP) {
 			pdev = typec_altmode_get_partner(adev[i]);
-			ucsi_displayport_remove_partner((void *)pdev);
+
+			if (adev[i]->svid == USB_TYPEC_DP_SID ||
+				(adev[i]->svid == USB_TYPEC_NVIDIA_VLINK_SID &&
+				 adev[i]->vdo != USB_TYPEC_NVIDIA_VLINK_DBG_VDO))
+				ucsi_displayport_remove_partner((void *)pdev);
+			else if (adev[i]->svid == USB_TYPEC_TBT_SID)
+				ucsi_thunderbolt_remove_partner((void *)pdev);
 		}
 		typec_unregister_altmode(adev[i]);
 		adev[i++] = NULL;
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index a5ef35d9dce5..b405cce554af 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -242,6 +242,7 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_ERROR_SET_SINK_PATH_REJECTED	BIT(14)
 
 #define UCSI_SET_NEW_CAM_ENTER(x)		(((x) >> 23) & 0x1)
+#define UCSI_SET_NEW_CAM_SET_ENTER(x)		(((x) & 1) << 23)
 #define UCSI_SET_NEW_CAM_GET_AM(x)		(((x) >> 24) & 0xff)
 #define UCSI_SET_NEW_CAM_AM_MASK		(0xff << 24)
 #define UCSI_SET_NEW_CAM_SET_AM(x)		(((x) & 0xff) << 24)
@@ -613,6 +614,25 @@ static inline void
 ucsi_displayport_remove_partner(struct typec_altmode *adev) { }
 #endif /* CONFIG_TYPEC_DP_ALTMODE */
 
+#if IS_ENABLED(CONFIG_TYPEC_TBT_ALTMODE)
+struct typec_altmode *
+ucsi_register_thunderbolt(struct ucsi_connector *con,
+			  bool override, int offset,
+			  struct typec_altmode_desc *desc);
+
+void ucsi_thunderbolt_remove_partner(struct typec_altmode *adev);
+#else
+static inline struct typec_altmode *
+ucsi_register_thunderbolt(struct ucsi_connector *con,
+			  bool override, int offset,
+			  struct typec_altmode_desc *desc)
+{
+	return typec_port_register_altmode(con->port, desc);
+}
+static inline void
+ucsi_thunderbolt_remove_partner(struct typec_altmode *adev) { }
+#endif /* CONFIG_TYPEC_TBT_ALTMODE */
+
 #ifdef CONFIG_DEBUG_FS
 void ucsi_debugfs_init(void);
 void ucsi_debugfs_exit(void);
-- 
2.52.0.158.g65b55ccf14-goog

