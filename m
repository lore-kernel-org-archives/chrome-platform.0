Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B9618800D
	for <chrome-platform@lists.linux.dev>; Tue,  3 Sep 2024 16:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725381041; cv=none; b=UE0bM6spczE5tLt46UOfQgyqxrUjaYJNdrN1QXk2P4cBZv2IMNjgatrae2jIXdVSkY7AOEhQdlFF2Ic0MgIMC3g8LGbZb7q/a90KkQY6yuErtyumcED7l5q+sWEvE496KgV3rPCxJlaXjWNHbxr9w5MO5/H3IN71cA/dly3hg18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725381041; c=relaxed/simple;
	bh=YoYRUae+dYQ0d52pIU8556BecxqaS32GRkSA+SJ61gE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TBPOa+1SN/Xb70GMxAnzUwrYlWYfdG6g/ZgsJ3BbjBePLwlo/LjfbGyKAXVf+/+Y0W3Pb/C9MYSDwMMKd5qq0A2axhDwbP75TPyQuCZVPzXHJLJr3DM3p01VXBiONdpURcKMUJSC1bYubRm/qOxseNmLcVevaW4vhJJpRN1Ejww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IekEjzv8; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IekEjzv8"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a869332c2c2so1041177666b.0
        for <chrome-platform@lists.linux.dev>; Tue, 03 Sep 2024 09:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725381038; x=1725985838; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+TIEYy+uyd2jXHZkwyaKTeT93BGHARFcg0AcutZlTKg=;
        b=IekEjzv8ERpaeY9NcPZHcASy9szW+tPQJLPJgUgOuccUCyQgFkPoKk7ZOpBpufX3im
         GSTNCJxutN81hX6ptksjTNzUCMElKrtzRsWZPZRz98Few0P1le3+m96jGj2qs2SrOg+T
         fIDKP0j9OH6UpaL6SpPbanJsbM0sPZ6ZoXh5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725381038; x=1725985838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+TIEYy+uyd2jXHZkwyaKTeT93BGHARFcg0AcutZlTKg=;
        b=L22KE7nFMqA8uVHZz0Y0JHGSu8WFUKTfgrEGAGVNYic5sHIWkG3YUStmJqi9Xui8lS
         BKIhpSq4Yyww8ZqvW0GGc5Se8Y6Z5QF9OMQB31tMFgsJG7VfJP5WtQIWvI6iKODMowU4
         8feVpbgLHcHl73iFC5rksrajYt4heQGP0zxL2XByuBiEb4hjqwD0DX8MYqtLgNWNjRk8
         03gU7I9K4Ks9quw0gNH0QLRTTnI8/PUnYbPf4/NVGl3VpHbuTnsdYF/l5dbz+Xr69MBg
         Iw0wz4UPZxUf1m1hGQ6gErbw8zV0nQSz8xMl7jDRHJtOFLEnqpXuzJukQE7Z5ZJfad1z
         MJyg==
X-Forwarded-Encrypted: i=1; AJvYcCU5/WN4uYUTYtZwNS/A5n2Hb/b4g0Gn3fSl9LG4B//GrV9h/QFAURWZ8j3Wgj+vUlbSC1ZPWXTgpggTP2GE2J4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVmyidmJ+SdkTVAXlfYb+howFmKtMvVXg84zkVwoa75K1yit24
	ZAPRh6FR9JzqFa2zwpqamgLT4CHmHCbbNifUMr1UUHNGg0t8Nnd1uKP17vNr
X-Google-Smtp-Source: AGHT+IEKzUEnyVSCRCC18/H9KWxWbNBNtHfr6WvIUVO7/ZCeHwJZ9cd+GxR/nFZmj5QvFglMz/D6zw==
X-Received: by 2002:a17:907:e292:b0:a6e:f869:d718 with SMTP id a640c23a62f3a-a89a2927ae1mr1377312166b.21.1725381037341;
        Tue, 03 Sep 2024 09:30:37 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989196bc4sm700685866b.125.2024.09.03.09.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 09:30:36 -0700 (PDT)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v5 1/8] platform/chrome: Update ChromeOS EC header for UCSI
Date: Tue,  3 Sep 2024 16:30:26 +0000
Message-ID: <20240903163033.3170815-2-ukaszb@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240903163033.3170815-1-ukaszb@chromium.org>
References: <20240903163033.3170815-1-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pavan Holla <pholla@chromium.org>

Add EC host commands for reading and writing UCSI structures
in the EC. The corresponding kernel driver is cros-ec-ucsi.

Also update PD events supported by the EC.

Signed-off-by: Pavan Holla <pholla@chromium.org>
---
 .../linux/platform_data/cros_ec_commands.h    | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index e574b790be6f..08b6c98ed890 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -5012,8 +5012,10 @@ struct ec_response_pd_status {
 #define PD_EVENT_POWER_CHANGE      BIT(1)
 #define PD_EVENT_IDENTITY_RECEIVED BIT(2)
 #define PD_EVENT_DATA_SWAP         BIT(3)
+#define PD_EVENT_TYPEC             BIT(4)
+#define PD_EVENT_PPM               BIT(5)
 struct ec_response_host_event_status {
-	uint32_t status;      /* PD MCU host event status */
+	u32 status;      /* PD MCU host event status */
 } __ec_align4;
 
 /* Set USB type-C port role and muxes */
@@ -6073,6 +6075,24 @@ struct ec_response_typec_vdm_response {
 
 #undef VDO_MAX_SIZE
 
+/*
+ * Read/write interface for UCSI OPM <-> PPM communication.
+ */
+#define EC_CMD_UCSI_PPM_SET 0x0140
+
+/* The data size is stored in the host command protocol header. */
+struct ec_params_ucsi_ppm_set {
+	u16 offset;
+	u8 data[];
+} __ec_align2;
+
+#define EC_CMD_UCSI_PPM_GET 0x0141
+
+struct ec_params_ucsi_ppm_get {
+	u16 offset;
+	u8 size;
+} __ec_align2;
+
 /*****************************************************************************/
 /* The command range 0x200-0x2FF is reserved for Rotor. */
 
-- 
2.46.0.469.g59c65b2a67-goog

