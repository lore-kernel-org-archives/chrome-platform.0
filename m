Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5995D38FF1F
	for <chrome-platform@lists.linux.dev>; Tue, 13 Jan 2026 13:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768309568; cv=none; b=L7vx8kNNqUOjlnXMF65CQKpKipCSezFcIdEDoe/UKffvZhN3292XIbCBSaoMSdeO47hSMHrwKxZBWfdqzo0wlhELdlvHHocf5dLAkuPHJQcDdVKOlqYSXrCRLqQb6m5sBAzusRgoVB/RNALmSs4KLaHlHU/YEugdkY8dknRQ+Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768309568; c=relaxed/simple;
	bh=xDKAaqJEsHbZnL+cmpHT9aD/t1xQZpYd2AXwHmw7ASc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S0SHwV+23FvDFzyj4Jjt3bBRS8tDkT0TDA0wIetOFkz75W/fz8Lo1+CyUFsN/cLLQTrh9ZwAVViGbRyBGn8NXfxWVB7vbeA+wpSWBlHzAMpiUgdzNKeCzbHy/kRTEvTYGndTfgow1t61t7kefGiMMQEbdJUjaVnw8juQ6KtEiX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=odRioOLC; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="odRioOLC"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b86ed375d37so411861666b.3
        for <chrome-platform@lists.linux.dev>; Tue, 13 Jan 2026 05:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768309560; x=1768914360; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozHGUyiY6A9TybEdpmpfYkpaTQz6PtmOWnadeDhNFJQ=;
        b=odRioOLC0DTWV42Hsjt7ATY9ZcDiNua1zDByr7KGP6pjgxeKxGHIiH5AlbD27HX6RB
         mNbV7uSxgM7DwtGshRwLyCM0ZnX1QdUoOZsY6QQ71CQyuZKDKXGuhWD2BIO/9gvvHXY5
         Ozhb2d71/RHPvnVa0k91yK37NAHHQ1orxPeJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768309560; x=1768914360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ozHGUyiY6A9TybEdpmpfYkpaTQz6PtmOWnadeDhNFJQ=;
        b=leuGaGh/wesUUu4VPnXDanjsHbtNlzIKSwrI2UAk0thFlnKNxK6C+y0DnyCQwzq+v+
         gEciLThaZPxS8KJ6WWHeiVg/voqgCiBpi3fmhoplahqDrt119QXdCsNqc4wYFGlyWx6W
         mOZY1s1xBrtQGHZvxhgtDcp91x3j98/wWh1kAfVzYrz4EfCleTM2m2NqNoqJPFmUP0Vw
         2HhSq3o7YtCFG+v7Blp6rh8mIpjEDqNPnB53mbemgTfdMP4CShEGvh5BB3NzIW/0CYYK
         f9GfXmT0L1grP2XmJ4f4vlHcoHvh7qit+J1/QBbK/y5H361zvA7okE9ukW/9dGs+3r/X
         FGng==
X-Forwarded-Encrypted: i=1; AJvYcCVgldpKC6sA/PyQybgl2qi2d5IB2awRMPKlmI978+dQ11y05eBg4sNV+YPMTTZANwYQwLMwBDHp+NgnuOWSLCM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzAjLpQaGVnyz+MYpsYILAxP7VJpqtHspgJSTBvfnFGHjEWbuRG
	J4tw+6W7dPPGW2srtzeX1EdcCytlm9vmYMWyNi+cZ1lSIYk2FzeKDvuLh/r34DVMQw==
X-Gm-Gg: AY/fxX7BnEmm/e53C1aLtBLfk+0a0lGcnBkUYrGA5Xieix5xIQe6NsHdR6fUYX0neVe
	5Aw4h0KzO9RGnvR4f6uH9ZEJJT4fOn2ay9q91KGKMRMTVNQ+Vl1RC7jDHt4lX56VMr8zEi8amdE
	VKYyy8LbfnE+rn3YGJJ2FxZRkL9IssJenRXxgmIq451a2+G9R4sD4AV+XeBN8/0ceY2eFemICGA
	5fRATCZ3dmm09gmlY5YXthWpptwnp+fvJZHVFN9Zr4uLCHNR+dt04ov/SqffTA4n9zzHlam03iI
	e1/aZsHnmOwQKEDlmcaG6X/Q3vvDzrjeviqi/PE2BrYmSa34IJ2ExX1/csp9lqrx73ES43aPyA+
	ZD1K3GvPNiIrpAJTrM2/Dz5VLfte3OR2Jvd+WXFc8xbS3twepgwTwSRwPm55fkJDi2u/CeM2QbN
	uYYhQC4T/68BDUKidGHsSfo4+K1lDge+GHXIkV+3R2nI/OfMmv5KxQBoosHVQbEo56AvGgTy5GZ
	K11dBsy
X-Google-Smtp-Source: AGHT+IERLF4PHZwh7YhwuDFtdlx0ez3BDip2EOvxGlTqLDh5wkJQ8ZMkQJAb5HRrvhsdbkq8VQofMw==
X-Received: by 2002:a17:907:780b:b0:b87:1fe8:9534 with SMTP id a640c23a62f3a-b871fe8af72mr384125466b.48.1768309560490;
        Tue, 13 Jan 2026 05:06:00 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b871b5e60dasm586217266b.63.2026.01.13.05.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 05:05:59 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 8/8] usb: typec: ucsi: Enforce mode selection for cros_ec_ucsi
Date: Tue, 13 Jan 2026 13:05:36 +0000
Message-ID: <20260113130536.3068311-9-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260113130536.3068311-1-akuchynski@chromium.org>
References: <20260113130536.3068311-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mode selection sequence is initiated by the driver after all partner
alternate modes have been successfully registered.
When a partner is disconnected, the driver also stops the mode selection
process and releases resources via `typec_mode_selection_delete`.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index eed2a7d0ebc63..437a2982a9d51 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/wait.h>
+#include <linux/usb/typec_altmode.h>
 
 #include "ucsi.h"
 
@@ -33,6 +34,11 @@
 /* Number of times to attempt recovery from a write timeout before giving up. */
 #define WRITE_TMO_CTR_MAX	5
 
+/* Delay between mode entry/exit attempts, ms */
+static const unsigned int mode_selection_delay = 1000;
+/* Timeout for a mode entry attempt, ms */
+static const unsigned int mode_selection_timeout = 4000;
+
 struct cros_ucsi_data {
 	struct device *dev;
 	struct ucsi *ucsi;
@@ -134,6 +140,19 @@ static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd, u32 *cci,
 	return ret;
 }
 
+static void cros_ucsi_add_partner_altmodes(struct ucsi_connector *con)
+{
+	if (con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE)
+		typec_mode_selection_start(con->partner,
+				mode_selection_delay, mode_selection_timeout);
+}
+
+static void cros_ucsi_remove_partner_altmodes(struct ucsi_connector *con)
+{
+	if (con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE)
+		typec_mode_selection_delete(con->partner);
+}
+
 static const struct ucsi_operations cros_ucsi_ops = {
 	.read_version = cros_ucsi_read_version,
 	.read_cci = cros_ucsi_read_cci,
@@ -141,6 +160,8 @@ static const struct ucsi_operations cros_ucsi_ops = {
 	.read_message_in = cros_ucsi_read_message_in,
 	.async_control = cros_ucsi_async_control,
 	.sync_control = cros_ucsi_sync_control,
+	.add_partner_altmodes = cros_ucsi_add_partner_altmodes,
+	.remove_partner_altmodes = cros_ucsi_remove_partner_altmodes,
 };
 
 static void cros_ucsi_work(struct work_struct *work)
-- 
2.52.0.457.g6b5491de43-goog

