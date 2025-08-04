Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D1F246766
	for <chrome-platform@lists.linux.dev>; Mon,  4 Aug 2025 09:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298278; cv=none; b=owq/SuqaWWrKK13Zk8U32kf9ceJe44tVTtyvg9ZCm1UeFZ+QBnLS5WbIh013GCPERo50uSlfDMhErgdeh7IQSYRL7qSrRedqoecS2OH7dNhxaZJld81RIwLAkXjVNq3PsRLDgTw8agORmKE4WkRnx79XjCbde1lew0WMhbQkLyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298278; c=relaxed/simple;
	bh=Wim6/hhsGkzpmyBteC6lxKug+x1Hl++2A1SnnryflnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SXf60n25QTCReasiyz0DK7yIezHhcs4b1HDvyFXkNGUNatskK8RtVkp1SuzQ+HtnKr7wnDNRgMzwLOG6yjfTcPqLrZDTQ4vkr7QtVtf1/kfLwW/8fPByhT+n9ghUqIfe6ehu0j8KxSCZTpkCOq+o3q0sv6JI9u5eKQ/8qOi+ILs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MhUoDW0n; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MhUoDW0n"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6156a162537so6220296a12.2
        for <chrome-platform@lists.linux.dev>; Mon, 04 Aug 2025 02:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754298274; x=1754903074; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JirWTL5DD5i/aaLwZXtRPh+upuNujZxtHnxy4nebniE=;
        b=MhUoDW0n217yr44DmcJY05l6clWQT2CeNC6eDwR4KNKUp8pE63km8OYswwZbwn4j0C
         AC8LZflovhZj7/tRXdh5CAj0wKZM2DUYktszG44zMhi6M7qimBUO0ITlkpN9Q4WASsGP
         XZ+Kt/aZtQriTpCQzLotnDiNbtykjg/eLf9Do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754298274; x=1754903074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JirWTL5DD5i/aaLwZXtRPh+upuNujZxtHnxy4nebniE=;
        b=Has/IIU2FADRQfcYM5f8rTNZzjAH3Z1FwwTgXpQo7/CjLFigI7XQsatpd8cEHR2gwB
         +HagMDFAyuuybF1tYLx9jbmkFNqPjI3OZaM4CP/sQgUuD93fUDTHUpgBxqRrO82y2+ss
         1DlInVPx0Eci3Tdkx1oZnPHDY5JIjiaOQWbljfBnsCEB6UmCogIVy74Y4PLTeYtjJoGW
         BMIEyACkZSAAata0wXWDuEL3JxPQNEeJQ91nW1CWcTcyfH9iKpmhmmxFtsbSdbG6Kazl
         sz7XqnpuFFKINzHkJEAqS60DcpuWhBc9A54LqRdz4VJNeewHnOdIdU50MCMhFBNYmmPY
         2fqA==
X-Forwarded-Encrypted: i=1; AJvYcCVUSwA4RftqKNgxMcN4iiJoRx3zDU75DZZ/rqv9mvIi2NkqMqE1It5yWy62KALCPhFsifVKLAXnCLH0U7kuG/Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YyGno1pXe7uHgwuDkdOYoPn+YKxQMZ3HL+9OoxcsP7X6yidZ+3n
	/1N6Yn+Oa7xAR5GPTetuphaWbl9x7rB6J420s06Y2gRP6Z4fWWSne9ZD60HOj5scUKiFfPfetQf
	HGD8=
X-Gm-Gg: ASbGncsLTvscN4BoDv8bbA64zgiZ6pj8It9qLlwuznASw+7qMMD5nsc/cYdgTyGGold
	MeL7t4LxNoaoijd+RwHRZdsMU0MFhQKoH00aU1UZwLNcgnqorG11c4BQSZUJXldUrpiwm1geOB6
	dFWASsy4oT7K/M7FRpXS5jZFLnXdQsQsFK+OIIWqzDJSE4bP1hW6IoWZ4N67vghkPme1M3Gl+NE
	fxGU8/2Uq6CNlrNdgK7gDaWYrc9pCD6RI37iQ3t5PJJLP41EFzevXn3d1zNhGfiM1SmfxGKFBUt
	AuSDLFhjD9MFM8JbEimYRpBLJdLxSFqV7Ctyh33onsveG1Mtityn1W3enX7Vdj5zPHYeLLIH2zv
	9QXDO1vqZdmtyo0TOS+gIuPMOllNbUHbMakP2iXxZyctH6ZyF1KLhYioJ6HLxnSpB3B10VqByhE
	u27ZUnMaOl8Z8fHy0=
X-Google-Smtp-Source: AGHT+IEXwVnGXEwJmvwIKQ+9TglwzCM+Cwf+cZbxJgv6w4qbaGweSEZddpXpmziYmO2DBNvTXArTGA==
X-Received: by 2002:a17:907:948c:b0:ae6:abe9:4daa with SMTP id a640c23a62f3a-af940079146mr950414766b.27.1754298274157;
        Mon, 04 Aug 2025 02:04:34 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe7995sm6412790a12.36.2025.08.04.02.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 02:04:33 -0700 (PDT)
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
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v3 06/10] usb: typec: Report altmode entry status via callback
Date: Mon,  4 Aug 2025 09:03:35 +0000
Message-ID: <20250804090340.3062182-7-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
In-Reply-To: <20250804090340.3062182-1-akuchynski@chromium.org>
References: <20250804090340.3062182-1-akuchynski@chromium.org>
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
 drivers/usb/typec/altmodes/displayport.c | 17 +++++++++++++++--
 drivers/usb/typec/altmodes/thunderbolt.c |  8 ++++++++
 include/linux/usb/typec_tbt.h            |  3 +++
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 1dcb77faf85d..cac78d995047 100644
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
+			typec_mode_selection_altmode_complete(dp->alt, ret);
+		}
 		break;
 	case DP_STATE_CONFIGURE:
 		ret = dp_altmode_configure_vdm(dp, dp->data.conf);
-		if (ret)
+		if (ret) {
 			dev_err(&dp->alt->dev,
 				"unable to send Configure command (%d)\n", ret);
+			typec_mode_selection_altmode_complete(dp->alt, ret);
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
 
@@ -414,10 +419,12 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 		switch (cmd) {
 		case DP_CMD_STATUS_UPDATE:
 			dp->state = DP_STATE_EXIT;
+			entry_result = *(int *)vdo;
 			break;
 		case DP_CMD_CONFIGURE:
 			dp->data.conf = 0;
 			ret = dp_altmode_configured(dp);
+			entry_result = *(int *)vdo;
 			break;
 		default:
 			break;
@@ -432,6 +439,12 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 
 err_unlock:
 	mutex_unlock(&dp->lock);
+
+	if (!entry_result)
+		entry_result = ret;
+	if (entry_result || cmd == DP_CMD_CONFIGURE)
+		typec_mode_selection_altmode_complete(dp->alt, entry_result);
+
 	return ret;
 }
 
diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
index 6eadf7835f8f..bbba3c6bc8b8 100644
--- a/drivers/usb/typec/altmodes/thunderbolt.c
+++ b/drivers/usb/typec/altmodes/thunderbolt.c
@@ -214,6 +214,7 @@ static int tbt_altmode_vdm(struct typec_altmode *alt,
 	struct typec_thunderbolt_data data;
 	int cmd_type = PD_VDO_CMDT(hdr);
 	int cmd = PD_VDO_CMD(hdr);
+	int entry_result = 0;
 
 	mutex_lock(&tbt->lock);
 
@@ -248,6 +249,10 @@ static int tbt_altmode_vdm(struct typec_altmode *alt,
 		switch (cmd) {
 		case CMD_ENTER_MODE:
 			dev_warn(&alt->dev, "Enter Mode refused\n");
+			entry_result = *(int *)vdo;
+			break;
+		case TBT_CMD_STATUS_UPDATE:
+			entry_result = *(int *)vdo;
 			break;
 		default:
 			break;
@@ -262,6 +267,9 @@ static int tbt_altmode_vdm(struct typec_altmode *alt,
 
 	mutex_unlock(&tbt->lock);
 
+	if (entry_result || cmd == TBT_CMD_STATUS_UPDATE)
+		typec_mode_selection_altmode_complete(alt, entry_result);
+
 	return 0;
 }
 
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
2.50.1.565.gc32cd1483b-goog

