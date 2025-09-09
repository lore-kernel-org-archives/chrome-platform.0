Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991C733CEA1
	for <chrome-platform@lists.linux.dev>; Tue,  9 Sep 2025 12:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757421057; cv=none; b=a47yIEvAAtTrPOA1ToBe9mq4VynMddV2O2QKwQa21YVFPF2xnEk7NNSYQgGzPoNfyyktzG2uA+wxS25/bh5jEsbZi+MKrCb9ZQ6YUbhKJ5pvZpVclxrTMhDcL2Z9aJO0M5D30p6e4w7RK7V8qkpneIinCi447WB4P3IKVvphURg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757421057; c=relaxed/simple;
	bh=gg5T3nQ5VEwTdUPyYWVvxapRzmVgBSdtJ8K+4Q49glA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C/A9rJSWeFKtsKzpWrUE+xuC0Nv7r0hOZxyTu+6fWX9iy7nuvNEOPARbNP9XV3Ita1cd3wApDvwVzZE5OLXpszhLo61S1sNN60MlCJ0gifa0KAKl3EjFkoNz5yk5tanAelCKULx7TRlEgjFpd+QyyqXsS5gcnv4zwT2w9RZLSFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HZGr0dEx; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HZGr0dEx"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb7322da8so1046527266b.0
        for <chrome-platform@lists.linux.dev>; Tue, 09 Sep 2025 05:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757421054; x=1758025854; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNT/Kw+T/4QMdMG2OTf9bXi1NzKMHFpMs7iCOhh/C34=;
        b=HZGr0dExaJNuRrze0JCdNgzGsspbRXC+FmIZAlo9vortPijSJXCBklOnyc0sq1UziU
         Fc6w8q0TTQMzyoHD1JD6cXoAcwVSZPUFe6EEAhZhWt5ogPQNEg4Q/Vg22s1SEMMoaLxW
         iL7vai7ir7Dq3M6G4jxgYNuWZN8jA+MfTI228=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757421054; x=1758025854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RNT/Kw+T/4QMdMG2OTf9bXi1NzKMHFpMs7iCOhh/C34=;
        b=JwnscTvjX33YfMTtUczNGu0zdzgQh8k2A7gG8Zxfpr3deC2Yvib7MpAg5Kg+rqs8w3
         IwodCrwu7pLpUJUyf3j1zmQjJZJvZqL4myc5JIUHYx7UuJY1mLzFCxq+4vppF0f126CQ
         Tmqd/uxvnHMs/JbNLizpqV8kxBIWwXcoFBzNryHIxmO5Q4OYx6jdXwFPd//8tENnVHy9
         41QnqWyeFyOuwiEDGIZFdt7Tc7Ul73Poh1GSqBR9dk4apLhfIfyd++yN8rnyhHoGcbDQ
         jbFczE4cV4qMqFq3x56HvvxEf+QS3rw3fPZRpZTR8VxF7RBYdcKrADj7Ui+hOwZW6aBj
         oFeg==
X-Forwarded-Encrypted: i=1; AJvYcCXcIpIFzSw7wfuStN90ueDHWUjzLXGHpQulkYdiLYl9LSPUG5Q9cew+PIE/kUSgb7UOad6KqYgYENaQp/B+Z80=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAnNnC3ETzjR5C+M/4VqprAkJ6wRwBlyM8w1aSULaLlpMrOD+m
	XBKQCy0obFdBF7CK6jUBsiR8teRCia9AItAfHm+VMxoAjRITYAq0ZACw4V/v3JDv8g==
X-Gm-Gg: ASbGncviSciGNiEwEo64kS7a7WNbS4co9e0WfrOmvCgkk9CXgsuNdoe3mScrBbTgKvM
	yAwh9CwQkV1Dq9wrxBcSaBgnReTnXexpcKY2OEE6uAn5Ql1hK+ysdzbnwre7Uu/+WNvG+PHco/j
	SnUkfnbu0/3+dLQnVDNMj3GmPmB0I3LNjxxgm82fGyk0Y5Ef5YXQB1i9yrR7E2GQfkiJV6Du/RY
	KN1MHpNMGmEnO/OPdmoWfL9+IsU4PJbbhfd6urBQMP9COsPV8c9AyBdcHIOKLTqW9R8gb4iZTWQ
	7W2OUA+jqOaIhY8afCR0SpZAaB00qBFqNoWO3pDVqanL2Tiq2bFUqKXLQv5An7utUZvG+4hrR7A
	v0U0xqnE5FtKtT77c4KksNrWn/ZJErXWyQVR1gb2p+VmiaLnbQ9aftbT42Eli7XpVPUb6M8ftFL
	a2ZlO9ad6cVPnQCtFYz76in/PFkg==
X-Google-Smtp-Source: AGHT+IFl1zU3QtNbYbaVd7tuOLAD+b+6Y5jT0xWKmoM/3PaJcYRD7JjPcvpNTsrUunsVw5t/BWWYbA==
X-Received: by 2002:a17:907:6d0d:b0:ae3:8c9b:bd61 with SMTP id a640c23a62f3a-b04b13fb3d7mr1122786466b.12.1757421053733;
        Tue, 09 Sep 2025 05:30:53 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b01902d0e99sm2409702166b.12.2025.09.09.05.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:30:53 -0700 (PDT)
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
Subject: [PATCH RFC 5/5] platform/chrome: cros_ec_typec: Propagate altmode entry result
Date: Tue,  9 Sep 2025 12:30:28 +0000
Message-ID: <20250909123028.2127449-6-akuchynski@chromium.org>
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

In the `cros_typec_configure_mux` function, which concludes the DP/TBT
alternate mode entry, the error code should be reported back to the Type-C
mode selection logic. This ensures a detailed result is conveyed to user
space. To inform partner drivers about the result, the VDM mechanism is
used: DP_CMD_STATUS_UPDATE for DP altmode and TBT_CMD_STATUS_UPDATE for
TBT altmode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c      |  9 ++++++
 drivers/platform/chrome/cros_typec_altmode.c | 32 ++++++++++++++++++--
 drivers/platform/chrome/cros_typec_altmode.h |  6 ++++
 3 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index c0806c562bb9..18e627c9fc22 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -693,6 +693,7 @@ static int cros_typec_enable_dp(struct cros_typec_data *typec,
 	if (!ret)
 		ret = typec_mux_set(port->mux, &port->state);
 
+	dp_data.error = 0;
 	if (!ret)
 		ret = cros_typec_displayport_status_update(port->state.alt,
 							   port->state.data);
@@ -782,8 +783,16 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 		ret = cros_typec_enable_usb4(typec, port_num, pd_ctrl);
 	} else if (port->mux_flags & USB_PD_MUX_TBT_COMPAT_ENABLED) {
 		ret = cros_typec_enable_tbt(typec, port_num, pd_ctrl);
+		cros_typec_tbt_status_update(
+			port->port_altmode[CROS_EC_ALTMODE_TBT], ret);
 	} else if (port->mux_flags & USB_PD_MUX_DP_ENABLED) {
 		ret = cros_typec_enable_dp(typec, port_num, pd_ctrl);
+		if (ret) {
+			struct typec_displayport_data dp_data = {.error = ret};
+
+			cros_typec_displayport_status_update(
+				port->port_altmode[CROS_EC_ALTMODE_DP], &dp_data);
+		}
 	} else if (port->mux_flags & USB_PD_MUX_SAFE_MODE) {
 		ret = cros_typec_usb_safe_state(port);
 	} else if (port->mux_flags & USB_PD_MUX_USB_ENABLED) {
diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
index 557340b53af0..75c7e6af1320 100644
--- a/drivers/platform/chrome/cros_typec_altmode.c
+++ b/drivers/platform/chrome/cros_typec_altmode.c
@@ -28,6 +28,7 @@ struct cros_typec_altmode_data {
 
 	u16 sid;
 	u8 mode;
+	int error;
 };
 
 struct cros_typec_dp_data {
@@ -295,9 +296,16 @@ int cros_typec_displayport_status_update(struct typec_altmode *altmode,
 
 	dp_data->data = *data;
 	dp_data->pending_status_update = false;
-	adata->header |= VDO_CMDT(CMDT_RSP_ACK);
-	adata->vdo_data = &dp_data->data.status;
-	adata->vdo_size = 2;
+	if (data->error) {
+		adata->header |= VDO_CMDT(CMDT_RSP_NAK);
+		adata->error = dp_data->data.error;
+		adata->vdo_data = &adata->error;
+		adata->vdo_size = 2;
+	} else {
+		adata->header |= VDO_CMDT(CMDT_RSP_ACK);
+		adata->vdo_data = &dp_data->data.status;
+		adata->vdo_size = 2;
+	}
 	schedule_work(&adata->work);
 
 	mutex_unlock(&adata->lock);
@@ -370,4 +378,22 @@ cros_typec_register_thunderbolt(struct cros_typec_port *port,
 
 	return alt;
 }
+
+int cros_typec_tbt_status_update(struct typec_altmode *alt, int error)
+{
+	struct cros_typec_altmode_data *adata = typec_altmode_get_drvdata(alt);
+
+	mutex_lock(&adata->lock);
+
+	adata->header = VDO(adata->sid, 1, SVDM_VER_2_0, TBT_CMD_STATUS_UPDATE);
+	adata->header |= VDO_CMDT(error ? CMDT_RSP_NAK : CMDT_RSP_ACK);
+	adata->error = error;
+	adata->vdo_data = &adata->error;
+	adata->vdo_size = 2;
+	schedule_work(&adata->work);
+
+	mutex_unlock(&adata->lock);
+
+	return 0;
+}
 #endif
diff --git a/drivers/platform/chrome/cros_typec_altmode.h b/drivers/platform/chrome/cros_typec_altmode.h
index 3f2aa95d065a..848a2b194b34 100644
--- a/drivers/platform/chrome/cros_typec_altmode.h
+++ b/drivers/platform/chrome/cros_typec_altmode.h
@@ -39,6 +39,7 @@ static inline int cros_typec_displayport_status_update(struct typec_altmode *alt
 struct typec_altmode *
 cros_typec_register_thunderbolt(struct cros_typec_port *port,
 				struct typec_altmode_desc *desc);
+int cros_typec_tbt_status_update(struct typec_altmode *alt, int error);
 #else
 static inline struct typec_altmode *
 cros_typec_register_thunderbolt(struct cros_typec_port *port,
@@ -46,6 +47,11 @@ cros_typec_register_thunderbolt(struct cros_typec_port *port,
 {
 	return typec_port_register_altmode(port->port, desc);
 }
+static inline int cros_typec_tbt_status_update(struct typec_altmode *alt,
+					int error)
+{
+	return 0;
+}
 #endif
 
 #endif /* __CROS_TYPEC_ALTMODE_H__ */
-- 
2.51.0.384.g4c02a37b29-goog

