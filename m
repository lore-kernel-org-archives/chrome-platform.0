Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F931D5154
	for <chrome-platform@lists.linux.dev>; Fri, 15 Nov 2024 15:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731685964; cv=none; b=Igkhm/8I0Abn6J2d/PeNnkzI/l724v4CR792F3O3oUSIKFnVMLV38o3mhP6bcnZryJA8wDXK6a8VXlEQFKSquCGoHVFbptxKb9fEZ0iLrjyvF1zD+jjvHMJ8U2l32PFqb1CL5UhOJMNfRtHWY04s76ZxQRHB1/Fo8YkdSmktHnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731685964; c=relaxed/simple;
	bh=l6xy+IFEiECfEGnprsekfHBbUSUvzcyN3jyJsZdVimU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gkwEUK4c+/CixP0ybtoj2tyeoNPbfMIOL87n8JMV0qdtdBPF8ebYKw5kLcHZw5cYOSAB1Wcy2C3pBNKJuAkvj7ZAGInFjNyqgC0mCKSS4B4PSJL9RNsM3KeIj+Lf8BSVDqRK5Kz7Eqq5c1E30WkgwcCxMXra63A+4vukAJUu8Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BZw4jIxM; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BZw4jIxM"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c95a962c2bso1396919a12.2
        for <chrome-platform@lists.linux.dev>; Fri, 15 Nov 2024 07:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731685961; x=1732290761; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cw85X3F42ul1Ipw+2TID221KCP/qXBuXOFD4iWUJphc=;
        b=BZw4jIxMDffABzoXjRUgBt0IxjuEHzLW/R/OlCH04U04CCG88XUCeLsqWVVydo76x/
         j1SAJvZ+6ngZVEUzJUw4TEuRT8cMCqj03NRwyqvoT8HIs4jcDtmag3CjBIisEUtbhDjJ
         /Tu+ftzEWtwMO4+XEhI+Xo5axAt9XsAgPGGKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731685961; x=1732290761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cw85X3F42ul1Ipw+2TID221KCP/qXBuXOFD4iWUJphc=;
        b=Zq62kipgoYhdJSg5OQofV8qWMOH1kiS6MvwSd3MVhrr6Ev4XPbspOjNLr/btTgu8ZG
         2EItn29Nrs0XAlyi+COq6qr1mZ/BG2EordTX8gCfNYwOUx79fzkrGeuBDJfrwuEUhbYs
         2YMf0688yFQpnq32Njv08ZbJrR3Prf1ovpems5o8P3KQ9O0TsZdvKE5IkCqpbUtwSj33
         rIdmVcgS52ouRudmKf7bek0ce8oVFSO+uMfXXQ646Nj03pHxwyTPR3AvSHYcUwufOK7Z
         49K+VFBNkAnXJmNEKFbNfsM7jaSkXXTpaG8slBs/6cUkmvMVZLDugEzrfBNzKjo4eX55
         5W+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9Wcogrm+WKiITCeRZ94fxghRwGyIIaHJuA5RAw1pfLWOFyRchmmIicasvD8rYUYwIf9zGOYHkSbGgSQCRVEQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWUr47mASziS3cvsdDfQN+2QOZQ2alH4uYZhNJU2ihmYONqKJI
	K7LCG46x45m6TeL9GN/04g5jHsxDp0kjWZFmxtxlh/4Pa4wG2nPjp3Uim93z
X-Google-Smtp-Source: AGHT+IGRjbVOsm42oCKFTm1W70lgoQkyBdu2JYgahcAw2aegTSvvju6pnXdwOKn1Rmv35xtTe4B2qg==
X-Received: by 2002:a17:907:25c2:b0:aa1:e695:f84 with SMTP id a640c23a62f3a-aa483479236mr311724666b.36.1731685960657;
        Fri, 15 Nov 2024 07:52:40 -0800 (PST)
Received: from ukaszb-ng.c.googlers.com.com (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e086244sm187758166b.177.2024.11.15.07.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 07:52:40 -0800 (PST)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v7 1/3] platform/chrome: Update ChromeOS EC header for UCSI
Date: Fri, 15 Nov 2024 15:52:32 +0000
Message-ID: <20241115155234.1587589-2-ukaszb@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241115155234.1587589-1-ukaszb@chromium.org>
References: <20241115155234.1587589-1-ukaszb@chromium.org>
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

