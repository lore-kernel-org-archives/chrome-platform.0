Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6E5246777
	for <chrome-platform@lists.linux.dev>; Mon,  4 Aug 2025 09:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298285; cv=none; b=MiWoI+iTx9qwt3+B8fpK9hb8EWFfv6B9Ve5+1ozIQ/kk1/cB8+c+JRi50GTna00b5/B2LNFfR7izLq3gH3BI3//5opa596Je0NCjgvAiI1Bceel9/aktc882qkvKIut204PKl5Df2oeV4O8lHrt5pocfA26x5lgRqWjgYRx8bBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298285; c=relaxed/simple;
	bh=tkjolWLEFTX+OjQUDiavG2ySNkEp4jtu1RA/RK1P54M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BTRBkNbvjqxJlz3vD1uwWlYervkfOYjnIx5OSzHjFcyrUWx3tUvgmcBrSivFL4vyv4A9Tl8lYldQp+/f1Aq6wPXOFZFIH1UxXXrWyjaSwtfMg08IxPOorJGhUAjdyMkcxKJTFV2h921PBKwUfeF5FJUzuxNuhtOVBON5dmXLHFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MsfsMqG8; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MsfsMqG8"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-61576e33ce9so7614425a12.1
        for <chrome-platform@lists.linux.dev>; Mon, 04 Aug 2025 02:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754298282; x=1754903082; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acPLPksJ6hNGFtXGEUrlTi9y16bOXH39niwzv4irAiQ=;
        b=MsfsMqG8PL7a5hHxDoOiBIWjzhLfWb4Jvg4wBqhEt79J7if83l+1SCrtg5VRzOhG77
         YNbZo3DlNqUS3fq3didAtzI/u8d9kx2chQvQ2hON4Mqp1uS/E4l4RoKQ5POJthDdyFwa
         ZcZpBKsDdNs1hXr0TEg5aEXXRgrcm3ZZmycJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754298282; x=1754903082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=acPLPksJ6hNGFtXGEUrlTi9y16bOXH39niwzv4irAiQ=;
        b=LobuPY/GuwylYZjlPoifWOxQK9b49mqWRqBctP1+MXyJJPXvibkxex+l87l9c7+PYg
         ALy2OIBJ+SiV7Mz56huM6Z6gjPOeumLZV7L+WuXfIu05WUl9zTapDZOj/3GTnT5zoE0P
         ZxF0I0NRYe0VVsHI/iPoARjw+cVgc3mYoPk0q6Afjv6jB6eF3yj6BHYkhBDchjyn3dBr
         wSe1n9dxEqVaoT0/7jsAvA3yVGE1bnblWsh4GEF4TzKYBwkROQefxm99n+xO9rJxgy9d
         Da6bR3+P6Pfe5tcFlLQZ27Zf/g1z3IbG6ZBhOLhSQlIOqQM70b0mCkg73D7ZlBhhGQh/
         G5VA==
X-Forwarded-Encrypted: i=1; AJvYcCV2uluhxZ3YCLT2Y32G6FbcaFw/7V5m7pZmYj/kypYgnVT89hwc5Tucwbyf9DNRq/RHvegVbLbWqK+KFBeG3Rc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzl/5QfNnrCOdkfyKhfUxxIoisswnhR4qz4eMg6rCpfCNKZRST+
	VLj5XRJp0Ht5KfufapTTcOpAN4fM1yu6YaAPKGblgC3pt/w0PSypGEMnHThpiNGHdw==
X-Gm-Gg: ASbGncsmZ3EIwJnVqbZgLdeVy1pVFy0F73s7QkK8FPRXZhlQxXrk7e+Mr8XPvYNQR3S
	2oFrHeCkAyIjDwCIq4tckw75utd3+zK4fKl9krpHL8lb5918Ey/dAn2USGFWCMwl7HrBN7E/cR/
	kxSHFewfkrZLUEPQNvX9Wq7+e5Plfp2rdO2wR2f+RpF1VSKnLIP8ZNswBWEokIH7b4zFYzt7yCA
	wK4g1fMGoj2wTE+2AGxNs9rR1J18ty/5wqmPTWlniAMT3Oep5JfYJ7ARYiyDU3Lb0diINrDL83N
	68cw1kpPsfTc1yjSaodsexSXZw+3FUW3VqDGAnzUyZJcMp6FLyWs3IRPxrRQb5jFdAf8UHAe5Ab
	4k9AfQMVP5t+9uW3Zq8GrRMyWnzm69QZ1yDz9+UcHTi1RCODVwM6bk6dBmdbElG+GBT2kjAATTB
	P+ZxSDRJflGGTmXwY=
X-Google-Smtp-Source: AGHT+IGBrFrtKrp8IAVwQW4QJ7evIiRgZVahLOGnZ/LOmxojYWUqcdIWg8WDD4PI3iYTDOroj7yh0g==
X-Received: by 2002:a05:6402:381b:b0:615:9247:e2fa with SMTP id 4fb4d7f45d1cf-615ae1c4112mr14025240a12.8.1754298281722;
        Mon, 04 Aug 2025 02:04:41 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe7995sm6412790a12.36.2025.08.04.02.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 02:04:41 -0700 (PDT)
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
Subject: [PATCH v3 08/10] platform/chrome: cros_ec_typec: Propagate altmode entry result
Date: Mon,  4 Aug 2025 09:03:37 +0000
Message-ID: <20250804090340.3062182-9-akuchynski@chromium.org>
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
 include/linux/usb/typec_dp.h                 |  2 ++
 4 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 99f549263c37..73aa25433a50 100644
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
index 557340b53af0..7ee295cf0c02 100644
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
+		adata->vdo_size = 1;
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
+	adata->vdo_size = 1;
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
diff --git a/include/linux/usb/typec_dp.h b/include/linux/usb/typec_dp.h
index acb0ad03bdac..c9fa68cd1265 100644
--- a/include/linux/usb/typec_dp.h
+++ b/include/linux/usb/typec_dp.h
@@ -44,10 +44,12 @@ enum {
  * commands: Status Update and Configure.
  *
  * @status will show for example the status of the HPD signal.
+ * @error will contain the error code, if applicable.
  */
 struct typec_displayport_data {
 	u32 status;
 	u32 conf;
+	int error;
 };
 
 enum {
-- 
2.50.1.565.gc32cd1483b-goog

