Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324F170806
	for <chrome-platform@lists.linux.dev>; Tue, 10 Dec 2024 14:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733841944; cv=none; b=FnABmeKKmgjUfzz98qYsMPfRL4wHrfWzW/XdHpy80IdZFx2p5LD27An5mkBIEYSlgC5RM481ORrhDr3TwiYnoYEDJoMe9CEGU3i1fyKntNeVZIas8aWVKGN39VZ+GskG1+T4+rKOK9VhE1YJLa8IqzCkpkXGxofhyvwKthYgRGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733841944; c=relaxed/simple;
	bh=FsVPWUYW3r8+vYPca7TkDYiQezN0cxbYZZeUC077jgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bDhc6ktSrvmt5H/pqunsVf5h/aQ68NCKO50wbNZYCaMeAb1tN43kBIrgDWCbdBz5PZWFtiCxDjwHti1XKN3SBTtkygC8vrXOHABcx1PIMUDFqeSxj7hAS90vuyWVqDPRvHeAskzxXTAiXu1mn1c1F3/bO/AIKdvXS5gsvUGg3s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NM0TW/in; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NM0TW/in"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d3f249f3b2so3418674a12.3
        for <chrome-platform@lists.linux.dev>; Tue, 10 Dec 2024 06:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733841939; x=1734446739; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VBmObv79eNi+4KOGkigLjUPpqUoMrzCTZAwaSnc+fc=;
        b=NM0TW/inG8nucdp591h3DmzdKWjXa0LMx+gMp0QXq3WQt2igo/y3MAB+Q7siERwCam
         UGDdr2oyGe0OdF1sHTdZCqSSgV3zeQQ3h4IhBNvAAQtArZo8mXH2lIeBAnRKSqg7XA/s
         soTCnT7JCv5TbvZXTWUo/33c8b22ammnoOI2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733841939; x=1734446739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/VBmObv79eNi+4KOGkigLjUPpqUoMrzCTZAwaSnc+fc=;
        b=kE/XnDYoS9KMfhkkLo1vgQL/eoXqx9DSYYkRSvquPejaFGUTKFCs6LgwJ5sxND9YH0
         LQQdiQSID8iLNm5dkFa4Xf1nQY8L5rA9hcHIiKpeN3670vJ1gRt7KoyjaEbz1j6HgTSS
         gkiaaEFEqpGNv4eCBX4cc2zh7wE1AseSgzz82Rq+vCUgNl+EWlFGUrO4boeTAlNZe35a
         gWvDwRwl1EMElEnFERH9MxwWe2J71hB+ZjD4/ELJKQsclJsxtDWHej9P+NZ8ul1fE7rE
         UD7To9TXiHpByRNc5E2MjDx7zJdsR8bqwwcCcjeI5ccyBYx51m/ickuhFAxPIMP0a92/
         X3jw==
X-Forwarded-Encrypted: i=1; AJvYcCUdg2JPSSv9iCXBKVw+NPV+CPasU2QvzNCA+KzCeH+7U5xQK1rGIG/Trc7p1WdvkBecd+bToBcRv0nM0754J6Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+VEg/sD3ztGlar2s/mjzvHOTcFk1VHSVIDZLa5NWUx+BgCN/S
	DGko4RwazLtnxf0nRBT6n8xfebVo1QdkDDC33WYQyjaKgCvz48Mpxtm9v3Tf
X-Gm-Gg: ASbGncvOog0RgRB+Zt34U8y83z9oFPOzcPon/OWie/J6byZ272XUQYYFZdyePpljvZN
	PaAUB1z7dFqicqnX3LzpvO8lU9buzf3YchGL+7z5HRfifoK82XwZmCD9MhkQpw4rxmnCSciAaZy
	ctkjjEF0mxjLtN5Ux8yWub4gS/LaBnWK30MgkpN+H1Zk4iyPNxbpt7RO6bwLYQpkuJhOOQpRJdX
	AhmA70rC22N14pls8zD1NHfSZ2VFtSqqLTumMMv4q+PfhoDOBLc66KiTYtbW2vp0nIO0zsCtXUI
	QH5b8BiNQKpNOXr3Nak3EYHBu81dinQWEYvgluw=
X-Google-Smtp-Source: AGHT+IGq2WVqY9FHE4Kw8mZJ334PewE8m0Sr0rxYDq1ur49OrklFDakgDoOr7S8rT9zpBAXeMwU8Vw==
X-Received: by 2002:a05:6402:5241:b0:5d0:81f5:a398 with SMTP id 4fb4d7f45d1cf-5d4184dd140mr11278224a12.1.1733841939141;
        Tue, 10 Dec 2024 06:45:39 -0800 (PST)
Received: from ukaszb-ng.c.googlers.com.com (208.220.32.34.bc.googleusercontent.com. [34.32.220.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa69dd81272sm168996966b.161.2024.12.10.06.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 06:45:38 -0800 (PST)
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
Subject: [PATCH v11 1/2] platform/chrome: Update ChromeOS EC header for UCSI
Date: Tue, 10 Dec 2024 14:45:26 +0000
Message-ID: <20241210144527.1657888-2-ukaszb@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241210144527.1657888-1-ukaszb@chromium.org>
References: <20241210144527.1657888-1-ukaszb@chromium.org>
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
index b3c4993e656e..ecf290a0c98f 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -5044,8 +5044,11 @@ struct ec_response_pd_status {
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
@@ -6105,6 +6108,29 @@ struct ec_response_typec_vdm_response {
 
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

