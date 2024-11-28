Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F9A1C1F04
	for <chrome-platform@lists.linux.dev>; Thu, 28 Nov 2024 23:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732836045; cv=none; b=SPvkJ1BraEOVguMai5+bXFpM1U5kR9P6FvYyuGl0gnJR+crm8q6sJ34I1pzXTzRwsqF7vppUoCaElKFyhWafj6OLoueNyoZ7reEgsySYFESXEJq7+SOiTqj+Thl6vlNMWEPVgtLKbTefC7x80WtvUQBv8kFn/EavwS0Ag7qX+cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732836045; c=relaxed/simple;
	bh=l6xy+IFEiECfEGnprsekfHBbUSUvzcyN3jyJsZdVimU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PLXm6kEWdbT/bARAR4h3VLaigHorMUhmxNXnBVA+7zN/z1iJI5EWUKzPPLJfiJ0Z2g816QviSiWmnoefUmmvUHrZi0W6MSbulmXfapTuDegVFucmbnBpfrJ9pbRPTKfIq1Z5gPY/0A6UCfC6zDi8tIzOKQCWi7Ih5AS4ifSk8TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e5SgUm8S; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e5SgUm8S"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa549f2fa32so179410766b.0
        for <chrome-platform@lists.linux.dev>; Thu, 28 Nov 2024 15:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732836042; x=1733440842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cw85X3F42ul1Ipw+2TID221KCP/qXBuXOFD4iWUJphc=;
        b=e5SgUm8S0jPkJvnxtp5CF+X2qrGT/kslY9b8/5QE9Cq99V/zKQI2GISwbEzsjxDPEg
         KgmXtL9n6rWrC2ezyPWbcjQo6fu7eOtrGJkydwqWjo5xDfJCnivHteiphAwjMaf0Lh6U
         MoZ59NMlKrGxdZbbp70B8bqpSEhXDFhq5RIPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732836042; x=1733440842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cw85X3F42ul1Ipw+2TID221KCP/qXBuXOFD4iWUJphc=;
        b=HGiRpitoDeBKDei8k71XMChVIyc4b/8+wMWwHkoT+GoZ7lQYb1M8FDB8ItkJ/xmhIe
         XW6QJ1CRR531EBirYE1J/k6MeydoIzTwoHM+lDeHCKSkjlcVeXMbLEaabcoN8pqHnvJr
         ixt2DlblO6doyoHfYJV2WRZajm/fKtH132YttKba3QicJbjFXlkojYUKA5zy75ADwsDI
         FM70NTYnTzqaOnfFkktOp8d+iOeu/9j0su01oK3OrE05UK8PJ2e8IGLJklBGgjOzygNE
         z1LOoANu9qwiU0TjBuvTpNOjnx4XZi8BdrhKRvt4YuHJWbY5ryLcrUwPQiNEZwd3ZpTR
         lx6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXD/Av7FiWpiyiZmB5yjj4CT76yktedcWV840PKDXMDQNdn/bifWbgqhZp0mp1NswzKqxN7B9WQ/Vr/lENguko=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7x/vly88GhYzocVoblx3THBLd5uI9+2Z2UqqB7ZMm/nbJXMhY
	bp6SpITTmvbjOGKOCD1/aKlHKK9py8q05Dgf/VMrbYpAzY2whJDSgeVeT2s5
X-Gm-Gg: ASbGnctyIfidRD5473bpKHhbO+Ws9Z6fw0Zv+HPwjBv8XY6/neDObbOu7StZPQP6oCI
	PYTs35krAveAmFZQTPKxAhBGRS7xZ/nUz5YhATnb3wyQZDKOnin5m9pCf23Uk/t04tWYulrEuCk
	4XmtrVrefZ4fMbS4ftb8Rl3I3dp6mixF9Upm8tSAbYfjFSuEquoM0UPBBzgVKvgbqjMc2q31FBi
	0BTdSCo2qdx49KI33mjcREiKQZDEZBg4Gf7JZ/GCKYZMs6u2jKJQo0GWGOWvAvAatV0OsXDPtyb
	6Ug+1XwdF83Yzwf+oxG+syekbw/lhHc8S1A=
X-Google-Smtp-Source: AGHT+IEbHS/TqgWel+q60F4olytexp9iKriY/SlJd0qzu2fK4Syg4e8bETrJEGhXpG+0ib3ZgzKhtA==
X-Received: by 2002:a17:906:c10c:b0:aa5:2817:cd34 with SMTP id a640c23a62f3a-aa581090e26mr697371966b.57.1732836042582;
        Thu, 28 Nov 2024 15:20:42 -0800 (PST)
Received: from ukaszb-ng.c.googlers.com.com (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5997d5672sm110757566b.77.2024.11.28.15.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 15:20:41 -0800 (PST)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v8 1/3] platform/chrome: Update ChromeOS EC header for UCSI
Date: Thu, 28 Nov 2024 23:20:33 +0000
Message-ID: <20241128232035.1525978-2-ukaszb@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241128232035.1525978-1-ukaszb@chromium.org>
References: <20241128232035.1525978-1-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pavan Holla <pholla@chromium.org>

Add EC host commands for reading and writing UCSI structures
in the EC. The corresponding kernel driver is cros-ec-ucsi.

Also update PD events supported by the EC.

Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Pavan Holla <pholla@chromium.org>
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 .../linux/platform_data/cros_ec_commands.h    | 28 ++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index e574b790be6f..8dbb6a769e4f 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -5012,8 +5012,11 @@ struct ec_response_pd_status {
 #define PD_EVENT_POWER_CHANGE      BIT(1)
 #define PD_EVENT_IDENTITY_RECEIVED BIT(2)
 #define PD_EVENT_DATA_SWAP         BIT(3)
+#define PD_EVENT_TYPEC             BIT(4)
+#define PD_EVENT_PPM               BIT(5)
+
 struct ec_response_host_event_status {
-	uint32_t status;      /* PD MCU host event status */
+	uint32_t status; /* PD MCU host event status */
 } __ec_align4;
 
 /* Set USB type-C port role and muxes */
@@ -6073,6 +6076,29 @@ struct ec_response_typec_vdm_response {
 
 #undef VDO_MAX_SIZE
 
+/*
+ * UCSI OPM-PPM commands
+ *
+ * These commands are used for communication between OPM and PPM.
+ * Only UCSI3.0 is tested.
+ */
+
+#define EC_CMD_UCSI_PPM_SET 0x0140
+
+/* The data size is stored in the host command protocol header. */
+struct ec_params_ucsi_ppm_set {
+	uint16_t offset;
+	uint8_t data[];
+} __ec_align2;
+
+#define EC_CMD_UCSI_PPM_GET 0x0141
+
+/* For 'GET' sub-commands, data will be returned as a raw payload. */
+struct ec_params_ucsi_ppm_get {
+	uint16_t offset;
+	uint8_t size;
+} __ec_align2;
+
 /*****************************************************************************/
 /* The command range 0x200-0x2FF is reserved for Rotor. */
 
-- 
2.47.0.338.g60cca15819-goog

