Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E3E1A9B45
	for <chrome-platform@lists.linux.dev>; Mon, 20 Jan 2025 09:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737364613; cv=none; b=agY3W/mLlTu+t8pPTANngKQkHJf3WYBq9NgwjmDg71oqkvCk28wZc0vuUs1V+DVTLWvYl1c+BUU0pinuOfXzwBjcySlX5zQ+zJKffoJ05qjPPuf4OX0rFYGXOm3rZOeBY08PEaXdkmt7lXAeDi+BJRHDU/CFNDWlwW1o8Tad8Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737364613; c=relaxed/simple;
	bh=heR3VU+nxs99VRFMxd5VRCD07Xmz+D63MnVIf+KUZ+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e9048nj9uFT7oQSVKsEmKN42YuYUs/m/t3nA2DA/OwMQ6RrAGySZkrfZsXDxpCCSNDnak+E8deCS/DKybAWvNmvOW92xSXQlofCtMqyx7nWo90VcLT/MaItVCXdnZAcX26RoOX2yn8si4rOiJUSIS2mJphPPjp6hDGyIxK5AoPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wk7utdqL; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wk7utdqL"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-540201cfedbso3903880e87.3
        for <chrome-platform@lists.linux.dev>; Mon, 20 Jan 2025 01:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737364610; x=1737969410; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hibVCX0t4Pp4PQDIRaZNNKRSG9poNjEEnaBSc7dWujQ=;
        b=Wk7utdqLwc4DDK/w7JZREx4TIerQuQSa0b38SCLFy3xixWlILRz/WmHmcEIrmgOQAQ
         IOhWcOqCn63oq80lDFn60/2qscW/1eLHSicEeFNlBjbU+DJRUpABqyL1EXj6vDIaJFbO
         sdbqbm+LlswmCfma1dWLXgUgbR1B3MPDFCuBOJHmkfyTkoCzqvRePo3VcuZxGlmHBibu
         0FP5OiGzIYNd3XlKIfeYo08tQwm//hAb4RW2iyIik5S/ztzyPf2911gDF1C1DCmWyXNz
         nBpwxQsj77QfLsQdq/mWiFetK13FHuEt+Y6pxp2aQnhj92LYIT+8QmcslC+VrwGEYl7T
         H/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737364610; x=1737969410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hibVCX0t4Pp4PQDIRaZNNKRSG9poNjEEnaBSc7dWujQ=;
        b=fAssSvRCD+idQBwHxJzVhuCvCoiOAxhkot7vo80Tubjf7gcRKWZA+VrKuOOtvvlbsR
         inmKYxlRARTDbL6ljiF0/QWyXQR34CoUTUqu+H+AFqJEO0d+GU2otrc/+TOHtG4biCW+
         VwZEWj3ZLGw+5LNrA0G8gRHxL7tIy58MVSklWPkRPde95DAeGLdHPrX/bVXFJAMFBjgJ
         KZr+GaHmimtA7asJlDfOhIjSdoXOCfGCDFnSmD/+Pv0/XdT32PPoEpgMj8ihZmUMIjqJ
         2WMao/c8YWExhnap0o31PJtRXMrxhQGySsE+5QIy6EvAH5FK/gv+Ib0hLYoEbEl7cLXh
         xjDg==
X-Forwarded-Encrypted: i=1; AJvYcCWy/IbXIi7ZiYoeFoCibHWMESkb/Rb197w/K2cXXtE0emQFcB3TgVygb7mzj6jkG3y7pEHZ3dQcppdjHn10ff8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9k9QRAoUraeUmE2fbbEnW0r91NXCTEzHW/WLOH7YKqjIFuhYw
	y0uANIgcJGi+4YfMxnuHlJaEzFIDcTs/Dthx/DxYrJmbuCHLTx+Nbq/KJ+kzsp0=
X-Gm-Gg: ASbGnctGeFqNrM98syE2uh8XiVHsRR7DAC8Y4pKeJBc3WVAlotDM3tav7DPsjkT9axK
	X13sGVI/H1m3KlNDw7VjFTQ7+3PrtaayLGnn8jZG8B3P01TiEf3ewGSuG3XexpHca6IobKlvETn
	9ZxXwmDhUYwUEgnsDRF5uZvUXXB82Gz0OuXV7Fkzy8lF7QIVTirCojUdjY1BScZg8VhsYcF34ho
	el1O2Po1Do7pU89auRJWwrxg5T4JwSWHQIshJKDBDucauj1OcuFDpBMvqORgcJwLKgh2bg2U7IE
	+Q==
X-Google-Smtp-Source: AGHT+IEJUmsSIld/ACGqbgQQoq8POA12hEoDXxsjPg3XLaDfZFr4I7p6+h8L6N5YBGEnzScLdOUPyQ==
X-Received: by 2002:ac2:59c8:0:b0:53e:3a22:7a2e with SMTP id 2adb3069b0e04-5439c285a6emr3566649e87.47.1737364609814;
        Mon, 20 Jan 2025 01:16:49 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af729ccsm1223639e87.188.2025.01.20.01.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:16:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 Jan 2025 11:16:44 +0200
Subject: [PATCH v2 2/3] usb: typec: ucsi: ccg: move command quirks to
 ucsi_ccg_sync_control()
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-ucsi-merge-commands-v2-2-462a1ec22ecc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3833;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=heR3VU+nxs99VRFMxd5VRCD07Xmz+D63MnVIf+KUZ+4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnjhR76xiiWH5fNtdZA0XzJwToX4fsdFJYF8F7X
 4xO2HRE8MyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ44UewAKCRCLPIo+Aiko
 1XXrB/96vBeczO4rBNcGXmEhdffkOgqz6VqVfGEmMO64kXzA0L5RJsDGQSNxfrSjfSZ+p65j8vN
 ynvaFEuZErkvBOJDOoFWcaY560YBpsBY1/ykmJP+b+u7mERJ1gNx2L4D2oUNNLMr8MqzOMBXxxn
 t+H1tdbEHGZl6Hm/88SZyCdEXfuB9eslwqntDat35+AofdfysuMtbyUv3k8K92weiZsP9CLQMfk
 T+i3cZPYKHRxdVwGvRCQlE4v04ikX1CEIpUM7LIv0YGHtEG0a8cyF1uNfvQRc5v8gx4b0RmBkWD
 pnux3+veyByAox7Ty0fKwYC4wmDF/tGU5kwIx+13VYM1K5p5
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

It is easier to keep all command-specific quirks in a single place. Move
them to ucsi_ccg_sync_control() as the code now allows us to return
modified messages data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 62 ++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 33 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 02ac04a52239327475a3590734b77f3ac74bb589..47498ee6cca89a9cc3fee872703b8d27487ea7ae 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -222,7 +222,6 @@ struct ucsi_ccg {
 	u16 fw_build;
 	struct work_struct pm_work;
 
-	u64 last_cmd_sent;
 	bool has_multiple_dp;
 	struct ucsi_ccg_altmode orig[UCSI_MAX_ALTMODES];
 	struct ucsi_ccg_altmode updated[UCSI_MAX_ALTMODES];
@@ -538,9 +537,10 @@ static void ucsi_ccg_update_set_new_cam_cmd(struct ucsi_ccg *uc,
  * first and then vdo=0x3
  */
 static void ucsi_ccg_nvidia_altmode(struct ucsi_ccg *uc,
-				    struct ucsi_altmode *alt)
+				    struct ucsi_altmode *alt,
+				    u64 command)
 {
-	switch (UCSI_ALTMODE_OFFSET(uc->last_cmd_sent)) {
+	switch (UCSI_ALTMODE_OFFSET(command)) {
 	case NVIDIA_FTB_DP_OFFSET:
 		if (alt[0].mid == USB_TYPEC_NVIDIA_VLINK_DBG_VDO)
 			alt[0].mid = USB_TYPEC_NVIDIA_VLINK_DP_VDO |
@@ -578,37 +578,11 @@ static int ucsi_ccg_read_cci(struct ucsi *ucsi, u32 *cci)
 static int ucsi_ccg_read_message_in(struct ucsi *ucsi, void *val, size_t val_len)
 {
 	struct ucsi_ccg *uc = ucsi_get_drvdata(ucsi);
-	struct ucsi_capability *cap;
-	struct ucsi_altmode *alt;
 
 	spin_lock(&uc->op_lock);
 	memcpy(val, uc->op_data.message_in, val_len);
 	spin_unlock(&uc->op_lock);
 
-	switch (UCSI_COMMAND(uc->last_cmd_sent)) {
-	case UCSI_GET_CURRENT_CAM:
-		if (uc->has_multiple_dp)
-			ucsi_ccg_update_get_current_cam_cmd(uc, (u8 *)val);
-		break;
-	case UCSI_GET_ALTERNATE_MODES:
-		if (UCSI_ALTMODE_RECIPIENT(uc->last_cmd_sent) ==
-		    UCSI_RECIPIENT_SOP) {
-			alt = val;
-			if (alt[0].svid == USB_TYPEC_NVIDIA_VLINK_SID)
-				ucsi_ccg_nvidia_altmode(uc, alt);
-		}
-		break;
-	case UCSI_GET_CAPABILITY:
-		if (uc->fw_build == CCG_FW_BUILD_NVIDIA_TEGRA) {
-			cap = val;
-			cap->features &= ~UCSI_CAP_ALT_MODE_DETAILS;
-		}
-		break;
-	default:
-		break;
-	}
-	uc->last_cmd_sent = 0;
-
 	return 0;
 }
 
@@ -639,11 +613,9 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
 	mutex_lock(&uc->lock);
 	pm_runtime_get_sync(uc->dev);
 
-	uc->last_cmd_sent = command;
-
-	if (UCSI_COMMAND(uc->last_cmd_sent) == UCSI_SET_NEW_CAM &&
+	if (UCSI_COMMAND(command) == UCSI_SET_NEW_CAM &&
 	    uc->has_multiple_dp) {
-		con_index = (uc->last_cmd_sent >> 16) &
+		con_index = (command >> 16) &
 			UCSI_CMD_CONNECTOR_MASK;
 		if (con_index == 0) {
 			ret = -EINVAL;
@@ -655,6 +627,30 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
 
 	ret = ucsi_sync_control_common(ucsi, command, cci, data, size);
 
+	switch (UCSI_COMMAND(command)) {
+	case UCSI_GET_CURRENT_CAM:
+		if (uc->has_multiple_dp)
+			ucsi_ccg_update_get_current_cam_cmd(uc, (u8 *)data);
+		break;
+	case UCSI_GET_ALTERNATE_MODES:
+		if (UCSI_ALTMODE_RECIPIENT(command) == UCSI_RECIPIENT_SOP) {
+			struct ucsi_altmode *alt = data;
+
+			if (alt[0].svid == USB_TYPEC_NVIDIA_VLINK_SID)
+				ucsi_ccg_nvidia_altmode(uc, alt, command);
+		}
+		break;
+	case UCSI_GET_CAPABILITY:
+		if (uc->fw_build == CCG_FW_BUILD_NVIDIA_TEGRA) {
+			struct ucsi_capability *cap = data;
+
+			cap->features &= ~UCSI_CAP_ALT_MODE_DETAILS;
+		}
+		break;
+	default:
+		break;
+	}
+
 err_put:
 	pm_runtime_put_sync(uc->dev);
 	mutex_unlock(&uc->lock);

-- 
2.39.5

