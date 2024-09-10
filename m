Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45CE18CBE2
	for <chrome-platform@lists.linux.dev>; Tue, 10 Sep 2024 10:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725963339; cv=none; b=o2Z31drtUMLJN0wTidTgZ64OdlgmZYtqunpBr22rxAiVOa4WjM3i7/7Exm1MHyVrL5UrjPF4jTI0NtQoczWZt2v9xQ7iq6o7VSpt9H+tF5N3mkXbd2UNJ8/pipuQi/5y47jyyLOcRhSVQ29jlaETepwGQQ7S5NgHzXp8pBmP0l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725963339; c=relaxed/simple;
	bh=P845PChozNDR5SGQbooLDKSy6BNU+jWzs4r3D6gy+s0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FnjvF7G+Art7x71e0Z4KkJVedxQF0F8zqpEP/LXpgLM+U+TK04VXRQPsMOKxlK2l9oONqp4HsvtdnCbeaNiu4iHSvrXn3mW5VPxcGZOdKBEcZTJE2L53N0Xg2HXsO0sN6TBr5IKsrSuvGo5djIEixGbvMVL+PjTzIDYJnZbZgcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gTI4xytq; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gTI4xytq"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5becd359800so5007881a12.0
        for <chrome-platform@lists.linux.dev>; Tue, 10 Sep 2024 03:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725963336; x=1726568136; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14fOqglI4gqlZHINscrTLoCf9Zlvu7dl6ljaBQHSUuQ=;
        b=gTI4xytqTT29ZBAQdYp/Wgdq+sEc1uxh+Wk1cXQQFxLNodi06cfmNK6AC4hC91dzzo
         mHax4YORAGeRIwDtNcSYEscnLcUyrH3TC4GZ41kSg6COhuWSbYqNzDyspXO8fIHBhEXS
         5OmZtzn7zW0Mkw9Ll7bII3+WqzSF4gVNB55wA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725963336; x=1726568136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14fOqglI4gqlZHINscrTLoCf9Zlvu7dl6ljaBQHSUuQ=;
        b=sie4n4lwD38ogSEBFM+dHFzD/8E9BpEQW7fGBIl7cNQvkLexI5W7NQ4T+WiN6f882K
         d8zXv24QN3bXqZJATNWGaTHGdSNECeOU8UgK57o+P2jMit8d1BfsZu9N/wcUQY67vdQt
         lCAuruiFrwX9ZtGKptPsC9VviGf/HwXer/+9SLClqd/ZBdp0jNU1TOK8ghQAWwtc62C3
         qkW0TblPqcX+I2fjMgZ+ft65HqSOOktzWMSEPcP0jKNzz1lCx3RYOoOyB1tB4424p9Op
         TLcybfZrTXeNHna1j19iFXTNOHMK6WIkUNGzSJ+qhyPZzJXEzCQjUGq4oVpXnXqRjhJm
         YJYw==
X-Forwarded-Encrypted: i=1; AJvYcCV5LEJzV9Qd4xk5jHHrC6JUyHfnNE4ZMsG9+y4K6IqZCKIK+ghODBwVLPey4rfZUW/u573wVa/ow/bkKr7no8k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3wth8hgZVWY6gZISvtWY3Puv99ZgiHpN/jhnqa9qhU4z/GTZv
	85euHCrLBBL7rS1oTglFSanQUt0M+buqc8jHXte/oQOa4Mti9EXPA0PUoeCK
X-Google-Smtp-Source: AGHT+IHf3x52xmPmWW27g7tPZAnY8Wi/THOklHIPEmyuKAyafMoyrrGYgmExnYJC5b9NF8LHKNzaSg==
X-Received: by 2002:a05:6402:34c8:b0:5be:fadc:e13c with SMTP id 4fb4d7f45d1cf-5c3dc77ff52mr9531818a12.4.1725963336069;
        Tue, 10 Sep 2024 03:15:36 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd424f0sm4075401a12.7.2024.09.10.03.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 03:15:35 -0700 (PDT)
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
Subject: [PATCH v6 1/8] platform/chrome: Update ChromeOS EC header for UCSI
Date: Tue, 10 Sep 2024 10:15:20 +0000
Message-ID: <20240910101527.603452-2-ukaszb@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240910101527.603452-1-ukaszb@chromium.org>
References: <20240910101527.603452-1-ukaszb@chromium.org>
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
2.46.0.598.g6f2099f65c-goog

