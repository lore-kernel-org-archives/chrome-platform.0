Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CD9338F5B
	for <chrome-platform@lists.linux.dev>; Tue,  9 Sep 2025 12:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757421050; cv=none; b=rXKsZoc25fekcOOfHnwlX3g4lYtqSSGhRVW8E07oJv0UCxFmGsUz7JoRqok2/T5QZxZMONnBaPdakv6vG7eJzeLqzkH9Y8n4F8VkJKhe3kpFfRdRWqkzgLmDWkjBVxHqAD8YeJmETCjC0pXB0ZcuA/Xd9W2/FxzwLg+kNFHS+Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757421050; c=relaxed/simple;
	bh=nvs2gDcjL6C8NXVm+Q+MwxkLZX3yRe9EVozIv1TgODA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sMTcQPSvnjqjjXzUMcrwkDsZutqeuQmlHFGrPOH/aPbO9akDiCqqjBomMxz2hL/2THm1JYarl35nyOLYHzEWn3P1qoSqcyOCWJwDBsu/wdCDq8N2IGs0bW2x2lFvsi4YtXPWhrPDX+9mY6a/YWkigPrAsi9zzdAcMhEstydYaGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dy8Z1PRm; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dy8Z1PRm"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b049bd81ce5so160875066b.1
        for <chrome-platform@lists.linux.dev>; Tue, 09 Sep 2025 05:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757421047; x=1758025847; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WMeag17a1l945PqdAkCvwljw0rC07igvRdu/jbhGyo=;
        b=dy8Z1PRmdITqhlCjKKP6WRsfNoYDGzZckYDHChV93sbL/YPeqk8LHyGZYS/sKquHVV
         5t8NKcC5dXTL616gy2tbLVdOaKPfeWaNsEw2PiCK9qV+YDpGUYkT6j3CILHlJYCVdOTa
         C15ry6SpFN8o6K49JX+jO8lhlviqqg/ymOaIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757421047; x=1758025847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WMeag17a1l945PqdAkCvwljw0rC07igvRdu/jbhGyo=;
        b=Q5yNXPH8bP6EU/CovKyLWcRY+6MZo6fy1inTAlN1ihPJtCsdGqPk9UZ/8e7iyNm253
         PPhY9psBBCIStVf49PZLul3fPrcFYosCo6uDVYE4p6k76NT+55NsPHP1M50yGvTGJx4z
         KOzIvYCFvQgtA9u4oLuhgWTEM7KCDzHEppapEnPxYj272V65DK2Qxvy4jOkdYc5kXeyb
         9EVSVK0qrRvfnyXyxxeV/Doqy4vUzf5FcdxN9ziJCBDzif1HHBthD2C/L/pq1Cut07Nc
         190vfbRq1wsgrBAnHob7liNJv3g5bh88ezjGpD0HLCLt0Ii4kPxMvPXag0VwNTBQhq6y
         REiw==
X-Forwarded-Encrypted: i=1; AJvYcCXYuR9w1yb40wSIiB3oUtTNKz/G66hoqhuoHZJTw43OwjfFdr7HUN2UpRvaFuTV+bJFBiQ0mbcE33qW9GQuASc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCTUG7XxvWYXFbNEYl20JYfkKcpRvzwBBgQm42gyYdNUgG0q31
	lcU+C0becPrLcIfufihFYMZbQLV1fyGR0Gj8ZQnsX0i2GjmizVjPmYsJU7Ff8HUQDA==
X-Gm-Gg: ASbGncuxxpK5ycpOs+EzKMJCxupKxaqNW1Rvpuz2QqBXAgF6bUyZt6kVmoDQ3WQmlbE
	sKDBqGIgHiX1XTkGmuPia3XGumQwRJ8F6HRgchM15SvsklqD5Vdi5f7SIoBAo601qjGmSheCGv4
	AxfdggTdaBiJgXfy6hzAs4uR5zBn+xvMZR50otSFnueWh0TZaYxvEO46R24YYCiDUADCB+pXTLg
	4qePbdg0ymX+i2OKr1fd92rL1qvlIFgmFBB3Hd+E9xnWQJbdgsD5TQjc4T8PA8SfaI3lXVsKUV0
	nqClxT4B1Zcb1GzzZSYe5vxr5/rVHGN1ENxLOV0bLEHsg21XbKA9rwurOv5C1jfj0a8u0iY8HbN
	0t0y5GdpeoCecBX+qd925ZgBLtrPc/BJXKAPUuAv4NbDPBNXfkZ2gjhJ5qe90cKrSFkmkCsMpRX
	w65rcN9nfwvVcelCAj8lpo6N3G8Q==
X-Google-Smtp-Source: AGHT+IFhBrHiIKFQDuEGLUi8nmmT8pVqq//MniH5jqrxhg+sNjRz6k9qHyzIb5oAJzhfDrVeqxv60A==
X-Received: by 2002:a17:907:c2a:b0:b04:2c2e:50a5 with SMTP id a640c23a62f3a-b04b1f0d207mr1522958966b.16.1757421046612;
        Tue, 09 Sep 2025 05:30:46 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b01902d0e99sm2409702166b.12.2025.09.09.05.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:30:46 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH RFC 3/5] usb: typec: Report altmode entry status via callback
Date: Tue,  9 Sep 2025 12:30:26 +0000
Message-ID: <20250909123028.2127449-4-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
In-Reply-To: <20250909123028.2127449-1-akuchynski@chromium.org>
References: <20250909123028.2127449-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Type-C mode selection logic requires feedback on the result of an
alternate mode entry attempt.
Call the `typec_mode_selection_altmode_complete()` callback to provide
this final success or failure status.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/altmodes/displayport.c | 19 +++++++++++++++++--
 drivers/usb/typec/altmodes/thunderbolt.c | 10 ++++++++++
 include/linux/usb/typec_dp.h             |  2 ++
 include/linux/usb/typec_tbt.h            |  3 +++
 4 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 1dcb77faf85d..052d18b54f0a 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -293,16 +293,20 @@ static void dp_altmode_work(struct work_struct *work)
 		header = DP_HEADER(dp, svdm_version, DP_CMD_STATUS_UPDATE);
 		vdo = 1;
 		ret = typec_altmode_vdm(dp->alt, header, &vdo, 2);
-		if (ret)
+		if (ret) {
 			dev_err(&dp->alt->dev,
 				"unable to send Status Update command (%d)\n",
 				ret);
+			typec_altmode_entry_complete(dp->alt, ret);
+		}
 		break;
 	case DP_STATE_CONFIGURE:
 		ret = dp_altmode_configure_vdm(dp, dp->data.conf);
-		if (ret)
+		if (ret) {
 			dev_err(&dp->alt->dev,
 				"unable to send Configure command (%d)\n", ret);
+			typec_altmode_entry_complete(dp->alt, ret);
+		}
 		break;
 	case DP_STATE_CONFIGURE_PRIME:
 		ret = dp_altmode_configure_vdm_cable(dp, dp->data_prime.conf);
@@ -371,6 +375,7 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 	int cmd_type = PD_VDO_CMDT(hdr);
 	int cmd = PD_VDO_CMD(hdr);
 	int ret = 0;
+	int entry_result = 0;
 
 	mutex_lock(&dp->lock);
 
@@ -414,10 +419,14 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 		switch (cmd) {
 		case DP_CMD_STATUS_UPDATE:
 			dp->state = DP_STATE_EXIT;
+			if (vdo)
+				entry_result = *(int *)vdo;
 			break;
 		case DP_CMD_CONFIGURE:
 			dp->data.conf = 0;
 			ret = dp_altmode_configured(dp);
+			if (vdo)
+				entry_result = *(int *)vdo;
 			break;
 		default:
 			break;
@@ -432,6 +441,12 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 
 err_unlock:
 	mutex_unlock(&dp->lock);
+
+	if (!entry_result)
+		entry_result = ret;
+	if (entry_result || cmd == DP_CMD_CONFIGURE)
+		typec_altmode_entry_complete(dp->alt, entry_result);
+
 	return ret;
 }
 
diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
index 6eadf7835f8f..765ba7348ac4 100644
--- a/drivers/usb/typec/altmodes/thunderbolt.c
+++ b/drivers/usb/typec/altmodes/thunderbolt.c
@@ -214,6 +214,7 @@ static int tbt_altmode_vdm(struct typec_altmode *alt,
 	struct typec_thunderbolt_data data;
 	int cmd_type = PD_VDO_CMDT(hdr);
 	int cmd = PD_VDO_CMD(hdr);
+	int entry_result = 0;
 
 	mutex_lock(&tbt->lock);
 
@@ -248,6 +249,12 @@ static int tbt_altmode_vdm(struct typec_altmode *alt,
 		switch (cmd) {
 		case CMD_ENTER_MODE:
 			dev_warn(&alt->dev, "Enter Mode refused\n");
+			if (vdo)
+				entry_result = *(int *)vdo;
+			break;
+		case TBT_CMD_STATUS_UPDATE:
+			if (vdo)
+				entry_result = *(int *)vdo;
 			break;
 		default:
 			break;
@@ -262,6 +269,9 @@ static int tbt_altmode_vdm(struct typec_altmode *alt,
 
 	mutex_unlock(&tbt->lock);
 
+	if (entry_result || cmd == TBT_CMD_STATUS_UPDATE)
+		typec_altmode_entry_complete(alt, entry_result);
+
 	return 0;
 }
 
diff --git a/include/linux/usb/typec_dp.h b/include/linux/usb/typec_dp.h
index acb0ad03bdac..c9fa68cd1265 100644
--- a/include/linux/usb/typec_dp.h
+++ b/include/linux/usb/typec_dp.h
@@ -44,10 +44,12 @@ enum {
  * commands: Status Update and Configure.
  *
  * @status will show for example the status of the HPD signal.
+ * @error will contain the error code, if applicable.
  */
 struct typec_displayport_data {
 	u32 status;
 	u32 conf;
+	int error;
 };
 
 enum {
diff --git a/include/linux/usb/typec_tbt.h b/include/linux/usb/typec_tbt.h
index 55dcea12082c..57cbda5292bb 100644
--- a/include/linux/usb/typec_tbt.h
+++ b/include/linux/usb/typec_tbt.h
@@ -24,6 +24,9 @@ struct typec_thunderbolt_data {
 	u32 enter_vdo;
 };
 
+/* TBT3 alt mode specific commands */
+#define TBT_CMD_STATUS_UPDATE		VDO_CMD_VENDOR(0)
+
 /* TBT3 Device Discover Mode VDO bits */
 #define TBT_MODE			BIT(0)
 #define TBT_ADAPTER(_vdo_)		FIELD_GET(BIT(16), _vdo_)
-- 
2.51.0.384.g4c02a37b29-goog

