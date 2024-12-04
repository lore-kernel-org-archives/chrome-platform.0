Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308ED1A8F82
	for <chrome-platform@lists.linux.dev>; Wed,  4 Dec 2024 19:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733341755; cv=none; b=EdMPWrokN8BRqPsPW2uHn+ILZgjP+Z/5YyyJKl0oVyy2Xw3TgwzsQs9JNrlLrjI2g7VqQc5NevELgwmcwmDXTgkq9rGJdUz1r1scHnPd5jyveutCyZoZSeSO3uApMx84fwM3qoysdJ9OMBUXjU2kiNuFMdDrP8xJtvxFcTNugS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733341755; c=relaxed/simple;
	bh=FsVPWUYW3r8+vYPca7TkDYiQezN0cxbYZZeUC077jgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N8tgqqT0CeuU2LQPertVy69DWa1xKHq4loqS/d6vBwsl3uPkK/03tUkuxsMfzLNQea5oBm2sYDfoNSF2hgzmHHVzQ0yxlx5qPoG6oau64GecEx4N7KMOgrj9pQ8gosNmQ+MTIdbQcLD3ng3lPzU6FpbeP0z8xoPeeM7WnHDDgyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Go7++44j; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Go7++44j"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d1265ba5a8so54227a12.3
        for <chrome-platform@lists.linux.dev>; Wed, 04 Dec 2024 11:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733341750; x=1733946550; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VBmObv79eNi+4KOGkigLjUPpqUoMrzCTZAwaSnc+fc=;
        b=Go7++44jRF1kI3xv/6NOIazUR9Vh2ZFoZj0vwxftt8z+ZdVWCf/BxX3jIuY5xhXTfh
         QsNuQGR4XDpxJnapGw3f3uymcY10qenply2qp2PSxobyyZtdPeAZjGOEGIjPChiKiWHt
         1YI7QCrkJg90Fpjdg9B2xh1TQppmLo+JasfyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733341750; x=1733946550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/VBmObv79eNi+4KOGkigLjUPpqUoMrzCTZAwaSnc+fc=;
        b=lHchGUiY+U023+60c9xdtcp+W5dQNOtxz9y0MFQRREOrCEVvBmpAHaOCC0PRZLxsd5
         VhpBzWtFFudAdmuqwWy0olRuuXQdAuGnE4+6wQkgX9UA1jjbaMzcBK5FSkJ6CxwzvYzm
         r1DAsbnkHWB24kwC6vZivabLoaMu3E7VzWJjQbD/VU5hC9wtbdDV6l2rAlwl+YqgHb6E
         Qh7rzGLlIyxCnmRIeh3w6HyHz8QVGIsQZEWmVHx/nSHRZCzoaUqnJdANzMJqEZO8ai/F
         Oj8rmCw+SQs4gXZmqQzQSxXKRk9+XXP1WmqkVFnqqDyFY82FHSD9Css3SNMbVq3Rz3Gt
         LlPw==
X-Forwarded-Encrypted: i=1; AJvYcCVWt2RHNx+HC6vMqllaDKT7VIcc56bIKjYIWG8tWHC/JR8khx7CDF0YjdwqJDierzdfaiXFpjffKnj8I4deR3s=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGLL54ToYA3UHe4im5BYg1zcBqIY/v4ASUI4VbZbMnnHRWY3pS
	sssiY00nJli7xgU+NoaW2ISzRz5A/VwIaEqzcOrBEJYDnSvt5NYK4Rxm1Q3YI+7RSSKeOPsUy8J
	R
X-Gm-Gg: ASbGncvV5OxkzOk7rjA8Kwwjy+jmOslTXwv0tBK0c2igE7TH34S7aQY07nK8H2y30/H
	KFM7NmjxSImtLgl6qTOL7EdlXEI1J14UiqsrcnVoDRn6vtrUXcRQGQXf08i83wrmDnnvhF/GUz7
	LrC9RNQOw9mgNFNEMUoljcYNTCEdzPSjoxmyx3XCAkqMwv2hQUQwMR1R/6SQ9qSYQaI1W+ygAA2
	nLeHvVfz9rkOXfF09AhkXHadjUM3KorLrsZ3OmBP8XGyWD0yyc+llVO3ECfinzHlGpfAEY+MMRO
	rJtJNNRbLEe/P/bvi/OK6xL4EwcNhQrWNKg=
X-Google-Smtp-Source: AGHT+IG7z/Fh6NDk1TqKo00mbOQAjB81fHSKqdVADw//P121W6LLzlsrt95W3VRLrdaxmtYCSrLJ8w==
X-Received: by 2002:a05:6402:2743:b0:5d0:ca51:e859 with SMTP id 4fb4d7f45d1cf-5d10cb82696mr6854675a12.27.1733341750559;
        Wed, 04 Dec 2024 11:49:10 -0800 (PST)
Received: from ukaszb-ng.c.googlers.com.com (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996df797sm775338166b.68.2024.12.04.11.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 11:49:09 -0800 (PST)
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
Subject: [PATCH v10 1/2] platform/chrome: Update ChromeOS EC header for UCSI
Date: Wed,  4 Dec 2024 19:48:59 +0000
Message-ID: <20241204194900.371696-2-ukaszb@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241204194900.371696-1-ukaszb@chromium.org>
References: <20241204194900.371696-1-ukaszb@chromium.org>
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

